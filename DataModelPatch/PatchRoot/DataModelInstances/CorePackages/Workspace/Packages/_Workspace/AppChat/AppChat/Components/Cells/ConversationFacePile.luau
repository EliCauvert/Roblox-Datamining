local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck
local UseIsRobloxSubscriberFunction = require(Parent.UserProfiles).Hooks.useIsRobloxSubscriber
local UserTile = require(Parent.UserTile).UserTile
local LayoutMode = require(Parent.UserTile).LayoutMode
local NewResult = require(Parent.Loggers).Logger:new(script.Name)
local UseFoundationPresenceModule = require(AppChat.Hooks.useFoundationPresence)
local PresenceType = require(AppChat.Http.RoduxPresence).Enums.PresenceType
local UserPresence = require(Parent.Foundation).Enums.UserPresence

local function _(p1)
	if type(p1) == "table" then
		local Id = p1.id or p1.userId
		
		return if Id == nil then nil else tostring(Id)
	else
		return if p1 == nil then nil else tostring(p1)
	end
end

local _ = function(p1)
	return if p1 == nil or p1 == "" then nil else tostring(p1)
end

local function ConversationFacePileInner(p1)
	-- upvalues: UseLocalUserIdFunction (copy), ReactModule (copy), UseSelectorFunction (copy), UseFoundationPresenceModule (copy), UserPresence (copy), PresenceType (copy), FFlagEnableBlackbirdCheck (copy), UseIsRobloxSubscriberFunction (copy), UserTile (copy), LayoutMode (copy)
	local ConversationId = p1.conversationId
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local LocalUserId = p1.localUserId
	local Text = (if LocalUserId == nil or LocalUserId == "" then nil else tostring(LocalUserId)) or ((if UseLocalUserIdResult == nil or UseLocalUserIdResult == "" then nil else tostring(UseLocalUserIdResult)) or "")
	local UseSelectorResult = UseSelectorFunction((ReactModule.useCallback(function(p2)
		-- upvalues: ConversationId (copy)
		return if p2 and p2.ChatAppReducer and p2.ChatAppReducer.Conversations then p2.ChatAppReducer.Conversations[ConversationId] else nil
	end, { ConversationId })))
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
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
	local Entry = List[1] or Text
	local UseFoundationPresenceModuleResult = UseFoundationPresenceModule(Entry)
	local None = UserPresence.None
	
	if #List >= 2 then
		local Flag = false
		local Flag1 = false
		
		for _, value in List do
			if UseSelectorResult1 and UseSelectorResult1[value] then
				local UserPresenceType = UseSelectorResult1[value].userPresenceType
				
				if UserPresenceType == PresenceType.InGame or UserPresenceType == PresenceType.InStudio then
					Flag = true
				elseif UserPresenceType == PresenceType.Online then
					Flag1 = true
				end
			end
		end
		if Flag then
			None = UserPresence.InExperience
		elseif Flag1 then
			None = UserPresence.Active
		end
	else
		None = UseFoundationPresenceModuleResult.presence
	end
	local v1: string? = nil
	
	if FFlagEnableBlackbirdCheck and #Participants == 2 then
		local Text2 = nil
		for _, participant1 in Participants do
			if type(participant1) == "table" then
				local Id = participant1.id or participant1.userId
				Text2 = if Id == nil then nil else tostring(Id)
			else
				Text2 = if participant1 == nil then nil else tostring(participant1)
			end
			if Text2 and tostring(Text2) ~= tostring(Text) then
				v1 = tostring(Text2)
				break
			end
		end
	end
	local UseIsRobloxSubscriberResult = UseIsRobloxSubscriberFunction(v1)
	
	return ReactModule.createElement(UserTile, {
		userId = Entry,
		facePileSecondUserId = List[2] or nil,
		layoutMode = LayoutMode.wide,
		title = p1.titleText,
		subtitle = p1.subtitleText,
		titleStyle = p1.titleStyle,
		subtitleStyle = p1.subtitleStyle,
		userPresenceType = None,
		onActivated = p1.onActivated,
		selectable = p1.selectable,
		customTextTruncation = Enum.TextTruncate.SplitWord,
		trustedConnectionIndicatorEnabled = p1.trustedConnectionIndicatorEnabled,
		isRobloxSubscriber = if FFlagEnableBlackbirdCheck then UseIsRobloxSubscriberResult else nil
	})
end

return function(Tbl)
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