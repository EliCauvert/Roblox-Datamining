local httpService = game:GetService("HttpService")
local inExperienceContainer = script:FindFirstAncestor("InExperienceContainer")
local localizationService = game:GetService("LocalizationService")
local IXPService = game:GetService("IXPService")
local parent = inExperienceContainer.Parent
local reactModule = require(parent.React)
local styleProviderWithDefaultTheme = require(parent.Style).StyleProviderWithDefaultTheme
local openWebviewModule = require(inExperienceContainer.Http.openWebview)
local roactRoduxModule = require(parent.RoactRodux)
local fetchingStatus = require(parent.Http).Reducers.FetchingStatus
local roactAnalytics = require(parent.RoactServiceTags).RoactAnalytics
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local appLinking = require(parent.RoactServiceTags).AppLinking
local linkingProtocol = require(parent.LinkingProtocol).LinkingProtocol
local analytics = require(parent.Analytics).Analytics
local requestInternalWrapper = require(parent.Http).NetworkLayers.requestInternalWrapper
local roactServices = require(parent.RoactServices).RoactServices
local providerContainer = require(parent.RoactUtils).Components.ProviderContainer
local useSelectedTheme = require(parent.RoactUtils).Hooks.useSelectedTheme
local roactAppExperimentModule = require(parent.RoactAppExperiment)
local roactAppPolicy = require(parent.UniversalAppPolicy).RoactAppPolicy
local appFeaturePolicies = require(parent.UniversalAppPolicy).AppFeaturePolicies
local localization = require(parent.RobloxAppLocales).Localization
local localizationProvider = require(parent.Localization).LocalizationProvider
local UIBloxModule = require(parent.UIBlox)
local selectionCursorProvider = UIBloxModule.App.SelectionImage.SelectionCursorProvider
local cursorProvider = UIBloxModule.App.SelectionCursor.CursorProvider
local roduxModule = require(parent.Rodux)
local countryCodeList = require(parent.AuthCommon).Reducers.CountryCodeList
local cryoModule = require(parent.Cryo)
local getFFlagInExperienceContainerScreenSizeReducer = require(parent.SharedFlags).GetFFlagInExperienceContainerScreenSizeReducer
local var1 = if getFFlagInExperienceContainerScreenSizeReducer() then require(inExperienceContainer.Actions.SetScreenSize) else nil
local getFFlagInExperienceContainerAppLinking = require(parent.SharedFlags).GetFFlagInExperienceContainerAppLinking
local getFFlagInExperienceContainerRespectUserTheme = require(parent.SharedFlags).GetFFlagInExperienceContainerRespectUserTheme
local fFlagUseSignalsForCountryCodeList = require(parent.SharedFlags).FFlagUseSignalsForCountryCodeList
local t = { reducer = {} }

return function(p1)
	-- upvalues: useSelectedTheme (ref), cryoModule (ref), t (ref), reactModule (ref), roduxModule (ref), fFlagUseSignalsForCountryCodeList (ref), countryCodeList (ref), fetchingStatus (ref), getFFlagInExperienceContainerScreenSizeReducer (ref), var1 (ref), styleProviderWithDefaultTheme (ref), getFFlagInExperienceContainerRespectUserTheme (ref), roactRoduxModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), roactAppExperimentModule (ref), IXPService (ref), roactAppPolicy (ref), appFeaturePolicies (ref), roactServices (ref), roactAnalytics (ref), analytics (ref), roactNetworking (ref), requestInternalWrapper (ref), httpService (ref), appLinking (ref), getFFlagInExperienceContainerAppLinking (ref), linkingProtocol (ref), selectionCursorProvider (ref), cursorProvider (ref), providerContainer (ref), openWebviewModule (ref)
	local isNotLight
	local var2 = useSelectedTheme()
	local var3 = cryoModule.Dictionary.union(t, p1)
	local var4 = reactModule.Children.only(var3.children)
	local var5 = roduxModule.Store.new(roduxModule.combineReducers(cryoModule.Dictionary.join({
		CountryCodeList = if fFlagUseSignalsForCountryCodeList then nil else countryCodeList,
		FetchingStatus = fetchingStatus,
		ScreenSize = if getFFlagInExperienceContainerScreenSizeReducer() then roduxModule.createReducer(Vector2.new(400, 400), {
			[var1.name] = function(_, p2)
				return p2.screenSize
			end
		}) else function(_, _)
			return Vector2.new(400, 400)
		end
	}, var3.reducer)), nil, { roduxModule.thunkMiddleware })
	local t_1 = {}
	local t_2 = { class = styleProviderWithDefaultTheme }
	local t_3 = {}
	
	if getFFlagInExperienceContainerRespectUserTheme() then
		isNotLight = var2 ~= "light"
		isNotLight = nil
	else
		isNotLight = true
	end
	t_3.withDarkTheme = isNotLight
	t_2.props = t_3
	table.insert(t_1, t_2)
	table.insert(t_1, {
		class = roactRoduxModule.StoreProvider,
		props = { store = var5 }
	})
	table.insert(t_1, {
		class = localizationProvider,
		props = {
			localization = localization.new(localizationService.RobloxLocaleId)
		}
	})
	table.insert(t_1, {
		class = roactAppExperimentModule.Provider,
		props = { value = IXPService }
	})
	table.insert(t_1, {
		class = roactAppPolicy.Provider,
		props = { policy = { appFeaturePolicies } }
	})
	table.insert(t_1, {
		class = roactServices.ServiceProvider,
		props = {
			services = {
				[roactAnalytics] = analytics.new(),
				[roactNetworking] = requestInternalWrapper(httpService),
				[appLinking] = if getFFlagInExperienceContainerAppLinking() then linkingProtocol.default else nil
			}
		}
	})
	table.insert(t_1, { class = selectionCursorProvider })
	table.insert(t_1, { class = cursorProvider })
	
	return reactModule.createElement(providerContainer, { providers = t_1 }, {
		Child = reactModule.cloneElement(var4, { showWebpage = openWebviewModule })
	})
end