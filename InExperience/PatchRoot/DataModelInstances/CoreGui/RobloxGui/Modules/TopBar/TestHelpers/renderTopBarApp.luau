local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local LocalizationService = game:GetService("LocalizationService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoduxModule = require(CorePackages.Packages.Rodux)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ReactSceneUnderstandingModule = require(CorePackages.Packages.ReactSceneUnderstanding)
local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local LocalizationProvider = require(CorePackages.Workspace.Packages.Localization).LocalizationProvider
local DesignTokenProvider = require(CorePackages.Workspace.Packages.Style).DesignTokenProvider
local UniversalAppPolicyModule = require(CorePackages.Workspace.Packages.UniversalAppPolicy)
local Parent = script.Parent.Parent
local MenuNavigationPromptTokenMapperModule = require(Parent.TokenMappers.MenuNavigationPromptTokenMapper)
local ReducerModule = require(Parent.Reducer)
local TopBarAppPolicyModule = require(Parent.TopBarAppPolicy)
local RoactAppPolicy = UniversalAppPolicyModule.RoactAppPolicy
local AppFeaturePolicies = UniversalAppPolicyModule.AppFeaturePolicies
local FFlagShowGameAgeRating = require(CorePackages.Workspace.Packages.SharedFlags).FFlagShowGameAgeRating
local Style = {
	themeName = "dark",
	fontName = "gotham",
	deviceType = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceType.Console
}

if not CoreGui.RobloxGui:FindFirstChild("SendNotificationInfo") then
	local SendNotificationInfo = Instance.new("BindableEvent")
	SendNotificationInfo.Name = "SendNotificationInfo"
	SendNotificationInfo.Parent = CoreGui.RobloxGui
end
return function(p1, p2)
	-- upvalues: RoduxModule (copy), ReducerModule (copy), RoactModule (copy), RoactRoduxModule (copy), FFlagShowGameAgeRating (copy), RoactAppPolicy (copy), TopBarAppPolicyModule (copy), AppFeaturePolicies (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), UIBloxModule (copy), Style (copy), DesignTokenProvider (copy), MenuNavigationPromptTokenMapperModule (copy), ReactSceneUnderstandingModule (copy)
	return RoactModule.mount(RoactModule.createElement(RoactRoduxModule.StoreProvider, {
		store = RoduxModule.Store.new(ReducerModule, nil, { RoduxModule.thunkMiddleware })
	}, {
		PolicyProvider = RoactModule.createElement(if FFlagShowGameAgeRating then RoactAppPolicy.Provider else TopBarAppPolicyModule.Provider, {
			policy = if FFlagShowGameAgeRating then { AppFeaturePolicies } else { TopBarAppPolicyModule.Mapper }
		}, {
			LocalizationProvider = RoactModule.createElement(LocalizationProvider, {
				localization = Localization.new(LocalizationService.RobloxLocaleId)
			}, {
				StyleProvider = RoactModule.createElement(UIBloxModule.App.Style.AppStyleProvider, { style = Style }, {
					DesignTokenProvider = RoactModule.createElement(DesignTokenProvider, {
						tokenMappers = {
							MenuNavigationPrompt = MenuNavigationPromptTokenMapperModule
						}
					}, {
						SceneAnalysisProvider = RoactModule.createElement(ReactSceneUnderstandingModule.SceneAnalysisProvider, {}, { TopBarApp = RoactModule.createElement(p1) })
					})
				})
			})
		})
	}), p2)
end