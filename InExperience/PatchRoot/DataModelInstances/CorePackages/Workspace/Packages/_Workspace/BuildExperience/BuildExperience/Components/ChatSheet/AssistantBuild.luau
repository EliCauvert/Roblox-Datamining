local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FFlagBuildExperienceInGameShell = require(Parent.SharedFlags).FFlagBuildExperienceInGameShell
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local GetAssistantBuildStoreModule = require(BuildExperience.Stores.GetAssistantBuildStore)
local GetPlayButtonStoreModule = require(BuildExperience.Stores.GetPlayButtonStore)
local EducationalTooltip = FoundationModule.EducationalTooltip
local IconButton = FoundationModule.IconButton
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide
local View = FoundationModule.View

return ReactModule.memo(function(p1) --[[ Line: 30 | Named "AssistantBuild" ]]
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), GetAssistantBuildStoreModule (copy), GetPlayButtonStoreModule (copy), SignalsReactModule (copy), FFlagBuildExperienceInGameShell (copy), ReactModule (copy), IconButton (copy), IconName (copy), InputSize (copy), View (copy), EducationalTooltip (copy), PopoverAlign (copy), PopoverSide (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		disabledTitle = LocalizationStringsModule.CHAT_ASSISTANT_DISABLED,
		portraitRequired = LocalizationStringsModule.CHAT_PORTRAIT_REQUIRED
	})
	local AssistantBuildStoreModule = GetAssistantBuildStoreModule()
	local PlayButtonStoreModule = GetPlayButtonStoreModule()
	local UseSignalStateResult = SignalsReactModule.useSignalState(AssistantBuildStoreModule.getIsDisabled)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(AssistantBuildStoreModule.getIsDisabledTooltipOpen)
	local UseSignalStateResult2 = if FFlagBuildExperienceInGameShell then SignalsReactModule.useSignalState(AssistantBuildStoreModule.getIsOverlayVisible) else nil
	local UseResult = ReactModule.useCallback(function() --[[ Line: 42 ]]
		-- upvalues: UseSignalStateResult (copy), AssistantBuildStoreModule (copy), UseSignalStateResult1 (copy), PlayButtonStoreModule (copy)
		if UseSignalStateResult then
			AssistantBuildStoreModule.setIsDisabledTooltipOpen(not UseSignalStateResult1)
			
			return
		else
			AssistantBuildStoreModule.setIsDisabledTooltipOpen(false)
			PlayButtonStoreModule.setIsActive(true)
		end
	end, {
		AssistantBuildStoreModule,
		UseSignalStateResult,
		UseSignalStateResult1,
		PlayButtonStoreModule
	})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 50 ]]
		-- upvalues: AssistantBuildStoreModule (copy)
		AssistantBuildStoreModule.setIsDisabledTooltipOpen(false)
	end, { AssistantBuildStoreModule })
	ReactModule.useEffect(function() --[[ Line: 54 ]]
		-- upvalues: UseSignalStateResult (copy), PlayButtonStoreModule (copy), AssistantBuildStoreModule (copy)
		if UseSignalStateResult then
			PlayButtonStoreModule.setIsActive(false)
			
			return
		else
			AssistantBuildStoreModule.setIsDisabledTooltipOpen(false)
		end
	end, {
		AssistantBuildStoreModule,
		UseSignalStateResult,
		PlayButtonStoreModule
	})
	local Element = ReactModule.createElement(IconButton, {
		isCircular = true,
		testId = "build-header-play-button",
		icon = if FFlagBuildExperienceInGameShell then if UseSignalStateResult2 then IconName.TwoArrowsFromCenter else IconName.TwoArrowsToCenter else IconName.Nebula,
		variant = p1.variant,
		size = InputSize.Medium,
		isDisabled = UseSignalStateResult,
		onActivated = if FFlagBuildExperienceInGameShell then AssistantBuildStoreModule.activate else UseResult
	})
	local Element1 = ReactModule.createElement(View, {
		tag = "auto-xy",
		testId = "build-header-play-button-disabled",
		onActivated = if FFlagBuildExperienceInGameShell then AssistantBuildStoreModule.activate else UseResult
	}, { Button = Element })
	
	return ReactModule.createElement(View, {
		tag = "auto-xy",
		LayoutOrder = p1.layoutOrder,
		testId = p1.testId or "assistant-build"
	}, {
		Tooltip = if UseSignalStateResult then ReactModule.createElement(EducationalTooltip, {
			testId = "build-assistant-disabled-tooltip",
			align = PopoverAlign.Start,
			isOpen = UseSignalStateResult1,
			onPressedOutside = UseResult1,
			side = PopoverSide.Bottom,
			text = UseLocalizationResult.portraitRequired,
			title = UseLocalizationResult.disabledTitle
		}, { Button = Element1 }) else nil,
		Button = if UseSignalStateResult then nil else Element
	})
end)