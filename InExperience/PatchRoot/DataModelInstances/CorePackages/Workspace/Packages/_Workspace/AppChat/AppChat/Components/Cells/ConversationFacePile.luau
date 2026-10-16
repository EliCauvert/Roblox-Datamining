local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck
local FFlagUserTileUnfilteredChatIndicator = require(Parent.SharedFlags).FFlagUserTileUnfilteredChatIndicator
local FFlagAppChatSanitizeConversationTitleRichText = require(Parent.SharedFlags).FFlagAppChatSanitizeConversationTitleRichText
local EscapeRichFormattingFunction = require(Parent.InlineRichText).escapeRichFormatting
local UseIsRobloxSubscriberFunction = require(Parent.UserProfiles).Hooks.useIsRobloxSubscriber
local UserTile = require(Parent.UserTile).UserTile
local LayoutMode = require(Parent.UserTile).LayoutMode
local FFlagAppChatPresenceStoreMigrationModule = require(AppChat.Flags.FFlagAppChatPresenceStoreMigration)
local DataHydrationModule = require(Parent.DataHydration)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local NewResult = require(Parent.Loggers).Logger:new(script.Name)
local UseFoundationPresenceModule = require(AppChat.Hooks.useFoundationPresence)
local PresenceType = require(AppChat.Http.RoduxPresence).Enums.PresenceType
local UserPresence = require(Parent.Foundation).Enums.UserPresence
local PresenceType1 = if FFlagAppChatPresenceStoreMigrationModule then DataHydrationModule.Presence.PresenceEnums.PresenceType else nil
local GetResult = if FFlagAppChatPresenceStoreMigrationModule then DataHydrationModule.Presence.PresenceStore.get() else nil

local function groupPresenceAggregateEquals(p1, p2): boolean --[[ Line: 45 ]]
	return p1.hasInExperienceUser == p2.hasInExperienceUser and p1.hasOnlineUser == p2.hasOnlineUser
end

local function _(p1) --[[ Line: 78 | Named "getParticipantId" ]]
	if type(p1) == "table" then
		local Id = p1.id or p1.userId
		
		return if Id == nil then nil else tostring(Id)
	else
		return if p1 == nil then nil else tostring(p1)
	end
end

local _ = function(p1) --[[ Line: 87 | Named "getNonEmptyLocalUserId" ]]
	return if p1 == nil or p1 == "" then nil else tostring(p1)
end

