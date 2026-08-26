local signalsModule = require(script:FindFirstAncestor("ProfilePlatform").Parent.Signals)
local inspectAvatarTooltipImpressionCacheModule = require(script.Parent.InspectAvatarTooltipImpressionCache)
local profilePlatformInspectAvatarTooltipMaxImpressions = game:DefineFastInt("ProfilePlatformInspectAvatarTooltipMaxImpressions", 3)

return function()
	-- upvalues: signalsModule (ref), inspectAvatarTooltipImpressionCacheModule (ref), profilePlatformInspectAvatarTooltipMaxImpressions (ref)
	local var1, var2 = signalsModule.createSignal(false)
	
	return {
		getIsOpen = var1,
		tryShow = function()
			-- upvalues: inspectAvatarTooltipImpressionCacheModule (copy), profilePlatformInspectAvatarTooltipMaxImpressions (copy), var2 (ref)
			local value = inspectAvatarTooltipImpressionCacheModule.getValue()
			
			if value < 0 or profilePlatformInspectAvatarTooltipMaxImpressions <= value then
				var2(false)
				
				return
			end
			inspectAvatarTooltipImpressionCacheModule.incrementValue()
			var2(true)
		end,
		hide = function()
			-- upvalues: var2 (ref)
			var2(false)
		end,
		permanentlyDismiss = function()
			-- upvalues: inspectAvatarTooltipImpressionCacheModule (copy), var2 (ref)
			inspectAvatarTooltipImpressionCacheModule.dismissValue()
			var2(false)
		end
	}
end