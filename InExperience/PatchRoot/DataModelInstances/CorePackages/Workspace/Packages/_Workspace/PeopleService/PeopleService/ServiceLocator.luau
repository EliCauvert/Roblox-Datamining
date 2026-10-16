local ConstantsModules = {}
local GetFFlagPeoplePageEnablePersonSignalStoreFunction = require(script:FindFirstAncestor("PeopleService").Flags).GetFFlagPeoplePageEnablePersonSignalStore

local function loadService(Key) --[[ Line: 19 ]]
	-- upvalues: GetFFlagPeoplePageEnablePersonSignalStoreFunction (copy), ConstantsModules (ref)
	local ConstantsModule = nil
	
	if Key == "PeopleUtility" then
		ConstantsModule = require(script.Parent.PeopleUtility)
	elseif Key == "PeopleListStore" then
		ConstantsModule = if GetFFlagPeoplePageEnablePersonSignalStoreFunction() then require(script.Parent.PeopleListStore)() else require(script.Parent.PeopleListStore)
	elseif Key == "PeopleAnalyticsManager" then
		ConstantsModule = require(script.Parent.Analytics.PeopleAnalyticsManager)
	elseif Key == "PerUserVoiceVolumeSessionLifecycle" then
		ConstantsModule = require(script.Parent.Analytics.PerUserVoiceVolumeSessionLifecycle)
	elseif Key == "SettingsHubService" then
		ConstantsModule = require(script.Parent.Integration.SettingsHubService)
	elseif Key == "PeopleVoiceChatStore" then
		ConstantsModule = require(script.Parent.ButtonStores.PeopleVoiceChatStore)
	elseif Key == "PeopleBlockStatusStore" then
		ConstantsModule = require(script.Parent.ButtonStores.PeopleBlockStatusStore)
	elseif Key == "FriendStatusStore" then
		ConstantsModule = require(script.Parent.ButtonStores.FriendStatusStore)
	elseif Key == "PeopleReportAbuseMenu" then
		ConstantsModule = require(script.Parent.Integration.PeopleReportAbuseMenu)
	elseif Key == "PeopleBlockingModalManager" then
		ConstantsModule = require(script.Parent.Integration.PeopleBlockingModalManager)
	elseif Key == "Flags" then
		ConstantsModule = require(script.Parent.Flags)
	elseif Key == "Constants" then
		ConstantsModule = require(script.Parent.Constants)
	elseif Key == "FocusNavigationService" then
		ConstantsModule = require(script.Parent.FocusNavigationService)
	else
		error("Unknown service: " .. Key)
	end
	ConstantsModules[Key] = ConstantsModule
	
	return ConstantsModule
end

return {
	register = function(Key, p1) --[[ Line: 60 ]]
		-- upvalues: ConstantsModules (ref)
		ConstantsModules[Key] = p1
	end,
	get = function(p1) --[[ Line: 64 ]]
		-- upvalues: ConstantsModules (ref), loadService (copy)
		if not ConstantsModules[p1] then
			loadService(p1)
		end
		return ConstantsModules[p1]
	end,
	has = function(p1): boolean --[[ Line: 71 ]]
		-- upvalues: ConstantsModules (ref)
		return ConstantsModules[p1] ~= nil
	end,
	clear = function() --[[ Line: 75 ]]
		-- upvalues: ConstantsModules (ref)
		ConstantsModules = {}
	end
}