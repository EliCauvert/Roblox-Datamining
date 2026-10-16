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
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagMobileGameJoinCardGamepadSupport = SharedFlagsModule.FFlagMobileGameJoinCardGamepadSupport
local FFlagGameJoinCardOptionalActions = SharedFlagsModule.FFlagGameJoinCardOptionalActions
local UseGameJoinCardGamepadNavigationFunction = nil
local AssignPrimaryFocusRefFunction = nil

if FFlagMobileGameJoinCardGamepadSupport then
	local UseGameJoinCardGamepadNavigationModule = require(GameJoinCard.Hooks.useGameJoinCardGamepadNavigation)
	UseGameJoinCardGamepadNavigationFunction = UseGameJoinCardGamepadNavigationModule.useGameJoinCardGamepadNavigation
	AssignPrimaryFocusRefFunction = UseGameJoinCardGamepadNavigationModule.assignPrimaryFocusRef
end
local AgeCheckUpsellCTAModule = require(script.Parent.Parent.AgeCheckUpsellCTA)
local GameJoinCardTTIModule = require(script.Parent.Parent.Parent.Telemetry.GameJoinCardTTI)
local FFlagMobileGameJoinCardThumbnailModule = require(script.Parent.Parent.Parent.Flags.FFlagMobileGameJoinCardThumbnail)
local MobileGameJoinCardHideUserAvatar = game:DefineFastFlag("MobileGameJoinCardHideUserAvatar", false)
local MobileGameJoinCardShowExperienceNameOnly = game:DefineFastFlag("MobileGameJoinCardShowExperienceNameOnly", false)
local FFlagMobileGameJoinCardEDPFromTitleModule = require(GameJoinCard.Flags.FFlagMobileGameJoinCardEDPFromTitle)
local FFlagMobileGameJoinCardEDPFromThumbnailModule = require(GameJoinCard.Flags.FFlagMobileGameJoinCardEDPFromThumbnail)
local MobileGameCardDontShowChatWith = game:DefineFastFlag("MobileGameCardDontShowChatWith", false)
local FFlagJoinabilityCTARefactor = require(Parent.SharedFlags).FFlagJoinabilityCTARefactor
local _ = require(GameJoinCard.Components.Actions.Types)
local BuildJoinCardActionsComponentModule = require(GameJoinCard.Components.Actions.buildJoinCardActionsComponent)
local UserCtaAction = require(Parent.UserCtaCommon).Enums.UserCtaAction

