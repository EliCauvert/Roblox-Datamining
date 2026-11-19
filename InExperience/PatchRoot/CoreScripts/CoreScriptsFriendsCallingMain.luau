local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ReactRobloxModule = require(CorePackages.Packages.ReactRoblox)
local CallPipModule = require(CorePackages.Workspace.Packages.FriendsCalling.CallPip)
local CallPipDisplayOrderModule = require(CorePackages.Workspace.Packages.FriendsCalling.CallPipDisplayOrder)
local FFlagFriendsCallingCallPipModule = require(CorePackages.Workspace.Packages.FriendsCalling.FFlagFriendsCallingCallPip)
local FriendsCallingExternalContextModule = require(CorePackages.Workspace.Packages.FriendsCalling.FriendsCallingExternalContext)
local VoiceCallReceivedEventReceiverModule = require(CorePackages.Workspace.Packages.FriendsCalling.VoiceCallReceivedEventReceiver)
local FriendsCalling = Instance.new("Folder")
FriendsCalling.Name = "FriendsCalling"
FriendsCalling.Parent = CoreGui
local Host = {
	isInExperience = true,
	followsAppColorMode = false,
	displayOrder = CallPipDisplayOrderModule.InExperience
}
local Element = nil

if FFlagFriendsCallingCallPipModule then
	local Default = require(CoreGui:WaitForChild("RobloxGui").Modules.VoiceChat.VoiceChatServiceManager).default
	Element = ReactModule.createElement(function()
		-- upvalues: ReactModule (copy), Default (copy), FriendsCallingExternalContextModule (copy), CallPipModule (copy), Host (copy)
		local UseResult = ReactModule.useCallback(function(p1)
			-- upvalues: Default (upval)
			local FriendsCallingUnmute = if p1 then "FriendsCallingUnmute" else nil
			local MicManager = Default:GetMicManager()
			
			if not MicManager or MicManager:HasConsumer("voice_chat") or MicManager:GetConsumerCount() <= 0 then
				if Default.service ~= nil and Default.localMuted == false then
					Default:ToggleMic(FriendsCallingUnmute)
				end
				if MicManager and MicManager.localMuted ~= nil and MicManager:GetConsumerCount() > 1 then
					MicManager:SetMicActiveForAllConsumers(false)
				end
				return
			elseif MicManager.localMuted == false then
				MicManager:SetMicActiveForAllConsumers(false, FriendsCallingUnmute)
			end
		end, {})
		
		return ReactModule.createElement(FriendsCallingExternalContextModule.Context.Provider, {
			value = ReactModule.useMemo(function()
				-- upvalues: UseResult (copy)
				return { tryMuteExperienceVoice = UseResult }
			end, { UseResult })
		}, {
			CallPip = ReactModule.createElement(CallPipModule, { host = Host })
		})
	end)
end
ReactRobloxModule.createRoot(FriendsCalling):render(ReactModule.createElement(ReactModule.Fragment, nil, {
	CallPip = Element,
	VoiceCallReceivedEventReceiver = ReactModule.createElement(VoiceCallReceivedEventReceiverModule)
}))