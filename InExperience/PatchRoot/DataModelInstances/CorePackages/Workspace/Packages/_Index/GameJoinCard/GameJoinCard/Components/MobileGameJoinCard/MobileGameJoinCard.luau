local parent = script:FindFirstAncestor("GameJoinCard").Parent
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
local guiService = game:GetService("GuiService")
local analyticsConstantsModule = require(script.Parent.Parent.Parent.Analytics.AnalyticsConstants)
local viewProfileSourceValues = analyticsConstantsModule.viewProfileSourceValues
local ctaType = analyticsConstantsModule.CtaType
local useJoinCardCtaLoadTimeModule = require(script.Parent.Parent.Parent.Analytics.useJoinCardCtaLoadTime)
local fFlagJoinCardAgeCheckUpsell = require(parent.SharedFlags).FFlagJoinCardAgeCheckUpsell
local ageCheckUpsellCTAModule = require(script.Parent.Parent.AgeCheckUpsellCTA)
local gameJoinCardTTIModule = require(script.Parent.Parent.Parent.Telemetry.GameJoinCardTTI)
local mobileGameJoinCardHideUserAvatar = game:DefineFastFlag("MobileGameJoinCardHideUserAvatar", false)
local mobileGameJoinCardShowExperienceNameOnly = game:DefineFastFlag("MobileGameJoinCardShowExperienceNameOnly", false)

