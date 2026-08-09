local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local localizationService = game:GetService("LocalizationService")
local renderWithCoreScriptsStyleProviderModule = require(coreGuiService:WaitForChild("RobloxGui").Modules.Common.renderWithCoreScriptsStyleProvider)
local roactModule = require(corePackagesService.Packages.Roact)
local roduxModule = require(corePackagesService.Packages.Rodux)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local localizationProvider = require(corePackagesService.Workspace.Packages.Localization).LocalizationProvider
local foundationModule = require(corePackagesService.Packages.Foundation)
local avatarEditorPromptsAppModule = require(script.Components.AvatarEditorPromptsApp)
local reducerModule = require(script.Reducer)
local getGameNameModule = require(script.Thunks.GetGameName)
local avatarEditorPromptsPolicyModule = require(script.AvatarEditorPromptsPolicy)
local roactGlobalConfigModule = require(script.RoactGlobalConfig)
local connectAvatarEditorServiceEventsModule = require(script.ConnectAvatarEditorServiceEvents)
local fFlagAXAvatarTimeoutFlowIE = require(corePackagesService.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarTimeoutFlowIE
local t = {}
t.__index = t

function t.new() --[[ line: 33 ]]
	-- upvalues: t (ref), roactGlobalConfigModule (ref), roactModule (ref), roduxModule (ref), reducerModule (ref), getGameNameModule (ref), fFlagAXAvatarTimeoutFlowIE (ref), roactRoduxModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), foundationModule (ref), avatarEditorPromptsPolicyModule (ref), renderWithCoreScriptsStyleProviderModule (ref), avatarEditorPromptsAppModule (ref), coreGuiService (ref), connectAvatarEditorServiceEventsModule (ref)
	local tbl = setmetatable({}, t)
	
	if roactGlobalConfigModule.propValidation then
		roactModule.setGlobalConfig({ propValidation = true })
	end
	if roactGlobalConfigModule.elementTracing then
		roactModule.setGlobalConfig({ elementTracing = true })
	end
	tbl.store = roduxModule.Store.new(reducerModule, nil, { roduxModule.thunkMiddleware })
	tbl.store:dispatch(getGameNameModule)
	tbl.root = roactModule.createElement("Folder", { Name = "AvatarEditorPromptsApp" }, if fFlagAXAvatarTimeoutFlowIE then roactModule.createElement(roactRoduxModule.StoreProvider, { store = tbl.store }, {
		LocalizationProvider = roactModule.createElement(localizationProvider, {
			localization = localization.new(localizationService.RobloxLocaleId)
		}, {
			FoundationProvider = roactModule.createElement(foundationModule.FoundationProvider, { theme = foundationModule.Enums.Theme.Dark }, {
				PolicyProvider = roactModule.createElement(avatarEditorPromptsPolicyModule.Provider, { policy = { avatarEditorPromptsPolicyModule.Mapper } }, {
					ThemeProvider = renderWithCoreScriptsStyleProviderModule({
						AvatarEditorPromptsApp = roactModule.createElement(avatarEditorPromptsAppModule)
					})
				})
			})
		})
	}) else roactModule.createElement(roactRoduxModule.StoreProvider, { store = tbl.store }, {
		PolicyProvider = roactModule.createElement(avatarEditorPromptsPolicyModule.Provider, { policy = { avatarEditorPromptsPolicyModule.Mapper } }, {
			ThemeProvider = renderWithCoreScriptsStyleProviderModule({
				AvatarEditorPromptsApp = roactModule.createElement(avatarEditorPromptsAppModule)
			})
		})
	}))
	tbl.element = roactModule.mount(tbl.root, coreGuiService, "AvatarEditorPrompts")
	tbl.serviceConnections = connectAvatarEditorServiceEventsModule(tbl.store)
	
	return tbl
end

return t.new()