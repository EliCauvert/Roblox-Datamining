local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local view = foundationModule.View
local mediaPreviewModule = require(script.Parent.MediaPreview)
local captureGridItemModule = require(script.Parent.CaptureGridItem)
local useCaptureSelectionViewModelModule = require(script.Parent.useCaptureSelectionViewModel)
local scrollingGridView = momentsCommonModule.ScrollingGridView

local function renderEmptyState()
	-- upvalues: reactModule (ref), view (ref)
	return reactModule.createElement(view, { tag = "align-x-center align-y-center size-full" })
end

local function CaptureSelectionView(p1)
	-- upvalues: reactModule (ref), captureGridItemModule (ref), view (ref), mediaPreviewModule (ref), scrollingGridView (ref), renderEmptyState (ref), button (ref), foundationModule (ref), inputSize (ref), buttonVariant (ref)
	return reactModule.createElement(view, { tag = "col gap-medium size-full padding-large" }, {
		Preview = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "align-x-center align-y-center size-full-0 padding-x-xlarge",
			Size = UDim2.new(1, 0, 0.4, 0)
		}, {
			PreviewContent = reactModule.createElement(mediaPreviewModule, {
				mediaType = "image",
				isIcon = false,
				imageContent = p1.previewContent
			})
		}),
		CaptureGrid = reactModule.createElement(view, { LayoutOrder = 2, tag = "fill size-full" }, {
			Grid = reactModule.createElement(scrollingGridView, {
				aspectRatio = 1,
				layoutOrder = 1,
				showMoreButtonText = "Show More",
				itemConfig = {
					padding = 2,
					maxItemsPerRow = 4,
					minItemsPerPage = 8,
					minItemWidth = 80
				},
				items = p1.captures,
				onShowMoreCallback = p1.onShowMore,
				renderEmptyState = renderEmptyState,
				renderItem = reactModule.useCallback(function(p2, _)
					-- upvalues: reactModule (copy), captureGridItemModule (copy), p1 (ref)
					return reactModule.createElement(captureGridItemModule, {
						capture = p2,
						isSelected = p1.selectedCapture == p2,
						onActivated = p1.onCaptureSelected
					})
				end, { p1.selectedCapture, p1.onCaptureSelected }),
				shouldShowShowMoreButton = not p1.isFinished
			})
		}),
		ConfirmButton = reactModule.createElement(view, { LayoutOrder = 3, tag = "size-full-0 auto-y" }, {
			Button = reactModule.createElement(button, {
				text = "Continue",
				fillBehavior = foundationModule.Enums.FillBehavior.Fill,
				isDisabled = p1.selectedCapture == nil,
				onActivated = p1.onConfirm,
				size = inputSize.Medium,
				variant = buttonVariant.Emphasis
			})
		})
	})
end

return function(p1)
	-- upvalues: useCaptureSelectionViewModelModule (ref), reactModule (ref), CaptureSelectionView (ref)
	return reactModule.createElement(CaptureSelectionView, useCaptureSelectionViewModelModule({
		captureSource = p1.captureSource,
		onCaptureConfirmed = p1.onCaptureConfirmed
	}))
end