return function(p1) --[[ Line: 94 | Named "MobileGameJoinCard" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FFlagMobileGameJoinCardThumbnailModule (copy), FoundationModule (copy), GuiService (copy), FFlagMobileGameJoinCardGamepadSupport (copy), UseGameJoinCardGamepadNavigationFunction (ref), FFlagGameJoinCardOptionalActions (copy), GameJoinCardTTIModule (copy), ViewProfileSourceValues (copy), FFlagMobileGameJoinCardEDPFromThumbnailModule (copy), ViewEDPsourceValues (copy), FFlagMobileGameJoinCardEDPFromTitleModule (copy), FFlagJoinabilityCTARefactor (copy), UserCtaAction (copy), UseJoinCardCtaLoadTimeModule (copy), CtaType (copy), UseLocalizationFunction (copy), Skeleton (copy), AssignPrimaryFocusRefFunction (ref), BuildJoinCardActionsComponentModule (copy), Button (copy), OverlayProvider (copy), Sheet (copy), View (copy), MobileGameJoinCardHideUserAvatar (copy), Image (copy), StateLayerAffordance (copy), MobileGameJoinCardShowExperienceNameOnly (copy), Text (copy), UserTile (copy), LayoutMode (copy), AgeCheckUpsellCTAModule (copy), ButtonVariant (copy), InputSize (copy), MobileGameCardDontShowChatWith (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local v1 = nil
	local Callback = nil
	
	if FFlagMobileGameJoinCardThumbnailModule then
		v1, Callback = ReactModule.useState(false)
	end
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseOverlayResult = FoundationModule.Hooks.useOverlay()
	local NoUseOverlayResult: boolean = not UseOverlayResult or UseOverlayResult.AbsoluteSize.Y < UseOverlayResult.AbsoluteSize.X
	local Inverted = not (GuiService.ViewportDisplaySize == Enum.DisplaySize.Small and not NoUseOverlayResult)
	local ThumbnailImageUrl = p1.thumbnailImageUrl
	local UseGameJoinCardGamepadNavigationResult = if FFlagMobileGameJoinCardGamepadSupport then UseGameJoinCardGamepadNavigationFunction(p1.onClose, p1.isNavigationFocused ~= false) else nil
	local RootRef = if UseGameJoinCardGamepadNavigationResult then UseGameJoinCardGamepadNavigationResult.rootRef else nil
	local PrimaryButtonFocusRef = if UseGameJoinCardGamepadNavigationResult then UseGameJoinCardGamepadNavigationResult.primaryButtonFocusRef else nil
	local UseResult = ReactModule.useCallback(function(AssetFetchStatus) --[[ Line: 115 ]]
		-- upvalues: UseStateResult2 (copy), FFlagGameJoinCardOptionalActions (upval), p1 (copy), GameJoinCardTTIModule (upval)
		if AssetFetchStatus == Enum.AssetFetchStatus.Success then
			UseStateResult2(true)
			
			if FFlagGameJoinCardOptionalActions and p1.disableAppTelemetry then return end
			GameJoinCardTTIModule.trackBannerLoaded()
		end
	end, {
		if FFlagGameJoinCardOptionalActions then p1.disableAppTelemetry else nil
	})
	local UseResult1 = if FFlagMobileGameJoinCardThumbnailModule then ReactModule.useCallback(function(AssetFetchStatus) --[[ Line: 126 ]]
		-- upvalues: Callback (ref)
		if AssetFetchStatus == Enum.AssetFetchStatus.Success then
			Callback(true)
		end
	end, {}) else nil
	local NoUseStateResult: boolean = FFlagMobileGameJoinCardThumbnailModule and (ThumbnailImageUrl ~= nil and not UseStateResult)
	local NoV42: boolean = if FFlagMobileGameJoinCardThumbnailModule then not UseStateResult and not v1 else not UseStateResult
	ReactModule.useEffect(function() --[[ Line: 137 ]]
		-- upvalues: FFlagGameJoinCardOptionalActions (upval), p1 (copy), GameJoinCardTTIModule (upval)
		if not FFlagGameJoinCardOptionalActions or not p1.disableAppTelemetry then
			GameJoinCardTTIModule.trackCardMounted()
			
			return
		end
	end, {
		if FFlagGameJoinCardOptionalActions then p1.disableAppTelemetry else nil
	})
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 144 ]]
		-- upvalues: FFlagGameJoinCardOptionalActions (upval), p1 (copy), ViewProfileSourceValues (upval)
		if not FFlagGameJoinCardOptionalActions or p1.onViewProfile ~= nil then
			p1.onViewProfile(ViewProfileSourceValues.UserTile)
			
			return
		end
	end, { p1 })
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 151 ]]
		-- upvalues: FFlagGameJoinCardOptionalActions (upval), p1 (copy), ViewProfileSourceValues (upval)
		if not FFlagGameJoinCardOptionalActions or p1.onViewProfile ~= nil then
			p1.onViewProfile(ViewProfileSourceValues.ViewProfileButton)
			
			return
		end
	end, { p1 })
	local UseResult4 = if FFlagMobileGameJoinCardEDPFromThumbnailModule then ReactModule.useCallback(function() --[[ Line: 159 ]]
		-- upvalues: FFlagGameJoinCardOptionalActions (upval), p1 (copy), ViewEDPsourceValues (upval)
		if not FFlagGameJoinCardOptionalActions or p1.onViewExperienceDetails ~= nil then
			p1.onViewExperienceDetails(ViewEDPsourceValues.Thumbnail)
			
			return
		end
	end, { p1.onViewExperienceDetails }) else nil
	local UseResult5 = if FFlagMobileGameJoinCardEDPFromTitleModule then ReactModule.useCallback(function() --[[ Line: 168 ]]
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
		isDisabled = if FFlagGameJoinCardOptionalActions then p1.disableAppTelemetry else nil
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
		chatWithName = {
			"Feature.Home.PeopleList.ChatWith",
			username = p1.playerName
		}
	})
	local t = {}
	local v2 = nil
	
	if FFlagJoinabilityCTARefactor then
		if p1.areActionsLoading then
			t.ActionsLoading = ReactModule.createElement(Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_600)
			})
		else
			t, v66 = BuildJoinCardActionsComponentModule(PrimaryButtonFocusRef and AssignPrimaryFocusRefFunction(p1.actions, PrimaryButtonFocusRef) or p1.actions, {
				playTogether = UseLocalizationResult.playTogether,
				playTogetherSoon = UseLocalizationResult.playTogetherSoon,
				differentServer = UseLocalizationResult.differentServer
			}, p1.onClose, function(p2, LayoutOrder) --[[ Line: 243 ]]
				-- upvalues: ReactModule (upval), Button (upval)
				return ReactModule.createElement(Button, {
					ref = p2.focusRef,
					text = p2.text,
					onActivated = function() --[[ Line: 247 ]]
						-- upvalues: p2 (copy)
						p2.onActivated()
					end,
					variant = p2.variant,
					size = p2.inputSize,
					isLoading = p2.isLoading,
					isDisabled = p2.isDisabled,
					width = p2.width,
					LayoutOrder = LayoutOrder
				})
			end)
		end
	end
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
										Image = p1.bannerImageUrl,
										Size = UDim2.fromScale(1, 1),
										ScaleType = Enum.ScaleType.Crop,
										ZIndex = if FFlagMobileGameJoinCardThumbnailModule then 3 else 2,
										onLoaded = UseResult,
										onActivated = if FFlagGameJoinCardOptionalActions and p1.onViewExperienceDetails == nil then nil elseif FFlagMobileGameJoinCardEDPFromThumbnailModule and UseStateResult then UseResult4 else nil,
										stateLayer = if FFlagGameJoinCardOptionalActions and p1.onViewExperienceDetails == nil then nil elseif FFlagMobileGameJoinCardEDPFromThumbnailModule and UseStateResult then { affordance = StateLayerAffordance.None } else nil
									}),
									BannerThumbnail = if NoUseStateResult then ReactModule.createElement(Image, {
										BackgroundTransparency = 1,
										ZIndex = 2,
										Image = ThumbnailImageUrl,
										Size = UDim2.fromScale(1, 1),
										ScaleType = Enum.ScaleType.Crop,
										onLoaded = UseResult1
									}) else nil,
									BannerSkeleton = if NoV42 then ReactModule.createElement(Skeleton, { ZIndex = 1, Size = UDim2.fromScale(1, 1) }) else nil
								})
							})
						}),
						UserTileWrapper = if p1.userId then ReactModule.createElement(View, {
							ZIndex = 2,
							LayoutOrder = 2,
							Size = if MobileGameJoinCardShowExperienceNameOnly then UDim2.new(1, 0, 0, ScaledFontSize) elseif MobileGameJoinCardHideUserAvatar then UDim2.new(1, 0, 0, NewScaledFontSize) else UDim2.new(1, 0, 0, YOffset)
						}, {
							Tile = if MobileGameJoinCardShowExperienceNameOnly then ReactModule.createElement(View, {
								tag = "row align-x-center align-y-center size-full",
								onActivated = if FFlagGameJoinCardOptionalActions and p1.onViewExperienceDetails == nil then nil elseif FFlagMobileGameJoinCardEDPFromTitleModule then UseResult5 else nil,
								stateLayer = if FFlagGameJoinCardOptionalActions and p1.onViewExperienceDetails == nil then nil elseif FFlagMobileGameJoinCardEDPFromTitleModule then { affordance = StateLayerAffordance.None } else nil
							}, {
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
								onActivated = if FFlagGameJoinCardOptionalActions and p1.onViewProfile == nil then nil else UseResult2,
								selectable = (not FFlagGameJoinCardOptionalActions or p1.onViewProfile ~= nil) and nil
							})
						}) else nil,
						CtaContext = if v2 == nil then nil else ReactModule.createElement(View, {
							tag = "col align-x-center items-center gap-xxsmall size-full-0 auto-y",
							LayoutOrder = 3
						}, {
							CtaContextTitle = ReactModule.createElement(Text, {
								tag = "auto-xy text-body-medium text-align-x-center content-emphasis",
								LayoutOrder = 1,
								Text = v2.title
							}),
							CtaContextSubtitle = if v2.subtitle == nil then nil else ReactModule.createElement(Text, {
								tag = "auto-xy text-label-small text-align-x-center content-muted",
								LayoutOrder = 2,
								Text = v2.subtitle
							})
						}),
						Buttons = ReactModule.createElement(View, {
							tag = "col gap-small size-full-0 auto-y",
							LayoutOrder = if v2 == nil then 3 else 4
						}, if FFlagJoinabilityCTARefactor then t else {
							PrimaryButton = if Flag1 then ReactModule.createElement(AgeCheckUpsellCTAModule, {
								LayoutOrder = 1,
								onUnlockPressed = p1.onAgeCheckPressed or function() --[[ Line: 443 ]] end,
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
								width = UDim.new(1, 0)
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
								width = UDim.new(1, 0)
							})
						})
					})
				})
			})
		})
	})
end