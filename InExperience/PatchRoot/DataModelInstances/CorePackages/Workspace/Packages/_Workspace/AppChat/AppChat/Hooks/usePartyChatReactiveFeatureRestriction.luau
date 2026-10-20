local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AbuseVectorModule = require(Parent.UniversalFeatureRestrictions.AbuseVector)
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local PartyChatTimeoutReceivedSignal = require(Parent.InterventionShared).Signals.partyChatTimeoutReceivedSignal
local ReactModule = require(Parent.React)
local ShowFeatureRestrictionModule = require(Parent.UniversalFeatureRestrictions.showFeatureRestriction)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local ChatModerationStatusRefreshCoordinatorModule = require(AppChat.Stores.ChatModerationStatusRefreshCoordinator)
local GetResponseBodyModule = require(AppChat.Stores.Ingestion.getResponseBody)
local SerializeChatTimeoutRangeModule = require(AppChat.Utils.serializeChatTimeoutRange)
local FFlagAppChatReactiveFeatureRestrictions = require(Parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions
local NewResult = require(AppChat.Logger):new(script.Name)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), FFlagAppChatReactiveFeatureRestrictions (copy), ChatModerationStatusRefreshCoordinatorModule (copy), AppChatNetworkingModule (copy), GetResponseBodyModule (copy), SerializeChatTimeoutRangeModule (copy), ShowFeatureRestrictionModule (copy), AbuseVectorModule (copy), PartyChatTimeoutReceivedSignal (copy), NewResult (copy)
	local UseDispatchResult = UseDispatchFunction()
	ReactModule.useEffect(function()
		-- upvalues: FFlagAppChatReactiveFeatureRestrictions (upval), p1 (copy), ChatModerationStatusRefreshCoordinatorModule (upval), UseDispatchResult (copy), AppChatNetworkingModule (upval), GetResponseBodyModule (upval), SerializeChatTimeoutRangeModule (upval), ShowFeatureRestrictionModule (upval), AbuseVectorModule (upval), PartyChatTimeoutReceivedSignal (upval), NewResult (upval)
		if FFlagAppChatReactiveFeatureRestrictions and p1 then
			local Flag = false
			local Owner = ChatModerationStatusRefreshCoordinatorModule.createOwner()
			local EnqueueResult = ChatModerationStatusRefreshCoordinatorModule.enqueue(Owner, function()
				-- upvalues: UseDispatchResult (upval), AppChatNetworkingModule (upval)
				return UseDispatchResult(AppChatNetworkingModule.rodux.GetChatModerationStatuses.API())
			end)
			EnqueueResult.promise:andThen(function(Result)
				-- upvalues: GetResponseBodyModule (upval), SerializeChatTimeoutRangeModule (upval), Flag (ref), ChatModerationStatusRefreshCoordinatorModule (upval), EnqueueResult (copy), ShowFeatureRestrictionModule (upval), AbuseVectorModule (upval), PartyChatTimeoutReceivedSignal (upval)
				local ResponseBodyModule = GetResponseBodyModule(Result)
				local UserTimeoutRange = if ResponseBodyModule then ResponseBodyModule.user_timeout_range else nil
				local SerializeChatTimeoutRangeModuleResult = if UserTimeoutRange then SerializeChatTimeoutRangeModule(UserTimeoutRange) else nil
				
				if not Flag and ChatModerationStatusRefreshCoordinatorModule.isLatestGeneration(EnqueueResult.generation) and SerializeChatTimeoutRangeModuleResult ~= nil and SerializeChatTimeoutRangeModuleResult.requiresAcknowledgement == true then
					ShowFeatureRestrictionModule(AbuseVectorModule.PartyChat, {
						onAcknowledgementSuccess = function()
							-- upvalues: PartyChatTimeoutReceivedSignal (upval)
							PartyChatTimeoutReceivedSignal:fire(nil)
						end
					})
				end
			end):catch(function()
				-- upvalues: NewResult (upval)
				NewResult:warning("Failed to refresh Party Chat moderation status on entry")
			end)
			
			return function()
				-- upvalues: Flag (ref), ChatModerationStatusRefreshCoordinatorModule (upval), Owner (copy)
				Flag = true
				ChatModerationStatusRefreshCoordinatorModule.cancelOwner(Owner)
			end
		else
			return nil
		end
	end, { UseDispatchResult, p1 })
end