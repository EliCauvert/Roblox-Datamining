local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local logger = require(parent.Loggers).Logger
local reactModule = require(parent.React)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local foundationModule = require(parent.Foundation)
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck
local fFlagUserTileUnfilteredChatIndicator = require(parent.SharedFlags).FFlagUserTileUnfilteredChatIndicator
local fFlagAppChatSanitizeConversationTitleRichText = require(parent.SharedFlags).FFlagAppChatSanitizeConversationTitleRichText
local escapeRichFormatting = require(parent.InlineRichText).escapeRichFormatting
local useIsRobloxSubscriber = require(parent.UserProfiles).Hooks.useIsRobloxSubscriber
local userTile = require(parent.UserTile).UserTile
local layoutMode = require(parent.UserTile).LayoutMode
local roduxPresenceModule = require(appChat.Http.RoduxPresence)
local fFlagAppChatPresenceStoreMigrationModule = require(appChat.Flags.FFlagAppChatPresenceStoreMigration)
local dataHydrationModule = require(parent.DataHydration)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local name = logger:new(script.Name)
local useFoundationPresenceModule = require(appChat.Hooks.useFoundationPresence)
local presenceType = roduxPresenceModule.Enums.PresenceType
local userPresence = foundationModule.Enums.UserPresence
local var1 = if fFlagAppChatPresenceStoreMigrationModule then dataHydrationModule.Presence.PresenceEnums.PresenceType else nil
local var2 = if fFlagAppChatPresenceStoreMigrationModule then dataHydrationModule.Presence.PresenceStore.get() else nil

local function groupPresenceAggregateEquals(p1, p2)
	return p1.hasInExperienceUser == p2.hasInExperienceUser and p1.hasOnlineUser == p2.hasOnlineUser
end

local function _(p1)
	if type(p1) == "table" then
		local id = p1.id or p1.userId
		
		return if id == nil then nil else tostring(id)
	end
	return if p1 == nil then nil else tostring(p1)
end

local _ = function(p1)
	return if p1 == nil or p1 == "" then nil else tostring(p1)
end

