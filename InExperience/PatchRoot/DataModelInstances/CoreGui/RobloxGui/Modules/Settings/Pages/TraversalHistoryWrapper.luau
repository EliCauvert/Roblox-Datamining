local corePackagesService = game:GetService("CorePackages")
local localizationService = game:GetService("LocalizationService")
local settings = script:FindFirstAncestor("Settings")
local reactModule = require(corePackagesService.Packages.React)
local reactRobloxModule = require(corePackagesService.Packages.ReactRoblox)
local foundationModule = require(corePackagesService.Packages.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local localizationProvider = require(corePackagesService.Workspace.Packages.Localization).LocalizationProvider
local constantsModule = require(settings.Integrations.Constants)
local traversalHistoryPageModule = require(settings.Components.Traversal.TraversalHistoryPage)
local settingsPageFactoryModule = require(settings.SettingsPageFactory)
local utilsModule = require(settings.Integrations.Utils)
local isSideSheetEnabledModule = require(corePackagesService.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)

return function()
	-- upvalues: localization (ref), localizationService (ref), settingsPageFactoryModule (ref), constantsModule (ref), isSideSheetEnabledModule (ref), reactRobloxModule (ref), reactModule (ref), foundationProvider (ref), foundationModule (ref), utilsModule (ref), localizationProvider (ref), traversalHistoryPageModule (ref)
	local var1 = localization.new(localizationService.RobloxLocaleId)
	local traversalHistoryPage = settingsPageFactoryModule:CreateNewPage()
	traversalHistoryPage.Page:ClearAllChildren()
	traversalHistoryPage.Page.Name = "TraversalHistoryPage"
	traversalHistoryPage.TabHeader.Name = constantsModule.TRAVERSAL_HISTORY.TAB_HEADER.NAME
	traversalHistoryPage.TabHeader.TabLabel.Title.AutoLocalize = false
	traversalHistoryPage.TabHeader.TabLabel.Title.Text = var1:Format(constantsModule.TRAVERSAL_HISTORY.TAB_HEADER.TEXT_KEY)
	traversalHistoryPage.PageListLayout.Parent = nil
	traversalHistoryPage.ShouldShowBottomBar = not isSideSheetEnabledModule
	traversalHistoryPage.ShouldShowHubBar = true
	traversalHistoryPage.Page.Size = UDim2.fromScale(1, 0)
	reactRobloxModule.createRoot(traversalHistoryPage.Page):render(reactModule.createElement(foundationProvider, {
		colorMode = foundationModule.Enums.ColorMode.Dark,
		device = utilsModule.getDeviceType()
	}, {
		Localization = reactModule.createElement(localizationProvider, { localization = var1 }, {
			Page = reactModule.createElement(traversalHistoryPageModule)
		})
	}))
	
	return traversalHistoryPage
end