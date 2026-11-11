local Foundation = script:FindFirstAncestor("Foundation")
local FlagsModule = require(Foundation.Utility.Flags)
local WrappersModule = require(Foundation.Utility.Wrappers)

return function()
	-- upvalues: WrappersModule (copy), FlagsModule (copy)
	local CoreGui = WrappersModule.Services.CoreGui
	
	if FlagsModule.FoundationPopoverPluginSecurityGate then
		local Success, _ = pcall(function()
			-- upvalues: CoreGui (copy)
			local _ = CoreGui:GetChildren()
		end)
		
		return Success
	else
		local Success1, _ = pcall(function()
			-- upvalues: CoreGui (copy)
			local _ = CoreGui.Name
		end)
		
		return Success1
	end
end