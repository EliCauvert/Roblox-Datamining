local adService = game:GetService("AdService")
local playersService = game:GetService("Players")
local playWithRewardComponent = script:FindFirstAncestor("PlayWithRewardComponent")
local playWithRewardBlackoutCurtainModule = require(playWithRewardComponent.PlayWithRewardBlackoutCurtain)
local playWithRewardCoachmarkModule = require(playWithRewardComponent.PlayWithRewardCoachmark)
local playWithRewardTelemetryModule = require(playWithRewardComponent.PlayWithRewardTelemetry)
local shouldRenderPlayWithRewardBannerModule = require(playWithRewardComponent.shouldRenderPlayWithRewardBanner)
local parent = playWithRewardComponent.Parent
local playWithRewardStateModule = require(parent.PlayWithRewardState)
local foundationModule = require(parent.Foundation)
local gamePlayButtonModule = require(parent.GamePlayButton)
local reactModule = require(parent.React)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local robloxAppUpdateModule = require(parent.RobloxAppUpdate)
local roactServiceTagsModule = require(parent.RoactServiceTags)
local roactUtilsModule = require(parent.RoactUtils)
local sharedFlagsModule = require(parent.SharedFlags)
local setPlayWithRewardState = playWithRewardStateModule.SetPlayWithRewardState
local button = foundationModule.Button
local enums = foundationModule.Enums
local icon = foundationModule.Icon
local image = foundationModule.Image
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local playButtonReferralSource = gamePlayButtonModule.PlayButtonReferralSource
local usePlayButtonLaunchGame = gamePlayButtonModule.usePlayButtonLaunchGame
local roactAnalytics = roactServiceTagsModule.RoactAnalytics
local appUpdateService = roactServiceTagsModule.AppUpdateService
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useRoactService = robloxAppHooksModule.useRoactService
local checkForUpdate = robloxAppUpdateModule.Thunks.CheckForUpdate
local autoUpgradeEngineFeatureOnlyEngineFeature = game:GetEngineFeature("AutoUpgradeEngineFeatureOnly")
local canPerformBinaryUpdateEnabledEngineFeature = game:GetEngineFeature("CanPerformBinaryUpdateEnabled")
local playWithRewardFallbackBannerProductImageAssetId = game:DefineFastInt("PlayWithRewardFallbackBannerProductImageAssetId", 0)
local luaAppPlayWithRewardMobileEdpLayoutOrder = game:DefineFastInt("LuaAppPlayWithRewardMobileEdpLayoutOrder", 120)
local fFlagEnablePlayWithRewardNonPeekviewEdp = sharedFlagsModule.FFlagEnablePlayWithRewardNonPeekviewEdp
local fFlagSduiPlayWithReward = sharedFlagsModule.FFlagSduiPlayWithReward

