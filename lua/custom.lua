-- Function to check if a directory exists
local function directory_exists(path)
  local ok, err, code = os.rename(path, path)
  if not ok then
    if code == 13 then
      -- Permission denied, but the directory exists
      return true
    end
  end
  return ok, err
end

-- Function to check if a file exists
local function file_exists(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

-- Function to perform the desired actions
local function copy_and_paste()
  -- 1. Copy the selected portion
  vim.api.nvim_command("normal! gvy")
  local text = vim.fn.getreg("")

  -- 2. Check if the specific folder exists
  local folder_path = "/media/shared"
  if not directory_exists(folder_path) then
    vim.notify("Directory does not exist: " .. folder_path, vim.log.levels.ERROR)
    return
  end

  -- 3. Check if the file exists, create it if it doesn't
  local file_path = folder_path .. "/clipboard.txt"
  if not file_exists(file_path) then
    local file = io.open(file_path, "w")
    file:close()
    vim.notify("File created: " .. file_path, vim.log.levels.INFO)
  end

  -- vim.api.nvim_command("normal! gv\"*y")
  -- local text = vim.fn.getreg("*")

  vim.api.nvim_command("normal! gvy")
  local text = vim.fn.getreg("")

  local file = io.open(file_path, "w")
  file:write(text)
  file:close()

end

-- Set the keymap in visual mode
-- vim.keymap.set("v", "<leader>ctp", copy_and_paste, { noremap = true })


vim.keymap.set("v", "<leader>ctp", function()
  vim.api.nvim_command("normal! gvy")
  copy_and_paste()
end, { noremap = true })
