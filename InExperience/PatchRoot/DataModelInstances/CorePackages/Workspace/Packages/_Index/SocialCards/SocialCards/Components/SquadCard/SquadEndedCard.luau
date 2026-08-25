local parent = script:FindFirstAncestor("SocialCards").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local squadExternalContractProviderModule = require(parent.SquadsCore.SquadExternalContractProvider)
local sharedFlagsModule = require(parent.SharedFlags)
local useCurrentSquadId = require(parent.SquadsCore.Hooks).useCurrentSquadId
local useCurrentSquadParentChannelId = require(parent.SquadsCore.Hooks).useCurrentSquadParentChannelId
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useNavigation = require(parent.Navigation).useNavigation
local leaveSquad = require(parent.SquadsCore.Thunks).leaveSquad
local squadButtonClickIntentionEnum = require(parent.Squads.Enums).SquadButtonClickIntentionEnum
local squadButtonSourceEnum = require(parent.Squads.Enums).SquadButtonSourceEnum
local eventNamesModule = require(parent.SquadsCore.EventNames)
local squadExternalContractContext = squadExternalContractProviderModule.SquadExternalContractContext
local squadPromptType = require(parent.SquadsCore.Enums).SquadPromptType
local useTokens = foundationModule.Hooks.useTokens
local fFlagPartyDevAPIToRespectThirdPartySettingsEnabled = sharedFlagsModule.FFlagPartyDevAPIToRespectThirdPartySettingsEnabled
local useCanAccessPartyModule = require(parent.Squads.useCanAccessParty)

return function(p0)
	-- upvalues: useDispatch (ref), useLocalization (ref), useNavigation (ref), useTokens (ref), useCurrentSquadId (ref), useCurrentSquadParentChannelId (ref), reactModule (ref), squadExternalContractContext (ref), useCanAccessPartyModule (ref), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (ref), squadButtonClickIntentionEnum (ref), eventNamesModule (ref), squadButtonSourceEnum (ref), foundationModule (ref), leaveSquad (ref), squadPromptType (ref)
	local var6 = useDispatch()
	local var7 = useLocalization({
		partyEnded = "Feature.Squads.Label.PartyEndedText",
		tapToStartNewParty = "Feature.Squads.Action.TapToStartNewParty"
	})
	local var8 = useNavigation()
	local var9 = useTokens()
	local var10 = useCurrentSquadId()
	local var11 = useCurrentSquadParentChannelId()
	local var12 = reactModule.useContext(squadExternalContractContext)
	local var13 = var12.useParentChannelHasGroupUp(p0.conversationId)
	local conversationId = useCanAccessPartyModule() and var12.useParentChannelHasSquadAccess(p0.conversationId)
	local var15 = if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var12.useIsChatEnabled() else true
	local var16 = reactModule.useMemo(function()
		-- upvalues: var11 (ref), p0 (ref)
		return var11 == p0.conversationId
	end, { var11, p0.conversationId })
	local var17 = reactModule.useMemo(function()
		-- upvalues: var16 (ref), squadButtonClickIntentionEnum (copy), var13 (ref)
		return if var16 then squadButtonClickIntentionEnum.View elseif var13 then squadButtonClickIntentionEnum.Join else squadButtonClickIntentionEnum.Create
	end, { var16, var13 })
	local var18 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), eventNamesModule (copy), p0 (ref), squadButtonSourceEnum (copy), var10 (ref), var17 (ref)
		var12.fireSquadAnalytics(eventNamesModule.EnterSquadButtonPressed, {
			conversationId = p0.conversationId,
			squadButtonSource = squadButtonSourceEnum.PartyEndedCard,
			squadId = var10,
			squadLocation = p0.squadLocation,
			userIntention = var17
		})
	end, {
		var17,
		var10,
		p0.conversationId,
		p0.squadLocation,
		var12.fireSquadAnalytics
	})
	
	return reactModule.createElement(foundationModule.View, {
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		backgroundStyle = var9.Color.Shift.Shift_200,
		cornerRadius = UDim.new(0, var9.Radius.Large),
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, var9.Gap.XSmall),
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		selection = { Selectable = true },
		onActivated = if conversationId then function()
			-- upvalues: var18 (ref), var10 (ref), p0 (ref), var11 (ref), var6 (ref), leaveSquad (copy), squadPromptType (copy), var12 (ref), var8 (ref), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), var15 (ref)
			var18()
			
			if var10 and p0.conversationId ~= var11 then
				var6(leaveSquad(squadPromptType.JoinAnotherSquad, var12.setSquadPrompt, function()
					-- upvalues: var8 (copy), p0 (copy)
					var8.navigate("SquadLobby", { conversationId = p0.conversationId })
				end, var12.squadLocation, if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var15 else true))
				
				return
			end
			var8.navigate("SquadLobby", { conversationId = p0.conversationId })
		end else nil,
		padding = {
			bottom = UDim.new(0, var9.Padding.Medium),
			left = UDim.new(0, var9.Padding.Large),
			right = UDim.new(0, var9.Padding.Large),
			top = UDim.new(0, var9.Padding.Medium)
		}
	}, {
		Title = reactModule.createElement(foundationModule.Text, {
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			backgroundStyle = var9.Color.None,
			fontStyle = var9.Typography.TitleMedium,
			Text = var7.partyEnded,
			textStyle = var9.Color.Content.Emphasis,
			TextTruncate = Enum.TextTruncate.AtEnd
		}),
		Status = if conversationId then reactModule.createElement(foundationModule.Text, {
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.XY,
			backgroundStyle = var9.Color.None,
			fontStyle = var9.Typography.LabelSmall,
			Text = var7.tapToStartNewParty,
			textStyle = var9.Color.Content.Muted,
			TextTruncate = Enum.TextTruncate.AtEnd
		}) else nil
	})
end