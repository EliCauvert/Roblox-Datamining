local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local View = FoundationModule.View
local MediaPreviewModule = require(script.Parent.MediaPreview)
local CaptureGridItemModule = require(script.Parent.CaptureGridItem)
local UseCaptureSelectionViewModelModule = require(script.Parent.useCaptureSelectionViewModel)
local ScrollingGridView = require(Parent.MomentsCommon).ScrollingGridView

local function renderEmptyState()
	-- upvalues: ReactModule (copy), View (copy)
	return ReactModule.createElement(View, { tag = "align-x-center align-y-center size-full" })
end

local function CaptureSelectionView(p1)
	-- upvalues: ReactModule (copy), CaptureGridItemModule (copy), View (copy), MediaPreviewModule (copy), ScrollingGridView (copy), renderEmptyState (copy), Button (copy), FoundationModule (copy), InputSize (copy), ButtonVariant (copy)
	return ReactModule.createElement(View, { tag = "col gap-medium size-full padding-large" }, {
		Preview = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "align-x-center align-y-center size-full-0 padding-x-xlarge",
			Size = UDim2.new(1, 0, 0.4, 0)
		}, {
			PreviewContent = ReactModule.createElement(MediaPreviewModule, {
				mediaType = "image",
				isIcon = false,
				imageContent = p1.previewContent
			})
		}),
		CaptureGrid = ReactModule.createElement(View, { LayoutOrder = 2, tag = "fill size-full" }, {
			Grid = ReactModule.createElement(ScrollingGridView, {
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
				renderItem = ReactModule.useCallback(function(Capture, _)
					-- upvalues: ReactModule (upval), CaptureGridItemModule (upval), p1 (copy)
					return ReactModule.createElement(CaptureGridItemModule, {
						capture = Capture,
						isSelected = p1.selectedCapture == Capture,
						onActivated = p1.onCaptureSelected
					})
				end, { p1.selectedCapture, p1.onCaptureSelected }),
				shouldShowShowMoreButton = not p1.isFinished
			})
		}),
		ConfirmButton = ReactModule.createElement(View, { LayoutOrder = 3, tag = "size-full-0 auto-y" }, {
			Button = ReactModule.createElement(Button, {
				text = "Continue",
				fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
				isDisabled = p1.selectedCapture == nil,
				onActivated = p1.onConfirm,
				size = InputSize.Medium,
				variant = ButtonVariant.Emphasis
			})
		})
	})
end

return function(p1)
	-- upvalues: UseCaptureSelectionViewModelModule (copy), ReactModule (copy), CaptureSelectionView (copy)
	return ReactModule.createElement(CaptureSelectionView, (UseCaptureSelectionViewModelModule({
		captureSource = p1.captureSource,
		onCaptureConfirmed = p1.onCaptureConfirmed
	})))
end