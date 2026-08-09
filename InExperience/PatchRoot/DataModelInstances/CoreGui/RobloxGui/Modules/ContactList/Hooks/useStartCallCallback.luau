local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local faceAnimatorService = game:GetService("FaceAnimatorService")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local var7 = nil
local reactModule = require(corePackagesService.Packages.React)
local default = require(corePackagesService.Workspace.Packages.CallProtocol).CallProtocol.default
local sounds = require(corePackagesService.Workspace.Packages.SoundManager).Sounds
local soundGroups = require(corePackagesService.Workspace.Packages.SoundManager).SoundGroups
local soundManager = require(corePackagesService.Workspace.Packages.SoundManager).SoundManager
local contactList = robloxGui.Modules.ContactList
local useAnalyticsModule = require(contactList.Analytics.useAnalytics)
local eventNamesEnumModule = require(contactList.Analytics.EventNamesEnum)
local _ = require(contactList.Enums.Pages)
local enableIrisRerouteToRCCEngineFeature = game:GetEngineFeature("EnableIrisRerouteToRCC")

return function(p0, p1, p2, p3, p4) --[[ line: 27 ]]
	-- upvalues: useAnalyticsModule (ref), reactModule (ref), soundManager (ref), sounds (ref), soundGroups (ref), var7 (write), robloxGui (ref), faceAnimatorService (ref), eventNamesEnumModule (ref), enableIrisRerouteToRCCEngineFeature (ref), playersService (ref), default (ref), httpService (ref), robloxReplicatedStorageService (ref)
	local var12 = useAnalyticsModule()
	
	return reactModule.useCallback(function() --[[ line: 36 ]]
		-- upvalues: soundManager (copy), sounds (copy), soundGroups (copy), var7 (copy), robloxGui (copy), faceAnimatorService (copy), var12 (ref), eventNamesEnumModule (copy), p1 (ref), p4 (ref), enableIrisRerouteToRCCEngineFeature (copy), playersService (copy), default (copy), p2 (ref), httpService (copy), p0 (ref), robloxReplicatedStorageService (copy), p3 (ref)
		soundManager:PlaySound(sounds.Select.Name, { Volume = 0.5 }, soundGroups.Iris)
		
		if var7 == nil then
			var7 = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
		end
		local var13 = var7.localMuted ~= nil or var7.localMuted
		local var14 = if faceAnimatorService:IsStarted() then faceAnimatorService.VideoAnimationEnabled else false
		var12.fireEvent(eventNamesEnumModule.PhoneBookCallFriendClicked, {
			eventTimestampMs = os.time() * 1000,
			friendUserId = tonumber(p1),
			searchQueryString = p4.searchQueryString,
			itemListIndex = p4.itemListIndex,
			isSuggestedUser = p4.isSuggestedUser,
			page = tostring(p4.page)
		})
		
		if enableIrisRerouteToRCCEngineFeature then
			local localPlayer = playersService.LocalPlayer
			
			if localPlayer then
				default:initCall(tonumber(localPlayer.UserId) or 0, tonumber(p1) or 0, localPlayer.DisplayName, p2, var13, var14, httpService:GenerateGUID(false), p0)
			end
		else
			coroutine.wrap(function() --[[ line: 71 ]]
				-- upvalues: robloxReplicatedStorageService (copy), p0 (copy), p1 (copy), p2 (copy), var13 (ref), var14 (ref)
				robloxReplicatedStorageService:WaitForChild("ContactListInvokeIrisInvite", 1e999):FireServer(p0, tonumber(p1), p2, var13, var14)
			end)()
		end
		p3()
	end, {
		p0,
		p1,
		p2,
		p3,
		p4
	})
end