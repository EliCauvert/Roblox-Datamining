local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local PromiseModule = require(CorePackages.Packages.Promise)
local AnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local AnalyticsModule1 = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local AppNotificationService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppNotificationService
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local SetPageLoadedModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetPageLoaded)
local SetFullViewModule = require(Modules.AvatarExperience.Common.Thunks.SetFullView)
local FullView = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.FullView
local CharacterMoverModule = require(Modules.AvatarExperience.Common.Managers.CharacterMover)
local SaveManagerModule = require(Modules.AvatarExperience.Common.Managers.SaveManager)
local CharacterManagerModule = require(Modules.AvatarExperience.Common.Managers.CharacterManager)
local BackgroundSceneManagerModule = require(Modules.AvatarExperience.Common.Managers.BackgroundSceneManager)
local BackgroundSceneManagerDEPRECATEDModule = require(Modules.AvatarExperience.Common.Managers.BackgroundSceneManager_DEPRECATED)
local RobloxAppEnumsModule = require(CorePackages.Workspace.Packages.RobloxAppEnums)
local AppPage = RobloxAppEnumsModule.AppPage
local SwitchTab = RobloxAppEnumsModule.SwitchTab
local AnalyticsModule2 = require(Modules.AvatarExperience.Common.Services.Analytics)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local AppPagePropertiesModule = require(Modules.LuaApp.AppPageProperties)
local WrapWithSceneInteractionEventsModule = require(Modules.AvatarExperience.Common.Context.wrapWithSceneInteractionEvents)
local AvatarSceneSkyModule = require(Modules.AvatarExperience.Common.Managers.AvatarSceneSky)
local WithAppRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAppRoute)
local SelectHasAvatarDataModule = require(Modules.AvatarExperience.Common.Selectors.selectHasAvatarData)
local WithThrottleFramerateGivenPolicyModule = require(Modules.LuaApp.Common.withThrottleFramerateGivenPolicy)
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local CryoModule = require(CorePackages.Packages.Cryo)
local UseBodyDataEventsContextModule = require(Modules.AvatarExperience.Common.Context.useBodyDataEventsContext)
local UseAdjustmentDataEventsContextModule = require(Modules.AvatarExperience.Common.Context.AdjustmentData.useAdjustmentDataEventsContext)
local UseAppliedDescriptionCallbackContextModule = require(Modules.AvatarExperience.Common.Context.AppliedDescription.useAppliedDescriptionCallbackContext)
local UseUiModeInfoFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local UiMode = RobloxAppEnumsModule.UiMode
local AfterAvatarExperienceLoadedModule = require(Modules.AvatarExperience.Common.Components.AfterAvatarExperienceLoaded)
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local AXAlternateLandingPageIXPModule = require(Modules.AvatarExperience.Flags.AXAlternateLandingPageIXP)
local GetFFlagCleanUpAXAlternativeLandingPageIXPModule = require(Modules.AvatarExperience.Flags.GetFFlagCleanUpAXAlternativeLandingPageIXP)
local FFlagAXFixBodyScaleReduxUpdatesModule = require(Modules.AvatarExperience.Flags.FFlagAXFixBodyScaleReduxUpdates)
local AxScene = require(CorePackages.Workspace.Packages.AppDebug).LogTree.logger("ax.scene")
local MutedErrorFunction = require(CorePackages.Workspace.Packages.Loggers).mutedError
local AXDebugCreateHumanoidModelError = game:DefineFastFlag("AXDebugCreateHumanoidModelError", false)
local AXDisableSaveManager2 = AvatarExperienceFlagsModule.FFlagAXEnableManualSaving and game:DefineFastFlag("AXDisableSaveManager2", false)
local FFlagAXBackgroundSceneManagerRevamp = AvatarExperienceFlagsModule.FFlagAXBackgroundSceneManagerRevamp
local FFlagAXBackgroundsCycloramaVR = AvatarExperienceFlagsModule.FFlagAXBackgroundsCycloramaVR
local FFlagAXAvatarLoadWithRetry = AvatarExperienceFlagsModule.FFlagAXAvatarLoadWithRetry
local AXAvatarLoadRetryCount = game:DefineFastInt("AXAvatarLoadRetryCount", 5)
local AXAvatarLoadRetryDelayMs = game:DefineFastInt("AXAvatarLoadRetryDelayMs", 500)
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local FFlagSignalsNavP3gAvatarExperience = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3gAvatarExperience
local GetCatalogCategoriesStoreModule = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3gAvatarExperience then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil

