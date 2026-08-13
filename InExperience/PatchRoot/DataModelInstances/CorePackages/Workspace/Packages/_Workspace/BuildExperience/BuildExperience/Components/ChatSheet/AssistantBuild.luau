local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
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

return reactModule.memo(function(p0) --[[ line: 29 | named "AssistantBuild" ]]
	-- upvalues: getAssistantBuildStoreModule (ref), getPlayButtonStoreModule (ref), signalsReactModule (ref), reactModule (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref), iconButton (ref), iconName (ref), inputSize (ref), view (ref), educationalTooltip (ref), popoverAlign (ref), popoverSide (ref), localizationStringsModule (ref)
	local var8 = getAssistantBuildStoreModule()
	local var9 = getPlayButtonStoreModule()
	local var10 = signalsReactModule.useSignalState(var8.getIsDisabled)
	local var11 = signalsReactModule.useSignalState(var8.getIsDisabledTooltipOpen)
	local var12 = reactModule.useCallback(function() --[[ line: 35 ]]
		-- upvalues: var10 (ref), var8 (ref), var11 (ref), var9 (ref)
		if var10 then
			var8.setIsDisabledTooltipOpen(not var11)
			
			return
		end
		var8.setIsDisabledTooltipOpen(false)
		var9.setIsActive(true)
	end, { var8, var10, var11, var9 })
	local var13 = if fFlagBuildExperienceTooltipsLightDismissModule then reactModule.useCallback(function() --[[ line: 44 ]]
		-- upvalues: var8 (ref)
		var8.setIsDisabledTooltipOpen(false)
	end, { var8 }) else nil
	reactModule.useEffect(function() --[[ line: 49 ]]
		-- upvalues: var10 (ref), var9 (ref), var8 (ref)
		if var10 then
			var9.setIsActive(false)
			
			return
		end
		var8.setIsDisabledTooltipOpen(false)
	end, { var8, var10, var9 })
	local var14 = reactModule.createElement(iconButton, {
		isCircular = true,
		testId = "build-header-play-button",
		icon = iconName.Nebula,
		variant = p0.variant,
		size = inputSize.Medium,
		isDisabled = var10,
		onActivated = var12
	})
	
	return reactModule.createElement(view, {
		tag = "auto-xy",
		LayoutOrder = p0.layoutOrder,
		testId = p0.testId or "assistant-build"
	}, {
		Tooltip = if var10 then reactModule.createElement(educationalTooltip, {
			testId = "build-assistant-disabled-tooltip",
			align = popoverAlign.Start,
			isOpen = var11,
			onPressedOutside = var13,
			side = popoverSide.Bottom,
			text = localizationStringsModule.CHAT_PORTRAIT_REQUIRED,
			title = localizationStringsModule.CHAT_ASSISTANT_DISABLED
		}, {
			Button = reactModule.createElement(view, {
				tag = "auto-xy",
				testId = "build-header-play-button-disabled",
				onActivated = var12
			}, { Button = var14 })
		}) else nil,
		Button = if not var10 then var14 else nil
	})
end)