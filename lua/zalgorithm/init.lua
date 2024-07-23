local M = {}

function M.run_go_script()
	vim.notify("Executing run_go script")
	local file = vim.fn.expand("%:p")
	local file_extension = vim.fn.expand("%:e")
	if file_extension ~= "md" then
		vim.notify("Command only works for markdown files", vim.log.levels.WARN)
		return
	end

	local command = "go run -modfile=/home/scossar/projects/golang/zalgorithm_db/go.mod  /home/scossar/projects/golang/zalgorithm_db/main.go "
		.. file
	vim.notify("Executing command: " .. command, vim.log.levels.INFO)
	os.execute(command)
end

vim.api.nvim_create_user_command("Zalgorithm", M.run_go_script, {})

return M