local function setupCharacterModels()
	-- upvalues: PromiseModule (copy), Players (copy)
	return PromiseModule.new(function(Callback: (any) -> (), Callback1: (any) -> ())
		-- upvalues: Players (upval)
		local Success, Result = pcall(function()
			-- upvalues: Players (upval)
			return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then {
				r6 = Players:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R6),
				r15 = Players:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15)
			} else {
				r6 = Players:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R6),
				r15 = Players:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15)
			}
		end)
		
		if Success then
			Callback(Result)
			
			return
		else
			Callback1(Result)
		end
	end)
end

local AvatarSceneManager = RoactModule.PureComponent:extend("AvatarSceneManager")
AvatarSceneManager.defaultProps = {
	renderSky = true,
	shouldManageBackground = true,
	isSpatial = false,
	allowCameraMovements = true,
	alternateAvatarLandingScreenFullscreenEnabled = if GetFFlagCleanUpAXAlternativeLandingPageIXPModule() then nil else false
}

function AvatarSceneManager.init(p1)
	-- upvalues: FFlagAXFixBodyScaleReduxUpdatesModule (copy), FFlagAXAvatarLoadWithRetry (copy), PromiseModule (copy), setupCharacterModels (copy), AXAvatarLoadRetryCount (copy), AXAvatarLoadRetryDelayMs (copy), CharacterMoverModule (copy), CharacterManagerModule (copy), FFlagAXBackgroundSceneManagerRevamp (copy), BackgroundSceneManagerModule (copy), FFlagAXBackgroundsCycloramaVR (copy), BackgroundSceneManagerDEPRECATEDModule (copy), AXDisableSaveManager2 (copy), SaveManagerModule (copy), MutedErrorFunction (copy), AXDebugCreateHumanoidModelError (copy)
	local Analytics = p1.props.analytics
	local AppAnalytics = p1.props.appAnalytics
	local AvatarExperienceAnalytics = p1.props.avatarExperienceAnalytics
	local SetBodyColors = p1.props.setBodyColors
	local SetAvatarScales = if FFlagAXFixBodyScaleReduxUpdatesModule then p1.props.setAvatarScales else nil
	local Networking = p1.props.networking
	local InteractionEvents = p1.props.interactionEvents
	local Store = p1.props.store
	local AvatarRoute = p1.props.avatarRoute
	local ShouldManageBackground = p1.props.shouldManageBackground
	local IsSpatial = p1.props.isSpatial
	local CatalogAnalytics = p1.props.catalogAnalytics
	p1.running = false
	p1.characterManagerRunning = false
	p1.finishedInitializing = false
	p1.modelLoadPromise = nil
	
	if FFlagAXAvatarLoadWithRetry then
		p1.modelLoadPromise = PromiseModule.retryWithDelay(setupCharacterModels, AXAvatarLoadRetryCount, AXAvatarLoadRetryDelayMs * 0.001):andThen(function(Result)
			-- upvalues: p1 (copy), CharacterMoverModule (upval), Store (copy), AvatarExperienceAnalytics (copy), AvatarRoute (copy), InteractionEvents (copy), CharacterManagerModule (upval), Networking (copy), AppAnalytics (copy), SetBodyColors (copy), FFlagAXFixBodyScaleReduxUpdatesModule (upval), SetAvatarScales (copy), CatalogAnalytics (copy), ShouldManageBackground (copy), FFlagAXBackgroundSceneManagerRevamp (upval), BackgroundSceneManagerModule (upval), FFlagAXBackgroundsCycloramaVR (upval), IsSpatial (copy), BackgroundSceneManagerDEPRECATEDModule (upval), AXDisableSaveManager2 (upval), SaveManagerModule (upval), Analytics (copy)
			p1.characterMover = CharacterMoverModule.new(Store, AvatarExperienceAnalytics, AvatarRoute, InteractionEvents, p1.props.allowCameraMovements)
			p1.characterManager = CharacterManagerModule.new(Store, Networking, AppAnalytics, AvatarRoute, p1.characterMover, {
				bodyColorsChangedEvent = SetBodyColors,
				adjustmentChangedEvent = p1.props.setAdjustments,
				avatarScalesChangedEvent = if FFlagAXFixBodyScaleReduxUpdatesModule then SetAvatarScales else nil
			}, { setAppliedDescription = p1.props.setAppliedDescription }, CatalogAnalytics, Result)
			
			if ShouldManageBackground then
				if FFlagAXBackgroundSceneManagerRevamp then
					p1.backgroundSceneManager = BackgroundSceneManagerModule.new(Store, Networking, AvatarRoute, FFlagAXBackgroundsCycloramaVR and IsSpatial)
				else
					p1.backgroundSceneManager = BackgroundSceneManagerDEPRECATEDModule.new(Store, Networking, AvatarRoute, FFlagAXBackgroundsCycloramaVR and IsSpatial)
				end
			end
			if not AXDisableSaveManager2 then
				p1.saveManager = SaveManagerModule.new(Store, Networking, Analytics)
			end
			p1.finishedInitializing = true
			
			if p1.destroyed then
				p1:onDestroy()
				
				return
			else
				p1:updateManagers()
			end
		end):catch(function(Err)
			-- upvalues: p1 (copy), MutedErrorFunction (upval)
			MutedErrorFunction(`{tostring(Err)} on page: {(function()
				-- upvalues: p1 (upval)
				if not p1.props.routeHistory or typeof(p1.props.routeHistory) ~= "table" then
					return `no route history got {typeof(p1.props.routeHistory)}`
				end
				local RouteHistoryEntry = p1.props.routeHistory[#p1.props.routeHistory]
				
				if RouteHistoryEntry and typeof(RouteHistoryEntry) == "table" then
					local RouteHistoryEntry1 = RouteHistoryEntry[#RouteHistoryEntry]
					
					return if RouteHistoryEntry1 and typeof(RouteHistoryEntry1) == "table" then RouteHistoryEntry1.name else "no page"
				else
					return `no route, got {typeof(RouteHistoryEntry)}`
				end
			end)()}, with receivedAvatarData: {p1.props.receivedAvatarData}`)
		end)
		
		return
	else
		task.spawn(function()
			-- upvalues: AXDebugCreateHumanoidModelError (upval), p1 (copy), CharacterMoverModule (upval), Store (copy), AvatarExperienceAnalytics (copy), AvatarRoute (copy), InteractionEvents (copy), CharacterManagerModule (upval), Networking (copy), AppAnalytics (copy), SetBodyColors (copy), FFlagAXFixBodyScaleReduxUpdatesModule (upval), SetAvatarScales (copy), CatalogAnalytics (copy), ShouldManageBackground (copy), FFlagAXBackgroundSceneManagerRevamp (upval), BackgroundSceneManagerModule (upval), FFlagAXBackgroundsCycloramaVR (upval), IsSpatial (copy), BackgroundSceneManagerDEPRECATEDModule (upval), AXDisableSaveManager2 (upval), SaveManagerModule (upval), Analytics (copy), MutedErrorFunction (upval)
			if AXDebugCreateHumanoidModelError then
				local Success, Result = pcall(function()
					-- upvalues: p1 (upval), CharacterMoverModule (upval), Store (upval), AvatarExperienceAnalytics (upval), AvatarRoute (upval), InteractionEvents (upval), CharacterManagerModule (upval), Networking (upval), AppAnalytics (upval), SetBodyColors (upval), FFlagAXFixBodyScaleReduxUpdatesModule (upval), SetAvatarScales (upval), CatalogAnalytics (upval), ShouldManageBackground (upval), FFlagAXBackgroundSceneManagerRevamp (upval), BackgroundSceneManagerModule (upval), FFlagAXBackgroundsCycloramaVR (upval), IsSpatial (upval), BackgroundSceneManagerDEPRECATEDModule (upval), AXDisableSaveManager2 (upval), SaveManagerModule (upval), Analytics (upval)
					p1.characterMover = CharacterMoverModule.new(Store, AvatarExperienceAnalytics, AvatarRoute, InteractionEvents, p1.props.allowCameraMovements)
					p1.characterManager = CharacterManagerModule.new(Store, Networking, AppAnalytics, AvatarRoute, p1.characterMover, {
						bodyColorsChangedEvent = SetBodyColors,
						adjustmentChangedEvent = p1.props.setAdjustments,
						avatarScalesChangedEvent = if FFlagAXFixBodyScaleReduxUpdatesModule then SetAvatarScales else nil
					}, { setAppliedDescription = p1.props.setAppliedDescription }, CatalogAnalytics)
					
					if ShouldManageBackground then
						if FFlagAXBackgroundSceneManagerRevamp then
							p1.backgroundSceneManager = BackgroundSceneManagerModule.new(Store, Networking, AvatarRoute, FFlagAXBackgroundsCycloramaVR and IsSpatial)
						else
							p1.backgroundSceneManager = BackgroundSceneManagerDEPRECATEDModule.new(Store, Networking, AvatarRoute, FFlagAXBackgroundsCycloramaVR and IsSpatial)
						end
					end
					if not AXDisableSaveManager2 then
						p1.saveManager = SaveManagerModule.new(Store, Networking, Analytics)
					end
					p1.finishedInitializing = true
					
					if p1.destroyed then
						p1:onDestroy()
						
						return
					else
						p1:updateManagers()
					end
				end)
				
				if not Success then
					MutedErrorFunction(`{Result} on page: {(function()
						-- upvalues: p1 (upval)
						if not p1.props.routeHistory or typeof(p1.props.routeHistory) ~= "table" then
							return `no route history got {typeof(p1.props.routeHistory)}`
						end
						local RouteHistoryEntry = p1.props.routeHistory[#p1.props.routeHistory]
						
						if RouteHistoryEntry and typeof(RouteHistoryEntry) == "table" then
							local RouteHistoryEntry1 = RouteHistoryEntry[#RouteHistoryEntry]
							
							return if RouteHistoryEntry1 and typeof(RouteHistoryEntry) == "table" then RouteHistoryEntry1.name else `no page, got {typeof(RouteHistoryEntry)}`
						else
							return `no route, got {typeof(RouteHistoryEntry)}`
						end
					end)()}, with receivedAvatarData: {p1.props.receivedAvatarData}`)
					
					return
				end
			else
				p1.characterMover = CharacterMoverModule.new(Store, AvatarExperienceAnalytics, AvatarRoute, InteractionEvents, p1.props.allowCameraMovements)
				p1.characterManager = CharacterManagerModule.new(Store, Networking, AppAnalytics, AvatarRoute, p1.characterMover, {
					bodyColorsChangedEvent = SetBodyColors,
					adjustmentChangedEvent = p1.props.setAdjustments,
					avatarScalesChangedEvent = if FFlagAXFixBodyScaleReduxUpdatesModule then SetAvatarScales else nil
				}, { setAppliedDescription = p1.props.setAppliedDescription }, CatalogAnalytics)
				
				if FFlagAXBackgroundSceneManagerRevamp then
					p1.backgroundSceneManager = BackgroundSceneManagerModule.new(Store, Networking, AvatarRoute, FFlagAXBackgroundsCycloramaVR and IsSpatial)
				else
					p1.backgroundSceneManager = BackgroundSceneManagerDEPRECATEDModule.new(Store, Networking, AvatarRoute, FFlagAXBackgroundsCycloramaVR and IsSpatial)
				end
				if not AXDisableSaveManager2 then
					p1.saveManager = SaveManagerModule.new(Store, Networking, Analytics)
				end
				p1.finishedInitializing = true
				
				if p1.destroyed then
					p1:onDestroy()
					
					return
				end
				p1:updateManagers()
			end
		end)
	end
