local Players = game:GetService("Players")
local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local GetConversationStoreModule = require(Parent.AppChat.GetConversationStore)
local FetchConversationDetailsToSignalsModule = require(Parent.AppChat.fetchConversationDetailsToSignals)
local UseIsGuiInChatVisibleModule = require(Parent.AppChat.useIsGuiInChatVisible)
local NewResult = require(Parent.ExpChatShared).Logger:new(script.Name)
local t = {}
local RecordModalSequenceResponseResults = {}
local t1 = {}
local t2 = {}

local function _(p1): string --[[ Line: 31 | Named "getSubmissionKey" ]]
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	
	return `{if LocalPlayer then LocalPlayer.UserId else 0}:{p1}`
end

local _ = function(p2): boolean --[[ Line: 40 | Named "isRetryable" ]]
	if typeof(p2) == "table" then
		local StatusCode = p2.StatusCode or (p2.statusCode or p2.responseCode)
		
		return StatusCode == nil or (StatusCode <= 0 or (StatusCode == 408 or (StatusCode == 429 or StatusCode >= 500)))
	else
		return true
	end
end

local function markAcknowledged(ConversationId) --[[ Line: 48 ]]
	-- upvalues: GetConversationStoreModule (copy), AppChatNetworkingModule (copy)
	local ConversationStoreModule = GetConversationStoreModule(false)
	local Conversation = ConversationStoreModule.getConversation(ConversationId, false)
	
	if Conversation and Conversation.osaAcknowledgementStatus ~= AppChatNetworkingModule.Constants.OsaAcknowledgementStatusResponse.Acknowledged then
		local Copy = table.clone(Conversation)
		Copy.osaAcknowledgementStatus = AppChatNetworkingModule.Constants.OsaAcknowledgementStatusResponse.Acknowledged
		ConversationStoreModule.upsertConversation(Copy)
	end
end

