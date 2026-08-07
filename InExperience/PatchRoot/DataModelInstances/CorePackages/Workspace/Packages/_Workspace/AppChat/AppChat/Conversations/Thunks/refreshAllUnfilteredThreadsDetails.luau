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

return function(p0, p1) --[[ line: 21 ]]
	-- upvalues: getDeepValueModule (ref), cryoModule (ref), promiseModule (ref), fIntUnfilteredThreadsPvDelayMsModule (ref), multiGetConversationDetailsModule (ref), name (ref), appChatNetworkingModule (ref), fFlagAppChatEnableDoubleOptIn (ref), refreshConversationUnfilteredThreadsDetailsModule (ref)
	return function(p2) --[[ line: 22 ]]
		-- upvalues: getDeepValueModule (copy), cryoModule (copy), promiseModule (copy), fIntUnfilteredThreadsPvDelayMsModule (copy), multiGetConversationDetailsModule (copy), name (copy), appChatNetworkingModule (copy), p1 (ref), p0 (ref), fFlagAppChatEnableDoubleOptIn (copy), refreshConversationUnfilteredThreadsDetailsModule (copy)
		local var9 = cryoModule.List.filterMap(cryoModule.Dictionary.values(getDeepValueModule(p2:getState(), "ChatAppReducer.Conversations") or {}), function(p3) --[[ line: 25 ]]
			return if p3 and p3.id and p3.source ~= "friends" then p3.id else nil
		end)
		
		return promiseModule.delay(fIntUnfilteredThreadsPvDelayMsModule / 1000):andThen(function() --[[ line: 34 ]]
			-- upvalues: var9 (ref), p2 (ref), multiGetConversationDetailsModule (copy), name (copy), appChatNetworkingModule (copy), p1 (copy), p0 (copy), fFlagAppChatEnableDoubleOptIn (copy), refreshConversationUnfilteredThreadsDetailsModule (copy)
			if var9 then
				p2:dispatch(multiGetConversationDetailsModule(var9)):catch(function(p4) --[[ line: 36 ]]
					-- upvalues: name (copy)
					name:warning("Error in multiGetConversationDetails thunk. Error: {}", tostring(p4))
				end)
			end
			p2:dispatch(appChatNetworkingModule.rodux.GetChatLandingModal.API(p1)):catch(function(p5) --[[ line: 40 ]]
				-- upvalues: name (copy)
				name:warning("Error in GetChatLandingModal request. Error: {}", tostring(p5))
			end)
			
			if p0 then
				if fFlagAppChatEnableDoubleOptIn then
					p2:dispatch(refreshConversationUnfilteredThreadsDetailsModule(p0, p1))
					
					return
				end
				p2:dispatch(appChatNetworkingModule.rodux.GetConversationTopModal.API(p0, p1)):catch(function(p6) --[[ line: 53 ]]
					-- upvalues: name (copy)
					name:warning("Error in refreshAllUnfilteredThreadsDetails->GetConversationTopModal. Error: {}", tostring(p6))
				end)
			end
		end)
	end
end