local CorePackages = game:GetService("CorePackages")
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AppSessionService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppSessionService
local AppLogging = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLogging
local MutedErrorFunction = require(CorePackages.Workspace.Packages.Loggers).mutedError
local SessionType = require(CorePackages.Workspace.Packages.RobloxAppSessionization).SessionType
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local NavigationRoduxModule = require(CorePackages.Workspace.Packages.NavigationRodux)
local SelectCurrentLegacyRouteFunction = NavigationRoduxModule.Selectors.selectCurrentLegacyRoute
local SelectCurrentLegacyPageFunction = NavigationRoduxModule.Selectors.selectCurrentLegacyPage
local HasPageInCurrentRouteFunction = require(CorePackages.Workspace.Packages.DiscoveryRouting).hasPageInCurrentRoute
local ReportWarningFunction = require(CorePackages.Workspace.Packages.DiscoveryAnalytics).Points.reportWarning
local FFlagSignalsNavP3cEvents = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3cEvents
local UseSignalState = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3cEvents then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local FlagSettingsModule = require(Modules.LuaApp.FlagSettings)
local FFlagEnableL1SessionStateEngineOwnedModule = require(Modules.LuaApp.Flags.FFlagEnableL1SessionStateEngineOwned)

local function computeLevel2SessionsFromRoute(p1)
	-- upvalues: SessionType (copy)
	local Level2a = SessionType.StructuralIdentifier.Level2a
	local Level2b = SessionType.StructuralIdentifier.Level2b
	local t = {}
	local Flag = false
	
	for i = #p1, 1, -1 do
		local Name = p1[i].name
		local Level2bEntry = SessionType.Tag.Level2b[Name]
		
		if SessionType.Tag.Level2a[Name] then
			t[Level2a] = p1[i]
			break
		else
			if not Flag and Level2bEntry then
				t[Level2b] = p1[i]
				Flag = true
			end
		end
	end
	local config = { detail = nil, name = SessionType.Tag.Level2a.Unknown }
	t[Level2a] = t[Level2a] or config
	
	return t
end

local function _(p2): string
	if not p2 then
		return "No currentRoute!"
	end
	local v1 = ""
	
	for i = 1, #p2 do
		v1 = `{p2[i].name};{v1}`
	end
	return v1
end

local SessionManager = require(CorePackages.Packages.Roact).Component:extend("SessionManager")

function SessionManager.init(p3)
	-- upvalues: MutedErrorFunction (copy), HasPageInCurrentRouteFunction (copy), AppPage (copy), SessionType (copy), ReportWarningFunction (copy), FFlagEnableL1SessionStateEngineOwnedModule (copy), FlagSettingsModule (copy), computeLevel2SessionsFromRoute (copy)
	function p3.updateGameSearchSession()
		-- upvalues: p3 (copy), MutedErrorFunction (upval), HasPageInCurrentRouteFunction (upval), AppPage (upval), SessionType (upval)
		local SessionService = p3.props.sessionService
		local CurrentRoute = p3.props.currentRoute
		
		if SessionService == nil then
			MutedErrorFunction("SessionManager requires valid SessionService.")
			
			return
		end
		if not HasPageInCurrentRouteFunction(CurrentRoute, AppPage.SearchPage, nil) then
			SessionService:RemoveSession(SessionType.StructuralIdentifier.GameSearchAutocomplete)
			SessionService:RemoveSession(SessionType.StructuralIdentifier.OmniSearch)
		end
	end
	
	function p3.updateGameDetailSourceSession()
		-- upvalues: p3 (copy), HasPageInCurrentRouteFunction (upval), AppPage (upval), SessionType (upval), ReportWarningFunction (upval)
		local SessionService = p3.props.sessionService
		local CurrentRoute = p3.props.currentRoute
		local LoggingProtocol = p3.props.loggingProtocol
		
		if HasPageInCurrentRouteFunction(CurrentRoute, AppPage.GameDetail, nil) or HasPageInCurrentRouteFunction(CurrentRoute, AppPage.ExperienceDetail, nil) then
			if not SessionService:SessionExists(SessionType.StructuralIdentifier.GameDetailSource) then
				local v2 = "Session"
				local v3 = "No GameDetailSource session for Game Details page. Pages: %*"
				local v4 = nil
				
				if CurrentRoute then
					local v5 = ""
					
					for i = 1, #CurrentRoute do
						v5 = `{CurrentRoute[i].name};{v5}`
					end
					v4 = v5
				else
					v4 = "No currentRoute!"
				end
				ReportWarningFunction(LoggingProtocol, v2, (v3:format(v4)))
				
				return
			end
		else
			if SessionService:SessionExists(SessionType.StructuralIdentifier.GameDetailSource) then
				local v6 = "Session"
				local v7 = "GameDetailSource session exists but no Game Details page open. Pages: %*"
				local v8 = nil
				
				if CurrentRoute then
					local v9 = ""
					
					for i1 = 1, #CurrentRoute do
						v9 = `{CurrentRoute[i1].name};{v9}`
					end
					v8 = v9
				else
					v8 = "No currentRoute!"
				end
				ReportWarningFunction(LoggingProtocol, v6, (v7:format(v8)))
			end
			SessionService:RemoveSession(SessionType.StructuralIdentifier.GameDetailSource)
		end
	end
	
	function p3.updateSessionService(RNLevel2a, RNLevel2b, RNLevel2a1, RNLevel2b1)
		-- upvalues: p3 (copy), SessionType (upval), FFlagEnableL1SessionStateEngineOwnedModule (upval)
		local SessionService = p3.props.sessionService
		local Level1 = SessionType.StructuralIdentifier.Level1
		local Level2a = SessionType.StructuralIdentifier.Level2a
		local Level2b = SessionType.StructuralIdentifier.Level2b
		local RNLevel2a1_1 = RNLevel2a1 or { name = SessionType.Tag.Level2a.Unknown }
		local RNLevel2b1_1 = RNLevel2b1 or {}
		local RNLevel2a2 = RNLevel2a or {}
		local RNLevel2b2 = RNLevel2b or {}
		
		if not FFlagEnableL1SessionStateEngineOwnedModule and not SessionService:SessionExists(Level1) then
			SessionService:SetSession(SessionService:GetRootSID(), Level1, SessionType.Tag.Level1.Default)
			SessionService:SetMetadata(Level1, SessionType.Metadata.User.UserId, "Unknown")
		end
		if RNLevel2a1_1.name ~= RNLevel2a2.name or RNLevel2b1_1.name ~= RNLevel2b2.name then
			SessionService:RemoveSessionsWithMetadataKey(SessionType.Metadata.GamePlay.DeleteOnGameLeave)
		end
		if RNLevel2a1_1.detail ~= RNLevel2a2.detail or RNLevel2a1_1.name ~= RNLevel2a2.name then
			if SessionService:SessionExists(Level2a) then
				SessionService:ReplaceSession(Level2a, RNLevel2a1_1.name)
			else
				SessionService:SetSession(Level1, Level2a, RNLevel2a1_1.name)
			end
			if RNLevel2b1_1.name == nil and RNLevel2b2.name == nil then
				SessionService:SetSession(Level2a, Level2b, RNLevel2a1_1.name .. "Page")
			end
		end
		if RNLevel2b1_1.detail ~= RNLevel2b2.detail or RNLevel2b1_1.name ~= RNLevel2b2.name then
			if SessionService:SessionExists(Level2b) then
				SessionService:ReplaceSession(Level2b, RNLevel2b1_1.name or RNLevel2a1_1.name .. "Page")
				
				return
			end
			SessionService:SetSession(Level2a, Level2b, RNLevel2b1_1.name or RNLevel2a1_1.name .. "Page")
		end
	end
	
	p3:setState({
		RNLevel2a = { name = FlagSettingsModule.GetDefaultAppPage() },
		RNLevel2b = {}
	})
	
	function p3._processRouteSignal(p4)
		-- upvalues: computeLevel2SessionsFromRoute (upval), p3 (copy), SessionType (upval)
		local Level2SessionsFromRoute = computeLevel2SessionsFromRoute(p4) or {}
		p3:setState({
			RNLevel2a = Level2SessionsFromRoute[SessionType.StructuralIdentifier.Level2a],
			RNLevel2b = Level2SessionsFromRoute[SessionType.StructuralIdentifier.Level2b] or {}
		})
	end
