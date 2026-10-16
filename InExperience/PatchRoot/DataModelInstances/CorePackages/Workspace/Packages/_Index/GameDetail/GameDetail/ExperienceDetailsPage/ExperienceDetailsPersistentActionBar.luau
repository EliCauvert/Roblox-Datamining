local Parent = script:FindFirstAncestor("GameDetail").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local ButtonSize = FoundationModule.Enums.ButtonSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local GamePlayButtonModule = require(Parent.GamePlayButton)
local PlayButton = GamePlayButtonModule.PlayButton
local UsePlayButtonStateFunction = GamePlayButtonModule.usePlayButtonState
local UsePlayButtonContextualMessageFunction = GamePlayButtonModule.usePlayButtonContextualMessage
local PlayButtonContextualMessageImpressionsDetector = GamePlayButtonModule.PlayButtonContextualMessageImpressionsDetector
local PlusEarlyAccessUpsellBanner = GamePlayButtonModule.PlusEarlyAccessUpsellBanner
local ExperienceDetailsPageConstantsModule = require(script.Parent.ExperienceDetailsPageConstants)
local ExperienceDetailsFallbackActionBarModule = require(script.Parent.Fallback.ExperienceDetailsFallbackActionBar)
local SduiFeatureEntryPoint = require(Parent.SduiSharedUtilities).SduiFeatureEntryPoint
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppLaunchWhenLoadingEdp = SharedFlagsModule.FFlagLuaAppLaunchWhenLoadingEdp
local FFlagEnableGameJoinEarlyAccess = SharedFlagsModule.FFlagEnableGameJoinEarlyAccess
local FFlagEnableSplitPaneEDPFix = SharedFlagsModule.FFlagEnableSplitPaneEDPFix
local ColSizeFull0AutoYGapSmallBgSurface0AlignXCenterPaddingXMediumPaddingTopMedium: string = if FFlagEnableSplitPaneEDPFix then "col size-full-0 auto-y gap-small bg-surface-0 align-x-center padding-x-medium padding-top-medium" else "col size-full-0 auto-y gap-small bg-surface-0 align-x-center padding-x-medium padding-top-medium stroke-default"

local function PersistentActionBarContextualMessage(p1) --[[ Line: 51 ]]
	-- upvalues: UseRoactServiceFunction (copy), RoactServiceTagsModule (copy), UseTokensFunction (copy), ReactModule (copy), UsePlayButtonStateFunction (copy), UsePlayButtonContextualMessageFunction (copy), View (copy), Text (copy), PlayButtonContextualMessageImpressionsDetector (copy), AppPage (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactServiceTagsModule.RoactNetworking)
	local UseTokensResult = UseTokensFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UsePlayButtonStateResult = UsePlayButtonStateFunction(UseRoactServiceResult, p1.universeId)
	local UsePlayButtonContextualMessageResult = UsePlayButtonContextualMessageFunction(p1.universeId, UsePlayButtonStateResult.playButtonState, UsePlayButtonStateResult.playabilityStatus)
	
	return if UsePlayButtonContextualMessageResult == nil or UsePlayButtonContextualMessageResult == "" then nil else ReactModule.createElement(View, {
		tag = "size-full-0 auto-xy",
		LayoutOrder = 2,
		testId = "--edp-persistent-action-bar-contextual-message"
	}, {
		Text = ReactModule.createElement(Text, {
			tag = "auto-xy text-body-medium text-wrap text-align-x-left",
			textStyle = UseTokensResult.Color.Content.Emphasis,
			Text = UsePlayButtonContextualMessageResult,
			ref = UseRefResult
		}),
		ImpressionsDetector = ReactModule.createElement(PlayButtonContextualMessageImpressionsDetector, {
			scrollViewPositionChangedSignal = nil,
			containerRef = UseRefResult,
			universeId = p1.universeId,
			playabilityStatus = UsePlayButtonStateResult.playabilityStatus,
			contextualMessage = UsePlayButtonContextualMessageResult,
			pageContext = AppPage.GameDetail
		})
	})
end

