local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local LocalizationService = game:GetService("LocalizationService")
local RenderWithCoreScriptsStyleProviderModule = require(script.Parent.Common.renderWithCoreScriptsStyleProvider)
local ReactModule = require(CorePackages.Packages.React)
local RoduxModule = require(CorePackages.Packages.Rodux)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local CallProtocolModule = require(CorePackages.Workspace.Packages.CallProtocol)
local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local LocalizationProvider = require(CorePackages.Workspace.Packages.Localization).LocalizationProvider
local ApolloProvider = require(CorePackages.Packages.ApolloClient).ApolloProvider
local ApolloClientModule = require(CoreGui:WaitForChild("RobloxGui").Modules.ApolloClient)
local InitCallModule = require(script.initCall)
local ReducerModule = require(script.Reducer)
local ContactListAppModule = require(script.Components.ContactListApp)
local ContextModule = require(script.Context)
local AnalyticsModule = require(script.Analytics)
local Module = {}
Module.__index = Module

function Module.new()
	-- upvalues: Module (copy), AnalyticsModule (copy), InitCallModule (copy), CallProtocolModule (copy), ReactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), RoduxModule (copy), ReducerModule (copy), RoactRoduxModule (copy), RenderWithCoreScriptsStyleProviderModule (copy), ApolloProvider (copy), ApolloClientModule (copy), RoactModule (copy), ContextModule (copy), ContactListAppModule (copy), CoreGui (copy)
	local self = setmetatable({}, Module)
	local config = {
		fireAnalyticsEvent = AnalyticsModule.Analytics().fireAnalyticsEvent
	}
	InitCallModule(CallProtocolModule.CallProtocol.default)
	
	local function v21(App)
		-- upvalues: ReactModule (upval), LocalizationProvider (upval), Localization (upval), LocalizationService (upval)
		return ReactModule.createElement(LocalizationProvider, {
			localization = Localization.new(LocalizationService.RobloxLocaleId)
		}, { App = App })
	end
	
	self.store = RoduxModule.Store.new(ReducerModule, nil, { RoduxModule.thunkMiddleware })
	self.root = ReactModule.createElement("ScreenGui", {
		AutoLocalize = false,
		DisplayOrder = -1,
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Content = ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = self.store }, {
			ThemeProvider = RenderWithCoreScriptsStyleProviderModule({
				ApolloProvider = ReactModule.createElement(ApolloProvider, { client = ApolloClientModule }, {
					ContextProvider = RoactModule.createElement(ContextModule.Provider, { value = config }, {
						ContactListApp = v21(ReactModule.createElement(ContactListAppModule))
					})
				})
			})
		})
	})
	self.element = RoactModule.mount(self.root, CoreGui, "ContactList")
	
	return self
end

return Module.new()