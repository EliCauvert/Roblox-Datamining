local Parent = script:FindFirstAncestor("GameJoinCard").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UserTileModule = require(Parent.UserTile)
local UserTile = UserTileModule.UserTile
local LayoutMode = UserTileModule.LayoutMode
local OverlayProvider = FoundationModule.OverlayProvider
local Sheet = FoundationModule.Sheet
local View = FoundationModule.View
local Text = FoundationModule.Text
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Image = FoundationModule.Image
local Skeleton = FoundationModule.Skeleton
local UseTokensFunction = FoundationModule.Hooks.useTokens
local GuiService = game:GetService("GuiService")
local AnalyticsConstantsModule = require(script.Parent.Parent.Parent.Analytics.AnalyticsConstants)
local ViewProfileSourceValues = AnalyticsConstantsModule.viewProfileSourceValues
local CtaType = AnalyticsConstantsModule.CtaType
local UseJoinCardCtaLoadTimeModule = require(script.Parent.Parent.Parent.Analytics.useJoinCardCtaLoadTime)
local FFlagJoinCardAgeCheckUpsell = require(Parent.SharedFlags).FFlagJoinCardAgeCheckUpsell
local AgeCheckUpsellCTAModule = require(script.Parent.Parent.AgeCheckUpsellCTA)
local GameJoinCardTTIModule = require(script.Parent.Parent.Parent.Telemetry.GameJoinCardTTI)
local MobileGameJoinCardHideUserAvatar = game:DefineFastFlag("MobileGameJoinCardHideUserAvatar", false)
local MobileGameJoinCardShowExperienceNameOnly = game:DefineFastFlag("MobileGameJoinCardShowExperienceNameOnly", false)

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FoundationModule (copy), GuiService (copy), GameJoinCardTTIModule (copy), ViewProfileSourceValues (copy), FFlagJoinCardAgeCheckUpsell (copy), UseJoinCardCtaLoadTimeModule (copy), CtaType (copy), UseLocalizationFunction (copy), OverlayProvider (copy), Sheet (copy), View (copy), MobileGameJoinCardHideUserAvatar (copy), Image (copy), Skeleton (copy), MobileGameJoinCardShowExperienceNameOnly (copy), Text (copy), UserTile (copy), LayoutMode (copy), AgeCheckUpsellCTAModule (copy), Button (copy), ButtonVariant (copy), InputSize (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseOverlayResult = FoundationModule.Hooks.useOverlay()
	local NoUseOverlayResult: boolean = not UseOverlayResult or UseOverlayResult.AbsoluteSize.Y < UseOverlayResult.AbsoluteSize.X
	local Inverted = not (GuiService.ViewportDisplaySize == Enum.DisplaySize.Small and not NoUseOverlayResult)
	local UseResult = ReactModule.useCallback(function(AssetFetchStatus)
		-- upvalues: UseStateResult2 (copy), GameJoinCardTTIModule (upval)
		if AssetFetchStatus == Enum.AssetFetchStatus.Success then
			UseStateResult2(true)
			GameJoinCardTTIModule.trackBannerLoaded()
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: GameJoinCardTTIModule (upval)
		GameJoinCardTTIModule.trackCardMounted()
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), ViewProfileSourceValues (upval)
		p1.onViewProfile(ViewProfileSourceValues.UserTile)
	end, { p1 })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), ViewProfileSourceValues (upval)
		p1.onViewProfile(ViewProfileSourceValues.ViewProfileButton)
	end, { p1 })
	local ScaledFontSize = UseTokensResult.Typography.TitleMedium.FontSize * UseTokensResult.Typography.TitleMedium.LineHeight
	local NewScaledFontSize = ScaledFontSize + UseTokensResult.Typography.BodyMedium.FontSize * UseTokensResult.Typography.BodyMedium.LineHeight + UseTokensResult.Padding.Small
	local YOffset = 88 + NewScaledFontSize
	local IsAgeCheckRequired: boolean = FFlagJoinCardAgeCheckUpsell and p1.ageCheckRequired == true
	
	if FFlagJoinCardAgeCheckUpsell then
		UseJoinCardCtaLoadTimeModule({
			isLoading = p1.isLoading,
			ctaType = if IsAgeCheckRequired then CtaType.AgeCheckUnlock else CtaType.Join,
			wasCached = p1.wasPlayabilityCached
		})
	end
	local UseLocalizationResult = UseLocalizationFunction({
		join = "Feature.Profile.Action.JoinGame",
		viewProfile = "Feature.Profile.Action.ViewProfile",
		chat = "Feature.Profile.Action.Chat",
		playingExperience = {
			"Feature.Profile.Label.PlayingExperience",
			experienceName = p1.experienceName
		},
		userIsPlayingExperience = {
			"Feature.Profile.Label.UserIsPlayingExperience",
			userName = p1.playerName,
			experienceName = p1.experienceName
		},
		chatWithName = {
			"Feature.Home.PeopleList.ChatWith",
			username = p1.playerName
		}
	})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ref = UseStateResult2_1
	}, {
		SheetProvider = UseStateResult1 and ReactModule.createElement(OverlayProvider, { gui = UseStateResult1 }, {
			SheetRoot = ReactModule.createElement(Sheet.Root, { preferCenterSheet = true, onClose = p1.onClose }, {
				Content = ReactModule.createElement(Sheet.Content, nil, {
					BottomPadding = if Inverted then ReactModule.createElement("UIPadding", {
						PaddingBottom = UDim.new(0, UseTokensResult.Padding.Medium)
					}) else nil,
					Layout = ReactModule.createElement(View, { tag = "col gap-medium size-full-0 auto-y" }, {
						BannerImageContainer = ReactModule.createElement(View, {
							tag = "size-full-0",
							LayoutOrder = 1,
							Size = if MobileGameJoinCardHideUserAvatar then UDim2.new(1, 0, 0, 187 - UseTokensResult.Padding.XLarge) else UDim2.new(1, 0, 0, 111)
						}, {
							BannerImageClipper = ReactModule.createElement(View, {
								tag = "clip",
								Position = UDim2.new(0, -UseTokensResult.Padding.XLarge, 0, -UseTokensResult.Padding.XLarge),
								Size = UDim2.new(1, 40, 0, 187)
							}, {
								BannerImageCanvas = ReactModule.createElement("CanvasGroup", {
									BackgroundTransparency = 1,
									GroupTransparency = 0,
									Size = UDim2.new(1, 0, 0, 202)
								}, {
									Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 15) }),
									BannerImage = ReactModule.createElement(Image, {
										BackgroundTransparency = 1,
										ZIndex = 2,
										Image = p1.bannerImageUrl,
										Size = UDim2.fromScale(1, 1),
										ScaleType = Enum.ScaleType.Crop,
										onLoaded = UseResult
									}),
									BannerSkeleton = if UseStateResult then nil else ReactModule.createElement(Skeleton, { ZIndex = 1, Size = UDim2.fromScale(1, 1) })
								})
							})
						}),
						UserTileWrapper = if p1.userId then ReactModule.createElement(View, {
							ZIndex = 2,
							LayoutOrder = 2,
							Size = if MobileGameJoinCardShowExperienceNameOnly then UDim2.new(1, 0, 0, ScaledFontSize) elseif MobileGameJoinCardHideUserAvatar then UDim2.new(1, 0, 0, NewScaledFontSize) else UDim2.new(1, 0, 0, YOffset)
						}, {
							Tile = if MobileGameJoinCardShowExperienceNameOnly then ReactModule.createElement(View, { tag = "row align-x-center align-y-center size-full" }, {
								ExperienceText = ReactModule.createElement(Text, {
									tag = "shrink auto-xy text-align-x-center content-emphasis",
									LayoutOrder = 1,
									RichText = true,
									fontStyle = UseTokensResult.Typography.TitleMedium,
									Text = p1.experienceName,
									TextTruncate = Enum.TextTruncate.AtEnd
								})
							}) elseif MobileGameJoinCardHideUserAvatar then ReactModule.createElement(View, { tag = "col align-x-center align-y-center size-full" }, {
								CombinedText = ReactModule.createElement(Text, {
									tag = "shrink auto-xy text-wrap text-align-x-center content-default",
									LayoutOrder = 1,
									RichText = true,
									fontStyle = UseTokensResult.Typography.BodyMedium,
									Text = UseLocalizationResult.userIsPlayingExperience
								})
							}) else ReactModule.createElement(UserTile, {
								userId = p1.userId,
								title = p1.playerName,
								subtitle = UseLocalizationResult.playingExperience,
								layoutMode = LayoutMode.compact,
								avatarSize = UDim2.fromOffset(88, 88),
								backplateStyle = UseTokensResult.Color.Surface.Surface_100,
								onActivated = UseResult1
							})
						}) else nil,
						Buttons = ReactModule.createElement(View, {
							tag = "col gap-small size-full-0 auto-y",
							LayoutOrder = 3
						}, {
							PrimaryButton = if IsAgeCheckRequired then ReactModule.createElement(AgeCheckUpsellCTAModule, {
								LayoutOrder = 1,
								onUnlockPressed = p1.onAgeCheckPressed or function() end
							}) else ReactModule.createElement(Button, {
								LayoutOrder = 1,
								text = UseLocalizationResult.join,
								onActivated = p1.onJoin,
								variant = ButtonVariant.Emphasis,
								inputSize = InputSize.Medium,
								isLoading = p1.isLoading,
								isDisabled = not p1.isInExperience,
								width = UDim.new(1, 0)
							}),
							ChatButton = if p1.canUsePlatformChat then ReactModule.createElement(Button, {
								LayoutOrder = 2,
								text = if MobileGameJoinCardShowExperienceNameOnly then UseLocalizationResult.chatWithName else UseLocalizationResult.chat,
								onActivated = p1.onChat,
								variant = ButtonVariant.Standard,
								inputSize = InputSize.Medium,
								width = UDim.new(1, 0)
							}) else nil,
							SecondaryButton = ReactModule.createElement(Button, {
								LayoutOrder = 3,
								text = UseLocalizationResult.viewProfile,
								onActivated = UseResult2,
								variant = ButtonVariant.Utility,
								inputSize = InputSize.Medium,
								width = UDim.new(1, 0)
							})
						})
					})
				})
			})
		})
	})
end