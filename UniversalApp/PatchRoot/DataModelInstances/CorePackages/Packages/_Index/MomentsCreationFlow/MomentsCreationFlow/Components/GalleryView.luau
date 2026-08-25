local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local parent = momentsCreationFlow.Parent
local builderIconsModule = require(parent.BuilderIcons)
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local chip = foundationModule.Chip
local inputSize = foundationModule.Enums.InputSize
local text = foundationModule.Text
local view = foundationModule.View
local image = builderIconsModule.Icon.Image
local videoCamera = builderIconsModule.Icon.VideoCamera
local captureItemModule = require(momentsCreationFlow.Components.CaptureItem)
local scrollingGridView = momentsCommonModule.ScrollingGridView
local useCallback = reactModule.useCallback
local useContext = reactModule.useContext
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useTokens = foundationModule.Hooks.useTokens
local creationFlowContextModule = require(momentsCreationFlow.Context.CreationFlowContext)
local constantsModule = require(momentsCreationFlow.Constants)
local creationFlowLocalizationModule = require(momentsCreationFlow.Enums.CreationFlowLocalization)
local eventNamesModule = require(momentsCreationFlow.Analytics.EventNames)

return function(p0)
	-- upvalues: useDeviceInsets (ref), useTokens (ref), useContext (ref), creationFlowContextModule (ref), reactModule (ref), cryoModule (ref), eventNamesModule (ref), useCallback (ref), captureItemModule (ref), view (ref), text (ref), creationFlowLocalizationModule (ref), chip (ref), foundationModule (ref), image (ref), videoCamera (ref), scrollingGridView (ref), constantsModule (ref), button (ref), inputSize (ref), buttonVariant (ref)
	local var11 = useDeviceInsets()
	local var12 = useTokens()
	local var13 = useContext(creationFlowContextModule)
	local var14, var15 = reactModule.useState(nil)
	local var16 = reactModule.useRef(false)
	local var17 = reactModule.useMemo(function()
		-- upvalues: var14 (ref), p0 (ref), cryoModule (copy)
		return if var14 then cryoModule.List.filter(p0.captures, function(p1)
			-- upvalues: var14 (copy)
			return p1.CaptureType == var14
		end) else p0.captures
	end, { p0.captures, var14 })
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var16 (ref), var13 (ref), eventNamesModule (copy)
		if #p0.captures == 0 and var16.current == false then
			var16.current = true
			var13.fireEvent(eventNamesModule.EditingFlowGalleryNoCapturesAvailable)
		end
	end, { p0.captures })
	
	return reactModule.createElement(view, {
		tag = "align-x-center auto-y align-y-bottom anchor-bottom-center gap-large position-bottom-center col shrink size-full-0",
		LayoutOrder = p0.layoutOrder
	}, {
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var12.Padding.Large),
			PaddingBottom = UDim.new(0, math.max(var11.bottom, var12.Padding.Large))
		}),
		FilterButtons = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "auto-y anchor-top-center gap-small position-top-center row size-full-0"
		}, {
			Padding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, math.max(var11.left, var12.Padding.XLarge)),
				PaddingRight = UDim.new(0, math.max(var11.right, var12.Padding.XLarge))
			}),
			AllChip = reactModule.createElement(chip, {
				LayoutOrder = 1,
				isChecked = var14 == nil,
				onActivated = useCallback(function()
					-- upvalues: var15 (ref)
					var15(nil)
				end, {}),
				size = foundationModule.Enums.ChipSize.Small,
				text = var13.getLocalization(creationFlowLocalizationModule.GeneralAllChipLabel)
			}),
			PhotosChip = reactModule.createElement(chip, {
				LayoutOrder = 2,
				isChecked = var14 == Enum.CaptureType.Screenshot,
				leading = image,
				onActivated = useCallback(function()
					-- upvalues: var15 (ref)
					var15(Enum.CaptureType.Screenshot)
				end, {}),
				size = foundationModule.Enums.ChipSize.Small,
				text = var13.getLocalization(creationFlowLocalizationModule.GeneralPhotosChipLabel)
			}),
			VideosChip = reactModule.createElement(chip, {
				LayoutOrder = 3,
				isChecked = var14 == Enum.CaptureType.Video,
				leading = videoCamera,
				onActivated = useCallback(function()
					-- upvalues: var15 (ref)
					var15(Enum.CaptureType.Video)
				end, {}),
				size = foundationModule.Enums.ChipSize.Small,
				text = var13.getLocalization(creationFlowLocalizationModule.GeneralVideosChipLabel)
			})
		}),
		CaptureGrid = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "anchor-top-center gap-small position-top-center row shrink size-full-full"
		}, {
			Padding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, var11.left),
				PaddingRight = UDim.new(0, var11.right)
			}),
			CaptureGrid = reactModule.createElement(scrollingGridView, {
				aspectRatio = 1,
				layoutOrder = 1,
				itemConfig = {
					padding = 2,
					maxItemsPerRow = 5,
					minItemsPerPage = 6,
					minItemWidth = 100
				},
				items = var17,
				onShowMoreCallback = useCallback(function()
					-- upvalues: var13 (ref)
					var13.fetchAdditionalCaptures()
				end, { var13 }),
				padding = { bottom = UDim.new(0, var12.Padding.Large) },
				renderEmptyState = useCallback(function()
					-- upvalues: reactModule (copy), view (copy), text (copy), var13 (ref), creationFlowLocalizationModule (copy)
					return reactModule.createElement(view, { tag = "shrink size-full-full" }, {
						EmptyState = reactModule.createElement(text, {
							tag = "anchor-top-center auto-xy content-action-emphasis padding-large position-top-center text-align-x-center text-align-y-center text-body-medium",
							Text = var13.getLocalization(creationFlowLocalizationModule.GeneralEmptyStateText)
						})
					})
				end, { var13 }),
				renderItem = useCallback(function(p2, _)
					-- upvalues: reactModule (copy), captureItemModule (copy), p0 (ref)
					return reactModule.createElement(captureItemModule, {
						zIndex = 1,
						capture = p2,
						onActivated = p0.onCaptureSelected,
						selected = p0.selectedCapture == p2
					})
				end, { p0.selectedCapture, p0.onCaptureSelected }),
				shouldShowShowMoreButton = not var13.capturesPagesIsFinished(),
				showMoreButtonText = var13.getLocalization(creationFlowLocalizationModule.GeneralCtaShowMore)
			})
		}),
		ButtonContainer = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "align-x-center auto-y size-full-0"
		}, {
			Padding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, math.max(var11.left, var12.Padding.XLarge)),
				PaddingRight = UDim.new(0, math.max(var11.right, var12.Padding.XLarge))
			}),
			ButtonConstraint = reactModule.createElement(view, {
				tag = "auto-y size-full-0",
				sizeConstraint = { MaxSize = constantsModule.BottomBarSizeConstraint }
			}, {
				NextButton = reactModule.createElement(button, {
					LayoutOrder = 1,
					fillBehavior = foundationModule.Enums.FillBehavior.Fill,
					isDisabled = not p0.selectedCapture,
					onActivated = p0.onNextCallback,
					size = inputSize.Medium,
					text = var13.getLocalization(creationFlowLocalizationModule.PublishingCtaContinue),
					variant = buttonVariant.Emphasis
				})
			})
		})
	})
end