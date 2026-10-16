local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local LocalizationService = game:GetService("LocalizationService")
local RenderWithCoreScriptsStyleProviderModule = require(CoreGui:WaitForChild("RobloxGui").Modules.Common.renderWithCoreScriptsStyleProvider)
local RoactModule = require(CorePackages.Packages.Roact)
local RoduxModule = require(CorePackages.Packages.Rodux)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local LocalizationProvider = require(CorePackages.Workspace.Packages.Localization).LocalizationProvider
local FoundationModule = require(CorePackages.Packages.Foundation)
local AvatarEditorPromptsAppModule = require(script.Components.AvatarEditorPromptsApp)
local ReducerModule = require(script.Reducer)
local GetGameNameModule = require(script.Thunks.GetGameName)
local AvatarEditorPromptsPolicyModule = require(script.AvatarEditorPromptsPolicy)
local RoactGlobalConfigModule = require(script.RoactGlobalConfig)
local ConnectAvatarEditorServiceEventsModule = require(script.ConnectAvatarEditorServiceEvents)
local Module = {}
Module.__index = Module

function Module.new() --[[ Line: 30 ]]
	-- upvalues: Module (copy), RoactGlobalConfigModule (copy), RoactModule (copy), RoduxModule (copy), ReducerModule (copy), GetGameNameModule (copy), RoactRoduxModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), FoundationModule (copy), AvatarEditorPromptsPolicyModule (copy), RenderWithCoreScriptsStyleProviderModule (copy), AvatarEditorPromptsAppModule (copy), CoreGui (copy), ConnectAvatarEditorServiceEventsModule (copy)
	local self = setmetatable({}, Module)
	
	if RoactGlobalConfigModule.propValidation then
		RoactModule.setGlobalConfig({ propValidation = true })
	end
	if RoactGlobalConfigModule.elementTracing then
		RoactModule.setGlobalConfig({ elementTracing = true })
	end
	self.store = RoduxModule.Store.new(ReducerModule, nil, { RoduxModule.thunkMiddleware })
	self.store:dispatch(GetGameNameModule)
	self.root = RoactModule.createElement("Folder", { Name = "AvatarEditorPromptsApp" }, (RoactModule.createElement(RoactRoduxModule.StoreProvider, { store = self.store }, {
		LocalizationProvider = RoactModule.createElement(LocalizationProvider, {
			localization = Localization.new(LocalizationService.RobloxLocaleId)
		}, {
			FoundationProvider = RoactModule.createElement(FoundationModule.FoundationProvider, { colorMode = FoundationModule.Enums.ColorMode.Dark }, {
				PolicyProvider = RoactModule.createElement(AvatarEditorPromptsPolicyModule.Provider, { policy = { AvatarEditorPromptsPolicyModule.Mapper } }, {
					ThemeProvider = RenderWithCoreScriptsStyleProviderModule({
						AvatarEditorPromptsApp = RoactModule.createElement(AvatarEditorPromptsAppModule)
					})
				})
			})
		})
	})))
	self.element = RoactModule.mount(self.root, CoreGui, "AvatarEditorPrompts")
	self.serviceConnections = ConnectAvatarEditorServiceEventsModule(self.store)
	
	return self
end

return Module.new()