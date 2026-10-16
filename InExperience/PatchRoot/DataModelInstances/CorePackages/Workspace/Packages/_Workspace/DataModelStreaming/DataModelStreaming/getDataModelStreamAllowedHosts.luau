game:DefineFastFlag("LuaAppEnableDataModelStreamForConsoles", false)

return function() --[[ Line: 3 | Named "getDataModelStreamAllowedHosts" ]]
	local List = { "ws://localhost:5051", "ws://10.0.2.2:5051" }
	
	if game:GetFastFlag("LuaAppEnableDataModelStreamForConsoles") then
		table.insert(List, "ws://10.110.101.185:5051")
	end
	return List
end