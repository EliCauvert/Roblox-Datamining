return function(p0) --[[ line: 5 | named "isPluginElevated" ]]
	return pcall(function() --[[ line: 6 ]]
		-- upvalues: p0 (ref)
		return p0:GetPluginComponent("Panels")
	end)
end