local Parent = script:FindFirstAncestor("SplitPane").Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local FoundationModule = require(Parent.Foundation)
local SplitPaneEducationalTourChromeModule = require(script.Parent.SplitPaneEducationalTourChrome)
local SplitPaneEducationalTourScrimModule = require(script.Parent.SplitPaneEducationalTourScrim)
local SplitPaneEducationalTourVideoModule = require(script.Parent.SplitPaneEducationalTourVideo)
local _ = require(script.Parent.getSplitPaneEducationalTourPresentation)
local _ = require(script.Parent.getSplitPaneEducationalTourTooltipModel)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local EducationalTooltip = FoundationModule.EducationalTooltip

local function _(p1, p2): Rect
	return Rect.new(p1.Min - p2, p1.Max - p2)
end

local Frame = Instance.new("Frame")
Frame.BackgroundTransparency = 1

return function(p1)
	-- upvalues: ButtonVariant (copy), ReactModule (copy), EducationalTooltip (copy), SplitPaneEducationalTourVideoModule (copy), ReactRobloxModule (copy), SplitPaneEducationalTourScrimModule (copy), Frame (copy), SplitPaneEducationalTourChromeModule (copy)
	local List = {}
	
	if p1.tooltipModel ~= nil then
		if p1.tooltipModel.isFinal then
			table.insert(List, {
				testId = "split-pane-educational-tour--action-finish-tour",
				text = p1.tooltipModel.primaryActionText,
				variant = ButtonVariant.Emphasis,
				onActivated = p1.onEnd,
				ref = p1.setPrimaryActionRef
			})
		else
			table.insert(List, {
				testId = "split-pane-educational-tour--action-next",
				text = p1.tooltipModel.primaryActionText,
				variant = ButtonVariant.Emphasis,
				onActivated = p1.onNext,
				ref = p1.setPrimaryActionRef
			})
			table.insert(List, {
				testId = "split-pane-educational-tour--action-skip",
				text = p1.tooltipModel.skipActionText or "",
				variant = ButtonVariant.Standard,
				onActivated = p1.onEnd
			})
		end
	end
	local TooltipModel = p1.tooltipModel
	local Element = if p1.presentation.isAnchorReady and TooltipModel ~= nil and p1.presentation.anchorRef ~= nil then ReactModule.createElement(EducationalTooltip, {
		isOpen = true,
		hasArrow = false,
		testId = "split-pane-educational-tour",
		ref = p1.setTooltipContentRef,
		anchorRef = p1.presentation.anchorRef,
		side = TooltipModel.side,
		align = TooltipModel.align,
		title = TooltipModel.title,
		text = TooltipModel.text,
		media = ReactModule.createElement(SplitPaneEducationalTourVideoModule, {
			videoAssetId = TooltipModel.videoAssetId,
			mediaWidth = p1.mediaWidth,
			videoAspectRatio = p1.videoAspectRatio,
			topRadius = p1.tokens.Radius.Medium
		}),
		steps = {
			current = TooltipModel.stepIndex,
			total = TooltipModel.totalSteps
		},
		actions = List,
		selectionGroup = {
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop
		}
	}) else nil
	local _Rect = nil
	
	if p1.supportPaneRect == nil then
		_Rect = nil
	else
		local SupportPaneRect = p1.supportPaneRect
		local OverlayOrigin = p1.overlayOrigin
		_Rect = Rect.new(SupportPaneRect.Min - OverlayOrigin, SupportPaneRect.Max - OverlayOrigin)
	end
	local _Rect1 = nil
	if p1.presentation.spotlightRect == nil then
		_Rect1 = nil
	else
		local SpotlightRect = p1.presentation.spotlightRect
		local OverlayOrigin = p1.overlayOrigin
		_Rect1 = Rect.new(SpotlightRect.Min - OverlayOrigin, SpotlightRect.Max - OverlayOrigin)
	end
	local DimEndXDelta = if p1.presentation.dimEndX == nil then nil else p1.presentation.dimEndX - p1.overlayOrigin.X
	local IsTooltipContentVisible = p1.presentation.isAnchorReady and p1.isTooltipContentVisible
	local config = {
		OverlayPortal = if p1.overlayInstance == nil then nil else ReactRobloxModule.createPortal(ReactModule.createElement(ReactModule.Fragment, nil, {
			GamepadCollapsedTooltipAnchor = if p1.presentation.isGamepadCollapsedStepOne then ReactModule.createElement("Frame", {
				Name = "GamepadCollapsedTooltipAnchor",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ref = p1.setGamepadCollapsedTooltipAnchorInstance,
				Position = UDim2.new(0.5, p1.mediaWidth / 2 + p1.tokens.Padding.Small, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.fromOffset(1, 1)
			}) else nil,
			Scrim = if p1.hasPresentedTooltip or p1.holdsInputBeforeTooltip then ReactModule.createElement(SplitPaneEducationalTourScrimModule, {
				targetRect = if IsTooltipContentVisible then _Rect1 else nil,
				dimEndX = if IsTooltipContentVisible then DimEndXDelta else nil,
				isTransparent = not p1.hasPresentedTooltip
			}) else nil,
			FocusHold = if p1.holdsInputBeforeTooltip and p1.tooltipModel == nil then ReactModule.createElement("Frame", {
				Name = "SplitPaneEducationalTourFocusHold",
				BackgroundTransparency = 1,
				SelectionGroup = true,
				ref = p1.setFocusSurfaceRef,
				Size = UDim2.fromOffset(1, 1),
				SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
				SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
				SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
				SelectionBehaviorUp = Enum.SelectionBehavior.Stop
			}, {
				FocusTarget = ReactModule.createElement("TextButton", {
					Name = "FocusTarget",
					BackgroundTransparency = 1,
					AutoButtonColor = false,
					Selectable = true,
					Text = "",
					ref = p1.setPrimaryActionRef,
					Size = UDim2.fromScale(1, 1),
					SelectionImageObject = Frame
				})
			}) else nil,
			Chrome = if _Rect == nil or p1.supportOverlayTopInset == nil or p1.presentation.isCollapsedStepOne then nil else ReactModule.createElement(SplitPaneEducationalTourChromeModule, {
				supportPaneRect = _Rect,
				topInset = p1.supportOverlayTopInset,
				onBottomPaneTooltipAnchorInstanceChanged = p1.setBottomPaneTooltipAnchorInstance,
				onGamepadStepTwoTooltipAnchorInstanceChanged = p1.setGamepadStepTwoTooltipAnchorInstance,
				onGamepadFinalTooltipAnchorInstanceChanged = p1.setGamepadFinalTooltipAnchorInstance,
				onTopRightControlInstanceChanged = p1.setTopRightControlInstance
			})
		}), p1.overlayInstance)
	}
	
	if Element ~= nil and TooltipModel ~= nil then
		config[`Tooltip-{TooltipModel.stepIndex}`] = Element
	end
	return ReactModule.createElement(ReactModule.Fragment, nil, config)
end