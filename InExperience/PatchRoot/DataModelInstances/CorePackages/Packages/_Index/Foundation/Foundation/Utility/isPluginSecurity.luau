local wrappersModule = require(script:FindFirstAncestor("Foundation").Utility.Wrappers)

return function()
	-- upvalues: wrappersModule (ref)
	local coreGui = wrappersModule.Services.CoreGui
	local ok, _ = pcall(function()
		-- upvalues: coreGui (ref)
		local _ = coreGui:GetChildren()
	end)
	
	return ok
end