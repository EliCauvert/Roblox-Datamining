local WrappersModule = require(script:FindFirstAncestor("Foundation").Utility.Wrappers)

return function()
	-- upvalues: WrappersModule (copy)
	local CoreGui = WrappersModule.Services.CoreGui
	local Success, _ = pcall(function()
		-- upvalues: CoreGui (copy)
		local _ = CoreGui:GetChildren()
	end)
	
	return Success
end