return {
	useAcknowledgement = function(p2) --[[ Line: 63 ]]
		-- upvalues: ReactModule (copy), SignalsModule (copy), GetConversationStoreModule (copy), SignalsReactModule (copy), AppChatNetworkingModule (copy), UseIsGuiInChatVisibleModule (copy), Players (copy), t (copy), t2 (copy), t1 (copy), RecordModalSequenceResponseResults (copy), markAcknowledged (copy), FetchConversationDetailsToSignalsModule (copy), NewResult (copy)
		local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 64 ]]
			-- upvalues: SignalsModule (upval), GetConversationStoreModule (upval), p2 (copy)
			return SignalsModule.createComputed(function(p3) --[[ Line: 65 ]]
				-- upvalues: GetConversationStoreModule (upval), p2 (upval)
				return GetConversationStoreModule(p3).getConversation(p2.conversationId, p3)
			end)
		end, { p2.conversationId })))
		local IsOsaAcknowledgementStatusMatch: boolean = UseSignalStateResult ~= nil and UseSignalStateResult.osaAcknowledgementStatus == AppChatNetworkingModule.Constants.OsaAcknowledgementStatusResponse.Unacknowledged
		local Source = if UseSignalStateResult then UseSignalStateResult.source else nil
		local UseIsGuiInChatVisibleModuleResult = UseIsGuiInChatVisibleModule(p2.guiObjectRef, { p2.guiObjectRef.current })
		local UseStateResult, UseStateResult2 = ReactModule.useState(0)
		ReactModule.useEffect(function() --[[ Line: 79 ]]
			-- upvalues: p2 (copy), Players (upval), IsOsaAcknowledgementStatusMatch (copy), UseIsGuiInChatVisibleModuleResult (copy), t (upval), t2 (upval), t1 (upval), UseStateResult2 (copy), RecordModalSequenceResponseResults (upval), Source (copy), AppChatNetworkingModule (upval), markAcknowledged (upval), FetchConversationDetailsToSignalsModule (upval), NewResult (upval)
			local ConversationId = p2.conversationId
			local LocalPlayer = Players.LocalPlayer
			local Text: string = `{if LocalPlayer then LocalPlayer.UserId else 0}:{ConversationId}`
			
			if ConversationId == "" or not IsOsaAcknowledgementStatusMatch or not UseIsGuiInChatVisibleModuleResult or t[Text] or t2[Text] then return end
			local Flag = false
			
			local function scheduleRetry(Err) --[[ Line: 93 ]]
				-- upvalues: t1 (upval), Text (copy), t2 (upval), Flag (ref), UseStateResult2 (upval)
				local Entry = t1[Text] or 0
				local v1 = nil
				
				if typeof(Err) == "table" then
					local StatusCode = Err.StatusCode or (Err.statusCode or Err.responseCode)
					v1 = StatusCode == nil or (StatusCode <= 0 or (StatusCode == 408 or (StatusCode == 429 or StatusCode >= 500)))
				else
					v1 = true
				end
				if v1 and Entry < 4 then
					task.delay(2 ^ math.max(Entry - 1, 0) * 1, function() --[[ Line: 100 ]]
						-- upvalues: Flag (upval), UseStateResult2 (upval)
						if not Flag then
							UseStateResult2(function(p3: number): number --[[ Line: 102 ]]
								return p3 + 1
							end)
						end
					end)
					
					return
				else
					t2[Text] = true
				end
			end
			
			local RecordModalSequenceResponseResult = RecordModalSequenceResponseResults[Text]
			
			if RecordModalSequenceResponseResult then
				RecordModalSequenceResponseResult:catch(scheduleRetry)
				
				return function() --[[ Line: 111 ]]
					-- upvalues: Flag (ref)
					Flag = true
				end
			else
				local IsFriends = Source == "friends"
				local RecordModalSequenceResponseResult1 = AppChatNetworkingModule.http.RecordModalSequenceResponse(nil, {
					actionType = "record_has_seen",
					modalSequence = "conversation_inline_top_modal",
					modalVariant = "OsaContextCard",
					conversationId = if IsFriends then nil else ConversationId,
					friendId = if IsFriends then p2.userId else nil
				})
				t1[Text] = (t1[Text] or 0) + 1
				RecordModalSequenceResponseResults[Text] = RecordModalSequenceResponseResult1
				RecordModalSequenceResponseResult1:andThen(function() --[[ Line: 127 ]]
					-- upvalues: RecordModalSequenceResponseResults (upval), Text (copy), t1 (upval), t (upval), markAcknowledged (upval), ConversationId (copy), IsFriends (copy), FetchConversationDetailsToSignalsModule (upval), NewResult (upval)
					RecordModalSequenceResponseResults[Text] = nil
					t1[Text] = nil
					t[Text] = true
					markAcknowledged(ConversationId)
					
					if not IsFriends then
						FetchConversationDetailsToSignalsModule(ConversationId):andThen(function() --[[ Line: 134 ]]
							-- upvalues: markAcknowledged (upval), ConversationId (upval)
							markAcknowledged(ConversationId)
						end):catch(function(Err) --[[ Line: 137 ]]
							-- upvalues: NewResult (upval)
							NewResult:warning(`Failed to refresh conversation after Friends Chat OSA acknowledgement: {tostring(Err)}`)
						end)
					end
				end):catch(function(Err) --[[ Line: 146 ]]
					-- upvalues: RecordModalSequenceResponseResults (upval), Text (copy), NewResult (upval), scheduleRetry (copy)
					RecordModalSequenceResponseResults[Text] = nil
					NewResult:error(`Failed to record Friends Chat OSA acknowledgement: {tostring(Err)}`)
					scheduleRetry(Err)
				end)
				
				return function() --[[ Line: 151 ]]
					-- upvalues: Flag (ref)
					Flag = true
				end
			end
		end, {
			p2.conversationId, p2.userId, IsOsaAcknowledgementStatusMatch,
			UseIsGuiInChatVisibleModuleResult, Source, UseStateResult
		})
	end,
	hasSubmitted = function(p3): boolean --[[ Line: 36 ]]
		-- upvalues: t (copy), Players (copy)
		local LocalPlayer = Players.LocalPlayer
		
		return t[`{if LocalPlayer then LocalPlayer.UserId else 0}:{p3}`] == true
	end
}