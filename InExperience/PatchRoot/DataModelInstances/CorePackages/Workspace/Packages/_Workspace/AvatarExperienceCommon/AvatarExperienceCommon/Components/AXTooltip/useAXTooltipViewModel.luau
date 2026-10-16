local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local Parent = AvatarExperienceCommon.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseIsSpatialFunction = require(Parent.Responsive).useIsSpatial
local UseEarlyIsFocusedFunction = require(Parent.Navigation).useEarlyIsFocused
local SignalsReactModule = require(Parent.SignalsReact)
local AXTooltipStoreModule = require(AvatarExperienceCommon.Stores.AXTooltipStore)
local AXTooltipTimeToDismiss = game:DefineFastInt("AXTooltipTimeToDismiss", 5)
local _ = require(Parent.AvatarExperienceUIKit)

return function(p1) --[[ Line: 36 | Named "useAXTooltipViewModel" ]]
	-- upvalues: AXTooltipStoreModule (copy), UseLocalizationFunction (copy), UseIsSpatialFunction (copy), UseEarlyIsFocusedFunction (copy), SignalsReactModule (copy), ReactModule (copy), AXTooltipTimeToDismiss (copy)
	local AXTooltipStoreModuleResult = AXTooltipStoreModule(false)
	local UseLocalizationResult = UseLocalizationFunction({ tooltipText = p1.tooltipLocalizationKey })
	local LocalizedText = p1.localizedText or UseLocalizationResult.tooltipText
	local UseIsSpatialResult = UseIsSpatialFunction()
	local UseEarlyIsFocusedResult = UseEarlyIsFocusedFunction()
	local UseSignalStateResult = SignalsReactModule.useSignalState(AXTooltipStoreModuleResult.getIsTooltipAllowedToBeShown(p1.tooltipStorageKey))
	local NoUseIsSpatialResult: boolean = p1.showTooltip and (UseSignalStateResult and (UseEarlyIsFocusedResult and not UseIsSpatialResult))
	local UseResult = ReactModule.useCallback(function() --[[ Line: 49 ]]
		-- upvalues: AXTooltipStoreModuleResult (copy), p1 (copy)
		AXTooltipStoreModuleResult.dismissTooltip(p1.tooltipStorageKey)
	end, { p1.tooltipStorageKey })
	
	if p1.dismissTooltipRef and p1.showTooltip then
		p1.dismissTooltipRef.current = UseResult
	end
	ReactModule.useEffect(function() --[[ Line: 57 ]]
		-- upvalues: NoUseIsSpatialResult (copy), AXTooltipTimeToDismiss (upval), AXTooltipStoreModuleResult (copy), p1 (copy)
		if NoUseIsSpatialResult then
			task.spawn(function() --[[ Line: 59 ]]
				-- upvalues: AXTooltipTimeToDismiss (upval), AXTooltipStoreModuleResult (upval), p1 (upval)
				task.wait(AXTooltipTimeToDismiss)
				AXTooltipStoreModuleResult.dismissTooltip(p1.tooltipStorageKey, true)
			end)
		end
	end, { NoUseIsSpatialResult })
	
	return {
		isOpen = NoUseIsSpatialResult,
		popoverSide = p1.popoverSide,
		tooltipText = LocalizedText,
		onTooltipActivated = UseResult
	}
end