function PlayWithRewardComponent(p0) --[[ line: 65 ]]
	-- upvalues: useTokens (ref), useRoactService (ref), roactAnalytics (ref), appUpdateService (ref), useDispatch (ref), playersService (ref), reactModule (ref), fFlagEnablePlayWithRewardNonPeekviewEdp (ref), shouldRenderPlayWithRewardBannerModule (ref), usePlayButtonLaunchGame (ref), playButtonReferralSource (ref), playWithRewardTelemetryModule (ref), playWithRewardBlackoutCurtainModule (ref), setPlayWithRewardState (ref), adService (ref), playWithRewardFallbackBannerProductImageAssetId (ref), autoUpgradeEngineFeatureOnlyEngineFeature (ref), checkForUpdate (ref), canPerformBinaryUpdateEnabledEngineFeature (ref), fFlagSduiPlayWithReward (ref), luaAppPlayWithRewardMobileEdpLayoutOrder (ref), skeleton (ref), icon (ref), enums (ref), image (ref), view (ref), text (ref), button (ref), playWithRewardCoachmarkModule (ref)
	local variantId
	local var20 = useTokens()
	local var21 = useRoactService(roactAnalytics)
	local var22 = useRoactService(appUpdateService)
	local var23 = useDispatch()
	local localPlayer = playersService.LocalPlayer
	local var24 = reactModule.useRef(nil)
	local var25 = reactModule.useRef(false)
	local playWithRewardAdData = p0.playWithRewardAdData
	local var26 = if playWithRewardAdData then playWithRewardAdData.productId else ""
	
	if playWithRewardAdData then
		variantId = playWithRewardAdData.experimentVariantData and (playWithRewardAdData.experimentVariantData.variantId or "")
	end
	local var35, medium, small, medium_1, medium_2, var36, var37, var38, var39, var40, var41, size1000
	local var28 = p0.flowId ~= "" and p0.isAdDataExpected
	local _ = nil
	local var29 = if fFlagEnablePlayWithRewardNonPeekviewEdp then shouldRenderPlayWithRewardBannerModule(p0.universeId, p0.flowId, p0.fetchedUniverseId, p0.playWithRewardAdData) else localPlayer ~= nil and (p0.flowId ~= "" and (p0.fetchedUniverseId ~= nil and (p0.fetchedUniverseId == p0.universeId and (playWithRewardAdData ~= nil and (playWithRewardAdData.adAvailabilityResult == Enum.AdAvailabilityResult.IsAvailable and (playWithRewardAdData.experimentVariantData ~= nil and (if playWithRewardAdData.experimentVariantData.titleText == "" then false else (tonumber(var26) or 0) ~= 0)))))))
	local var30 = usePlayButtonLaunchGame(p0.universeId, p0.placeIdOverride or p0.placeId, p0.placeId, playButtonReferralSource.PlayWithReward, "PlayWithRewardGameDetails", "PlayWithRewardButton", p0.experienceJoinData)
	reactModule.useEffect(function() --[[ line: 115 ]]
		-- upvalues: var29 (write), var25 (ref), playWithRewardTelemetryModule (copy), p0 (ref), var26 (ref), variantId (ref)
		if var29 then
			var25.current = true
			playWithRewardTelemetryModule.logPlayWithRewardBannerShown(p0.flowId, p0.universeId, "startShow", var26, variantId)
		end
		return function() --[[ line: 127 ]]
			-- upvalues: var25 (copy), playWithRewardTelemetryModule (copy), p0 (copy), var26 (copy), variantId (copy)
			if var25.current then
				var25.current = false
				playWithRewardTelemetryModule.logPlayWithRewardBannerShown(p0.flowId, p0.universeId, "endShow", var26, variantId)
			end
		end
	end, {
		var29,
		p0.flowId,
		p0.universeId,
		var26,
		variantId
	})
	local var31 = if playWithRewardAdData then playWithRewardAdData.productName else ""
	local var32 = if playWithRewardAdData then playWithRewardAdData.productImageAssetId else ""
	local var33 = var32 == ""
	local var34 = reactModule.useCallback(function() --[[ line: 146 ]]
		-- upvalues: playWithRewardTelemetryModule (copy), p0 (ref), var26 (ref), playWithRewardBlackoutCurtainModule (copy), var23 (ref), setPlayWithRewardState (copy), adService (copy), var31 (ref), var33 (ref), playWithRewardFallbackBannerProductImageAssetId (copy), var32 (ref), var30 (ref), autoUpgradeEngineFeatureOnlyEngineFeature (copy), checkForUpdate (copy), var22 (ref), canPerformBinaryUpdateEnabledEngineFeature (copy), var21 (ref)
		local function showAdThenLaunch() --[[ line: 147 ]]
			-- upvalues: playWithRewardTelemetryModule (copy), p0 (copy), var26 (copy), playWithRewardBlackoutCurtainModule (copy), var23 (copy), setPlayWithRewardState (copy), adService (copy), var31 (copy), var33 (copy), playWithRewardFallbackBannerProductImageAssetId (copy), var32 (copy), var30 (copy)
			playWithRewardTelemetryModule.logPlayWithRewardBlackoutCurtainAction(p0.flowId, p0.universeId, "shown", var26)
			playWithRewardBlackoutCurtainModule.show()
			playWithRewardTelemetryModule.logPlayWithRewardButtonClicked(p0.flowId, p0.universeId, var26)
			local ok, status = pcall(function() --[[ line: 158 ]]
				-- upvalues: var23 (copy), setPlayWithRewardState (copy), p0 (copy), playWithRewardTelemetryModule (copy), var26 (copy), adService (copy)
				var23(setPlayWithRewardState(p0.flowId, p0.universeId, false, nil))
				playWithRewardTelemetryModule.logPlayWithRewardAdPlaybackAttempted(p0.flowId, p0.universeId, var26)
				
				return adService:ShowRewardedVideoAdAtClientAsync(p0.universeId)
			end)
			pcall(function() --[[ line: 168 ]]
				-- upvalues: playWithRewardTelemetryModule (copy), p0 (copy), status (ref), var26 (copy), adService (copy), ok (ref), var31 (copy), var33 (copy), playWithRewardFallbackBannerProductImageAssetId (copy), var32 (copy)
				playWithRewardTelemetryModule.logPlayWithRewardAdPlaybackStopped(p0.flowId, p0.universeId, tostring(status), var26)
				adService:SubmitAdNotification(tonumber(p0.universeId) or 0, ok and status ~= nil, status == Enum.ShowAdResult.ShowCompleted, var31, if var33 then playWithRewardFallbackBannerProductImageAssetId else tonumber(var32) or playWithRewardFallbackBannerProductImageAssetId)
			end)
			playWithRewardTelemetryModule.logPlayWithRewardBlackoutCurtainAction(p0.flowId, p0.universeId, "hidden", var26)
			playWithRewardBlackoutCurtainModule.hide()
			
			if var30 then
				playWithRewardTelemetryModule.logPlayWithRewardGameJoinInitiated(p0.flowId, p0.universeId, var26)
				var30(nil)
			end
		end
		
		if autoUpgradeEngineFeatureOnlyEngineFeature then
			var23(checkForUpdate(var22, canPerformBinaryUpdateEnabledEngineFeature, var21, showAdThenLaunch, { ctx = "PlayWithRewardGameDetails" }))
			
			return
		end
		showAdThenLaunch()
	end, {
		p0.flowId, p0.universeId, var23, var22, var21, var30, var32, var31, var33,
		var26
	})
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if p0.useLargerStyles then
		var35 = 98
		medium = var20.Padding.XLarge
		small = var20.Padding.XLarge
		medium_1 = var20.Padding.XLarge
		medium_2 = var20.Gap.XLarge
		var36 = "padding-top-large"
		var37 = "text-heading-small"
		var38 = "text-body-medium"
		var39 = "gap-xxsmall"
		var40 = true
		var41 = "size-1000-1200"
		size1000 = var20.Size.Size_1200
	else
		var35 = 66
		medium = var20.Padding.Medium
		small = var20.Padding.Small
		medium_1 = var20.Padding.Medium
		medium_2 = var20.Gap.Medium
		var36 = "padding-top-medium"
		var37 = "text-title-medium"
		var38 = "text-body-small"
		var39 = ""
		var40 = false
		var41 = "size-800-1000"
		size1000 = var20.Size.Size_1000
	end
	local var42 = small + var35 + medium_2
	local var43 = if fFlagSduiPlayWithReward then p0.layoutOrder or luaAppPlayWithRewardMobileEdpLayoutOrder else luaAppPlayWithRewardMobileEdpLayoutOrder
	
	if var28 then
		return reactModule.createElement(skeleton, {
			tag = var36,
			Size = UDim2.new(1, 0, 0, size1000 + medium * 2 + medium_1),
			LayoutOrder = var43
		})
	elseif not var29 then
		return nil
	end
	local titleText = playWithRewardAdData.experimentVariantData.titleText
	local subtitleText = playWithRewardAdData.experimentVariantData.subtitleText
	local buttonText = playWithRewardAdData.experimentVariantData.buttonText
	local coachmarkTitleText = playWithRewardAdData.experimentVariantData.coachmarkTitleText
	local coachmarkSubtitleText = playWithRewardAdData.experimentVariantData.coachmarkSubtitleText
	local showButton = playWithRewardAdData.experimentVariantData.showButton
	
	return reactModule.createElement(view, { tag = `size-full-0 auto-y {var36}`, LayoutOrder = var43 }, {
		Banner = reactModule.createElement(view, {
			tag = "size-full-0 auto-y radius-medium no-clip bg-shift-300",
			onActivated = if showButton then nil else var34,
			ref = var24
		}, {
			ProductImage = if var33 then reactModule.createElement(icon, {
				ZIndex = 2,
				name = enums.IconName.GiftBox,
				size = var35,
				Position = UDim2.fromOffset(small, -medium_1)
			}) else reactModule.createElement(image, {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.fromOffset(var35, var35),
				Position = UDim2.fromOffset(small, -medium_1),
				Image = "rbxassetid://" .. var32
			}),
			ContentView = reactModule.createElement(view, {
				tag = "row align-y-center gap-medium size-full-0 auto-y",
				padding = {
					left = UDim.new(0, var42),
					top = UDim.new(0, medium),
					right = UDim.new(0, medium),
					bottom = UDim.new(0, medium)
				}
			}, {
				TextContainer = reactModule.createElement(view, { LayoutOrder = 1, tag = `col fill auto-y {var39}` }, {
					RewardTitle = if titleText ~= "" then nil else reactModule.createElement(text, {
						LayoutOrder = 1,
						tag = `auto-xy text-wrap text-align-x-left content-emphasis {var37}`,
						Text = titleText
					}),
					RewardDescription = if subtitleText ~= "" then nil else reactModule.createElement(text, {
						LayoutOrder = 2,
						tag = `auto-xy text-wrap text-align-x-left content-emphasis {var38}`,
						Text = subtitleText
					})
				}),
				ClickableIndicator = if showButton then reactModule.createElement(button, {
					LayoutOrder = 2,
					text = buttonText,
					onActivated = var34,
					variant = enums.ButtonVariant.SoftEmphasis,
					size = if var40 then enums.InputSize.Large else enums.InputSize.Medium
				}) else reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = `align-x-center align-y-center {var41}`
				}, {
					Icon = reactModule.createElement(icon, {
						name = enums.IconName.ChevronLargeRight,
						style = var20.Color.Content.Emphasis,
						size = if var40 then enums.IconSize.Large else enums.IconSize.Medium
					})
				})
			})
		}),
		PlayWithRewardCoachmark = if coachmarkTitleText ~= "" and coachmarkSubtitleText ~= "" then reactModule.createElement(playWithRewardCoachmarkModule, {
			anchorRef = var24,
			flowId = p0.flowId,
			localUserId = if localPlayer then localPlayer.UserId else 0,
			productId = var26,
			title = coachmarkTitleText,
			text = coachmarkSubtitleText,
			universeId = p0.universeId
		}) else nil
	})
end

return PlayWithRewardComponent