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

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), fFlagMobileGameJoinCardThumbnailModule (ref), foundationModule (ref), guiService (ref), gameJoinCardTTIModule (ref), viewProfileSourceValues (ref), fFlagMobileGameJoinCardEDPFromThumbnailModule (ref), viewEDPsourceValues (ref), fFlagMobileGameJoinCardEDPFromTitleModule (ref), fFlagJoinCardAgeCheckUpsell (ref), useJoinCardCtaLoadTimeModule (ref), ctaType (ref), useLocalization (ref), overlayProvider (ref), sheet (ref), view (ref), mobileGameJoinCardHideUserAvatar (ref), image (ref), stateLayerAffordance (ref), skeleton (ref), mobileGameJoinCardShowExperienceNameOnly (ref), text (ref), userTile (ref), layoutMode (ref), ageCheckUpsellCTAModule (ref), button (ref), buttonVariant (ref), inputSize (ref)
	local var1 = useTokens()
	local var2, var3 = reactModule.useState(false)
	local var4 = nil
	local var5 = nil
	
	if fFlagMobileGameJoinCardThumbnailModule then
		local var6, var7 = reactModule.useState(false)
		var4 = var6
		var5 = var7
	end
	local var8
	local var9, var10 = reactModule.useState(nil)
	local var11 = foundationModule.Hooks.useOverlay()
	
	if var11 then
		var8 = var11.AbsoluteSize.Y < var11.AbsoluteSize.X
		var8 = nil
	else
		var8 = true
	end
	local var12 = not (guiService.ViewportDisplaySize == Enum.DisplaySize.Small and not var8)
	local thumbnailImageUrl = p1.thumbnailImageUrl
	local var13 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), gameJoinCardTTIModule (copy)
		if p2 == Enum.AssetFetchStatus.Success then
			var3(true)
			gameJoinCardTTIModule.trackBannerLoaded()
		end
	end, {})
	local var14 = if fFlagMobileGameJoinCardThumbnailModule then reactModule.useCallback(function(p2)
		-- upvalues: var5 (write)
		if p2 == Enum.AssetFetchStatus.Success then
			var5(true)
		end
	end, {}) else nil
	local var15 = fFlagMobileGameJoinCardThumbnailModule and (thumbnailImageUrl ~= nil and not var2)
	local var16 = if fFlagMobileGameJoinCardThumbnailModule then not var2 and not var4 else not var2
	reactModule.useEffect(function()
		-- upvalues: gameJoinCardTTIModule (copy)
		gameJoinCardTTIModule.trackCardMounted()
	end, {})
	local var17 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), viewProfileSourceValues (copy)
		p1.onViewProfile(viewProfileSourceValues.UserTile)
	end, { p1 })
	local var18 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), viewProfileSourceValues (copy)
		p1.onViewProfile(viewProfileSourceValues.ViewProfileButton)
	end, { p1 })
	local var19 = if fFlagMobileGameJoinCardEDPFromThumbnailModule then reactModule.useCallback(function()
		-- upvalues: p1 (ref), viewEDPsourceValues (copy)
		p1.onViewExperienceDetails(viewEDPsourceValues.Thumbnail)
	end, { p1.onViewExperienceDetails }) else nil
	local var20 = if fFlagMobileGameJoinCardEDPFromTitleModule then reactModule.useCallback(function()
		-- upvalues: p1 (ref), viewEDPsourceValues (copy)
		p1.onViewExperienceDetails(viewEDPsourceValues.Title)
	end, { p1.onViewExperienceDetails }) else nil
	local var21 = var1.Typography.TitleMedium.FontSize * var1.Typography.TitleMedium.LineHeight
	local var22 = var21 + var1.Typography.BodyMedium.FontSize * var1.Typography.BodyMedium.LineHeight + var1.Padding.Small
	local var23 = 88 + var22
	local var24 = fFlagJoinCardAgeCheckUpsell and p1.ageCheckRequired == true
	
	if fFlagJoinCardAgeCheckUpsell then
		useJoinCardCtaLoadTimeModule({
			isLoading = p1.isLoading,
			ctaType = if var24 then ctaType.AgeCheckUnlock else ctaType.Join,
			wasCached = p1.wasPlayabilityCached
		})
	end
	local var25 = useLocalization({
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
	local createElement = reactModule.createElement
	local var26 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ref = var10
	}
	local t_1 = {}
	local var27 = var9
	
	if var27 then
		var27 = reactModule.createElement
		var27 = var27(overlayProvider, { gui = var9 }, {
			SheetRoot = reactModule.createElement(sheet.Root, { preferCenterSheet = true, onClose = p1.onClose }, {
				Content = reactModule.createElement(sheet.Content, nil, {
					BottomPadding = if var12 then reactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, var1.Padding.Medium) }) else nil,
					Layout = reactModule.createElement(view, { tag = "col gap-medium size-full-0 auto-y" }, {
						BannerImageContainer = reactModule.createElement(view, {
							tag = "size-full-0",
							LayoutOrder = 1,
							Size = if mobileGameJoinCardHideUserAvatar then UDim2.new(1, 0, 0, 187 - var1.Padding.XLarge) else UDim2.new(1, 0, 0, 111)
						}, {
							BannerImageClipper = reactModule.createElement(view, {
								tag = "clip",
								Position = UDim2.new(0, -var1.Padding.XLarge, 0, -var1.Padding.XLarge),
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
										Image = p1.bannerImageUrl,
										Size = UDim2.fromScale(1, 1),
										ScaleType = Enum.ScaleType.Crop,
										ZIndex = if fFlagMobileGameJoinCardThumbnailModule then 3 else 2,
										onLoaded = var13,
										onActivated = if fFlagMobileGameJoinCardEDPFromThumbnailModule and var2 then var19 else nil,
										stateLayer = if fFlagMobileGameJoinCardEDPFromThumbnailModule and var2 then { affordance = stateLayerAffordance.None } else nil
									}),
									BannerThumbnail = if var15 then reactModule.createElement(image, {
										BackgroundTransparency = 1,
										ZIndex = 2,
										Image = thumbnailImageUrl,
										Size = UDim2.fromScale(1, 1),
										ScaleType = Enum.ScaleType.Crop,
										onLoaded = var14
									}) else nil,
									BannerSkeleton = if var16 then reactModule.createElement(skeleton, { ZIndex = 1, Size = UDim2.fromScale(1, 1) }) else nil
								})
							})
						}),
						UserTileWrapper = if p1.userId then reactModule.createElement(view, {
							ZIndex = 2,
							LayoutOrder = 2,
							Size = if mobileGameJoinCardShowExperienceNameOnly then UDim2.new(1, 0, 0, var21) elseif mobileGameJoinCardHideUserAvatar then UDim2.new(1, 0, 0, var22) else UDim2.new(1, 0, 0, var23)
						}, {
							Tile = if mobileGameJoinCardShowExperienceNameOnly then reactModule.createElement(view, {
								tag = "row align-x-center align-y-center size-full",
								onActivated = if fFlagMobileGameJoinCardEDPFromTitleModule then var20 else nil,
								stateLayer = if fFlagMobileGameJoinCardEDPFromTitleModule then { affordance = stateLayerAffordance.None } else nil
							}, {
								ExperienceText = reactModule.createElement(text, {
									tag = "shrink auto-xy text-align-x-center content-emphasis",
									LayoutOrder = 1,
									RichText = true,
									fontStyle = var1.Typography.TitleMedium,
									Text = p1.experienceName,
									TextTruncate = Enum.TextTruncate.AtEnd
								})
							}) elseif mobileGameJoinCardHideUserAvatar then reactModule.createElement(view, { tag = "col align-x-center align-y-center size-full" }, {
								CombinedText = reactModule.createElement(text, {
									tag = "shrink auto-xy text-wrap text-align-x-center content-default",
									LayoutOrder = 1,
									RichText = true,
									fontStyle = var1.Typography.BodyMedium,
									Text = var25.userIsPlayingExperience
								})
							}) else reactModule.createElement(userTile, {
								userId = p1.userId,
								title = p1.playerName,
								subtitle = var25.playingExperience,
								layoutMode = layoutMode.compact,
								avatarSize = UDim2.fromOffset(88, 88),
								backplateStyle = var1.Color.Surface.Surface_100,
								onActivated = var17
							})
						}) else nil,
						Buttons = reactModule.createElement(view, {
							tag = "col gap-small size-full-0 auto-y",
							LayoutOrder = 3
						}, {
							PrimaryButton = if var24 then reactModule.createElement(ageCheckUpsellCTAModule, {
								LayoutOrder = 1,
								onUnlockPressed = p1.onAgeCheckPressed or function() end
							}) else reactModule.createElement(button, {
								LayoutOrder = 1,
								text = var25.join,
								onActivated = p1.onJoin,
								variant = buttonVariant.Emphasis,
								inputSize = inputSize.Medium,
								isLoading = p1.isLoading,
								isDisabled = not p1.isInExperience,
								width = UDim.new(1, 0)
							}),
							ChatButton = if p1.canUsePlatformChat then reactModule.createElement(button, {
								LayoutOrder = 2,
								text = if mobileGameJoinCardShowExperienceNameOnly then var25.chatWithName else var25.chat,
								onActivated = p1.onChat,
								variant = buttonVariant.Standard,
								inputSize = inputSize.Medium,
								width = UDim.new(1, 0)
							}) else nil,
							SecondaryButton = reactModule.createElement(button, {
								LayoutOrder = 3,
								text = var25.viewProfile,
								onActivated = var18,
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
	t_1.SheetProvider = var27
	
	return createElement(var26, t, t_1)
end