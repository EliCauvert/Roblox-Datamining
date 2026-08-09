local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local logger = require(parent.Loggers).Logger
local reactModule = require(parent.React)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local foundationModule = require(parent.Foundation)
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck
local useIsRobloxSubscriber = require(parent.UserProfiles).Hooks.useIsRobloxSubscriber
local userTile = require(parent.UserTile).UserTile
local layoutMode = require(parent.UserTile).LayoutMode
local roduxPresenceModule = require(appChat.Http.RoduxPresence)
local name = logger:new(script.Name)
local useFoundationPresenceModule = require(appChat.Hooks.useFoundationPresence)
local presenceType = roduxPresenceModule.Enums.PresenceType
local userPresence = foundationModule.Enums.UserPresence

local function _(p0) --[[ line: 51 | named "getParticipantId" ]]
	if type(p0) == "table" then
		local id = p0.id or p0.userId
		
		return if id == nil then nil else tostring(id)
	end
	return if p0 == nil then nil else tostring(p0)
end

local _ = function(p1) --[[ line: 60 | named "getNonEmptyLocalUserId" ]]
	return if p1 == nil or p1 == "" then nil else tostring(p1)
end

local function ConversationFacePileInner(p2) --[[ line: 68 ]]
	-- upvalues: useLocalUserId (ref), reactModule (ref), useSelector (ref), useFoundationPresenceModule (ref), userPresence (ref), presenceType (ref), fFlagEnableBlackbirdCheck (ref), useIsRobloxSubscriber (ref), userTile (ref), layoutMode (ref)
	local conversationId = p2.conversationId
	local var8 = useLocalUserId()
	local localUserId = p2.localUserId
	local var9 = if localUserId == nil or localUserId == "" then nil else tostring(localUserId)
	
	if not var9 then
		var9 = if var8 == nil or var8 == "" then nil else tostring(var8)
		var9 = var9 or ""
	end
	local var10 = useSelector(reactModule.useCallback(function(p3) --[[ line: 73 ]]
		-- upvalues: conversationId (ref)
		return if p3 and p3.ChatAppReducer and p3.ChatAppReducer.Conversations then p3.ChatAppReducer.Conversations[conversationId] else nil
	end, { conversationId }))
	local var11 = useSelector(function(p4) --[[ line: 81 ]]
		return if p4 and p4.ChatAppReducer and p4.ChatAppReducer.Presence then p4.ChatAppReducer.Presence.byUserId else nil
	end)
	local participants = p2.participants
	
	if not participants then
		participants = if var10 and var10.participants then var10.participants else {}
	end
	local t = {}
	
	if #participants == 1 then
		table.insert(t, var9)
	else
		for i, v in participants do
			local var14
			if type(v) == "table" then
				local var13 = v.id or v.userId
				var14 = if var13 ~= nil then nil else tostring(var13)
			else
				var14 = if v ~= nil then nil else tostring(v)
			end
			if var14 and tostring(var14) ~= tostring(var9) then
				table.insert(t, var14)
			end
		end
	end
	local userPresenceType
	local var15 = t[1] or var9
	local var16 = useFoundationPresenceModule(var15)
	local none = userPresence.None
	
	if #t >= 2 then
		local var17 = false
		local var18 = false
		
		for i, v in t do
			if var11 and var11[v] then
				userPresenceType = var11[v].userPresenceType
				
				if userPresenceType == presenceType.InGame or userPresenceType == presenceType.InStudio then
					var17 = true
				elseif userPresenceType == presenceType.Online then
					var18 = true
				end
			end
		end
		if var17 then
			none = userPresence.InExperience
		elseif var18 then
			none = userPresence.Active
		end
	else
		none = var16.presence
	end
	local var19 = nil
	
	if fFlagEnableBlackbirdCheck and #participants == 2 then
		local var20
		for i, v in participants do
			if type(v) == "table" then
				userPresenceType = v.id or v.userId
				var20 = if userPresenceType ~= nil then nil else tostring(userPresenceType)
			else
				var20 = if v ~= nil then nil else tostring(v)
			end
			if var20 and tostring(var20) ~= tostring(var9) then
				var19 = tostring(var20)
				break
			end
		end
	end
	return reactModule.createElement(userTile, {
		userId = var15,
		facePileSecondUserId = t[2] or nil,
		layoutMode = layoutMode.wide,
		title = p2.titleText,
		subtitle = p2.subtitleText,
		titleStyle = p2.titleStyle,
		subtitleStyle = p2.subtitleStyle,
		userPresenceType = none,
		onActivated = p2.onActivated,
		selectable = p2.selectable,
		customTextTruncation = Enum.TextTruncate.SplitWord,
		trustedConnectionIndicatorEnabled = p2.trustedConnectionIndicatorEnabled,
		isRobloxSubscriber = if fFlagEnableBlackbirdCheck then useIsRobloxSubscriber(var19) else nil
	})
end

return function(p5) --[[ line: 162 | named "ConversationFacePile" ]]
	-- upvalues: name (ref), reactModule (ref), ConversationFacePileInner (ref)
	local conversationId = p5.conversationId
	
	if conversationId and conversationId ~= "" then
		local cloned = table.clone(p5)
		cloned.conversationId = conversationId
		
		return reactModule.createElement(ConversationFacePileInner, cloned)
	end
	name:warning("conversationId cannot be nil nor an empty string")
	
	return nil
end