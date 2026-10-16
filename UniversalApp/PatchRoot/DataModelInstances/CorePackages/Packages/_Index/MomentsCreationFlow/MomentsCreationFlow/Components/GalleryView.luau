local MomentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local Parent = MomentsCreationFlow.Parent
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
local CaptureItemModule = require(MomentsCreationFlow.Components.CaptureItem)
local ScrollingGridView = MomentsCommonModule.ScrollingGridView
local UseCallbackFunction = ReactModule.useCallback
local UseContextFunction = ReactModule.useContext
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseTokensFunction = FoundationModule.Hooks.useTokens
local CreationFlowContextModule = require(MomentsCreationFlow.Context.CreationFlowContext)
local ConstantsModule = require(MomentsCreationFlow.Constants)
local CreationFlowLocalizationModule = require(MomentsCreationFlow.Enums.CreationFlowLocalization)
local EventNamesModule = require(MomentsCreationFlow.Analytics.EventNames)

return function(p1) --[[ Line: 50 ]]
	-- upvalues: UseDeviceInsetsFunction (copy), UseTokensFunction (copy), UseContextFunction (copy), CreationFlowContextModule (copy), ReactModule (copy), CryoModule (copy), EventNamesModule (copy), UseCallbackFunction (copy), CaptureItemModule (copy), View (copy), Text (copy), CreationFlowLocalizationModule (copy), Chip (copy), FoundationModule (copy), Image (copy), VideoCamera (copy), ScrollingGridView (copy), ConstantsModule (copy), Button (copy), InputSize (copy), ButtonVariant (copy)
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseTokensResult = UseTokensFunction()
	local UseContextResult = UseContextFunction(CreationFlowContextModule)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(false)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 57 ]]
		-- upvalues: UseStateResult (copy), p1 (copy), CryoModule (upval)
		return if UseStateResult then CryoModule.List.filter(p1.captures, function(p2): boolean --[[ Line: 62 ]]
			-- upvalues: UseStateResult (upval)
			return p2.CaptureType == UseStateResult
		end) else p1.captures
	end, { p1.captures, UseStateResult })
	ReactModule.useEffect(function() --[[ Line: 67 ]]
		-- upvalues: p1 (copy), UseRefResult (copy), UseContextResult (copy), EventNamesModule (upval)
		if #p1.captures == 0 and UseRefResult.current == false then
			UseRefResult.current = true
			UseContextResult.fireEvent(EventNamesModule.EditingFlowGalleryNoCapturesAvailable)
		end
	end, { p1.captures })
	
	return ReactModule.createElement(View, {
		tag = "align-x-center auto-y align-y-bottom anchor-bottom-center gap-large position-bottom-center col shrink size-full-0",
		LayoutOrder = p1.layoutOrder
	}, {
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, UseTokensResult.Padding.Large),
			PaddingBottom = UDim.new(0, (math.max(UseDeviceInsetsResult.bottom, UseTokensResult.Padding.Large)))
		}),
		FilterButtons = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "auto-y anchor-top-center gap-small position-top-center row size-full-0"
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, (math.max(UseDeviceInsetsResult.left, UseTokensResult.Padding.XLarge))),
				PaddingRight = UDim.new(0, (math.max(UseDeviceInsetsResult.right, UseTokensResult.Padding.XLarge)))
			}),
			AllChip = ReactModule.createElement(Chip, {
				LayoutOrder = 1,
				isChecked = UseStateResult == nil,
				onActivated = UseCallbackFunction(function() --[[ Line: 94 ]]
					-- upvalues: UseStateResult2 (copy)
					UseStateResult2(nil)
				end, {}),
				size = FoundationModule.Enums.ChipSize.Small,
				text = UseContextResult.getLocalization(CreationFlowLocalizationModule.GeneralAllChipLabel)
			}),
			PhotosChip = ReactModule.createElement(Chip, {
				LayoutOrder = 2,
				isChecked = UseStateResult == Enum.CaptureType.Screenshot,
				leading = Image,
				onActivated = UseCallbackFunction(function() --[[ Line: 98 ]]
					-- upvalues: UseStateResult2 (copy)
					UseStateResult2(Enum.CaptureType.Screenshot)
				end, {}),
				size = FoundationModule.Enums.ChipSize.Small,
				text = UseContextResult.getLocalization(CreationFlowLocalizationModule.GeneralPhotosChipLabel)
			}),
			VideosChip = ReactModule.createElement(Chip, {
				LayoutOrder = 3,
				isChecked = UseStateResult == Enum.CaptureType.Video,
				leading = VideoCamera,
				onActivated = UseCallbackFunction(function() --[[ Line: 102 ]]
					-- upvalues: UseStateResult2 (copy)
					UseStateResult2(Enum.CaptureType.Video)
				end, {}),
				size = FoundationModule.Enums.ChipSize.Small,
				text = UseContextResult.getLocalization(CreationFlowLocalizationModule.GeneralVideosChipLabel)
			})
		}),
		CaptureGrid = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "anchor-top-center gap-small position-top-center row shrink size-full-full"
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, UseDeviceInsetsResult.left),
				PaddingRight = UDim.new(0, UseDeviceInsetsResult.right)
			}),
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
				onShowMoreCallback = UseCallbackFunction(function() --[[ Line: 106 ]]
					-- upvalues: UseContextResult (copy)
					UseContextResult.fetchAdditionalCaptures()
				end, { UseContextResult }),
				padding = { bottom = UDim.new(0, UseTokensResult.Padding.Large) },
				renderEmptyState = UseCallbackFunction(function() --[[ Line: 83 ]]
					-- upvalues: ReactModule (upval), View (upval), Text (upval), UseContextResult (copy), CreationFlowLocalizationModule (upval)
					return ReactModule.createElement(View, { tag = "shrink size-full-full" }, {
						EmptyState = ReactModule.createElement(Text, {
							tag = "anchor-top-center auto-xy content-action-emphasis padding-large position-top-center text-align-x-center text-align-y-center text-body-medium",
							Text = UseContextResult.getLocalization(CreationFlowLocalizationModule.GeneralEmptyStateText)
						})
					})
				end, { UseContextResult }),
				renderItem = UseCallbackFunction(function(Capture, _) --[[ Line: 74 ]]
					-- upvalues: ReactModule (upval), CaptureItemModule (upval), p1 (copy)
					return ReactModule.createElement(CaptureItemModule, {
						zIndex = 1,
						capture = Capture,
						onActivated = p1.onCaptureSelected,
						selected = p1.selectedCapture == Capture
					})
				end, { p1.selectedCapture, p1.onCaptureSelected }),
				shouldShowShowMoreButton = not UseContextResult.capturesPagesIsFinished(),
				showMoreButtonText = UseContextResult.getLocalization(CreationFlowLocalizationModule.GeneralCtaShowMore)
			})
		}),
		ButtonContainer = ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = "align-x-center auto-y size-full-0"
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, (math.max(UseDeviceInsetsResult.left, UseTokensResult.Padding.XLarge))),
				PaddingRight = UDim.new(0, (math.max(UseDeviceInsetsResult.right, UseTokensResult.Padding.XLarge)))
			}),
			ButtonConstraint = ReactModule.createElement(View, {
				tag = "auto-y size-full-0",
				sizeConstraint = { MaxSize = ConstantsModule.BottomBarSizeConstraint }
			}, {
				NextButton = ReactModule.createElement(Button, {
					LayoutOrder = 1,
					fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
					isDisabled = not p1.selectedCapture,
					onActivated = p1.onNextCallback,
					size = InputSize.Medium,
					text = UseContextResult.getLocalization(CreationFlowLocalizationModule.PublishingCtaContinue),
					variant = ButtonVariant.Emphasis
				})
			})
		})
	})
end