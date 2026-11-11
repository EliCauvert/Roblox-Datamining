local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local CompleteExternalNavigationModule = require(Modules.AvatarExperience.Common.Actions.CompleteExternalNavigation)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local DeepLinkUtilsModule = require(Modules.AvatarExperience.Common.DeepLinkUtils)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local NavigatedToDeepLinkCatalogFilterModule = require(Modules.AvatarExperience.Catalog.Actions.NavigatedToDeepLinkCatalogFilter)
local NavigateToDeepLinkCatalogFilterThunkModule = require(Modules.AvatarExperience.Catalog.Thunks.NavigateToDeepLinkCatalogFilterThunk)
local NavigateToSearchModule = require(Modules.AvatarExperience.Catalog.Thunks.NavigateToSearch)
local TryOnLookV2Module = require(Modules.AvatarExperience.Common.Thunks.TryOnLookV2)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local FFlagEnableLookDetailsDeepLinkModule = require(Modules.LuaApp.Flags.FFlagEnableLookDetailsDeepLink)
local FFlagEnableProfilePictureEditorDeepLinkModule = require(Modules.LuaApp.Flags.FFlagEnableProfilePictureEditorDeepLink)
local FFlagAXFixPrefetchMarketplaceStartupCrash = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixPrefetchMarketplaceStartupCrash
local ExternalNavigationHandler = require(CorePackages.Packages.Roact).PureComponent:extend("ExternalNavigationHandler")
local AxRnExternalnav = require(CorePackages.Workspace.Packages.AppDebug).LogTree.logger("ax.rn.externalnav")

function ExternalNavigationHandler:render()
	return nil
end

function ExternalNavigationHandler.didMount(p1)
	p1:processNavigationRequest()
end

function ExternalNavigationHandler.didUpdate(p1, _)
	p1:processNavigationRequest()
end

local function editorCatalogSwitchAction(Catalog, Params)
	-- upvalues: RoactNavigationModule (copy), AvatarScreen (copy)
	return RoactNavigationModule.Actions.navigate({
		routeName = AvatarScreen.LandingPageSwitchNavigator,
		action = RoactNavigationModule.Actions.navigate({ routeName = Catalog, params = Params })
	})
end

local function itemDetailsAction(p1)
	-- upvalues: CryoModule (copy), RoactNavigationModule (copy), AvatarScreen (copy)
	return RoactNavigationModule.Actions.navigate({
		routeName = AvatarScreen.ItemDetails,
		params = CryoModule.Dictionary.join(CryoModule.Dictionary.join(p1, {
			category = CryoModule.None,
			subcategory = CryoModule.None,
			opaquePage = CryoModule.None
		}), { isFirstItemDetails = true })
	})
end

local function outfitDetailsAction(p1, IsPortrait)
	-- upvalues: RoactNavigationModule (copy), AvatarScreen (copy)
	return RoactNavigationModule.Actions.navigate({
		routeName = AvatarScreen.OutfitDetails,
		params = {
			ZIndex = 2,
			renderBottomBar = false,
			outfitId = p1.itemId,
			showFullWithNoPeekView = not IsPortrait
		}
	})
end

function ExternalNavigationHandler.processNavigationRequest(p1)
	local CompleteExternalNavigationFunction: (any) -> () = p1.props.completeExternalNavigation
	local ExternalNavigationRequest = p1.props.externalNavigationRequest
	
	if ExternalNavigationRequest.completedRequestId ~= ExternalNavigationRequest.requestId then
		CompleteExternalNavigationFunction(ExternalNavigationRequest.requestId)
		p1:navigateToScreen(ExternalNavigationRequest.screen, ExternalNavigationRequest.params)
	end
end

