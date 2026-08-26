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

return function(p1)
	-- upvalues: useDeviceInsets (ref), useTokens (ref), useContext (ref), creationFlowContextModule (ref), reactModule (ref), cryoModule (ref), eventNamesModule (ref), useCallback (ref), captureItemModule (ref), view (ref), text (ref), creationFlowLocalizationModule (ref), chip (ref), foundationModule (ref), image (ref), videoCamera (ref), scrollingGridView (ref), constantsModule (ref), button (ref), inputSize (ref), buttonVariant (ref)
	local var1 = useDeviceInsets()
	local var2 = useTokens()
	local var3 = useContext(creationFlowContextModule)
	local var4, var5 = reactModule.useState(nil)
	local var6 = reactModule.useRef(false)
	local var7 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), p1 (ref), cryoModule (copy)
		return if var4 then cryoModule.List.filter(p1.captures, function(p2)
			-- upvalues: var4 (copy)
			return p2.CaptureType == var4
		end) else p1.captures
	end, { p1.captures, var4 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var6 (ref), var3 (ref), eventNamesModule (copy)
		if #p1.captures == 0 and var6.current == false then
			var6.current = true
			var3.fireEvent(eventNamesModule.EditingFlowGalleryNoCapturesAvailable)
		end
	end, { p1.captures })
	
	return reactModule.createElement(view, {
		tag = "align-x-center auto-y align-y-bottom anchor-bottom-center gap-large position-bottom-center col shrink size-full-0",
		LayoutOrder = p1.layoutOrder
	}, {
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var2.Padding.Large),
			PaddingBottom = UDim.new(0, math.max(var1.bottom, var2.Padding.Large))
		}),
		FilterButtons = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "auto-y anchor-top-center gap-small position-top-center row size-full-0"
		}, {
			Padding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, math.max(var1.left, var2.Padding.XLarge)),
				PaddingRight = UDim.new(0, math.max(var1.right, var2.Padding.XLarge))
			}),
			AllChip = reactModule.createElement(chip, {
				LayoutOrder = 1,
				isChecked = var4 == nil,
				onActivated = useCallback(function()
					-- upvalues: var5 (ref)
					var5(nil)
				end, {}),
				size = foundationModule.Enums.ChipSize.Small,
				text = var3.getLocalization(creationFlowLocalizationModule.GeneralAllChipLabel)
			}),
			PhotosChip = reactModule.createElement(chip, {
				LayoutOrder = 2,
				isChecked = var4 == Enum.CaptureType.Screenshot,
				leading = image,
				onActivated = useCallback(function()
					-- upvalues: var5 (ref)
					var5(Enum.CaptureType.Screenshot)
				end, {}),
				size = foundationModule.Enums.ChipSize.Small,
				text = var3.getLocalization(creationFlowLocalizationModule.GeneralPhotosChipLabel)
			}),
			VideosChip = reactModule.createElement(chip, {
				LayoutOrder = 3,
				isChecked = var4 == Enum.CaptureType.Video,
				leading = videoCamera,
				onActivated = useCallback(function()
					-- upvalues: var5 (ref)
					var5(Enum.CaptureType.Video)
				end, {}),
				size = foundationModule.Enums.ChipSize.Small,
				text = var3.getLocalization(creationFlowLocalizationModule.GeneralVideosChipLabel)
			})
		}),
		CaptureGrid = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "anchor-top-center gap-small position-top-center row shrink size-full-full"
		}, {
			Padding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, var1.left),
				PaddingRight = UDim.new(0, var1.right)
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
				items = var7,
				onShowMoreCallback = useCallback(function()
					-- upvalues: var3 (ref)
					var3.fetchAdditionalCaptures()
				end, { var3 }),
				padding = { bottom = UDim.new(0, var2.Padding.Large) },
				renderEmptyState = useCallback(function()
					-- upvalues: reactModule (copy), view (copy), text (copy), var3 (ref), creationFlowLocalizationModule (copy)
					return reactModule.createElement(view, { tag = "shrink size-full-full" }, {
						EmptyState = reactModule.createElement(text, {
							tag = "anchor-top-center auto-xy content-action-emphasis padding-large position-top-center text-align-x-center text-align-y-center text-body-medium",
							Text = var3.getLocalization(creationFlowLocalizationModule.GeneralEmptyStateText)
						})
					})
				end, { var3 }),
				renderItem = useCallback(function(p2, _)
					-- upvalues: reactModule (copy), captureItemModule (copy), p1 (ref)
					return reactModule.createElement(captureItemModule, {
						zIndex = 1,
						capture = p2,
						onActivated = p1.onCaptureSelected,
						selected = p1.selectedCapture == p2
					})
				end, { p1.selectedCapture, p1.onCaptureSelected }),
				shouldShowShowMoreButton = not var3.capturesPagesIsFinished(),
				showMoreButtonText = var3.getLocalization(creationFlowLocalizationModule.GeneralCtaShowMore)
			})
		}),
		ButtonContainer = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "align-x-center auto-y size-full-0"
		}, {
			Padding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, math.max(var1.left, var2.Padding.XLarge)),
				PaddingRight = UDim.new(0, math.max(var1.right, var2.Padding.XLarge))
			}),
			ButtonConstraint = reactModule.createElement(view, {
				tag = "auto-y size-full-0",
				sizeConstraint = { MaxSize = constantsModule.BottomBarSizeConstraint }
			}, {
				NextButton = reactModule.createElement(button, {
					LayoutOrder = 1,
					fillBehavior = foundationModule.Enums.FillBehavior.Fill,
					isDisabled = not p1.selectedCapture,
					onActivated = p1.onNextCallback,
					size = inputSize.Medium,
					text = var3.getLocalization(creationFlowLocalizationModule.PublishingCtaContinue),
					variant = buttonVariant.Emphasis
				})
			})
		})
	})
end