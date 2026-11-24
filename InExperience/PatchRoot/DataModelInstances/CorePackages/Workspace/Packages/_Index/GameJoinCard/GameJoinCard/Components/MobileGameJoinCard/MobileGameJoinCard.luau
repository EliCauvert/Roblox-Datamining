local GameJoinCard = script:FindFirstAncestor("GameJoinCard")
local Parent = GameJoinCard.Parent
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
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local GuiService = game:GetService("GuiService")
local AnalyticsConstantsModule = require(script.Parent.Parent.Parent.Analytics.AnalyticsConstants)
local ViewEDPsourceValues = AnalyticsConstantsModule.viewEDPsourceValues
local ViewProfileSourceValues = AnalyticsConstantsModule.viewProfileSourceValues
local CtaType = AnalyticsConstantsModule.CtaType
local UseJoinCardCtaLoadTimeModule = require(script.Parent.Parent.Parent.Analytics.useJoinCardCtaLoadTime)
local _ = require(Parent.VideoUtils)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagMobileGameJoinCardGamepadSupport = SharedFlagsModule.FFlagMobileGameJoinCardGamepadSupport
local FFlagGameJoinCardOptionalActions = SharedFlagsModule.FFlagGameJoinCardOptionalActions
local FFlagGameJoinCardContent = SharedFlagsModule.FFlagGameJoinCardContent
local FFlagLuaAppAddTestIdsForArrow = SharedFlagsModule.FFlagLuaAppAddTestIdsForArrow
local FFlagSocialPlayIarcRatingLogoDEV = SharedFlagsModule.FFlagSocialPlayIarcRatingLogo_DEV
local FFlagExperienceGuidelinesRatingDisplayStoreModule = require(Parent.DataHydration.FFlagExperienceGuidelinesRatingDisplayStore)
local UseGetMinimizedRatingIcon = if FFlagSocialPlayIarcRatingLogoDEV and FFlagExperienceGuidelinesRatingDisplayStoreModule then require(Parent.SocialCommon).Hooks.useGetMinimizedRatingIcon else nil
local AppendIarcRatingIconFunction = require(Parent.SocialCommon).Components.appendIarcRatingIcon

local function _(p1)
	-- upvalues: UseGetMinimizedRatingIcon (copy)
	if UseGetMinimizedRatingIcon == nil then
		return nil, nil
	else
		return UseGetMinimizedRatingIcon(p1)
	end
end

local UseGameJoinCardGamepadNavigationFunction = nil
local AssignPrimaryFocusRefFunction = nil

if FFlagMobileGameJoinCardGamepadSupport then
	local UseGameJoinCardGamepadNavigationModule = require(GameJoinCard.Hooks.useGameJoinCardGamepadNavigation)
	UseGameJoinCardGamepadNavigationFunction = UseGameJoinCardGamepadNavigationModule.useGameJoinCardGamepadNavigation
	AssignPrimaryFocusRefFunction = UseGameJoinCardGamepadNavigationModule.assignPrimaryFocusRef
