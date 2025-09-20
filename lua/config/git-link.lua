local M = {}

function M.open_git_url()
  local handle = io.popen("git rev-parse --show-toplevel 2>/dev/null")
  if not handle then
    vim.notify("Not inside a git repo", vim.log.levels.ERROR)
    return
  end
  local git_root = handle:read("*l")
  handle:close()

  local f = io.open(git_root .. "/.git/config", "r")
  if not f then
    vim.notify("Could not open .git/config", vim.log.levels.ERROR)
    return
  end

  local url
  for line in f:lines() do
    local match = line:match("url%s*=%s*(%S+)")
    if match then
      url = match
      break
    end
  end
  f:close()

  if not url then
    vim.notify("No URL found in .git/config", vim.log.levels.ERROR)
    return
  end

  vim.notify("Opening: " .. url, vim.log.levels.INFO)
  os.execute("xdg-open " .. url .. " &")
end

vim.api.nvim_create_user_command("OpenGitUrl", M.open_git_url, {})

return M
