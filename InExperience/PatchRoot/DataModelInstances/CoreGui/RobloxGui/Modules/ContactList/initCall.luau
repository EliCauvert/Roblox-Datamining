local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local httpService = game:GetService("HttpService")
local faceAnimatorService = game:GetService("FaceAnimatorService")
local playersService = game:GetService("Players")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local default = require(coreGuiService.RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local _ = require(corePackagesService.Workspace.Packages.CallProtocol)
local dependenciesModule = require(script.Parent.dependencies)
local roduxCall = dependenciesModule.RoduxCall
local callAction = roduxCall.Enums.CallAction
local teleportToRootPlace = dependenciesModule.teleportToRootPlace
local enableIrisRerouteToRCCEngineFeature = game:GetEngineFeature("EnableIrisRerouteToRCC")
local var8 = nil
local var9 = nil
local var10 = nil
local var11 = nil
local var12 = nil
local var13 = nil
local var14 = nil

return function(p0) --[[ line: 26 ]]
	-- upvalues: robloxReplicatedStorageService (ref), roduxCall (ref), playersService (ref), faceAnimatorService (ref), default (ref), var8 (write), var9 (write), var10 (write), var11 (write), enableIrisRerouteToRCCEngineFeature (ref), var12 (write), httpService (ref), var13 (write), var14 (write), callAction (ref), teleportToRootPlace (ref)
	local _ = function(p1) --[[ line: 27 ]]
		-- upvalues: robloxReplicatedStorageService (copy)
		coroutine.wrap(function() --[[ line: 28 ]]
			-- upvalues: robloxReplicatedStorageService (copy), p1 (ref)
			robloxReplicatedStorageService:WaitForChild("UpdateCurrentCall", 1e999):FireServer(p1)
		end)()
	end
	
	p0:getCallState():andThen(function(p2) --[[ line: 40 ]]
		-- upvalues: roduxCall (copy), playersService (copy), p0 (ref)
		if p2.status == roduxCall.Enums.Status.Teleporting and playersService.LocalPlayer and (p2.callerId == playersService.LocalPlayer.UserId and p2.callId) then
			if p2.instanceId == game.JobId then
				p0:teleportSuccessCall(p2.callId)
				
				return
			end
			p0:finishCall(p2.callId)
			
			return
		elseif p2.status == roduxCall.Enums.Status.Accepting and playersService.LocalPlayer and (p2.calleeId == playersService.LocalPlayer.UserId and p2.callId) then
			if p2.instanceId == game.JobId then
				p0:answerSuccessCall(p2.callId)
				
				return
			end
			p0:rejectCall(p2.callId)
		end
	end)
	faceAnimatorService:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(function() --[[ line: 69 ]]
		-- upvalues: p0 (ref), faceAnimatorService (copy)
		p0:updateMicAndCamState(nil, faceAnimatorService.VideoAnimationEnabled)
	end)
	default.muteChanged.Event:Connect(function(p3) --[[ line: 74 ]]
		-- upvalues: default (copy), p0 (ref)
		local service = default:getService()
		
		if service and service.VoiceChatState ~= Enum.VoiceChatState.Leaving and service.VoiceChatState ~= Enum.VoiceChatState.Ended then
			p0:updateMicAndCamState(p3, nil)
		end
	end)
	var8 = p0:listenToHandleMicAndCamChanged(function(p4) --[[ line: 87 ]]
		-- upvalues: default (copy), faceAnimatorService (copy)
		local service = default:getService()
		
		if service and service.VoiceChatState == Enum.VoiceChatState.Joined and (default.localMuted ~= nil and p4.muted ~= nil) and p4.muted ~= default.localMuted then
			default:ToggleMic("CallAPI")
		end
		if faceAnimatorService:IsStarted() and faceAnimatorService.VideoAnimationEnabled ~= p4.camEnabled and p4.camEnabled ~= nil then
			faceAnimatorService.VideoAnimationEnabled = p4.camEnabled
		end
	end)
	var9 = p0:listenToHandleTeleportingCall(function(p5) --[[ line: 111 ]]
		-- upvalues: roduxCall (copy), playersService (copy), p0 (ref), robloxReplicatedStorageService (copy)
		if p5.status == roduxCall.Enums.Status.Teleporting and playersService.LocalPlayer and (p5.callId and p5.callerId == playersService.LocalPlayer.UserId) then
			coroutine.wrap(function() --[[ line: 118 ]]
				-- upvalues: p5 (ref), p0 (copy), robloxReplicatedStorageService (copy)
				if p5.instanceId == game.JobId then
					p0:teleportSuccessCall(p5.callId)
					
					return
				end
				robloxReplicatedStorageService:WaitForChild("ContactListIrisInviteTeleport", 1e999):FireServer(p5.placeId, p5.instanceId, p5.reservedServerAccessCode, p5.callId)
			end)()
		end
	end)
	var10 = p0:listenToHandleTransferCallTeleportJoin(function(p6) --[[ line: 138 ]]
		-- upvalues: robloxReplicatedStorageService (copy)
		local t = {
			callId = p6.callId,
			participants = { tostring(p6.callerId), tostring(p6.calleeId) }
		}
		coroutine.wrap(function() --[[ line: 28 ]]
			-- upvalues: robloxReplicatedStorageService (copy), t (ref)
			robloxReplicatedStorageService:WaitForChild("UpdateCurrentCall", 1e999):FireServer(t)
		end)()
	end)
	var11 = p0:listenToHandleTransferCallTeleportLeave(function(_) --[[ line: 145 ]]
		-- upvalues: robloxReplicatedStorageService (copy)
		local var18 = nil
		coroutine.wrap(function() --[[ line: 28 ]]
			-- upvalues: robloxReplicatedStorageService (copy), var18 (ref)
			robloxReplicatedStorageService:WaitForChild("UpdateCurrentCall", 1e999):FireServer(var18)
		end)()
	end)
	
	if enableIrisRerouteToRCCEngineFeature then
		var12 = p0:listenToHandleInitCall(function(p7) --[[ line: 152 ]]
			-- upvalues: robloxReplicatedStorageService (copy), httpService (copy)
			coroutine.wrap(function() --[[ line: 153 ]]
				-- upvalues: robloxReplicatedStorageService (copy), p7 (ref), httpService (copy)
				robloxReplicatedStorageService:WaitForChild("ContactListInvokeIrisInvite", 1e999):FireServer(p7.tag, p7.calleeId, p7.calleeCombinedName, p7.muted, p7.camEnabled, httpService:GetUserAgent(), 2)
			end)()
		end)
	end
	var13 = p0:listenToHandleActiveCall(function(p8) --[[ line: 169 ]]
		-- upvalues: robloxReplicatedStorageService (copy)
		local t = {
			callId = p8.callId,
			participants = { tostring(p8.callerId), tostring(p8.calleeId) }
		}
		coroutine.wrap(function() --[[ line: 28 ]]
			-- upvalues: robloxReplicatedStorageService (copy), t (ref)
			robloxReplicatedStorageService:WaitForChild("UpdateCurrentCall", 1e999):FireServer(t)
		end)()
	end)
	var14 = p0:listenToHandleEndCall(function(p9) --[[ line: 176 ]]
		-- upvalues: robloxReplicatedStorageService (copy), callAction (copy), teleportToRootPlace (copy)
		local var20 = nil
		coroutine.wrap(function() --[[ line: 28 ]]
			-- upvalues: robloxReplicatedStorageService (copy), var20 (ref)
			robloxReplicatedStorageService:WaitForChild("UpdateCurrentCall", 1e999):FireServer(var20)
		end)()
		
		if p9.callAction == callAction.Finish and game.JobId == p9.instanceId then
			teleportToRootPlace()
		end
	end)
end