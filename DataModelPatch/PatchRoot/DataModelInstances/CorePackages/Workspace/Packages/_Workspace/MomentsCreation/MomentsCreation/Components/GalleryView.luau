local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Chip = FoundationModule.Chip
local InputSize = FoundationModule.Enums.InputSize
local Text = FoundationModule.Text
local View = FoundationModule.View
local Image = BuilderIconsModule.Icon.Image
local VideoCamera = BuilderIconsModule.Icon.VideoCamera
local CaptureItemModule = require(MomentsCreation.Components.CaptureItem)
local ScrollingGridView = MomentsCommonModule.ScrollingGridView
local UseCallbackFunction = ReactModule.useCallback
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ConstantsModule = require(MomentsCreation.Constants)
local FireAnalyticsEventModule = require(MomentsCreation.Analytics.fireAnalyticsEvent)
local MakeCreationEventFieldsModule = require(MomentsCreation.Analytics.makeCreationEventFields)
local UseCreationFlowStringsModule = require(MomentsCreation.Hooks.useCreationFlowStrings)
local EventNames = MomentsCommonModule.Analytics.EventNames
local SessionManager = MomentsCommonModule.Analytics.SessionManager
local FunnelEventNames = MomentsCommonModule.Analytics.FunnelEventNames

return function(p1)
	-- upvalues: UseDeviceInsetsFunction (copy), UseTokensFunction (copy), UseCreationFlowStringsModule (copy), ReactModule (copy), CryoModule (copy), SessionManager (copy), FunnelEventNames (copy), FireAnalyticsEventModule (copy), EventNames (copy), MakeCreationEventFieldsModule (copy), UseCallbackFunction (copy), CaptureItemModule (copy), View (copy), Text (copy), Chip (copy), FoundationModule (copy), Image (copy), VideoCamera (copy), ScrollingGridView (copy), ConstantsModule (copy), Button (copy), InputSize (copy), ButtonVariant (copy)
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseTokensResult = UseTokensFunction()
	local UseCreationFlowStringsModuleResult = UseCreationFlowStringsModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(false)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseStateResult (copy), p1 (copy), CryoModule (upval)
		return if UseStateResult then CryoModule.List.filter(p1.captures, function(p2): boolean
			-- upvalues: UseStateResult (upval)
			return p2.CaptureType == UseStateResult
		end) else p1.captures
	end, { p1.captures, UseStateResult })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseRefResult (copy), SessionManager (upval), FunnelEventNames (upval), FireAnalyticsEventModule (upval), EventNames (upval), MakeCreationEventFieldsModule (upval)
		if #p1.captures == 0 and UseRefResult.current == false then
			UseRefResult.current = true
			FireAnalyticsEventModule(EventNames.EditingFlowGalleryNoCapturesAvailable, MakeCreationEventFieldsModule.makeCreationBaseFields((SessionManager.getSessionId(FunnelEventNames.FunnelTypes.CreationFlow))))
		end
	end, { p1.captures })
	local UseCallbackResult = UseCallbackFunction(function(p2)
		-- upvalues: p1 (copy)
		p1.onCaptureSelected(p2)
	end, { p1.onCaptureSelected })
	
	return ReactModule.createElement(View, {
		tag = "col align-x-center align-y-bottom shrink gap-large position-bottom-center anchor-bottom-center size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		padding = {
			top = UDim.new(0, UseTokensResult.Padding.Large),
			bottom = UDim.new(0, (math.max(UseDeviceInsetsResult.bottom, UseTokensResult.Padding.Large)))
		}
	}, {
		FilterButtons = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row gap-small position-top-center anchor-top-center size-full-0 auto-y",
			padding = {
				left = UDim.new(0, (math.max(UseDeviceInsetsResult.left, UseTokensResult.Padding.XLarge))),
				right = UDim.new(0, (math.max(UseDeviceInsetsResult.right, UseTokensResult.Padding.XLarge)))
			}
		}, {
			AllChip = ReactModule.createElement(Chip, {
				LayoutOrder = 1,
				isChecked = UseStateResult == nil,
				onActivated = UseCallbackFunction(function()
					-- upvalues: UseStateResult2 (copy)
					UseStateResult2(nil)
				end, {}),
				size = FoundationModule.Enums.ChipSize.Small,
				text = UseCreationFlowStringsModuleResult.GeneralAllChipLabel
			}),
			PhotosChip = ReactModule.createElement(Chip, {
				LayoutOrder = 2,
				isChecked = UseStateResult == Enum.CaptureType.Screenshot,
				leading = Image,
				onActivated = UseCallbackFunction(function()
					-- upvalues: UseStateResult2 (copy)
					UseStateResult2(Enum.CaptureType.Screenshot)
				end, {}),
				size = FoundationModule.Enums.ChipSize.Small,
				text = UseCreationFlowStringsModuleResult.GeneralPhotosChipLabel
			}),
			VideosChip = ReactModule.createElement(Chip, {
				LayoutOrder = 3,
				isChecked = UseStateResult == Enum.CaptureType.Video,
				leading = VideoCamera,
				onActivated = UseCallbackFunction(function()
					-- upvalues: UseStateResult2 (copy)
					UseStateResult2(Enum.CaptureType.Video)
				end, {}),
				size = FoundationModule.Enums.ChipSize.Small,
				text = UseCreationFlowStringsModuleResult.GeneralVideosChipLabel
			})
		}),
		CaptureGrid = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row shrink gap-small position-top-center anchor-top-center size-full-full",
			padding = {
				left = UDim.new(0, UseDeviceInsetsResult.left),
				right = UDim.new(0, UseDeviceInsetsResult.right)
			}
		}, {
			CaptureGrid = ReactModule.createElement(ScrollingGridView, {
				aspectRatio = 1,
				layoutOrder = 1,
				itemConfig = {
					padding = 2,
					maxItemsPerRow = 5,
					minItemsPerPage = 6,
					minItemWidth = 100
				},
				items = UseMemoResult,
				onShowMoreCallback = UseCallbackFunction(function()
					-- upvalues: p1 (copy)
					if p1.onShowMore then
						p1.onShowMore()
					end
				end, { p1.onShowMore }),
				padding = { bottom = UDim.new(0, UseTokensResult.Padding.Large) },
				renderEmptyState = UseCallbackFunction(function()
					-- upvalues: ReactModule (upval), View (upval), Text (upval), UseCreationFlowStringsModuleResult (copy)
					return ReactModule.createElement(View, { tag = "shrink size-full-full" }, {
						EmptyState = ReactModule.createElement(Text, {
							tag = "position-top-center anchor-top-center auto-xy padding-large text-body-medium text-align-x-center text-align-y-center content-action-emphasis",
							Text = UseCreationFlowStringsModuleResult.GeneralEmptyStateText
						})
					})
				end, { UseCreationFlowStringsModuleResult }),
				renderItem = UseCallbackFunction(function(Capture, _)
					-- upvalues: ReactModule (upval), CaptureItemModule (upval), UseCallbackResult (copy), p1 (copy)
					return ReactModule.createElement(CaptureItemModule, {
						zIndex = 1,
						capture = Capture,
						onActivated = UseCallbackResult,
						selected = p1.selectedCapture == Capture
					})
				end, { p1.selectedCapture, UseCallbackResult }),
				shouldShowShowMoreButton = p1.hasMoreCaptures == true,
				showMoreButtonText = UseCreationFlowStringsModuleResult.GeneralCtaShowMore
			})
		}),
		ButtonContainer = ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = "align-x-center size-full-0 auto-y",
			padding = {
				left = UDim.new(0, (math.max(UseDeviceInsetsResult.left, UseTokensResult.Padding.XLarge))),
				right = UDim.new(0, (math.max(UseDeviceInsetsResult.right, UseTokensResult.Padding.XLarge)))
			}
		}, {
			ButtonConstraint = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y",
				sizeConstraint = { MaxSize = ConstantsModule.BottomBarSizeConstraint }
			}, {
				NextButton = ReactModule.createElement(Button, {
					LayoutOrder = 1,
					fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
					isDisabled = not p1.selectedCapture,
					onActivated = p1.onNextCallback,
					size = InputSize.Medium,
					text = UseCreationFlowStringsModuleResult.PublishingCtaContinue,
					variant = ButtonVariant.Emphasis
				})
			})
		})
	})
end