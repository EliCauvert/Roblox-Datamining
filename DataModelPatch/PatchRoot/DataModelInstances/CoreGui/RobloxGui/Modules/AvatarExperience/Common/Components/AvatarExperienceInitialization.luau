local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local AvatarEditorService = game:GetService("AvatarEditorService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AxInit = require(CorePackages.Workspace.Packages.AppDebug).LogTree.logger("ax.init")
local LogHelpersModule = require(Modules.AvatarExperience.Common.Debug.LogHelpers)
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local PromiseModule = require(CorePackages.Packages.Promise)
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local SwitchTab = require(CorePackages.Workspace.Packages.RobloxAppEnums).SwitchTab
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local RemoteAvatarUpdateHandler = require(CorePackages.Workspace.Packages.AvatarExperienceInitialization).Components.RemoteAvatarUpdateHandler
local WaitUntilIXPUserInitModule = require(Modules.LuaApp.Thunks.WaitUntilIXPUserInit)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local GetAvatarDataModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.GetAvatarData)
local ReceivedAvatarDataModule = require(Modules.AvatarExperience.AvatarEditor.Actions.ReceivedAvatarData)
local GetAvatarRulesModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.GetAvatarRules)
local GetProfileConfigurationModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.GetProfileConfiguration)
local ProcessAvatarRulesModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.ProcessAvatarRules)
local GetCatalogMetadataModule = require(Modules.AvatarExperience.Catalog.Thunks.GetCatalogMetadata)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local AvatarExperienceLoadedFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.AvatarExperienceLoaded
local PreventSaveAvatarModule = require(Modules.AvatarExperience.AvatarEditor.Actions.PreventSaveAvatar)
local _ = require(Modules.AvatarExperience.Common.Types)
local SetRangesAndSliderValuesFromBodyColor3sModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.SetRangesAndSliderValuesFromBodyColor3s)
local UseSignalState = require(CorePackages.Packages.SignalsReact).useSignalState
local CreateComputed = require(CorePackages.Packages.Signals).createComputed
local NavigationRoduxModule = require(CorePackages.Workspace.Packages.NavigationRodux)
local SelectCurrentLegacyPageFunction = NavigationRoduxModule.Selectors.selectCurrentLegacyPage
local FFlagSignalsNavP3gAvatarExperience = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3gAvatarExperience
local GetLegacyNavigationStore = NavigationRoduxModule.GetLegacyNavigationStore
local AXGetAvatarDataThrottleInterval = game:DefineFastInt("AXGetAvatarDataThrottleInterval", 90000)
local GetFFlagAXEnableAvatarDataRefreshModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableAvatarDataRefresh)
local FFlagAXModeratedItemsFlow = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow
local FFlagAXBackgroundsPersistence = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXBackgroundsPersistence
local AvatarExperienceInitialization = RoactModule.PureComponent:extend("AvatarExperienceInitialization")
AvatarExperienceInitialization.validateProps = TModule.strictInterface({
	networking = TModule.callback,
	avatarExperienceActive = TModule.boolean,
	navigation = if GetFFlagAXEnableAvatarDataRefreshModule() then TModule.table else nil,
	defaultBodyColorRanges = TModule.optional(TModule.table),
	getCatalogMetadata = TModule.callback,
	getAvatarData = TModule.callback,
	receivedAvatarData = TModule.callback,
	getProfileConfiguration = TModule.callback,
	getAvatarRules = TModule.callback,
	processAvatarRules = TModule.callback,
	avatarExperienceLoaded = TModule.callback,
	waitUntilIXPUserInit = TModule.callback,
	setRangesAndSliderValuesFromBodyColor3s = TModule.callback,
	setPreventSaveAvatar = if GetFFlagAXEnableAvatarDataRefreshModule() then TModule.callback else nil,
	ixpService = TModule.any
})

