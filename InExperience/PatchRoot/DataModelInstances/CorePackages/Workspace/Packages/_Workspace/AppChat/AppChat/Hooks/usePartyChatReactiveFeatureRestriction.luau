local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local abuseVectorModule = require(parent.UniversalFeatureRestrictions.AbuseVector)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local partyChatTimeoutReceivedSignal = require(parent.InterventionShared).Signals.partyChatTimeoutReceivedSignal
local reactModule = require(parent.React)
local showFeatureRestrictionModule = require(parent.UniversalFeatureRestrictions.showFeatureRestriction)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local chatModerationStatusRefreshCoordinatorModule = require(appChat.Stores.ChatModerationStatusRefreshCoordinator)
local getResponseBodyModule = require(appChat.Stores.Ingestion.getResponseBody)
local serializeChatTimeoutRangeModule = require(appChat.Utils.serializeChatTimeoutRange)
local fFlagAppChatReactiveFeatureRestrictions = require(parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions
local name = require(appChat.Logger):new(script.Name)

return function(p1)
	-- upvalues: useDispatch (ref), reactModule (ref), fFlagAppChatReactiveFeatureRestrictions (ref), chatModerationStatusRefreshCoordinatorModule (ref), appChatNetworkingModule (ref), getResponseBodyModule (ref), serializeChatTimeoutRangeModule (ref), showFeatureRestrictionModule (ref), abuseVectorModule (ref), partyChatTimeoutReceivedSignal (ref), name (ref)
	local var1 = useDispatch()
	reactModule.useEffect(function()
		-- upvalues: fFlagAppChatReactiveFeatureRestrictions (copy), p1 (ref), chatModerationStatusRefreshCoordinatorModule (copy), var1 (ref), appChatNetworkingModule (copy), getResponseBodyModule (copy), serializeChatTimeoutRangeModule (copy), showFeatureRestrictionModule (copy), abuseVectorModule (copy), partyChatTimeoutReceivedSignal (copy), name (copy)
		if fFlagAppChatReactiveFeatureRestrictions and p1 then
			local var2 = false
			local var3 = chatModerationStatusRefreshCoordinatorModule.createOwner()
			local var4 = chatModerationStatusRefreshCoordinatorModule.enqueue(var3, function()
				-- upvalues: var1 (copy), appChatNetworkingModule (copy)
				return var1(appChatNetworkingModule.rodux.GetChatModerationStatuses.API())
			end)
			var4.promise:andThen(function(p2)
				-- upvalues: getResponseBodyModule (copy), serializeChatTimeoutRangeModule (copy), var2 (write), chatModerationStatusRefreshCoordinatorModule (copy), var4 (ref), showFeatureRestrictionModule (copy), abuseVectorModule (copy), partyChatTimeoutReceivedSignal (copy)
				local var5 = getResponseBodyModule(p2)
				local var6 = if var5 then var5.user_timeout_range else nil
				local var7 = if var6 then serializeChatTimeoutRangeModule(var6) else nil
				
				if not var2 and chatModerationStatusRefreshCoordinatorModule.isLatestGeneration(var4.generation) and (var7 ~= nil and var7.requiresAcknowledgement == true) then
					showFeatureRestrictionModule(abuseVectorModule.PartyChat, {
						onAcknowledgementSuccess = function()
							-- upvalues: partyChatTimeoutReceivedSignal (copy)
							partyChatTimeoutReceivedSignal:fire(nil)
						end
					})
				end
			end):catch(function()
				-- upvalues: name (copy)
				name:warning("Failed to refresh Party Chat moderation status on entry")
			end)
			
			return function()
				-- upvalues: var2 (write), chatModerationStatusRefreshCoordinatorModule (copy), var3 (ref)
				var2 = true
				chatModerationStatusRefreshCoordinatorModule.cancelOwner(var3)
			end
		end
		return nil
	end, { var1, p1 })
end