end
local AgeCheckUpsellCTAModule = require(script.Parent.Parent.AgeCheckUpsellCTA)
local JoinCardBannerVideoContainerModule = require(script.Parent.JoinCardBannerVideo.JoinCardBannerVideoContainer)
local GameJoinCardTTIModule = require(script.Parent.Parent.Parent.Telemetry.GameJoinCardTTI)
local FFlagMobileGameJoinCardThumbnailModule = require(script.Parent.Parent.Parent.Flags.FFlagMobileGameJoinCardThumbnail)
local MobileGameJoinCardHideUserAvatar = game:DefineFastFlag("MobileGameJoinCardHideUserAvatar", false)
local MobileGameJoinCardShowExperienceNameOnly = game:DefineFastFlag("MobileGameJoinCardShowExperienceNameOnly", false)
local FFlagMobileGameJoinCardEDPFromTitleModule = require(GameJoinCard.Flags.FFlagMobileGameJoinCardEDPFromTitle)
local FFlagMobileGameJoinCardTrapGamepadFocusModule = require(GameJoinCard.Flags.FFlagMobileGameJoinCardTrapGamepadFocus)
local Config = if FFlagMobileGameJoinCardTrapGamepadFocusModule then {
	SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
	SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
	SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
	SelectionBehaviorRight = Enum.SelectionBehavior.Stop
} else nil
local MobileGameJoinCardSelection = if FFlagMobileGameJoinCardTrapGamepadFocusModule then "mobile-game-join-card-selection" else nil
local FFlagMobileGameJoinCardEDPFromThumbnailModule = require(GameJoinCard.Flags.FFlagMobileGameJoinCardEDPFromThumbnail)
local FFlagMobileGameJoinCardVideo = require(Parent.SharedFlags).FFlagMobileGameJoinCardVideo
local MobileGameCardDontShowChatWith = game:DefineFastFlag("MobileGameCardDontShowChatWith", false)
local FFlagJoinabilityCTARefactor = require(Parent.SharedFlags).FFlagJoinabilityCTARefactor
local FFlagCoplayHistoryGameJoinCard = SharedFlagsModule.FFlagCoplayHistoryGameJoinCard
local FFlagJoinabilityCTAContextCopy = require(Parent.SharedFlags).FFlagJoinabilityCTAContextCopy
local _ = require(GameJoinCard.Components.Actions.Types)
local BuildJoinCardActionsComponentModule = require(GameJoinCard.Components.Actions.buildJoinCardActionsComponent)
local ContextCopyTextKeysModule = require(GameJoinCard.Components.Actions.ContextCopyTextKeys)
local UserCtaAction = require(Parent.UserCtaCommon).Enums.UserCtaAction

