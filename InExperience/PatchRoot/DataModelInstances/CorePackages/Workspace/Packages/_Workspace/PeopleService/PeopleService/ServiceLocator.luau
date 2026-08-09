local peopleService = script:FindFirstAncestor("PeopleService")
local t = {}
local t_1 = {}
local getFFlagPeoplePageEnablePersonSignalStore = require(peopleService.Flags).GetFFlagPeoplePageEnablePersonSignalStore

local function loadService(p0) --[[ line: 19 ]]
	-- upvalues: getFFlagPeoplePageEnablePersonSignalStore (ref), t_1 (write)
	local focusNavigationServiceModule = nil
	
	if p0 == "PeopleUtility" then
		focusNavigationServiceModule = require(script.Parent.PeopleUtility)
	elseif p0 == "PeopleListStore" then
		focusNavigationServiceModule = if getFFlagPeoplePageEnablePersonSignalStore() then require(script.Parent.PeopleListStore)() else require(script.Parent.PeopleListStore)
	elseif p0 == "PeopleAnalyticsManager" then
		focusNavigationServiceModule = require(script.Parent.Analytics.PeopleAnalyticsManager)
	elseif p0 == "SettingsHubService" then
		focusNavigationServiceModule = require(script.Parent.Integration.SettingsHubService)
	elseif p0 == "PeopleVoiceChatStore" then
		focusNavigationServiceModule = require(script.Parent.ButtonStores.PeopleVoiceChatStore)
	elseif p0 == "PeopleBlockStatusStore" then
		focusNavigationServiceModule = require(script.Parent.ButtonStores.PeopleBlockStatusStore)
	elseif p0 == "FriendStatusStore" then
		focusNavigationServiceModule = require(script.Parent.ButtonStores.FriendStatusStore)
	elseif p0 == "PeopleReportAbuseMenu" then
		focusNavigationServiceModule = require(script.Parent.Integration.PeopleReportAbuseMenu)
	elseif p0 == "PeopleBlockingModalManager" then
		focusNavigationServiceModule = require(script.Parent.Integration.PeopleBlockingModalManager)
	elseif p0 == "Flags" then
		focusNavigationServiceModule = require(script.Parent.Flags)
	elseif p0 == "Constants" then
		focusNavigationServiceModule = require(script.Parent.Constants)
	elseif p0 == "FocusNavigationService" then
		focusNavigationServiceModule = require(script.Parent.FocusNavigationService)
	else
		error("Unknown service: " .. p0)
	end
	t_1[p0] = focusNavigationServiceModule
	
	return focusNavigationServiceModule
end

function t.register(p1, p2) --[[ line: 58 ]]
	-- upvalues: t_1 (write)
	t_1[p1] = p2
end

function t.get(p3) --[[ line: 62 ]]
	-- upvalues: t_1 (write), loadService (ref)
	if not t_1[p3] then
		loadService(p3)
	end
	return t_1[p3]
end

function t.has(p4) --[[ line: 69 ]]
	-- upvalues: t_1 (write)
	return t_1[p4] ~= nil
end

function t.clear() --[[ line: 73 ]]
	-- upvalues: t_1 (write)
	t_1 = {}
end

return t