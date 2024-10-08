local function process_index()
	local lines_count = 0
	local index_lines = vim.api.nvim_exec2([["help index"]], { output = true })
	-- check if index_lines is not nil
	if index_lines == nil then
		print("Error: index_lines is nil")
		return 0
	elseif #index_lines == 0 then
		print("index_lines is empty")
		return 0
	else
		print("index_lines is not nil")
		return #index_lines
	end
end

process_index()
