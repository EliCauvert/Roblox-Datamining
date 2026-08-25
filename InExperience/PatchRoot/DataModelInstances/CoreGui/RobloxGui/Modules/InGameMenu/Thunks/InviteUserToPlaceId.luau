local httpRbxApiService = game:GetService("HttpRbxApiService")
local runService = game:GetService("RunService")
local corePackagesService = game:GetService("CorePackages")
local parent = script.Parent.Parent
local network = parent.Network
local appChatNetworkingModule = require(corePackagesService.Workspace.Packages.AppChatNetworking)
local httpRequestModule = require(network.httpRequest)
local getPlaceInfosModule = require(network.Requests.GetPlaceInfos)
local constructGameLinkUrlModule = require(parent.Utility.constructGameLinkUrl)
local var7 = httpRequestModule(httpRbxApiService)
local inviteStatus = require(parent.Resources.Constants).InviteStatus
local receivedUserInviteStatusModule = require(parent.Actions.ReceivedUserInviteStatus)

return function(p0, p1)
	-- upvalues: inviteStatus (ref), receivedUserInviteStatusModule (ref), runService (ref), getPlaceInfosModule (ref), var7 (ref), constructGameLinkUrlModule (ref), appChatNetworkingModule (ref)
	return function(p2)
		-- upvalues: p0 (ref), inviteStatus (copy), receivedUserInviteStatusModule (copy), runService (copy), getPlaceInfosModule (copy), var7 (copy), p1 (ref), constructGameLinkUrlModule (copy), appChatNetworkingModule (copy)
		if p2:getState().invites[tostring(p0)] == inviteStatus.Pending then return end
		p2:dispatch(receivedUserInviteStatusModule(p0, inviteStatus.Pending))
		
		if runService:IsStudio() then
			spawn(function()
				-- upvalues: p2 (ref), receivedUserInviteStatusModule (copy), p0 (copy), inviteStatus (copy)
				p2:dispatch(receivedUserInviteStatusModule(p0, inviteStatus.Failed))
			end)
			
			return
		end
		return getPlaceInfosModule(var7, { p1 }):andThen(function(p8)
			local var14 = p8.responseBody[1]
			assert(var14, "Error fetching placeInfos")
			var14.placeId = tostring(var14.placeId)
			var14.universeId = tostring(var14.universeId)
			
			return var14
		end):andThen(function(p4)
			-- upvalues: constructGameLinkUrlModule (copy), appChatNetworkingModule (copy), p0 (copy)
			local formattedText = string.format("Come join me in %s", p4.name)
			assert(p4.universeRootPlaceId, "Failed to get universe root place id")
			formattedText ..= "\n" .. constructGameLinkUrlModule(p4.universeRootPlaceId)
			
			return appChatNetworkingModule.http.CreateConversation(nil, "one_to_one", { p0 }):andThen(function(p6)
				-- upvalues: appChatNetworkingModule (copy), formattedText (write), p4 (ref)
				local var12 = p6.responseBody.conversations[1]
				assert(var12, "Failed to create conversation")
				
				return appChatNetworkingModule.http.SendChatTextMessage(nil, var12.id, formattedText):andThen(function(p7)
					-- upvalues: var12 (ref), p4 (copy)
					local var13 = p7.responseBody.messages[1]
					assert(var13, "Failed to send message")
					
					return {
						resultType = if var13.status == "success" then "Success" else "Failed",
						conversationId = var12.id,
						placeId = p4.universeRootPlaceId
					}
				end)
			end):catch(function(p5)
				warn("Failed to send invite: " .. tostring(p5))
			end)
		end):andThen(function(p3)
			-- upvalues: inviteStatus (copy), p2 (ref), receivedUserInviteStatusModule (copy), p0 (copy)
			local var9, var10 = p3:await()
			assert(var9, "Failed to unroll promise after friend invitation: " .. tostring(var10))
			p2:dispatch(receivedUserInviteStatusModule(p0, inviteStatus[var10.resultType] or inviteStatus.Failed))
			
			return var10
		end, function(_)
			-- upvalues: p2 (ref), receivedUserInviteStatusModule (copy), p0 (copy), inviteStatus (copy)
			p2:dispatch(receivedUserInviteStatusModule(p0, inviteStatus.Failed))
		end)
	end
end