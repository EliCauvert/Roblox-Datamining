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

return function(p1)
	-- upvalues: useLocalization (ref), useDispatch (ref), usePreferredInput (ref), appChatSquadButtonHideGamepadIconOnTvRemote (ref), useIsTvRemoteDevice (ref), useTokens (ref), react (ref), squadExternalContractContext (ref), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (ref), useSquadState (ref), reactOtterModule (ref), t (ref), useSelector (ref), squadButtonClickIntentionEnumModule (ref), eventNamesModule (ref), leaveSquad (ref), squadPromptType (ref), appChatSquadButtonColorVariantB (ref), appChatSquadButtonColorUpdateIxpEnabled (ref), IXPService (ref), appChatSquadButtonColorUpdateIxpLayer (ref), foundation (ref), appChatSquadButtonColorUpdate (ref), squadState (ref), fFlagDebugAppChatEnableDomLocators (ref), appChatNewSquadJoinButtonLookIconless (ref), responsiveModule (ref), userInputService (ref)
	local createElement_1
	local var1 = useLocalization({
		joinButtonText = "Feature.Squads.Action.Join",
		startButtonText = "Feature.Squads.Action.Start",
		viewButtonText = "Feature.Squads.Action.View"
	})
	local var2 = useDispatch()
	local var3 = usePreferredInput()
	local var4 = if appChatSquadButtonHideGamepadIconOnTvRemote then useIsTvRemoteDevice() else false
	local var5 = useTokens()
	local var6 = react.useContext(squadExternalContractContext)
	local var7 = var6.useParentChannelHasGroupUp(p1.conversationId)
	local var8 = if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var6.useIsChatEnabled() else true
	local var9 = useSquadState()
	local _ = nil
	local var10 = nil
	local var11, var12 = reactOtterModule.useAnimatedBinding(1, function(p2)
		-- upvalues: p1 (ref), var10 (write), reactOtterModule (copy), t (copy)
		if p1.shouldAnimate then
			task.delay(0.5, function()
				-- upvalues: var10 (copy), reactOtterModule (copy), p2 (ref), t (copy)
				var10(reactOtterModule.spring(if p2 == 1 then 0 else 1, t))
			end)
		end
	end)
	var10 = var12
	react.useEffect(function()
		-- upvalues: p1 (ref), var10 (write), reactOtterModule (copy), t (copy)
		if p1.shouldAnimate then
			var10(reactOtterModule.spring(1, t))
			
			return
		end
		var10(reactOtterModule.instant(1))
	end, { p1.shouldAnimate, var10 })
	local var13 = useSelector(react.useCallback(function(p2)
		return if p2.Squad and p2.Squad.Squad then p2.Squad.Squad.currentSquad else nil
	end, {}))
	local var14 = react.useMemo(function()
		-- upvalues: var13 (ref), p1 (ref)
		return var13 and var13.parentChannelId == p1.conversationId
	end, { var13, p1.conversationId })
	local var15 = react.useMemo(function()
		-- upvalues: var14 (ref), squadButtonClickIntentionEnumModule (copy), var7 (ref)
		return if var14 then squadButtonClickIntentionEnumModule.View elseif var7 then squadButtonClickIntentionEnumModule.Join else squadButtonClickIntentionEnumModule.Create
	end, { var14, var7 })
	local var16 = react.useMemo(function()
		-- upvalues: var14 (ref), var1 (ref), var7 (ref)
		return if var14 then var1.viewButtonText elseif var7 then var1.joinButtonText else var1.startButtonText
	end, {
		var7,
		var14,
		var1.joinButtonText,
		var1.startButtonText,
		var1.viewButtonText
	})
	local var17 = react.useCallback(function()
		-- upvalues: var6 (ref), eventNamesModule (copy), p1 (ref), var13 (ref), var15 (ref)
		var6.fireSquadAnalytics(eventNamesModule.EnterSquadButtonPressed, {
			conversationId = p1.conversationId,
			squadButtonSource = p1.squadButtonSource,
			squadId = var13 and var13.squadId,
			squadLocation = p1.squadLocation,
			userIntention = var15
		})
	end, {
		var15, var13, p1.conversationId, p1.squadButtonSource, p1.squadLocation,
		var6.fireSquadAnalytics
	})
	local var18 = react.useCallback(function()
		-- upvalues: var17 (ref), var14 (ref), var13 (ref), var2 (ref), leaveSquad (copy), squadPromptType (copy), var6 (ref), p1 (ref), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), var8 (ref)
		var17()
		
		if var14 or not var13 then
			p1.onActivated(p1.conversationId)
			
			return
		end
		var2(leaveSquad(squadPromptType.JoinAnotherSquad, var6.setSquadPrompt, function()
			-- upvalues: p1 (copy)
			p1.onActivated(p1.conversationId)
		end, var6.squadLocation, if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var8 else true))
	end, {
		var13, var14, p1.onActivated, var17, var6.setSquadPrompt, var6.squadLocation,
		if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var8 else nil
	})
	local var19 = react.useMemo(function()
		-- upvalues: var5 (ref), p1 (ref)
		return if var5.Config.ColorMode.IsLight == "true" then if p1.isInCard then var5.Color.Extended.Gray.Gray_300 else var5.Color.Extended.Gray.Gray_200 elseif p1.isInCard then var5.Color.Extended.Gray.Gray_800 else var5.Color.Extended.Gray.Gray_900
	end, { p1.isInCard, var5.Config.ColorMode.IsLight })
	local var20 = var15 == squadButtonClickIntentionEnumModule.View
	local var21 = not appChatSquadButtonColorVariantB
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
			["bg-action-standard stroke-action-standard"] = not var20,
			["bg-action-soft-emphasis stroke-action-soft-emphasis"] = var20 and var21,
			["bg-action-emphasis stroke-action-emphasis"] = var20 and appChatSquadButtonColorVariantB
		} else "row align-x-center align-y-center gap-xsmall stroke-action-standard radius-medium bg-action-standard",
		AutomaticSize = if p1.isFullWidth then Enum.AutomaticSize.None else Enum.AutomaticSize.XY,
		Size = UDim2.new(if p1.isFullWidth then 1 else 0, 0, 0, var5.Size.Size_800),
		isDisabled = var9 == squadState.Initializing,
		onActivated = var18,
		LayoutOrder = p1.layoutOrder,
		padding = {
			left = UDim.new(0, var5.Padding.Small),
			right = UDim.new(0, var5.Padding.Small)
		},
		selection = { Selectable = p1.Selectable },
		testId = if fFlagDebugAppChatEnableDomLocators then `{p1.testId}{var15}` else nil
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
				style = var5.Color.ActionStandard.Foreground,
				variant = foundation.Enums.IconVariant.Regular
			}),
			GreenDot = if var7 or var14 then react.createElement(foundation.View, {
				tag = "radius-circle anchor-top-right",
				ZIndex = 2,
				Size = UDim2.fromOffset(var5.Size.Size_200, var5.Size.Size_200),
				backgroundStyle = var11:map(function(p2)
					-- upvalues: var5 (ref)
					return {
						Color3 = var5.Color.Extended.Green.Green_500.Color3,
						Transparency = 1 + (var5.Color.Extended.Green.Green_500.Transparency - 1) * p2
					}
				end),
				Position = UDim2.new(1, var5.Size.Size_50, 0, -var5.Size.Size_50),
				stroke = {
					Color = var19.Color3,
					Transparency = var11:map(function(p2)
						-- upvalues: var19 (ref)
						return 1 + (var19.Transparency - 1) * p2
					end),
					Thickness = var5.Stroke.Thicker
				}
			}) else nil
		})
	end
	local var22
	t_2.GroupIconContainer = createElement_1
	t_2.TextLabel = react.createElement(foundation.Text, {
		LayoutOrder = 2,
		tag = if appChatSquadButtonColorUpdate then {
			["auto-xy text-label-small text-no-wrap text-truncate-end"] = true,
			["content-action-standard"] = not var20,
			["content-action-soft-emphasis"] = var20 and var21,
			["content-action-emphasis"] = var20 and appChatSquadButtonColorVariantB
		} else "auto-xy text-label-small content-action-standard text-truncate-end text-no-wrap",
		Text = var16,
		padding = { right = UDim.new(0, var5.Padding.XXSmall) },
		sizeConstraint = if p1.isFullWidth then nil else {
			MaxSize = Vector2.new(var5.Size.Size_2800, var5.Size.Size_800)
		}
	})
	
	if p1.shouldShowSignifier and var3 == responsiveModule.Input.Directional and not var4 then
		var22 = react.createElement
		var22 = var22(foundation.Icon, {
			LayoutOrder = 3,
			name = userInputService:GetImageForKeyCode(Enum.KeyCode.ButtonX),
			size = foundation.Enums.IconSize.Small,
			style = if appChatSquadButtonColorUpdate and var20 then if appChatSquadButtonColorVariantB then var5.Color.ActionEmphasis.Foreground else var5.Color.ActionSoftEmphasis.Foreground else var5.Color.ActionStandard.Foreground
		})
	else
		var22 = nil
	end
	t_2.SignifierImage = var22
	
	return createElement(view, t_1, t_2)
end