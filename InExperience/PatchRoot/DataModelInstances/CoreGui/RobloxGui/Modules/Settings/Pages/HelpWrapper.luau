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
local BuilderIconsModule = require(CorePackages.Packages.BuilderIcons)
local Uiblox = BuilderIconsModule.Migration.uiblox
local SignalsModule = require(CorePackages.Packages.Signals)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local FFlagRefactorHelpPage = HelpPageModule.Flags.FFlagRefactorHelpPage
local Constants = nil
local Utils = nil

if FFlagRefactorHelpPage then
	Utils = require(Modules.Settings.Integrations).Utils
	Constants = HelpPageModule.Constants
end
local Root = nil
local Signal, Signal2 = SignalsModule.createSignal(false)

local function createHelpPage() --[[ Line: 45 ]]
	-- upvalues: SettingsPageFactoryModule (copy), Constants (ref), Uiblox (copy), BuilderIconsModule (copy), NewResult (copy), Root (ref), SignalsReactModule (copy), Signal (copy), ReactModule (copy), FoundationProvider (copy), FoundationModule (copy), Utils (ref), LocalizationProvider (copy), HelpReactView (copy), ReactRobloxModule (copy), Signal2 (copy)
	local NewPage = SettingsPageFactoryModule:CreateNewPage()
	NewPage.TabHeader.Name = Constants.HELP_PAGE.TAB_HEADER.NAME
	NewPage.Page.Name = "Help"
	local UibloxEntry = Uiblox[Constants.HELP_PAGE.TAB_HEADER.ICON]
	NewPage.TabHeader.TabLabel.Icon.Text = UibloxEntry.name
	NewPage.TabHeader.TabLabel.Icon.FontFace = BuilderIconsModule.Font[UibloxEntry.variant]
	NewPage.TabHeader.TabLabel.Title.Text = NewResult:Format(Constants.HELP_PAGE.TAB_HEADER.TEXT)
	NewPage.Page:ClearAllChildren()
	
	local function _() --[[ Line: 59 | Named "createReactTree" ]]
		-- upvalues: Root (upval), SignalsReactModule (upval), Signal (upval), ReactModule (upval), FoundationProvider (upval), FoundationModule (upval), Utils (upval), LocalizationProvider (upval), NewResult (upval), HelpReactView (upval), ReactRobloxModule (upval), NewPage (copy)
		if Root then return end
		local function v25() --[[ Line: 64 ]]
			-- upvalues: SignalsReactModule (upval), Signal (upval), ReactModule (upval), FoundationProvider (upval), FoundationModule (upval), Utils (upval), LocalizationProvider (upval), NewResult (upval), HelpReactView (upval)
			return if SignalsReactModule.useSignalState(Signal) then ReactModule.createElement(FoundationProvider, {
				colorMode = FoundationModule.Enums.ColorMode.Dark,
				device = Utils.getDeviceType()
			}, {
				Child = ReactModule.createElement(LocalizationProvider, { localization = NewResult }, { Root = ReactModule.createElement(HelpReactView) })
			}) else nil
		end
		
		Root = ReactRobloxModule.createRoot(NewPage.Page)
		
		if Root then
			Root:render(ReactModule.createElement(v25))
		end
	end
	
	NewPage.Displayed.Event:Connect(function() --[[ Line: 87 ]]
		-- upvalues: Root (upval), SignalsReactModule (upval), Signal (upval), ReactModule (upval), FoundationProvider (upval), FoundationModule (upval), Utils (upval), LocalizationProvider (upval), NewResult (upval), HelpReactView (upval), ReactRobloxModule (upval), NewPage (copy), Signal2 (upval)
		if not Root then
			local function v26() --[[ Line: 64 ]]
				-- upvalues: SignalsReactModule (upval), Signal (upval), ReactModule (upval), FoundationProvider (upval), FoundationModule (upval), Utils (upval), LocalizationProvider (upval), NewResult (upval), HelpReactView (upval)
				return if SignalsReactModule.useSignalState(Signal) then ReactModule.createElement(FoundationProvider, {
					colorMode = FoundationModule.Enums.ColorMode.Dark,
					device = Utils.getDeviceType()
				}, {
					Child = ReactModule.createElement(LocalizationProvider, { localization = NewResult }, { Root = ReactModule.createElement(HelpReactView) })
				}) else nil
			end
			
			Root = ReactRobloxModule.createRoot(NewPage.Page)
			
			if Root then
				Root:render(ReactModule.createElement(v26))
			end
		end
		Signal2(true)
		
		if NewPage.HubRef.VersionContainer then
			NewPage.HubRef.VersionContainer.Visible = true
		end
	end)
	NewPage.Hidden.Event:Connect(function() --[[ Line: 96 ]]
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