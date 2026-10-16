local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local DataHydrationModule = require(Parent.DataHydration)
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local CreateCurrentTimeSignalFunction = require(Parent.SignalsUtils).createCurrentTimeSignal
local ClearTimeoutFunction = LuauPolyfillModule.clearTimeout
local SetTimeoutFunction = LuauPolyfillModule.setTimeout
local _ = require(AppChat.Models.ConversationChannels)
local GetChatModerationStatusDataHydrationModule = require(AppChat.Stores.GetChatModerationStatusDataHydration)
local GetEffectiveChatTimeoutDetailsModule = require(AppChat.Utils.getEffectiveChatTimeoutDetails)
local ToTimeoutEntryModule = require(AppChat.Utils.toTimeoutEntry)
local FFlagAppChatReactiveFeatureRestrictions = require(Parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions
local NewResult = require(AppChat.Logger):new(script.Name)

local function areChatTimeoutDetailsEqual(p1, p2): boolean --[[ Line: 31 ]]
	-- upvalues: FFlagAppChatReactiveFeatureRestrictions (copy)
	return p1.isTimedOut == p2.isTimedOut and (p1.timeoutEndTimestamp == p2.timeoutEndTimestamp and (p1.decisionEventId == p2.decisionEventId and p1.duration == p2.duration)) and (not FFlagAppChatReactiveFeatureRestrictions or p1.requiresAcknowledgement == p2.requiresAcknowledgement)
end

return function(p1) --[[ Line: 42 | Named "useChatTimeoutDetailsFromHydration" ]]
	-- upvalues: ReactModule (copy), FFlagAppChatReactiveFeatureRestrictions (copy), CreateCurrentTimeSignalFunction (copy), GetChatModerationStatusDataHydrationModule (copy), NewResult (copy), SignalsModule (copy), GetEffectiveChatTimeoutDetailsModule (copy), DataHydrationModule (copy), ToTimeoutEntryModule (copy), areChatTimeoutDetailsEqual (copy), ClearTimeoutFunction (copy), SetTimeoutFunction (copy)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 43 ]]
		-- upvalues: FFlagAppChatReactiveFeatureRestrictions (upval), CreateCurrentTimeSignalFunction (upval)
		return if FFlagAppChatReactiveFeatureRestrictions then function() --[[ Line: 45 ]]
			return DateTime.now().UnixTimestamp
		end else CreateCurrentTimeSignalFunction(1)
	end, {})
	local ChatModerationStatusDataHydrationModule = GetChatModerationStatusDataHydrationModule(false)
	local CachedUserStatus = nil
	local v1 = false
	
	if FFlagAppChatReactiveFeatureRestrictions then
		CachedUserStatus, v16 = ChatModerationStatusDataHydrationModule.getCachedUserStatus()
	else
		CachedUserStatus = ChatModerationStatusDataHydrationModule.getUserStatus()
	end
	local ConversationId = p1.conversationId
	local ConversationStatus = CachedUserStatus
	local v2 = false
	
	if ConversationId then
		if FFlagAppChatReactiveFeatureRestrictions then
			ConversationStatus, v20 = ChatModerationStatusDataHydrationModule.getCachedConversationStatus(ConversationId)
		else
			ConversationStatus = ChatModerationStatusDataHydrationModule.getConversationStatus(ConversationId)
		end
	end
	ReactModule.useEffect(function() --[[ Line: 73 ]]
		-- upvalues: FFlagAppChatReactiveFeatureRestrictions (upval), v1 (ref), v2 (ref), ChatModerationStatusDataHydrationModule (copy), ConversationId (copy), NewResult (upval)
		if FFlagAppChatReactiveFeatureRestrictions and (v1 or v2) then
			ChatModerationStatusDataHydrationModule.refreshStatuses(if ConversationId then { ConversationId } else nil):catch(function() --[[ Line: 75 ]]
				-- upvalues: NewResult (upval)
				NewResult:warning("Failed to fetch Party Chat moderation status")
			end)
		end
	end, {
		ConversationId,
		v2,
		ChatModerationStatusDataHydrationModule,
		v1
	})
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 82 ]]
		-- upvalues: SignalsModule (upval), CachedUserStatus (ref), ConversationStatus (ref), GetEffectiveChatTimeoutDetailsModule (upval), DataHydrationModule (upval), ToTimeoutEntryModule (upval), ConversationId (copy), p1 (copy), UseMemoResult (copy), areChatTimeoutDetailsEqual (upval)
		return SignalsModule.createComputed(function(p2) --[[ Line: 83 ]]
			-- upvalues: CachedUserStatus (upval), ConversationStatus (upval), GetEffectiveChatTimeoutDetailsModule (upval), DataHydrationModule (upval), ToTimeoutEntryModule (upval), ConversationId (upval), p1 (upval), UseMemoResult (upval)
			local DataResult = CachedUserStatus.data(p2)
			local DataResult1 = ConversationStatus.data(p2)
			local StatusResult = ConversationStatus.status(p2)
			
			return GetEffectiveChatTimeoutDetailsModule(if CachedUserStatus.status(p2) == DataHydrationModule.DataStatus.Failed then nil else ToTimeoutEntryModule(DataResult), if ConversationId and StatusResult ~= DataHydrationModule.DataStatus.Failed then ToTimeoutEntryModule(DataResult1) else nil, p1.conversationModerationType, UseMemoResult(p2))
		end, areChatTimeoutDetailsEqual)
	end, {
		ConversationId, ConversationStatus.data, ConversationStatus.status,
		UseMemoResult, p1.conversationModerationType, CachedUserStatus.data,
		CachedUserStatus.status
	})
	
	if FFlagAppChatReactiveFeatureRestrictions then
		ReactModule.useEffect(function() --[[ Line: 111 ]]
			-- upvalues: SignalsModule (upval), ClearTimeoutFunction (upval), UseMemoResult1 (copy), SetTimeoutFunction (upval), ChatModerationStatusDataHydrationModule (copy), ConversationId (copy), NewResult (upval)
			local v3 = nil
			local Effect = SignalsModule.createEffect(function(p2) --[[ Line: 114 ]]
				-- upvalues: v3 (ref), ClearTimeoutFunction (upval), UseMemoResult1 (upval), SetTimeoutFunction (upval), ChatModerationStatusDataHydrationModule (upval), ConversationId (upval), NewResult (upval)
				local v4 = v3
				
				if v4 then
					ClearTimeoutFunction(v4)
					v3 = nil
				end
				local UseMemoResultResult = UseMemoResult1(p2)
				local UnixTimestamp = DateTime.now().UnixTimestamp
				
				if UseMemoResultResult.isTimedOut and UnixTimestamp < UseMemoResultResult.timeoutEndTimestamp then
					v3 = SetTimeoutFunction(function() --[[ Line: 125 ]]
						-- upvalues: v3 (upval), ChatModerationStatusDataHydrationModule (upval), ConversationId (upval), NewResult (upval)
						v3 = nil
						ChatModerationStatusDataHydrationModule.refreshStatuses(if ConversationId then { ConversationId } else nil):catch(function() --[[ Line: 127 ]]
							-- upvalues: NewResult (upval)
							NewResult:warning("Failed to refresh expired Party Chat restriction")
						end)
					end, (UseMemoResultResult.timeoutEndTimestamp - UnixTimestamp + 1) * 1000)
				end
			end)
			
			return function() --[[ Line: 134 ]]
				-- upvalues: v3 (ref), ClearTimeoutFunction (upval), Effect (copy)
				local v4 = v3
				
				if v4 then
					ClearTimeoutFunction(v4)
				end
				Effect()
			end
		end, {
			ConversationId,
			UseMemoResult1,
			ChatModerationStatusDataHydrationModule
		})
	end
	return UseMemoResult1
end