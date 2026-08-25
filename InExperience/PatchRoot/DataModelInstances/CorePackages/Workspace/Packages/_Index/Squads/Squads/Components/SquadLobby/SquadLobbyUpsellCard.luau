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

return function(p0)
	-- upvalues: useDispatch (ref), useTokens (ref), responsiveModule (ref), useLocalUserId (ref), useLocalization (ref), useCurrentSquadSelector (ref), useCurrentSquadId (ref), react (ref), networkingSquads (ref), useSelector (ref), squadExternalContractContext (ref), foundation (ref), avatarGroup (ref), inputSize (ref), avatarGroupType (ref), useEffectOnce (ref), eventNamesModule (ref), noResponseInviteAgainOrAddOthersEnumModule (ref), reinviteToSquad (ref), squadInvitePageNavSourceEnumModule (ref), networkStatus (ref)
	local var6 = useDispatch()
	local var7 = useTokens()
	local var8 = responsiveModule.useBreakpointXOrSmaller(responsiveModule.Keys.XSmall)
	local var9 = responsiveModule.useBreakpointYOrSmaller(responsiveModule.Keys.XSmall)
	local var10 = useLocalUserId()
	local var11 = useLocalization({
		addOthers = "Feature.Squads.Action.AddOthers",
		upsellText = "Feature.Squads.Description.upsellInviteText",
		inviteText = "Feature.Squads.Action.Invite",
		inviteAgain = "Feature.Squads.Action.InviteAgain"
	})
	local var12 = useCurrentSquadSelector()
	local var13 = if var12 and var12.parentChannelId then var12.parentChannelId else nil
	local var14 = useCurrentSquadId()
	local var15 = useSelector(react.useCallback(function(p1)
		-- upvalues: networkingSquads (copy), var14 (ref)
		return networkingSquads.ReinviteToSquad.getStatus(p1, { squadId = var14 })
	end, { var14 }))
	local var16 = react.useContext(squadExternalContractContext)
	local var17 = var16.useGetConversationFromId(var13 or "")
	local var18 = react.useMemo(function()
		-- upvalues: react (copy), foundation (copy), var7 (ref), var11 (ref)
		return react.createElement(foundation.Text, {
			LayoutOrder = 1,
			TextWrapped = true,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0),
			fontStyle = var7.Typography.BodyLarge,
			Text = var11.upsellText,
			textStyle = var7.Color.Content.Default,
			TextXAlignment = Enum.TextXAlignment.Center
		})
	end, { var7, var11.upsellText })
	local var19 = react.useMemo(function()
		-- upvalues: var17 (ref), var10 (ref), var9 (ref), var8 (ref), react (copy), avatarGroup (copy), inputSize (copy), avatarGroupType (copy), var7 (ref)
		local t = {}
		
		if var17 and var17.participants then
			for i, v in ipairs(var17.participants) do
				if v ~= var10 then
					table.insert(t, v)
				end
			end
		end
		return if var9 or var8 then nil else react.createElement(avatarGroup, {
			max = 4,
			layoutOrder = 0,
			avatars = t,
			size = inputSize.Medium,
			type = avatarGroupType.Stacked,
			imageBackgroundStyle = {
				Color3 = var7.Color.OverMedia.OverMedia_300.Color3,
				Transparency = var7.Color.OverMedia.OverMedia_300.Transparency
			},
			imageBorderStyle = {
				Color = var7.Color.Surface.Surface_0.Color3,
				Transparency = var7.Color.Surface.Surface_0.Transparency
			}
		})
	end, { var17 and var17.participants, var10, var9, var8 })
	useEffectOnce(function()
		-- upvalues: var16 (ref), eventNamesModule (copy), noResponseInviteAgainOrAddOthersEnumModule (copy), var13 (ref)
		var16.fireSquadAnalytics(eventNamesModule.NoResponseInviteAgainOrAddOthers, {
			actionType = noResponseInviteAgainOrAddOthersEnumModule.Impression,
			button = noResponseInviteAgainOrAddOthersEnumModule.InviteAgain,
			conversationId = var13
		})
		var16.fireSquadAnalytics(eventNamesModule.NoResponseInviteAgainOrAddOthers, {
			actionType = noResponseInviteAgainOrAddOthersEnumModule.Impression,
			button = noResponseInviteAgainOrAddOthersEnumModule.AddOthers,
			conversationId = var13
		})
	end, var13)
	local var20 = react.useCallback(function()
		-- upvalues: var6 (ref), reinviteToSquad (copy), var14 (ref), var16 (ref), eventNamesModule (copy), noResponseInviteAgainOrAddOthersEnumModule (copy), var13 (ref)
		var6(reinviteToSquad(var14, var16.setSquadPrompt))
		var16.fireSquadAnalytics(eventNamesModule.NoResponseInviteAgainOrAddOthers, {
			actionType = noResponseInviteAgainOrAddOthersEnumModule.Click,
			button = noResponseInviteAgainOrAddOthersEnumModule.InviteAgain,
			conversationId = var13
		})
	end, { var16.fireSquadAnalytics, var13 })
	local var21 = react.useCallback(function()
		-- upvalues: var16 (ref), eventNamesModule (copy), noResponseInviteAgainOrAddOthersEnumModule (copy), var13 (ref), squadInvitePageNavSourceEnumModule (copy), p0 (ref)
		var16.fireSquadAnalytics(eventNamesModule.NoResponseInviteAgainOrAddOthers, {
			actionType = noResponseInviteAgainOrAddOthersEnumModule.Click,
			button = noResponseInviteAgainOrAddOthersEnumModule.AddOthers,
			conversationId = var13
		})
		var16.fireSquadAnalytics(eventNamesModule.SquadInvitePageNavSource, {
			inviteNavSource = squadInvitePageNavSourceEnumModule.SquadLobbyUpsellCardClicked,
			parentChannelId = var13
		})
		p0.navigateToSquadInviteFriends()
	end, {
		var13,
		var16.fireSquadAnalytics,
		p0.navigateToSquadInviteFriends
	})
	
	return react.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p0.size,
		LayoutOrder = p0.layoutOrder
	}, {
		react.createElement(foundation.View, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.new(1, -2 * var7.Stroke.Standard, 1, -2 * var7.Stroke.Standard),
			cornerRadius = UDim.new(0, var7.Radius.Medium),
			padding = var7.Padding.XXLarge,
			layout = {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, if var9 or var8 then var7.Padding.Medium else var7.Padding.XXLarge),
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			},
			stroke = {
				Color = var7.Color.Stroke.Default.Color3,
				Transparency = var7.Color.Stroke.Default.Transparency,
				Thickness = var7.Stroke.Standard
			}
		}, {
			UpsellInformation = react.createElement(foundation.View, {
				LayoutOrder = 1,
				tag = "size-full-0 gap-medium align-x-center auto-y col"
			}, { UpsellFacepile = var19, UpsellLabel = var18 }),
			Buttons = react.createElement(foundation.View, {
				LayoutOrder = 2,
				tag = {
					["size-full-0 gap-small align-x-center flex-fill align-y-center auto-y"] = true,
					col = var8,
					row = not var8
				}
			}, {
				InviteAgainButton = react.useMemo(function()
					-- upvalues: react (copy), foundation (copy), var15 (ref), networkStatus (copy), var20 (ref), var11 (ref)
					return react.createElement(foundation.Button, {
						LayoutOrder = 1,
						fillBehavior = foundation.Enums.FillBehavior.Fill,
						isDisabled = var15 == networkStatus.Fetching,
						onActivated = var20,
						text = var11.inviteAgain,
						size = foundation.Enums.InputSize.Medium,
						variant = foundation.Enums.ButtonVariant.Standard
					})
				end, { var20, var11.inviteAgain, var15 }),
				AddOthersButton = react.useMemo(function()
					-- upvalues: react (copy), foundation (copy), var21 (ref), var11 (ref)
					return react.createElement(foundation.Button, {
						LayoutOrder = 2,
						fillBehavior = foundation.Enums.FillBehavior.Fill,
						onActivated = var21,
						text = var11.addOthers,
						size = foundation.Enums.ButtonSize.Medium,
						variant = foundation.Enums.ButtonVariant.Standard
					})
				end, { var21, var11.addOthers })
			})
		})
	})
end