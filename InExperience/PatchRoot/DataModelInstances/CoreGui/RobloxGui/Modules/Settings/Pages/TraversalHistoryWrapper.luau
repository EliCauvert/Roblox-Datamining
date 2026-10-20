local CorePackages = game:GetService("CorePackages")
local LocalizationService = game:GetService("LocalizationService")
local Settings = script:FindFirstAncestor("Settings")
local ReactModule = require(CorePackages.Packages.React)
local ReactRobloxModule = require(CorePackages.Packages.ReactRoblox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local LocalizationProvider = require(CorePackages.Workspace.Packages.Localization).LocalizationProvider
local ConstantsModule = require(Settings.Integrations.Constants)
local TraversalHistoryPageModule = require(Settings.Components.Traversal.TraversalHistoryPage)
local SettingsPageFactoryModule = require(Settings.SettingsPageFactory)
local UtilsModule = require(Settings.Integrations.Utils)
local IsSideSheetEnabledModule = require(CorePackages.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)

return function()
	-- upvalues: Localization (copy), LocalizationService (copy), SettingsPageFactoryModule (copy), ConstantsModule (copy), IsSideSheetEnabledModule (copy), ReactRobloxModule (copy), ReactModule (copy), FoundationProvider (copy), FoundationModule (copy), UtilsModule (copy), LocalizationProvider (copy), TraversalHistoryPageModule (copy)
	local NewLocalization = Localization.new(LocalizationService.RobloxLocaleId)
	local NewPage = SettingsPageFactoryModule:CreateNewPage()
	NewPage.Page:ClearAllChildren()
	NewPage.Page.Name = "TraversalHistoryPage"
	NewPage.TabHeader.Name = ConstantsModule.TRAVERSAL_HISTORY.TAB_HEADER.NAME
	NewPage.TabHeader.TabLabel.Title.AutoLocalize = false
	NewPage.TabHeader.TabLabel.Title.Text = NewLocalization:Format(ConstantsModule.TRAVERSAL_HISTORY.TAB_HEADER.TEXT_KEY)
	NewPage.PageListLayout.Parent = nil
	NewPage.ShouldShowBottomBar = not IsSideSheetEnabledModule
	NewPage.ShouldShowHubBar = true
	NewPage.Page.Size = UDim2.fromScale(1, 0)
	ReactRobloxModule.createRoot(NewPage.Page):render(ReactModule.createElement(FoundationProvider, {
		colorMode = FoundationModule.Enums.ColorMode.Dark,
		device = UtilsModule.getDeviceType()
	}, {
		Localization = ReactModule.createElement(LocalizationProvider, { localization = NewLocalization }, {
			Page = ReactModule.createElement(TraversalHistoryPageModule)
		})
	}))
	
	return NewPage
end