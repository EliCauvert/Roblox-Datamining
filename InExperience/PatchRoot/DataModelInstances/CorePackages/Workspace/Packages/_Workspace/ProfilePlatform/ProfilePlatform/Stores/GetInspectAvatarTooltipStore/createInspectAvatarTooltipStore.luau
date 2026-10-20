local SignalsModule = require(script:FindFirstAncestor("ProfilePlatform").Parent.Signals)
local InspectAvatarTooltipImpressionCacheModule = require(script.Parent.InspectAvatarTooltipImpressionCache)
local ProfilePlatformInspectAvatarTooltipMaxImpressions = game:DefineFastInt("ProfilePlatformInspectAvatarTooltipMaxImpressions", 3)

return function()
	-- upvalues: SignalsModule (copy), InspectAvatarTooltipImpressionCacheModule (copy), ProfilePlatformInspectAvatarTooltipMaxImpressions (copy)
	local Signal, Signal2 = SignalsModule.createSignal(false)
	
	return {
		getIsOpen = Signal,
		tryShow = function()
			-- upvalues: InspectAvatarTooltipImpressionCacheModule (upval), ProfilePlatformInspectAvatarTooltipMaxImpressions (upval), Signal2 (copy)
			local Value: number = InspectAvatarTooltipImpressionCacheModule.getValue()
			
			if Value < 0 or ProfilePlatformInspectAvatarTooltipMaxImpressions <= Value then
				Signal2(false)
				
				return
			else
				InspectAvatarTooltipImpressionCacheModule.incrementValue()
				Signal2(true)
			end
		end,
		hide = function()
			-- upvalues: Signal2 (copy)
			Signal2(false)
		end,
		permanentlyDismiss = function()
			-- upvalues: InspectAvatarTooltipImpressionCacheModule (upval), Signal2 (copy)
			InspectAvatarTooltipImpressionCacheModule.dismissValue()
			Signal2(false)
		end
	}
end