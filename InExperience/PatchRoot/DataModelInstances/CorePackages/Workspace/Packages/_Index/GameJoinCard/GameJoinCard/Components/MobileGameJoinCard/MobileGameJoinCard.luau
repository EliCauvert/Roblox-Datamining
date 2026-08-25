local gameJoinCard = script:FindFirstAncestor("GameJoinCard")
local parent = gameJoinCard.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local userTileModule = require(parent.UserTile)
local userTile = userTileModule.UserTile
local layoutMode = userTileModule.LayoutMode
local overlayProvider = foundationModule.OverlayProvider
local sheet = foundationModule.Sheet
local view = foundationModule.View
local text = foundationModule.Text
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local useLocalization = require(parent.Localization).Hooks.useLocalization
local image = foundationModule.Image
local skeleton = foundationModule.Skeleton
local useTokens = foundationModule.Hooks.useTokens
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local guiService = game:GetService("GuiService")
local analyticsConstantsModule = require(script.Parent.Parent.Parent.Analytics.AnalyticsConstants)
local viewEDPsourceValues = analyticsConstantsModule.viewEDPsourceValues
local viewProfileSourceValues = analyticsConstantsModule.viewProfileSourceValues
local ctaType = analyticsConstantsModule.CtaType
local useJoinCardCtaLoadTimeModule = require(script.Parent.Parent.Parent.Analytics.useJoinCardCtaLoadTime)
local fFlagJoinCardAgeCheckUpsell = require(parent.SharedFlags).FFlagJoinCardAgeCheckUpsell
local ageCheckUpsellCTAModule = require(script.Parent.Parent.AgeCheckUpsellCTA)
local gameJoinCardTTIModule = require(script.Parent.Parent.Parent.Telemetry.GameJoinCardTTI)
local fFlagMobileGameJoinCardThumbnailModule = require(script.Parent.Parent.Parent.Flags.FFlagMobileGameJoinCardThumbnail)
local mobileGameJoinCardHideUserAvatar = game:DefineFastFlag("MobileGameJoinCardHideUserAvatar", false)
local mobileGameJoinCardShowExperienceNameOnly = game:DefineFastFlag("MobileGameJoinCardShowExperienceNameOnly", false)
local fFlagMobileGameJoinCardEDPFromTitleModule = require(gameJoinCard.Flags.FFlagMobileGameJoinCardEDPFromTitle)
local fFlagMobileGameJoinCardEDPFromThumbnailModule = require(gameJoinCard.Flags.FFlagMobileGameJoinCardEDPFromThumbnail)

