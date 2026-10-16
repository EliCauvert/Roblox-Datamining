local DEV = _G.__DEV__

return function(Index, Index1): boolean --[[ Line: 20 | Named "instanceof" ]]
	-- upvalues: DEV (copy)
	if DEV then
		assert(typeof(Index1) == "table", "Received a non-table as the second argument for instanceof")
	end
	if typeof(Index) ~= "table" then
		return false
	end
	local Success, Result = pcall(function(): boolean --[[ Line: 29 ]]
		-- upvalues: Index1 (copy), Index (ref)
		return Index1.new ~= nil and Index.new == Index1.new
	end)
	
	if Success and Result then
		return true
	end
	local config = { [Index] = true }
	while Index and typeof(Index) == "table" do
		Index = getmetatable(Index)
		
		if typeof(Index) == "table" then
			Index = Index.__index
			
			if Index == Index1 then
				return true
			end
		end
		if typeof(Index) ~= "table" then continue end
		if config[Index] then
			return false
		end
		config[Index] = true
	end
	return false
end