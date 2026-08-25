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

local function CaptureSelectionView(p0)
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
				imageContent = p0.previewContent
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
				items = p0.captures,
				onShowMoreCallback = p0.onShowMore,
				renderEmptyState = renderEmptyState,
				renderItem = reactModule.useCallback(function(p1, _)
					-- upvalues: reactModule (copy), captureGridItemModule (copy), p0 (ref)
					return reactModule.createElement(captureGridItemModule, {
						capture = p1,
						isSelected = p0.selectedCapture == p1,
						onActivated = p0.onCaptureSelected
					})
				end, { p0.selectedCapture, p0.onCaptureSelected }),
				shouldShowShowMoreButton = not p0.isFinished
			})
		}),
		ConfirmButton = reactModule.createElement(view, { LayoutOrder = 3, tag = "size-full-0 auto-y" }, {
			Button = reactModule.createElement(button, {
				text = "Continue",
				fillBehavior = foundationModule.Enums.FillBehavior.Fill,
				isDisabled = p0.selectedCapture == nil,
				onActivated = p0.onConfirm,
				size = inputSize.Medium,
				variant = buttonVariant.Emphasis
			})
		})
	})
end

return function(p2)
	-- upvalues: useCaptureSelectionViewModelModule (ref), reactModule (ref), CaptureSelectionView (ref)
	return reactModule.createElement(CaptureSelectionView, useCaptureSelectionViewModelModule({
		captureSource = p2.captureSource,
		onCaptureConfirmed = p2.onCaptureConfirmed
	}))
end