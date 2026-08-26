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

return function(p1)
	-- upvalues: useDispatch (ref), useLocalization (ref), useNavigation (ref), useTokens (ref), useCurrentSquadId (ref), useCurrentSquadParentChannelId (ref), reactModule (ref), squadExternalContractContext (ref), useCanAccessPartyModule (ref), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (ref), squadButtonClickIntentionEnum (ref), eventNamesModule (ref), squadButtonSourceEnum (ref), foundationModule (ref), leaveSquad (ref), squadPromptType (ref)
	local var1 = useDispatch()
	local var2 = useLocalization({
		partyEnded = "Feature.Squads.Label.PartyEndedText",
		tapToStartNewParty = "Feature.Squads.Action.TapToStartNewParty"
	})
	local var3 = useNavigation()
	local var4 = useTokens()
	local var5 = useCurrentSquadId()
	local var6 = useCurrentSquadParentChannelId()
	local var7 = reactModule.useContext(squadExternalContractContext)
	local var8 = var7.useParentChannelHasGroupUp(p1.conversationId)
	local conversationId = useCanAccessPartyModule() and var7.useParentChannelHasSquadAccess(p1.conversationId)
	local var9 = if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var7.useIsChatEnabled() else true
	local var10 = reactModule.useMemo(function()
		-- upvalues: var6 (ref), p1 (ref)
		return var6 == p1.conversationId
	end, { var6, p1.conversationId })
	local var11 = reactModule.useMemo(function()
		-- upvalues: var10 (ref), squadButtonClickIntentionEnum (copy), var8 (ref)
		return if var10 then squadButtonClickIntentionEnum.View elseif var8 then squadButtonClickIntentionEnum.Join else squadButtonClickIntentionEnum.Create
	end, { var10, var8 })
	local var12 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), eventNamesModule (copy), p1 (ref), squadButtonSourceEnum (copy), var5 (ref), var11 (ref)
		var7.fireSquadAnalytics(eventNamesModule.EnterSquadButtonPressed, {
			conversationId = p1.conversationId,
			squadButtonSource = squadButtonSourceEnum.PartyEndedCard,
			squadId = var5,
			squadLocation = p1.squadLocation,
			userIntention = var11
		})
	end, {
		var11,
		var5,
		p1.conversationId,
		p1.squadLocation,
		var7.fireSquadAnalytics
	})
	
	return reactModule.createElement(foundationModule.View, {
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		backgroundStyle = var4.Color.Shift.Shift_200,
		cornerRadius = UDim.new(0, var4.Radius.Large),
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, var4.Gap.XSmall),
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		selection = { Selectable = true },
		onActivated = if conversationId then function()
			-- upvalues: var12 (ref), var5 (ref), p1 (ref), var6 (ref), var1 (ref), leaveSquad (copy), squadPromptType (copy), var7 (ref), var3 (ref), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), var9 (ref)
			var12()
			
			if var5 and p1.conversationId ~= var6 then
				var1(leaveSquad(squadPromptType.JoinAnotherSquad, var7.setSquadPrompt, function()
					-- upvalues: var3 (copy), p1 (copy)
					var3.navigate("SquadLobby", { conversationId = p1.conversationId })
				end, var7.squadLocation, if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var9 else true))
				
				return
			end
			var3.navigate("SquadLobby", { conversationId = p1.conversationId })
		end else nil,
		padding = {
			bottom = UDim.new(0, var4.Padding.Medium),
			left = UDim.new(0, var4.Padding.Large),
			right = UDim.new(0, var4.Padding.Large),
			top = UDim.new(0, var4.Padding.Medium)
		}
	}, {
		Title = reactModule.createElement(foundationModule.Text, {
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			backgroundStyle = var4.Color.None,
			fontStyle = var4.Typography.TitleMedium,
			Text = var2.partyEnded,
			textStyle = var4.Color.Content.Emphasis,
			TextTruncate = Enum.TextTruncate.AtEnd
		}),
		Status = if conversationId then reactModule.createElement(foundationModule.Text, {
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.XY,
			backgroundStyle = var4.Color.None,
			fontStyle = var4.Typography.LabelSmall,
			Text = var2.tapToStartNewParty,
			textStyle = var4.Color.Content.Muted,
			TextTruncate = Enum.TextTruncate.AtEnd
		}) else nil
	})
end