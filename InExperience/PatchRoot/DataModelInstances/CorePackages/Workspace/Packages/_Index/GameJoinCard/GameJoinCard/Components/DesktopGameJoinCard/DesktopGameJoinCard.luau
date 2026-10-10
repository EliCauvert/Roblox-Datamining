local gameJoinCard = script:FindFirstAncestor("GameJoinCard")
local parent = gameJoinCard.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local useScaledValue = foundationModule.Hooks.useScaledValue
local useLocalization = require(parent.Localization).Hooks.useLocalization
local view = foundationModule.View
local text = foundationModule.Text
local image = foundationModule.Image
local icon = foundationModule.Icon
local button = foundationModule.Button
local skeleton = foundationModule.Skeleton
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconSize = foundationModule.Enums.IconSize
local inputSize = foundationModule.Enums.InputSize
local radius = foundationModule.Enums.Radius
local getBuilderIconForCurrentPlatform = foundationModule.Utility.getBuilderIconForCurrentPlatform
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local controlState = foundationModule.Enums.ControlState
local analyticsConstantsModule = require(script.Parent.Parent.Parent.Analytics.AnalyticsConstants)
local viewEDPsourceValues = analyticsConstantsModule.viewEDPsourceValues
local viewProfileSourceValues = analyticsConstantsModule.viewProfileSourceValues
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableConsoleGameJoinCard = sharedFlagsModule.FFlagEnableConsoleGameJoinCard
local fFlagBlockEDPClickthrough = sharedFlagsModule.FFlagBlockEDPClickthrough
local fFlagJoinabilityCTARefactor = sharedFlagsModule.FFlagJoinabilityCTARefactor
local ageCheckUpsellCTAModule = require(script.Parent.Parent.AgeCheckUpsellCTA)
local _ = require(gameJoinCard.Components.Actions.Types)
local buildJoinCardActionsComponentModule = require(gameJoinCard.Components.Actions.buildJoinCardActionsComponent)

