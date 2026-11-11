local Parent = script:FindFirstAncestor("GameJoinCard").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local View = FoundationModule.View
local Text = FoundationModule.Text
local Image = FoundationModule.Image
local Icon = FoundationModule.Icon
local Button = FoundationModule.Button
local Skeleton = FoundationModule.Skeleton
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize
local Radius = FoundationModule.Enums.Radius
local GetBuilderIconForCurrentPlatformFunction = FoundationModule.Utility.getBuilderIconForCurrentPlatform
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local AnalyticsConstantsModule = require(script.Parent.Parent.Parent.Analytics.AnalyticsConstants)
local ViewEDPsourceValues = AnalyticsConstantsModule.viewEDPsourceValues
local ViewProfileSourceValues = AnalyticsConstantsModule.viewProfileSourceValues
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableConsoleGameJoinCard = SharedFlagsModule.FFlagEnableConsoleGameJoinCard
local FFlagJoinCardAgeCheckUpsell = SharedFlagsModule.FFlagJoinCardAgeCheckUpsell
local FFlagBlockEDPClickthrough = SharedFlagsModule.FFlagBlockEDPClickthrough
local AgeCheckUpsellCTAModule = require(script.Parent.Parent.AgeCheckUpsellCTA)

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseScaledValueFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), GetBuilderIconForCurrentPlatformFunction (copy), ViewEDPsourceValues (copy), ViewProfileSourceValues (copy), FFlagJoinCardAgeCheckUpsell (copy), View (copy), FFlagEnableConsoleGameJoinCard (copy), Image (copy), FFlagBlockEDPClickthrough (copy), StateLayerAffordance (copy), Skeleton (copy), Radius (copy), Text (copy), Icon (copy), IconSize (copy), AgeCheckUpsellCTAModule (copy), Button (copy), ButtonVariant (copy), InputSize (copy), FoundationModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseScaledValueResult = UseScaledValueFunction(260)
	local UseLocalizationResult = UseLocalizationFunction({
		isPlaying = "Feature.Friends.Text.IsPlaying",
		joinButton = "Feature.Profile.Action.JoinGame",
		chat = "Feature.Profile.Action.Chat",
		viewProfile = "Feature.Profile.Action.ViewProfile"
	})
	local PlayerName = p1.playerName
	local ExperienceName = p1.experienceName
	local GameIconUrl = p1.gameIconUrl
	local IsLoading = p1.isLoading
	local Size1500 = if p1.isConsole then UseTokensResult.Size.Size_1500 else UseTokensResult.Size.Size_1000
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetBuilderIconForCurrentPlatformFunction (upval)
		return GetBuilderIconForCurrentPlatformFunction()
	end, {})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), ViewEDPsourceValues (upval)
		p1.onViewExperienceDetails(ViewEDPsourceValues.Thumbnail)
	end, { p1 })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), ViewEDPsourceValues (upval)
		p1.onViewExperienceDetails(ViewEDPsourceValues.Title)
	end, { p1 })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), ViewProfileSourceValues (upval)
		if p1.onViewProfile then
			p1.onViewProfile(ViewProfileSourceValues.ViewProfileButton)
		end
	end, { p1 })
	local IsAgeCheckRequired: boolean = FFlagJoinCardAgeCheckUpsell and p1.ageCheckRequired == true
	
	return ReactModule.createElement(FoundationModule.Popover.Root, { isOpen = p1.isOpen }, {
		Anchor = ReactModule.createElement(FoundationModule.Popover.Anchor, { anchorRef = p1.anchorRef }),
		Content = ReactModule.createElement(FoundationModule.Popover.Content, {
			hasArrow = false,
			align = FoundationModule.Enums.PopoverAlign.Center,
			side = if FFlagEnableConsoleGameJoinCard and p1.isConsole then {
				position = FoundationModule.Enums.PopoverSide.Bottom,
				offset = UseTokensResult.Padding.Small
			} else FoundationModule.Enums.PopoverSide.Bottom,
			radius = FoundationModule.Enums.Radius.Medium,
			backgroundStyle = UseTokensResult.Color.None,
			onPressedOutside = p1.onClose
		}, {
			GameJoinCard = ReactModule.createElement(View, {
				tag = "col gap-medium padding-large radius-medium stroke-thin stroke-muted",
				Size = UDim2.fromOffset(UseScaledValueResult, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				LayoutOrder = p1.layoutOrder,
				backgroundStyle = UseTokensResult.Color.OverMedia.OverMedia_300,
				ref = if FFlagEnableConsoleGameJoinCard then p1.focusRootRef else nil
			}, {
				GameInfoRow = ReactModule.createElement(View, {
					tag = "row gap-small items-center size-full-0 auto-y align-x-left",
					LayoutOrder = 1
				}, {
					GameIcon = if IsLoading then ReactModule.createElement(Skeleton, {
						LayoutOrder = 1,
						Size = UDim2.fromOffset(Size1500, Size1500),
						radius = Radius.Small
					}) else ReactModule.createElement(View, {
						LayoutOrder = 1,
						ClipsDescendants = true,
						Size = UDim2.fromOffset(Size1500, Size1500)
					}, {
						Thumbnail = ReactModule.createElement(Image, {
							tag = "radius-small",
							Image = GameIconUrl,
							Size = UDim2.fromScale(1, 1),
							ScaleType = Enum.ScaleType.Fit,
							onActivated = if FFlagBlockEDPClickthrough then nil else UseResult,
							stateLayer = if FFlagBlockEDPClickthrough or not p1.onViewExperienceDetails then nil else { affordance = StateLayerAffordance.None }
						})
					}),
					TextContainer = ReactModule.createElement(View, {
						tag = "col size-full-0 auto-y gap-xxsmall shrink align-x-left items-start",
						LayoutOrder = 2,
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						GameInfo = ReactModule.createElement(View, {
							tag = "col size-full-0 auto-y shrink align-x-left items-start",
							LayoutOrder = 1,
							AutomaticSize = Enum.AutomaticSize.Y
						}, {
							GameTitle = if IsLoading then ReactModule.createElement(Skeleton, {
								LayoutOrder = 1,
								Size = UDim2.new(0.7, 0, 0, UseTokensResult.Typography.BodyMedium.FontSize),
								radius = Radius.Small
							}) else ReactModule.createElement(View, {
								tag = "row auto-y gap-xxsmall size-full-0 align-x-left align-y-center text-body-medium content-default text-align-x-left",
								LayoutOrder = 1
							}, {
								PlayerName = ReactModule.createElement(Text, {
									tag = "shrink auto-xy text-body-medium content-default text-no-wrap text-truncate-end text-align-x-left",
									LayoutOrder = 1,
									Text = PlayerName
								}),
								IsPlaying = ReactModule.createElement(Text, {
									tag = "shrink-0 auto-xy text-body-medium content-default text-align-x-left",
									LayoutOrder = 2,
									Text = UseLocalizationResult.isPlaying
								})
							}),
							GameName = if IsLoading then ReactModule.createElement(Skeleton, {
								LayoutOrder = 2,
								Size = UDim2.new(0.5, 0, 0, UseTokensResult.Typography.TitleMedium.FontSize),
								radius = Radius.Small
							}) else ReactModule.createElement(View, {
								tag = "size-full-0 auto-y",
								LayoutOrder = 2,
								onActivated = if FFlagBlockEDPClickthrough then nil else UseResult1,
								stateLayer = if FFlagBlockEDPClickthrough then nil else { affordance = StateLayerAffordance.None }
							}, {
								Label = ReactModule.createElement(Text, {
									tag = "size-full-0 auto-y text-title-medium content-emphasis text-no-wrap text-truncate-end text-align-x-left",
									Text = ExperienceName
								})
							})
						}),
						PlatformName = if p1.isConsole then if IsLoading then ReactModule.createElement(Skeleton, {
							LayoutOrder = 2,
							Size = UDim2.new(0.6, 0, 0, UseTokensResult.Typography.BodySmall.FontSize),
							radius = Radius.Small
						}) else ReactModule.createElement(View, {
							LayoutOrder = 2,
							tag = "row align-x-left items-center gap-small size-full-0 auto-y",
							onActivated = if FFlagEnableConsoleGameJoinCard then p1.onPlatformProfilePressed else nil,
							selection = if FFlagEnableConsoleGameJoinCard and p1.onPlatformProfilePressed then { Selectable = true } else nil,
							stateLayer = if FFlagEnableConsoleGameJoinCard and p1.onPlatformProfilePressed then { affordance = StateLayerAffordance.Background } else nil
						}, {
							PlatformLogo = ReactModule.createElement(View, { tag = "auto-xy shrink", LayoutOrder = 1 }, {
								LogoImage = ReactModule.createElement(Icon, { name = UseMemoResult, size = IconSize.XSmall })
							}),
							PlatformNameLabel = ReactModule.createElement(Text, {
								tag = "fill shrink auto-y text-body-small content-default text-no-wrap text-truncate-end text-align-x-left",
								LayoutOrder = 2,
								Text = p1.consolePlatformLabel
							})
						}) else nil
					})
				}),
				Actions = if p1.isConsole then nil else ReactModule.createElement(View, {
					tag = "col gap-small size-full-0 auto-y",
					LayoutOrder = 2
				}, {
					JoinButton = if IsAgeCheckRequired then ReactModule.createElement(AgeCheckUpsellCTAModule, {
						LayoutOrder = 1,
						onUnlockPressed = p1.onAgeCheckPressed or function() end
					}) else ReactModule.createElement(Button, {
						tag = "align-x-center fill size-full-0",
						LayoutOrder = 1,
						text = UseLocalizationResult.joinButton,
						onActivated = p1.onJoin,
						isLoading = IsLoading,
						variant = ButtonVariant.Emphasis,
						size = InputSize.Medium,
						width = UDim.new(1, 0)
					}),
					ChatButton = if p1.onChat == nil then nil else ReactModule.createElement(Button, {
						tag = "align-x-center fill size-full-0",
						LayoutOrder = 2,
						text = UseLocalizationResult.chat,
						onActivated = p1.onChat,
						variant = ButtonVariant.Standard,
						size = InputSize.Medium,
						width = UDim.new(1, 0)
					}),
					ViewProfileButton = if p1.onViewProfile == nil then nil else ReactModule.createElement(View, {
						tag = "row align-x-center align-y-center",
						LayoutOrder = 3,
						Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_600),
						onActivated = UseResult2,
						stateLayer = { affordance = StateLayerAffordance.None }
					}, {
						Label = ReactModule.createElement(Text, {
							tag = "auto-xy text-title-medium text-align-x-center content-emphasis",
							Text = UseLocalizationResult.viewProfile
						})
					})
				})
			})
		})
	})
end