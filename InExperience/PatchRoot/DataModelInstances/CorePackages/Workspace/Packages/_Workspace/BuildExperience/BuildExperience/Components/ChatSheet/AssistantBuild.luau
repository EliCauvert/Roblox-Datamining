local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getAssistantBuildStoreModule = require(buildExperience.Stores.GetAssistantBuildStore)
local getPlayButtonStoreModule = require(buildExperience.Stores.GetPlayButtonStore)
local educationalTooltip = foundationModule.EducationalTooltip
local iconButton = foundationModule.IconButton
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide
local view = foundationModule.View

return reactModule.memo(function(p0) --[[ line: 27 | named "AssistantBuild" ]]
	-- upvalues: getAssistantBuildStoreModule (ref), getPlayButtonStoreModule (ref), signalsReactModule (ref), reactModule (ref), iconButton (ref), iconName (ref), inputSize (ref), view (ref), educationalTooltip (ref), popoverAlign (ref), popoverSide (ref)
	local var6 = getAssistantBuildStoreModule()
	local var7 = getPlayButtonStoreModule()
	local var8 = signalsReactModule.useSignalState(var6.getIsDisabled)
	local var9 = signalsReactModule.useSignalState(var6.getIsDisabledTooltipOpen)
	local var10 = reactModule.useCallback(function() --[[ line: 33 ]]
		-- upvalues: var8 (ref), var6 (ref), var9 (ref), var7 (ref)
		if var8 then
			var6.setIsDisabledTooltipOpen(not var9)
			
			return
		end
		var6.setIsDisabledTooltipOpen(false)
		var7.setIsActive(true)
	end, { var6, var8, var9, var7 })
	reactModule.useEffect(function() --[[ line: 42 ]]
		-- upvalues: var8 (ref), var7 (ref), var6 (ref)
		if var8 then
			var7.setIsActive(false)
			
			return
		end
		var6.setIsDisabledTooltipOpen(false)
	end, { var6, var8, var7 })
	local var11 = reactModule.createElement(iconButton, {
		isCircular = true,
		testId = "build-header-play-button",
		icon = iconName.Nebula,
		variant = p0.variant,
		size = inputSize.Medium,
		isDisabled = var8,
		onActivated = var10
	})
	
	return reactModule.createElement(view, {
		tag = "auto-xy",
		LayoutOrder = p0.layoutOrder,
		testId = p0.testId or "assistant-build"
	}, {
		Tooltip = if var8 then reactModule.createElement(educationalTooltip, {
			text = "Return device to portrait to chat with assistant",
			title = "Assistant disabled",
			align = popoverAlign.Start,
			isOpen = var9,
			side = popoverSide.Bottom
		}, {
			Button = reactModule.createElement(view, {
				tag = "auto-xy",
				testId = "build-header-play-button-disabled",
				onActivated = var10
			}, { Button = var11 })
		}) else nil,
		Button = if not var8 then var11 else nil
	})
end)