return function(p0) --[[ line: 67 | named "MobileGameJoinCard" ]]
	-- upvalues: useTokens (ref), reactModule (ref), foundationModule (ref), guiService (ref), gameJoinCardTTIModule (ref), viewProfileSourceValues (ref), fFlagJoinCardAgeCheckUpsell (ref), useJoinCardCtaLoadTimeModule (ref), ctaType (ref), useLocalization (ref), overlayProvider (ref), sheet (ref), view (ref), mobileGameJoinCardHideUserAvatar (ref), image (ref), skeleton (ref), mobileGameJoinCardShowExperienceNameOnly (ref), text (ref), userTile (ref), layoutMode (ref), ageCheckUpsellCTAModule (ref), button (ref), buttonVariant (ref), inputSize (ref)
	local var16
	local var10 = useTokens()
	local var11, var12 = reactModule.useState(false)
	local var13, var14 = reactModule.useState(nil)
	local var15 = foundationModule.Hooks.useOverlay()
	
	if var15 then
		var16 = var15.AbsoluteSize.Y < var15.AbsoluteSize.X
		var16 = nil
	else
		var16 = true
	end
	local var17 = not (guiService.ViewportDisplaySize == Enum.DisplaySize.Small and not var16)
	local var18 = reactModule.useCallback(function(p1) --[[ line: 75 ]]
		-- upvalues: var12 (ref), gameJoinCardTTIModule (copy)
		if p1 == Enum.AssetFetchStatus.Success then
			var12(true)
			gameJoinCardTTIModule.trackBannerLoaded()
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 82 ]]
		-- upvalues: gameJoinCardTTIModule (copy)
		gameJoinCardTTIModule.trackCardMounted()
	end, {})
	local var19 = reactModule.useCallback(function() --[[ line: 86 ]]
		-- upvalues: p0 (ref), viewProfileSourceValues (copy)
		p0.onViewProfile(viewProfileSourceValues.UserTile)
	end, { p0 })
	local var20 = reactModule.useCallback(function() --[[ line: 90 ]]
		-- upvalues: p0 (ref), viewProfileSourceValues (copy)
		p0.onViewProfile(viewProfileSourceValues.ViewProfileButton)
	end, { p0 })
	local var21 = var10.Typography.TitleMedium.FontSize * var10.Typography.TitleMedium.LineHeight
	local var22 = var21 + var10.Typography.BodyMedium.FontSize * var10.Typography.BodyMedium.LineHeight + var10.Padding.Small
	local var23 = 88 + var22
	local var24 = fFlagJoinCardAgeCheckUpsell and p0.ageCheckRequired == true
	
	if fFlagJoinCardAgeCheckUpsell then
		useJoinCardCtaLoadTimeModule({
			isLoading = p0.isLoading,
			ctaType = if var24 then ctaType.AgeCheckUnlock else ctaType.Join,
			wasCached = p0.wasPlayabilityCached
		})
	end
	local var25 = useLocalization({
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
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ref = var14
	}, {
		SheetProvider = var13 and reactModule.createElement(overlayProvider, { gui = var13 }, {
			SheetRoot = reactModule.createElement(sheet.Root, { preferCenterSheet = true, onClose = p0.onClose }, {
				Content = reactModule.createElement(sheet.Content, nil, {
					BottomPadding = if var17 then reactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, var10.Padding.Medium) }) else nil,
					Layout = reactModule.createElement(view, { tag = "col gap-medium size-full-0 auto-y" }, {
						BannerImageContainer = reactModule.createElement(view, {
							tag = "size-full-0",
							LayoutOrder = 1,
							Size = if mobileGameJoinCardHideUserAvatar then UDim2.new(1, 0, 0, 187 - var10.Padding.XLarge) else UDim2.new(1, 0, 0, 111)
						}, {
							BannerImageClipper = reactModule.createElement(view, {
								tag = "clip",
								Position = UDim2.new(0, -var10.Padding.XLarge, 0, -var10.Padding.XLarge),
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
										ZIndex = 2,
										Image = p0.bannerImageUrl,
										Size = UDim2.fromScale(1, 1),
										ScaleType = Enum.ScaleType.Crop,
										onLoaded = var18
									}),
									BannerSkeleton = if not var11 then reactModule.createElement(skeleton, { ZIndex = 1, Size = UDim2.fromScale(1, 1) }) else nil
								})
							})
						}),
						UserTileWrapper = if p0.userId then reactModule.createElement(view, {
							ZIndex = 2,
							LayoutOrder = 2,
							Size = if mobileGameJoinCardShowExperienceNameOnly then UDim2.new(1, 0, 0, var21) elseif mobileGameJoinCardHideUserAvatar then UDim2.new(1, 0, 0, var22) else UDim2.new(1, 0, 0, var23)
						}, {
							Tile = if mobileGameJoinCardShowExperienceNameOnly then reactModule.createElement(view, { tag = "row align-x-center align-y-center size-full" }, {
								ExperienceText = reactModule.createElement(text, {
									tag = "shrink auto-xy text-align-x-center content-emphasis",
									LayoutOrder = 1,
									RichText = true,
									fontStyle = var10.Typography.TitleMedium,
									Text = p0.experienceName,
									TextTruncate = Enum.TextTruncate.AtEnd
								})
							}) elseif mobileGameJoinCardHideUserAvatar then reactModule.createElement(view, { tag = "col align-x-center align-y-center size-full" }, {
								CombinedText = reactModule.createElement(text, {
									tag = "shrink auto-xy text-wrap text-align-x-center content-default",
									LayoutOrder = 1,
									RichText = true,
									fontStyle = var10.Typography.BodyMedium,
									Text = var25.userIsPlayingExperience
								})
							}) else reactModule.createElement(userTile, {
								userId = p0.userId,
								title = p0.playerName,
								subtitle = var25.playingExperience,
								layoutMode = layoutMode.compact,
								avatarSize = UDim2.fromOffset(88, 88),
								backplateStyle = var10.Color.Surface.Surface_100,
								onActivated = var19
							})
						}) else nil,
						Buttons = reactModule.createElement(view, {
							tag = "col gap-small size-full-0 auto-y",
							LayoutOrder = 3
						}, {
							PrimaryButton = if var24 then reactModule.createElement(ageCheckUpsellCTAModule, {
								LayoutOrder = 1,
								onUnlockPressed = p0.onAgeCheckPressed or function() --[[ line: 242 ]] end
							}) else reactModule.createElement(button, {
								LayoutOrder = 1,
								text = var25.join,
								onActivated = p0.onJoin,
								variant = buttonVariant.Emphasis,
								inputSize = inputSize.Medium,
								isLoading = p0.isLoading,
								isDisabled = not p0.isInExperience,
								width = UDim.new(1, 0)
							}),
							ChatButton = if p0.canUsePlatformChat then reactModule.createElement(button, {
								LayoutOrder = 2,
								text = if mobileGameJoinCardShowExperienceNameOnly then var25.chatWithName else var25.chat,
								onActivated = p0.onChat,
								variant = buttonVariant.Standard,
								inputSize = inputSize.Medium,
								width = UDim.new(1, 0)
							}) else nil,
							SecondaryButton = reactModule.createElement(button, {
								LayoutOrder = 3,
								text = var25.viewProfile,
								onActivated = var20,
								variant = buttonVariant.Utility,
								inputSize = inputSize.Medium,
								width = UDim.new(1, 0)
							})
						})
					})
				})
			})
		})
	})
end