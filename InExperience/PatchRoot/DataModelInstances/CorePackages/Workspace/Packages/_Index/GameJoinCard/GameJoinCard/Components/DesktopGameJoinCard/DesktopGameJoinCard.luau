local parent = script:FindFirstAncestor("GameJoinCard").Parent
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
local fFlagJoinCardAgeCheckUpsell = sharedFlagsModule.FFlagJoinCardAgeCheckUpsell
local fFlagBlockEDPClickthrough = sharedFlagsModule.FFlagBlockEDPClickthrough
local fFlagDesktopGameJoinCardUIImprovements = sharedFlagsModule.FFlagDesktopGameJoinCardUIImprovements
local ageCheckUpsellCTAModule = require(script.Parent.Parent.AgeCheckUpsellCTA)

return function(p0)
	-- upvalues: useTokens (ref), useScaledValue (ref), useLocalization (ref), reactModule (ref), getBuilderIconForCurrentPlatform (ref), viewEDPsourceValues (ref), viewProfileSourceValues (ref), fFlagDesktopGameJoinCardUIImprovements (ref), controlState (ref), fFlagJoinCardAgeCheckUpsell (ref), view (ref), fFlagEnableConsoleGameJoinCard (ref), image (ref), fFlagBlockEDPClickthrough (ref), stateLayerAffordance (ref), skeleton (ref), radius (ref), text (ref), icon (ref), iconSize (ref), ageCheckUpsellCTAModule (ref), button (ref), buttonVariant (ref), inputSize (ref), foundationModule (ref)
	local var5 = useTokens()
	local var6 = useScaledValue(260)
	local var7 = useLocalization({
		isPlaying = "Feature.Friends.Text.IsPlaying",
		joinButton = "Feature.Profile.Action.JoinGame",
		chat = "Feature.Profile.Action.Chat",
		viewProfile = "Feature.Profile.Action.ViewProfile"
	})
	local layoutOrder = p0.layoutOrder
	local playerName = p0.playerName
	local experienceName = p0.experienceName
	local gameIconUrl = p0.gameIconUrl
	local isLoading = p0.isLoading
	local var8 = if p0.isConsole then var5.Size.Size_1500 else var5.Size.Size_1000
	local var9 = reactModule.useMemo(function()
		-- upvalues: getBuilderIconForCurrentPlatform (copy)
		return getBuilderIconForCurrentPlatform()
	end, {})
	local var10 = reactModule.useCallback(function()
		-- upvalues: p0 (ref), viewEDPsourceValues (copy)
		p0.onViewExperienceDetails(viewEDPsourceValues.Thumbnail)
	end, { p0 })
	local var11 = reactModule.useCallback(function()
		-- upvalues: p0 (ref), viewEDPsourceValues (copy)
		p0.onViewExperienceDetails(viewEDPsourceValues.Title)
	end, { p0 })
	local var12 = reactModule.useCallback(function()
		-- upvalues: p0 (ref), viewProfileSourceValues (copy)
		if p0.onViewProfile then
			p0.onViewProfile(viewProfileSourceValues.ViewProfileButton)
		end
	end, { p0 })
	local var13 = nil
	local _ = nil
	local var14 = nil
	
	if fFlagDesktopGameJoinCardUIImprovements then
		local var15, var16 = reactModule.useState(false)
		var13 = var15
		local var17 = var16
		var14 = reactModule.useCallback(function(p1)
			-- upvalues: var17 (write), controlState (copy)
			var17(p1 == controlState.Hover)
		end, {})
	end
	local createElement_2
	local var18 = if fFlagDesktopGameJoinCardUIImprovements and var13 then `<u>{var7.viewProfile}</u>` else var7.viewProfile
	local var19 = fFlagJoinCardAgeCheckUpsell and p0.ageCheckRequired == true
	local createElement = reactModule.createElement
	local t = {
		tag = "col gap-medium padding-large radius-medium stroke-thin stroke-muted",
		Size = UDim2.fromOffset(var6, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = layoutOrder,
		backgroundStyle = var5.Color.OverMedia.OverMedia_300,
		ref = if fFlagEnableConsoleGameJoinCard then p0.focusRootRef else nil
	}
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local t_2 = {
		tag = "row gap-small items-center size-full-0 auto-y align-x-left",
		LayoutOrder = 1
	}
	local t_3 = {}
	
	if isLoading then
		createElement_2 = reactModule.createElement(skeleton, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(var8, var8),
			radius = radius.Small
		})
	else
		createElement_2 = reactModule.createElement
		createElement_2 = createElement_2(view, {
			LayoutOrder = 1,
			ClipsDescendants = true,
			Size = UDim2.fromOffset(var8, var8)
		}, {
			Thumbnail = reactModule.createElement(image, {
				tag = "radius-small",
				Image = gameIconUrl,
				Size = UDim2.fromScale(1, 1),
				ScaleType = Enum.ScaleType.Fit,
				onActivated = if fFlagBlockEDPClickthrough then nil else var10,
				stateLayer = if fFlagBlockEDPClickthrough or not p0.onViewExperienceDetails then nil else { affordance = stateLayerAffordance.None }
			})
		})
	end
	local var27
	t_3.GameIcon = createElement_2
	local createElement_3 = reactModule.createElement
	local var24 = view
	local t_4 = {
		tag = "col size-full-0 auto-y gap-xxsmall shrink align-x-left items-start",
		LayoutOrder = 2,
		AutomaticSize = Enum.AutomaticSize.Y
	}
	local t_5 = {
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
					Text = var7.isPlaying
				})
			}) else reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(0.7, 0, 0, var5.Typography.BodyMedium.FontSize),
				radius = radius.Small
			}),
			GameName = if not isLoading then reactModule.createElement(view, {
				tag = "size-full-0 auto-y",
				LayoutOrder = 2,
				onActivated = if fFlagBlockEDPClickthrough then nil else var11,
				stateLayer = if fFlagBlockEDPClickthrough then nil else { affordance = stateLayerAffordance.None }
			}, {
				Label = reactModule.createElement(text, {
					Text = experienceName,
					tag = {
						["size-full-0 auto-y text-title-medium text-no-wrap text-align-x-left content-emphasis"] = true,
						["text-truncate-split"] = fFlagDesktopGameJoinCardUIImprovements,
						["text-truncate-end"] = not fFlagDesktopGameJoinCardUIImprovements
					}
				})
			}) else reactModule.createElement(skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(0.5, 0, 0, var5.Typography.TitleMedium.FontSize),
				radius = radius.Small
			})
		})
	}
	
	if not p0.isConsole then
		var27 = nil
	elseif isLoading then
		var27 = reactModule.createElement(skeleton, {
			LayoutOrder = 2,
			Size = UDim2.new(0.6, 0, 0, var5.Typography.BodySmall.FontSize),
			radius = radius.Small
		})
	else
		var27 = reactModule.createElement
		var27 = var27(view, {
			LayoutOrder = 2,
			tag = "row align-x-left items-center gap-small size-full-0 auto-y",
			onActivated = if fFlagEnableConsoleGameJoinCard then p0.onPlatformProfilePressed else nil,
			selection = if fFlagEnableConsoleGameJoinCard and p0.onPlatformProfilePressed then { Selectable = true } else nil,
			stateLayer = if fFlagEnableConsoleGameJoinCard and p0.onPlatformProfilePressed then { affordance = stateLayerAffordance.Background } else nil
		}, {
			PlatformLogo = reactModule.createElement(view, { tag = "auto-xy shrink", LayoutOrder = 1 }, {
				LogoImage = reactModule.createElement(icon, { name = var9, size = iconSize.XSmall })
			}),
			PlatformNameLabel = reactModule.createElement(text, {
				tag = "fill shrink auto-y text-body-small content-default text-no-wrap text-truncate-end text-align-x-left",
				LayoutOrder = 2,
				Text = p0.consolePlatformLabel
			})
		})
	end
	t_5.PlatformName = var27
	t_3.TextContainer = createElement_3(var24, t_4, t_5)
	t_1.GameInfoRow = createElement_1(view, t_2, t_3)
	t_1.Actions = if not p0.isConsole then reactModule.createElement(view, {
		tag = "col gap-small size-full-0 auto-y",
		LayoutOrder = 2
	}, {
		JoinButton = if var19 then reactModule.createElement(ageCheckUpsellCTAModule, {
			LayoutOrder = 1,
			onUnlockPressed = p0.onAgeCheckPressed or function() end
		}) else reactModule.createElement(button, {
			tag = "align-x-center fill size-full-0",
			LayoutOrder = 1,
			text = var7.joinButton,
			onActivated = p0.onJoin,
			isLoading = isLoading,
			variant = buttonVariant.Emphasis,
			size = inputSize.Medium,
			width = UDim.new(1, 0)
		}),
		ChatButton = if p0.onChat ~= nil then nil else reactModule.createElement(button, {
			tag = "align-x-center fill size-full-0",
			LayoutOrder = 2,
			text = var7.chat,
			onActivated = p0.onChat,
			variant = buttonVariant.Standard,
			size = inputSize.Medium,
			width = UDim.new(1, 0)
		}),
		ViewProfileButton = if p0.onViewProfile ~= nil then nil else reactModule.createElement(view, {
			tag = "row align-x-center align-y-center",
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 0, var5.Size.Size_600),
			onActivated = var12,
			onStateChanged = if fFlagDesktopGameJoinCardUIImprovements then var14 else nil,
			stateLayer = { affordance = stateLayerAffordance.None }
		}, {
			Label = reactModule.createElement(text, {
				tag = "auto-xy text-title-medium text-align-x-center content-emphasis",
				Text = var18,
				RichText = fFlagDesktopGameJoinCardUIImprovements
			})
		})
	}) else nil
	createElement = createElement(view, t, t_1)
	
	return reactModule.createElement(foundationModule.Popover.Root, { isOpen = p0.isOpen }, {
		Anchor = reactModule.createElement(foundationModule.Popover.Anchor, { anchorRef = p0.anchorRef }),
		Content = reactModule.createElement(foundationModule.Popover.Content, {
			hasArrow = false,
			align = foundationModule.Enums.PopoverAlign.Center,
			side = if fFlagEnableConsoleGameJoinCard and p0.isConsole then {
				position = foundationModule.Enums.PopoverSide.Bottom,
				offset = var5.Padding.Small
			} else foundationModule.Enums.PopoverSide.Bottom,
			radius = foundationModule.Enums.Radius.Medium,
			backgroundStyle = var5.Color.None,
			onPressedOutside = p0.onClose
		}, { GameJoinCard = createElement })
	})
end