return function(p0)
	-- upvalues: useTokens (ref), reactModule (ref), fFlagMobileGameJoinCardThumbnailModule (ref), foundationModule (ref), guiService (ref), gameJoinCardTTIModule (ref), viewProfileSourceValues (ref), fFlagMobileGameJoinCardEDPFromThumbnailModule (ref), viewEDPsourceValues (ref), fFlagMobileGameJoinCardEDPFromTitleModule (ref), fFlagJoinCardAgeCheckUpsell (ref), useJoinCardCtaLoadTimeModule (ref), ctaType (ref), useLocalization (ref), overlayProvider (ref), sheet (ref), view (ref), mobileGameJoinCardHideUserAvatar (ref), image (ref), stateLayerAffordance (ref), skeleton (ref), mobileGameJoinCardShowExperienceNameOnly (ref), text (ref), userTile (ref), layoutMode (ref), ageCheckUpsellCTAModule (ref), button (ref), buttonVariant (ref), inputSize (ref)
	local var14 = useTokens()
	local var15, var16 = reactModule.useState(false)
	local var17 = nil
	local var18 = nil
	
	if fFlagMobileGameJoinCardThumbnailModule then
		local var19, var20 = reactModule.useState(false)
		var17 = var19
		var18 = var20
	end
	local var24
	local var21, var22 = reactModule.useState(nil)
	local var23 = foundationModule.Hooks.useOverlay()
	
	if var23 then
		var24 = var23.AbsoluteSize.Y < var23.AbsoluteSize.X
		var24 = nil
	else
		var24 = true
	end
	local var25 = not (guiService.ViewportDisplaySize == Enum.DisplaySize.Small and not var24)
	local thumbnailImageUrl = p0.thumbnailImageUrl
	local var26 = reactModule.useCallback(function(p1)
		-- upvalues: var16 (ref), gameJoinCardTTIModule (copy)
		if p1 == Enum.AssetFetchStatus.Success then
			var16(true)
			gameJoinCardTTIModule.trackBannerLoaded()
		end
	end, {})
	local var27 = if fFlagMobileGameJoinCardThumbnailModule then reactModule.useCallback(function(p2)
		-- upvalues: var18 (write)
		if p2 == Enum.AssetFetchStatus.Success then
			var18(true)
		end
	end, {}) else nil
	local var28 = fFlagMobileGameJoinCardThumbnailModule and (thumbnailImageUrl ~= nil and not var15)
	local var29 = if fFlagMobileGameJoinCardThumbnailModule then not var15 and not var17 else not var15
	reactModule.useEffect(function()
		-- upvalues: gameJoinCardTTIModule (copy)
		gameJoinCardTTIModule.trackCardMounted()
	end, {})
	local var30 = reactModule.useCallback(function()
		-- upvalues: p0 (ref), viewProfileSourceValues (copy)
		p0.onViewProfile(viewProfileSourceValues.UserTile)
	end, { p0 })
	local var31 = reactModule.useCallback(function()
		-- upvalues: p0 (ref), viewProfileSourceValues (copy)
		p0.onViewProfile(viewProfileSourceValues.ViewProfileButton)
	end, { p0 })
	local var32 = if fFlagMobileGameJoinCardEDPFromThumbnailModule then reactModule.useCallback(function()
		-- upvalues: p0 (ref), viewEDPsourceValues (copy)
		p0.onViewExperienceDetails(viewEDPsourceValues.Thumbnail)
	end, { p0.onViewExperienceDetails }) else nil
	local var33 = if fFlagMobileGameJoinCardEDPFromTitleModule then reactModule.useCallback(function()
		-- upvalues: p0 (ref), viewEDPsourceValues (copy)
		p0.onViewExperienceDetails(viewEDPsourceValues.Title)
	end, { p0.onViewExperienceDetails }) else nil
	local var34 = var14.Typography.TitleMedium.FontSize * var14.Typography.TitleMedium.LineHeight
	local var35 = var34 + var14.Typography.BodyMedium.FontSize * var14.Typography.BodyMedium.LineHeight + var14.Padding.Small
	local var36 = 88 + var35
	local var37 = fFlagJoinCardAgeCheckUpsell and p0.ageCheckRequired == true
	
	if fFlagJoinCardAgeCheckUpsell then
		useJoinCardCtaLoadTimeModule({
			isLoading = p0.isLoading,
			ctaType = if var37 then ctaType.AgeCheckUnlock else ctaType.Join,
			wasCached = p0.wasPlayabilityCached
		})
	end
	local var38 = useLocalization({
		join = "Feature.Profile.Action.JoinGame",
		viewProfile = "Feature.Profile.Action.ViewProfile",
		chat = "Feature.Profile.Action.Chat",
		playingExperience = {
			"Feature.Profile.Label.PlayingExperience",
			experienceName = p0.experienceName
		},
		userIsPlayingExperience = {
			"Feature.Profile.Label.UserIsPlayingExperience",
			userName = p0.playerName,
			experienceName = p0.experienceName
		},
		chatWithName = {
			"Feature.Home.PeopleList.ChatWith",
			username = p0.playerName
		}
	})
	local createElement = reactModule.createElement
	local var39 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ref = var22
	}
	local t_1 = {}
	local var42 = var21
	
	if var42 then
		var42 = reactModule.createElement
		var42 = var42(overlayProvider, { gui = var21 }, {
			SheetRoot = reactModule.createElement(sheet.Root, { preferCenterSheet = true, onClose = p0.onClose }, {
				Content = reactModule.createElement(sheet.Content, nil, {
					BottomPadding = if var25 then reactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, var14.Padding.Medium) }) else nil,
					Layout = reactModule.createElement(view, { tag = "col gap-medium size-full-0 auto-y" }, {
						BannerImageContainer = reactModule.createElement(view, {
							tag = "size-full-0",
							LayoutOrder = 1,
							Size = if mobileGameJoinCardHideUserAvatar then UDim2.new(1, 0, 0, 187 - var14.Padding.XLarge) else UDim2.new(1, 0, 0, 111)
						}, {
							BannerImageClipper = reactModule.createElement(view, {
								tag = "clip",
								Position = UDim2.new(0, -var14.Padding.XLarge, 0, -var14.Padding.XLarge),
								Size = UDim2.new(1, 40, 0, 187)
							}, {
								BannerImageCanvas = reactModule.createElement("CanvasGroup", {
									BackgroundTransparency = 1,
									GroupTransparency = 0,
									Size = UDim2.new(1, 0, 0, 202)
								}, {
									Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 15) }),
									BannerImage = reactModule.createElement(image, {
										BackgroundTransparency = 1,
										Image = p0.bannerImageUrl,
										Size = UDim2.fromScale(1, 1),
										ScaleType = Enum.ScaleType.Crop,
										ZIndex = if fFlagMobileGameJoinCardThumbnailModule then 3 else 2,
										onLoaded = var26,
										onActivated = if fFlagMobileGameJoinCardEDPFromThumbnailModule and var15 then var32 else nil,
										stateLayer = if fFlagMobileGameJoinCardEDPFromThumbnailModule and var15 then { affordance = stateLayerAffordance.None } else nil
									}),
									BannerThumbnail = if var28 then reactModule.createElement(image, {
										BackgroundTransparency = 1,
										ZIndex = 2,
										Image = thumbnailImageUrl,
										Size = UDim2.fromScale(1, 1),
										ScaleType = Enum.ScaleType.Crop,
										onLoaded = var27
									}) else nil,
									BannerSkeleton = if var29 then reactModule.createElement(skeleton, { ZIndex = 1, Size = UDim2.fromScale(1, 1) }) else nil
								})
							})
						}),
						UserTileWrapper = if p0.userId then reactModule.createElement(view, {
							ZIndex = 2,
							LayoutOrder = 2,
							Size = if mobileGameJoinCardShowExperienceNameOnly then UDim2.new(1, 0, 0, var34) elseif mobileGameJoinCardHideUserAvatar then UDim2.new(1, 0, 0, var35) else UDim2.new(1, 0, 0, var36)
						}, {
							Tile = if mobileGameJoinCardShowExperienceNameOnly then reactModule.createElement(view, {
								tag = "row align-x-center align-y-center size-full",
								onActivated = if fFlagMobileGameJoinCardEDPFromTitleModule then var33 else nil,
								stateLayer = if fFlagMobileGameJoinCardEDPFromTitleModule then { affordance = stateLayerAffordance.None } else nil
							}, {
								ExperienceText = reactModule.createElement(text, {
									tag = "shrink auto-xy text-align-x-center content-emphasis",
									LayoutOrder = 1,
									RichText = true,
									fontStyle = var14.Typography.TitleMedium,
									Text = p0.experienceName,
									TextTruncate = Enum.TextTruncate.AtEnd
								})
							}) elseif mobileGameJoinCardHideUserAvatar then reactModule.createElement(view, { tag = "col align-x-center align-y-center size-full" }, {
								CombinedText = reactModule.createElement(text, {
									tag = "shrink auto-xy text-wrap text-align-x-center content-default",
									LayoutOrder = 1,
									RichText = true,
									fontStyle = var14.Typography.BodyMedium,
									Text = var38.userIsPlayingExperience
								})
							}) else reactModule.createElement(userTile, {
								userId = p0.userId,
								title = p0.playerName,
								subtitle = var38.playingExperience,
								layoutMode = layoutMode.compact,
								avatarSize = UDim2.fromOffset(88, 88),
								backplateStyle = var14.Color.Surface.Surface_100,
								onActivated = var30
							})
						}) else nil,
						Buttons = reactModule.createElement(view, {
							tag = "col gap-small size-full-0 auto-y",
							LayoutOrder = 3
						}, {
							PrimaryButton = if var37 then reactModule.createElement(ageCheckUpsellCTAModule, {
								LayoutOrder = 1,
								onUnlockPressed = p0.onAgeCheckPressed or function() end
							}) else reactModule.createElement(button, {
								LayoutOrder = 1,
								text = var38.join,
								onActivated = p0.onJoin,
								variant = buttonVariant.Emphasis,
								inputSize = inputSize.Medium,
								isLoading = p0.isLoading,
								isDisabled = not p0.isInExperience,
								width = UDim.new(1, 0)
							}),
							ChatButton = if p0.canUsePlatformChat then reactModule.createElement(button, {
								LayoutOrder = 2,
								text = if mobileGameJoinCardShowExperienceNameOnly then var38.chatWithName else var38.chat,
								onActivated = p0.onChat,
								variant = buttonVariant.Standard,
								inputSize = inputSize.Medium,
								width = UDim.new(1, 0)
							}) else nil,
							SecondaryButton = reactModule.createElement(button, {
								LayoutOrder = 3,
								text = var38.viewProfile,
								onActivated = var31,
								variant = buttonVariant.Utility,
								inputSize = inputSize.Medium,
								width = UDim.new(1, 0)
							})
						})
					})
				})
			})
		})
	end
	t_1.SheetProvider = var42
	
	return createElement(var39, t, t_1)
end