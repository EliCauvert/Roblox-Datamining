local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules
local HelpPageModule = require(CorePackages.Workspace.Packages.HelpPage)
local HelpReactView = HelpPageModule.HelpReactView
local SettingsPageFactoryModule = require(Modules.Settings.SettingsPageFactory)
local NewResult = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)
local LocalizationProvider = require(CorePackages.Workspace.Packages.Localization).LocalizationProvider
local ReactModule = require(CorePackages.Packages.React)
local ReactRobloxModule = require(CorePackages.Packages.ReactRoblox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local IconName = FoundationModule.Enums.IconName
local IconVariant = FoundationModule.Enums.IconVariant
local BuilderIconsModule = require(CorePackages.Packages.BuilderIcons)
local Uiblox = BuilderIconsModule.Migration.uiblox
local SignalsModule = require(CorePackages.Packages.Signals)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local FFlagRefactorHelpPage = HelpPageModule.Flags.FFlagRefactorHelpPage
local FFlagRenameHelpToControls = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameHelpToControls
local Constants = nil
local Utils = nil

if FFlagRefactorHelpPage then
	Utils = require(Modules.Settings.Integrations).Utils
	Constants = HelpPageModule.Constants
end
local Root = nil
local Signal, Signal2 = SignalsModule.createSignal(false)

local function v24()
	-- upvalues: SignalsReactModule (copy), Signal (copy), ReactModule (copy), FoundationProvider (copy), FoundationModule (copy), Utils (ref), LocalizationProvider (copy), NewResult (copy), HelpReactView (copy)
	return if SignalsReactModule.useSignalState(Signal) then ReactModule.createElement(FoundationProvider, {
		colorMode = FoundationModule.Enums.ColorMode.Dark,
		device = Utils.getDeviceType()
	}, {
		Child = ReactModule.createElement(LocalizationProvider, { localization = NewResult }, { Root = ReactModule.createElement(HelpReactView) })
	}) else nil
end

local function _(p1)
	-- upvalues: Root (ref), ReactRobloxModule (copy), ReactModule (copy), v24 (copy)
	if Root then return end
	Root = ReactRobloxModule.createRoot(p1)
	
	if Root then
		Root:render(ReactModule.createElement(v24))
	end
end

local function createHelpPage()
	-- upvalues: SettingsPageFactoryModule (copy), Constants (ref), FFlagRenameHelpToControls (copy), IconName (copy), BuilderIconsModule (copy), IconVariant (copy), Uiblox (copy), NewResult (copy), Root (ref), ReactRobloxModule (copy), ReactModule (copy), v24 (copy), Signal2 (copy)
	local NewPage = SettingsPageFactoryModule:CreateNewPage()
	NewPage.TabHeader.Name = Constants.HELP_PAGE.TAB_HEADER.NAME
	NewPage.Page.Name = "Help"
	
	if FFlagRenameHelpToControls then
		NewPage.TabHeader.TabLabel.Icon.Text = IconName.Controller
		NewPage.TabHeader.TabLabel.Icon.FontFace = BuilderIconsModule.Font[IconVariant.Regular]
	else
		local UibloxEntry = Uiblox[Constants.HELP_PAGE.TAB_HEADER.ICON]
		NewPage.TabHeader.TabLabel.Icon.Text = UibloxEntry.name
		NewPage.TabHeader.TabLabel.Icon.FontFace = BuilderIconsModule.Font[UibloxEntry.variant]
	end
	NewPage.TabHeader.TabLabel.Title.Text = NewResult:Format(Constants.HELP_PAGE.TAB_HEADER.TEXT)
	NewPage.Page:ClearAllChildren()
	NewPage.Displayed.Event:Connect(function()
		-- upvalues: NewPage (copy), Root (upval), ReactRobloxModule (upval), ReactModule (upval), v24 (upval), Signal2 (upval)
		local Page = NewPage.Page
		
		if not Root then
			Root = ReactRobloxModule.createRoot(Page)
			
			if Root then
				Root:render(ReactModule.createElement(v24))
			end
		end
		Signal2(true)
		
		if NewPage.HubRef.VersionContainer then
			NewPage.HubRef.VersionContainer.Visible = true
		end
	end)
	NewPage.Hidden.Event:Connect(function()
		-- upvalues: Signal2 (upval), NewPage (copy)
		Signal2(false)
		
		if NewPage.HubRef.VersionContainer then
			NewPage.HubRef.VersionContainer.Visible = false
		end
	end)
	NewPage.Page.Size = UDim2.fromScale(1, 0)
	NewPage.Page.AutomaticSize = Enum.AutomaticSize.Y
	
	return NewPage
end

return if FFlagRefactorHelpPage then createHelpPage() else require(Modules.Settings.Pages.Help)