return function(Plugin)
	return (pcall(function()
		-- upvalues: Plugin (copy)
		return Plugin:GetPluginComponent("Panels")
	end))
end