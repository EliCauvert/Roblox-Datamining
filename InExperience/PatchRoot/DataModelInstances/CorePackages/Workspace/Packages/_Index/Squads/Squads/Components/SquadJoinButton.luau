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
local t = { dampingRatio = 1, frequency = 1 }

return function(p0) --[[ line: 67 ]]
	-- upvalues: useLocalization (ref), useDispatch (ref), usePreferredInput (ref), useTokens (ref), react (ref), squadExternalContractContext (ref), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (ref), useSquadState (ref), reactOtterModule (ref), t (ref), useSelector (ref), squadButtonClickIntentionEnumModule (ref), eventNamesModule (ref), leaveSquad (ref), squadPromptType (ref), appChatSquadButtonColorVariantB (ref), appChatSquadButtonColorUpdateIxpEnabled (ref), IXPService (ref), appChatSquadButtonColorUpdateIxpLayer (ref), foundation (ref), appChatSquadButtonColorUpdate (ref), squadState (ref), fFlagDebugAppChatEnableDomLocators (ref), appChatNewSquadJoinButtonLookIconless (ref), responsiveModule (ref), userInputService (ref)
	local createElement_1
	local var15 = useLocalization({
		joinButtonText = "Feature.Squads.Action.Join",
		startButtonText = "Feature.Squads.Action.Start",
		viewButtonText = "Feature.Squads.Action.View"
	})
	local var16 = useDispatch()
	local var17 = usePreferredInput()
	local var18 = useTokens()
	local var19 = react.useContext(squadExternalContractContext)
	local var20 = var19.useParentChannelHasGroupUp(p0.conversationId)
	local var21 = if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var19.useIsChatEnabled() else true
	local var22 = useSquadState()
	local _ = nil
	local var23 = nil
	local var24, var25 = reactOtterModule.useAnimatedBinding(1, function(p1) --[[ line: 87 ]]
		-- upvalues: p0 (ref), var23 (write), reactOtterModule (copy), t (copy)
		if p0.shouldAnimate then
			task.delay(0.5, function() --[[ line: 89 ]]
				-- upvalues: var23 (copy), reactOtterModule (copy), p1 (ref), t (copy)
				var23(reactOtterModule.spring(if p1 == 1 then 0 else 1, t))
			end)
		end
	end)
	var23 = var25
	react.useEffect(function() --[[ line: 95 ]]
		-- upvalues: p0 (ref), var23 (write), reactOtterModule (copy), t (copy)
		if p0.shouldAnimate then
			var23(reactOtterModule.spring(1, t))
			
			return
		end
		var23(reactOtterModule.instant(1))
	end, { p0.shouldAnimate, var23 })
	local var26 = useSelector(react.useCallback(function(p2) --[[ line: 103 ]]
		return if p2.Squad and p2.Squad.Squad then p2.Squad.Squad.currentSquad else nil
	end, {}))
	local var27 = react.useMemo(function() --[[ line: 112 ]]
		-- upvalues: var26 (ref), p0 (ref)
		return var26 and var26.parentChannelId == p0.conversationId
	end, { var26, p0.conversationId })
	local var28 = react.useMemo(function() --[[ line: 116 ]]
		-- upvalues: var27 (ref), squadButtonClickIntentionEnumModule (copy), var20 (ref)
		return if var27 then squadButtonClickIntentionEnumModule.View elseif var20 then squadButtonClickIntentionEnumModule.Join else squadButtonClickIntentionEnumModule.Create
	end, { var27, var20 })
	local var29 = react.useMemo(function() --[[ line: 126 ]]
		-- upvalues: var27 (ref), var15 (ref), var20 (ref)
		return if var27 then var15.viewButtonText elseif var20 then var15.joinButtonText else var15.startButtonText
	end, {
		var20,
		var27,
		var15.joinButtonText,
		var15.startButtonText,
		var15.viewButtonText
	})
	local var30 = react.useCallback(function() --[[ line: 142 ]]
		-- upvalues: var19 (ref), eventNamesModule (copy), p0 (ref), var26 (ref), var28 (ref)
		var19.fireSquadAnalytics(eventNamesModule.EnterSquadButtonPressed, {
			conversationId = p0.conversationId,
			squadButtonSource = p0.squadButtonSource,
			squadId = var26 and var26.squadId,
			squadLocation = p0.squadLocation,
			userIntention = var28
		})
	end, {
		var28, var26, p0.conversationId, p0.squadButtonSource, p0.squadLocation,
		var19.fireSquadAnalytics
	})
	local var31 = react.useCallback(function() --[[ line: 159 ]]
		-- upvalues: var30 (ref), var27 (ref), var26 (ref), var16 (ref), leaveSquad (copy), squadPromptType (copy), var19 (ref), p0 (ref), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), var21 (ref)
		var30()
		
		if var27 or not var26 then
			p0.onActivated(p0.conversationId)
			
			return
		end
		var16(leaveSquad(squadPromptType.JoinAnotherSquad, var19.setSquadPrompt, function() --[[ line: 166 ]]
			-- upvalues: p0 (copy)
			p0.onActivated(p0.conversationId)
		end, var19.squadLocation, if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var21 else true))
	end, {
		var26, var27, p0.onActivated, var30, var19.setSquadPrompt, var19.squadLocation,
		if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var21 else nil
	})
	local var32 = react.useMemo(function() --[[ line: 186 ]]
		-- upvalues: var18 (ref), p0 (ref)
		return if var18.Config.ColorMode.IsLight == "true" then if p0.isInCard then var18.Color.Extended.Gray.Gray_300 else var18.Color.Extended.Gray.Gray_200 elseif p0.isInCard then var18.Color.Extended.Gray.Gray_800 else var18.Color.Extended.Gray.Gray_900
	end, { p0.isInCard, var18.Config.ColorMode.IsLight })
	local var33 = var28 == squadButtonClickIntentionEnumModule.View
	local var34 = not appChatSquadButtonColorVariantB
	react.useEffect(function() --[[ line: 208 ]]
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
			["bg-action-standard stroke-action-standard"] = not var33,
			["bg-action-soft-emphasis stroke-action-soft-emphasis"] = var33 and var34,
			["bg-action-emphasis stroke-action-emphasis"] = var33 and appChatSquadButtonColorVariantB
		} else "row align-x-center align-y-center gap-xsmall stroke-action-standard radius-medium bg-action-standard",
		AutomaticSize = if p0.isFullWidth then Enum.AutomaticSize.None else Enum.AutomaticSize.XY,
		Size = UDim2.new(if p0.isFullWidth then 1 else 0, 0, 0, var18.Size.Size_800),
		isDisabled = var22 == squadState.Initializing,
		onActivated = var31,
		LayoutOrder = p0.layoutOrder,
		padding = {
			left = UDim.new(0, var18.Padding.Small),
			right = UDim.new(0, var18.Padding.Small)
		},
		selection = { Selectable = p0.Selectable },
		testId = if fFlagDebugAppChatEnableDomLocators then `{p0.testId}{var28}` else nil
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
				style = var18.Color.ActionStandard.Foreground,
				variant = foundation.Enums.IconVariant.Regular
			}),
			GreenDot = if var20 or var27 then react.createElement(foundation.View, {
				tag = "radius-circle anchor-top-right",
				ZIndex = 2,
				Size = UDim2.fromOffset(var18.Size.Size_200, var18.Size.Size_200),
				backgroundStyle = var24:map(function(p3) --[[ line: 252 ]]
					-- upvalues: var18 (ref)
					return {
						Color3 = var18.Color.Extended.Green.Green_500.Color3,
						Transparency = 1 + (var18.Color.Extended.Green.Green_500.Transparency - 1) * p3
					}
				end),
				Position = UDim2.new(1, var18.Size.Size_50, 0, -var18.Size.Size_50),
				stroke = {
					Color = var32.Color3,
					Transparency = var24:map(function(p4) --[[ line: 261 ]]
						-- upvalues: var32 (ref)
						return 1 + (var32.Transparency - 1) * p4
					end),
					Thickness = var18.Stroke.Thicker
				}
			}) else nil
		})
	end
	local var37
	t_2.GroupIconContainer = createElement_1
	t_2.TextLabel = react.createElement(foundation.Text, {
		LayoutOrder = 2,
		tag = if appChatSquadButtonColorUpdate then {
			["auto-xy text-label-small text-no-wrap text-truncate-end"] = true,
			["content-action-standard"] = not var33,
			["content-action-soft-emphasis"] = var33 and var34,
			["content-action-emphasis"] = var33 and appChatSquadButtonColorVariantB
		} else "auto-xy text-label-small content-action-standard text-truncate-end text-no-wrap",
		Text = var29,
		padding = { right = UDim.new(0, var18.Padding.XXSmall) },
		sizeConstraint = if p0.isFullWidth then nil else {
			MaxSize = Vector2.new(var18.Size.Size_2800, var18.Size.Size_800)
		}
	})
	
	if p0.shouldShowSignifier and var17 == responsiveModule.Input.Directional then
		var37 = react.createElement
		var37 = var37(foundation.Icon, {
			LayoutOrder = 3,
			name = userInputService:GetImageForKeyCode(Enum.KeyCode.ButtonX),
			size = foundation.Enums.IconSize.Small,
			style = if appChatSquadButtonColorUpdate and var33 then if appChatSquadButtonColorVariantB then var18.Color.ActionEmphasis.Foreground else var18.Color.ActionSoftEmphasis.Foreground else var18.Color.ActionStandard.Foreground
		})
	else
		var37 = nil
	end
	t_2.SignifierImage = var37
	
	return createElement(view, t_1, t_2)
end