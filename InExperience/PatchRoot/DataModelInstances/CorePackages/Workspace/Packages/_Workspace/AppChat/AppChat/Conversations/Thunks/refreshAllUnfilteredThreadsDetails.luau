local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local promiseModule = require(parent.Promise)
local getDeepValueModule = require(appChat.Utils.getDeepValue)
local multiGetConversationDetailsModule = require(appChat.Conversations.Thunks.multiGetConversationDetails)
local name = require(appChat.Logger):new(script.Name)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local refreshConversationUnfilteredThreadsDetailsModule = require(script.Parent.refreshConversationUnfilteredThreadsDetails)
local fFlagAppChatEnableDoubleOptIn = require(parent.SharedFlags).FFlagAppChatEnableDoubleOptIn
local fIntUnfilteredThreadsPvDelayMsModule = require(appChat.Flags.FIntUnfilteredThreadsPvDelayMs)

return function(p1, p2)
	-- upvalues: getDeepValueModule (ref), cryoModule (ref), promiseModule (ref), fIntUnfilteredThreadsPvDelayMsModule (ref), multiGetConversationDetailsModule (ref), name (ref), appChatNetworkingModule (ref), fFlagAppChatEnableDoubleOptIn (ref), refreshConversationUnfilteredThreadsDetailsModule (ref)
	return function(p3)
		-- upvalues: getDeepValueModule (copy), cryoModule (copy), promiseModule (copy), fIntUnfilteredThreadsPvDelayMsModule (copy), multiGetConversationDetailsModule (copy), name (copy), appChatNetworkingModule (copy), p2 (ref), p1 (ref), fFlagAppChatEnableDoubleOptIn (copy), refreshConversationUnfilteredThreadsDetailsModule (copy)
		local var1 = cryoModule.List.filterMap(cryoModule.Dictionary.values(getDeepValueModule(p3:getState(), "ChatAppReducer.Conversations") or {}), function(p4)
			return if p4 and p4.id and p4.source ~= "friends" then p4.id else nil
		end)
		
		return promiseModule.delay(fIntUnfilteredThreadsPvDelayMsModule / 1000):andThen(function()
			-- upvalues: var1 (ref), p3 (ref), multiGetConversationDetailsModule (copy), name (copy), appChatNetworkingModule (copy), p2 (copy), p1 (copy), fFlagAppChatEnableDoubleOptIn (copy), refreshConversationUnfilteredThreadsDetailsModule (copy)
			if var1 then
				p3:dispatch(multiGetConversationDetailsModule(var1)):catch(function(p4)
					-- upvalues: name (copy)
					name:warning("Error in multiGetConversationDetails thunk. Error: {}", tostring(p4))
				end)
			end
			p3:dispatch(appChatNetworkingModule.rodux.GetChatLandingModal.API(p2)):catch(function(p4)
				-- upvalues: name (copy)
				name:warning("Error in GetChatLandingModal request. Error: {}", tostring(p4))
			end)
			
			if p1 then
				if fFlagAppChatEnableDoubleOptIn then
					p3:dispatch(refreshConversationUnfilteredThreadsDetailsModule(p1, p2))
					
					return
				end
				p3:dispatch(appChatNetworkingModule.rodux.GetConversationTopModal.API(p1, p2)):catch(function(p4)
					-- upvalues: name (copy)
					name:warning("Error in refreshAllUnfilteredThreadsDetails->GetConversationTopModal. Error: {}", tostring(p4))
				end)
			end
		end)
	end
end