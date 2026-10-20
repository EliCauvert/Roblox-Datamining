local AdService = game:GetService("AdService")
local Players = game:GetService("Players")
local PlayWithRewardComponent1 = script:FindFirstAncestor("PlayWithRewardComponent")
local PlayWithRewardBlackoutCurtainModule = require(PlayWithRewardComponent1.PlayWithRewardBlackoutCurtain)
local PlayWithRewardCoachmarkModule = require(PlayWithRewardComponent1.PlayWithRewardCoachmark)
local PlayWithRewardTelemetryModule = require(PlayWithRewardComponent1.PlayWithRewardTelemetry)
local ShouldRenderPlayWithRewardBannerModule = require(PlayWithRewardComponent1.shouldRenderPlayWithRewardBanner)
local Parent = PlayWithRewardComponent1.Parent
local PlayWithRewardStateModule = require(Parent.PlayWithRewardState)
local FoundationModule = require(Parent.Foundation)
local GamePlayButtonModule = require(Parent.GamePlayButton)
local ReactModule = require(Parent.React)
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local SharedFlagsModule = require(Parent.SharedFlags)
local SetPlayWithRewardStateFunction = PlayWithRewardStateModule.SetPlayWithRewardState
local Button = FoundationModule.Button
local Enums = FoundationModule.Enums
local Icon = FoundationModule.Icon
local Image = FoundationModule.Image
local Skeleton = FoundationModule.Skeleton
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local PlayButtonReferralSource = GamePlayButtonModule.PlayButtonReferralSource
local UsePlayButtonLaunchGameFunction = GamePlayButtonModule.usePlayButtonLaunchGame
local RoactAnalytics = RoactServiceTagsModule.RoactAnalytics
local AppUpdateService = RoactServiceTagsModule.AppUpdateService
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local HandleUpdateFunction = require(Parent.RobloxAppUpdate).HandleUpdate
local CanPerformBinaryUpdateEnabledEngineFeature = game:GetEngineFeature("CanPerformBinaryUpdateEnabled")
local FIntPlayWithRewardFallbackBannerProductImageAssetId = SharedFlagsModule.FIntPlayWithRewardFallbackBannerProductImageAssetId
local LuaAppPlayWithRewardMobileEdpLayoutOrder = game:DefineFastInt("LuaAppPlayWithRewardMobileEdpLayoutOrder", 120)
local FFlagEnablePlayWithRewardNonPeekviewEdp = SharedFlagsModule.FFlagEnablePlayWithRewardNonPeekviewEdp
local FFlagSduiPlayWithReward = SharedFlagsModule.FFlagSduiPlayWithReward
local FFlagLuaAppEnableContainedRewardUi = PlayWithRewardStateModule.FFlagLuaAppEnableContainedRewardUi

