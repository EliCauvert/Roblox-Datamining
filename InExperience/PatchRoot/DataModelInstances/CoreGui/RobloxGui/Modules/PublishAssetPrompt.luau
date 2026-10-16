local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local LocalizationService = game:GetService("LocalizationService")
local RenderWithCoreScriptsStyleProviderModule = require(script.Parent.Common.renderWithCoreScriptsStyleProvider)
local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local LocalizationProvider = require(CorePackages.Workspace.Packages.Localization).LocalizationProvider
local RoactModule = require(CorePackages.Packages.Roact)
local RoduxModule = require(CorePackages.Packages.Rodux)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local PublishAssetPromptAppModule = require(script.Components.PublishAssetPromptApp)
local ReducerModule = require(script.Reducer)
local ConnectAssetServiceEventsModule = require(script.ConnectAssetServiceEvents)
local Module = {}
Module.__index = Module

function Module.new() --[[ Line: 24 ]]
	-- upvalues: Module (copy), RoactModule (copy), PublishAssetPromptAppModule (copy), RoduxModule (copy), ReducerModule (copy), RoactRoduxModule (copy), RenderWithCoreScriptsStyleProviderModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), CoreGui (copy), ConnectAssetServiceEventsModule (copy)
	local self = setmetatable({}, Module)
	local Element = RoactModule.createElement(PublishAssetPromptAppModule)
	self.store = RoduxModule.Store.new(ReducerModule, nil, { RoduxModule.thunkMiddleware })
	self.root = RoactModule.createElement("Folder", { Name = "PublishAssetPrompt" }, (RoactModule.createElement(RoactRoduxModule.StoreProvider, { store = self.store }, {
		ThemeProvider = RenderWithCoreScriptsStyleProviderModule({
			LocalizationProvider = RoactModule.createElement(LocalizationProvider, {
				localization = Localization.new(LocalizationService.RobloxLocaleId)
			}, { PublishAssetPromptApp = Element })
		})
	})))
	self.element = RoactModule.mount(self.root, CoreGui, "PublishAssetPrompt")
	self.serviceConnections = ConnectAssetServiceEventsModule(self.store)
	
	return self
end

return Module.new()