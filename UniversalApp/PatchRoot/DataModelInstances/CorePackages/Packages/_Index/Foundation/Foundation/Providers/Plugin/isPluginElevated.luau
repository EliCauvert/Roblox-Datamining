return function(p1)
	return pcall(function()
		-- upvalues: p1 (ref)
		return p1:GetPluginComponent("Panels")
	end)
end