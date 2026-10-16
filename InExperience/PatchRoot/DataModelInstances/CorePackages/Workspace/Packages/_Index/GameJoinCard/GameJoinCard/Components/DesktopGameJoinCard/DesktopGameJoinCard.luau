local GameJoinCard = script:FindFirstAncestor("GameJoinCard")
local Parent = GameJoinCard.Parent
local ReactModule = require(Parent.React)
local UseComposedRefFunction = require(Parent.ReactUtils).useComposedRef
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
local ControlState = FoundationModule.Enums.ControlState
local AnalyticsConstantsModule = require(script.Parent.Parent.Parent.Analytics.AnalyticsConstants)
local ViewEDPsourceValues = AnalyticsConstantsModule.viewEDPsourceValues
local ViewProfileSourceValues = AnalyticsConstantsModule.viewProfileSourceValues
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagBlockEDPClickthrough = SharedFlagsModule.FFlagBlockEDPClickthrough
local FFlagJoinabilityCTARefactor = SharedFlagsModule.FFlagJoinabilityCTARefactor
local FFlagDesktopGameJoinCardGamepadSupport = SharedFlagsModule.FFlagDesktopGameJoinCardGamepadSupport
local UseGameJoinCardGamepadNavigationFunction = nil
local AssignPrimaryFocusRefFunction = nil

if FFlagDesktopGameJoinCardGamepadSupport then
	local UseGameJoinCardGamepadNavigationModule = require(GameJoinCard.Hooks.useGameJoinCardGamepadNavigation)
	UseGameJoinCardGamepadNavigationFunction = UseGameJoinCardGamepadNavigationModule.useGameJoinCardGamepadNavigation
	AssignPrimaryFocusRefFunction = UseGameJoinCardGamepadNavigationModule.assignPrimaryFocusRef
end
local AgeCheckUpsellCTAModule = require(script.Parent.Parent.AgeCheckUpsellCTA)
local _ = require(GameJoinCard.Components.Actions.Types)
local BuildJoinCardActionsComponentModule = require(GameJoinCard.Components.Actions.buildJoinCardActionsComponent)