local function ConversationFacePileInner(p1)
	-- upvalues: useLocalUserId (ref), reactModule (ref), useSelector (ref), fFlagAppChatPresenceStoreMigrationModule (ref), signalsModule (ref), var2 (ref), var1 (ref), groupPresenceAggregateEquals (ref), signalsReactModule (ref), useFoundationPresenceModule (ref), userPresence (ref), presenceType (ref), fFlagEnableBlackbirdCheck (ref), useIsRobloxSubscriber (ref), userTile (ref), layoutMode (ref), fFlagAppChatSanitizeConversationTitleRichText (ref), escapeRichFormatting (ref), fFlagUserTileUnfilteredChatIndicator (ref)
	local conversationId = p1.conversationId
	local var3 = useLocalUserId()
	local localUserId = p1.localUserId
	local var4 = if localUserId == nil or localUserId == "" then nil else tostring(localUserId)
	
	if not var4 then
		var4 = if var3 == nil or var3 == "" then nil else tostring(var3)
		var4 = var4 or ""
	end
	local var5 = useSelector(reactModule.useCallback(function(p2)
		-- upvalues: conversationId (ref)
		return if p2 and p2.ChatAppReducer and p2.ChatAppReducer.Conversations then p2.ChatAppReducer.Conversations[conversationId] else nil
	end, { conversationId }))
	local var6 = if not fFlagAppChatPresenceStoreMigrationModule then useSelector(function(p2)
		return if p2 and p2.ChatAppReducer and p2.ChatAppReducer.Presence then p2.ChatAppReducer.Presence.byUserId else nil
	end) else nil
	local participants = p1.participants
	
	if not participants then
		participants = if var5 and var5.participants then var5.participants else {}
	end
	local t = {}
	
	if #participants == 1 then
		table.insert(t, var4)
	else
		for i, v in participants do
			local var7
			if type(v) == "table" then
				local var8 = v.id or v.userId
				var7 = if var8 ~= nil then nil else tostring(var8)
			else
				var7 = if v ~= nil then nil else tostring(v)
			end
			if var7 and tostring(var7) ~= tostring(var4) then
				table.insert(t, var7)
			end
		end
	end
	local userPresenceType
	local var9 = if fFlagAppChatPresenceStoreMigrationModule then signalsReactModule.useSignalState(if fFlagAppChatPresenceStoreMigrationModule then reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), t (ref), var2 (copy), var1 (copy), groupPresenceAggregateEquals (copy)
		return signalsModule.createComputed(function(p2)
			-- upvalues: t (copy), var2 (copy), var1 (copy)
			local var10 = false
			local var11 = false
			
			for i, v in t do
				local var12 = var2.GetPresenceByUserId(v).data(p2)
				
				if var12 then
					local userPresenceType = var12.userPresenceType
					
					if userPresenceType == var1.InGame or userPresenceType == var1.InStudio then
						var10 = true
					elseif userPresenceType == var1.Online then
						var11 = true
					end
				end
			end
			return { hasInExperienceUser = var10, hasOnlineUser = var11 }
		end, groupPresenceAggregateEquals)
	end, { table.concat(t, ",") }) else nil) else nil
	local var10 = t[1] or var4
	local var11 = useFoundationPresenceModule(var10)
	local none = userPresence.None
	
	if #t >= 2 then
		local var12 = false
		local var13 = false
		
		if fFlagAppChatPresenceStoreMigrationModule then
			var12 = if var9 then var9.hasInExperienceUser else false
			var13 = if var9 then var9.hasOnlineUser else false
		else
			for i, v in t do
				if var6 and var6[v] then
					userPresenceType = var6[v].userPresenceType
					
					if userPresenceType == presenceType.InGame or userPresenceType == presenceType.InStudio then
						var12 = true
					elseif userPresenceType == presenceType.Online then
						var13 = true
					end
				end
			end
		end
		if var12 then
			none = userPresence.InExperience
		elseif var13 then
			none = userPresence.Active
		end
	else
		none = var11.presence
	end
	local var14 = nil
	
	if fFlagEnableBlackbirdCheck and #participants == 2 then
		local var15
		for i, v in participants do
			if type(v) == "table" then
				userPresenceType = v.id or v.userId
				var15 = if userPresenceType ~= nil then nil else tostring(userPresenceType)
			else
				var15 = if v ~= nil then nil else tostring(v)
			end
			if var15 and tostring(var15) ~= tostring(var4) then
				var14 = tostring(var15)
				break
			end
		end
	end
	return reactModule.createElement(userTile, {
		userId = var10,
		facePileSecondUserId = t[2] or nil,
		layoutMode = layoutMode.wide,
		title = if fFlagAppChatSanitizeConversationTitleRichText and p1.titleText then escapeRichFormatting(p1.titleText) else p1.titleText,
		subtitle = if fFlagAppChatSanitizeConversationTitleRichText and p1.subtitleText then escapeRichFormatting(p1.subtitleText) else p1.subtitleText,
		titleStyle = p1.titleStyle,
		subtitleStyle = p1.subtitleStyle,
		userPresenceType = none,
		onActivated = p1.onActivated,
		selectable = p1.selectable,
		customTextTruncation = Enum.TextTruncate.SplitWord,
		trustedConnectionIndicatorEnabled = p1.trustedConnectionIndicatorEnabled,
		isRobloxSubscriber = if fFlagEnableBlackbirdCheck then useIsRobloxSubscriber(var14) else nil,
		shouldShowUnfilteredChatIndicator = if fFlagUserTileUnfilteredChatIndicator then p1.shouldShowUnfilteredChatIndicator else nil
	})
end

return function(p2)
	-- upvalues: name (ref), reactModule (ref), ConversationFacePileInner (ref)
	local conversationId = p2.conversationId
	
	if conversationId and conversationId ~= "" then
		local cloned = table.clone(p2)
		cloned.conversationId = conversationId
		
		return reactModule.createElement(ConversationFacePileInner, cloned)
	end
	name:warning("conversationId cannot be nil nor an empty string")
	
	return nil
end