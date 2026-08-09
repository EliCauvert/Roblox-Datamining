local foundation = script:FindFirstAncestor("Foundation")
local flagsModule = require(foundation.Utility.Flags)
local wrappersModule = require(foundation.Utility.Wrappers)

return function() --[[ line: 5 | named "isPluginSecurity" ]]
	-- upvalues: wrappersModule (ref), flagsModule (ref)
	local status
	local coreGui = wrappersModule.Services.CoreGui
	
	if flagsModule.FoundationPopoverPluginSecurityGate then
		ok, status = pcall(function() --[[ line: 9 ]]
			-- upvalues: coreGui (ref)
			local _ = coreGui:GetChildren()
		end)
		
		return ok
	end
	ok, status = pcall(function() --[[ line: 16 ]]
		-- upvalues: coreGui (ref)
		local _ = coreGui.Name
	end)
	
	return ok
end