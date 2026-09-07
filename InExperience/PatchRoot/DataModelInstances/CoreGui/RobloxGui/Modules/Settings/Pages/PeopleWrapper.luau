local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local localizationService = game:GetService("LocalizationService")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local modules = robloxGui.Modules
local reactModule = require(corePackagesService.Packages.React)
local reactRobloxModule = require(corePackagesService.Packages.ReactRoblox)
local fFlagRefactorPeoplePageModule = require(modules.Settings.Flags.FFlagRefactorPeoplePage)
local renderPeoplePageOnTabSwitch = game:DefineFastFlag("RenderPeoplePageOnTabSwitch", false)
local fFlagRelocateMobileMenuButtonsModule = require(modules.Settings.Flags.FFlagRelocateMobileMenuButtons)
local fIntRelocateMobileMenuButtonsVariantModule = require(modules.Settings.Flags.FIntRelocateMobileMenuButtonsVariant)
local fFlagIEMFocusNavPeoplePageToButtons = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagIEMFocusNavPeoplePageToButtons
local var1 = require(corePackagesService.Workspace.Packages.Chrome).Enabled()
local var2 = if var1 then require(robloxGui.Modules.Chrome.ChromeShared.Service.LocalStore) else nil
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local localizationProvider = require(corePackagesService.Workspace.Packages.Localization).LocalizationProvider
local signalsModule = require(corePackagesService.Packages.Signals)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local settingsPageFactoryModule = require(modules.Settings.SettingsPageFactory)
local settingsShowSignal = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local var3 = localization.new(localizationService.RobloxLocaleId)
local builderIconsModule = require(corePackagesService.Packages.BuilderIcons)
local blockingModalScreenModule = require(modules.Settings.Components.Blocking.BlockingModalScreen)
local uiblox = builderIconsModule.Migration.uiblox
local peopleServiceModule = require(corePackagesService.Workspace.Packages.PeopleService)
local focusNavigationUtilsModule = require(corePackagesService.Workspace.Packages.FocusNavigationUtils)
local focusRoot = focusNavigationUtilsModule.FocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local coreScriptsRootProvider = require(corePackagesService.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local useRegistryEntry = focusNavigationUtilsModule.FocusNavigableSurfaceRegistry.useRegistryEntry
local var4 = if fFlagRefactorPeoplePageModule() then require(corePackagesService.Workspace.Packages.PeopleReactView).Constants else nil
local flags = peopleServiceModule.getService("Flags")
local getFFlagAddPeoplePageCardLayout = flags.GetFFlagAddPeoplePageCardLayout
local getFFlagPeoplePageLazyRenderCards = flags.GetFFlagPeoplePageLazyRenderCards
local fFlagEnablePeopleListLazyRender = flags.FFlagEnablePeopleListLazyRender
local fFlagPeopleCardsEnableVirtualizedGrid = flags.FFlagPeopleCardsEnableVirtualizedGrid
local fFlagPeoplePageDismissVolumePopoverOnScrollOutOfView = flags.FFlagPeoplePageDismissVolumePopoverOnScrollOutOfView
local fFlagPeoplePageFlipVolumePopoverToFitViewport = flags.FFlagPeoplePageFlipVolumePopoverToFitViewport
local fFlagPeoplePageDismissCardMenuOnScrollOutOfView = flags.FFlagPeoplePageDismissCardMenuOnScrollOutOfView
local var5 = nil
local var6, var7 = signalsModule.createSignal(false)

local function PeopleFocusRoot(p1)
	-- upvalues: useRegistryEntry (ref), focusNavigableSurfaceIdentifierEnum (ref), reactModule (ref), focusRoot (ref), fFlagIEMFocusNavPeoplePageToButtons (ref)
	return reactModule.createElement(focusRoot, {
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.RouterView,
		isAutoFocusRoot = if fFlagIEMFocusNavPeoplePageToButtons then false else useRegistryEntry(focusNavigableSurfaceIdentifierEnum.CentralOverlay) == nil
	}, p1.children)
end

return if fFlagRefactorPeoplePageModule() then (function()
	-- upvalues: corePackagesService (ref), settingsPageFactoryModule (ref), var4 (write), uiblox (ref), builderIconsModule (ref), var3 (ref), fFlagRelocateMobileMenuButtonsModule (ref), fIntRelocateMobileMenuButtonsVariantModule (ref), var5 (write), getFFlagPeoplePageLazyRenderCards (ref), fFlagEnablePeopleListLazyRender (ref), fFlagPeopleCardsEnableVirtualizedGrid (ref), fFlagPeoplePageDismissVolumePopoverOnScrollOutOfView (ref), fFlagPeoplePageFlipVolumePopoverToFitViewport (ref), fFlagPeoplePageDismissCardMenuOnScrollOutOfView (ref), signalsReactModule (ref), var6 (ref), reactModule (ref), coreScriptsRootProvider (ref), localizationProvider (ref), PeopleFocusRoot (ref), blockingModalScreenModule (ref), var1 (ref), getFFlagAddPeoplePageCardLayout (ref), var2 (ref), reactRobloxModule (ref), renderPeoplePageOnTabSwitch (ref), var7 (ref), fFlagIEMFocusNavPeoplePageToButtons (ref), settingsShowSignal (ref)
	local peopleReactView = require(corePackagesService.Workspace.Packages.PeopleReactView).PeopleReactView
	local peopleServiceModule = require(corePackagesService.Workspace.Packages.PeopleService)
	local var8 = settingsPageFactoryModule:CreateNewPage()
	var8.TabHeader.Name = var4.PEOPLEPAGE.TAB_HEADER.NAME
	var8.Page.Name = var4.PEOPLEPAGE.PAGE_ID
	local ICON = uiblox[var4.PEOPLEPAGE.TAB_HEADER.ICON]
	var8.TabHeader.TabLabel.Icon.Text = ICON.name
	var8.TabHeader.TabLabel.Icon.FontFace = builderIconsModule.Font[ICON.variant]
	var8.TabHeader.TabLabel.Title.Text = var3:Format(var4.PEOPLEPAGE.TAB_HEADER.TEXT)
	local settingsHubService = peopleServiceModule.getService("SettingsHubService")
	settingsHubService.register(var8)
	
	function var27.CreateMenuButtonsContainer(_)
		-- upvalues: settingsHubService (ref)
		settingsHubService.setShowMenuButtonsContainer(true)
	end
	
	if fFlagRelocateMobileMenuButtonsModule and fIntRelocateMobileMenuButtonsVariantModule == 2 then
		function var27.UnmountMenuButtonsContainer(_)
			-- upvalues: settingsHubService (ref)
			settingsHubService.setShowMenuButtonsContainer(false)
		end
	end
	local function createReactTree()
		-- upvalues: var5 (copy), getFFlagPeoplePageLazyRenderCards (copy), fFlagEnablePeopleListLazyRender (copy), fFlagPeopleCardsEnableVirtualizedGrid (copy), fFlagPeoplePageDismissVolumePopoverOnScrollOutOfView (copy), fFlagPeoplePageFlipVolumePopoverToFitViewport (copy), fFlagPeoplePageDismissCardMenuOnScrollOutOfView (copy), var8 (ref), signalsReactModule (copy), var6 (copy), reactModule (copy), coreScriptsRootProvider (copy), localizationProvider (copy), var3 (copy), PeopleFocusRoot (copy), peopleReactView (ref), blockingModalScreenModule (copy), var1 (copy), getFFlagAddPeoplePageCardLayout (copy), var2 (copy), reactRobloxModule (copy)
		if var5 then return end
		local var9 = if getFFlagPeoplePageLazyRenderCards() or fFlagEnablePeopleListLazyRender or (fFlagPeopleCardsEnableVirtualizedGrid or fFlagPeoplePageDismissVolumePopoverOnScrollOutOfView) or (fFlagPeoplePageFlipVolumePopoverToFitViewport or fFlagPeoplePageDismissCardMenuOnScrollOutOfView) then var8.Page:FindFirstAncestorWhichIsA("ScrollingFrame") else nil
		
		local function PeopleConditionalView()
			-- upvalues: signalsReactModule (copy), var6 (copy), reactModule (copy), coreScriptsRootProvider (copy), localizationProvider (copy), var3 (copy), PeopleFocusRoot (copy), peopleReactView (copy), blockingModalScreenModule (copy), getFFlagPeoplePageLazyRenderCards (copy), fFlagEnablePeopleListLazyRender (copy), fFlagPeopleCardsEnableVirtualizedGrid (copy), fFlagPeoplePageDismissVolumePopoverOnScrollOutOfView (copy), fFlagPeoplePageFlipVolumePopoverToFitViewport (copy), fFlagPeoplePageDismissCardMenuOnScrollOutOfView (copy), var9 (ref), var1 (copy), getFFlagAddPeoplePageCardLayout (copy), var2 (copy)
			return if signalsReactModule.useSignalState(var6) then reactModule.createElement(coreScriptsRootProvider, {}, {
				LocalizationProvider = reactModule.createElement(localizationProvider, { localization = var3 }, {
					FocusRoot = reactModule.createElement(PeopleFocusRoot, {}, {
						PeopleReactView = reactModule.createElement(peopleReactView, {
							blockingModalScreen = blockingModalScreenModule,
							blockingFlags = {},
							scrollingFrame = if getFFlagPeoplePageLazyRenderCards() or fFlagEnablePeopleListLazyRender or (fFlagPeopleCardsEnableVirtualizedGrid or fFlagPeoplePageDismissVolumePopoverOnScrollOutOfView) or (fFlagPeoplePageFlipVolumePopoverToFitViewport or fFlagPeoplePageDismissCardMenuOnScrollOutOfView) then var9 else nil,
							chromeEnabled = var1,
							getUniversesExposedTo = if getFFlagAddPeoplePageCardLayout() and var2 then var2.getUniversesExposedTo else nil,
							addUniverseToExposureList = if getFFlagAddPeoplePageCardLayout() and var2 then var2.addUniverseToExposureList else nil
						})
					})
				})
			}) else nil
		end
		
		var5 = reactRobloxModule.createRoot(var8.Page)
		
		if var5 then
			var5:render(reactModule.createElement(PeopleConditionalView))
		end
	end
	
	var8.Displayed.Event:Connect(function()
		-- upvalues: renderPeoplePageOnTabSwitch (copy), var6 (copy), createReactTree (ref), var7 (copy), fFlagIEMFocusNavPeoplePageToButtons (copy), var8 (ref)
		if not renderPeoplePageOnTabSwitch or not var6(false) then
			createReactTree()
			var7(true)
		end
		if fFlagIEMFocusNavPeoplePageToButtons then
			local menuContainer = var8.Page:FindFirstAncestor("MenuContainer")
			
			if menuContainer then
				local bottomButtonFrame = menuContainer:FindFirstChild("BottomButtonFrame", true)
				
				if bottomButtonFrame then
					bottomButtonFrame.SelectionBehaviorUp = Enum.SelectionBehavior.Escape
				end
			end
		end
	end)
	
	if renderPeoplePageOnTabSwitch then
		settingsShowSignal:connect(function(p1)
			-- upvalues: var7 (copy)
			if not p1 then
				var7(false)
			end
		end)
	else
		var8.Hidden.Event:Connect(function()
			-- upvalues: var7 (copy)
			var7(false)
		end)
	end
	var8.Page.Size = UDim2.new(1, 0, 0, 0)
	var8.Page.AutomaticSize = Enum.AutomaticSize.Y
	
	return var8
end)() else require(modules.Settings.Pages.Players)