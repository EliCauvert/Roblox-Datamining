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
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagMobileGameJoinCardGamepadSupport = sharedFlagsModule.FFlagMobileGameJoinCardGamepadSupport
local fFlagGameJoinCardOptionalActions = sharedFlagsModule.FFlagGameJoinCardOptionalActions
local useGameJoinCardGamepadNavigation = nil
local assignPrimaryFocusRef = nil

if fFlagMobileGameJoinCardGamepadSupport then
	local useGameJoinCardGamepadNavigationModule = require(gameJoinCard.Hooks.useGameJoinCardGamepadNavigation)
	useGameJoinCardGamepadNavigation = useGameJoinCardGamepadNavigationModule.useGameJoinCardGamepadNavigation
	assignPrimaryFocusRef = useGameJoinCardGamepadNavigationModule.assignPrimaryFocusRef
end
local ageCheckUpsellCTAModule = require(script.Parent.Parent.AgeCheckUpsellCTA)
local gameJoinCardTTIModule = require(script.Parent.Parent.Parent.Telemetry.GameJoinCardTTI)
local fFlagMobileGameJoinCardThumbnailModule = require(script.Parent.Parent.Parent.Flags.FFlagMobileGameJoinCardThumbnail)
local mobileGameJoinCardHideUserAvatar = game:DefineFastFlag("MobileGameJoinCardHideUserAvatar", false)
local mobileGameJoinCardShowExperienceNameOnly = game:DefineFastFlag("MobileGameJoinCardShowExperienceNameOnly", false)
local fFlagMobileGameJoinCardEDPFromTitleModule = require(gameJoinCard.Flags.FFlagMobileGameJoinCardEDPFromTitle)
local fFlagMobileGameJoinCardEDPFromThumbnailModule = require(gameJoinCard.Flags.FFlagMobileGameJoinCardEDPFromThumbnail)
local mobileGameCardDontShowChatWith = game:DefineFastFlag("MobileGameCardDontShowChatWith", false)
local fFlagJoinabilityCTARefactor = require(parent.SharedFlags).FFlagJoinabilityCTARefactor
local _ = require(gameJoinCard.Components.Actions.Types)
local buildJoinCardActionsComponentModule = require(gameJoinCard.Components.Actions.buildJoinCardActionsComponent)
local userCtaAction = require(parent.UserCtaCommon).Enums.UserCtaAction

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), fFlagMobileGameJoinCardThumbnailModule (ref), foundationModule (ref), guiService (ref), fFlagMobileGameJoinCardGamepadSupport (ref), useGameJoinCardGamepadNavigation (write), fFlagGameJoinCardOptionalActions (ref), gameJoinCardTTIModule (ref), viewProfileSourceValues (ref), fFlagMobileGameJoinCardEDPFromThumbnailModule (ref), viewEDPsourceValues (ref), fFlagMobileGameJoinCardEDPFromTitleModule (ref), fFlagJoinabilityCTARefactor (ref), userCtaAction (ref), useJoinCardCtaLoadTimeModule (ref), ctaType (ref), useLocalization (ref), skeleton (ref), assignPrimaryFocusRef (write), buildJoinCardActionsComponentModule (ref), button (ref), overlayProvider (ref), sheet (ref), view (ref), mobileGameJoinCardHideUserAvatar (ref), image (ref), stateLayerAffordance (ref), mobileGameJoinCardShowExperienceNameOnly (ref), text (ref), userTile (ref), layoutMode (ref), ageCheckUpsellCTAModule (ref), buttonVariant (ref), inputSize (ref), mobileGameCardDontShowChatWith (ref)
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
	local var13 = if fFlagMobileGameJoinCardGamepadSupport then useGameJoinCardGamepadNavigation(p1.onClose, p1.isNavigationFocused ~= false) else nil
	local var14 = if var13 then var13.rootRef else nil
	local var15 = if var13 then var13.primaryButtonFocusRef else nil
	local var16 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), fFlagGameJoinCardOptionalActions (copy), p1 (ref), gameJoinCardTTIModule (copy)
		if p2 == Enum.AssetFetchStatus.Success then
			var3(true)
			
			if fFlagGameJoinCardOptionalActions and p1.disableAppTelemetry then return end
			gameJoinCardTTIModule.trackBannerLoaded()
		end
	end, {
		if fFlagGameJoinCardOptionalActions then p1.disableAppTelemetry else nil
	})
	local var17 = if fFlagMobileGameJoinCardThumbnailModule then reactModule.useCallback(function(p2)
		-- upvalues: var5 (write)
		if p2 == Enum.AssetFetchStatus.Success then
			var5(true)
		end
	end, {}) else nil
	local var18 = fFlagMobileGameJoinCardThumbnailModule and (thumbnailImageUrl ~= nil and not var2)
	local var19 = if fFlagMobileGameJoinCardThumbnailModule then not var2 and not var4 else not var2
	reactModule.useEffect(function()
		-- upvalues: fFlagGameJoinCardOptionalActions (copy), p1 (ref), gameJoinCardTTIModule (copy)
		if fFlagGameJoinCardOptionalActions and p1.disableAppTelemetry then
			return
		end
		gameJoinCardTTIModule.trackCardMounted()
	end, {
		if fFlagGameJoinCardOptionalActions then p1.disableAppTelemetry else nil
	})
	local var20 = reactModule.useCallback(function()
		-- upvalues: fFlagGameJoinCardOptionalActions (copy), p1 (ref), viewProfileSourceValues (copy)
		if fFlagGameJoinCardOptionalActions and p1.onViewProfile == nil then
			return
		end
		p1.onViewProfile(viewProfileSourceValues.UserTile)
	end, { p1 })
	local var21 = reactModule.useCallback(function()
		-- upvalues: fFlagGameJoinCardOptionalActions (copy), p1 (ref), viewProfileSourceValues (copy)
		if fFlagGameJoinCardOptionalActions and p1.onViewProfile == nil then
			return
		end
		p1.onViewProfile(viewProfileSourceValues.ViewProfileButton)
	end, { p1 })
	local var22 = if fFlagMobileGameJoinCardEDPFromThumbnailModule then reactModule.useCallback(function()
		-- upvalues: fFlagGameJoinCardOptionalActions (copy), p1 (ref), viewEDPsourceValues (copy)
		if fFlagGameJoinCardOptionalActions and p1.onViewExperienceDetails == nil then
			return
		end
		p1.onViewExperienceDetails(viewEDPsourceValues.Thumbnail)
	end, { p1.onViewExperienceDetails }) else nil
	local var23 = if fFlagMobileGameJoinCardEDPFromTitleModule then reactModule.useCallback(function()
		-- upvalues: fFlagGameJoinCardOptionalActions (copy), p1 (ref), viewEDPsourceValues (copy)
		if fFlagGameJoinCardOptionalActions and p1.onViewExperienceDetails == nil then
			return
		end
		p1.onViewExperienceDetails(viewEDPsourceValues.Title)
	end, { p1.onViewExperienceDetails }) else nil
	local var24 = var1.Typography.TitleMedium.FontSize * var1.Typography.TitleMedium.LineHeight
	local var25 = var24 + var1.Typography.BodyMedium.FontSize * var1.Typography.BodyMedium.LineHeight + var1.Padding.Small
	local var26 = 88 + var25
	local var27 = false
	
	if fFlagJoinabilityCTARefactor then
		for i, v in p1.actions do
			if v.id == userCtaAction.UnlockExperience then
				var27 = true
				break
			end
		end
	end
	local var28 = if fFlagJoinabilityCTARefactor then var27 else p1.ageCheckRequired == true
	useJoinCardCtaLoadTimeModule({
		isLoading = p1.isLoading or fFlagJoinabilityCTARefactor and p1.areActionsLoading == true,
		ctaType = if var28 then ctaType.AgeCheckUnlock else ctaType.Join,
		wasCached = p1.wasPlayabilityCached,
		isDisabled = if fFlagGameJoinCardOptionalActions then p1.disableAppTelemetry else nil
	})
	local var29 = useLocalization({
		join = "Feature.Profile.Action.JoinGame",
		viewProfile = "Feature.Profile.Action.ViewProfile",
		chat = "Feature.Profile.Action.Chat",
		playTogether = "Feature.GameJoin.Label.PlayTogether",
		playTogetherSoon = "Feature.GameJoin.Label.PlayTogetherSoon",
		differentServer = "Feature.GameJoin.Description.DifferentServer",
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
	local t = {}
	local var30 = nil
	
	if fFlagJoinabilityCTARefactor then
		if p1.areActionsLoading then
			t.ActionsLoading = reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, var1.Size.Size_600)
			})
		else
			local var31, var32 = buildJoinCardActionsComponentModule(if var15 then assignPrimaryFocusRef(p1.actions, var15) or p1.actions else p1.actions, {
				playTogether = var29.playTogether,
				playTogetherSoon = var29.playTogetherSoon,
				differentServer = var29.differentServer
			}, p1.onClose, function(p2, p3)
				-- upvalues: reactModule (copy), button (copy)
				return reactModule.createElement(button, {
					ref = p2.focusRef,
					text = p2.text,
					onActivated = function()
						-- upvalues: p2 (ref)
						p2.onActivated()
					end,
					variant = p2.variant,
					size = p2.inputSize,
					isLoading = p2.isLoading,
					isDisabled = p2.isDisabled,
					width = p2.width,
					LayoutOrder = p3
				})
			end)
			t = var31
			var30 = var32
		end
	end
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
			ref = if fFlagMobileGameJoinCardGamepadSupport then var14 else nil
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
							onLoaded = var16,
							onActivated = if fFlagGameJoinCardOptionalActions and p1.onViewExperienceDetails == nil then nil elseif fFlagMobileGameJoinCardEDPFromThumbnailModule and var2 then var22 else nil,
							stateLayer = if fFlagGameJoinCardOptionalActions and p1.onViewExperienceDetails == nil then nil elseif fFlagMobileGameJoinCardEDPFromThumbnailModule and var2 then { affordance = stateLayerAffordance.None } else nil
						}),
						BannerThumbnail = if var18 then reactModule.createElement(image, {
							BackgroundTransparency = 1,
							ZIndex = 2,
							Image = thumbnailImageUrl,
							Size = UDim2.fromScale(1, 1),
							ScaleType = Enum.ScaleType.Crop,
							onLoaded = var17
						}) else nil,
						BannerSkeleton = if var19 then reactModule.createElement(skeleton, { ZIndex = 1, Size = UDim2.fromScale(1, 1) }) else nil
					})
				})
			})
		}
		
		if p1.userId then
			local var39
			var35 = reactModule.createElement
			local var40 = view
			local t_10 = {
				ZIndex = 2,
				LayoutOrder = 2,
				Size = if mobileGameJoinCardShowExperienceNameOnly then UDim2.new(1, 0, 0, var24) elseif mobileGameJoinCardHideUserAvatar then UDim2.new(1, 0, 0, var25) else UDim2.new(1, 0, 0, var26)
			}
			local t_11 = {}
			
			if mobileGameJoinCardShowExperienceNameOnly then
				var39 = reactModule.createElement
				var39 = var39(view, {
					tag = "row align-x-center align-y-center size-full",
					onActivated = if fFlagGameJoinCardOptionalActions and p1.onViewExperienceDetails == nil then nil elseif fFlagMobileGameJoinCardEDPFromTitleModule then var23 else nil,
					stateLayer = if fFlagGameJoinCardOptionalActions and p1.onViewExperienceDetails == nil then nil elseif fFlagMobileGameJoinCardEDPFromTitleModule then { affordance = stateLayerAffordance.None } else nil
				}, {
					ExperienceText = reactModule.createElement(text, {
						tag = "shrink auto-xy text-align-x-center content-emphasis",
						LayoutOrder = 1,
						RichText = true,
						fontStyle = var1.Typography.TitleMedium,
						Text = p1.experienceName,
						TextTruncate = Enum.TextTruncate.AtEnd
					})
				})
			elseif mobileGameJoinCardHideUserAvatar then
				var39 = reactModule.createElement(view, { tag = "col align-x-center align-y-center size-full" }, {
					CombinedText = reactModule.createElement(text, {
						tag = "shrink auto-xy text-wrap text-align-x-center content-default",
						LayoutOrder = 1,
						RichText = true,
						fontStyle = var1.Typography.BodyMedium,
						Text = var29.userIsPlayingExperience
					})
				})
			else
				var39 = reactModule.createElement
				var39 = var39(userTile, {
					userId = p1.userId,
					title = p1.playerName,
					subtitle = var29.playingExperience,
					layoutMode = layoutMode.compact,
					avatarSize = UDim2.fromOffset(88, 88),
					backplateStyle = var1.Color.Surface.Surface_100,
					onActivated = if fFlagGameJoinCardOptionalActions and p1.onViewProfile == nil then nil else var20,
					selectable = if fFlagGameJoinCardOptionalActions and p1.onViewProfile == nil then false else nil
				})
			end
			t_11.Tile = var39
			var35 = var35(var40, t_10, t_11)
		else
			var35 = nil
		end
		local t_11
		t_9.UserTileWrapper = var35
		t_9.CtaContext = if var30 ~= nil then nil else reactModule.createElement(view, {
			tag = "col align-x-center items-center gap-xxsmall size-full-0 auto-y",
			LayoutOrder = 3
		}, {
			CtaContextTitle = reactModule.createElement(text, {
				tag = "auto-xy text-body-medium text-align-x-center content-emphasis",
				LayoutOrder = 1,
				Text = var30.title
			}),
			CtaContextSubtitle = if var30.subtitle ~= nil then nil else reactModule.createElement(text, {
				tag = "auto-xy text-label-small text-align-x-center content-muted",
				LayoutOrder = 2,
				Text = var30.subtitle
			})
		})
		local createElement_4 = reactModule.createElement
		local var41 = view
		local t_10 = {
			tag = "col gap-small size-full-0 auto-y",
			LayoutOrder = if var30 ~= nil then 3 else 4
		}
		
		if fFlagJoinabilityCTARefactor then
			t_11 = t
		else
			local var42
			t_11 = {
				PrimaryButton = if var28 then reactModule.createElement(ageCheckUpsellCTAModule, {
					LayoutOrder = 1,
					onUnlockPressed = p1.onAgeCheckPressed or function() end,
					focusRef = if fFlagMobileGameJoinCardGamepadSupport then var15 else nil
				}) else reactModule.createElement(button, {
					LayoutOrder = 1,
					ref = if fFlagMobileGameJoinCardGamepadSupport then var15 else nil,
					text = var29.join,
					onActivated = p1.onJoin,
					variant = buttonVariant.Emphasis,
					inputSize = inputSize.Medium,
					isLoading = p1.isLoading,
					isDisabled = not p1.isInExperience,
					width = UDim.new(1, 0)
				})
			}
			
			if p1.canUsePlatformChat then
				var42 = reactModule.createElement
				var42 = var42(button, {
					LayoutOrder = 2,
					text = if mobileGameJoinCardShowExperienceNameOnly and not mobileGameCardDontShowChatWith then var29.chatWithName else var29.chat,
					onActivated = p1.onChat,
					variant = buttonVariant.Standard,
					inputSize = inputSize.Medium,
					width = UDim.new(1, 0)
				})
			else
				var42 = nil
			end
			t_11.ChatButton = var42
			t_11.SecondaryButton = if fFlagGameJoinCardOptionalActions and p1.onViewProfile == nil then nil else reactModule.createElement(button, {
				LayoutOrder = 3,
				text = var29.viewProfile,
				onActivated = var21,
				variant = buttonVariant.Utility,
				inputSize = inputSize.Medium,
				width = UDim.new(1, 0)
			})
		end
		t_9.Buttons = createElement_4(var41, t_10, t_11)
		t_7.Layout = createElement_3(var38, t_8, t_9)
		t_6.Content = createElement_2(content, var37, t_7)
		t_4.SheetRoot = createElement_1(root, t_5, t_6)
		var34 = var34(var36, t_3, t_4)
	end
	t_2.SheetProvider = var34
	
	return createElement(var33, t_1, t_2)
end