return ReactModule.memo(function(p1) --[[ Line: 89 | Named "ExperienceDetailsPersistentActionBar" ]]
	-- upvalues: ReactModule (copy), PlayButton (copy), ButtonSize (copy), FoundationModule (copy), FFlagLuaAppLaunchWhenLoadingEdp (copy), FFlagEnableGameJoinEarlyAccess (copy), View (copy), FFlagEnableSplitPaneEDPFix (copy), ColSizeFull0AutoYGapSmallBgSurface0AlignXCenterPaddingXMediumPaddingTopMedium (copy), SduiFeatureEntryPoint (copy), AppPage (copy), ExperienceDetailsPageConstantsModule (copy), ExperienceDetailsFallbackActionBarModule (copy), PersistentActionBarContextualMessage (copy), PlusEarlyAccessUpsellBanner (copy)
	return ReactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		[ReactModule.Change.AbsoluteSize] = p1.onAbsoluteSizeChange
	}, {
		Content = ReactModule.createElement(View, {
			testId = "--edp-persistent-action-bar",
			tag = if FFlagEnableSplitPaneEDPFix then {
				[ColSizeFull0AutoYGapSmallBgSurface0AlignXCenterPaddingXMediumPaddingTopMedium] = true,
				["stroke-default"] = p1.showOutline ~= false,
				["padding-bottom-xsmall"] = FFlagEnableGameJoinEarlyAccess
			} elseif FFlagEnableGameJoinEarlyAccess then ColSizeFull0AutoYGapSmallBgSurface0AlignXCenterPaddingXMediumPaddingTopMedium .. " padding-bottom-xsmall" else ColSizeFull0AutoYGapSmallBgSurface0AlignXCenterPaddingXMediumPaddingTopMedium
		}, {
			Row = ReactModule.createElement(View, {
				tag = "row size-full-0 auto-y gap-small",
				LayoutOrder = 1
			}, {
				EntryPoint = ReactModule.createElement(SduiFeatureEntryPoint, {
					LayoutOrder = 1,
					appPage = AppPage.GameDetail,
					configKey = p1.configKey,
					identifier = ExperienceDetailsPageConstantsModule.EDP_ACTION_BAR_IDENTIFIER,
					loadTimer = p1.loadTimer,
					Size = UDim2.fromScale(0, 0),
					AutomaticSize = Enum.AutomaticSize.XY,
					loadingSlot = ReactModule.createElement(ExperienceDetailsFallbackActionBarModule.Skeleton, {
						universeId = p1.universeId,
						launchSource = p1.launchSource,
						referralSource = p1.referralSource,
						experienceJoinData = p1.experienceJoinData,
						placeIdOverride = p1.placeIdOverride
					}),
					errorSlot = ReactModule.createElement(ExperienceDetailsFallbackActionBarModule.Error, {
						universeId = p1.universeId,
						launchSource = p1.launchSource,
						referralSource = p1.referralSource,
						experienceJoinData = p1.experienceJoinData,
						placeIdOverride = p1.placeIdOverride
					})
				}),
				PersistentPlayButton = ReactModule.createElement(View, { tag = "grow auto-y", LayoutOrder = 2 }, {
					PlayBtn = ReactModule.createElement(PlayButton, {
						useUIBloxButton = true,
						launchOnReleaseAfterUnmount = true,
						testId = "--edp-persistent-play-button",
						universeId = p1.universeId,
						referralSource = p1.referralSource,
						launchSource = p1.launchSource,
						experienceJoinData = p1.experienceJoinData,
						placeId = p1.placeIdOverride,
						buttonSize = ButtonSize.Large,
						fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
						launchWhenLoading = if FFlagLuaAppLaunchWhenLoadingEdp then true else nil,
						enableEarlyAccessPlusTooltip = if FFlagEnableGameJoinEarlyAccess then true else nil,
						enableEarlyAccessState = if FFlagEnableGameJoinEarlyAccess then true else nil
					})
				})
			}),
			ContextualMessage = ReactModule.createElement(PersistentActionBarContextualMessage, { universeId = p1.universeId }),
			PlusUpsell = if FFlagEnableGameJoinEarlyAccess then ReactModule.createElement(PlusEarlyAccessUpsellBanner, { LayoutOrder = 3, universeId = p1.universeId }) else nil
		})
	})
end)