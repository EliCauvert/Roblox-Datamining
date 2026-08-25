local IXPService = game:GetService("IXPService")
local userInputService = game:GetService("UserInputService")
local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local reactOtterModule = require(parent.ReactOtter)
local sharedFlagsModule = require(parent.SharedFlags)
local _ = require(squads.Enums.SquadButtonSourceEnum)
local squadButtonClickIntentionEnumModule = require(squads.Enums.SquadButtonClickIntentionEnum)
local responsiveModule = require(parent.Responsive)
local usePreferredInput = responsiveModule.usePreferredInput
local useIsTvRemoteDevice = require(parent.RoactUtils).Hooks.useIsTvRemoteDevice
local dependenciesModule = require(squads.dependencies)
local foundation = dependenciesModule.Foundation
local react = dependenciesModule.React
local _ = require(parent.SquadsCore.Enums)
local squadExternalContractContext = require(parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local squadState = require(parent.SquadsCore.Enums).SquadState
local leaveSquad = require(parent.SquadsCore.Thunks).leaveSquad
local useDispatch = dependenciesModule.Hooks.useDispatch
local useLocalization = dependenciesModule.Hooks.useLocalization
local useSelector = dependenciesModule.Hooks.useSelector
local eventNamesModule = require(parent.SquadsCore.EventNames)
local squadPromptType = require(parent.SquadsCore.Enums).SquadPromptType
local useSquadState = require(parent.SquadsCore.Hooks).useSquadState
local useTokens = foundation.Hooks.useTokens
local fFlagPartyDevAPIToRespectThirdPartySettingsEnabled = sharedFlagsModule.FFlagPartyDevAPIToRespectThirdPartySettingsEnabled
local fFlagDebugAppChatEnableDomLocators = sharedFlagsModule.FFlagDebugAppChatEnableDomLocators
local appChatNewSquadJoinButtonLookIconless = game:DefineFastFlag("AppChatNewSquadJoinButtonLookIconless", false)
local appChatSquadButtonColorUpdate = game:DefineFastFlag("AppChatSquadButtonColorUpdate", false)
local appChatSquadButtonColorVariantB = game:DefineFastFlag("AppChatSquadButtonColorVariantB", false)
local appChatSquadButtonColorUpdateIxpEnabled = game:DefineFastFlag("AppChatSquadButtonColorUpdateIxpEnabled", false)
local appChatSquadButtonColorUpdateIxpLayer = game:DefineFastString("AppChatSquadButtonColorUpdateIxpLayer", "Social.AppChat")
local appChatSquadButtonHideGamepadIconOnTvRemote = game:DefineFastFlag("AppChatSquadButtonHideGamepadIconOnTvRemote", false)
local t = { dampingRatio = 1, frequency = 1 }

return function(p0)
	-- upvalues: useLocalization (ref), useDispatch (ref), usePreferredInput (ref), appChatSquadButtonHideGamepadIconOnTvRemote (ref), useIsTvRemoteDevice (ref), useTokens (ref), react (ref), squadExternalContractContext (ref), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (ref), useSquadState (ref), reactOtterModule (ref), t (ref), useSelector (ref), squadButtonClickIntentionEnumModule (ref), eventNamesModule (ref), leaveSquad (ref), squadPromptType (ref), appChatSquadButtonColorVariantB (ref), appChatSquadButtonColorUpdateIxpEnabled (ref), IXPService (ref), appChatSquadButtonColorUpdateIxpLayer (ref), foundation (ref), appChatSquadButtonColorUpdate (ref), squadState (ref), fFlagDebugAppChatEnableDomLocators (ref), appChatNewSquadJoinButtonLookIconless (ref), responsiveModule (ref), userInputService (ref)
	local createElement_1
	local var16 = useLocalization({
		joinButtonText = "Feature.Squads.Action.Join",
		startButtonText = "Feature.Squads.Action.Start",
		viewButtonText = "Feature.Squads.Action.View"
	})
	local var17 = useDispatch()
	local var18 = usePreferredInput()
	local var19 = if appChatSquadButtonHideGamepadIconOnTvRemote then useIsTvRemoteDevice() else false
	local var20 = useTokens()
	local var21 = react.useContext(squadExternalContractContext)
	local var22 = var21.useParentChannelHasGroupUp(p0.conversationId)
	local var23 = if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var21.useIsChatEnabled() else true
	local var24 = useSquadState()
	local _ = nil
	local var25 = nil
	local var26, var27 = reactOtterModule.useAnimatedBinding(1, function(p1)
		-- upvalues: p0 (ref), var25 (write), reactOtterModule (copy), t (copy)
		if p0.shouldAnimate then
			task.delay(0.5, function()
				-- upvalues: var25 (copy), reactOtterModule (copy), p1 (ref), t (copy)
				var25(reactOtterModule.spring(if p1 == 1 then 0 else 1, t))
			end)
		end
	end)
	var25 = var27
	react.useEffect(function()
		-- upvalues: p0 (ref), var25 (write), reactOtterModule (copy), t (copy)
		if p0.shouldAnimate then
			var25(reactOtterModule.spring(1, t))
			
			return
		end
		var25(reactOtterModule.instant(1))
	end, { p0.shouldAnimate, var25 })
	local var28 = useSelector(react.useCallback(function(p2)
		return if p2.Squad and p2.Squad.Squad then p2.Squad.Squad.currentSquad else nil
	end, {}))
	local var29 = react.useMemo(function()
		-- upvalues: var28 (ref), p0 (ref)
		return var28 and var28.parentChannelId == p0.conversationId
	end, { var28, p0.conversationId })
	local var30 = react.useMemo(function()
		-- upvalues: var29 (ref), squadButtonClickIntentionEnumModule (copy), var22 (ref)
		return if var29 then squadButtonClickIntentionEnumModule.View elseif var22 then squadButtonClickIntentionEnumModule.Join else squadButtonClickIntentionEnumModule.Create
	end, { var29, var22 })
	local var31 = react.useMemo(function()
		-- upvalues: var29 (ref), var16 (ref), var22 (ref)
		return if var29 then var16.viewButtonText elseif var22 then var16.joinButtonText else var16.startButtonText
	end, {
		var22,
		var29,
		var16.joinButtonText,
		var16.startButtonText,
		var16.viewButtonText
	})
	local var32 = react.useCallback(function()
		-- upvalues: var21 (ref), eventNamesModule (copy), p0 (ref), var28 (ref), var30 (ref)
		var21.fireSquadAnalytics(eventNamesModule.EnterSquadButtonPressed, {
			conversationId = p0.conversationId,
			squadButtonSource = p0.squadButtonSource,
			squadId = var28 and var28.squadId,
			squadLocation = p0.squadLocation,
			userIntention = var30
		})
	end, {
		var30, var28, p0.conversationId, p0.squadButtonSource, p0.squadLocation,
		var21.fireSquadAnalytics
	})
	local var33 = react.useCallback(function()
		-- upvalues: var32 (ref), var29 (ref), var28 (ref), var17 (ref), leaveSquad (copy), squadPromptType (copy), var21 (ref), p0 (ref), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), var23 (ref)
		var32()
		
		if var29 or not var28 then
			p0.onActivated(p0.conversationId)
			
			return
		end
		var17(leaveSquad(squadPromptType.JoinAnotherSquad, var21.setSquadPrompt, function()
			-- upvalues: p0 (copy)
			p0.onActivated(p0.conversationId)
		end, var21.squadLocation, if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var23 else true))
	end, {
		var28, var29, p0.onActivated, var32, var21.setSquadPrompt, var21.squadLocation,
		if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var23 else nil
	})
	local var34 = react.useMemo(function()
		-- upvalues: var20 (ref), p0 (ref)
		return if var20.Config.ColorMode.IsLight == "true" then if p0.isInCard then var20.Color.Extended.Gray.Gray_300 else var20.Color.Extended.Gray.Gray_200 elseif p0.isInCard then var20.Color.Extended.Gray.Gray_800 else var20.Color.Extended.Gray.Gray_900
	end, { p0.isInCard, var20.Config.ColorMode.IsLight })
	local var35 = var30 == squadButtonClickIntentionEnumModule.View
	local var36 = not appChatSquadButtonColorVariantB
	react.useEffect(function()
		-- upvalues: appChatSquadButtonColorUpdateIxpEnabled (copy), IXPService (copy), appChatSquadButtonColorUpdateIxpLayer (copy)
		if appChatSquadButtonColorUpdateIxpEnabled then
			IXPService:LogFlagLinkedUserLayerExposure(appChatSquadButtonColorUpdateIxpLayer)
		end
	end, {})
	local createElement = react.createElement
	local view = foundation.View
	local t_1 = {
		tag = if appChatSquadButtonColorUpdate then {
			["row align-x-center align-y-center gap-xsmall radius-medium"] = true,
			["bg-action-standard stroke-action-standard"] = not var35,
			["bg-action-soft-emphasis stroke-action-soft-emphasis"] = var35 and var36,
			["bg-action-emphasis stroke-action-emphasis"] = var35 and appChatSquadButtonColorVariantB
		} else "row align-x-center align-y-center gap-xsmall stroke-action-standard radius-medium bg-action-standard",
		AutomaticSize = if p0.isFullWidth then Enum.AutomaticSize.None else Enum.AutomaticSize.XY,
		Size = UDim2.new(if p0.isFullWidth then 1 else 0, 0, 0, var20.Size.Size_800),
		isDisabled = var24 == squadState.Initializing,
		onActivated = var33,
		LayoutOrder = p0.layoutOrder,
		padding = {
			left = UDim.new(0, var20.Padding.Small),
			right = UDim.new(0, var20.Padding.Small)
		},
		selection = { Selectable = p0.Selectable },
		testId = if fFlagDebugAppChatEnableDomLocators then `{p0.testId}{var30}` else nil
	}
	local t_2 = {}
	
	if appChatNewSquadJoinButtonLookIconless then
		createElement_1 = nil
	else
		createElement_1 = react.createElement
		createElement_1 = createElement_1(foundation.View, { tag = "size-400-400", LayoutOrder = 1 }, {
			GroupIcon = react.createElement(foundation.Icon, {
				name = foundation.Enums.IconName.ThreePeople,
				size = foundation.Enums.IconSize.Small,
				style = var20.Color.ActionStandard.Foreground,
				variant = foundation.Enums.IconVariant.Regular
			}),
			GreenDot = if var22 or var29 then react.createElement(foundation.View, {
				tag = "radius-circle anchor-top-right",
				ZIndex = 2,
				Size = UDim2.fromOffset(var20.Size.Size_200, var20.Size.Size_200),
				backgroundStyle = var26:map(function(p3)
					-- upvalues: var20 (ref)
					return {
						Color3 = var20.Color.Extended.Green.Green_500.Color3,
						Transparency = 1 + (var20.Color.Extended.Green.Green_500.Transparency - 1) * p3
					}
				end),
				Position = UDim2.new(1, var20.Size.Size_50, 0, -var20.Size.Size_50),
				stroke = {
					Color = var34.Color3,
					Transparency = var26:map(function(p4)
						-- upvalues: var34 (ref)
						return 1 + (var34.Transparency - 1) * p4
					end),
					Thickness = var20.Stroke.Thicker
				}
			}) else nil
		})
	end
	local var39
	t_2.GroupIconContainer = createElement_1
	t_2.TextLabel = react.createElement(foundation.Text, {
		LayoutOrder = 2,
		tag = if appChatSquadButtonColorUpdate then {
			["auto-xy text-label-small text-no-wrap text-truncate-end"] = true,
			["content-action-standard"] = not var35,
			["content-action-soft-emphasis"] = var35 and var36,
			["content-action-emphasis"] = var35 and appChatSquadButtonColorVariantB
		} else "auto-xy text-label-small content-action-standard text-truncate-end text-no-wrap",
		Text = var31,
		padding = { right = UDim.new(0, var20.Padding.XXSmall) },
		sizeConstraint = if p0.isFullWidth then nil else {
			MaxSize = Vector2.new(var20.Size.Size_2800, var20.Size.Size_800)
		}
	})
	
	if p0.shouldShowSignifier and var18 == responsiveModule.Input.Directional and not var19 then
		var39 = react.createElement
		var39 = var39(foundation.Icon, {
			LayoutOrder = 3,
			name = userInputService:GetImageForKeyCode(Enum.KeyCode.ButtonX),
			size = foundation.Enums.IconSize.Small,
			style = if appChatSquadButtonColorUpdate and var35 then if appChatSquadButtonColorVariantB then var20.Color.ActionEmphasis.Foreground else var20.Color.ActionSoftEmphasis.Foreground else var20.Color.ActionStandard.Foreground
		})
	else
		var39 = nil
	end
	t_2.SignifierImage = var39
	
	return createElement(view, t_1, t_2)
end