function AvatarExperienceInitialization.init(p1)
	-- upvalues: Players (copy), PromiseModule (copy), AxInit (copy), LogHelpersModule (copy), AvatarEditorService (copy)
	p1.pendingBodyColor3s = nil
	p1:setState({
		getAvatarDataFailed = false,
		getAvatarRulesFailed = false,
		getAvatarRulesSuccess = false,
		ixpLoaded = false,
		localPlayer = Players.LocalPlayer,
		userId = Players.LocalPlayer and Players.LocalPlayer.UserId or 0
	})
	p1.loadedPromise = PromiseModule.new(function(ResolveLoadedPromise, _)
		-- upvalues: p1 (copy)
		p1.resolveLoadedPromise = ResolveLoadedPromise
	end)
	p1.retryAvatarRulesPromise = nil
	p1.retryAvatarRulesCount = 0
	p1.loadedPromise:andThen(function() end)
	
	function p1.onLocalPlayerChanged()
		-- upvalues: AxInit (upval), LogHelpersModule (upval), Players (upval), p1 (copy)
		AxInit:info("onLocalPlayerChanged: {}", LogHelpersModule.obfuscatePlayer(Players.LocalPlayer))
		
		if p1.state.localPlayer == nil then
			p1:setState({ localPlayer = Players.LocalPlayer })
		end
	end
	
	function p1.onUserIdChanged()
		-- upvalues: AxInit (upval), LogHelpersModule (upval), Players (upval), p1 (copy)
		AxInit:info("onUserIdChanged: {}", LogHelpersModule.obfuscatePlayer(Players.LocalPlayer))
		
		if p1.state.userId == 0 and Players.LocalPlayer ~= nil then
			p1:setState({ userId = Players.LocalPlayer.UserId })
		end
	end
	
	function p1.onRemoteAvatarUpdate()
		-- upvalues: p1 (copy), AvatarEditorService (upval)
		p1:getAvatarData():andThen(function()
			-- upvalues: AvatarEditorService (upval)
			if game:GetEngineFeature("AvatarEditorServiceRefreshAvatarThumbnailEnabled") then
				AvatarEditorService:refreshAvatarThumbnails({ "AvatarHeadShot", "AvatarBust", "Avatar" })
			end
		end)
	end
end

function AvatarExperienceInitialization.getLoadingStatus(p1)
	-- upvalues: RetrievalStatusModule (copy)
	local IsNotUserIdMatch: boolean = p1.state.localPlayer ~= nil and p1.state.userId ~= 0
	
	return if IsNotUserIdMatch and (p1.state.ixpLoaded and p1.state.getAvatarRulesSuccess) then RetrievalStatusModule.Done else RetrievalStatusModule.Fetching
end

function AvatarExperienceInitialization.render(p1)
	-- upvalues: RoactModule (copy), ExternalEventConnection (copy), Players (copy), RetrievalStatusModule (copy), ReactModule (copy), RemoteAvatarUpdateHandler (copy)
	return RoactModule.createFragment({
		LocalPlayerConn = RoactModule.createElement(ExternalEventConnection, {
			event = Players:GetPropertyChangedSignal("LocalPlayer"),
			callback = p1.onLocalPlayerChanged
		}),
		UserIdConn = Players.LocalPlayer ~= nil and RoactModule.createElement(ExternalEventConnection, {
			event = Players.LocalPlayer:GetPropertyChangedSignal("UserId"),
			callback = p1.onUserIdChanged
		}),
		RemoteAvatarUpdateHandler = if p1:getLoadingStatus() == RetrievalStatusModule.Done then ReactModule.createElement(RemoteAvatarUpdateHandler, { onUpdated = p1.onRemoteAvatarUpdate }) else nil
	})
end

function AvatarExperienceInitialization.checkHasLoaded(p1)
	-- upvalues: PromiseModule (copy), RetrievalStatusModule (copy), AxInit (copy)
	if p1.loadedPromise:getStatus() ~= PromiseModule.Status.Resolved and p1:getLoadingStatus() == RetrievalStatusModule.Done then
		AxInit:info("avatarExperienceLoaded")
		p1.props.avatarExperienceLoaded()
		p1.resolveLoadedPromise()
	end
end

function AvatarExperienceInitialization.maybeSetRangesAndSliderValuesFromBodyColor3s(p1)
	if p1.pendingBodyColor3s == nil then return end
	if #p1.props.defaultBodyColorRanges ~= 0 then
		p1.props.setRangesAndSliderValuesFromBodyColor3s(p1.pendingBodyColor3s)
		
		return
	end
end

