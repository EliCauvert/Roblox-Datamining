return function(p0)
	return pcall(function()
		-- upvalues: p0 (ref)
		return p0:GetPluginComponent("Panels")
	end)
end