local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local getAssistantBuildStoreModule = require(buildExperience.Stores.GetAssistantBuildStore)
local getPlayButtonStoreModule = require(buildExperience.Stores.GetPlayButtonStore)
local fFlagBuildExperienceTooltipsLightDismissModule = require(buildExperience.Flags.FFlagBuildExperienceTooltipsLightDismiss)
local educationalTooltip = foundationModule.EducationalTooltip
local iconButton = foundationModule.IconButton
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide
local view = foundationModule.View

return reactModule.memo(function(p0)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), getAssistantBuildStoreModule (ref), getPlayButtonStoreModule (ref), signalsReactModule (ref), reactModule (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref), iconButton (ref), iconName (ref), inputSize (ref), view (ref), educationalTooltip (ref), popoverAlign (ref), popoverSide (ref)
	local var9 = if fFlagBuildLocalization then useLocalization({
		disabledTitle = localizationStringsModule.CHAT_ASSISTANT_DISABLED,
		portraitRequired = localizationStringsModule.CHAT_PORTRAIT_REQUIRED
	}) else nil
	local var10 = getAssistantBuildStoreModule()
	local var11 = getPlayButtonStoreModule()
	local var12 = signalsReactModule.useSignalState(var10.getIsDisabled)
	local var13 = signalsReactModule.useSignalState(var10.getIsDisabledTooltipOpen)
	local var14 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), var10 (ref), var13 (ref), var11 (ref)
		if var12 then
			var10.setIsDisabledTooltipOpen(not var13)
			
			return
		end
		var10.setIsDisabledTooltipOpen(false)
		var11.setIsActive(true)
	end, { var10, var12, var13, var11 })
	local var15 = if fFlagBuildExperienceTooltipsLightDismissModule then reactModule.useCallback(function()
		-- upvalues: var10 (ref)
		var10.setIsDisabledTooltipOpen(false)
	end, { var10 }) else nil
	reactModule.useEffect(function()
		-- upvalues: var12 (ref), var11 (ref), var10 (ref)
		if var12 then
			var11.setIsActive(false)
			
			return
		end
		var10.setIsDisabledTooltipOpen(false)
	end, { var10, var12, var11 })
	local var16 = reactModule.createElement(iconButton, {
		isCircular = true,
		testId = "build-header-play-button",
		icon = iconName.Nebula,
		variant = p0.variant,
		size = inputSize.Medium,
		isDisabled = var12,
		onActivated = var14
	})
	
	return reactModule.createElement(view, {
		tag = "auto-xy",
		LayoutOrder = p0.layoutOrder,
		testId = p0.testId or "assistant-build"
	}, {
		Tooltip = if var12 then reactModule.createElement(educationalTooltip, {
			testId = "build-assistant-disabled-tooltip",
			align = popoverAlign.Start,
			isOpen = var13,
			onPressedOutside = var15,
			side = popoverSide.Bottom,
			text = if fFlagBuildLocalization then var9.portraitRequired else localizationStringsModule.CHAT_PORTRAIT_REQUIRED,
			title = if fFlagBuildLocalization then var9.disabledTitle else localizationStringsModule.CHAT_ASSISTANT_DISABLED
		}, {
			Button = reactModule.createElement(view, {
				tag = "auto-xy",
				testId = "build-header-play-button-disabled",
				onActivated = var14
			}, { Button = var16 })
		}) else nil,
		Button = if not var12 then var16 else nil
	})
end)