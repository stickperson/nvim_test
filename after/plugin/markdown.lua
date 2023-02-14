local checks = vim.treesitter.parse_query(
  "markdown",
  [[
  (task_list_marker_unchecked) @unchecked
  (task_list_marker_checked) @checked
  ]]
)

local get_root = function(bufnr)
  local parser = vim.treesitter.get_parser(bufnr, "markdown", {})
  local tree = parser:parse()[1]
  return tree:root()
end

local toggle = function(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  local root = get_root(bufnr)
  local current_line_idx = vim.api.nvim_win_get_cursor(0)[1] - 1
  for id, node in checks:iter_captures(root, bufnr, 0, -1) do
    local range = { node:range() }
    local start_line = range[1]
    if start_line == current_line_idx then
      local name = checks.captures[id]
      local current_line = vim.api.nvim_get_current_line()
      vim.pretty_print(current_line)
      local new_string = ""
      if name == "unchecked" then
        new_string = string.gsub(current_line, "%[ %]", "%[x%]")
      else
        new_string = string.gsub(current_line, "%[x%]", "%[ %]")
      end
      vim.api.nvim_buf_set_lines(bufnr, start_line, start_line + 1, false, { new_string })
    end
  end
end

vim.api.nvim_create_user_command("ToggleListItem", function()
  toggle()
end, {})
