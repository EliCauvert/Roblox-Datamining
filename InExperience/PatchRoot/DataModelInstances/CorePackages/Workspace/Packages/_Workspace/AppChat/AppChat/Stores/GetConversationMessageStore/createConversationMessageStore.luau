local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local CreateProxyFunction = require(Parent.SignalsExperimental).createProxy
local _ = require(AppChat.MessageData.Types)
local SignalsMigrationConfigModule = require(AppChat.Flags.SignalsMigrationConfig)
local FFlagAppChatParseMessageTimestampsOnceModule = require(AppChat.Flags.FFlagAppChatParseMessageTimestampsOnce)
local ParseIsoDateUnixMillisModule = require(AppChat.Utils.parseIsoDateUnixMillis)

local function keepSendingMessageStableKey(p1, p2)
	-- upvalues: CryoModule (copy)
	return if p1 == nil or p1.stableKey == nil or p1.stableKey == p1.id or p2.stableKey ~= nil and p2.stableKey ~= p2.id then p2 else CryoModule.Dictionary.join(p2, { stableKey = p1.stableKey })
end

local function _(p1, p2)
	-- upvalues: ParseIsoDateUnixMillisModule (copy)
	return if p2 == nil or p2.created_at ~= p1.created_at or p2.createdAtUnixMillis == nil then ParseIsoDateUnixMillisModule(p1.created_at) else p2.createdAtUnixMillis
end

local function withCreatedAtUnixMillis(JoinResult, p1)
	-- upvalues: ParseIsoDateUnixMillisModule (copy), CryoModule (copy)
	local t = {}
	local ParseIsoDateUnixMillisModuleResult = if p1 == nil or p1.created_at ~= JoinResult.created_at or p1.createdAtUnixMillis == nil then ParseIsoDateUnixMillisModule(JoinResult.created_at) else p1.createdAtUnixMillis
	
	if ParseIsoDateUnixMillisModuleResult ~= JoinResult.createdAtUnixMillis then
		t.createdAtUnixMillis = if ParseIsoDateUnixMillisModuleResult == nil then CryoModule.None else ParseIsoDateUnixMillisModuleResult
	end
	local RepliesTo = JoinResult.replies_to
	
	if RepliesTo ~= nil then
		local RepliesTo1 = if p1 == nil then nil else p1.replies_to
		local ParseIsoDateUnixMillisModuleResult1 = if RepliesTo1 == nil or RepliesTo1.created_at ~= RepliesTo.created_at or RepliesTo1.createdAtUnixMillis == nil then ParseIsoDateUnixMillisModule(RepliesTo.created_at) else RepliesTo1.createdAtUnixMillis
		
		if ParseIsoDateUnixMillisModuleResult1 ~= RepliesTo.createdAtUnixMillis then
			t.replies_to = CryoModule.Dictionary.join(RepliesTo, {
				createdAtUnixMillis = if ParseIsoDateUnixMillisModuleResult1 == nil then CryoModule.None else ParseIsoDateUnixMillisModuleResult1
			})
		end
	end
	return if next(t) == nil then JoinResult else CryoModule.Dictionary.join(JoinResult, t)
end

return function()
	-- upvalues: CreateProxyFunction (copy), SignalsMigrationConfigModule (copy), keepSendingMessageStableKey (copy), FFlagAppChatParseMessageTimestampsOnceModule (copy), withCreatedAtUnixMillis (copy), CryoModule (copy)
	local Proxy = CreateProxyFunction({})
	
	return {
		messages = Proxy,
		getMessage = function(p1, p2)
			-- upvalues: Proxy (copy)
			return Proxy(p2)[p1]
		end,
		upsertMessages = function(List)
			-- upvalues: SignalsMigrationConfigModule (upval), keepSendingMessageStableKey (upval), Proxy (copy), FFlagAppChatParseMessageTimestampsOnceModule (upval), withCreatedAtUnixMillis (upval)
			for i, value in List do
				if SignalsMigrationConfigModule.shouldUseViewRecyclerMessageList then
					value = keepSendingMessageStableKey(Proxy[i], value)
				end
				if FFlagAppChatParseMessageTimestampsOnceModule then
					value = withCreatedAtUnixMillis(value, Proxy[i])
				end
				Proxy[i] = value
			end
		end,
		updateMessage = function(Key, p1)
			-- upvalues: Proxy (copy), CryoModule (upval), FFlagAppChatParseMessageTimestampsOnceModule (upval), withCreatedAtUnixMillis (upval)
			local ProxyEntry = Proxy[Key]
			
			if ProxyEntry ~= nil then
				local JoinResult = CryoModule.Dictionary.join(ProxyEntry, p1)
				
				if FFlagAppChatParseMessageTimestampsOnceModule then
					JoinResult = withCreatedAtUnixMillis(JoinResult, ProxyEntry)
				end
				Proxy[Key] = JoinResult
			end
		end,
		removeMessage = function(Key)
			-- upvalues: Proxy (copy)
			Proxy[Key] = nil
		end,
		clear = function()
			-- upvalues: Proxy (copy)
			for i in Proxy do
				Proxy[i] = nil
			end
		end
	}
end