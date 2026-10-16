return function(Plugin) --[[ Line: 5 | Named "isPluginElevated" ]]
	return (pcall(function() --[[ Line: 6 ]]
		-- upvalues: Plugin (copy)
		return Plugin:GetPluginComponent("Panels")
	end))
end