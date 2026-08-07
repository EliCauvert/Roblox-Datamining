local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local getAssistantBuildStoreModule = require(buildExperience.Stores.GetAssistantBuildStore)
local getPlayButtonStoreModule = require(buildExperience.Stores.GetPlayButtonStore)
local educationalTooltip = foundationModule.EducationalTooltip
local iconButton = foundationModule.IconButton
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide
local view = foundationModule.View

return reactModule.memo(function(p0) --[[ line: 28 | named "AssistantBuild" ]]
	-- upvalues: getAssistantBuildStoreModule (ref), getPlayButtonStoreModule (ref), signalsReactModule (ref), reactModule (ref), iconButton (ref), iconName (ref), inputSize (ref), view (ref), educationalTooltip (ref), popoverAlign (ref), popoverSide (ref), localizationStringsModule (ref)
	local var7 = getAssistantBuildStoreModule()
	local var8 = getPlayButtonStoreModule()
	local var9 = signalsReactModule.useSignalState(var7.getIsDisabled)
	local var10 = signalsReactModule.useSignalState(var7.getIsDisabledTooltipOpen)
	local var11 = reactModule.useCallback(function() --[[ line: 34 ]]
		-- upvalues: var9 (ref), var7 (ref), var10 (ref), var8 (ref)
		if var9 then
			var7.setIsDisabledTooltipOpen(not var10)
			
			return
		end
		var7.setIsDisabledTooltipOpen(false)
		var8.setIsActive(true)
	end, { var7, var9, var10, var8 })
	reactModule.useEffect(function() --[[ line: 43 ]]
		-- upvalues: var9 (ref), var8 (ref), var7 (ref)
		if var9 then
			var8.setIsActive(false)
			
			return
		end
		var7.setIsDisabledTooltipOpen(false)
	end, { var7, var9, var8 })
	local var12 = reactModule.createElement(iconButton, {
		isCircular = true,
		testId = "build-header-play-button",
		icon = iconName.Nebula,
		variant = p0.variant,
		size = inputSize.Medium,
		isDisabled = var9,
		onActivated = var11
	})
	
	return reactModule.createElement(view, {
		tag = "auto-xy",
		LayoutOrder = p0.layoutOrder,
		testId = p0.testId or "assistant-build"
	}, {
		Tooltip = if var9 then reactModule.createElement(educationalTooltip, {
			align = popoverAlign.Start,
			isOpen = var10,
			side = popoverSide.Bottom,
			text = localizationStringsModule.CHAT_PORTRAIT_REQUIRED,
			title = localizationStringsModule.CHAT_ASSISTANT_DISABLED
		}, {
			Button = reactModule.createElement(view, {
				tag = "auto-xy",
				testId = "build-header-play-button-disabled",
				onActivated = var11
			}, { Button = var12 })
		}) else nil,
		Button = if not var9 then var12 else nil
	})
end)