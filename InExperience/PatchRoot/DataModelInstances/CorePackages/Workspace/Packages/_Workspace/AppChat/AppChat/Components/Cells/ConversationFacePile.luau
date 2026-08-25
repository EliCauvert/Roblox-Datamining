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
local var10 = if fFlagAppChatPresenceStoreMigrationModule then dataHydrationModule.Presence.PresenceEnums.PresenceType else nil
local var11 = if fFlagAppChatPresenceStoreMigrationModule then dataHydrationModule.Presence.PresenceStore.get() else nil

local function groupPresenceAggregateEquals(p0, p1)
	return p0.hasInExperienceUser == p1.hasInExperienceUser and p0.hasOnlineUser == p1.hasOnlineUser
end

local function _(p2)
	if type(p2) == "table" then
		local id = p2.id or p2.userId
		
		return if id == nil then nil else tostring(id)
	end
	return if p2 == nil then nil else tostring(p2)
end

local _ = function(p3)
	return if p3 == nil or p3 == "" then nil else tostring(p3)
end

local function ConversationFacePileInner(p4)
	-- upvalues: useLocalUserId (ref), reactModule (ref), useSelector (ref), fFlagAppChatPresenceStoreMigrationModule (ref), signalsModule (ref), var11 (ref), var10 (ref), groupPresenceAggregateEquals (ref), signalsReactModule (ref), useFoundationPresenceModule (ref), userPresence (ref), presenceType (ref), fFlagEnableBlackbirdCheck (ref), useIsRobloxSubscriber (ref), userTile (ref), layoutMode (ref), fFlagAppChatSanitizeConversationTitleRichText (ref), escapeRichFormatting (ref), fFlagUserTileUnfilteredChatIndicator (ref)
	local conversationId = p4.conversationId
	local var15 = useLocalUserId()
	local localUserId = p4.localUserId
	local var16 = if localUserId == nil or localUserId == "" then nil else tostring(localUserId)
	
	if not var16 then
		var16 = if var15 == nil or var15 == "" then nil else tostring(var15)
		var16 = var16 or ""
	end
	local var17 = useSelector(reactModule.useCallback(function(p5)
		-- upvalues: conversationId (ref)
		return if p5 and p5.ChatAppReducer and p5.ChatAppReducer.Conversations then p5.ChatAppReducer.Conversations[conversationId] else nil
	end, { conversationId }))
	local var18 = if not fFlagAppChatPresenceStoreMigrationModule then useSelector(function(p6)
		return if p6 and p6.ChatAppReducer and p6.ChatAppReducer.Presence then p6.ChatAppReducer.Presence.byUserId else nil
	end) else nil
	local participants = p4.participants
	
	if not participants then
		participants = if var17 and var17.participants then var17.participants else {}
	end
	local t = {}
	
	if #participants == 1 then
		table.insert(t, var16)
	else
		for i, v in participants do
			local var21
			if type(v) == "table" then
				local var20 = v.id or v.userId
				var21 = if var20 ~= nil then nil else tostring(var20)
			else
				var21 = if v ~= nil then nil else tostring(v)
			end
			if var21 and tostring(var21) ~= tostring(var16) then
				table.insert(t, var21)
			end
		end
	end
	local userPresenceType
	local var22 = if fFlagAppChatPresenceStoreMigrationModule then signalsReactModule.useSignalState(if fFlagAppChatPresenceStoreMigrationModule then reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), t (ref), var11 (copy), var10 (copy), groupPresenceAggregateEquals (copy)
		return signalsModule.createComputed(function(p7)
			-- upvalues: t (copy), var11 (copy), var10 (copy)
			local var29 = false
			local var30 = false
			
			for i, v in t do
				local var31 = var11.GetPresenceByUserId(v).data(p7)
				
				if var31 then
					local userPresenceType = var31.userPresenceType
					
					if userPresenceType == var10.InGame or userPresenceType == var10.InStudio then
						var29 = true
					elseif userPresenceType == var10.Online then
						var30 = true
					end
				end
			end
			return { hasInExperienceUser = var29, hasOnlineUser = var30 }
		end, groupPresenceAggregateEquals)
	end, { table.concat(t, ",") }) else nil) else nil
	local var23 = t[1] or var16
	local var24 = useFoundationPresenceModule(var23)
	local none = userPresence.None
	
	if #t >= 2 then
		local var25 = false
		local var26 = false
		
		if fFlagAppChatPresenceStoreMigrationModule then
			var25 = if var22 then var22.hasInExperienceUser else false
			var26 = if var22 then var22.hasOnlineUser else false
		else
			for i, v in t do
				if var18 and var18[v] then
					userPresenceType = var18[v].userPresenceType
					
					if userPresenceType == presenceType.InGame or userPresenceType == presenceType.InStudio then
						var25 = true
					elseif userPresenceType == presenceType.Online then
						var26 = true
					end
				end
			end
		end
		if var25 then
			none = userPresence.InExperience
		elseif var26 then
			none = userPresence.Active
		end
	else
		none = var24.presence
	end
	local var27 = nil
	
	if fFlagEnableBlackbirdCheck and #participants == 2 then
		local var28
		for i, v in participants do
			if type(v) == "table" then
				userPresenceType = v.id or v.userId
				var28 = if userPresenceType ~= nil then nil else tostring(userPresenceType)
			else
				var28 = if v ~= nil then nil else tostring(v)
			end
			if var28 and tostring(var28) ~= tostring(var16) then
				var27 = tostring(var28)
				break
			end
		end
	end
	return reactModule.createElement(userTile, {
		userId = var23,
		facePileSecondUserId = t[2] or nil,
		layoutMode = layoutMode.wide,
		title = if fFlagAppChatSanitizeConversationTitleRichText and p4.titleText then escapeRichFormatting(p4.titleText) else p4.titleText,
		subtitle = if fFlagAppChatSanitizeConversationTitleRichText and p4.subtitleText then escapeRichFormatting(p4.subtitleText) else p4.subtitleText,
		titleStyle = p4.titleStyle,
		subtitleStyle = p4.subtitleStyle,
		userPresenceType = none,
		onActivated = p4.onActivated,
		selectable = p4.selectable,
		customTextTruncation = Enum.TextTruncate.SplitWord,
		trustedConnectionIndicatorEnabled = p4.trustedConnectionIndicatorEnabled,
		isRobloxSubscriber = if fFlagEnableBlackbirdCheck then useIsRobloxSubscriber(var27) else nil,
		shouldShowUnfilteredChatIndicator = if fFlagUserTileUnfilteredChatIndicator then p4.shouldShowUnfilteredChatIndicator else nil
	})
end

return function(p8)
	-- upvalues: name (ref), reactModule (ref), ConversationFacePileInner (ref)
	local conversationId = p8.conversationId
	
	if conversationId and conversationId ~= "" then
		local cloned = table.clone(p8)
		cloned.conversationId = conversationId
		
		return reactModule.createElement(ConversationFacePileInner, cloned)
	end
	name:warning("conversationId cannot be nil nor an empty string")
	
	return nil
end