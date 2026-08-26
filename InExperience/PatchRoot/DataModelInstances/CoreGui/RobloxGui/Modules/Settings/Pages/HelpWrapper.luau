local corePackagesService = game:GetService("CorePackages")
local localizationService = game:GetService("LocalizationService")
local modules = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules
local helpPageModule = require(corePackagesService.Workspace.Packages.HelpPage)
local helpReactView = helpPageModule.HelpReactView
local settingsPageFactoryModule = require(modules.Settings.SettingsPageFactory)
local var1 = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization.new(localizationService.RobloxLocaleId)
local localizationProvider = require(corePackagesService.Workspace.Packages.Localization).LocalizationProvider
local reactModule = require(corePackagesService.Packages.React)
local reactRobloxModule = require(corePackagesService.Packages.ReactRoblox)
local foundationModule = require(corePackagesService.Packages.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local builderIconsModule = require(corePackagesService.Packages.BuilderIcons)
local uiblox = builderIconsModule.Migration.uiblox
local signalsModule = require(corePackagesService.Packages.Signals)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local fFlagRefactorHelpPage = helpPageModule.Flags.FFlagRefactorHelpPage
local _ = nil
local constants = nil
local utils = nil

if fFlagRefactorHelpPage then
	utils = require(modules.Settings.Integrations).Utils
	constants = helpPageModule.Constants
end
local var2 = nil
local var3, var4 = signalsModule.createSignal(false)

return if fFlagRefactorHelpPage then (function()
	-- upvalues: settingsPageFactoryModule (ref), constants (write), uiblox (ref), builderIconsModule (ref), var1 (ref), var2 (write), signalsReactModule (ref), var3 (ref), reactModule (ref), foundationProvider (ref), foundationModule (ref), utils (write), localizationProvider (ref), helpReactView (ref), reactRobloxModule (ref), var4 (ref)
	local help = settingsPageFactoryModule:CreateNewPage()
	help.TabHeader.Name = constants.HELP_PAGE.TAB_HEADER.NAME
	help.Page.Name = "Help"
	local ICON = uiblox[constants.HELP_PAGE.TAB_HEADER.ICON]
	help.TabHeader.TabLabel.Icon.Text = ICON.name
	help.TabHeader.TabLabel.Icon.FontFace = builderIconsModule.Font[ICON.variant]
	help.TabHeader.TabLabel.Title.Text = var1:Format(constants.HELP_PAGE.TAB_HEADER.TEXT)
	help.Page:ClearAllChildren()
	
	local function _()
		-- upvalues: var2 (copy), signalsReactModule (copy), var3 (copy), reactModule (copy), foundationProvider (copy), foundationModule (copy), utils (copy), localizationProvider (copy), var1 (copy), helpReactView (copy), reactRobloxModule (copy), help (ref)
		if var2 then return end
		local var5 = function()
			-- upvalues: signalsReactModule (copy), var3 (copy), reactModule (copy), foundationProvider (copy), foundationModule (copy), utils (copy), localizationProvider (copy), var1 (copy), helpReactView (copy)
			return if signalsReactModule.useSignalState(var3) then reactModule.createElement(foundationProvider, {
				colorMode = foundationModule.Enums.ColorMode.Dark,
				device = utils.getDeviceType()
			}, {
				Child = reactModule.createElement(localizationProvider, { localization = var1 }, { Root = reactModule.createElement(helpReactView) })
			}) else nil
		end
		
		var2 = reactRobloxModule.createRoot(help.Page)
		
		if var2 then
			var2:render(reactModule.createElement(var5))
		end
	end
	
	help.Displayed.Event:Connect(function()
		-- upvalues: var2 (copy), signalsReactModule (copy), var3 (copy), reactModule (copy), foundationProvider (copy), foundationModule (copy), utils (copy), localizationProvider (copy), var1 (copy), helpReactView (copy), reactRobloxModule (copy), help (ref), var4 (copy)
		if not var2 then
			local var5 = function()
				-- upvalues: signalsReactModule (copy), var3 (copy), reactModule (copy), foundationProvider (copy), foundationModule (copy), utils (copy), localizationProvider (copy), var1 (copy), helpReactView (copy)
				return if signalsReactModule.useSignalState(var3) then reactModule.createElement(foundationProvider, {
					colorMode = foundationModule.Enums.ColorMode.Dark,
					device = utils.getDeviceType()
				}, {
					Child = reactModule.createElement(localizationProvider, { localization = var1 }, { Root = reactModule.createElement(helpReactView) })
				}) else nil
			end
			
			var2 = reactRobloxModule.createRoot(help.Page)
			
			if var2 then
				var2:render(reactModule.createElement(var5))
			end
		end
		var4(true)
		
		if help.HubRef.VersionContainer then
			help.HubRef.VersionContainer.Visible = true
		end
	end)
	help.Hidden.Event:Connect(function()
		-- upvalues: var4 (copy), help (ref)
		var4(false)
		
		if help.HubRef.VersionContainer then
			help.HubRef.VersionContainer.Visible = false
		end
	end)
	help.Page.Size = UDim2.fromScale(1, 0)
	help.Page.AutomaticSize = Enum.AutomaticSize.Y
	
	return help
end)() else require(modules.Settings.Pages.Help)