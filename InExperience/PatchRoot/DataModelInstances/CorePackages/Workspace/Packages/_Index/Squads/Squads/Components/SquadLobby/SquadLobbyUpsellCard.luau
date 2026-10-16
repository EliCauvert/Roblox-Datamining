local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local responsiveModule = require(parent.Responsive)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local dependenciesModule = require(squads.dependencies)
local foundation = dependenciesModule.Foundation
local react = dependenciesModule.React
local networkingSquads = dependenciesModule.NetworkingSquads
local networkStatus = dependenciesModule.RoduxNetworking.Enum.NetworkStatus
local useEffectOnce = dependenciesModule.Hooks.useEffectOnce
local useDispatch = dependenciesModule.Hooks.useDispatch
local useSelector = dependenciesModule.Hooks.useSelector
local useTokens = foundation.Hooks.useTokens
local useCurrentSquadSelector = dependenciesModule.Hooks.useCurrentSquadSelector
local useLocalization = dependenciesModule.Hooks.useLocalization
local reinviteToSquad = require(parent.SquadsCore.Thunks).reinviteToSquad
local eventNamesModule = require(parent.SquadsCore.EventNames)
local squadExternalContractContext = require(parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local useCurrentSquadId = require(parent.SquadsCore.Hooks).useCurrentSquadId
local avatarGroup = foundation.AvatarGroup
local avatarGroupType = foundation.Enums.AvatarGroupType
local inputSize = foundation.Enums.InputSize
local noResponseInviteAgainOrAddOthersEnumModule = require(squads.Enums.NoResponseInviteAgainOrAddOthersEnum)
local squadInvitePageNavSourceEnumModule = require(squads.Enums.SquadInvitePageNavSourceEnum)

return function(p1)
	-- upvalues: useDispatch (ref), useTokens (ref), responsiveModule (ref), useLocalUserId (ref), useLocalization (ref), useCurrentSquadSelector (ref), useCurrentSquadId (ref), react (ref), networkingSquads (ref), useSelector (ref), squadExternalContractContext (ref), foundation (ref), avatarGroup (ref), inputSize (ref), avatarGroupType (ref), useEffectOnce (ref), eventNamesModule (ref), noResponseInviteAgainOrAddOthersEnumModule (ref), reinviteToSquad (ref), squadInvitePageNavSourceEnumModule (ref), networkStatus (ref)
	local var1 = useDispatch()
	local var2 = useTokens()
	local var3 = responsiveModule.useBreakpointXOrSmaller(responsiveModule.Keys.XSmall)
	local var4 = responsiveModule.useBreakpointYOrSmaller(responsiveModule.Keys.XSmall)
	local var5 = useLocalUserId()
	local var6 = useLocalization({
		addOthers = "Feature.Squads.Action.AddOthers",
		upsellText = "Feature.Squads.Description.upsellInviteText",
		inviteText = "Feature.Squads.Action.Invite",
		inviteAgain = "Feature.Squads.Action.InviteAgain"
	})
	local var7 = useCurrentSquadSelector()
	local var8 = if var7 and var7.parentChannelId then var7.parentChannelId else nil
	local var9 = useCurrentSquadId()
	local var10 = useSelector(react.useCallback(function(p2)
		-- upvalues: networkingSquads (copy), var9 (ref)
		return networkingSquads.ReinviteToSquad.getStatus(p2, { squadId = var9 })
	end, { var9 }))
	local var11 = react.useContext(squadExternalContractContext)
	local var12 = var11.useGetConversationFromId(var8 or "")
	local var13 = react.useMemo(function()
		-- upvalues: react (copy), foundation (copy), var2 (ref), var6 (ref)
		return react.createElement(foundation.Text, {
			LayoutOrder = 1,
			TextWrapped = true,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0),
			fontStyle = var2.Typography.BodyLarge,
			Text = var6.upsellText,
			textStyle = var2.Color.Content.Default,
			TextXAlignment = Enum.TextXAlignment.Center
		})
	end, { var2, var6.upsellText })
	local var14 = react.useMemo(function()
		-- upvalues: var12 (ref), var5 (ref), var4 (ref), var3 (ref), react (copy), avatarGroup (copy), inputSize (copy), avatarGroupType (copy), var2 (ref)
		local t = {}
		
		if var12 and var12.participants then
			for i, v in ipairs(var12.participants) do
				if v ~= var5 then
					table.insert(t, v)
				end
			end
		end
		return if var4 or var3 then nil else react.createElement(avatarGroup, {
			max = 4,
			layoutOrder = 0,
			avatars = t,
			size = inputSize.Medium,
			type = avatarGroupType.Stacked,
			imageBackgroundStyle = {
				Color3 = var2.Color.OverMedia.OverMedia_300.Color3,
				Transparency = var2.Color.OverMedia.OverMedia_300.Transparency
			},
			imageBorderStyle = {
				Color = var2.Color.Surface.Surface_0.Color3,
				Transparency = var2.Color.Surface.Surface_0.Transparency
			}
		})
	end, { var12 and var12.participants, var5, var4, var3 })
	useEffectOnce(function()
		-- upvalues: var11 (ref), eventNamesModule (copy), noResponseInviteAgainOrAddOthersEnumModule (copy), var8 (ref)
		var11.fireSquadAnalytics(eventNamesModule.NoResponseInviteAgainOrAddOthers, {
			actionType = noResponseInviteAgainOrAddOthersEnumModule.Impression,
			button = noResponseInviteAgainOrAddOthersEnumModule.InviteAgain,
			conversationId = var8
		})
		var11.fireSquadAnalytics(eventNamesModule.NoResponseInviteAgainOrAddOthers, {
			actionType = noResponseInviteAgainOrAddOthersEnumModule.Impression,
			button = noResponseInviteAgainOrAddOthersEnumModule.AddOthers,
			conversationId = var8
		})
	end, var8)
	local var15 = react.useCallback(function()
		-- upvalues: var1 (ref), reinviteToSquad (copy), var9 (ref), var11 (ref), eventNamesModule (copy), noResponseInviteAgainOrAddOthersEnumModule (copy), var8 (ref)
		var1(reinviteToSquad(var9, var11.setSquadPrompt))
		var11.fireSquadAnalytics(eventNamesModule.NoResponseInviteAgainOrAddOthers, {
			actionType = noResponseInviteAgainOrAddOthersEnumModule.Click,
			button = noResponseInviteAgainOrAddOthersEnumModule.InviteAgain,
			conversationId = var8
		})
	end, { var11.fireSquadAnalytics, var8 })
	local var16 = react.useCallback(function()
		-- upvalues: var11 (ref), eventNamesModule (copy), noResponseInviteAgainOrAddOthersEnumModule (copy), var8 (ref), squadInvitePageNavSourceEnumModule (copy), p1 (ref)
		var11.fireSquadAnalytics(eventNamesModule.NoResponseInviteAgainOrAddOthers, {
			actionType = noResponseInviteAgainOrAddOthersEnumModule.Click,
			button = noResponseInviteAgainOrAddOthersEnumModule.AddOthers,
			conversationId = var8
		})
		var11.fireSquadAnalytics(eventNamesModule.SquadInvitePageNavSource, {
			inviteNavSource = squadInvitePageNavSourceEnumModule.SquadLobbyUpsellCardClicked,
			parentChannelId = var8
		})
		p1.navigateToSquadInviteFriends()
	end, {
		var8,
		var11.fireSquadAnalytics,
		p1.navigateToSquadInviteFriends
	})
	
	return react.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p1.size,
		LayoutOrder = p1.layoutOrder
	}, {
		react.createElement(foundation.View, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.new(1, -2 * var2.Stroke.Standard, 1, -2 * var2.Stroke.Standard),
			cornerRadius = UDim.new(0, var2.Radius.Medium),
			padding = var2.Padding.XXLarge,
			layout = {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, if var4 or var3 then var2.Padding.Medium else var2.Padding.XXLarge),
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			},
			stroke = {
				Color = var2.Color.Stroke.Default.Color3,
				Transparency = var2.Color.Stroke.Default.Transparency,
				Thickness = var2.Stroke.Standard
			}
		}, {
			UpsellInformation = react.createElement(foundation.View, {
				LayoutOrder = 1,
				tag = "size-full-0 gap-medium align-x-center auto-y col"
			}, { UpsellFacepile = var14, UpsellLabel = var13 }),
			Buttons = react.createElement(foundation.View, {
				LayoutOrder = 2,
				tag = {
					["size-full-0 gap-small align-x-center flex-fill align-y-center auto-y"] = true,
					col = var3,
					row = not var3
				}
			}, {
				InviteAgainButton = react.useMemo(function()
					-- upvalues: react (copy), foundation (copy), var10 (ref), networkStatus (copy), var15 (ref), var6 (ref)
					return react.createElement(foundation.Button, {
						LayoutOrder = 1,
						fillBehavior = foundation.Enums.FillBehavior.Fill,
						isDisabled = var10 == networkStatus.Fetching,
						onActivated = var15,
						text = var6.inviteAgain,
						size = foundation.Enums.InputSize.Medium,
						variant = foundation.Enums.ButtonVariant.Standard
					})
				end, { var15, var6.inviteAgain, var10 }),
				AddOthersButton = react.useMemo(function()
					-- upvalues: react (copy), foundation (copy), var16 (ref), var6 (ref)
					return react.createElement(foundation.Button, {
						LayoutOrder = 2,
						fillBehavior = foundation.Enums.FillBehavior.Fill,
						onActivated = var16,
						text = var6.addOthers,
						size = foundation.Enums.ButtonSize.Medium,
						variant = foundation.Enums.ButtonVariant.Standard
					})
				end, { var16, var6.addOthers })
			})
		})
	})
end