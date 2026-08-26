local peopleService = script:FindFirstAncestor("PeopleService")
local t = {}
local t_1 = {}
local getFFlagPeoplePageEnablePersonSignalStore = require(peopleService.Flags).GetFFlagPeoplePageEnablePersonSignalStore

local function loadService(p1)
	-- upvalues: getFFlagPeoplePageEnablePersonSignalStore (ref), t_1 (write)
	local focusNavigationServiceModule = nil
	
	if p1 == "PeopleUtility" then
		focusNavigationServiceModule = require(script.Parent.PeopleUtility)
	elseif p1 == "PeopleListStore" then
		focusNavigationServiceModule = if getFFlagPeoplePageEnablePersonSignalStore() then require(script.Parent.PeopleListStore)() else require(script.Parent.PeopleListStore)
	elseif p1 == "PeopleAnalyticsManager" then
		focusNavigationServiceModule = require(script.Parent.Analytics.PeopleAnalyticsManager)
	elseif p1 == "PerUserVoiceVolumeSessionLifecycle" then
		focusNavigationServiceModule = require(script.Parent.Analytics.PerUserVoiceVolumeSessionLifecycle)
	elseif p1 == "SettingsHubService" then
		focusNavigationServiceModule = require(script.Parent.Integration.SettingsHubService)
	elseif p1 == "PeopleVoiceChatStore" then
		focusNavigationServiceModule = require(script.Parent.ButtonStores.PeopleVoiceChatStore)
	elseif p1 == "PeopleBlockStatusStore" then
		focusNavigationServiceModule = require(script.Parent.ButtonStores.PeopleBlockStatusStore)
	elseif p1 == "FriendStatusStore" then
		focusNavigationServiceModule = require(script.Parent.ButtonStores.FriendStatusStore)
	elseif p1 == "PeopleReportAbuseMenu" then
		focusNavigationServiceModule = require(script.Parent.Integration.PeopleReportAbuseMenu)
	elseif p1 == "PeopleBlockingModalManager" then
		focusNavigationServiceModule = require(script.Parent.Integration.PeopleBlockingModalManager)
	elseif p1 == "Flags" then
		focusNavigationServiceModule = require(script.Parent.Flags)
	elseif p1 == "Constants" then
		focusNavigationServiceModule = require(script.Parent.Constants)
	elseif p1 == "FocusNavigationService" then
		focusNavigationServiceModule = require(script.Parent.FocusNavigationService)
	else
		error("Unknown service: " .. p0)
	end
	t_1[p1] = focusNavigationServiceModule
	
	return focusNavigationServiceModule
end

function t.register(p1, p2)
	-- upvalues: t_1 (write)
	t_1[p1] = p2
end

function t.get(p1)
	-- upvalues: t_1 (write), loadService (ref)
	if not t_1[p1] then
		loadService(p1)
	end
	return t_1[p1]
end

function t.has(p1)
	-- upvalues: t_1 (write)
	return t_1[p1] ~= nil
end

function t.clear()
	-- upvalues: t_1 (write)
	t_1 = {}
end

return t