function AvatarExperienceInitialization.getAvatarData(p1, p2)
	-- upvalues: PromiseModule (copy), AxInit (copy), GetFFlagAXEnableAvatarDataRefreshModule (copy), UtilsModule (copy)
	return (PromiseModule.all({
		p1.props.getAvatarData(p1.props.networking),
		p1.loadedPromise
	}):andThen(function(Entry)
		-- upvalues: AxInit (upval), GetFFlagAXEnableAvatarDataRefreshModule (upval), p2 (copy), p1 (copy), UtilsModule (upval)
		local Entry1 = Entry[1]
		AxInit:debug("getAvatarData results valid: {}", Entry1 ~= nil)
		
		if Entry1 then
			if GetFFlagAXEnableAvatarDataRefreshModule() and p2 then
				p1.props.setPreventSaveAvatar(true)
			end
			p1:applyAvatarDataWithModifiedBodyColor3s(Entry1, (UtilsModule.convertBodyColor3HexesToColor3s(Entry1.bodyColor3s or {})))
		end
	end):catch(function(Err)
		-- upvalues: AxInit (upval), p1 (copy)
		AxInit:info("getAvatarData failed: {}", Err)
		p1:setState({ getAvatarDataFailed = true })
	end))
end

function AvatarExperienceInitialization.applyAvatarDataWithModifiedBodyColor3s(p1, p2, BodyColor3s)
	-- upvalues: CryoModule (copy)
	p1.props.receivedAvatarData((CryoModule.Dictionary.join(p2, { bodyColor3s = BodyColor3s })))
	p1.pendingBodyColor3s = BodyColor3s
	p1:maybeSetRangesAndSliderValuesFromBodyColor3s()
end

function AvatarExperienceInitialization.maybeStartRetryAvatarRules(p1)
	-- upvalues: PromiseModule (copy)
	if not p1.retryAvatarRulesPromise or p1.retryAvatarRulesPromise:getStatus() == PromiseModule.Status.Resolved then
		p1.retryAvatarRulesCount += 1
		p1.retryAvatarRulesPromise = PromiseModule.delay(math.pow(2, p1.retryAvatarRulesCount - 1) * 2):andThen(function()
			-- upvalues: p1 (copy)
			p1:getAvatarRules()
		end)
		
		return
	end
end

function AvatarExperienceInitialization.getAvatarRules(p1)
	-- upvalues: AxInit (copy), PromiseModule (copy)
	PromiseModule.all({
		p1.props.getAvatarRules():andThen(function(Result)
			-- upvalues: p1 (copy)
			p1:setState({ getAvatarRulesSuccess = true })
			
			return Result
		end, function(p2)
			-- upvalues: AxInit (upval), p1 (copy)
			AxInit:info("getAvatarRules failed: {}", p2)
			p1:setState({ getAvatarRulesFailed = true })
			p1:maybeStartRetryAvatarRules()
		end),
		p1.loadedPromise
	}):andThen(function(Entry)
		-- upvalues: AxInit (upval), p1 (copy)
		local Entry1 = Entry[1]
		AxInit:debug("getAvatarRules results valid: {}", Entry1 ~= nil)
		
		if Entry1 then
			p1.props.processAvatarRules(Entry1)
		end
	end)
end

function AvatarExperienceInitialization.checkIXPInitialized(p1)
	if p1.state.userId ~= 0 then
		p1.props.waitUntilIXPUserInit(p1.props.ixpService, p1.state.userId):andThen(function()
			-- upvalues: p1 (copy)
			p1:setState({ ixpLoaded = true })
		end)
	end
end

function AvatarExperienceInitialization.checkForLocalPlayer(p1)
	-- upvalues: Players (copy)
	local IsNotUserIdMatch: boolean = Players.LocalPlayer and Players.LocalPlayer.UserId ~= p1.state.userId
	
	if Players.LocalPlayer ~= p1.state.localPlayer or IsNotUserIdMatch then
		p1:setState({
			localPlayer = Players.LocalPlayer,
			userId = Players.LocalPlayer and Players.LocalPlayer.UserId or 0
		})
	end
end

