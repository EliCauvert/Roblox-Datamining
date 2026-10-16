local WrappersModule = require(script:FindFirstAncestor("Foundation").Utility.Wrappers)

return function() --[[ Line: 4 | Named "isPluginSecurity" ]]
	-- upvalues: WrappersModule (copy)
	local CoreGui = WrappersModule.Services.CoreGui
	local Success, _ = pcall(function() --[[ Line: 6 ]]
		-- upvalues: CoreGui (copy)
		local _ = CoreGui:GetChildren()
	end)
	
	return Success
end