local signalsModule = require(script:FindFirstAncestor("ProfilePlatform").Parent.Signals)
local inspectAvatarTooltipImpressionCacheModule = require(script.Parent.InspectAvatarTooltipImpressionCache)
local profilePlatformInspectAvatarTooltipMaxImpressions = game:DefineFastInt("ProfilePlatformInspectAvatarTooltipMaxImpressions", 3)

return function()
	-- upvalues: signalsModule (ref), inspectAvatarTooltipImpressionCacheModule (ref), profilePlatformInspectAvatarTooltipMaxImpressions (ref)
	local var3, var4 = signalsModule.createSignal(false)
	
	return {
		getIsOpen = var3,
		tryShow = function()
			-- upvalues: inspectAvatarTooltipImpressionCacheModule (copy), profilePlatformInspectAvatarTooltipMaxImpressions (copy), var4 (ref)
			local value = inspectAvatarTooltipImpressionCacheModule.getValue()
			
			if value < 0 or profilePlatformInspectAvatarTooltipMaxImpressions <= value then
				var4(false)
				
				return
			end
			inspectAvatarTooltipImpressionCacheModule.incrementValue()
			var4(true)
		end,
		hide = function()
			-- upvalues: var4 (ref)
			var4(false)
		end,
		permanentlyDismiss = function()
			-- upvalues: inspectAvatarTooltipImpressionCacheModule (copy), var4 (ref)
			inspectAvatarTooltipImpressionCacheModule.dismissValue()
			var4(false)
		end
	}
end