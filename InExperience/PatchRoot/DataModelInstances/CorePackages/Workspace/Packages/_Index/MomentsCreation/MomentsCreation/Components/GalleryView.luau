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

return function(p0) --[[ line: 66 ]]
	-- upvalues: useDeviceInsets (ref), useTokens (ref), useCreationFlowStringsModule (ref), reactModule (ref), cryoModule (ref), sessionManager (ref), funnelEventNames (ref), fireAnalyticsEventModule (ref), eventNames (ref), makeCreationEventFieldsModule (ref), useCallback (ref), captureItemModule (ref), view (ref), text (ref), chip (ref), foundationModule (ref), image (ref), videoCamera (ref), scrollingGridView (ref), constantsModule (ref), button (ref), inputSize (ref), buttonVariant (ref)
	local var11 = useDeviceInsets()
	local var12 = useTokens()
	local var13 = useCreationFlowStringsModule()
	local var14, var15 = reactModule.useState(nil)
	local var16 = reactModule.useRef(false)
	local var17 = reactModule.useMemo(function() --[[ line: 73 ]]
		-- upvalues: var14 (ref), p0 (ref), cryoModule (copy)
		return if var14 then cryoModule.List.filter(p0.captures, function(p1) --[[ line: 78 ]]
			-- upvalues: var14 (copy)
			return p1.CaptureType == var14
		end) else p0.captures
	end, { p0.captures, var14 })
	reactModule.useEffect(function() --[[ line: 83 ]]
		-- upvalues: p0 (ref), var16 (ref), sessionManager (copy), funnelEventNames (copy), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy)
		if #p0.captures == 0 and var16.current == false then
			var16.current = true
			fireAnalyticsEventModule(eventNames.EditingFlowGalleryNoCapturesAvailable, makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)))
		end
	end, { p0.captures })
	local var18 = useCallback(function(p2) --[[ line: 97 ]]
		-- upvalues: p0 (ref)
		p0.onCaptureSelected(p2)
	end, { p0.onCaptureSelected })
	
	return reactModule.createElement(view, {
		tag = "col align-x-center align-y-bottom shrink gap-large position-bottom-center anchor-bottom-center size-full-0 auto-y",
		LayoutOrder = p0.layoutOrder,
		padding = {
			top = UDim.new(0, var12.Padding.Large),
			bottom = UDim.new(0, math.max(var11.bottom, var12.Padding.Large))
		}
	}, {
		FilterButtons = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row gap-small position-top-center anchor-top-center size-full-0 auto-y",
			padding = {
				left = UDim.new(0, math.max(var11.left, var12.Padding.XLarge)),
				right = UDim.new(0, math.max(var11.right, var12.Padding.XLarge))
			}
		}, {
			AllChip = reactModule.createElement(chip, {
				LayoutOrder = 1,
				isChecked = var14 == nil,
				onActivated = useCallback(function() --[[ line: 121 ]]
					-- upvalues: var15 (ref)
					var15(nil)
				end, {}),
				size = foundationModule.Enums.ChipSize.Small,
				text = var13.GeneralAllChipLabel
			}),
			PhotosChip = reactModule.createElement(chip, {
				LayoutOrder = 2,
				isChecked = var14 == Enum.CaptureType.Screenshot,
				leading = image,
				onActivated = useCallback(function() --[[ line: 125 ]]
					-- upvalues: var15 (ref)
					var15(Enum.CaptureType.Screenshot)
				end, {}),
				size = foundationModule.Enums.ChipSize.Small,
				text = var13.GeneralPhotosChipLabel
			}),
			VideosChip = reactModule.createElement(chip, {
				LayoutOrder = 3,
				isChecked = var14 == Enum.CaptureType.Video,
				leading = videoCamera,
				onActivated = useCallback(function() --[[ line: 129 ]]
					-- upvalues: var15 (ref)
					var15(Enum.CaptureType.Video)
				end, {}),
				size = foundationModule.Enums.ChipSize.Small,
				text = var13.GeneralVideosChipLabel
			})
		}),
		CaptureGrid = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row shrink gap-small position-top-center anchor-top-center size-full-full",
			padding = {
				left = UDim.new(0, var11.left),
				right = UDim.new(0, var11.right)
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
				items = var17,
				onShowMoreCallback = useCallback(function() --[[ line: 133 ]]
					-- upvalues: p0 (ref)
					if p0.onShowMore then
						p0.onShowMore()
					end
				end, { p0.onShowMore }),
				padding = { bottom = UDim.new(0, var12.Padding.Large) },
				renderEmptyState = useCallback(function() --[[ line: 110 ]]
					-- upvalues: reactModule (copy), view (copy), text (copy), var13 (ref)
					return reactModule.createElement(view, { tag = "shrink size-full-full" }, {
						EmptyState = reactModule.createElement(text, {
							tag = "position-top-center anchor-top-center auto-xy padding-large text-body-medium text-align-x-center text-align-y-center content-action-emphasis",
							Text = var13.GeneralEmptyStateText
						})
					})
				end, { var13 }),
				renderItem = useCallback(function(p3, _) --[[ line: 101 ]]
					-- upvalues: reactModule (copy), captureItemModule (copy), var18 (ref), p0 (ref)
					return reactModule.createElement(captureItemModule, {
						zIndex = 1,
						capture = p3,
						onActivated = var18,
						selected = p0.selectedCapture == p3
					})
				end, { p0.selectedCapture, var18 }),
				shouldShowShowMoreButton = p0.hasMoreCaptures == true,
				showMoreButtonText = var13.GeneralCtaShowMore
			})
		}),
		ButtonContainer = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "align-x-center size-full-0 auto-y",
			padding = {
				left = UDim.new(0, math.max(var11.left, var12.Padding.XLarge)),
				right = UDim.new(0, math.max(var11.right, var12.Padding.XLarge))
			}
		}, {
			ButtonConstraint = reactModule.createElement(view, {
				tag = "size-full-0 auto-y",
				sizeConstraint = { MaxSize = constantsModule.BottomBarSizeConstraint }
			}, {
				NextButton = reactModule.createElement(button, {
					LayoutOrder = 1,
					fillBehavior = foundationModule.Enums.FillBehavior.Fill,
					isDisabled = not p0.selectedCapture,
					onActivated = p0.onNextCallback,
					size = inputSize.Medium,
					text = var13.PublishingCtaContinue,
					variant = buttonVariant.Emphasis
				})
			})
		})
	})
end