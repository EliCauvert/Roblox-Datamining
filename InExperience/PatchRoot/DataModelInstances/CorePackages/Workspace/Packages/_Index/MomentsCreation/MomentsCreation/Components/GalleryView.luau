local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
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
local captureItemModule = require(momentsCreation.Components.CaptureItem)
local scrollingGridView = momentsCommonModule.ScrollingGridView
local useCallback = reactModule.useCallback
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useTokens = foundationModule.Hooks.useTokens
local constantsModule = require(momentsCreation.Constants)
local fireAnalyticsEventModule = require(momentsCreation.Analytics.fireAnalyticsEvent)
local makeCreationEventFieldsModule = require(momentsCreation.Analytics.makeCreationEventFields)
local useCreationFlowStringsModule = require(momentsCreation.Hooks.useCreationFlowStrings)
local eventNames = momentsCommonModule.Analytics.EventNames
local sessionManager = momentsCommonModule.Analytics.SessionManager
local funnelEventNames = momentsCommonModule.Analytics.FunnelEventNames

return function(p1)
	-- upvalues: useDeviceInsets (ref), useTokens (ref), useCreationFlowStringsModule (ref), reactModule (ref), cryoModule (ref), sessionManager (ref), funnelEventNames (ref), fireAnalyticsEventModule (ref), eventNames (ref), makeCreationEventFieldsModule (ref), useCallback (ref), captureItemModule (ref), view (ref), text (ref), chip (ref), foundationModule (ref), image (ref), videoCamera (ref), scrollingGridView (ref), constantsModule (ref), button (ref), inputSize (ref), buttonVariant (ref)
	local var1 = useDeviceInsets()
	local var2 = useTokens()
	local var3 = useCreationFlowStringsModule()
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
		-- upvalues: p1 (ref), var6 (ref), sessionManager (copy), funnelEventNames (copy), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy)
		if #p1.captures == 0 and var6.current == false then
			var6.current = true
			fireAnalyticsEventModule(eventNames.EditingFlowGalleryNoCapturesAvailable, makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)))
		end
	end, { p1.captures })
	local var8 = useCallback(function(p2)
		-- upvalues: p1 (ref)
		p1.onCaptureSelected(p2)
	end, { p1.onCaptureSelected })
	
	return reactModule.createElement(view, {
		tag = "col align-x-center align-y-bottom shrink gap-large position-bottom-center anchor-bottom-center size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		padding = {
			top = UDim.new(0, var2.Padding.Large),
			bottom = UDim.new(0, math.max(var1.bottom, var2.Padding.Large))
		}
	}, {
		FilterButtons = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row gap-small position-top-center anchor-top-center size-full-0 auto-y",
			padding = {
				left = UDim.new(0, math.max(var1.left, var2.Padding.XLarge)),
				right = UDim.new(0, math.max(var1.right, var2.Padding.XLarge))
			}
		}, {
			AllChip = reactModule.createElement(chip, {
				LayoutOrder = 1,
				isChecked = var4 == nil,
				onActivated = useCallback(function()
					-- upvalues: var5 (ref)
					var5(nil)
				end, {}),
				size = foundationModule.Enums.ChipSize.Small,
				text = var3.GeneralAllChipLabel
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
				text = var3.GeneralPhotosChipLabel
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
				text = var3.GeneralVideosChipLabel
			})
		}),
		CaptureGrid = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row shrink gap-small position-top-center anchor-top-center size-full-full",
			padding = {
				left = UDim.new(0, var1.left),
				right = UDim.new(0, var1.right)
			}
		}, {
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
					-- upvalues: p1 (ref)
					if p1.onShowMore then
						p1.onShowMore()
					end
				end, { p1.onShowMore }),
				padding = { bottom = UDim.new(0, var2.Padding.Large) },
				renderEmptyState = useCallback(function()
					-- upvalues: reactModule (copy), view (copy), text (copy), var3 (ref)
					return reactModule.createElement(view, { tag = "shrink size-full-full" }, {
						EmptyState = reactModule.createElement(text, {
							tag = "position-top-center anchor-top-center auto-xy padding-large text-body-medium text-align-x-center text-align-y-center content-action-emphasis",
							Text = var3.GeneralEmptyStateText
						})
					})
				end, { var3 }),
				renderItem = useCallback(function(p2, _)
					-- upvalues: reactModule (copy), captureItemModule (copy), var8 (ref), p1 (ref)
					return reactModule.createElement(captureItemModule, {
						zIndex = 1,
						capture = p2,
						onActivated = var8,
						selected = p1.selectedCapture == p2
					})
				end, { p1.selectedCapture, var8 }),
				shouldShowShowMoreButton = p1.hasMoreCaptures == true,
				showMoreButtonText = var3.GeneralCtaShowMore
			})
		}),
		ButtonContainer = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "align-x-center size-full-0 auto-y",
			padding = {
				left = UDim.new(0, math.max(var1.left, var2.Padding.XLarge)),
				right = UDim.new(0, math.max(var1.right, var2.Padding.XLarge))
			}
		}, {
			ButtonConstraint = reactModule.createElement(view, {
				tag = "size-full-0 auto-y",
				sizeConstraint = { MaxSize = constantsModule.BottomBarSizeConstraint }
			}, {
				NextButton = reactModule.createElement(button, {
					LayoutOrder = 1,
					fillBehavior = foundationModule.Enums.FillBehavior.Fill,
					isDisabled = not p1.selectedCapture,
					onActivated = p1.onNextCallback,
					size = inputSize.Medium,
					text = var3.PublishingCtaContinue,
					variant = buttonVariant.Emphasis
				})
			})
		})
	})
end