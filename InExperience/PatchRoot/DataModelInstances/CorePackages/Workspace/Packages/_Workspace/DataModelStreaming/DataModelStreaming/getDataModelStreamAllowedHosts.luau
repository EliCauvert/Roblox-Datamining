game:DefineFastFlag("LuaAppEnableDataModelStreamForConsoles", false)

return function() --[[ line: 3 | named "getDataModelStreamAllowedHosts" ]]
	local list = { "ws://localhost:5051", "ws://10.0.2.2:5051" }
	
	if game:GetFastFlag("LuaAppEnableDataModelStreamForConsoles") then
		table.insert(list, "ws://10.110.101.185:5051")
	end
	return list
end