function ExternalNavigationHandler.navigateToScreen(p1, RouteName, Params)
	-- upvalues: AxRnExternalnav (copy), AvatarScreen (copy), RoactNavigationModule (copy), editorCatalogSwitchAction (copy), itemDetailsAction (copy), outfitDetailsAction (copy), FFlagEnableLookDetailsDeepLinkModule (copy), PeekViewState (copy), FFlagEnableProfilePictureEditorDeepLinkModule (copy), UtilsModule (copy), DeepLinkUtilsModule (copy)
	AxRnExternalnav:info("navigateToScreen: {}, params: {}", RouteName, Params)
	local Navigation = p1.props.navigation
	local IsPortrait = p1.props.isPortrait
	
	local function v32(Actions)
		-- upvalues: Navigation (copy), AvatarScreen (upval), RoactNavigationModule (upval)
		Navigation.navigate(AvatarScreen.AvatarExperienceMainStackNavigator, {}, RoactNavigationModule.StackActions.reset({ index = 2, actions = Actions }))
	end
	
	if RouteName == AvatarScreen.ItemDetails then
		v32({
			editorCatalogSwitchAction(if Params.opaquePage then Params.opaquePage else AvatarScreen.Catalog, {}),
			itemDetailsAction(Params)
		})
		
		return
	end
	if RouteName == AvatarScreen.OutfitDetails then
		v32({
			editorCatalogSwitchAction(AvatarScreen.AvatarEditor, {}),
			outfitDetailsAction(Params, IsPortrait)
		})
		
		return
	end
	if FFlagEnableLookDetailsDeepLinkModule and RouteName == AvatarScreen.LookDetails then
		p1.props.dispatchTryOnLookV2(p1.props.networking, p1.props.navigation, p1.props.catalogAnalytics, Params.itemId, PeekViewState.Full)
		v32({
			editorCatalogSwitchAction(AvatarScreen.Catalog, {}),
			RoactNavigationModule.Actions.navigate({ routeName = AvatarScreen.LookDetails })
		})
		
		return
	end
	if RouteName == AvatarScreen.LayeredClothingSort then
		v32({
			editorCatalogSwitchAction(AvatarScreen.Catalog, {}),
			RoactNavigationModule.Actions.navigate({ routeName = RouteName })
		})
		
		return
	end
	if RouteName == AvatarScreen.AvatarExperienceLandingPage or RouteName == AvatarScreen.AvatarEditor or FFlagEnableProfilePictureEditorDeepLinkModule and RouteName == AvatarScreen.ProfilePictureEditorEmotes then
		Navigation.navigate(RouteName)
		
		return
	end
	if UtilsModule.isAvatarBackground(RouteName) or RouteName == AvatarScreen.Catalog then
		Navigation.navigate(RouteName, Params)
		
		return
	end
	if RouteName == AvatarScreen.CatalogSearch then
		local config = { searchKeyword = Params.keyword }
		p1.props.applyDeepLinkCatalogFilters((DeepLinkUtilsModule.buildCatalogFilterFromDeepLinkParams(Params)))
		p1.props.navigateToSearch(p1.props.navigation, config)
		
		return
	else
		warn("[ExternalNavigationHandler] Invalid screen:", RouteName)
	end
end

local function mapStateToProps(p1, _)
	-- upvalues: SelectIsPortraitModule (copy)
	return {
		externalNavigationRequest = p1.AvatarExperience.ExternalNavigationRequest,
		isPortrait = SelectIsPortraitModule(p1)
	}
end

local function mapDispatchToProps(Callback)
	-- upvalues: CompleteExternalNavigationModule (copy), FFlagEnableLookDetailsDeepLinkModule (copy), TryOnLookV2Module (copy), FFlagAXFixPrefetchMarketplaceStartupCrash (copy), NavigateToDeepLinkCatalogFilterThunkModule (copy), NavigatedToDeepLinkCatalogFilterModule (copy), NavigateToSearchModule (copy)
	return {
		completeExternalNavigation = function(p1)
			-- upvalues: Callback (copy), CompleteExternalNavigationModule (upval)
			Callback(CompleteExternalNavigationModule(p1))
		end,
		dispatchTryOnLookV2 = if FFlagEnableLookDetailsDeepLinkModule then function(p1, p2, p3, p4, p5)
			-- upvalues: Callback (copy), TryOnLookV2Module (upval)
			Callback(TryOnLookV2Module(p1, p2, p3, p4, p5, 1))
		end else nil,
		applyDeepLinkCatalogFilters = function(p1)
			-- upvalues: FFlagAXFixPrefetchMarketplaceStartupCrash (upval), Callback (copy), NavigateToDeepLinkCatalogFilterThunkModule (upval), NavigatedToDeepLinkCatalogFilterModule (upval)
			if FFlagAXFixPrefetchMarketplaceStartupCrash then
				Callback(NavigateToDeepLinkCatalogFilterThunkModule(p1))
				
				return
			else
				Callback(NavigatedToDeepLinkCatalogFilterModule(p1))
			end
		end,
		navigateToSearch = function(p1, p2)
			-- upvalues: Callback (copy), NavigateToSearchModule (upval)
			return Callback(NavigateToSearchModule(p1, p2))
		end
	}
end

if FFlagEnableLookDetailsDeepLinkModule then
	ExternalNavigationHandler = RoactServices.connect({
		catalogAnalytics = AnalyticsModule,
		networking = RoactNetworkingModule
	})(ExternalNavigationHandler)
end
return (RoactRoduxModule.connect(mapStateToProps, mapDispatchToProps)(ExternalNavigationHandler))