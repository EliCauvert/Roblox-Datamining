local wrappersModule = require(script:FindFirstAncestor("Foundation").Utility.Wrappers)

return function() --[[ line: 4 | named "isPluginSecurity" ]]
	-- upvalues: wrappersModule (ref)
	local coreGui = wrappersModule.Services.CoreGui
	local ok, _ = pcall(function() --[[ line: 6 ]]
		-- upvalues: coreGui (ref)
		local _ = coreGui:GetChildren()
	end)
	
	return ok
end