return function(p1) --[[ Line: 78 | Named "DesktopGameJoinCard" ]]
	-- upvalues: UseTokensFunction (copy), UseScaledValueFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), GetBuilderIconForCurrentPlatformFunction (copy), ViewEDPsourceValues (copy), ViewProfileSourceValues (copy), ControlState (copy), FFlagDesktopGameJoinCardGamepadSupport (copy), UseGameJoinCardGamepadNavigationFunction (ref), UseComposedRefFunction (copy), FFlagJoinabilityCTARefactor (copy), Skeleton (copy), Radius (copy), AssignPrimaryFocusRefFunction (ref), BuildJoinCardActionsComponentModule (copy), Button (copy), View (copy), Image (copy), FFlagBlockEDPClickthrough (copy), StateLayerAffordance (copy), Text (copy), Icon (copy), IconSize (copy), AgeCheckUpsellCTAModule (copy), ButtonVariant (copy), InputSize (copy), FoundationModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseScaledValueResult = UseScaledValueFunction(260)
	local UseLocalizationResult = UseLocalizationFunction({
		isPlaying = "Feature.Friends.Text.IsPlaying",
		joinButton = "Feature.Profile.Action.JoinGame",
		chat = "Feature.Profile.Action.Chat",
		viewProfile = "Feature.Profile.Action.ViewProfile",
		playTogether = "Feature.GameJoin.Label.PlayTogether",
		playTogetherSoon = "Feature.GameJoin.Label.PlayTogetherSoon",
		differentServer = "Feature.GameJoin.Description.DifferentServer"
	})
	local LayoutOrder = p1.layoutOrder
	local PlayerName = p1.playerName
	local ExperienceName = p1.experienceName
	local GameIconUrl = p1.gameIconUrl
	local IsLoading = p1.isLoading
	local Size1500 = if p1.isConsole then UseTokensResult.Size.Size_1500 else UseTokensResult.Size.Size_1000
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 97 ]]
		-- upvalues: GetBuilderIconForCurrentPlatformFunction (upval)
		return GetBuilderIconForCurrentPlatformFunction()
	end, {})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 101 ]]
		-- upvalues: p1 (copy), ViewEDPsourceValues (upval)
		p1.onViewExperienceDetails(ViewEDPsourceValues.Thumbnail)
	end, { p1 })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 105 ]]
		-- upvalues: p1 (copy), ViewEDPsourceValues (upval)
		p1.onViewExperienceDetails(ViewEDPsourceValues.Title)
	end, { p1 })
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 109 ]]
		-- upvalues: p1 (copy), ViewProfileSourceValues (upval)
		if p1.onViewProfile then
			p1.onViewProfile(ViewProfileSourceValues.ViewProfileButton)
		end
	end, { p1 })
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult3 = ReactModule.useCallback(function(Hover) --[[ Line: 116 ]]
		-- upvalues: UseStateResult2 (copy), ControlState (upval)
		UseStateResult2(Hover == ControlState.Hover)
	end, {})
	local Text1 = if UseStateResult then `<u>{UseLocalizationResult.viewProfile}</u>` else UseLocalizationResult.viewProfile
	local UseGameJoinCardGamepadNavigationResult = if FFlagDesktopGameJoinCardGamepadSupport then UseGameJoinCardGamepadNavigationFunction(p1.onClose, p1.isOpen ~= false) else nil
	local PrimaryButtonFocusRef = if UseGameJoinCardGamepadNavigationResult == nil or p1.isConsole then nil else UseGameJoinCardGamepadNavigationResult.primaryButtonFocusRef
	local RootRef = if UseGameJoinCardGamepadNavigationResult == nil or p1.isConsole then nil else UseGameJoinCardGamepadNavigationResult.rootRef
	local UseComposedRefResult = if FFlagDesktopGameJoinCardGamepadSupport then UseComposedRefFunction(RootRef, p1.focusRootRef) else nil
	local IsAgeCheckRequired = p1.ageCheckRequired == true
	local t = {}
	local v1 = nil
	
	if FFlagJoinabilityCTARefactor then
		if p1.areActionsLoading then
			t.ActionsLoading = ReactModule.createElement(Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_600),
				radius = Radius.Medium
			})
		else
			t, v50 = BuildJoinCardActionsComponentModule(PrimaryButtonFocusRef and AssignPrimaryFocusRefFunction(p1.actions, PrimaryButtonFocusRef) or p1.actions, {
				playTogether = UseLocalizationResult.playTogether,
				playTogetherSoon = UseLocalizationResult.playTogetherSoon,
				differentServer = UseLocalizationResult.differentServer
			}, p1.onClose, function(p2, LayoutOrder) --[[ Line: 158 ]]
				-- upvalues: ReactModule (upval), Button (upval)
				return ReactModule.createElement(Button, {
					tag = "align-x-center fill size-full-0",
					ref = p2.focusRef,
					text = p2.text,
					onActivated = function() --[[ Line: 162 ]]
						-- upvalues: p2 (copy)
						p2.onActivated()
					end,
					isLoading = p2.isLoading,
					isDisabled = p2.isDisabled,
					variant = p2.variant,
					size = p2.inputSize,
					width = p2.width,
					LayoutOrder = LayoutOrder
				})
			end)
		end
	end
	return ReactModule.createElement(FoundationModule.Popover.Root, { isOpen = p1.isOpen }, {
		Anchor = ReactModule.createElement(FoundationModule.Popover.Anchor, { anchorRef = p1.anchorRef }),
		Content = ReactModule.createElement(FoundationModule.Popover.Content, {
			hasArrow = false,
			align = FoundationModule.Enums.PopoverAlign.Center,
			side = if p1.isConsole then {
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
				LayoutOrder = LayoutOrder,
				backgroundStyle = UseTokensResult.Color.OverMedia.OverMedia_300,
				ref = if RootRef == nil then p1.focusRootRef else UseComposedRefResult
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
									tag = "size-full-0 auto-y text-title-medium text-no-wrap text-align-x-left text-truncate-split content-emphasis",
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
							onActivated = p1.onPlatformProfilePressed,
							selection = if p1.onPlatformProfilePressed then { Selectable = true } else nil,
							stateLayer = if p1.onPlatformProfilePressed then { affordance = StateLayerAffordance.Background } else nil
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
				CtaContext = if FFlagJoinabilityCTARefactor and (v1 ~= nil and not p1.isConsole) then ReactModule.createElement(View, {
					tag = "col align-x-left items-start gap-xxsmall size-full-0 auto-y",
					LayoutOrder = 2
				}, {
					CtaContextTitle = ReactModule.createElement(Text, {
						tag = "auto-xy text-body-medium text-align-x-left content-emphasis",
						LayoutOrder = 1,
						Text = v1.title
					}),
					CtaContextSubtitle = if v1.subtitle == nil then nil else ReactModule.createElement(Text, {
						tag = "auto-xy text-label-small text-align-x-left content-muted",
						LayoutOrder = 2,
						Text = v1.subtitle
					})
				}) else nil,
				Actions = if p1.isConsole then nil else ReactModule.createElement(View, {
					tag = "col gap-small size-full-0 auto-y",
					LayoutOrder = 3
				}, if FFlagJoinabilityCTARefactor then t else {
					JoinButton = if IsAgeCheckRequired then ReactModule.createElement(AgeCheckUpsellCTAModule, {
						LayoutOrder = 1,
						onUnlockPressed = p1.onAgeCheckPressed or function() --[[ Line: 345 ]] end,
						focusRef = PrimaryButtonFocusRef
					}) else ReactModule.createElement(Button, {
						tag = "align-x-center fill size-full-0",
						LayoutOrder = 1,
						ref = PrimaryButtonFocusRef,
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
						onStateChanged = UseResult3,
						stateLayer = { affordance = StateLayerAffordance.None }
					}, {
						Label = ReactModule.createElement(Text, {
							RichText = true,
							tag = "auto-xy text-title-medium text-align-x-center content-emphasis",
							Text = Text1
						})
					})
				})
			})
		})
	})
end