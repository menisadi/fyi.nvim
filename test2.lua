local function process_index()
	-- Open the help for 'index'
	vim.cmd("help index")

	-- Get the buffer number of the help window
	local buf = vim.api.nvim_get_current_buf()

	-- Get all lines of the buffer
	local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

	-- Check the number of lines and print status
	if lines == nil then
		print("Error: lines is nil")
		return 0
	elseif #lines == 0 then
		print("lines are empty")
		return 0
	else
		print("lines are not nil")
	end

	vim.cmd("close")

	return #lines
end

local result = process_index()
print(result)
