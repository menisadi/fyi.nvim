local output_file = "nvim_key_bindings.csv"
local file = io.open(output_file, "w")
file:write("Command,Mode,Description\n")

-- Function to process the help index
local function process_index()
	local lines_count = 0
	local index_lines = vim.api.nvim_exec2([["help index"]], { output = true })
	-- check if index_lines is not nil
	if index_lines == nil then
		print("Error: index_lines is nil")
		return
	elseif #index_lines == 0 then
		print("index_lines is empty")
		return
	else
		print("index_lines is not nil")
	end
	for line in index_lines:gmatch("[^\r\n]+") do
		print(line)
		-- Extract key binding, mode, and description using patterns
		local cmd, mode, desc = line:match("^([^%s]+)%s+([^%s]+)%s+(.-)$")
		if cmd and mode and desc then
			-- Write each line to the CSV
			file:write(string.format("%s,%s,%s\n", cmd, mode, desc))
		end
	end

	print("Wrote " .. lines_count .. " lines to " .. output_file)
end

process_index()
file:close()
print("NeoVim key bindings saved to " .. output_file)