function PlayWithRewardComponent(p1)
	-- upvalues: UseTokensFunction (copy), UseRoactServiceFunction (copy), RoactAnalytics (copy), AppUpdateService (copy), UseDispatchFunction (copy), Players (copy), ReactModule (copy), FFlagEnablePlayWithRewardNonPeekviewEdp (copy), ShouldRenderPlayWithRewardBannerModule (copy), UsePlayButtonLaunchGameFunction (copy), PlayButtonReferralSource (copy), PlayWithRewardTelemetryModule (copy), PlayWithRewardBlackoutCurtainModule (copy), SetPlayWithRewardStateFunction (copy), AdService (copy), FIntPlayWithRewardFallbackBannerProductImageAssetId (copy), HandleUpdateFunction (copy), CanPerformBinaryUpdateEnabledEngineFeature (copy), FFlagLuaAppEnableContainedRewardUi (copy), FFlagSduiPlayWithReward (copy), LuaAppPlayWithRewardMobileEdpLayoutOrder (copy), Skeleton (copy), Icon (copy), Enums (copy), Image (copy), View (copy), Text (copy), Button (copy), PlayWithRewardCoachmarkModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactAnalytics)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppUpdateService)
	local UseDispatchResult = UseDispatchFunction()
	local LocalPlayer = Players.LocalPlayer
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(false)
	local PlayWithRewardAdData = p1.playWithRewardAdData
	local ProductId = PlayWithRewardAdData and PlayWithRewardAdData.productId or ""
	local VariantId = PlayWithRewardAdData and PlayWithRewardAdData.experimentVariantData and PlayWithRewardAdData.experimentVariantData.variantId or ""
	local IsAdDataExpected = p1.flowId ~= "" and p1.isAdDataExpected
	local ShouldRenderPlayWithRewardBannerModule1 = nil
	ShouldRenderPlayWithRewardBannerModule1 = if FFlagEnablePlayWithRewardNonPeekviewEdp then ShouldRenderPlayWithRewardBannerModule(p1.universeId, p1.flowId, p1.fetchedUniverseId, p1.playWithRewardAdData) else LocalPlayer ~= nil and (p1.flowId ~= "" and (p1.fetchedUniverseId ~= nil and (p1.fetchedUniverseId == p1.universeId and (PlayWithRewardAdData ~= nil and (PlayWithRewardAdData.adAvailabilityResult == Enum.AdAvailabilityResult.IsAvailable and (PlayWithRewardAdData.experimentVariantData ~= nil and (if PlayWithRewardAdData.experimentVariantData.titleText == "" then PlayWithRewardAdData.experimentVariantData.subtitleText ~= "" and (tonumber(ProductId) or 0) ~= 0 else (tonumber(ProductId) or 0) ~= 0)))))))
	local PlayWithRewardGameDetails = UsePlayButtonLaunchGameFunction(p1.universeId, p1.placeIdOverride or p1.placeId, p1.placeId, PlayButtonReferralSource.PlayWithReward, "PlayWithRewardGameDetails", "PlayWithRewardButton", p1.experienceJoinData)
	ReactModule.useEffect(function()
		-- upvalues: ShouldRenderPlayWithRewardBannerModule1 (ref), UseRefResult1 (copy), PlayWithRewardTelemetryModule (upval), p1 (copy), ProductId (copy), VariantId (copy)
		if ShouldRenderPlayWithRewardBannerModule1 then
			UseRefResult1.current = true
			PlayWithRewardTelemetryModule.logPlayWithRewardBannerShown(p1.flowId, p1.universeId, "startShow", ProductId, VariantId)
		end
		return function()
			-- upvalues: UseRefResult1 (upval), PlayWithRewardTelemetryModule (upval), p1 (upval), ProductId (upval), VariantId (upval)
			if UseRefResult1.current then
				UseRefResult1.current = false
				PlayWithRewardTelemetryModule.logPlayWithRewardBannerShown(p1.flowId, p1.universeId, "endShow", ProductId, VariantId)
			end
		end
	end, {
		ShouldRenderPlayWithRewardBannerModule1,
		p1.flowId,
		p1.universeId,
		ProductId,
		VariantId
	})
	local ProductName = if PlayWithRewardAdData then PlayWithRewardAdData.productName else ""
	local ProductImageAssetId = if PlayWithRewardAdData then PlayWithRewardAdData.productImageAssetId else ""
	local IsProductImageAssetIdMatch = ProductImageAssetId == ""
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: PlayWithRewardTelemetryModule (upval), p1 (copy), ProductId (copy), PlayWithRewardBlackoutCurtainModule (upval), UseDispatchResult (copy), SetPlayWithRewardStateFunction (upval), AdService (upval), ProductName (copy), IsProductImageAssetIdMatch (copy), FIntPlayWithRewardFallbackBannerProductImageAssetId (upval), ProductImageAssetId (copy), PlayWithRewardGameDetails (copy), HandleUpdateFunction (upval), UseRoactServiceResult1 (copy), CanPerformBinaryUpdateEnabledEngineFeature (upval), UseRoactServiceResult (copy)
		HandleUpdateFunction(UseDispatchResult, UseRoactServiceResult1, CanPerformBinaryUpdateEnabledEngineFeature, UseRoactServiceResult, "PlayWithRewardGameDetails", function()
			-- upvalues: PlayWithRewardTelemetryModule (upval), p1 (upval), ProductId (upval), PlayWithRewardBlackoutCurtainModule (upval), UseDispatchResult (upval), SetPlayWithRewardStateFunction (upval), AdService (upval), ProductName (upval), IsProductImageAssetIdMatch (upval), FIntPlayWithRewardFallbackBannerProductImageAssetId (upval), ProductImageAssetId (upval), PlayWithRewardGameDetails (upval)
			PlayWithRewardTelemetryModule.logPlayWithRewardBlackoutCurtainAction(p1.flowId, p1.universeId, "shown", ProductId)
			PlayWithRewardBlackoutCurtainModule.show()
			PlayWithRewardTelemetryModule.logPlayWithRewardButtonClicked(p1.flowId, p1.universeId, ProductId)
			local Success, Result = pcall(function()
				-- upvalues: UseDispatchResult (upval), SetPlayWithRewardStateFunction (upval), p1 (upval), PlayWithRewardTelemetryModule (upval), ProductId (upval), AdService (upval)
				UseDispatchResult(SetPlayWithRewardStateFunction(p1.flowId, p1.universeId, false, nil))
				PlayWithRewardTelemetryModule.logPlayWithRewardAdPlaybackAttempted(p1.flowId, p1.universeId, ProductId)
				
				return AdService:ShowRewardedVideoAdAtClientAsync(p1.universeId)
			end)
			pcall(function()
				-- upvalues: PlayWithRewardTelemetryModule (upval), p1 (upval), Result (copy), ProductId (upval), AdService (upval), Success (copy), ProductName (upval), IsProductImageAssetIdMatch (upval), FIntPlayWithRewardFallbackBannerProductImageAssetId (upval), ProductImageAssetId (upval)
				PlayWithRewardTelemetryModule.logPlayWithRewardAdPlaybackStopped(p1.flowId, p1.universeId, tostring(Result), ProductId)
				AdService:SubmitAdNotification(tonumber(p1.universeId) or 0, Success and Result ~= nil, Result == Enum.ShowAdResult.ShowCompleted, ProductName, if IsProductImageAssetIdMatch then FIntPlayWithRewardFallbackBannerProductImageAssetId else tonumber(ProductImageAssetId) or FIntPlayWithRewardFallbackBannerProductImageAssetId)
			end)
			PlayWithRewardTelemetryModule.logPlayWithRewardBlackoutCurtainAction(p1.flowId, p1.universeId, "hidden", ProductId)
			PlayWithRewardBlackoutCurtainModule.hide()
			
			if PlayWithRewardGameDetails then
				PlayWithRewardTelemetryModule.logPlayWithRewardGameJoinInitiated(p1.flowId, p1.universeId, ProductId)
				PlayWithRewardGameDetails(nil)
			end
		end)
	end, {
		p1.flowId, p1.universeId, UseDispatchResult, UseRoactServiceResult1,
		UseRoactServiceResult, PlayWithRewardGameDetails, ProductImageAssetId,
		ProductName, IsProductImageAssetIdMatch, ProductId
	})
	local XOffset1: number? = nil
	local Offset1 = nil
	local XOffset = nil
	local Medium = nil
	local v1: string? = nil
	local TextTitleLarge: string? = nil
	local v2: string? = nil
	local v3: string? = nil
	local Flag: boolean? = nil
	local v4: string? = nil
	local Size1000 = nil
	local Offset = nil
	local v5 = if FFlagLuaAppEnableContainedRewardUi then if p1.useLargerStyles then 108 else 76 else nil
	
	if not FFlagLuaAppEnableContainedRewardUi then
		local XLarge = nil
		if p1.useLargerStyles then
			XOffset1 = 98
			Offset1 = UseTokensResult.Padding.XLarge
			XOffset = UseTokensResult.Padding.XLarge
			Medium = UseTokensResult.Padding.XLarge
			XLarge = UseTokensResult.Gap.XLarge
			v1 = "padding-top-large"
			TextTitleLarge = "text-heading-small"
			v2 = "text-body-medium"
			v3 = "gap-xxsmall"
			Flag = true
			v4 = "size-1000-1200"
			Size1000 = UseTokensResult.Size.Size_1200
		else
			XOffset1 = 66
			Offset1 = UseTokensResult.Padding.Medium
			XOffset = UseTokensResult.Padding.Small
			Medium = UseTokensResult.Padding.Medium
			XLarge = UseTokensResult.Gap.Medium
			v1 = "padding-top-medium"
			TextTitleLarge = "text-title-medium"
			v2 = "text-body-small"
			v3 = ""
			Flag = false
			v4 = "size-800-1000"
			Size1000 = UseTokensResult.Size.Size_1000
		end
		Offset = XOffset + XOffset1 + XLarge
	end
	local LayoutOrder = FFlagSduiPlayWithReward and p1.layoutOrder or LuaAppPlayWithRewardMobileEdpLayoutOrder
	
	if IsAdDataExpected then
		return ReactModule.createElement(Skeleton, {
			tag = if FFlagLuaAppEnableContainedRewardUi then nil else v1,
			Size = UDim2.new(1, 0, 0, if FFlagLuaAppEnableContainedRewardUi then v5 else Size1000 + Offset1 * 2 + Medium),
			LayoutOrder = LayoutOrder
		})
	end
	if not ShouldRenderPlayWithRewardBannerModule1 then
		return nil
	end
	local TitleText = PlayWithRewardAdData.experimentVariantData.titleText
	local SubtitleText = PlayWithRewardAdData.experimentVariantData.subtitleText
	local ButtonText = PlayWithRewardAdData.experimentVariantData.buttonText
	local CoachmarkTitleText = PlayWithRewardAdData.experimentVariantData.coachmarkTitleText
	local CoachmarkSubtitleText = PlayWithRewardAdData.experimentVariantData.coachmarkSubtitleText
	local ShowButton = PlayWithRewardAdData.experimentVariantData.showButton
	local KeepRewardContained = FFlagLuaAppEnableContainedRewardUi and PlayWithRewardAdData.experimentVariantData.keepRewardContained
	local UserId = if LocalPlayer then LocalPlayer.UserId else 0
	local IsNotCoachmarkSubtitleTextMatch: boolean = CoachmarkTitleText ~= "" and CoachmarkSubtitleText ~= ""
	
	if FFlagLuaAppEnableContainedRewardUi then
		local XLarge = nil
		if p1.useLargerStyles then
			XOffset1 = if KeepRewardContained then 76 else 98
			Offset1 = if KeepRewardContained then UseTokensResult.Padding.Large else UseTokensResult.Padding.XLarge
			XOffset = UseTokensResult.Padding.XLarge
			Medium = UseTokensResult.Padding.XLarge
			XLarge = UseTokensResult.Gap.XLarge
			v1 = "padding-top-large"
			TextTitleLarge = if KeepRewardContained then "text-title-large" else "text-heading-small"
			v2 = "text-body-medium"
			v3 = "gap-xxsmall"
			Flag = true
			v4 = "size-1000-1200"
		else
			XOffset1 = if KeepRewardContained then 60 else 66
			Offset1 = if KeepRewardContained then UseTokensResult.Padding.Small else UseTokensResult.Padding.Medium
			XOffset = UseTokensResult.Padding.Small
			Medium = UseTokensResult.Padding.Medium
			XLarge = UseTokensResult.Gap.Medium
			v1 = "padding-top-medium"
			TextTitleLarge = "text-title-medium"
			v2 = "text-body-small"
			v3 = ""
			Flag = false
			v4 = "size-800-1000"
		end
		Offset = XOffset + XOffset1 + XLarge
	end
	local Element = if IsProductImageAssetIdMatch then ReactModule.createElement(Icon, {
		ZIndex = 2,
		name = Enums.IconName.GiftBox,
		size = XOffset1,
		Position = if KeepRewardContained then nil else UDim2.fromOffset(XOffset, -Medium)
	}) else ReactModule.createElement(Image, {
		BackgroundTransparency = 1,
		ZIndex = 2,
		Size = UDim2.fromOffset(XOffset1, XOffset1),
		Position = if KeepRewardContained then nil else UDim2.fromOffset(XOffset, -Medium),
		Image = "rbxassetid://" .. ProductImageAssetId
	})
	
	return ReactModule.createElement(View, {
		tag = if KeepRewardContained then "size-full-0 auto-y" else `size-full-0 auto-y {v1}`,
		LayoutOrder = LayoutOrder
	}, {
		Banner = ReactModule.createElement(View, {
			tag = "size-full-0 auto-y radius-medium no-clip bg-shift-300",
			onActivated = if ShowButton then nil else UseResult,
			ref = UseRefResult
		}, {
			ProductImage = if KeepRewardContained then nil else Element,
			ContentView = ReactModule.createElement(View, {
				tag = "row align-y-center gap-medium size-full-0 auto-y",
				padding = if KeepRewardContained then Offset1 else {
					left = UDim.new(0, Offset),
					top = UDim.new(0, Offset1),
					right = UDim.new(0, Offset1),
					bottom = UDim.new(0, Offset1)
				}
			}, {
				ContainedProductImage = if KeepRewardContained then Element else nil,
				TextContainer = ReactModule.createElement(View, { LayoutOrder = 1, tag = `col fill auto-y {v3}` }, {
					RewardTitle = if TitleText == "" then nil else ReactModule.createElement(Text, {
						LayoutOrder = 1,
						tag = `auto-xy text-wrap text-align-x-left content-emphasis {TextTitleLarge}`,
						Text = TitleText
					}),
					RewardDescription = if SubtitleText == "" then nil else ReactModule.createElement(Text, {
						LayoutOrder = 2,
						tag = `auto-xy text-wrap text-align-x-left content-emphasis {v2}`,
						Text = SubtitleText
					})
				}),
				ClickableIndicator = if ShowButton then ReactModule.createElement(Button, {
					LayoutOrder = 2,
					text = ButtonText,
					onActivated = UseResult,
					variant = Enums.ButtonVariant.SoftEmphasis,
					size = if Flag then Enums.InputSize.Large else Enums.InputSize.Medium
				}) else ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = `align-x-center align-y-center {v4}`
				}, {
					Icon = ReactModule.createElement(Icon, {
						name = Enums.IconName.ChevronLargeRight,
						style = UseTokensResult.Color.Content.Emphasis,
						size = if Flag then Enums.IconSize.Large else Enums.IconSize.Medium
					})
				})
			})
		}),
		PlayWithRewardCoachmark = if IsNotCoachmarkSubtitleTextMatch then ReactModule.createElement(PlayWithRewardCoachmarkModule, {
			anchorRef = UseRefResult,
			flowId = p1.flowId,
			localUserId = UserId,
			productId = ProductId,
			title = CoachmarkTitleText,
			text = CoachmarkSubtitleText,
			universeId = p1.universeId
		}) else nil
	})
end

return PlayWithRewardComponent