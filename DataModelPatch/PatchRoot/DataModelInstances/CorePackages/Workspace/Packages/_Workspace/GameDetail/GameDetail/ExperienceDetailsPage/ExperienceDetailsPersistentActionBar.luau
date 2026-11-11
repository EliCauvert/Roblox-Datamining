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
local ExperienceDetailsPageConstantsModule = require(script.Parent.ExperienceDetailsPageConstants)
local ExperienceDetailsFallbackActionBarModule = require(script.Parent.Fallback.ExperienceDetailsFallbackActionBar)
local SduiFeatureEntryPoint = require(Parent.SduiSharedUtilities).SduiFeatureEntryPoint
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppSduiEdpFallbackPlayButtonPassUiBlox = SharedFlagsModule.FFlagLuaAppSduiEdpFallbackPlayButtonPassUiBlox
local FFlagLuaAppSduiEdpFallbackPlayButtonUseUiBlox = SharedFlagsModule.FFlagLuaAppSduiEdpFallbackPlayButtonUseUiBlox
local FFlagLuaAppLaunchWhenLoadingEdp = SharedFlagsModule.FFlagLuaAppLaunchWhenLoadingEdp
local FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp = SharedFlagsModule.FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp

local function PersistentActionBarContextualMessage(p1)
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

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), View (copy), SduiFeatureEntryPoint (copy), AppPage (copy), ExperienceDetailsPageConstantsModule (copy), ExperienceDetailsFallbackActionBarModule (copy), PlayButton (copy), FFlagLuaAppSduiEdpFallbackPlayButtonPassUiBlox (copy), FFlagLuaAppSduiEdpFallbackPlayButtonUseUiBlox (copy), ButtonSize (copy), FoundationModule (copy), FFlagLuaAppLaunchWhenLoadingEdp (copy), FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp (copy), PersistentActionBarContextualMessage (copy)
	return ReactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		[ReactModule.Change.AbsoluteSize] = p1.onAbsoluteSizeChange
	}, {
		Content = ReactModule.createElement(View, {
			tag = "col size-full-0 auto-y gap-small bg-surface-0 align-x-center padding-x-medium padding-top-medium stroke-default",
			testId = "--edp-persistent-action-bar"
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
						testId = "--edp-persistent-play-button",
						universeId = p1.universeId,
						referralSource = p1.referralSource,
						launchSource = p1.launchSource,
						experienceJoinData = p1.experienceJoinData,
						useUIBloxButton = not FFlagLuaAppSduiEdpFallbackPlayButtonPassUiBlox or FFlagLuaAppSduiEdpFallbackPlayButtonUseUiBlox,
						placeId = p1.placeIdOverride,
						buttonSize = ButtonSize.Large,
						fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
						launchWhenLoading = if FFlagLuaAppLaunchWhenLoadingEdp then true else nil,
						launchOnReleaseAfterUnmount = if FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp then true else nil
					})
				})
			}),
			ContextualMessage = ReactModule.createElement(PersistentActionBarContextualMessage, { universeId = p1.universeId })
		})
	})
end)