local httpRbxApiService = game:GetService("HttpRbxApiService")
local runService = game:GetService("RunService")
local corePackagesService = game:GetService("CorePackages")
local parent = script.Parent.Parent
local network = parent.Network
local appChatNetworkingModule = require(corePackagesService.Workspace.Packages.AppChatNetworking)
local httpRequestModule = require(network.httpRequest)
local getPlaceInfosModule = require(network.Requests.GetPlaceInfos)
local constructGameLinkUrlModule = require(parent.Utility.constructGameLinkUrl)
local var1 = httpRequestModule(httpRbxApiService)
local inviteStatus = require(parent.Resources.Constants).InviteStatus
local receivedUserInviteStatusModule = require(parent.Actions.ReceivedUserInviteStatus)

return function(p1, p2)
	-- upvalues: inviteStatus (ref), receivedUserInviteStatusModule (ref), runService (ref), getPlaceInfosModule (ref), var1 (ref), constructGameLinkUrlModule (ref), appChatNetworkingModule (ref)
	return function(p3)
		-- upvalues: p1 (ref), inviteStatus (copy), receivedUserInviteStatusModule (copy), runService (copy), getPlaceInfosModule (copy), var1 (copy), p2 (ref), constructGameLinkUrlModule (copy), appChatNetworkingModule (copy)
		if p3:getState().invites[tostring(p1)] == inviteStatus.Pending then return end
		p3:dispatch(receivedUserInviteStatusModule(p1, inviteStatus.Pending))
		
		if runService:IsStudio() then
			spawn(function()
				-- upvalues: p3 (ref), receivedUserInviteStatusModule (copy), p1 (copy), inviteStatus (copy)
				p3:dispatch(receivedUserInviteStatusModule(p1, inviteStatus.Failed))
			end)
			
			return
		end
		return getPlaceInfosModule(var1, { p2 }):andThen(function(p4)
			local var2 = p4.responseBody[1]
			assert(var2, "Error fetching placeInfos")
			var2.placeId = tostring(var2.placeId)
			var2.universeId = tostring(var2.universeId)
			
			return var2
		end):andThen(function(p4)
			-- upvalues: constructGameLinkUrlModule (copy), appChatNetworkingModule (copy), p1 (copy)
			local formattedText = string.format("Come join me in %s", p4.name)
			assert(p4.universeRootPlaceId, "Failed to get universe root place id")
			formattedText ..= "\n" .. constructGameLinkUrlModule(p4.universeRootPlaceId)
			
			return appChatNetworkingModule.http.CreateConversation(nil, "one_to_one", { p1 }):andThen(function(p5)
				-- upvalues: appChatNetworkingModule (copy), formattedText (write), p4 (ref)
				local var2 = p5.responseBody.conversations[1]
				assert(var2, "Failed to create conversation")
				
				return appChatNetworkingModule.http.SendChatTextMessage(nil, var2.id, formattedText):andThen(function(p6)
					-- upvalues: var2 (ref), p4 (copy)
					local var3 = p6.responseBody.messages[1]
					assert(var3, "Failed to send message")
					
					return {
						resultType = if var3.status == "success" then "Success" else "Failed",
						conversationId = var2.id,
						placeId = p4.universeRootPlaceId
					}
				end)
			end):catch(function(p5)
				warn("Failed to send invite: " .. tostring(p5))
			end)
		end):andThen(function(p4)
			-- upvalues: inviteStatus (copy), p3 (ref), receivedUserInviteStatusModule (copy), p1 (copy)
			local var2, var3 = p4:await()
			assert(var2, "Failed to unroll promise after friend invitation: " .. tostring(var3))
			p3:dispatch(receivedUserInviteStatusModule(p1, inviteStatus[var3.resultType] or inviteStatus.Failed))
			
			return var3
		end, function(_)
			-- upvalues: p3 (ref), receivedUserInviteStatusModule (copy), p1 (copy), inviteStatus (copy)
			p3:dispatch(receivedUserInviteStatusModule(p1, inviteStatus.Failed))
		end)
	end
end