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
local handleUpdate = robloxAppUpdateModule.HandleUpdate
local autoUpgradeEngineFeatureOnlyEngineFeature = game:GetEngineFeature("AutoUpgradeEngineFeatureOnly")
local canPerformBinaryUpdateEnabledEngineFeature = game:GetEngineFeature("CanPerformBinaryUpdateEnabled")
local playWithRewardFallbackBannerProductImageAssetId = game:DefineFastInt("PlayWithRewardFallbackBannerProductImageAssetId", 0)
local luaAppPlayWithRewardMobileEdpLayoutOrder = game:DefineFastInt("LuaAppPlayWithRewardMobileEdpLayoutOrder", 120)
local fFlagEnablePlayWithRewardNonPeekviewEdp = sharedFlagsModule.FFlagEnablePlayWithRewardNonPeekviewEdp
local fFlagSduiPlayWithReward = sharedFlagsModule.FFlagSduiPlayWithReward
local fFlagLuaAppEnableContainedRewardUi = playWithRewardStateModule.FFlagLuaAppEnableContainedRewardUi

function PlayWithRewardComponent(p1)
	-- upvalues: useTokens (ref), useRoactService (ref), roactAnalytics (ref), appUpdateService (ref), useDispatch (ref), playersService (ref), reactModule (ref), fFlagEnablePlayWithRewardNonPeekviewEdp (ref), shouldRenderPlayWithRewardBannerModule (ref), usePlayButtonLaunchGame (ref), playButtonReferralSource (ref), playWithRewardTelemetryModule (ref), playWithRewardBlackoutCurtainModule (ref), setPlayWithRewardState (ref), adService (ref), playWithRewardFallbackBannerProductImageAssetId (ref), autoUpgradeEngineFeatureOnlyEngineFeature (ref), handleUpdate (ref), canPerformBinaryUpdateEnabledEngineFeature (ref), fFlagLuaAppEnableContainedRewardUi (ref), fFlagSduiPlayWithReward (ref), luaAppPlayWithRewardMobileEdpLayoutOrder (ref), skeleton (ref), icon (ref), enums (ref), image (ref), view (ref), text (ref), button (ref), playWithRewardCoachmarkModule (ref)
	local variantId
	local var1 = useTokens()
	local var2 = useRoactService(roactAnalytics)
	local var3 = useRoactService(appUpdateService)
	local var4 = useDispatch()
	local localPlayer = playersService.LocalPlayer
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(false)
	local playWithRewardAdData = p1.playWithRewardAdData
	local var7 = if playWithRewardAdData then playWithRewardAdData.productId else ""
	
	if playWithRewardAdData then
		variantId = playWithRewardAdData.experimentVariantData and (playWithRewardAdData.experimentVariantData.variantId or "")
	end
	local var8 = p1.flowId ~= "" and p1.isAdDataExpected
	local _ = nil
	local var9 = if fFlagEnablePlayWithRewardNonPeekviewEdp then shouldRenderPlayWithRewardBannerModule(p1.universeId, p1.flowId, p1.fetchedUniverseId, p1.playWithRewardAdData) else localPlayer ~= nil and (p1.flowId ~= "" and (p1.fetchedUniverseId ~= nil and (p1.fetchedUniverseId == p1.universeId and (playWithRewardAdData ~= nil and (playWithRewardAdData.adAvailabilityResult == Enum.AdAvailabilityResult.IsAvailable and (playWithRewardAdData.experimentVariantData ~= nil and (if playWithRewardAdData.experimentVariantData.titleText == "" then false else (tonumber(var7) or 0) ~= 0)))))))
	local var10 = usePlayButtonLaunchGame(p1.universeId, p1.placeIdOverride or p1.placeId, p1.placeId, playButtonReferralSource.PlayWithReward, "PlayWithRewardGameDetails", "PlayWithRewardButton", p1.experienceJoinData)
	reactModule.useEffect(function()
		-- upvalues: var9 (write), var6 (ref), playWithRewardTelemetryModule (copy), p1 (ref), var7 (ref), variantId (ref)
		if var9 then
			var6.current = true
			playWithRewardTelemetryModule.logPlayWithRewardBannerShown(p1.flowId, p1.universeId, "startShow", var7, variantId)
		end
		return function()
			-- upvalues: var6 (copy), playWithRewardTelemetryModule (copy), p1 (copy), var7 (copy), variantId (copy)
			if var6.current then
				var6.current = false
				playWithRewardTelemetryModule.logPlayWithRewardBannerShown(p1.flowId, p1.universeId, "endShow", var7, variantId)
			end
		end
	end, {
		var9,
		p1.flowId,
		p1.universeId,
		var7,
		variantId
	})
	local var11 = if playWithRewardAdData then playWithRewardAdData.productName else ""
	local var12 = if playWithRewardAdData then playWithRewardAdData.productImageAssetId else ""
	local var13 = var12 == ""
	local var14 = reactModule.useCallback(function()
		-- upvalues: playWithRewardTelemetryModule (copy), p1 (ref), var7 (ref), playWithRewardBlackoutCurtainModule (copy), var4 (ref), setPlayWithRewardState (copy), adService (copy), var11 (ref), var13 (ref), playWithRewardFallbackBannerProductImageAssetId (copy), var12 (ref), var10 (ref), autoUpgradeEngineFeatureOnlyEngineFeature (copy), handleUpdate (copy), var3 (ref), canPerformBinaryUpdateEnabledEngineFeature (copy), var2 (ref)
		local function showAdThenLaunch()
			-- upvalues: playWithRewardTelemetryModule (copy), p1 (copy), var7 (copy), playWithRewardBlackoutCurtainModule (copy), var4 (copy), setPlayWithRewardState (copy), adService (copy), var11 (copy), var13 (copy), playWithRewardFallbackBannerProductImageAssetId (copy), var12 (copy), var10 (copy)
			playWithRewardTelemetryModule.logPlayWithRewardBlackoutCurtainAction(p1.flowId, p1.universeId, "shown", var7)
			playWithRewardBlackoutCurtainModule.show()
			playWithRewardTelemetryModule.logPlayWithRewardButtonClicked(p1.flowId, p1.universeId, var7)
			local ok, status = pcall(function()
				-- upvalues: var4 (copy), setPlayWithRewardState (copy), p1 (copy), playWithRewardTelemetryModule (copy), var7 (copy), adService (copy)
				var4(setPlayWithRewardState(p1.flowId, p1.universeId, false, nil))
				playWithRewardTelemetryModule.logPlayWithRewardAdPlaybackAttempted(p1.flowId, p1.universeId, var7)
				
				return adService:ShowRewardedVideoAdAtClientAsync(p1.universeId)
			end)
			pcall(function()
				-- upvalues: playWithRewardTelemetryModule (copy), p1 (copy), status (ref), var7 (copy), adService (copy), ok (ref), var11 (copy), var13 (copy), playWithRewardFallbackBannerProductImageAssetId (copy), var12 (copy)
				playWithRewardTelemetryModule.logPlayWithRewardAdPlaybackStopped(p1.flowId, p1.universeId, tostring(status), var7)
				adService:SubmitAdNotification(tonumber(p1.universeId) or 0, ok and status ~= nil, status == Enum.ShowAdResult.ShowCompleted, var11, if var13 then playWithRewardFallbackBannerProductImageAssetId else tonumber(var12) or playWithRewardFallbackBannerProductImageAssetId)
			end)
			playWithRewardTelemetryModule.logPlayWithRewardBlackoutCurtainAction(p1.flowId, p1.universeId, "hidden", var7)
			playWithRewardBlackoutCurtainModule.hide()
			
			if var10 then
				playWithRewardTelemetryModule.logPlayWithRewardGameJoinInitiated(p1.flowId, p1.universeId, var7)
				var10(nil)
			end
		end
		
		if autoUpgradeEngineFeatureOnlyEngineFeature then
			handleUpdate(var4, var3, canPerformBinaryUpdateEnabledEngineFeature, var2, "PlayWithRewardGameDetails", showAdThenLaunch)
			
			return
		end
		showAdThenLaunch()
	end, {
		p1.flowId, p1.universeId, var4, var3, var2, var10, var12, var11, var13,
		var7
	})
	local var15 = nil
	local var16 = nil
	local small = nil
	local medium = nil
	local _ = nil
	local var17 = nil
	local var18 = nil
	local var19 = nil
	local var20 = nil
	local var21 = nil
	local var22 = nil
	local size1000 = nil
	local var23 = nil
	local var24 = if fFlagLuaAppEnableContainedRewardUi then if p1.useLargerStyles then 108 else 76 else nil
	
	if not fFlagLuaAppEnableContainedRewardUi then
		local xLarge
		if p1.useLargerStyles then
			var15 = 98
			var16 = var1.Padding.XLarge
			small = var1.Padding.XLarge
			medium = var1.Padding.XLarge
			xLarge = var1.Gap.XLarge
			var17 = "padding-top-large"
			var18 = "text-heading-small"
			var19 = "text-body-medium"
			var20 = "gap-xxsmall"
			var21 = true
			var22 = "size-1000-1200"
			size1000 = var1.Size.Size_1200
		else
			var15 = 66
			var16 = var1.Padding.Medium
			small = var1.Padding.Small
			medium = var1.Padding.Medium
			xLarge = var1.Gap.Medium
			var17 = "padding-top-medium"
			var18 = "text-title-medium"
			var19 = "text-body-small"
			var20 = ""
			var21 = false
			var22 = "size-800-1000"
			size1000 = var1.Size.Size_1000
		end
		var23 = small + var15 + xLarge
	end
	local var25 = if fFlagSduiPlayWithReward then p1.layoutOrder or luaAppPlayWithRewardMobileEdpLayoutOrder else luaAppPlayWithRewardMobileEdpLayoutOrder
	
	if var8 then
		return reactModule.createElement(skeleton, {
			tag = if fFlagLuaAppEnableContainedRewardUi then nil else var17,
			Size = UDim2.new(1, 0, 0, if fFlagLuaAppEnableContainedRewardUi then var24 else size1000 + var16 * 2 + medium),
			LayoutOrder = var25
		})
	elseif not var9 then
		return nil
	end
	local titleText = playWithRewardAdData.experimentVariantData.titleText
	local subtitleText = playWithRewardAdData.experimentVariantData.subtitleText
	local buttonText = playWithRewardAdData.experimentVariantData.buttonText
	local coachmarkTitleText = playWithRewardAdData.experimentVariantData.coachmarkTitleText
	local coachmarkSubtitleText = playWithRewardAdData.experimentVariantData.coachmarkSubtitleText
	local showButton = playWithRewardAdData.experimentVariantData.showButton
	local keepRewardContained = fFlagLuaAppEnableContainedRewardUi and playWithRewardAdData.experimentVariantData.keepRewardContained
	local var26 = if localPlayer then localPlayer.UserId else 0
	local var27 = coachmarkTitleText ~= "" and coachmarkSubtitleText ~= ""
	
	if fFlagLuaAppEnableContainedRewardUi then
		local xLarge_1
		if p1.useLargerStyles then
			var15 = if keepRewardContained then 76 else 98
			var16 = if keepRewardContained then var1.Padding.Large else var1.Padding.XLarge
			small = var1.Padding.XLarge
			medium = var1.Padding.XLarge
			xLarge_1 = var1.Gap.XLarge
			var17 = "padding-top-large"
			var18 = if keepRewardContained then "text-title-large" else "text-heading-small"
			var19 = "text-body-medium"
			var20 = "gap-xxsmall"
			var21 = true
			var22 = "size-1000-1200"
		else
			var15 = if keepRewardContained then 60 else 66
			var16 = if keepRewardContained then var1.Padding.Small else var1.Padding.Medium
			small = var1.Padding.Small
			medium = var1.Padding.Medium
			xLarge_1 = var1.Gap.Medium
			var17 = "padding-top-medium"
			var18 = "text-title-medium"
			var19 = "text-body-small"
			var20 = ""
			var21 = false
			var22 = "size-800-1000"
		end
		var23 = small + var15 + xLarge_1
	end
	local var28 = if var13 then reactModule.createElement(icon, {
		ZIndex = 2,
		name = enums.IconName.GiftBox,
		size = var15,
		Position = if keepRewardContained then nil else UDim2.fromOffset(small, -medium)
	}) else reactModule.createElement(image, {
		BackgroundTransparency = 1,
		ZIndex = 2,
		Size = UDim2.fromOffset(var15, var15),
		Position = if keepRewardContained then nil else UDim2.fromOffset(small, -medium),
		Image = "rbxassetid://" .. var32
	})
	
	return reactModule.createElement(view, {
		tag = if keepRewardContained then "size-full-0 auto-y" else `size-full-0 auto-y {var17}`,
		LayoutOrder = var25
	}, {
		Banner = reactModule.createElement(view, {
			tag = "size-full-0 auto-y radius-medium no-clip bg-shift-300",
			onActivated = if showButton then nil else var14,
			ref = var5
		}, {
			ProductImage = if keepRewardContained then nil else var28,
			ContentView = reactModule.createElement(view, {
				tag = "row align-y-center gap-medium size-full-0 auto-y",
				padding = if keepRewardContained then var16 else {
					left = UDim.new(0, var23),
					top = UDim.new(0, var16),
					right = UDim.new(0, var16),
					bottom = UDim.new(0, var16)
				}
			}, {
				ContainedProductImage = if keepRewardContained then var28 else nil,
				TextContainer = reactModule.createElement(view, { LayoutOrder = 1, tag = `col fill auto-y {var20}` }, {
					RewardTitle = if titleText ~= "" then nil else reactModule.createElement(text, {
						LayoutOrder = 1,
						tag = `auto-xy text-wrap text-align-x-left content-emphasis {var18}`,
						Text = titleText
					}),
					RewardDescription = if subtitleText ~= "" then nil else reactModule.createElement(text, {
						LayoutOrder = 2,
						tag = `auto-xy text-wrap text-align-x-left content-emphasis {var19}`,
						Text = subtitleText
					})
				}),
				ClickableIndicator = if showButton then reactModule.createElement(button, {
					LayoutOrder = 2,
					text = buttonText,
					onActivated = var14,
					variant = enums.ButtonVariant.SoftEmphasis,
					size = if var21 then enums.InputSize.Large else enums.InputSize.Medium
				}) else reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = `align-x-center align-y-center {var22}`
				}, {
					Icon = reactModule.createElement(icon, {
						name = enums.IconName.ChevronLargeRight,
						style = var1.Color.Content.Emphasis,
						size = if var21 then enums.IconSize.Large else enums.IconSize.Medium
					})
				})
			})
		}),
		PlayWithRewardCoachmark = if var27 then reactModule.createElement(playWithRewardCoachmarkModule, {
			anchorRef = var5,
			flowId = p1.flowId,
			localUserId = var26,
			productId = var7,
			title = coachmarkTitleText,
			text = coachmarkSubtitleText,
			universeId = p1.universeId
		}) else nil
	})
end

return PlayWithRewardComponent