end

local config = {
	[AvatarScreen.AvatarEditor] = true,
	[AvatarScreen.MySharedAvatars] = true,
	[AvatarScreen.Catalog] = true,
	[AvatarScreen.FavoritesSaved] = true,
	[AvatarScreen.AvatarExperienceLandingPage] = true,
	[AvatarScreen.AvatarBackground] = true,
	[AvatarScreen.AvatarExperienceRoot] = true,
	[AvatarScreen.ProfilePictureEditorEmotes] = true,
	[AvatarScreen.TryOnItem] = true,
	[AppPage.AvatarExperienceWrapper] = true,
	[AppPage.AvatarExperienceWrapperTransparent] = true,
	[SwitchTab.AvatarExperienceTab] = true
}

local function _(p1)
	-- upvalues: config (copy)
	return config[p1.name] or false
end

local function checkShouldRunManagers(p1): boolean
	-- upvalues: config (copy), AppPagePropertiesModule (copy)
	if not p1 then
		return false
	end
	for i = #p1, 1, -1 do
		local v1 = p1[i]
		
		if config[v1.name] or false then
			return true
		elseif AppPagePropertiesModule[v1.name] and AppPagePropertiesModule[v1.name].renderUnderlyingPage then
			continue
		else
			return false
		end
	end
	return false
