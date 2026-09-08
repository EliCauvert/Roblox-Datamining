local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
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

return reactModule.memo(function(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), getAssistantBuildStoreModule (ref), getPlayButtonStoreModule (ref), signalsReactModule (ref), reactModule (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref), iconButton (ref), iconName (ref), inputSize (ref), view (ref), educationalTooltip (ref), popoverAlign (ref), popoverSide (ref)
	local var1 = useLocalization({
		disabledTitle = localizationStringsModule.CHAT_ASSISTANT_DISABLED,
		portraitRequired = localizationStringsModule.CHAT_PORTRAIT_REQUIRED
	})
	local var2 = getAssistantBuildStoreModule()
	local var3 = getPlayButtonStoreModule()
	local var4 = signalsReactModule.useSignalState(var2.getIsDisabled)
	local var5 = signalsReactModule.useSignalState(var2.getIsDisabledTooltipOpen)
	local var6 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), var2 (ref), var5 (ref), var3 (ref)
		if var4 then
			var2.setIsDisabledTooltipOpen(not var5)
			
			return
		end
		var2.setIsDisabledTooltipOpen(false)
		var3.setIsActive(true)
	end, { var2, var4, var5, var3 })
	local var7 = if fFlagBuildExperienceTooltipsLightDismissModule then reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		var2.setIsDisabledTooltipOpen(false)
	end, { var2 }) else nil
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var3 (ref), var2 (ref)
		if var4 then
			var3.setIsActive(false)
			
			return
		end
		var2.setIsDisabledTooltipOpen(false)
	end, { var2, var4, var3 })
	local var8 = reactModule.createElement(iconButton, {
		isCircular = true,
		testId = "build-header-play-button",
		icon = iconName.Nebula,
		variant = p1.variant,
		size = inputSize.Medium,
		isDisabled = var4,
		onActivated = var6
	})
	
	return reactModule.createElement(view, {
		tag = "auto-xy",
		LayoutOrder = p1.layoutOrder,
		testId = p1.testId or "assistant-build"
	}, {
		Tooltip = if var4 then reactModule.createElement(educationalTooltip, {
			testId = "build-assistant-disabled-tooltip",
			align = popoverAlign.Start,
			isOpen = var5,
			onPressedOutside = var7,
			side = popoverSide.Bottom,
			text = var1.portraitRequired,
			title = var1.disabledTitle
		}, {
			Button = reactModule.createElement(view, {
				tag = "auto-xy",
				testId = "build-header-play-button-disabled",
				onActivated = var6
			}, { Button = var8 })
		}) else nil,
		Button = if not var4 then var8 else nil
	})
end)