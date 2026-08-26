local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local parent = avatarExperienceCommon.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useIsSpatial = require(parent.Responsive).useIsSpatial
local useEarlyIsFocused = require(parent.Navigation).useEarlyIsFocused
local signalsReactModule = require(parent.SignalsReact)
local AXTooltipStoreModule = require(avatarExperienceCommon.Stores.AXTooltipStore)
local AXTooltipTimeToDismiss = game:DefineFastInt("AXTooltipTimeToDismiss", 5)
local _ = require(parent.AvatarExperienceUIKit)

return function(p1)
	-- upvalues: AXTooltipStoreModule (ref), useLocalization (ref), useIsSpatial (ref), useEarlyIsFocused (ref), signalsReactModule (ref), reactModule (ref), AXTooltipTimeToDismiss (ref)
	local var1 = AXTooltipStoreModule(false)
	local localizedText = p1.localizedText or useLocalization({ tooltipText = p1.tooltipLocalizationKey }).tooltipText
	local var2 = p1.showTooltip and (signalsReactModule.useSignalState(var1.getIsTooltipAllowedToBeShown(p1.tooltipStorageKey)) and (useEarlyIsFocused() and not useIsSpatial()))
	local var3 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), p1 (ref)
		var1.dismissTooltip(p1.tooltipStorageKey)
	end, { p1.tooltipStorageKey })
	
	if p1.dismissTooltipRef and p1.showTooltip then
		p1.dismissTooltipRef.current = var3
	end
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), AXTooltipTimeToDismiss (copy), var1 (ref), p1 (ref)
		if var2 then
			task.spawn(function()
				-- upvalues: AXTooltipTimeToDismiss (copy), var1 (copy), p1 (copy)
				task.wait(AXTooltipTimeToDismiss)
				var1.dismissTooltip(p1.tooltipStorageKey, true)
			end)
		end
	end, { var2 })
	
	return {
		isOpen = var2,
		popoverSide = p1.popoverSide,
		tooltipText = localizedText,
		onTooltipActivated = var3
	}
end