end

function AvatarSceneManager.updateManagers(p2)
	-- upvalues: checkShouldRunManagers (copy)
	if not p2.finishedInitializing then return end
	local RouteHistory = p2.props.routeHistory
	local RouteHistoryEntry = RouteHistory[#RouteHistory]
	local IsVisible = if p2.props.shouldStart == nil then p2.props.avatarRoute.isVisible or checkShouldRunManagers(RouteHistoryEntry) else p2.props.shouldStart
	
	if IsVisible and not p2.running then
		p2:start()
		
		return
	end
	if not IsVisible and p2.running then
		p2:stop()
	end
end

function AvatarSceneManager.didMount(p2)
	p2:updateManagers()
end

function AvatarSceneManager.willUnmount(p2)
	-- upvalues: FFlagAXAvatarLoadWithRetry (copy)
	if FFlagAXAvatarLoadWithRetry and p2.modelLoadPromise then
		p2.modelLoadPromise:cancel()
	end
	if p2.running then
		p2:stop()
	end
	if p2.finishedInitializing then
		p2:onDestroy()
	end
	p2.destroyed = true
end

function AvatarSceneManager:callUpdateAvatarRoute(CharacterManager, AvatarRoute, AvatarRoute1)
	if CharacterManager then
		CharacterManager:updateAvatarRoute(AvatarRoute, AvatarRoute1)
	end
end

function AvatarSceneManager:callUpdateCategorySelection(CharacterMover)
	if CharacterMover then
		CharacterMover:updateCategorySelection()
	end
end

function AvatarSceneManager.shouldResetFullViewForPage(p2, p3): boolean
	-- upvalues: FullView (copy)
	return p2.props.fullView[p3] ~= nil and p2.props.fullView[p3] ~= FullView.None
end

function AvatarSceneManager.resetFullView(p2, Catalog)
	-- upvalues: ConstantsModule (copy), AvatarScreen (copy), GetFFlagCleanUpAXAlternativeLandingPageIXPModule (copy), FullView (copy)
	local FullViewPageDefault = ConstantsModule.FullViewPageDefaults[Catalog]
	
	if FullViewPageDefault == nil then return end
	if (Catalog == AvatarScreen.Catalog or Catalog == AvatarScreen.CatalogSearch) and p2.props.isPortrait then
		local NoIs10ftUI = if GetFFlagCleanUpAXAlternativeLandingPageIXPModule() then not p2.props.is10ftUI else p2.props.alternateAvatarLandingScreenFullscreenEnabled
		FullViewPageDefault = if NoIs10ftUI then FullView.UIFullView else FullView.None
	end
	if p2.props.fullView[Catalog] ~= FullViewPageDefault then
		p2.props.setFullView(p2.props.avatarExperienceAnalytics, Catalog, FullViewPageDefault)
	end
end

function AvatarSceneManager.onAvatarDataReady(p2)
	if p2.running then
		p2:maybeStartCharacterAndSaveManager()
		
		return
	end
	if p2.finishedInitializing then
		p2.characterManager:maybeInitializeModel(p2.props.store:getState())
	end
end

function AvatarSceneManager.didUpdate(p2, p3)
	-- upvalues: AXDisableSaveManager2 (copy)
	if p2.props.receivedAvatarData and not p3.receivedAvatarData then
		p2:onAvatarDataReady()
	end
	p2:updateManagers()
	local AvatarRoute = p2.props.avatarRoute
	local AvatarRoute1 = p3.avatarRoute
	
	if AvatarRoute ~= AvatarRoute1 then
		p2:callUpdateAvatarRoute(p2.characterMover, AvatarRoute, AvatarRoute1)
		
		if p2.backgroundSceneManager then
			p2:callUpdateAvatarRoute(p2.backgroundSceneManager, AvatarRoute, AvatarRoute1)
		end
		p2:callUpdateAvatarRoute(p2.characterManager, AvatarRoute, AvatarRoute1)
		
		if not AXDisableSaveManager2 then
			p2:callUpdateAvatarRoute(p2.saveManager, AvatarRoute, AvatarRoute1)
		end
	end
	local CatalogSubcategoryId = p3.catalogSubcategoryId
	local CatalogSubcategoryId1 = p2.props.catalogSubcategoryId
	local CatalogSearchCategoryId = p3.catalogSearchCategoryId
	local CatalogSearchCategoryId1 = p2.props.catalogSearchCategoryId
	local CatalogSearchSubcategoryId = p3.catalogSearchSubcategoryId
	local CatalogSearchSubcategoryId1 = p2.props.catalogSearchSubcategoryId
	
	if p2.props.catalogCategoryId ~= p3.catalogCategoryId or CatalogSubcategoryId1 ~= CatalogSubcategoryId or CatalogSearchCategoryId1 ~= CatalogSearchCategoryId or CatalogSearchSubcategoryId1 ~= CatalogSearchSubcategoryId then
		p2:callUpdateCategorySelection(p2.characterMover)
		p2:callUpdateAvatarRoute(p2.characterManager, AvatarRoute, AvatarRoute1)
	end
end

function AvatarSceneManager.render(p2)
	-- upvalues: RoactModule (copy), AvatarSceneSkyModule (copy)
	if not p2.props.renderSky then return end
	return RoactModule.createElement(AvatarSceneSkyModule)
end

function AvatarSceneManager.maybeStartCharacterAndSaveManager(p2)
	-- upvalues: AXDisableSaveManager2 (copy)
	if p2.characterManagerRunning or not p2.props.receivedAvatarData then return end
	p2.characterManager:start()
	
	if not AXDisableSaveManager2 then
		p2.saveManager:start()
	end
	p2.characterManagerRunning = true
end

function AvatarSceneManager.stopCharacterAndSaveManager(p2)
	-- upvalues: AXDisableSaveManager2 (copy)
	if not p2.characterManagerRunning then return end
	p2.characterManager:stop()
	
	if not AXDisableSaveManager2 then
		p2.saveManager:stop()
	end
	p2.characterManagerRunning = false
end

function AvatarSceneManager.start(p2)
	-- upvalues: AxScene (copy)
	AxScene:info("AvatarSceneManager:start()")
	
	if p2.running then return end
	if p2.backgroundSceneManager then
		p2.props.setThrottleFramerateEnabled(false)
		p2.backgroundSceneManager:start()
	end
	p2.running = true
	p2:maybeStartCharacterAndSaveManager()
	p2.characterMover:start()
	p2.props.setPageLoaded()
	p2.props.notificationService:ActionEnabled(Enum.AppShellActionType.AvatarEditorPageLoaded)
end

function AvatarSceneManager.stop(p2)
	-- upvalues: AxScene (copy)
	AxScene:info("AvatarSceneManager:stop()")
	
	if not p2.running then return end
	p2.props.setThrottleFramerateEnabled(true)
	p2.running = false
	p2:stopCharacterAndSaveManager()
	
	if p2.backgroundSceneManager then
		p2.backgroundSceneManager:stop()
	end
	p2.characterMover:stop()
end

function AvatarSceneManager.onDestroy(p2)
	-- upvalues: AXDisableSaveManager2 (copy)
	p2.characterManager:onDestroy()
	
	if p2.backgroundSceneManager then
		p2.backgroundSceneManager:onDestroy()
	end
	p2.characterMover:onDestroy()
	
	if not AXDisableSaveManager2 then
		p2.saveManager:onDestroy()
	end
end

local v2: (any) -> any = RoactRoduxModule.connect(function(p2, _)
	-- upvalues: SelectIsPortraitModule (copy), SelectHasAvatarDataModule (copy), FFlagSignalsNavP3gAvatarExperience (copy), FFlagUseNavigationSelectors (copy), Selectors (copy)
	return {
		isPortrait = SelectIsPortraitModule(p2),
		fullView = p2.AvatarExperience.Common.FullView,
		avatarPageLoaded = p2.AvatarExperience.AvatarEditor.PageLoaded,
		receivedAvatarData = SelectHasAvatarDataModule(p2),
		routeHistory = if FFlagSignalsNavP3gAvatarExperience then nil elseif FFlagUseNavigationSelectors then Selectors.selectLegacyHistory(p2) else p2.Navigation.history
	}
end, function(Callback)
	-- upvalues: SetPageLoadedModule (copy), SetFullViewModule (copy)
	return {
		setPageLoaded = function()
			-- upvalues: Callback (copy), SetPageLoadedModule (upval)
			Callback(SetPageLoadedModule(true))
		end,
		setFullView = function(p2, p3, p4)
			-- upvalues: Callback (copy), SetFullViewModule (upval)
			Callback(SetFullViewModule(p2, p3, p4))
		end
	}
end)((RoactServices.connect({
	catalogAnalytics = AnalyticsModule1,
	analytics = AnalyticsModule,
	appAnalytics = RoactAnalyticsModule,
	avatarExperienceAnalytics = AnalyticsModule2,
	networking = RoactNetworkingModule,
	notificationService = AppNotificationService
})(AvatarSceneManager)))

if FFlagSignalsNavP3gAvatarExperience then
	local v3 = v2
	
	v2 = function(p2)
		-- upvalues: GetLegacyNavigationStore (copy), UseSignalStateFunction (copy), ReactModule (copy), v3 (copy), CryoModule (copy)
		return ReactModule.createElement(v3, CryoModule.Dictionary.union(p2, {
			routeHistory = UseSignalStateFunction(GetLegacyNavigationStore(false).getHistory)
		}))
	end
end
local WithAppRouteModuleResult = WithAppRouteModule((WrapWithSceneInteractionEventsModule(v2)))

if not GetFFlagCleanUpAXAlternativeLandingPageIXPModule() and AXAlternateLandingPageIXPModule then
	WithAppRouteModuleResult = IxpUtilsModule.connectTestVariables({
		alternateAvatarLandingScreenFullscreenEnabled = AXAlternateLandingPageIXPModule.GetFullScreenEnabled
	})(WithAppRouteModuleResult)
end
local WithThrottleFramerateGivenPolicyModuleResult = WithThrottleFramerateGivenPolicyModule((RoactAppPolicy.connect(function(p2)
	return { allowCameraMovements = p2.getAllowCameraMovements() }
end)((AfterAvatarExperienceLoadedModule(WithAppRouteModuleResult, false)))))

return function(p2)
	-- upvalues: UseBodyDataEventsContextModule (copy), CryoModule (copy), UseAdjustmentDataEventsContextModule (copy), UseAppliedDescriptionCallbackContextModule (copy), GetCatalogCategoriesStoreModule (copy), UseSignalStateFunction (copy), GetFFlagCleanUpAXAlternativeLandingPageIXPModule (copy), UseUiModeInfoFunction (copy), UiMode (copy), ReactModule (copy), WithThrottleFramerateGivenPolicyModuleResult (ref)
	local JoinResult = CryoModule.Dictionary.join(UseAdjustmentDataEventsContextModule(), CryoModule.Dictionary.join(UseBodyDataEventsContextModule(), p2), (UseAppliedDescriptionCallbackContextModule()))
	local CatalogSelectionStore = GetCatalogCategoriesStoreModule.getCatalogSelectionStore()
	JoinResult.catalogCategoryId = UseSignalStateFunction(CatalogSelectionStore.selectedCategoryId)
	JoinResult.catalogSubcategoryId = UseSignalStateFunction(CatalogSelectionStore.selectedSubcategoryId)
	local CatalogSearchSelectionStore = GetCatalogCategoriesStoreModule.getCatalogSearchSelectionStore()
	JoinResult.catalogSearchCategoryId = UseSignalStateFunction(CatalogSearchSelectionStore.selectedCategoryId)
	JoinResult.catalogSearchSubcategoryId = UseSignalStateFunction(CatalogSearchSelectionStore.selectedSubcategoryId)
	
	if GetFFlagCleanUpAXAlternativeLandingPageIXPModule() then
		JoinResult.is10ftUI = UseUiModeInfoFunction().uiMode == UiMode.TenFoot
	end
	return ReactModule.createElement(WithThrottleFramerateGivenPolicyModuleResult, JoinResult)
end