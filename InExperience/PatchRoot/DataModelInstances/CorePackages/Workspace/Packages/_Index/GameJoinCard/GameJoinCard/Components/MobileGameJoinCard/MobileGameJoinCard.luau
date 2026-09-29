local gameJoinCard = script:FindFirstAncestor("GameJoinCard")
local parent = gameJoinCard.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local userTileModule = require(parent.UserTile)
local userTile = userTileModule.UserTile
local layoutMode = userTileModule.LayoutMode
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local useFocusOnMount = focusNavigationUtilsModule.useFocusOnMount
local useFocusRoot = focusNavigationUtilsModule.useFocusRoot
local inputHandlersModule = require(parent.InputHandlers)
local useMostRecentOrDefaultFocusBehavior = require(parent.ReactFocusNavigation).useMostRecentOrDefaultFocusBehavior
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
local fFlagMobileGameJoinCardGamepadSupport = require(parent.SharedFlags).FFlagMobileGameJoinCardGamepadSupport
local ageCheckUpsellCTAModule = require(script.Parent.Parent.AgeCheckUpsellCTA)
local gameJoinCardTTIModule = require(script.Parent.Parent.Parent.Telemetry.GameJoinCardTTI)
local fFlagMobileGameJoinCardThumbnailModule = require(script.Parent.Parent.Parent.Flags.FFlagMobileGameJoinCardThumbnail)
local mobileGameJoinCardHideUserAvatar = game:DefineFastFlag("MobileGameJoinCardHideUserAvatar", false)
local mobileGameJoinCardShowExperienceNameOnly = game:DefineFastFlag("MobileGameJoinCardShowExperienceNameOnly", false)
local fFlagMobileGameJoinCardEDPFromTitleModule = require(gameJoinCard.Flags.FFlagMobileGameJoinCardEDPFromTitle)
local fFlagMobileGameJoinCardEDPFromThumbnailModule = require(gameJoinCard.Flags.FFlagMobileGameJoinCardEDPFromThumbnail)
local mobileGameCardDontShowChatWith = game:DefineFastFlag("MobileGameCardDontShowChatWith", false)
local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), fFlagMobileGameJoinCardThumbnailModule (ref), foundationModule (ref), guiService (ref), fFlagMobileGameJoinCardGamepadSupport (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), t (ref), useMostRecentOrDefaultFocusBehavior (ref), useFocusOnMount (ref), gameJoinCardTTIModule (ref), viewProfileSourceValues (ref), fFlagMobileGameJoinCardEDPFromThumbnailModule (ref), viewEDPsourceValues (ref), fFlagMobileGameJoinCardEDPFromTitleModule (ref), useJoinCardCtaLoadTimeModule (ref), ctaType (ref), useLocalization (ref), overlayProvider (ref), sheet (ref), view (ref), mobileGameJoinCardHideUserAvatar (ref), image (ref), stateLayerAffordance (ref), skeleton (ref), mobileGameJoinCardShowExperienceNameOnly (ref), text (ref), userTile (ref), layoutMode (ref), ageCheckUpsellCTAModule (ref), button (ref), buttonVariant (ref), inputSize (ref), mobileGameCardDontShowChatWith (ref)
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
	local var13 = if fFlagMobileGameJoinCardGamepadSupport then reactModule.useMemo(function()
		-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), p1 (ref)
		return {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function(p2)
					-- upvalues: p1 (copy)
					p1.onClose()
					p2:cancel()
				end)
			}
		}
	end, { p1.onClose }) else nil
	local var14 = p1.isNavigationFocused ~= false
	local var15 = nil
	local var16 = nil
	
	if fFlagMobileGameJoinCardGamepadSupport then
		local var17, var18 = useMostRecentOrDefaultFocusBehavior(useFocusRoot({
			isAutoFocusRoot = true,
			shouldRestoreFocus = false,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
			eventMap = t,
			eventHandlers = var13,
			isFocusable = var14
		}))
		var15 = var17
		var16 = var18
	end
	local var19 = if var14 then if fFlagMobileGameJoinCardGamepadSupport then useFocusOnMount(var15) else nil else var15
	local var20 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), gameJoinCardTTIModule (copy)
		if p2 == Enum.AssetFetchStatus.Success then
			var3(true)
			gameJoinCardTTIModule.trackBannerLoaded()
		end
	end, {})
	local var21 = if fFlagMobileGameJoinCardThumbnailModule then reactModule.useCallback(function(p2)
		-- upvalues: var5 (write)
		if p2 == Enum.AssetFetchStatus.Success then
			var5(true)
		end
	end, {}) else nil
	local var22 = fFlagMobileGameJoinCardThumbnailModule and (thumbnailImageUrl ~= nil and not var2)
	local var23 = if fFlagMobileGameJoinCardThumbnailModule then not var2 and not var4 else not var2
	reactModule.useEffect(function()
		-- upvalues: gameJoinCardTTIModule (copy)
		gameJoinCardTTIModule.trackCardMounted()
	end, {})
	local var24 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), viewProfileSourceValues (copy)
		p1.onViewProfile(viewProfileSourceValues.UserTile)
	end, { p1 })
	local var25 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), viewProfileSourceValues (copy)
		p1.onViewProfile(viewProfileSourceValues.ViewProfileButton)
	end, { p1 })
	local var26 = if fFlagMobileGameJoinCardEDPFromThumbnailModule then reactModule.useCallback(function()
		-- upvalues: p1 (ref), viewEDPsourceValues (copy)
		p1.onViewExperienceDetails(viewEDPsourceValues.Thumbnail)
	end, { p1.onViewExperienceDetails }) else nil
	local var27 = if fFlagMobileGameJoinCardEDPFromTitleModule then reactModule.useCallback(function()
		-- upvalues: p1 (ref), viewEDPsourceValues (copy)
		p1.onViewExperienceDetails(viewEDPsourceValues.Title)
	end, { p1.onViewExperienceDetails }) else nil
	local var28 = var1.Typography.TitleMedium.FontSize * var1.Typography.TitleMedium.LineHeight
	local var29 = var28 + var1.Typography.BodyMedium.FontSize * var1.Typography.BodyMedium.LineHeight + var1.Padding.Small
	local var30 = 88 + var29
	local var31 = p1.ageCheckRequired == true
	useJoinCardCtaLoadTimeModule({
		isLoading = p1.isLoading,
		ctaType = if var31 then ctaType.AgeCheckUnlock else ctaType.Join,
		wasCached = p1.wasPlayabilityCached
	})
	local var32 = useLocalization({
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
	local var33 = "Frame"
	local t_1 = {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ref = var10
	}
	local t_2 = {}
	local var34 = var9
	
	if var34 then
		local var35
		var34 = reactModule.createElement
		local var36 = overlayProvider
		local t_3 = { gui = var9 }
		local t_4 = {}
		local createElement_1 = reactModule.createElement
		local root = sheet.Root
		local t_5 = {
			preferCenterSheet = true,
			onClose = p1.onClose,
			ref = if fFlagMobileGameJoinCardGamepadSupport then var16 else nil
		}
		local t_6 = {}
		local createElement_2 = reactModule.createElement
		local content = sheet.Content
		local var37 = nil
		local t_7 = {
			BottomPadding = if var12 then reactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, var1.Padding.Medium) }) else nil
		}
		local createElement_3 = reactModule.createElement
		local var38 = view
		local t_8 = { tag = "col gap-medium size-full-0 auto-y" }
		local t_9 = {
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
							onLoaded = var20,
							onActivated = if fFlagMobileGameJoinCardEDPFromThumbnailModule and var2 then var26 else nil,
							stateLayer = if fFlagMobileGameJoinCardEDPFromThumbnailModule and var2 then { affordance = stateLayerAffordance.None } else nil
						}),
						BannerThumbnail = if var22 then reactModule.createElement(image, {
							BackgroundTransparency = 1,
							ZIndex = 2,
							Image = thumbnailImageUrl,
							Size = UDim2.fromScale(1, 1),
							ScaleType = Enum.ScaleType.Crop,
							onLoaded = var21
						}) else nil,
						BannerSkeleton = if var23 then reactModule.createElement(skeleton, { ZIndex = 1, Size = UDim2.fromScale(1, 1) }) else nil
					})
				})
			}),
			UserTileWrapper = if p1.userId then reactModule.createElement(view, {
				ZIndex = 2,
				LayoutOrder = 2,
				Size = if mobileGameJoinCardShowExperienceNameOnly then UDim2.new(1, 0, 0, var28) elseif mobileGameJoinCardHideUserAvatar then UDim2.new(1, 0, 0, var29) else UDim2.new(1, 0, 0, var30)
			}, {
				Tile = if mobileGameJoinCardShowExperienceNameOnly then reactModule.createElement(view, {
					tag = "row align-x-center align-y-center size-full",
					onActivated = if fFlagMobileGameJoinCardEDPFromTitleModule then var27 else nil,
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
						Text = var32.userIsPlayingExperience
					})
				}) else reactModule.createElement(userTile, {
					userId = p1.userId,
					title = p1.playerName,
					subtitle = var32.playingExperience,
					layoutMode = layoutMode.compact,
					avatarSize = UDim2.fromOffset(88, 88),
					backplateStyle = var1.Color.Surface.Surface_100,
					onActivated = var24
				})
			}) else nil
		}
		local createElement_4 = reactModule.createElement
		local var39 = view
		local t_10 = {
			tag = "col gap-small size-full-0 auto-y",
			LayoutOrder = 3
		}
		local t_11 = {
			PrimaryButton = if var31 then reactModule.createElement(ageCheckUpsellCTAModule, {
				LayoutOrder = 1,
				onUnlockPressed = p1.onAgeCheckPressed or function() end,
				focusRef = if fFlagMobileGameJoinCardGamepadSupport then var19 else nil
			}) else reactModule.createElement(button, {
				LayoutOrder = 1,
				ref = if fFlagMobileGameJoinCardGamepadSupport then var19 else nil,
				text = var32.join,
				onActivated = p1.onJoin,
				variant = buttonVariant.Emphasis,
				inputSize = inputSize.Medium,
				isLoading = p1.isLoading,
				isDisabled = not p1.isInExperience,
				width = UDim.new(1, 0)
			})
		}
		
		if p1.canUsePlatformChat then
			var35 = reactModule.createElement
			var35 = var35(button, {
				LayoutOrder = 2,
				text = if mobileGameJoinCardShowExperienceNameOnly and not mobileGameCardDontShowChatWith then var32.chatWithName else var32.chat,
				onActivated = p1.onChat,
				variant = buttonVariant.Standard,
				inputSize = inputSize.Medium,
				width = UDim.new(1, 0)
			})
		else
			var35 = nil
		end
		t_11.ChatButton = var35
		t_11.SecondaryButton = reactModule.createElement(button, {
			LayoutOrder = 3,
			text = var32.viewProfile,
			onActivated = var25,
			variant = buttonVariant.Utility,
			inputSize = inputSize.Medium,
			width = UDim.new(1, 0)
		})
		t_9.Buttons = createElement_4(var39, t_10, t_11)
		t_7.Layout = createElement_3(var38, t_8, t_9)
		t_6.Content = createElement_2(content, var37, t_7)
		t_4.SheetRoot = createElement_1(root, t_5, t_6)
		var34 = var34(var36, t_3, t_4)
	end
	t_2.SheetProvider = var34
	
	return createElement(var33, t_1, t_2)
end