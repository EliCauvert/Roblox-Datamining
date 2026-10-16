local Parent = script:FindFirstAncestor("SocialCards").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseCurrentSquadIdFunction = require(Parent.SquadsCore.Hooks).useCurrentSquadId
local UseCurrentSquadParentChannelIdFunction = require(Parent.SquadsCore.Hooks).useCurrentSquadParentChannelId
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local LeaveSquadFunction = require(Parent.SquadsCore.Thunks).leaveSquad
local SquadButtonClickIntentionEnum = require(Parent.Squads.Enums).SquadButtonClickIntentionEnum
local SquadButtonSourceEnum = require(Parent.Squads.Enums).SquadButtonSourceEnum
local EventNamesModule = require(Parent.SquadsCore.EventNames)
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local SquadPromptType = require(Parent.SquadsCore.Enums).SquadPromptType
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FFlagPartyDevAPIToRespectThirdPartySettingsEnabled = require(Parent.SharedFlags).FFlagPartyDevAPIToRespectThirdPartySettingsEnabled
local UseCanAccessPartyModule = require(Parent.Squads.useCanAccessParty)

return function(p1) --[[ Line: 33 | Named "SquadEndedCard" ]]
	-- upvalues: UseDispatchFunction (copy), UseLocalizationFunction (copy), UseNavigationFunction (copy), UseTokensFunction (copy), UseCurrentSquadIdFunction (copy), UseCurrentSquadParentChannelIdFunction (copy), ReactModule (copy), SquadExternalContractContext (copy), UseCanAccessPartyModule (copy), FFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), SquadButtonClickIntentionEnum (copy), EventNamesModule (copy), SquadButtonSourceEnum (copy), FoundationModule (copy), LeaveSquadFunction (copy), SquadPromptType (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		partyEnded = "Feature.Squads.Label.PartyEndedText",
		tapToStartNewParty = "Feature.Squads.Action.TapToStartNewParty"
	})
	local UseNavigationResult = UseNavigationFunction()
	local UseTokensResult = UseTokensFunction()
	local UseCurrentSquadIdResult = UseCurrentSquadIdFunction()
	local UseCurrentSquadParentChannelIdResult = UseCurrentSquadParentChannelIdFunction()
	local UseContextResult = ReactModule.useContext(SquadExternalContractContext)
	local UseParentChannelHasGroupUpResult = UseContextResult.useParentChannelHasGroupUp(p1.conversationId)
	local UseParentChannelHasSquadAccessResult = UseContextResult.useParentChannelHasSquadAccess(p1.conversationId)
	local UseParentChannelHasSquadAccessResult1 = UseCanAccessPartyModule() and UseParentChannelHasSquadAccessResult
	local NoFFlagPartyDevAPIToRespectThirdPartySettingsEnabled = not FFlagPartyDevAPIToRespectThirdPartySettingsEnabled or UseContextResult.useIsChatEnabled()
	local UseMemoResult = ReactModule.useMemo(function(): boolean --[[ Line: 56 ]]
		-- upvalues: UseCurrentSquadParentChannelIdResult (copy), p1 (copy)
		return UseCurrentSquadParentChannelIdResult == p1.conversationId
	end, { UseCurrentSquadParentChannelIdResult, p1.conversationId })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 60 ]]
		-- upvalues: UseMemoResult (copy), SquadButtonClickIntentionEnum (upval), UseParentChannelHasGroupUpResult (copy)
		return if UseMemoResult then SquadButtonClickIntentionEnum.View elseif UseParentChannelHasGroupUpResult then SquadButtonClickIntentionEnum.Join else SquadButtonClickIntentionEnum.Create
	end, { UseMemoResult, UseParentChannelHasGroupUpResult })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 72 ]]
		-- upvalues: UseContextResult (copy), EventNamesModule (upval), p1 (copy), SquadButtonSourceEnum (upval), UseCurrentSquadIdResult (copy), UseMemoResult1 (copy)
		UseContextResult.fireSquadAnalytics(EventNamesModule.EnterSquadButtonPressed, {
			conversationId = p1.conversationId,
			squadButtonSource = SquadButtonSourceEnum.PartyEndedCard,
			squadId = UseCurrentSquadIdResult,
			squadLocation = p1.squadLocation,
			userIntention = UseMemoResult1
		})
	end, {
		UseMemoResult1,
		UseCurrentSquadIdResult,
		p1.conversationId,
		p1.squadLocation,
		UseContextResult.fireSquadAnalytics
	})
	
	return ReactModule.createElement(FoundationModule.View, {
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		backgroundStyle = UseTokensResult.Color.Shift.Shift_200,
		cornerRadius = UDim.new(0, UseTokensResult.Radius.Large),
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, UseTokensResult.Gap.XSmall),
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		selection = { Selectable = true },
		onActivated = if UseParentChannelHasSquadAccessResult1 then function() --[[ Line: 104 ]]
			-- upvalues: UseResult (copy), UseCurrentSquadIdResult (copy), p1 (copy), UseCurrentSquadParentChannelIdResult (copy), UseDispatchResult (copy), LeaveSquadFunction (upval), SquadPromptType (upval), UseContextResult (copy), UseNavigationResult (copy), FFlagPartyDevAPIToRespectThirdPartySettingsEnabled (upval), NoFFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy)
			UseResult()
			
			if UseCurrentSquadIdResult and p1.conversationId ~= UseCurrentSquadParentChannelIdResult then
				UseDispatchResult(LeaveSquadFunction(SquadPromptType.JoinAnotherSquad, UseContextResult.setSquadPrompt, function() --[[ Line: 112 ]]
					-- upvalues: UseNavigationResult (upval), p1 (upval)
					UseNavigationResult.navigate("SquadLobby", { conversationId = p1.conversationId })
				end, UseContextResult.squadLocation, not FFlagPartyDevAPIToRespectThirdPartySettingsEnabled or NoFFlagPartyDevAPIToRespectThirdPartySettingsEnabled))
				
				return
			else
				UseNavigationResult.navigate("SquadLobby", { conversationId = p1.conversationId })
			end
		end else nil,
		padding = {
			bottom = UDim.new(0, UseTokensResult.Padding.Medium),
			left = UDim.new(0, UseTokensResult.Padding.Large),
			right = UDim.new(0, UseTokensResult.Padding.Large),
			top = UDim.new(0, UseTokensResult.Padding.Medium)
		}
	}, {
		Title = ReactModule.createElement(FoundationModule.Text, {
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			backgroundStyle = UseTokensResult.Color.None,
			fontStyle = UseTokensResult.Typography.TitleMedium,
			Text = UseLocalizationResult.partyEnded,
			textStyle = UseTokensResult.Color.Content.Emphasis,
			TextTruncate = Enum.TextTruncate.AtEnd
		}),
		Status = if UseParentChannelHasSquadAccessResult1 then ReactModule.createElement(FoundationModule.Text, {
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.XY,
			backgroundStyle = UseTokensResult.Color.None,
			fontStyle = UseTokensResult.Typography.LabelSmall,
			Text = UseLocalizationResult.tapToStartNewParty,
			textStyle = UseTokensResult.Color.Content.Muted,
			TextTruncate = Enum.TextTruncate.AtEnd
		}) else nil
	})
end