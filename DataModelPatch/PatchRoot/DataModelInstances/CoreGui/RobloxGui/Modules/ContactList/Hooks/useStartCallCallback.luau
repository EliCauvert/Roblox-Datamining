local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local FaceAnimatorService = game:GetService("FaceAnimatorService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local Default = nil
local ReactModule = require(CorePackages.Packages.React)
local Default1 = require(CorePackages.Workspace.Packages.CallProtocol).CallProtocol.default
local Sounds = require(CorePackages.Workspace.Packages.SoundManager).Sounds
local SoundGroups = require(CorePackages.Workspace.Packages.SoundManager).SoundGroups
local SoundManager = require(CorePackages.Workspace.Packages.SoundManager).SoundManager
local ContactList = RobloxGui.Modules.ContactList
local UseAnalyticsModule = require(ContactList.Analytics.useAnalytics)
local EventNamesEnumModule = require(ContactList.Analytics.EventNamesEnum)
local _ = require(ContactList.Enums.Pages)
local EnableIrisRerouteToRCCEngineFeature = game:GetEngineFeature("EnableIrisRerouteToRCC")

return function(p1, p2, p3, Callback, p4)
	-- upvalues: UseAnalyticsModule (copy), ReactModule (copy), SoundManager (copy), Sounds (copy), SoundGroups (copy), Default (ref), RobloxGui (copy), FaceAnimatorService (copy), EventNamesEnumModule (copy), EnableIrisRerouteToRCCEngineFeature (copy), Players (copy), Default1 (copy), HttpService (copy), RobloxReplicatedStorage (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	
	return ReactModule.useCallback(function()
		-- upvalues: SoundManager (upval), Sounds (upval), SoundGroups (upval), Default (upval), RobloxGui (upval), FaceAnimatorService (upval), UseAnalyticsModuleResult (copy), EventNamesEnumModule (upval), p2 (copy), p4 (copy), EnableIrisRerouteToRCCEngineFeature (upval), Players (upval), Default1 (upval), p3 (copy), HttpService (upval), p1 (copy), RobloxReplicatedStorage (upval), Callback (copy)
		SoundManager:PlaySound(Sounds.Select.Name, { Volume = 0.5 }, SoundGroups.Iris)
		
		if Default == nil then
			Default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
		end
		local NoLocalMuted = Default.localMuted == nil or Default.localMuted
		local VideoAnimationEnabled = if FaceAnimatorService:IsStarted() then FaceAnimatorService.VideoAnimationEnabled else false
		UseAnalyticsModuleResult.fireEvent(EventNamesEnumModule.PhoneBookCallFriendClicked, {
			eventTimestampMs = os.time() * 1000,
			friendUserId = tonumber(p2),
			searchQueryString = p4.searchQueryString,
			itemListIndex = p4.itemListIndex,
			isSuggestedUser = p4.isSuggestedUser,
			page = tostring(p4.page)
		})
		
		if EnableIrisRerouteToRCCEngineFeature then
			local LocalPlayer = Players.LocalPlayer
			
			if LocalPlayer then
				Default1:initCall(tonumber(LocalPlayer.UserId) or 0, tonumber(p2) or 0, LocalPlayer.DisplayName, p3, NoLocalMuted, VideoAnimationEnabled, HttpService:GenerateGUID(false), p1)
			end
		else
			coroutine.wrap(function()
				-- upvalues: RobloxReplicatedStorage (upval), p1 (upval), p2 (upval), p3 (upval), NoLocalMuted (copy), VideoAnimationEnabled (copy)
				RobloxReplicatedStorage:WaitForChild("ContactListInvokeIrisInvite", 1e999):FireServer(p1, tonumber(p2), p3, NoLocalMuted, VideoAnimationEnabled)
			end)()
		end
		Callback()
	end, {
		p1,
		p2,
		p3,
		Callback,
		p4
	})
end