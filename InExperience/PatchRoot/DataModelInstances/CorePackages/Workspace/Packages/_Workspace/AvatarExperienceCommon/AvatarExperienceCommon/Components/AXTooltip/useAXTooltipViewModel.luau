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

return function(p0) --[[ line: 36 | named "useAXTooltipViewModel" ]]
	-- upvalues: AXTooltipStoreModule (ref), useLocalization (ref), useIsSpatial (ref), useEarlyIsFocused (ref), signalsReactModule (ref), reactModule (ref), AXTooltipTimeToDismiss (ref)
	local var5 = AXTooltipStoreModule(false)
	local localizedText = p0.localizedText or useLocalization({ tooltipText = p0.tooltipLocalizationKey }).tooltipText
	local var7 = p0.showTooltip and (signalsReactModule.useSignalState(var5.getIsTooltipAllowedToBeShown(p0.tooltipStorageKey)) and (useEarlyIsFocused() and not useIsSpatial()))
	local var8 = reactModule.useCallback(function() --[[ line: 49 ]]
		-- upvalues: var5 (ref), p0 (ref)
		var5.dismissTooltip(p0.tooltipStorageKey)
	end, { p0.tooltipStorageKey })
	
	if p0.dismissTooltipRef and p0.showTooltip then
		p0.dismissTooltipRef.current = var8
	end
	reactModule.useEffect(function() --[[ line: 57 ]]
		-- upvalues: var7 (ref), AXTooltipTimeToDismiss (copy), var5 (ref), p0 (ref)
		if var7 then
			task.spawn(function() --[[ line: 59 ]]
				-- upvalues: AXTooltipTimeToDismiss (copy), var5 (copy), p0 (copy)
				task.wait(AXTooltipTimeToDismiss)
				var5.dismissTooltip(p0.tooltipStorageKey, true)
			end)
		end
	end, { var7 })
	
	return {
		isOpen = var7,
		popoverSide = p0.popoverSide,
		tooltipText = localizedText,
		onTooltipActivated = var8
	}
end