end

function SessionManager:render() end

function SessionManager.didMount(p4)
	-- upvalues: MutedErrorFunction (copy)
	p4.updateGameSearchSession()
	p4.updateGameDetailSourceSession()
	p4.updateSessionService(nil, nil, p4.state.RNLevel2a, p4.state.RNLevel2b)
	
	if p4.props.connectRouteSignal then
		p4._routeChangedConnection = p4.props.connectRouteSignal(p4._processRouteSignal)
		
		return
	else
		MutedErrorFunction("Did not find a listener function in props, Session will not update")
	end
end

function SessionManager.didUpdate(p4, p5, p6)
	if (if p4.props.currentPage then p4.props.currentPage.name else "") ~= (if p5 and p5.currentPage then p5.currentPage.name else "") then
		p4.updateGameSearchSession()
		p4.updateGameDetailSourceSession()
	end
	p4.updateSessionService(p6.RNLevel2a, p6.RNLevel2b, p4.state.RNLevel2a, p4.state.RNLevel2b)
	
	if p5.connectRouteSignal ~= p4.props.connectRouteSignal then
		if p4._routeChangedConnection ~= nil then
			p4._routeChangedConnection:disconnect()
			p4._routeChangedConnection = nil
		end
		if p4.props.connectRouteSignal then
			p4._routeChangedConnection = p4.props.connectRouteSignal(p4._processRouteSignal)
		end
	end
end

function SessionManager.willUnmount(p4)
	if p4._routeChangedConnection ~= nil then
		p4._routeChangedConnection:disconnect()
		p4._routeChangedConnection = nil
	end
end

if FFlagSignalsNavP3cEvents then
	local ReactModule = require(CorePackages.Packages.React)
	local CryoModule = require(CorePackages.Packages.Cryo)
	
	local function v19(p4)
		-- upvalues: GetLegacyNavigationStore (copy), UseSignalState (copy), ReactModule (copy), SessionManager (copy), CryoModule (copy)
		local CurrentRoute = UseSignalState(GetLegacyNavigationStore(false).getCurrentLegacyRoute)
		
		return ReactModule.createElement(SessionManager, CryoModule.Dictionary.union(p4, {
			currentPage = CurrentRoute[#CurrentRoute],
			currentRoute = CurrentRoute
		}))
	end
else
	local v10: (any) -> any = RoactRoduxModule.connect(function(p4, _)
		-- upvalues: SelectCurrentLegacyPageFunction (copy), SelectCurrentLegacyRouteFunction (copy)
		return {
			currentPage = SelectCurrentLegacyPageFunction(p4),
			currentRoute = SelectCurrentLegacyRouteFunction(p4)
		}
	end)(SessionManager)
end
return RoactServices.connect({
	sessionService = AppSessionService,
	loggingProtocol = AppLogging
})(v10)