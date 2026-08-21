local playersService = game:GetService("Players")
local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local getConversationStoreModule = require(parent.AppChat.GetConversationStore)
local fetchConversationDetailsToSignalsModule = require(parent.AppChat.fetchConversationDetailsToSignals)
local useIsGuiInChatVisibleModule = require(parent.AppChat.useIsGuiInChatVisible)
local name = require(parent.ExpChatShared).Logger:new(script.Name)
local t = {}
local t_1 = {}
local t_2 = {}
local t_3 = {}

local function _(p0) --[[ line: 31 | named "getSubmissionKey" ]]
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	
	return `{if localPlayer then localPlayer.UserId else 0}:{p0}`
end

local function hasSubmitted(p1) --[[ line: 36 ]]
	-- upvalues: t (ref), playersService (ref)
	local localPlayer = playersService.LocalPlayer
	
	return t[`{if localPlayer then localPlayer.UserId else 0}:{p1}`] == true
end

local _ = function(p2) --[[ line: 40 | named "isRetryable" ]]
	if typeof(p2) ~= "table" then
		return true
	end
	local statusCode = p2.StatusCode or (p2.statusCode or p2.responseCode)
	
	return if statusCode ~= nil then if statusCode > 0 then if statusCode ~= 408 then if statusCode ~= 429 then statusCode >= 500 else true else true else true else true
end

local function markAcknowledged(p3) --[[ line: 48 ]]
	-- upvalues: getConversationStoreModule (ref), appChatNetworkingModule (ref)
	local var16 = getConversationStoreModule(false)
	local conversation = var16.getConversation(p3, false)
	
	if conversation and conversation.osaAcknowledgementStatus ~= appChatNetworkingModule.Constants.OsaAcknowledgementStatusResponse.Acknowledged then
		local cloned = table.clone(conversation)
		cloned.osaAcknowledgementStatus = appChatNetworkingModule.Constants.OsaAcknowledgementStatusResponse.Acknowledged
		var16.upsertConversation(cloned)
	end
end

return {
	useAcknowledgement = function(p4) --[[ line: 63 ]]
		-- upvalues: reactModule (ref), signalsModule (ref), getConversationStoreModule (ref), signalsReactModule (ref), appChatNetworkingModule (ref), useIsGuiInChatVisibleModule (ref), playersService (ref), t (ref), t_3 (ref), t_2 (ref), t_1 (ref), markAcknowledged (ref), fetchConversationDetailsToSignalsModule (ref), name (ref)
		local var19 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 64 ]]
			-- upvalues: signalsModule (copy), getConversationStoreModule (copy), p4 (ref)
			return signalsModule.createComputed(function(p5) --[[ line: 65 ]]
				-- upvalues: getConversationStoreModule (copy), p4 (copy)
				return getConversationStoreModule(p5).getConversation(p4.conversationId, p5)
			end)
		end, { p4.conversationId }))
		local var20 = var19 ~= nil and var19.osaAcknowledgementStatus == appChatNetworkingModule.Constants.OsaAcknowledgementStatusResponse.Unacknowledged
		local var21 = if var19 then var19.source else nil
		local var22 = useIsGuiInChatVisibleModule(p4.guiObjectRef, { p4.guiObjectRef.current })
		local var23, var24 = reactModule.useState(0)
		reactModule.useEffect(function() --[[ line: 79 ]]
			-- upvalues: p4 (ref), playersService (copy), var20 (ref), var22 (ref), t (copy), t_3 (copy), t_2 (copy), var24 (ref), t_1 (copy), var21 (ref), appChatNetworkingModule (copy), markAcknowledged (copy), fetchConversationDetailsToSignalsModule (copy), name (copy)
			local conversationId = p4.conversationId
			local localPlayer = playersService.LocalPlayer
			local var25 = `{if localPlayer then localPlayer.UserId else 0}:{conversationId}`
			
			if conversationId == "" or not var20 or (not var22 or t[var25]) or t_3[var25] then return end
			local var26 = false
			
			var25 = function(p6) --[[ line: 93 | named "scheduleRetry" ]]
				-- upvalues: t_2 (copy), var25 (ref), t_3 (copy), var26 (write), var24 (copy)
				local var31
				local var30 = t_2[var25] or 0
				
				if typeof(p6) == "table" then
					local statusCode = p6.StatusCode or (p6.statusCode or p6.responseCode)
					var31 = if statusCode ~= nil then if statusCode > 0 then if statusCode ~= 408 then if statusCode ~= 429 then statusCode >= 500 else true else true else true else true
				else
					var31 = true
				end
				if var31 and var30 < 4 then
					task.delay(2 ^ math.max(var30 - 1, 0) * 1, function() --[[ line: 100 ]]
						-- upvalues: var26 (copy), var24 (copy)
						if not var26 then
							var24(function(p7) --[[ line: 102 ]]
								return p7 + 1
							end)
						end
					end)
					
					return
				end
				t_3[var25] = true
			end
			
			local var27 = t_1[var25]
			
			if var27 then
				var27:catch(var25)
				
				return function() --[[ line: 111 ]]
					-- upvalues: var26 (write)
					var26 = true
				end
			end
			local isFriends = var21 == "friends"
			local var29 = appChatNetworkingModule.http.RecordModalSequenceResponse(nil, {
				actionType = "record_has_seen",
				modalSequence = "conversation_inline_top_modal",
				modalVariant = "OsaContextCard",
				conversationId = if isFriends then nil else conversationId,
				friendId = if isFriends then p4.userId else nil
			})
			t_2[var25] = (t_2[var25] or 0) + 1
			t_1[var25] = var29
			var29:andThen(function() --[[ line: 127 ]]
				-- upvalues: t_1 (copy), var25 (ref), t_2 (copy), t (copy), markAcknowledged (copy), conversationId (ref), isFriends (ref), fetchConversationDetailsToSignalsModule (copy), name (copy)
				t_1[var25] = nil
				t_2[var25] = nil
				t[var25] = true
				markAcknowledged(conversationId)
				
				if not isFriends then
					fetchConversationDetailsToSignalsModule(conversationId):andThen(function() --[[ line: 134 ]]
						-- upvalues: markAcknowledged (copy), conversationId (copy)
						markAcknowledged(conversationId)
					end):catch(function(p9) --[[ line: 137 ]]
						-- upvalues: name (copy)
						name:warning(`Failed to refresh conversation after Friends Chat OSA acknowledgement: {tostring(p9)}`)
					end)
				end
			end):catch(function(p8) --[[ line: 146 ]]
				-- upvalues: t_1 (copy), var25 (ref), name (copy), var25 (ref)
				t_1[var25] = nil
				name:error(`Failed to record Friends Chat OSA acknowledgement: {tostring(p8)}`)
				var25(p8)
			end)
			
			return function() --[[ line: 151 ]]
				-- upvalues: var26 (write)
				var26 = true
			end
		end, {
			p4.conversationId, p4.userId, var20, var22, var21, var23
		})
	end,
	hasSubmitted = hasSubmitted
}