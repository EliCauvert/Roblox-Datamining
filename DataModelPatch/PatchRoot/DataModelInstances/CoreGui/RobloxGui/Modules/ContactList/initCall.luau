local HttpService = game:GetService("HttpService")
local FaceAnimatorService = game:GetService("FaceAnimatorService")
local Players = game:GetService("Players")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local Default = require(game:GetService("CoreGui").RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local _ = require(game:GetService("CorePackages").Workspace.Packages.CallProtocol)
local DependenciesModule = require(script.Parent.dependencies)
local RoduxCall = DependenciesModule.RoduxCall
local CallAction = RoduxCall.Enums.CallAction
local TeleportToRootPlaceFunction = DependenciesModule.teleportToRootPlace
local EnableIrisRerouteToRCCEngineFeature = game:GetEngineFeature("EnableIrisRerouteToRCC")
local ListenToHandleMicAndCamChangedResult = nil
local ListenToHandleTeleportingCallResult = nil
local ListenToHandleTransferCallTeleportJoinResult = nil
local ListenToHandleTransferCallTeleportLeaveResult = nil
local ListenToHandleInitCallResult = nil
local ListenToHandleActiveCallResult = nil
local ListenToHandleEndCallResult = nil

return function(p1)
	-- upvalues: RobloxReplicatedStorage (copy), RoduxCall (copy), Players (copy), FaceAnimatorService (copy), Default (copy), ListenToHandleMicAndCamChangedResult (ref), ListenToHandleTeleportingCallResult (ref), ListenToHandleTransferCallTeleportJoinResult (ref), ListenToHandleTransferCallTeleportLeaveResult (ref), EnableIrisRerouteToRCCEngineFeature (copy), ListenToHandleInitCallResult (ref), HttpService (copy), ListenToHandleActiveCallResult (ref), ListenToHandleEndCallResult (ref), CallAction (copy), TeleportToRootPlaceFunction (copy)
	local function _(p2)
		-- upvalues: RobloxReplicatedStorage (upval)
		coroutine.wrap(function()
			-- upvalues: RobloxReplicatedStorage (upval), p2 (copy)
			RobloxReplicatedStorage:WaitForChild("UpdateCurrentCall", 1e999):FireServer(p2)
		end)()
	end
	
	p1:getCallState():andThen(function(Result)
		-- upvalues: RoduxCall (upval), Players (upval), p1 (copy)
		if Result.status == RoduxCall.Enums.Status.Teleporting and Players.LocalPlayer and Result.callerId == Players.LocalPlayer.UserId and Result.callId then
			if Result.instanceId == game.JobId then
				p1:teleportSuccessCall(Result.callId)
				
				return
			else
				p1:finishCall(Result.callId)
				
				return
			end
		elseif Result.status == RoduxCall.Enums.Status.Accepting and Players.LocalPlayer and Result.calleeId == Players.LocalPlayer.UserId and Result.callId then
			if Result.instanceId == game.JobId then
				p1:answerSuccessCall(Result.callId)
				
				return
			end
			p1:rejectCall(Result.callId)
		end
	end)
	FaceAnimatorService:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(function()
		-- upvalues: p1 (copy), FaceAnimatorService (upval)
		p1:updateMicAndCamState(nil, FaceAnimatorService.VideoAnimationEnabled)
	end)
	Default.muteChanged.Event:Connect(function(p2)
		-- upvalues: Default (upval), p1 (copy)
		local Service = Default:getService()
		
		if Service and Service.VoiceChatState ~= Enum.VoiceChatState.Leaving and Service.VoiceChatState ~= Enum.VoiceChatState.Ended then
			p1:updateMicAndCamState(p2, nil)
		end
	end)
	ListenToHandleMicAndCamChangedResult = p1:listenToHandleMicAndCamChanged(function(p2)
		-- upvalues: Default (upval), FaceAnimatorService (upval)
		local Service = Default:getService()
		
		if Service and Service.VoiceChatState == Enum.VoiceChatState.Joined and Default.localMuted ~= nil and p2.muted ~= nil and p2.muted ~= Default.localMuted then
			Default:ToggleMic("CallAPI")
		end
		if FaceAnimatorService:IsStarted() and FaceAnimatorService.VideoAnimationEnabled ~= p2.camEnabled and p2.camEnabled ~= nil then
			FaceAnimatorService.VideoAnimationEnabled = p2.camEnabled
		end
	end)
	ListenToHandleTeleportingCallResult = p1:listenToHandleTeleportingCall(function(p2)
		-- upvalues: RoduxCall (upval), Players (upval), p1 (copy), RobloxReplicatedStorage (upval)
		if p2.status == RoduxCall.Enums.Status.Teleporting and Players.LocalPlayer and p2.callId and p2.callerId == Players.LocalPlayer.UserId then
			coroutine.wrap(function()
				-- upvalues: p2 (copy), p1 (upval), RobloxReplicatedStorage (upval)
				if p2.instanceId == game.JobId then
					p1:teleportSuccessCall(p2.callId)
					
					return
				else
					RobloxReplicatedStorage:WaitForChild("ContactListIrisInviteTeleport", 1e999):FireServer(p2.placeId, p2.instanceId, p2.reservedServerAccessCode, p2.callId)
				end
			end)()
		end
	end)
	ListenToHandleTransferCallTeleportJoinResult = p1:listenToHandleTransferCallTeleportJoin(function(p2)
		-- upvalues: RobloxReplicatedStorage (upval)
		local config = {
			callId = p2.callId,
			participants = { tostring(p2.callerId), (tostring(p2.calleeId)) }
		}
		coroutine.wrap(function()
			-- upvalues: RobloxReplicatedStorage (upval), config (copy)
			RobloxReplicatedStorage:WaitForChild("UpdateCurrentCall", 1e999):FireServer(config)
		end)()
	end)
	ListenToHandleTransferCallTeleportLeaveResult = p1:listenToHandleTransferCallTeleportLeave(function(_)
		-- upvalues: RobloxReplicatedStorage (upval)
		local v1 = nil
		coroutine.wrap(function()
			-- upvalues: RobloxReplicatedStorage (upval), v1 (copy)
			RobloxReplicatedStorage:WaitForChild("UpdateCurrentCall", 1e999):FireServer(v1)
		end)()
	end)
	
	if EnableIrisRerouteToRCCEngineFeature then
		ListenToHandleInitCallResult = p1:listenToHandleInitCall(function(p2)
			-- upvalues: RobloxReplicatedStorage (upval), HttpService (upval)
			coroutine.wrap(function()
				-- upvalues: RobloxReplicatedStorage (upval), p2 (copy), HttpService (upval)
				RobloxReplicatedStorage:WaitForChild("ContactListInvokeIrisInvite", 1e999):FireServer(p2.tag, p2.calleeId, p2.calleeCombinedName, p2.muted, p2.camEnabled, HttpService:GetUserAgent(), 2)
			end)()
		end)
	end
	ListenToHandleActiveCallResult = p1:listenToHandleActiveCall(function(p2)
		-- upvalues: RobloxReplicatedStorage (upval)
		local config = {
			callId = p2.callId,
			participants = { tostring(p2.callerId), (tostring(p2.calleeId)) }
		}
		coroutine.wrap(function()
			-- upvalues: RobloxReplicatedStorage (upval), config (copy)
			RobloxReplicatedStorage:WaitForChild("UpdateCurrentCall", 1e999):FireServer(config)
		end)()
	end)
	ListenToHandleEndCallResult = p1:listenToHandleEndCall(function(p2)
		-- upvalues: RobloxReplicatedStorage (upval), CallAction (upval), TeleportToRootPlaceFunction (upval)
		local v1 = nil
		coroutine.wrap(function()
			-- upvalues: RobloxReplicatedStorage (upval), v1 (copy)
			RobloxReplicatedStorage:WaitForChild("UpdateCurrentCall", 1e999):FireServer(v1)
		end)()
		
		if p2.callAction == CallAction.Finish and game.JobId == p2.instanceId then
			TeleportToRootPlaceFunction()
		end
	end)
end