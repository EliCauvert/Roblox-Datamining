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
local plusEarlyAccessUpsellBanner = gamePlayButtonModule.PlusEarlyAccessUpsellBanner
local experienceDetailsPageConstantsModule = require(script.Parent.ExperienceDetailsPageConstants)
local experienceDetailsFallbackActionBarModule = require(script.Parent.Fallback.ExperienceDetailsFallbackActionBar)
local sduiFeatureEntryPoint = require(parent.SduiSharedUtilities).SduiFeatureEntryPoint
local appPage = require(parent.RobloxAppEnums).AppPage
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactServiceTagsModule = require(parent.RoactServiceTags)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppLaunchWhenLoadingEdp = sharedFlagsModule.FFlagLuaAppLaunchWhenLoadingEdp
local fFlagEnableGameJoinEarlyAccess = sharedFlagsModule.FFlagEnableGameJoinEarlyAccess
local fFlagEnableSplitPaneEDPFix = sharedFlagsModule.FFlagEnableSplitPaneEDPFix
local var1 = if fFlagEnableSplitPaneEDPFix then "col size-full-0 auto-y gap-small bg-surface-0 align-x-center padding-x-medium padding-top-medium" else "col size-full-0 auto-y gap-small bg-surface-0 align-x-center padding-x-medium padding-top-medium stroke-default"

local function PersistentActionBarContextualMessage(p1)
	-- upvalues: useRoactService (ref), roactServiceTagsModule (ref), useTokens (ref), reactModule (ref), usePlayButtonState (ref), usePlayButtonContextualMessage (ref), view (ref), text (ref), playButtonContextualMessageImpressionsDetector (ref), appPage (ref)
	local var2 = useRoactService(roactServiceTagsModule.RoactNetworking)
	local var3 = useTokens()
	local var4 = reactModule.useRef(nil)
	local var5 = usePlayButtonState(var2, p1.universeId)
	local var6 = usePlayButtonContextualMessage(p1.universeId, var5.playButtonState, var5.playabilityStatus)
	
	return if var6 == nil or var6 == "" then nil else reactModule.createElement(view, {
		tag = "size-full-0 auto-xy",
		LayoutOrder = 2,
		testId = "--edp-persistent-action-bar-contextual-message"
	}, {
		Text = reactModule.createElement(text, {
			tag = "auto-xy text-body-medium text-wrap text-align-x-left",
			textStyle = var3.Color.Content.Emphasis,
			Text = var6,
			ref = var4
		}),
		ImpressionsDetector = reactModule.createElement(playButtonContextualMessageImpressionsDetector, {
			scrollViewPositionChangedSignal = nil,
			containerRef = var4,
			universeId = p1.universeId,
			playabilityStatus = var5.playabilityStatus,
			contextualMessage = var6,
			pageContext = appPage.GameDetail
		})
	})
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), playButton (ref), buttonSize (ref), foundationModule (ref), fFlagLuaAppLaunchWhenLoadingEdp (ref), fFlagEnableGameJoinEarlyAccess (ref), view (ref), fFlagEnableSplitPaneEDPFix (ref), var1 (ref), sduiFeatureEntryPoint (ref), appPage (ref), experienceDetailsPageConstantsModule (ref), experienceDetailsFallbackActionBarModule (ref), PersistentActionBarContextualMessage (ref), plusEarlyAccessUpsellBanner (ref)
	return reactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		[reactModule.Change.AbsoluteSize] = p1.onAbsoluteSizeChange
	}, {
		Content = reactModule.createElement(view, {
			testId = "--edp-persistent-action-bar",
			tag = if fFlagEnableSplitPaneEDPFix then {
				[var1] = true,
				["stroke-default"] = p1.showOutline ~= false,
				["padding-bottom-xsmall"] = fFlagEnableGameJoinEarlyAccess
			} elseif fFlagEnableGameJoinEarlyAccess then var1 .. " padding-bottom-xsmall" else var1
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
						useUIBloxButton = true,
						launchOnReleaseAfterUnmount = true,
						testId = "--edp-persistent-play-button",
						universeId = p1.universeId,
						referralSource = p1.referralSource,
						launchSource = p1.launchSource,
						experienceJoinData = p1.experienceJoinData,
						placeId = p1.placeIdOverride,
						buttonSize = buttonSize.Large,
						fillBehavior = foundationModule.Enums.FillBehavior.Fill,
						launchWhenLoading = if fFlagLuaAppLaunchWhenLoadingEdp then true else nil,
						enableEarlyAccessPlusTooltip = if fFlagEnableGameJoinEarlyAccess then true else nil,
						enableEarlyAccessState = if fFlagEnableGameJoinEarlyAccess then true else nil
					})
				})
			}),
			ContextualMessage = reactModule.createElement(PersistentActionBarContextualMessage, { universeId = p1.universeId }),
			PlusUpsell = if fFlagEnableGameJoinEarlyAccess then reactModule.createElement(plusEarlyAccessUpsellBanner, { LayoutOrder = 3, universeId = p1.universeId }) else nil
		})
	})
end)