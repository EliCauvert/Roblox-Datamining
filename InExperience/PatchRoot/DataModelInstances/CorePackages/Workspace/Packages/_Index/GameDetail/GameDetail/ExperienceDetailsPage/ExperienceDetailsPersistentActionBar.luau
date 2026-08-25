local parent = script:FindFirstAncestor("GameDetail").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local buttonSize = foundationModule.Enums.ButtonSize
local useTokens = foundationModule.Hooks.useTokens
local gamePlayButtonModule = require(parent.GamePlayButton)
local playButton = gamePlayButtonModule.PlayButton
local usePlayButtonState = gamePlayButtonModule.usePlayButtonState
local usePlayButtonContextualMessage = gamePlayButtonModule.usePlayButtonContextualMessage
local playButtonContextualMessageImpressionsDetector = gamePlayButtonModule.PlayButtonContextualMessageImpressionsDetector
local experienceDetailsPageConstantsModule = require(script.Parent.ExperienceDetailsPageConstants)
local experienceDetailsFallbackActionBarModule = require(script.Parent.Fallback.ExperienceDetailsFallbackActionBar)
local sduiFeatureEntryPoint = require(parent.SduiSharedUtilities).SduiFeatureEntryPoint
local appPage = require(parent.RobloxAppEnums).AppPage
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactServiceTagsModule = require(parent.RoactServiceTags)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppSduiEdpFallbackPlayButtonPassUiBlox = sharedFlagsModule.FFlagLuaAppSduiEdpFallbackPlayButtonPassUiBlox
local fFlagLuaAppSduiEdpFallbackPlayButtonUseUiBlox = sharedFlagsModule.FFlagLuaAppSduiEdpFallbackPlayButtonUseUiBlox
local fFlagLuaAppLaunchWhenLoadingEdp = sharedFlagsModule.FFlagLuaAppLaunchWhenLoadingEdp
local fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp = sharedFlagsModule.FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp

local function PersistentActionBarContextualMessage(p0)
	-- upvalues: useRoactService (ref), roactServiceTagsModule (ref), useTokens (ref), reactModule (ref), usePlayButtonState (ref), usePlayButtonContextualMessage (ref), view (ref), text (ref), playButtonContextualMessageImpressionsDetector (ref), appPage (ref)
	local var8 = useRoactService(roactServiceTagsModule.RoactNetworking)
	local var9 = useTokens()
	local var10 = reactModule.useRef(nil)
	local var11 = usePlayButtonState(var8, p0.universeId)
	local var12 = usePlayButtonContextualMessage(p0.universeId, var11.playButtonState, var11.playabilityStatus)
	
	return if var12 == nil or var12 == "" then nil else reactModule.createElement(view, {
		tag = "size-full-0 auto-xy",
		LayoutOrder = 2,
		testId = "--edp-persistent-action-bar-contextual-message"
	}, {
		Text = reactModule.createElement(text, {
			tag = "auto-xy text-body-medium text-wrap text-align-x-left",
			textStyle = var9.Color.Content.Emphasis,
			Text = var12,
			ref = var10
		}),
		ImpressionsDetector = reactModule.createElement(playButtonContextualMessageImpressionsDetector, {
			scrollViewPositionChangedSignal = nil,
			containerRef = var10,
			universeId = p0.universeId,
			playabilityStatus = var11.playabilityStatus,
			contextualMessage = var12,
			pageContext = appPage.GameDetail
		})
	})
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), view (ref), sduiFeatureEntryPoint (ref), appPage (ref), experienceDetailsPageConstantsModule (ref), experienceDetailsFallbackActionBarModule (ref), playButton (ref), fFlagLuaAppSduiEdpFallbackPlayButtonPassUiBlox (ref), fFlagLuaAppSduiEdpFallbackPlayButtonUseUiBlox (ref), buttonSize (ref), foundationModule (ref), fFlagLuaAppLaunchWhenLoadingEdp (ref), fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp (ref), PersistentActionBarContextualMessage (ref)
	return reactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		[reactModule.Change.AbsoluteSize] = p1.onAbsoluteSizeChange
	}, {
		Content = reactModule.createElement(view, {
			tag = "col size-full-0 auto-y gap-small bg-surface-0 align-x-center padding-x-medium padding-top-medium stroke-default",
			testId = "--edp-persistent-action-bar"
		}, {
			Row = reactModule.createElement(view, {
				tag = "row size-full-0 auto-y gap-small",
				LayoutOrder = 1
			}, {
				EntryPoint = reactModule.createElement(sduiFeatureEntryPoint, {
					LayoutOrder = 1,
					appPage = appPage.GameDetail,
					configKey = p1.configKey,
					identifier = experienceDetailsPageConstantsModule.EDP_ACTION_BAR_IDENTIFIER,
					loadTimer = p1.loadTimer,
					Size = UDim2.fromScale(0, 0),
					AutomaticSize = Enum.AutomaticSize.XY,
					loadingSlot = reactModule.createElement(experienceDetailsFallbackActionBarModule.Skeleton, {
						universeId = p1.universeId,
						launchSource = p1.launchSource,
						referralSource = p1.referralSource,
						experienceJoinData = p1.experienceJoinData,
						placeIdOverride = p1.placeIdOverride
					}),
					errorSlot = reactModule.createElement(experienceDetailsFallbackActionBarModule.Error, {
						universeId = p1.universeId,
						launchSource = p1.launchSource,
						referralSource = p1.referralSource,
						experienceJoinData = p1.experienceJoinData,
						placeIdOverride = p1.placeIdOverride
					})
				}),
				PersistentPlayButton = reactModule.createElement(view, { tag = "grow auto-y", LayoutOrder = 2 }, {
					PlayBtn = reactModule.createElement(playButton, {
						testId = "--edp-persistent-play-button",
						universeId = p1.universeId,
						referralSource = p1.referralSource,
						launchSource = p1.launchSource,
						experienceJoinData = p1.experienceJoinData,
						useUIBloxButton = if fFlagLuaAppSduiEdpFallbackPlayButtonPassUiBlox then fFlagLuaAppSduiEdpFallbackPlayButtonUseUiBlox else true,
						placeId = p1.placeIdOverride,
						buttonSize = buttonSize.Large,
						fillBehavior = foundationModule.Enums.FillBehavior.Fill,
						launchWhenLoading = if fFlagLuaAppLaunchWhenLoadingEdp then true else nil,
						launchOnReleaseAfterUnmount = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp then true else nil
					})
				})
			}),
			ContextualMessage = reactModule.createElement(PersistentActionBarContextualMessage, { universeId = p1.universeId })
		})
	})
end)