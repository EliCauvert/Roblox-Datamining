local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local localizationService = game:GetService("LocalizationService")
local renderWithCoreScriptsStyleProviderModule = require(script.Parent.Common.renderWithCoreScriptsStyleProvider)
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local localizationProvider = require(corePackagesService.Workspace.Packages.Localization).LocalizationProvider
local roactModule = require(corePackagesService.Packages.Roact)
local roduxModule = require(corePackagesService.Packages.Rodux)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local publishAssetPromptAppModule = require(script.Components.PublishAssetPromptApp)
local reducerModule = require(script.Reducer)
local connectAssetServiceEventsModule = require(script.ConnectAssetServiceEvents)
local t = {}
t.__index = t

function t.new() --[[ line: 24 ]]
	-- upvalues: t (ref), roactModule (ref), publishAssetPromptAppModule (ref), roduxModule (ref), reducerModule (ref), roactRoduxModule (ref), renderWithCoreScriptsStyleProviderModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), coreGuiService (ref), connectAssetServiceEventsModule (ref)
	local tbl = setmetatable({}, t)
	local var12 = roactModule.createElement(publishAssetPromptAppModule)
	tbl.store = roduxModule.Store.new(reducerModule, nil, { roduxModule.thunkMiddleware })
	tbl.root = roactModule.createElement("Folder", { Name = "PublishAssetPrompt" }, roactModule.createElement(roactRoduxModule.StoreProvider, { store = tbl.store }, {
		ThemeProvider = renderWithCoreScriptsStyleProviderModule({
			LocalizationProvider = roactModule.createElement(localizationProvider, {
				localization = localization.new(localizationService.RobloxLocaleId)
			}, { PublishAssetPromptApp = var12 })
		})
	}))
	tbl.element = roactModule.mount(tbl.root, coreGuiService, "PublishAssetPrompt")
	tbl.serviceConnections = connectAssetServiceEventsModule(tbl.store)
	
	return tbl
end

return t.new()