return function(p1)
	-- upvalues: UseTokensFunction (copy), FFlagSocialPlayIarcRatingLogoDEV (copy), UseGetMinimizedRatingIcon (copy), ReactModule (copy), FFlagMobileGameJoinCardThumbnailModule (copy), FoundationModule (copy), GuiService (copy), FFlagGameJoinCardContent (copy), FFlagMobileGameJoinCardGamepadSupport (copy), UseGameJoinCardGamepadNavigationFunction (ref), FFlagGameJoinCardOptionalActions (copy), GameJoinCardTTIModule (copy), ViewProfileSourceValues (copy), FFlagMobileGameJoinCardEDPFromThumbnailModule (copy), ViewEDPsourceValues (copy), FFlagMobileGameJoinCardEDPFromTitleModule (copy), FFlagJoinabilityCTARefactor (copy), UserCtaAction (copy), UseJoinCardCtaLoadTimeModule (copy), CtaType (copy), UseLocalizationFunction (copy), FFlagCoplayHistoryGameJoinCard (copy), ContextCopyTextKeysModule (copy), Skeleton (copy), AssignPrimaryFocusRefFunction (ref), BuildJoinCardActionsComponentModule (copy), Button (copy), FFlagLuaAppAddTestIdsForArrow (copy), FFlagJoinabilityCTAContextCopy (copy), OverlayProvider (copy), Sheet (copy), View (copy), MobileGameJoinCardSelection (copy), Config (copy), MobileGameJoinCardHideUserAvatar (copy), AppendIarcRatingIconFunction (copy), Image (copy), StateLayerAffordance (copy), FFlagMobileGameJoinCardVideo (copy), JoinCardBannerVideoContainerModule (copy), MobileGameJoinCardShowExperienceNameOnly (copy), Text (copy), UserTile (copy), LayoutMode (copy), AgeCheckUpsellCTAModule (copy), ButtonVariant (copy), InputSize (copy), MobileGameCardDontShowChatWith (copy)
	local UseTokensResult = UseTokensFunction()
	local v1 = nil
	local v2 = nil
	
	if FFlagSocialPlayIarcRatingLogoDEV then
		local UniverseId = p1.universeId
		local v3 = nil
		local v4 = nil
		
		if UseGetMinimizedRatingIcon == nil then
			v3 = nil
			v4 = nil
		else
			v3, v62 = UseGetMinimizedRatingIcon(UniverseId)
		end
		v1 = v3
		v2 = v4
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local v5 = nil
	local Callback = nil
	
	if FFlagMobileGameJoinCardThumbnailModule then
		v5, Callback = ReactModule.useState(false)
	end
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseOverlayResult = FoundationModule.Hooks.useOverlay()
	local NoUseOverlayResult: boolean = not UseOverlayResult or UseOverlayResult.AbsoluteSize.Y < UseOverlayResult.AbsoluteSize.X
	local Inverted = not (GuiService.ViewportDisplaySize == Enum.DisplaySize.Small and not NoUseOverlayResult)
	local ThumbnailImageUrl = p1.thumbnailImageUrl
	local Content = if FFlagGameJoinCardContent then p1.content else nil
	local UseGameJoinCardGamepadNavigationResult = if FFlagMobileGameJoinCardGamepadSupport then UseGameJoinCardGamepadNavigationFunction(p1.onClose, p1.isNavigationFocused ~= false) else nil
	local RootRef = if UseGameJoinCardGamepadNavigationResult then UseGameJoinCardGamepadNavigationResult.rootRef else nil
	local PrimaryButtonFocusRef = if UseGameJoinCardGamepadNavigationResult then UseGameJoinCardGamepadNavigationResult.primaryButtonFocusRef else nil
	local UseResult = ReactModule.useCallback(function(AssetFetchStatus)
		-- upvalues: UseStateResult2 (copy), Content (copy), FFlagGameJoinCardOptionalActions (upval), p1 (copy), GameJoinCardTTIModule (upval)
		if AssetFetchStatus == Enum.AssetFetchStatus.Success then
			UseStateResult2(true)
			
			if Content ~= nil or FFlagGameJoinCardOptionalActions and p1.disableAppTelemetry then return end
			GameJoinCardTTIModule.trackBannerLoaded()
		end
	end, {
		Content ~= nil,
		if FFlagGameJoinCardOptionalActions then p1.disableAppTelemetry else nil
	})
	local UseResult1 = if FFlagMobileGameJoinCardThumbnailModule then ReactModule.useCallback(function(AssetFetchStatus)
		-- upvalues: Callback (ref)
		if AssetFetchStatus == Enum.AssetFetchStatus.Success then
			Callback(true)
		end
	end, {}) else nil
	local NoUseStateResult: boolean = FFlagMobileGameJoinCardThumbnailModule and (ThumbnailImageUrl ~= nil and not UseStateResult)
	local NoV60: boolean = Content == nil and (if FFlagMobileGameJoinCardThumbnailModule then not UseStateResult and not v5 else not UseStateResult)
	local v6 = if Content == nil and not NoV60 then v1 else nil
	ReactModule.useEffect(function()
		-- upvalues: Content (copy), FFlagGameJoinCardOptionalActions (upval), p1 (copy), GameJoinCardTTIModule (upval)
		if Content == nil and (not FFlagGameJoinCardOptionalActions or not p1.disableAppTelemetry) then
			GameJoinCardTTIModule.trackCardMounted()
			
			return
		end
	end, {
		Content ~= nil,
		if FFlagGameJoinCardOptionalActions then p1.disableAppTelemetry else nil
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: FFlagGameJoinCardOptionalActions (upval), p1 (copy), ViewProfileSourceValues (upval)
		if not FFlagGameJoinCardOptionalActions or p1.onViewProfile ~= nil then
			p1.onViewProfile(ViewProfileSourceValues.UserTile)
			
			return
		end
	end, { p1 })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: FFlagGameJoinCardOptionalActions (upval), p1 (copy), ViewProfileSourceValues (upval)
		if not FFlagGameJoinCardOptionalActions or p1.onViewProfile ~= nil then
			p1.onViewProfile(ViewProfileSourceValues.ViewProfileButton)
			
			return
		end
	end, { p1 })
	local UseResult4 = if FFlagMobileGameJoinCardEDPFromThumbnailModule then ReactModule.useCallback(function()
		-- upvalues: FFlagGameJoinCardOptionalActions (upval), p1 (copy), ViewEDPsourceValues (upval)
		if not FFlagGameJoinCardOptionalActions or p1.onViewExperienceDetails ~= nil then
			p1.onViewExperienceDetails(ViewEDPsourceValues.Thumbnail)
			
			return
		end
	end, { p1.onViewExperienceDetails }) else nil
	local UseResult5 = if FFlagMobileGameJoinCardEDPFromTitleModule then ReactModule.useCallback(function()
		-- upvalues: FFlagGameJoinCardOptionalActions (upval), p1 (copy), ViewEDPsourceValues (upval)
		if not FFlagGameJoinCardOptionalActions or p1.onViewExperienceDetails ~= nil then
			p1.onViewExperienceDetails(ViewEDPsourceValues.Title)
			
			return
		end
	end, { p1.onViewExperienceDetails }) else nil
	local ScaledFontSize = UseTokensResult.Typography.TitleMedium.FontSize * UseTokensResult.Typography.TitleMedium.LineHeight
	local NewScaledFontSize = ScaledFontSize + UseTokensResult.Typography.BodyMedium.FontSize * UseTokensResult.Typography.BodyMedium.LineHeight + UseTokensResult.Padding.Small
	local YOffset = 88 + NewScaledFontSize
	local Flag = false
	
	if FFlagJoinabilityCTARefactor then
		for _, action in p1.actions do
			if action.id == UserCtaAction.UnlockExperience then
				Flag = true
				break
			end
		end
	end
	local Flag1: boolean = if FFlagJoinabilityCTARefactor then Flag else p1.ageCheckRequired == true
	UseJoinCardCtaLoadTimeModule({
		isLoading = p1.isLoading or FFlagJoinabilityCTARefactor and p1.areActionsLoading == true,
		ctaType = if Flag1 then CtaType.AgeCheckUnlock else CtaType.Join,
		wasCached = p1.wasPlayabilityCached,
		isDisabled = Content ~= nil or (if FFlagGameJoinCardOptionalActions then p1.disableAppTelemetry else nil)
	})
	local UseLocalizationResult = UseLocalizationFunction({
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
		playedExperience = if FFlagCoplayHistoryGameJoinCard then {
			"Feature.GameJoin.Label.PlayedExperience",
			experienceName = p1.experienceName
		} else nil,
		userPlayedExperience = if FFlagCoplayHistoryGameJoinCard then {
			"Feature.GameJoin.Label.UserPlayedExperience",
			userName = p1.playerName,
			experienceName = p1.experienceName
		} else nil,
		chatWithName = {
			"Feature.Home.PeopleList.ChatWith",
			username = p1.playerName
		}
	})
	local UseLocalizationResult1 = if FFlagCoplayHistoryGameJoinCard then UseLocalizationFunction(ContextCopyTextKeysModule) else nil
	local t = {}
	local v7 = nil
	
	if FFlagJoinabilityCTARefactor or Content ~= nil then
		if p1.areActionsLoading then
			t.ActionsLoading = ReactModule.createElement(Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_600)
			})
		else
			t, v89 = BuildJoinCardActionsComponentModule(PrimaryButtonFocusRef and AssignPrimaryFocusRefFunction(p1.actions, PrimaryButtonFocusRef) or p1.actions, if FFlagCoplayHistoryGameJoinCard then UseLocalizationResult1 else {
				playTogether = UseLocalizationResult.playTogether,
				playTogetherSoon = UseLocalizationResult.playTogetherSoon,
				differentServer = UseLocalizationResult.differentServer
			}, p1.onClose, function(p2, LayoutOrder)
				-- upvalues: ReactModule (upval), Button (upval), FFlagLuaAppAddTestIdsForArrow (upval)
				return ReactModule.createElement(Button, {
					ref = p2.focusRef,
					text = p2.text,
					onActivated = function()
						-- upvalues: p2 (copy)
						p2.onActivated()
					end,
					variant = p2.variant,
					size = p2.inputSize,
					isLoading = p2.isLoading,
					isDisabled = p2.isDisabled,
					width = p2.width,
					LayoutOrder = LayoutOrder,
					testId = if FFlagLuaAppAddTestIdsForArrow then `--game-join-card-action-{p4.id}` else nil
				})
			end, if FFlagCoplayHistoryGameJoinCard then p1.isCoplayInviteCard else nil)
		end
	end
	local FFlagJoinabilityCTAContextCopy1 = FFlagJoinabilityCTAContextCopy or FFlagCoplayHistoryGameJoinCard and p1.isCoplayInviteCard == true
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ref = UseStateResult2_1
	}, {
		SheetProvider = UseStateResult1 and ReactModule.createElement(OverlayProvider, { gui = UseStateResult1 }, {
			SheetRoot = ReactModule.createElement(Sheet.Root, {
				preferCenterSheet = true,
				onClose = p1.onClose,
				ref = if FFlagMobileGameJoinCardGamepadSupport then RootRef else nil
			}, {
				Content = ReactModule.createElement(Sheet.Content, nil, {
					BottomPadding = if Inverted then ReactModule.createElement("UIPadding", {
						PaddingBottom = UDim.new(0, UseTokensResult.Padding.Medium)
					}) else nil,
					Layout = ReactModule.createElement(View, {
						tag = "col gap-medium size-full-0 auto-y",
						testId = MobileGameJoinCardSelection,
						selectionGroup = Config
					}, {
						BannerImageContainer = ReactModule.createElement(View, {
							tag = "size-full-0",
							LayoutOrder = 1,
							Size = if MobileGameJoinCardHideUserAvatar then UDim2.new(1, 0, 0, 187 - UseTokensResult.Padding.XLarge) else UDim2.new(1, 0, 0, 111)
						}, {
							BannerImageClipper = ReactModule.createElement(View, {
								tag = "clip",
								Position = UDim2.new(0, -UseTokensResult.Padding.XLarge, 0, -UseTokensResult.Padding.XLarge),
								Size = UDim2.new(1, UseTokensResult.Padding.XLarge * 2, 0, 187)
							}, AppendIarcRatingIconFunction({
								BannerImageCanvas = ReactModule.createElement("CanvasGroup", {
									BackgroundTransparency = 1,
									GroupTransparency = 0,
									Size = UDim2.new(1, 0, 0, 202)
								}, {
									Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 15) }),
									BannerImage = ReactModule.createElement(Image, {
										BackgroundTransparency = 1,
										Image = p1.bannerImageUrl,
										Size = UDim2.fromScale(1, 1),
										ScaleType = Enum.ScaleType.Crop,
										ZIndex = if FFlagMobileGameJoinCardThumbnailModule then 3 else 2,
										onLoaded = UseResult,
										onActivated = if Content == nil and (not FFlagGameJoinCardOptionalActions or p1.onViewExperienceDetails ~= nil) and (FFlagMobileGameJoinCardEDPFromThumbnailModule and UseStateResult) then UseResult4 else nil,
										stateLayer = if Content == nil and (not FFlagGameJoinCardOptionalActions or p1.onViewExperienceDetails ~= nil) and (FFlagMobileGameJoinCardEDPFromThumbnailModule and UseStateResult) then { affordance = StateLayerAffordance.None } else nil
									}),
									BannerThumbnail = if NoUseStateResult then ReactModule.createElement(Image, {
										BackgroundTransparency = 1,
										ZIndex = 2,
										Image = ThumbnailImageUrl,
										Size = UDim2.fromScale(1, 1),
										ScaleType = Enum.ScaleType.Crop,
										onLoaded = UseResult1
									}) else nil,
									Media = if Content then ReactModule.createElement(View, { tag = "size-full", ZIndex = 4 }, { Content = Content.media }) else nil,
									BannerSkeleton = if NoV60 then ReactModule.createElement(Skeleton, { ZIndex = 1, Size = UDim2.fromScale(1, 1) }) else nil
								}),
								BannerVideo = if FFlagMobileGameJoinCardVideo and p1.bannerVideoId then ReactModule.createElement(JoinCardBannerVideoContainerModule, {
									cornerRadius = 15,
									ZIndex = 2,
									videoId = p1.bannerVideoId,
									videoPlaybackContext = p1.bannerVideoPlaybackContext,
									universeId = p1.universeId,
									Size = UDim2.new(1, 0, 0, 202),
									onActivated = if FFlagMobileGameJoinCardEDPFromThumbnailModule then UseResult4 else nil
								}) else nil
							}, v6, v2, UseTokensResult.Size.Size_1300, if v6 == nil then nil else {
								ZIndex = 5,
								AnchorPoint = Vector2.new(1, 1),
								Position = UDim2.new(1, -UseTokensResult.Padding.Medium, 1, -UseTokensResult.Padding.Medium)
							}))
						}),
						UserTileWrapper = if p1.userId then ReactModule.createElement(View, {
							ZIndex = 2,
							LayoutOrder = 2,
							Size = if MobileGameJoinCardShowExperienceNameOnly or Content ~= nil then UDim2.new(1, 0, 0, if Content == nil then ScaledFontSize else NewScaledFontSize) elseif MobileGameJoinCardHideUserAvatar then UDim2.new(1, 0, 0, NewScaledFontSize) else UDim2.new(1, 0, 0, YOffset)
						}, {
							Tile = if MobileGameJoinCardShowExperienceNameOnly or Content ~= nil then ReactModule.createElement(View, {
								tag = if Content == nil then "row align-x-center align-y-center size-full" else "col align-x-center align-y-center gap-small size-full",
								onActivated = if Content == nil and (not FFlagGameJoinCardOptionalActions or p1.onViewExperienceDetails ~= nil) and FFlagMobileGameJoinCardEDPFromTitleModule then UseResult5 else nil,
								stateLayer = if Content == nil and (not FFlagGameJoinCardOptionalActions or p1.onViewExperienceDetails ~= nil) and FFlagMobileGameJoinCardEDPFromTitleModule then { affordance = StateLayerAffordance.None } else nil
							}, {
								ExperienceText = ReactModule.createElement(Text, {
									tag = "shrink auto-xy text-align-x-center content-emphasis",
									LayoutOrder = 1,
									RichText = true,
									fontStyle = UseTokensResult.Typography.TitleMedium,
									Text = if Content then Content.title else p1.experienceName,
									TextTruncate = Enum.TextTruncate.AtEnd
								}),
								Subtitle = if Content then ReactModule.createElement(Text, {
									tag = "shrink auto-xy text-align-x-center content-default",
									LayoutOrder = 2,
									fontStyle = UseTokensResult.Typography.BodyMedium,
									Text = Content.subtitle,
									TextTruncate = Enum.TextTruncate.AtEnd
								}) else nil
							}) elseif MobileGameJoinCardHideUserAvatar then ReactModule.createElement(View, { tag = "col align-x-center align-y-center size-full" }, {
								CombinedText = ReactModule.createElement(Text, {
									tag = "shrink auto-xy text-wrap text-align-x-center content-default",
									LayoutOrder = 1,
									RichText = true,
									fontStyle = UseTokensResult.Typography.BodyMedium,
									Text = if FFlagCoplayHistoryGameJoinCard and p1.isCoplayInviteCard then UseLocalizationResult.userPlayedExperience else UseLocalizationResult.userIsPlayingExperience
								})
							}) else ReactModule.createElement(UserTile, {
								userId = p1.userId,
								title = p1.playerName,
								subtitle = if FFlagCoplayHistoryGameJoinCard and p1.isCoplayInviteCard then UseLocalizationResult.playedExperience else UseLocalizationResult.playingExperience,
								layoutMode = LayoutMode.compact,
								avatarSize = UDim2.fromOffset(88, 88),
								backplateStyle = UseTokensResult.Color.Surface.Surface_100,
								onActivated = if FFlagGameJoinCardOptionalActions and p1.onViewProfile == nil then nil else UseResult2,
								selectable = (not FFlagGameJoinCardOptionalActions or p1.onViewProfile ~= nil) and nil
							})
						}) else nil,
						CtaContext = if FFlagJoinabilityCTAContextCopy1 and v7 ~= nil then ReactModule.createElement(View, {
							tag = "col align-x-center items-center gap-xxsmall size-full-0 auto-y",
							LayoutOrder = 3
						}, {
							CtaContextTitle = ReactModule.createElement(Text, {
								tag = "auto-xy text-body-medium text-align-x-center content-emphasis",
								LayoutOrder = 1,
								Text = v7.title
							}),
							CtaContextSubtitle = if v7.subtitle == nil then nil else ReactModule.createElement(Text, {
								tag = "auto-xy text-label-small text-align-x-center content-muted",
								LayoutOrder = 2,
								Text = v7.subtitle
							})
						}) else nil,
						Buttons = ReactModule.createElement(View, {
							tag = "col gap-small size-full-0 auto-y",
							LayoutOrder = if FFlagJoinabilityCTAContextCopy1 and v7 ~= nil then 4 else 3
						}, if FFlagJoinabilityCTARefactor or Content ~= nil then t else {
							PrimaryButton = if Flag1 then ReactModule.createElement(AgeCheckUpsellCTAModule, {
								LayoutOrder = 1,
								onUnlockPressed = p1.onAgeCheckPressed or function() end,
								focusRef = if FFlagMobileGameJoinCardGamepadSupport then PrimaryButtonFocusRef else nil
							}) else ReactModule.createElement(Button, {
								LayoutOrder = 1,
								ref = if FFlagMobileGameJoinCardGamepadSupport then PrimaryButtonFocusRef else nil,
								text = UseLocalizationResult.join,
								onActivated = p1.onJoin,
								variant = ButtonVariant.Emphasis,
								inputSize = InputSize.Medium,
								isLoading = p1.isLoading,
								isDisabled = not p1.isInExperience,
								width = UDim.new(1, 0),
								testId = if FFlagLuaAppAddTestIdsForArrow then "--game-join-card-action-JoinExperience" else nil
							}),
							ChatButton = if p1.canUsePlatformChat then ReactModule.createElement(Button, {
								LayoutOrder = 2,
								text = if MobileGameJoinCardShowExperienceNameOnly and not MobileGameCardDontShowChatWith then UseLocalizationResult.chatWithName else UseLocalizationResult.chat,
								onActivated = p1.onChat,
								variant = ButtonVariant.Standard,
								inputSize = InputSize.Medium,
								width = UDim.new(1, 0)
							}) else nil,
							SecondaryButton = if FFlagGameJoinCardOptionalActions and p1.onViewProfile == nil then nil else ReactModule.createElement(Button, {
								LayoutOrder = 3,
								text = UseLocalizationResult.viewProfile,
								onActivated = UseResult3,
								variant = ButtonVariant.Utility,
								inputSize = InputSize.Medium,
								width = UDim.new(1, 0),
								testId = if FFlagLuaAppAddTestIdsForArrow then "--game-join-card-action-ViewProfile" else nil
							})
						})
					})
				})
			})
		})
	})
end