function AvatarExperienceInitialization.didMount(p1)
	-- upvalues: AxInit (copy), FFlagAXBackgroundsPersistence (copy)
	p1:checkForLocalPlayer()
	AxInit:info("AvatarExperienceInitialization:didMount")
	p1.props.getCatalogMetadata(p1.props.networking)
	p1:getAvatarData()
	
	if FFlagAXBackgroundsPersistence then
		p1.props.getProfileConfiguration()
	end
	p1:getAvatarRules()
	p1:checkIXPInitialized()
	p1:checkHasLoaded()
end

if GetFFlagAXEnableAvatarDataRefreshModule() then
	function AvatarExperienceInitialization.refreshAvatarDataOnRouteChange(p1, p2)
		-- upvalues: AXGetAvatarDataThrottleInterval (copy)
		if p1.props.navigation.currentRoute.routeName ~= p2.navigation.currentRoute.routeName and not p1.props.avatarExperienceActive then
			local ScaledClockTime = os.clock() * 1000
			
			if not p1.lastCallTime then
				p1.lastCallTime = 0
			end
			if ScaledClockTime and AXGetAvatarDataThrottleInterval <= ScaledClockTime - p1.lastCallTime then
				p1:getAvatarData(true)
				p1.lastCallTime = ScaledClockTime
			end
		end
	end
end
function AvatarExperienceInitialization.didUpdate(p1, p2, p3)
	-- upvalues: GetFFlagAXEnableAvatarDataRefreshModule (copy)
	p1:checkForLocalPlayer()
	p1:checkHasLoaded()
	
	if p1.props.avatarExperienceActive and not p2.avatarExperienceActive then
		if p1.state.getAvatarDataFailed then
			p1:setState({ getAvatarDataFailed = false })
			p1:getAvatarData()
		end
		if p1.state.getAvatarRulesFailed then
			p1:setState({ getAvatarRulesFailed = false })
			p1:getAvatarRules()
		end
	end
	if GetFFlagAXEnableAvatarDataRefreshModule() then
		p1:refreshAvatarDataOnRouteChange(p2)
	end
	if p1.state.userId ~= p3.userId then
		p1:checkIXPInitialized()
	end
	if #p2.defaultBodyColorRanges == 0 and #p1.props.defaultBodyColorRanges ~= 0 then
		p1:maybeSetRangesAndSliderValuesFromBodyColor3s()
	end
end

function AvatarExperienceInitialization.willUnmount(p1)
	-- upvalues: AxInit (copy), PromiseModule (copy)
	AxInit:info("AvatarExperienceInitialization:willUnmount")
	
	if p1.loadedPromise:getStatus() ~= PromiseModule.Status.Resolved then
		p1.loadedPromise:cancel()
	end
	if p1.retryAvatarRulesPromise and p1.retryAvatarRulesPromise:getStatus() ~= PromiseModule.Status.Resolved then
		p1.retryAvatarRulesPromise:cancel()
		p1.retryAvatarRulesPromise = nil
	end
end

