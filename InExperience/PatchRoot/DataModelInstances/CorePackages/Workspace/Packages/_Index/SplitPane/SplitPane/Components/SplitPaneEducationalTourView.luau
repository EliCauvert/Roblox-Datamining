local parent = script:FindFirstAncestor("SplitPane").Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local foundationModule = require(parent.Foundation)
local splitPaneEducationalTourChromeModule = require(script.Parent.SplitPaneEducationalTourChrome)
local splitPaneEducationalTourScrimModule = require(script.Parent.SplitPaneEducationalTourScrim)
local splitPaneEducationalTourVideoModule = require(script.Parent.SplitPaneEducationalTourVideo)
local _ = require(script.Parent.getSplitPaneEducationalTourPresentation)
local _ = require(script.Parent.getSplitPaneEducationalTourTooltipModel)
local buttonVariant = foundationModule.Enums.ButtonVariant
local educationalTooltip = foundationModule.EducationalTooltip

local function _(p1, p2)
	return Rect.new(p1.Min - p2, p1.Max - p2)
end

return function(p1)
	-- upvalues: buttonVariant (ref), reactModule (ref), educationalTooltip (ref), splitPaneEducationalTourVideoModule (ref), reactRobloxModule (ref), splitPaneEducationalTourScrimModule (ref), splitPaneEducationalTourChromeModule (ref)
	local t = {}
	
	if p1.tooltipModel ~= nil then
		if p1.tooltipModel.isFinal then
			table.insert(t, {
				testId = "split-pane-educational-tour--action-finish-tour",
				text = p1.tooltipModel.primaryActionText,
				variant = buttonVariant.Emphasis,
				onActivated = p1.onEnd,
				ref = p1.setPrimaryActionRef
			})
		else
			table.insert(t, {
				testId = "split-pane-educational-tour--action-next",
				text = p1.tooltipModel.primaryActionText,
				variant = buttonVariant.Emphasis,
				onActivated = p1.onNext,
				ref = p1.setPrimaryActionRef
			})
			table.insert(t, {
				testId = "split-pane-educational-tour--action-skip",
				text = p1.tooltipModel.skipActionText or "",
				variant = buttonVariant.Standard,
				onActivated = p1.onEnd
			})
		end
	end
	local rect
	local tooltipModel = p1.tooltipModel
	local var1 = if p1.presentation.isAnchorReady and tooltipModel ~= nil and p1.presentation.anchorRef ~= nil then reactModule.createElement(educationalTooltip, {
		isOpen = true,
		hasArrow = false,
		testId = "split-pane-educational-tour",
		ref = p1.setTooltipContentRef,
		anchorRef = p1.presentation.anchorRef,
		side = tooltipModel.side,
		align = tooltipModel.align,
		title = tooltipModel.title,
		text = tooltipModel.text,
		media = reactModule.createElement(splitPaneEducationalTourVideoModule, {
			videoAssetId = tooltipModel.videoAssetId,
			mediaWidth = p1.mediaWidth,
			videoAspectRatio = p1.videoAspectRatio,
			topRadius = p1.tokens.Radius.Medium
		}),
		steps = {
			current = tooltipModel.stepIndex,
			total = tooltipModel.totalSteps
		},
		actions = t,
		selectionGroup = {
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop
		}
	}) else nil
	
	if p1.supportPaneRect == nil then
		rect = nil
	else
		local supportPaneRect = p1.supportPaneRect
		local overlayOrigin = p1.overlayOrigin
		rect = Rect.new(supportPaneRect.Min - overlayOrigin, supportPaneRect.Max - overlayOrigin)
	end
	local rect_1
	if p1.presentation.spotlightRect == nil then
		rect_1 = nil
	else
		local spotlightRect = p1.presentation.spotlightRect
		local overlayOrigin = p1.overlayOrigin
		rect_1 = Rect.new(spotlightRect.Min - overlayOrigin, spotlightRect.Max - overlayOrigin)
	end
	local createPortal
	local var2 = if p1.presentation.dimEndX ~= nil then nil else p1.presentation.dimEndX - p1.overlayOrigin.X
	local isTooltipContentVisible = p1.presentation.isAnchorReady and p1.isTooltipContentVisible
	local t_1 = {}
	
	if p1.overlayInstance == nil then
		createPortal = nil
	else
		createPortal = reactRobloxModule.createPortal
		createPortal = createPortal(reactModule.createElement(reactModule.Fragment, nil, {
			GamepadCollapsedTooltipAnchor = if p1.presentation.isGamepadCollapsedStepOne then reactModule.createElement("Frame", {
				Name = "GamepadCollapsedTooltipAnchor",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ref = p1.setGamepadCollapsedTooltipAnchorInstance,
				Position = UDim2.new(0.5, p1.mediaWidth / 2 + p1.tokens.Padding.Small, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.fromOffset(1, 1)
			}) else nil,
			Scrim = if p1.hasPresentedTooltip then reactModule.createElement(splitPaneEducationalTourScrimModule, {
				targetRect = if isTooltipContentVisible then rect_1 else nil,
				dimEndX = if isTooltipContentVisible then var2 else nil
			}) else nil,
			Chrome = if rect == nil or p1.supportOverlayTopInset == nil or p1.presentation.isCollapsedStepOne then nil else reactModule.createElement(splitPaneEducationalTourChromeModule, {
				supportPaneRect = rect,
				topInset = p1.supportOverlayTopInset,
				onBottomPaneTooltipAnchorInstanceChanged = p1.setBottomPaneTooltipAnchorInstance,
				onGamepadStepTwoTooltipAnchorInstanceChanged = p1.setGamepadStepTwoTooltipAnchorInstance,
				onGamepadFinalTooltipAnchorInstanceChanged = p1.setGamepadFinalTooltipAnchorInstance,
				onTopRightControlInstanceChanged = p1.setTopRightControlInstance
			})
		}), p1.overlayInstance)
	end
	t_1.OverlayPortal = createPortal
	
	if var1 ~= nil and tooltipModel ~= nil then
		t_1[`Tooltip-{tooltipModel.stepIndex}`] = var1
	end
	return reactModule.createElement(reactModule.Fragment, nil, t_1)
end