return function(p1)
	-- upvalues: useTokens (ref), useScaledValue (ref), useLocalization (ref), reactModule (ref), getBuilderIconForCurrentPlatform (ref), viewEDPsourceValues (ref), viewProfileSourceValues (ref), controlState (ref), fFlagJoinabilityCTARefactor (ref), skeleton (ref), radius (ref), buildJoinCardActionsComponentModule (ref), button (ref), view (ref), fFlagEnableConsoleGameJoinCard (ref), image (ref), fFlagBlockEDPClickthrough (ref), stateLayerAffordance (ref), text (ref), icon (ref), iconSize (ref), ageCheckUpsellCTAModule (ref), buttonVariant (ref), inputSize (ref), foundationModule (ref)
	local var1 = useTokens()
	local var2 = useScaledValue(260)
	local var3 = useLocalization({
		isPlaying = "Feature.Friends.Text.IsPlaying",
		joinButton = "Feature.Profile.Action.JoinGame",
		chat = "Feature.Profile.Action.Chat",
		viewProfile = "Feature.Profile.Action.ViewProfile",
		playTogether = "Feature.GameJoin.Label.PlayTogether",
		playTogetherSoon = "Feature.GameJoin.Label.PlayTogetherSoon",
		differentServer = "Feature.GameJoin.Description.DifferentServer"
	})
	local layoutOrder = p1.layoutOrder
	local playerName = p1.playerName
	local experienceName = p1.experienceName
	local gameIconUrl = p1.gameIconUrl
	local isLoading = p1.isLoading
	local var4 = if p1.isConsole then var1.Size.Size_1500 else var1.Size.Size_1000
	local var5 = reactModule.useMemo(function()
		-- upvalues: getBuilderIconForCurrentPlatform (copy)
		return getBuilderIconForCurrentPlatform()
	end, {})
	local var6 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), viewEDPsourceValues (copy)
		p1.onViewExperienceDetails(viewEDPsourceValues.Thumbnail)
	end, { p1 })
	local var7 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), viewEDPsourceValues (copy)
		p1.onViewExperienceDetails(viewEDPsourceValues.Title)
	end, { p1 })
	local var8 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), viewProfileSourceValues (copy)
		if p1.onViewProfile then
			p1.onViewProfile(viewProfileSourceValues.ViewProfileButton)
		end
	end, { p1 })
	local var9, var10 = reactModule.useState(false)
	local var11 = reactModule.useCallback(function(p2)
		-- upvalues: var10 (ref), controlState (copy)
		var10(p2 == controlState.Hover)
	end, {})
	local var12 = if var9 then `<u>{var3.viewProfile}</u>` else var3.viewProfile
	local var13 = p1.ageCheckRequired == true
	local t = {}
	local var14 = nil
	
	if fFlagJoinabilityCTARefactor then
		if p1.areActionsLoading then
			t.ActionsLoading = reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, var1.Size.Size_600),
				radius = radius.Medium
			})
		else
			local var15, var16 = buildJoinCardActionsComponentModule(p1.actions, {
				playTogether = var3.playTogether,
				playTogetherSoon = var3.playTogetherSoon,
				differentServer = var3.differentServer
			}, p1.onClose, function(p2, p3)
				-- upvalues: reactModule (copy), button (copy)
				return reactModule.createElement(button, {
					tag = "align-x-center fill size-full-0",
					text = p2.text,
					onActivated = function()
						-- upvalues: p2 (ref)
						p2.onActivated()
					end,
					isLoading = p2.isLoading,
					isDisabled = p2.isDisabled,
					variant = p2.variant,
					size = p2.inputSize,
					width = p2.width,
					LayoutOrder = p3
				})
			end)
			t = var15
			var14 = var16
		end
	end
	local createElement_2
	local createElement = reactModule.createElement
	local t_1 = {
		tag = "col gap-medium padding-large radius-medium stroke-thin stroke-muted",
		Size = UDim2.fromOffset(var2, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = layoutOrder,
		backgroundStyle = var1.Color.OverMedia.OverMedia_300,
		ref = if fFlagEnableConsoleGameJoinCard then p1.focusRootRef else nil
	}
	local t_2 = {}
	local createElement_1 = reactModule.createElement
	local t_3 = {
		tag = "row gap-small items-center size-full-0 auto-y align-x-left",
		LayoutOrder = 1
	}
	local t_4 = {}
	
	if isLoading then
		createElement_2 = reactModule.createElement(skeleton, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(var4, var4),
			radius = radius.Small
		})
	else
		createElement_2 = reactModule.createElement
		createElement_2 = createElement_2(view, {
			LayoutOrder = 1,
			ClipsDescendants = true,
			Size = UDim2.fromOffset(var4, var4)
		}, {
			Thumbnail = reactModule.createElement(image, {
				tag = "radius-small",
				Image = gameIconUrl,
				Size = UDim2.fromScale(1, 1),
				ScaleType = Enum.ScaleType.Fit,
				onActivated = if fFlagBlockEDPClickthrough then nil else var6,
				stateLayer = if fFlagBlockEDPClickthrough or not p1.onViewExperienceDetails then nil else { affordance = stateLayerAffordance.None }
			})
		})
	end
	local var17
	t_4.GameIcon = createElement_2
	local createElement_3 = reactModule.createElement
	local var18 = view
	local t_5 = {
		tag = "col size-full-0 auto-y gap-xxsmall shrink align-x-left items-start",
		LayoutOrder = 2,
		AutomaticSize = Enum.AutomaticSize.Y
	}
	local t_6 = {
		GameInfo = reactModule.createElement(view, {
			tag = "col size-full-0 auto-y shrink align-x-left items-start",
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			GameTitle = if not isLoading then reactModule.createElement(view, {
				tag = "row auto-y gap-xxsmall size-full-0 align-x-left align-y-center text-body-medium content-default text-align-x-left",
				LayoutOrder = 1
			}, {
				PlayerName = reactModule.createElement(text, {
					tag = "shrink auto-xy text-body-medium content-default text-no-wrap text-truncate-end text-align-x-left",
					LayoutOrder = 1,
					Text = playerName
				}),
				IsPlaying = reactModule.createElement(text, {
					tag = "shrink-0 auto-xy text-body-medium content-default text-align-x-left",
					LayoutOrder = 2,
					Text = var3.isPlaying
				})
			}) else reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(0.7, 0, 0, var1.Typography.BodyMedium.FontSize),
				radius = radius.Small
			}),
			GameName = if not isLoading then reactModule.createElement(view, {
				tag = "size-full-0 auto-y",
				LayoutOrder = 2,
				onActivated = if fFlagBlockEDPClickthrough then nil else var7,
				stateLayer = if fFlagBlockEDPClickthrough then nil else { affordance = stateLayerAffordance.None }
			}, {
				Label = reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-title-medium text-no-wrap text-align-x-left text-truncate-split content-emphasis",
					Text = experienceName
				})
			}) else reactModule.createElement(skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(0.5, 0, 0, var1.Typography.TitleMedium.FontSize),
				radius = radius.Small
			})
		})
	}
	
	if not p1.isConsole then
		var17 = nil
	elseif isLoading then
		var17 = reactModule.createElement(skeleton, {
			LayoutOrder = 2,
			Size = UDim2.new(0.6, 0, 0, var1.Typography.BodySmall.FontSize),
			radius = radius.Small
		})
	else
		var17 = reactModule.createElement
		var17 = var17(view, {
			LayoutOrder = 2,
			tag = "row align-x-left items-center gap-small size-full-0 auto-y",
			onActivated = if fFlagEnableConsoleGameJoinCard then p1.onPlatformProfilePressed else nil,
			selection = if fFlagEnableConsoleGameJoinCard and p1.onPlatformProfilePressed then { Selectable = true } else nil,
			stateLayer = if fFlagEnableConsoleGameJoinCard and p1.onPlatformProfilePressed then { affordance = stateLayerAffordance.Background } else nil
		}, {
			PlatformLogo = reactModule.createElement(view, { tag = "auto-xy shrink", LayoutOrder = 1 }, {
				LogoImage = reactModule.createElement(icon, { name = var5, size = iconSize.XSmall })
			}),
			PlatformNameLabel = reactModule.createElement(text, {
				tag = "fill shrink auto-y text-body-small content-default text-no-wrap text-truncate-end text-align-x-left",
				LayoutOrder = 2,
				Text = p1.consolePlatformLabel
			})
		})
	end
	t_6.PlatformName = var17
	t_4.TextContainer = createElement_3(var18, t_5, t_6)
	t_2.GameInfoRow = createElement_1(view, t_3, t_4)
	t_2.CtaContext = if fFlagJoinabilityCTARefactor and var14 ~= nil and not p1.isConsole then reactModule.createElement(view, {
		tag = "col align-x-left items-start gap-xxsmall size-full-0 auto-y",
		LayoutOrder = 2
	}, {
		CtaContextTitle = reactModule.createElement(text, {
			tag = "auto-xy text-body-medium text-align-x-left content-emphasis",
			LayoutOrder = 1,
			Text = var14.title
		}),
		CtaContextSubtitle = if var14.subtitle ~= nil then nil else reactModule.createElement(text, {
			tag = "auto-xy text-label-small text-align-x-left content-muted",
			LayoutOrder = 2,
			Text = var14.subtitle
		})
	}) else nil
	t_2.Actions = if not p1.isConsole then reactModule.createElement(view, {
		tag = "col gap-small size-full-0 auto-y",
		LayoutOrder = 3
	}, if fFlagJoinabilityCTARefactor then t else {
		JoinButton = if var13 then reactModule.createElement(ageCheckUpsellCTAModule, {
			LayoutOrder = 1,
			onUnlockPressed = p1.onAgeCheckPressed or function() end
		}) else reactModule.createElement(button, {
			tag = "align-x-center fill size-full-0",
			LayoutOrder = 1,
			text = var3.joinButton,
			onActivated = p1.onJoin,
			isLoading = isLoading,
			variant = buttonVariant.Emphasis,
			size = inputSize.Medium,
			width = UDim.new(1, 0)
		}),
		ChatButton = if p1.onChat ~= nil then nil else reactModule.createElement(button, {
			tag = "align-x-center fill size-full-0",
			LayoutOrder = 2,
			text = var3.chat,
			onActivated = p1.onChat,
			variant = buttonVariant.Standard,
			size = inputSize.Medium,
			width = UDim.new(1, 0)
		}),
		ViewProfileButton = if p1.onViewProfile ~= nil then nil else reactModule.createElement(view, {
			tag = "row align-x-center align-y-center",
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 0, var1.Size.Size_600),
			onActivated = var8,
			onStateChanged = var11,
			stateLayer = { affordance = stateLayerAffordance.None }
		}, {
			Label = reactModule.createElement(text, {
				RichText = true,
				tag = "auto-xy text-title-medium text-align-x-center content-emphasis",
				Text = var12
			})
		})
	}) else nil
	createElement = createElement(view, t_1, t_2)
	
	return reactModule.createElement(foundationModule.Popover.Root, { isOpen = p1.isOpen }, {
		Anchor = reactModule.createElement(foundationModule.Popover.Anchor, { anchorRef = p1.anchorRef }),
		Content = reactModule.createElement(foundationModule.Popover.Content, {
			hasArrow = false,
			align = foundationModule.Enums.PopoverAlign.Center,
			side = if fFlagEnableConsoleGameJoinCard and p1.isConsole then {
				position = foundationModule.Enums.PopoverSide.Bottom,
				offset = var1.Padding.Small
			} else foundationModule.Enums.PopoverSide.Bottom,
			radius = foundationModule.Enums.Radius.Medium,
			backgroundStyle = var1.Color.None,
			onPressedOutside = p1.onClose
		}, { GameJoinCard = createElement })
	})
end