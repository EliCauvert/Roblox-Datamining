local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local ConversationChannelsModule = require(AppChat.Models.ConversationChannels)
local GetConversationStoreModule = require(AppChat.Stores.GetConversationStore)
local FetchConversationDetailsToSignalsModule = require(AppChat.Stores.Networking.fetchConversationDetailsToSignals)
local ConversationRoduxSeedModule = require(AppChat.Utils.ConversationRoduxSeed)
local LoggerModule = require(AppChat.Logger)
local FFlagFriendsCallingClientGateDEV = require(Parent.SharedFlags).FFlagFriendsCallingClientGate_DEV

return function(Id)
	-- upvalues: FFlagFriendsCallingClientGateDEV (copy), ReactModule (copy), SignalsModule (copy), GetConversationStoreModule (copy), ConversationChannelsModule (copy), ConversationRoduxSeedModule (copy), SignalsReactModule (copy), FetchConversationDetailsToSignalsModule (copy), LoggerModule (copy)
	if FFlagFriendsCallingClientGateDEV then
		local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), Id (copy), GetConversationStoreModule (upval), ConversationChannelsModule (upval)
			return SignalsModule.createComputed(function(p1): boolean
				-- upvalues: Id (upval), GetConversationStoreModule (upval), ConversationChannelsModule (upval)
				if Id == nil then
					return false
				else
					local Conversation = GetConversationStoreModule(false).getConversation(Id, p1)
					local Conversation1 = if Conversation == nil or Conversation.id ~= Id then nil else Conversation
					
					return Conversation1 ~= nil and Conversation1.callButtonEligibility == ConversationChannelsModule.CallButtonEligibility.Eligible
				end
			end)
		end, { Id or false })))
		local UseSignalStateResult1 = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), Id (copy), GetConversationStoreModule (upval), ConversationRoduxSeedModule (upval)
			return SignalsModule.createComputed(function(p1): boolean
				-- upvalues: Id (upval), GetConversationStoreModule (upval), ConversationRoduxSeedModule (upval)
				if Id == nil then
					return false
				else
					local Conversation = GetConversationStoreModule(false).getConversation(Id, p1)
					local Conversation1 = if Conversation == nil or Conversation.id ~= Id then nil else Conversation
					
					return not ConversationRoduxSeedModule.isFriendsPlaceholderConversation(Id, Conversation1) and (not Conversation1 or Conversation1.callButtonEligibility == nil)
				end
			end)
		end, { Id or false })))
		ReactModule.useEffect(function()
			-- upvalues: UseSignalStateResult1 (copy), Id (copy), FetchConversationDetailsToSignalsModule (upval), LoggerModule (upval)
			if UseSignalStateResult1 and Id then
				FetchConversationDetailsToSignalsModule(Id):catch(function(Err)
					-- upvalues: LoggerModule (upval), Id (upval)
					LoggerModule:warning(`Failed to fetch call button eligibility for {Id}: {tostring(Err)}`)
				end)
			end
		end, { Id or false, UseSignalStateResult1 })
		
		return UseSignalStateResult
	else
		return false
	end
end