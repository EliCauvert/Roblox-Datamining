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

local function _(p1)
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	
	return `{if localPlayer then localPlayer.UserId else 0}:{p1}`
end

local function hasSubmitted(p2)
	-- upvalues: t (ref), playersService (ref)
	local localPlayer = playersService.LocalPlayer
	
	return t[`{if localPlayer then localPlayer.UserId else 0}:{p2}`] == true
end

local _ = function(p3)
	if typeof(p3) ~= "table" then
		return true
	end
	local statusCode = p3.StatusCode or (p3.statusCode or p3.responseCode)
	
	return if statusCode ~= nil then if statusCode > 0 then if statusCode ~= 408 then if statusCode ~= 429 then statusCode >= 500 else true else true else true else true
end

local function markAcknowledged(p3)
	-- upvalues: getConversationStoreModule (ref), appChatNetworkingModule (ref)
	local var1 = getConversationStoreModule(false)
	local conversation = var1.getConversation(p3, false)
	
	if conversation and conversation.osaAcknowledgementStatus ~= appChatNetworkingModule.Constants.OsaAcknowledgementStatusResponse.Acknowledged then
		local cloned = table.clone(conversation)
		cloned.osaAcknowledgementStatus = appChatNetworkingModule.Constants.OsaAcknowledgementStatusResponse.Acknowledged
		var1.upsertConversation(cloned)
	end
end

return {
	useAcknowledgement = function(p3)
		-- upvalues: reactModule (ref), signalsModule (ref), getConversationStoreModule (ref), signalsReactModule (ref), appChatNetworkingModule (ref), useIsGuiInChatVisibleModule (ref), playersService (ref), t (ref), t_3 (ref), t_2 (ref), t_1 (ref), markAcknowledged (ref), fetchConversationDetailsToSignalsModule (ref), name (ref)
		local var1 = signalsReactModule.useSignalState(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), getConversationStoreModule (copy), p3 (ref)
			return signalsModule.createComputed(function(p4)
				-- upvalues: getConversationStoreModule (copy), p3 (copy)
				return getConversationStoreModule(p4).getConversation(p3.conversationId, p4)
			end)
		end, { p3.conversationId }))
		local var2 = var1 ~= nil and var1.osaAcknowledgementStatus == appChatNetworkingModule.Constants.OsaAcknowledgementStatusResponse.Unacknowledged
		local var3 = if var1 then var1.source else nil
		local var4 = useIsGuiInChatVisibleModule(p3.guiObjectRef, { p3.guiObjectRef.current })
		local var5, var6 = reactModule.useState(0)
		reactModule.useEffect(function()
			-- upvalues: p3 (ref), playersService (copy), var2 (ref), var4 (ref), t (copy), t_3 (copy), t_2 (copy), var6 (ref), t_1 (copy), var3 (ref), appChatNetworkingModule (copy), markAcknowledged (copy), fetchConversationDetailsToSignalsModule (copy), name (copy)
			local conversationId = p3.conversationId
			local localPlayer = playersService.LocalPlayer
			local var7 = `{if localPlayer then localPlayer.UserId else 0}:{conversationId}`
			
			if conversationId == "" or not var2 or (not var4 or t[var7]) or t_3[var7] then return end
			local var8 = false
			
			var7 = function(p4)
				-- upvalues: t_2 (copy), var7 (ref), t_3 (copy), var8 (write), var6 (copy)
				local var9
				local var10 = t_2[var7] or 0
				
				if typeof(p4) == "table" then
					local statusCode = p4.StatusCode or (p4.statusCode or p4.responseCode)
					var9 = if statusCode ~= nil then if statusCode > 0 then if statusCode ~= 408 then if statusCode ~= 429 then statusCode >= 500 else true else true else true else true
				else
					var9 = true
				end
				if var9 and var10 < 4 then
					task.delay(2 ^ math.max(var10 - 1, 0) * 1, function()
						-- upvalues: var8 (copy), var6 (copy)
						if not var8 then
							var6(function(p5)
								return p5 + 1
							end)
						end
					end)
					
					return
				end
				t_3[var7] = true
			end
			
			local var9 = t_1[var7]
			
			if var9 then
				var9:catch(var7)
				
				return function()
					-- upvalues: var8 (write)
					var8 = true
				end
			end
			local isFriends = var3 == "friends"
			local var10 = appChatNetworkingModule.http.RecordModalSequenceResponse(nil, {
				actionType = "record_has_seen",
				modalSequence = "conversation_inline_top_modal",
				modalVariant = "OsaContextCard",
				conversationId = if isFriends then nil else conversationId,
				friendId = if isFriends then p3.userId else nil
			})
			t_2[var7] = (t_2[var7] or 0) + 1
			t_1[var7] = var10
			var10:andThen(function()
				-- upvalues: t_1 (copy), var7 (ref), t_2 (copy), t (copy), markAcknowledged (copy), conversationId (ref), isFriends (ref), fetchConversationDetailsToSignalsModule (copy), name (copy)
				t_1[var7] = nil
				t_2[var7] = nil
				t[var7] = true
				markAcknowledged(conversationId)
				
				if not isFriends then
					fetchConversationDetailsToSignalsModule(conversationId):andThen(function()
						-- upvalues: markAcknowledged (copy), conversationId (copy)
						markAcknowledged(conversationId)
					end):catch(function(p4)
						-- upvalues: name (copy)
						name:warning(`Failed to refresh conversation after Friends Chat OSA acknowledgement: {tostring(p4)}`)
					end)
				end
			end):catch(function(p4)
				-- upvalues: t_1 (copy), var7 (ref), name (copy), var7 (ref)
				t_1[var7] = nil
				name:error(`Failed to record Friends Chat OSA acknowledgement: {tostring(p4)}`)
				var7(p4)
			end)
			
			return function()
				-- upvalues: var8 (write)
				var8 = true
			end
		end, {
			p3.conversationId, p3.userId, var2, var4, var3, var5
		})
	end,
	hasSubmitted = hasSubmitted
}