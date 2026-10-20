local HttpService = game:GetService("HttpService")
local InExperienceContainer = script:FindFirstAncestor("InExperienceContainer")
local LocalizationService = game:GetService("LocalizationService")
local IXPService = game:GetService("IXPService")
local Parent = InExperienceContainer.Parent
local ReactModule = require(Parent.React)
local StyleProviderWithDefaultTheme = require(Parent.Style).StyleProviderWithDefaultTheme
local OpenWebviewModule = require(InExperienceContainer.Http.openWebview)
local RoactRoduxModule = require(Parent.RoactRodux)
local FetchingStatus = require(Parent.Http).Reducers.FetchingStatus
local RoactAnalytics = require(Parent.RoactServiceTags).RoactAnalytics
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local AppLinking = require(Parent.RoactServiceTags).AppLinking
local LinkingProtocol = require(Parent.LinkingProtocol).LinkingProtocol
local Analytics = require(Parent.Analytics).Analytics
local RequestInternalWrapperFunction = require(Parent.Http).NetworkLayers.requestInternalWrapper
local RoactServices = require(Parent.RoactServices).RoactServices
local ProviderContainer = require(Parent.RoactUtils).Components.ProviderContainer
local UseSelectedThemeFunction = require(Parent.RoactUtils).Hooks.useSelectedTheme
local RoactAppExperimentModule = require(Parent.RoactAppExperiment)
local RoactAppPolicy = require(Parent.UniversalAppPolicy).RoactAppPolicy
local AppFeaturePolicies = require(Parent.UniversalAppPolicy).AppFeaturePolicies
local Localization = require(Parent.RobloxAppLocales).Localization
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local UIBloxModule = require(Parent.UIBlox)
local SelectionCursorProvider = UIBloxModule.App.SelectionImage.SelectionCursorProvider
local CursorProvider = UIBloxModule.App.SelectionCursor.CursorProvider
local RoduxModule = require(Parent.Rodux)
local CountryCodeList = require(Parent.AuthCommon).Reducers.CountryCodeList
local CryoModule = require(Parent.Cryo)
local GetFFlagInExperienceContainerScreenSizeReducerFunction = require(Parent.SharedFlags).GetFFlagInExperienceContainerScreenSizeReducer
local SetScreenSizeModule = if GetFFlagInExperienceContainerScreenSizeReducerFunction() then require(InExperienceContainer.Actions.SetScreenSize) else nil
local GetFFlagInExperienceContainerAppLinkingFunction = require(Parent.SharedFlags).GetFFlagInExperienceContainerAppLinking
local GetFFlagInExperienceContainerRespectUserThemeFunction = require(Parent.SharedFlags).GetFFlagInExperienceContainerRespectUserTheme
local FFlagUseSignalsForCountryCodeList = require(Parent.SharedFlags).FFlagUseSignalsForCountryCodeList
local config = { reducer = {} }

return function(p1)
	-- upvalues: UseSelectedThemeFunction (copy), CryoModule (copy), config (copy), ReactModule (copy), RoduxModule (copy), FFlagUseSignalsForCountryCodeList (copy), CountryCodeList (copy), FetchingStatus (copy), GetFFlagInExperienceContainerScreenSizeReducerFunction (copy), SetScreenSizeModule (copy), StyleProviderWithDefaultTheme (copy), GetFFlagInExperienceContainerRespectUserThemeFunction (copy), RoactRoduxModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), RoactAppExperimentModule (copy), IXPService (copy), RoactAppPolicy (copy), AppFeaturePolicies (copy), RoactServices (copy), RoactAnalytics (copy), Analytics (copy), RoactNetworking (copy), RequestInternalWrapperFunction (copy), HttpService (copy), AppLinking (copy), GetFFlagInExperienceContainerAppLinkingFunction (copy), LinkingProtocol (copy), SelectionCursorProvider (copy), CursorProvider (copy), ProviderContainer (copy), OpenWebviewModule (copy)
	local UseSelectedThemeResult = UseSelectedThemeFunction()
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local OnlyResult = ReactModule.Children.only(UnionResult.children)
	local NewResult = RoduxModule.Store.new(RoduxModule.combineReducers(CryoModule.Dictionary.join({
		CountryCodeList = if FFlagUseSignalsForCountryCodeList then nil else CountryCodeList,
		FetchingStatus = FetchingStatus,
		ScreenSize = if GetFFlagInExperienceContainerScreenSizeReducerFunction() then RoduxModule.createReducer(Vector2.new(400, 400), {
			[SetScreenSizeModule.name] = function(_, p2)
				return p2.screenSize
			end
		}) else function(_, _): Vector2
			return Vector2.new(400, 400)
		end
	}, UnionResult.reducer)), nil, { RoduxModule.thunkMiddleware })
	local List = {}
	table.insert(List, {
		class = StyleProviderWithDefaultTheme,
		props = {
			withDarkTheme = not GetFFlagInExperienceContainerRespectUserThemeFunction() or UseSelectedThemeResult ~= "light"
		}
	})
	table.insert(List, {
		class = RoactRoduxModule.StoreProvider,
		props = { store = NewResult }
	})
	table.insert(List, {
		class = LocalizationProvider,
		props = {
			localization = Localization.new(LocalizationService.RobloxLocaleId)
		}
	})
	table.insert(List, {
		class = RoactAppExperimentModule.Provider,
		props = { value = IXPService }
	})
	table.insert(List, {
		class = RoactAppPolicy.Provider,
		props = { policy = { AppFeaturePolicies } }
	})
	table.insert(List, {
		class = RoactServices.ServiceProvider,
		props = {
			services = {
				[RoactAnalytics] = Analytics.new(),
				[RoactNetworking] = RequestInternalWrapperFunction(HttpService),
				[AppLinking] = if GetFFlagInExperienceContainerAppLinkingFunction() then LinkingProtocol.default else nil
			}
		}
	})
	table.insert(List, { class = SelectionCursorProvider })
	table.insert(List, { class = CursorProvider })
	
	return ReactModule.createElement(ProviderContainer, { providers = List }, {
		Child = ReactModule.cloneElement(OnlyResult, { showWebpage = OpenWebviewModule })
	})
end