local function ConversationFacePileInner(p1) --[[ Line: 95 ]]
	-- upvalues: UseLocalUserIdFunction (copy), ReactModule (copy), UseSelectorFunction (copy), FFlagAppChatPresenceStoreMigrationModule (copy), SignalsModule (copy), GetResult (copy), PresenceType1 (copy), groupPresenceAggregateEquals (copy), SignalsReactModule (copy), UseFoundationPresenceModule (copy), UserPresence (copy), PresenceType (copy), FFlagEnableBlackbirdCheck (copy), UseIsRobloxSubscriberFunction (copy), UserTile (copy), LayoutMode (copy), FFlagAppChatSanitizeConversationTitleRichText (copy), EscapeRichFormattingFunction (copy), FFlagUserTileUnfilteredChatIndicator (copy)
	local ConversationId = p1.conversationId
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local LocalUserId = p1.localUserId
	local Text = (if LocalUserId == nil or LocalUserId == "" then nil else tostring(LocalUserId)) or ((if UseLocalUserIdResult == nil or UseLocalUserIdResult == "" then nil else tostring(UseLocalUserIdResult)) or "")
	local UseSelectorResult = UseSelectorFunction((ReactModule.useCallback(function(p2) --[[ Line: 100 ]]
		-- upvalues: ConversationId (copy)
		return if p2 and p2.ChatAppReducer and p2.ChatAppReducer.Conversations then p2.ChatAppReducer.Conversations[ConversationId] else nil
	end, { ConversationId })))
	local UseSelectorResult1 = if FFlagAppChatPresenceStoreMigrationModule then nil else UseSelectorFunction(function(p2) --[[ Line: 109 ]]
		return if p2 and p2.ChatAppReducer and p2.ChatAppReducer.Presence then p2.ChatAppReducer.Presence.byUserId else nil
	end)
	local Participants = p1.participants or (if UseSelectorResult and UseSelectorResult.participants then UseSelectorResult.participants else {})
	local List = {}
	
	if #Participants == 1 then
		table.insert(List, Text)
	else
		for _, participant in Participants do
			local Text1 = nil
			if type(participant) == "table" then
				local Id = participant.id or participant.userId
				Text1 = if Id == nil then nil else tostring(Id)
			else
				Text1 = if participant == nil then nil else tostring(participant)
			end
			if Text1 and tostring(Text1) ~= tostring(Text) then
				table.insert(List, Text1)
			end
		end
	end
	local UseMemoResult = if FFlagAppChatPresenceStoreMigrationModule then ReactModule.useMemo(function() --[[ Line: 133 ]]
		-- upvalues: SignalsModule (upval), List (copy), GetResult (upval), PresenceType1 (upval), groupPresenceAggregateEquals (upval)
		return SignalsModule.createComputed(function(p2) --[[ Line: 134 ]]
			-- upvalues: List (upval), GetResult (upval), PresenceType1 (upval)
			local HasInExperienceUser = false
			local HasOnlineUser = false
			
			for _, value in List do
				local DataResult = GetResult.GetPresenceByUserId(value).data(p2)
				
				if DataResult then
					local UserPresenceType = DataResult.userPresenceType
					
					if UserPresenceType == PresenceType1.InGame or UserPresenceType == PresenceType1.InStudio then
						HasInExperienceUser = true
					elseif UserPresenceType == PresenceType1.Online then
						HasOnlineUser = true
					end
				end
			end
			return {
				hasInExperienceUser = HasInExperienceUser,
				hasOnlineUser = HasOnlineUser
			}
		end, groupPresenceAggregateEquals)
	end, { table.concat(List, ",") }) else nil
	local UseSignalStateResult = if FFlagAppChatPresenceStoreMigrationModule then SignalsReactModule.useSignalState(UseMemoResult) else nil
	local Entry = List[1] or Text
	local UseFoundationPresenceModuleResult = UseFoundationPresenceModule(Entry)
	local None = UserPresence.None
	
	if #List >= 2 then
		local HasInExperienceUser = false
		local HasOnlineUser = false
		
		if FFlagAppChatPresenceStoreMigrationModule then
			HasInExperienceUser = if UseSignalStateResult then UseSignalStateResult.hasInExperienceUser else false
			HasOnlineUser = if UseSignalStateResult then UseSignalStateResult.hasOnlineUser else false
		else
			for _, value in List do
				if UseSelectorResult1 and UseSelectorResult1[value] then
					local UserPresenceType = UseSelectorResult1[value].userPresenceType
					
					if UserPresenceType == PresenceType.InGame or UserPresenceType == PresenceType.InStudio then
						HasInExperienceUser = true
					elseif UserPresenceType == PresenceType.Online then
						HasOnlineUser = true
					end
				end
			end
		end
		if HasInExperienceUser then
			None = UserPresence.InExperience
		elseif HasOnlineUser then
			None = UserPresence.Active
		end
	else
		None = UseFoundationPresenceModuleResult.presence
	end
	local Text2: string? = nil
	
	if FFlagEnableBlackbirdCheck and #Participants == 2 then
		local Text3 = nil
		for _, participant1 in Participants do
			if type(participant1) == "table" then
				local Id = participant1.id or participant1.userId
				Text3 = if Id == nil then nil else tostring(Id)
			else
				Text3 = if participant1 == nil then nil else tostring(participant1)
			end
			if Text3 and tostring(Text3) ~= tostring(Text) then
				Text2 = tostring(Text3)
				break
			end
		end
	end
	local UseIsRobloxSubscriberResult = UseIsRobloxSubscriberFunction(Text2)
	
	return ReactModule.createElement(UserTile, {
		userId = Entry,
		facePileSecondUserId = List[2] or nil,
		layoutMode = LayoutMode.wide,
		title = if FFlagAppChatSanitizeConversationTitleRichText and p1.titleText then EscapeRichFormattingFunction(p1.titleText) else p1.titleText,
		subtitle = if FFlagAppChatSanitizeConversationTitleRichText and p1.subtitleText then EscapeRichFormattingFunction(p1.subtitleText) else p1.subtitleText,
		titleStyle = p1.titleStyle,
		subtitleStyle = p1.subtitleStyle,
		userPresenceType = None,
		onActivated = p1.onActivated,
		selectable = p1.selectable,
		customTextTruncation = Enum.TextTruncate.SplitWord,
		trustedConnectionIndicatorEnabled = p1.trustedConnectionIndicatorEnabled,
		isRobloxSubscriber = if FFlagEnableBlackbirdCheck then UseIsRobloxSubscriberResult else nil,
		shouldShowUnfilteredChatIndicator = if FFlagUserTileUnfilteredChatIndicator then p1.shouldShowUnfilteredChatIndicator else nil
	})
end

return function(Tbl) --[[ Line: 237 | Named "ConversationFacePile" ]]
	-- upvalues: NewResult (copy), ReactModule (copy), ConversationFacePileInner (copy)
	local ConversationId = Tbl.conversationId
	
	if ConversationId and ConversationId ~= "" then
		local Copy = table.clone(Tbl)
		Copy.conversationId = ConversationId
		
		return ReactModule.createElement(ConversationFacePileInner, Copy)
	else
		NewResult:warning("conversationId cannot be nil nor an empty string")
		
		return nil
	end
end