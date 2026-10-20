local RunService = game:GetService("RunService")
local Parent = script.Parent.Parent
local Network = Parent.Network
local AppChatNetworkingModule = require(game:GetService("CorePackages").Workspace.Packages.AppChatNetworking)
local GetPlaceInfosModule = require(Network.Requests.GetPlaceInfos)
local ConstructGameLinkUrlModule = require(Parent.Utility.constructGameLinkUrl)
local v1 = require(Network.httpRequest)((game:GetService("HttpRbxApiService")))
local InviteStatus = require(Parent.Resources.Constants).InviteStatus
local ReceivedUserInviteStatusModule = require(Parent.Actions.ReceivedUserInviteStatus)

return function(p1, p2)
	-- upvalues: InviteStatus (copy), ReceivedUserInviteStatusModule (copy), RunService (copy), GetPlaceInfosModule (copy), v1 (copy), ConstructGameLinkUrlModule (copy), AppChatNetworkingModule (copy)
	return function(p3)
		-- upvalues: p1 (copy), InviteStatus (upval), ReceivedUserInviteStatusModule (upval), RunService (upval), GetPlaceInfosModule (upval), v1 (upval), p2 (copy), ConstructGameLinkUrlModule (upval), AppChatNetworkingModule (upval)
		if p3:getState().invites[tostring(p1)] == InviteStatus.Pending then return end
		p3:dispatch(ReceivedUserInviteStatusModule(p1, InviteStatus.Pending))
		
		if RunService:IsStudio() then
			spawn(function()
				-- upvalues: p3 (copy), ReceivedUserInviteStatusModule (upval), p1 (upval), InviteStatus (upval)
				p3:dispatch(ReceivedUserInviteStatusModule(p1, InviteStatus.Failed))
			end)
			
			return
		else
			return GetPlaceInfosModule(v1, { p2 }):andThen(function(Result)
				local ResponseBodyEntry = Result.responseBody[1]
				assert(ResponseBodyEntry, "Error fetching placeInfos")
				ResponseBodyEntry.placeId = tostring(ResponseBodyEntry.placeId)
				ResponseBodyEntry.universeId = tostring(ResponseBodyEntry.universeId)
				
				return ResponseBodyEntry
			end):andThen(function(Result)
				-- upvalues: ConstructGameLinkUrlModule (upval), AppChatNetworkingModule (upval), p1 (upval)
				local Formatted = string.format("Come join me in %s", Result.name)
				assert(Result.universeRootPlaceId, "Failed to get universe root place id")
				local Text = Formatted .. "\n" .. ConstructGameLinkUrlModule(Result.universeRootPlaceId)
				
				return AppChatNetworkingModule.http.CreateConversation(nil, "one_to_one", { p1 }):andThen(function(Result1)
					-- upvalues: AppChatNetworkingModule (upval), Text (ref), Result (copy)
					local Conversation = Result1.responseBody.conversations[1]
					assert(Conversation, "Failed to create conversation")
					
					return AppChatNetworkingModule.http.SendChatTextMessage(nil, Conversation.id, Text):andThen(function(Result1)
						-- upvalues: Conversation (copy), Result (upval)
						local Message = Result1.responseBody.messages[1]
						assert(Message, "Failed to send message")
						
						return {
							resultType = if Message.status == "success" then "Success" else "Failed",
							conversationId = Conversation.id,
							placeId = Result.universeRootPlaceId
						}
					end)
				end):catch(function(Err)
					warn("Failed to send invite: " .. tostring(Err))
				end)
			end):andThen(function(Result)
				-- upvalues: InviteStatus (upval), p3 (copy), ReceivedUserInviteStatusModule (upval), p1 (upval)
				local v2, v3 = Result:await()
				assert(v2, "Failed to unroll promise after friend invitation: " .. tostring(v3))
				p3:dispatch(ReceivedUserInviteStatusModule(p1, InviteStatus[v3.resultType] or InviteStatus.Failed))
				
				return v3
			end, function(_)
				-- upvalues: p3 (copy), ReceivedUserInviteStatusModule (upval), p1 (upval), InviteStatus (upval)
				p3:dispatch(ReceivedUserInviteStatusModule(p1, InviteStatus.Failed))
			end)
		end
	end
end