local v1: (any) -> any = RoactServices.connect({ networking = RoactNetworkingModule })((RoactRoduxModule.connect(function(p1, _)
	-- upvalues: FFlagSignalsNavP3gAvatarExperience (copy), SelectCurrentLegacyPageFunction (copy), SwitchTab (copy), AvatarScreen (copy), GetFFlagAXEnableAvatarDataRefreshModule (copy)
	local IsNameMatch: boolean? = nil
	local Navigation = nil
	
	if not FFlagSignalsNavP3gAvatarExperience then
		local SelectCurrentLegacyPageResult = SelectCurrentLegacyPageFunction(p1)
		IsNameMatch = SelectCurrentLegacyPageResult.name == SwitchTab.AvatarExperienceTab or SelectCurrentLegacyPageResult.name == AvatarScreen.AvatarExperienceRoot
		Navigation = if GetFFlagAXEnableAvatarDataRefreshModule() then p1.Navigation else nil
	end
	return {
		defaultBodyColorRanges = p1.AvatarExperience.AvatarEditor.DefaultBodyColorRanges,
		avatarExperienceActive = IsNameMatch,
		navigation = Navigation
	}
end, function(Callback)
	-- upvalues: GetAvatarDataModule (copy), FFlagAXModeratedItemsFlow (copy), ReceivedAvatarDataModule (copy), GetProfileConfigurationModule (copy), GetAvatarRulesModule (copy), ProcessAvatarRulesModule (copy), AvatarExperienceLoadedFunction (copy), WaitUntilIXPUserInitModule (copy), GetCatalogMetadataModule (copy), SetRangesAndSliderValuesFromBodyColor3sModule (copy), GetFFlagAXEnableAvatarDataRefreshModule (copy), PreventSaveAvatarModule (copy)
	return {
		getAvatarData = function(p1)
			-- upvalues: Callback (copy), GetAvatarDataModule (upval), FFlagAXModeratedItemsFlow (upval)
			return Callback(GetAvatarDataModule(p1, if FFlagAXModeratedItemsFlow then true else nil))
		end,
		receivedAvatarData = function(p1)
			-- upvalues: Callback (copy), ReceivedAvatarDataModule (upval)
			return Callback(ReceivedAvatarDataModule(p1))
		end,
		getProfileConfiguration = function()
			-- upvalues: Callback (copy), GetProfileConfigurationModule (upval)
			return Callback(GetProfileConfigurationModule)
		end,
		getAvatarRules = function()
			-- upvalues: Callback (copy), GetAvatarRulesModule (upval)
			return Callback(GetAvatarRulesModule)
		end,
		processAvatarRules = function(p1)
			-- upvalues: Callback (copy), ProcessAvatarRulesModule (upval)
			return Callback(ProcessAvatarRulesModule(p1))
		end,
		avatarExperienceLoaded = function()
			-- upvalues: Callback (copy), AvatarExperienceLoadedFunction (upval)
			return Callback(AvatarExperienceLoadedFunction())
		end,
		waitUntilIXPUserInit = function(p1, p2)
			-- upvalues: Callback (copy), WaitUntilIXPUserInitModule (upval)
			return Callback(WaitUntilIXPUserInitModule(p1, p2))
		end,
		getCatalogMetadata = function(p1)
			-- upvalues: Callback (copy), GetCatalogMetadataModule (upval)
			return Callback(GetCatalogMetadataModule(p1))
		end,
		setRangesAndSliderValuesFromBodyColor3s = function(p1)
			-- upvalues: Callback (copy), SetRangesAndSliderValuesFromBodyColor3sModule (upval)
			Callback(SetRangesAndSliderValuesFromBodyColor3sModule(p1))
		end,
		setPreventSaveAvatar = if GetFFlagAXEnableAvatarDataRefreshModule() then function(p1)
			-- upvalues: Callback (copy), PreventSaveAvatarModule (upval)
			Callback(PreventSaveAvatarModule(p1))
		end else nil
	}
end)(AvatarExperienceInitialization)))

if FFlagSignalsNavP3gAvatarExperience then
	local v2 = v1
	
	v1 = function(p1)
		-- upvalues: GetLegacyNavigationStore (copy), UseSignalState (copy), SwitchTab (copy), AvatarScreen (copy), GetFFlagAXEnableAvatarDataRefreshModule (copy), ReactModule (copy), CreateComputed (copy), RoactModule (copy), v2 (copy), CryoModule (copy)
		local v3 = GetLegacyNavigationStore(false)
		local v4 = UseSignalState(v3.getCurrentPage)
		local UseMemoResult = if GetFFlagAXEnableAvatarDataRefreshModule() then ReactModule.useMemo(function()
			-- upvalues: CreateComputed (upval), v3 (copy)
			return CreateComputed(function(p2)
				-- upvalues: v3 (upval)
				return { currentRoute = v3.getCurrentRoute(p2) }
			end)
		end, { v3 }) else nil
		
		return RoactModule.createElement(v2, CryoModule.Dictionary.join(p1, {
			avatarExperienceActive = v4.name == SwitchTab.AvatarExperienceTab or v4.name == AvatarScreen.AvatarExperienceRoot,
			navigation = if UseMemoResult then UseSignalState(UseMemoResult) else nil
		}))
	end
end
return function(p1)
	-- upvalues: RoactModule (copy), RoactAppExperimentModule (copy), CryoModule (copy), v1 (ref)
	return RoactModule.createElement(RoactAppExperimentModule.Consumer, {
		render = function(IxpService)
			-- upvalues: CryoModule (upval), p1 (copy), RoactModule (upval), v1 (upval)
			return RoactModule.createElement(v1, (CryoModule.Dictionary.join(p1, { ixpService = IxpService })))
		end
	})
end