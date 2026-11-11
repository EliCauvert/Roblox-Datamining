local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetAssistantBuildStoreModule = require(BuildExperience.Stores.GetAssistantBuildStore)
local GetPlayButtonStoreModule = require(BuildExperience.Stores.GetPlayButtonStore)
local EducationalTooltip = FoundationModule.EducationalTooltip
local IconButton = FoundationModule.IconButton
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide
local View = FoundationModule.View

return ReactModule.memo(function(p1)
	-- upvalues: GetAssistantBuildStoreModule (copy), GetPlayButtonStoreModule (copy), SignalsReactModule (copy), ReactModule (copy), IconButton (copy), IconName (copy), InputSize (copy), View (copy), EducationalTooltip (copy), PopoverAlign (copy), PopoverSide (copy)
	local AssistantBuildStoreModule = GetAssistantBuildStoreModule()
	local PlayButtonStoreModule = GetPlayButtonStoreModule()
	local UseSignalStateResult = SignalsReactModule.useSignalState(AssistantBuildStoreModule.getIsDisabled)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(AssistantBuildStoreModule.getIsDisabledTooltipOpen)
	local UseResult = ReactModule.useCallback(function()
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
	ReactModule.useEffect(function()
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
		icon = IconName.Nebula,
		variant = p1.variant,
		size = InputSize.Medium,
		isDisabled = UseSignalStateResult,
		onActivated = UseResult
	})
	local Element1 = ReactModule.createElement(View, {
		tag = "auto-xy",
		testId = "build-header-play-button-disabled",
		onActivated = UseResult
	}, { Button = Element })
	
	return ReactModule.createElement(View, {
		tag = "auto-xy",
		LayoutOrder = p1.layoutOrder,
		testId = p1.testId or "assistant-build"
	}, {
		Tooltip = if UseSignalStateResult then ReactModule.createElement(EducationalTooltip, {
			text = "Return device to portrait to chat with assistant",
			title = "Assistant disabled",
			align = PopoverAlign.Start,
			isOpen = UseSignalStateResult1,
			side = PopoverSide.Bottom
		}, { Button = Element1 }) else nil,
		Button = if UseSignalStateResult then nil else Element
	})
end)