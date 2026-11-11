local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local PromiseModule = require(Parent.Promise)
local GetDeepValueModule = require(AppChat.Utils.getDeepValue)
local MultiGetConversationDetailsModule = require(AppChat.Conversations.Thunks.multiGetConversationDetails)
local NewResult = require(AppChat.Logger):new(script.Name)
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local RefreshConversationUnfilteredThreadsDetailsModule = require(script.Parent.refreshConversationUnfilteredThreadsDetails)
local FFlagAppChatEnableDoubleOptIn = require(Parent.SharedFlags).FFlagAppChatEnableDoubleOptIn
local FIntUnfilteredThreadsPvDelayMsModule = require(AppChat.Flags.FIntUnfilteredThreadsPvDelayMs)

return function(p1, p2)
	-- upvalues: GetDeepValueModule (copy), CryoModule (copy), PromiseModule (copy), FIntUnfilteredThreadsPvDelayMsModule (copy), MultiGetConversationDetailsModule (copy), NewResult (copy), AppChatNetworkingModule (copy), FFlagAppChatEnableDoubleOptIn (copy), RefreshConversationUnfilteredThreadsDetailsModule (copy)
	return function(p3)
		-- upvalues: GetDeepValueModule (upval), CryoModule (upval), PromiseModule (upval), FIntUnfilteredThreadsPvDelayMsModule (upval), MultiGetConversationDetailsModule (upval), NewResult (upval), AppChatNetworkingModule (upval), p2 (copy), p1 (copy), FFlagAppChatEnableDoubleOptIn (upval), RefreshConversationUnfilteredThreadsDetailsModule (upval)
		local FilterMapResult = CryoModule.List.filterMap(CryoModule.Dictionary.values(GetDeepValueModule(p3:getState(), "ChatAppReducer.Conversations") or {}), function(p4)
			return if p4 and p4.id and p4.source ~= "friends" then p4.id else nil
		end)
		
		return PromiseModule.delay(FIntUnfilteredThreadsPvDelayMsModule / 1000):andThen(function()
			-- upvalues: FilterMapResult (copy), p3 (copy), MultiGetConversationDetailsModule (upval), NewResult (upval), AppChatNetworkingModule (upval), p2 (upval), p1 (upval), FFlagAppChatEnableDoubleOptIn (upval), RefreshConversationUnfilteredThreadsDetailsModule (upval)
			if FilterMapResult then
				p3:dispatch(MultiGetConversationDetailsModule(FilterMapResult)):catch(function(Err)
					-- upvalues: NewResult (upval)
					NewResult:warning("Error in multiGetConversationDetails thunk. Error: {}", (tostring(Err)))
				end)
			end
			p3:dispatch(AppChatNetworkingModule.rodux.GetChatLandingModal.API(p2)):catch(function(Err)
				-- upvalues: NewResult (upval)
				NewResult:warning("Error in GetChatLandingModal request. Error: {}", (tostring(Err)))
			end)
			
			if p1 then
				if FFlagAppChatEnableDoubleOptIn then
					p3:dispatch(RefreshConversationUnfilteredThreadsDetailsModule(p1, p2))
					
					return
				end
				p3:dispatch(AppChatNetworkingModule.rodux.GetConversationTopModal.API(p1, p2)):catch(function(Err)
					-- upvalues: NewResult (upval)
					NewResult:warning("Error in refreshAllUnfilteredThreadsDetails->GetConversationTopModal. Error: {}", (tostring(Err)))
				end)
			end
		end)
	end
end