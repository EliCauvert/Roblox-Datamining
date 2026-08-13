local corePackagesService = game:GetService("CorePackages")
local localizationService = game:GetService("LocalizationService")
local modules = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules
local helpPageModule = require(corePackagesService.Workspace.Packages.HelpPage)
local helpReactView = helpPageModule.HelpReactView
local settingsPageFactoryModule = require(modules.Settings.SettingsPageFactory)
local var4 = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization.new(localizationService.RobloxLocaleId)
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
local var11 = nil
local var12, var13 = signalsModule.createSignal(false)

return if fFlagRefactorHelpPage then (function() --[[ line: 45 | named "createHelpPage" ]]
	-- upvalues: settingsPageFactoryModule (ref), constants (write), uiblox (ref), builderIconsModule (ref), var4 (ref), var11 (write), signalsReactModule (ref), var12 (ref), reactModule (ref), foundationProvider (ref), foundationModule (ref), utils (write), localizationProvider (ref), helpReactView (ref), reactRobloxModule (ref), var13 (ref)
	local help = settingsPageFactoryModule:CreateNewPage()
	help.TabHeader.Name = constants.HELP_PAGE.TAB_HEADER.NAME
	help.Page.Name = "Help"
	local ICON = uiblox[constants.HELP_PAGE.TAB_HEADER.ICON]
	help.TabHeader.TabLabel.Icon.Text = ICON.name
	help.TabHeader.TabLabel.Icon.FontFace = builderIconsModule.Font[ICON.variant]
	help.TabHeader.TabLabel.Title.Text = var4:Format(constants.HELP_PAGE.TAB_HEADER.TEXT)
	help.Page:ClearAllChildren()
	
	local function _() --[[ line: 59 | named "createReactTree" ]]
		-- upvalues: var11 (copy), signalsReactModule (copy), var12 (copy), reactModule (copy), foundationProvider (copy), foundationModule (copy), utils (copy), localizationProvider (copy), var4 (copy), helpReactView (copy), reactRobloxModule (copy), help (ref)
		if var11 then return end
		local var15 = function() --[[ line: 64 ]]
			-- upvalues: signalsReactModule (copy), var12 (copy), reactModule (copy), foundationProvider (copy), foundationModule (copy), utils (copy), localizationProvider (copy), var4 (copy), helpReactView (copy)
			return if signalsReactModule.useSignalState(var12) then reactModule.createElement(foundationProvider, {
				colorMode = foundationModule.Enums.ColorMode.Dark,
				device = utils.getDeviceType()
			}, {
				Child = reactModule.createElement(localizationProvider, { localization = var4 }, { Root = reactModule.createElement(helpReactView) })
			}) else nil
		end
		
		var11 = reactRobloxModule.createRoot(help.Page)
		
		if var11 then
			var11:render(reactModule.createElement(var15))
		end
	end
	
	help.Displayed.Event:Connect(function() --[[ line: 87 ]]
		-- upvalues: var11 (copy), signalsReactModule (copy), var12 (copy), reactModule (copy), foundationProvider (copy), foundationModule (copy), utils (copy), localizationProvider (copy), var4 (copy), helpReactView (copy), reactRobloxModule (copy), help (ref), var13 (copy)
		if not var11 then
			local var16 = function() --[[ line: 64 ]]
				-- upvalues: signalsReactModule (copy), var12 (copy), reactModule (copy), foundationProvider (copy), foundationModule (copy), utils (copy), localizationProvider (copy), var4 (copy), helpReactView (copy)
				return if signalsReactModule.useSignalState(var12) then reactModule.createElement(foundationProvider, {
					colorMode = foundationModule.Enums.ColorMode.Dark,
					device = utils.getDeviceType()
				}, {
					Child = reactModule.createElement(localizationProvider, { localization = var4 }, { Root = reactModule.createElement(helpReactView) })
				}) else nil
			end
			
			var11 = reactRobloxModule.createRoot(help.Page)
			
			if var11 then
				var11:render(reactModule.createElement(var16))
			end
		end
		var13(true)
		
		if help.HubRef.VersionContainer then
			help.HubRef.VersionContainer.Visible = true
		end
	end)
	help.Hidden.Event:Connect(function() --[[ line: 96 ]]
		-- upvalues: var13 (copy), help (ref)
		var13(false)
		
		if help.HubRef.VersionContainer then
			help.HubRef.VersionContainer.Visible = false
		end
	end)
	help.Page.Size = UDim2.fromScale(1, 0)
	help.Page.AutomaticSize = Enum.AutomaticSize.Y
	
	return help
end)() else require(modules.Settings.Pages.Help)