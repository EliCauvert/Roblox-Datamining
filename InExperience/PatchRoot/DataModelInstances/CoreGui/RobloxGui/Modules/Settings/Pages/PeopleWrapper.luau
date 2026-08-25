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
local var10 = require(corePackagesService.Workspace.Packages.Chrome).Enabled()
local var11 = if var10 then require(robloxGui.Modules.Chrome.ChromeShared.Service.LocalStore) else nil
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local localizationProvider = require(corePackagesService.Workspace.Packages.Localization).LocalizationProvider
local signalsModule = require(corePackagesService.Packages.Signals)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local settingsPageFactoryModule = require(modules.Settings.SettingsPageFactory)
local settingsShowSignal = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local var15 = localization.new(localizationService.RobloxLocaleId)
local builderIconsModule = require(corePackagesService.Packages.BuilderIcons)
local blockingModalScreenModule = require(modules.Settings.Components.Blocking.BlockingModalScreen)
local uiblox = builderIconsModule.Migration.uiblox
local peopleServiceModule = require(corePackagesService.Workspace.Packages.PeopleService)
local focusNavigationUtilsModule = require(corePackagesService.Workspace.Packages.FocusNavigationUtils)
local focusRoot = focusNavigationUtilsModule.FocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local coreScriptsRootProvider = require(corePackagesService.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local useRegistryEntry = focusNavigationUtilsModule.FocusNavigableSurfaceRegistry.useRegistryEntry
local var20 = if fFlagRefactorPeoplePageModule() then require(corePackagesService.Workspace.Packages.PeopleReactView).Constants else nil
local flags = peopleServiceModule.getService("Flags")
local getFFlagAddPeoplePageCardLayout = flags.GetFFlagAddPeoplePageCardLayout
local getFFlagPeoplePageLazyRenderCards = flags.GetFFlagPeoplePageLazyRenderCards
local fFlagEnablePeopleListLazyRender = flags.FFlagEnablePeopleListLazyRender
local fFlagPeopleCardsEnableVirtualizedGrid = flags.FFlagPeopleCardsEnableVirtualizedGrid
local fFlagPeoplePageDismissVolumePopoverOnScrollOutOfView = flags.FFlagPeoplePageDismissVolumePopoverOnScrollOutOfView
local fFlagPeoplePageFlipVolumePopoverToFitViewport = flags.FFlagPeoplePageFlipVolumePopoverToFitViewport
local fFlagPeoplePageDismissCardMenuOnScrollOutOfView = flags.FFlagPeoplePageDismissCardMenuOnScrollOutOfView
local var22 = nil
local var23, var24 = signalsModule.createSignal(false)

local function PeopleFocusRoot(p0)
	-- upvalues: useRegistryEntry (ref), focusNavigableSurfaceIdentifierEnum (ref), reactModule (ref), focusRoot (ref), fFlagIEMFocusNavPeoplePageToButtons (ref)
	return reactModule.createElement(focusRoot, {
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.RouterView,
		isAutoFocusRoot = if fFlagIEMFocusNavPeoplePageToButtons then false else useRegistryEntry(focusNavigableSurfaceIdentifierEnum.CentralOverlay) == nil
	}, p0.children)
end

return if fFlagRefactorPeoplePageModule() then (function()
	-- upvalues: corePackagesService (ref), settingsPageFactoryModule (ref), var20 (write), uiblox (ref), builderIconsModule (ref), var15 (ref), fFlagRelocateMobileMenuButtonsModule (ref), fIntRelocateMobileMenuButtonsVariantModule (ref), var22 (write), getFFlagPeoplePageLazyRenderCards (ref), fFlagEnablePeopleListLazyRender (ref), fFlagPeopleCardsEnableVirtualizedGrid (ref), fFlagPeoplePageDismissVolumePopoverOnScrollOutOfView (ref), fFlagPeoplePageFlipVolumePopoverToFitViewport (ref), fFlagPeoplePageDismissCardMenuOnScrollOutOfView (ref), signalsReactModule (ref), var23 (ref), reactModule (ref), coreScriptsRootProvider (ref), localizationProvider (ref), PeopleFocusRoot (ref), blockingModalScreenModule (ref), var10 (ref), getFFlagAddPeoplePageCardLayout (ref), var11 (ref), reactRobloxModule (ref), renderPeoplePageOnTabSwitch (ref), var24 (ref), fFlagIEMFocusNavPeoplePageToButtons (ref), settingsShowSignal (ref)
	local peopleReactView = require(corePackagesService.Workspace.Packages.PeopleReactView).PeopleReactView
	local peopleServiceModule = require(corePackagesService.Workspace.Packages.PeopleService)
	local var27 = settingsPageFactoryModule:CreateNewPage()
	var27.TabHeader.Name = var20.PEOPLEPAGE.TAB_HEADER.NAME
	var27.Page.Name = var20.PEOPLEPAGE.PAGE_ID
	local ICON = uiblox[var20.PEOPLEPAGE.TAB_HEADER.ICON]
	var27.TabHeader.TabLabel.Icon.Text = ICON.name
	var27.TabHeader.TabLabel.Icon.FontFace = builderIconsModule.Font[ICON.variant]
	var27.TabHeader.TabLabel.Title.Text = var15:Format(var20.PEOPLEPAGE.TAB_HEADER.TEXT)
	local settingsHubService = peopleServiceModule.getService("SettingsHubService")
	settingsHubService.register(var27)
	
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
		-- upvalues: var22 (copy), getFFlagPeoplePageLazyRenderCards (copy), fFlagEnablePeopleListLazyRender (copy), fFlagPeopleCardsEnableVirtualizedGrid (copy), fFlagPeoplePageDismissVolumePopoverOnScrollOutOfView (copy), fFlagPeoplePageFlipVolumePopoverToFitViewport (copy), fFlagPeoplePageDismissCardMenuOnScrollOutOfView (copy), var27 (ref), signalsReactModule (copy), var23 (copy), reactModule (copy), coreScriptsRootProvider (copy), localizationProvider (copy), var15 (copy), PeopleFocusRoot (copy), peopleReactView (ref), blockingModalScreenModule (copy), var10 (copy), getFFlagAddPeoplePageCardLayout (copy), var11 (copy), reactRobloxModule (copy)
		if var22 then return end
		local var30 = if getFFlagPeoplePageLazyRenderCards() or fFlagEnablePeopleListLazyRender or (fFlagPeopleCardsEnableVirtualizedGrid or fFlagPeoplePageDismissVolumePopoverOnScrollOutOfView) or (fFlagPeoplePageFlipVolumePopoverToFitViewport or fFlagPeoplePageDismissCardMenuOnScrollOutOfView) then var27.Page:FindFirstAncestorWhichIsA("ScrollingFrame") else nil
		
		local function PeopleConditionalView()
			-- upvalues: signalsReactModule (copy), var23 (copy), reactModule (copy), coreScriptsRootProvider (copy), localizationProvider (copy), var15 (copy), PeopleFocusRoot (copy), peopleReactView (copy), blockingModalScreenModule (copy), getFFlagPeoplePageLazyRenderCards (copy), fFlagEnablePeopleListLazyRender (copy), fFlagPeopleCardsEnableVirtualizedGrid (copy), fFlagPeoplePageDismissVolumePopoverOnScrollOutOfView (copy), fFlagPeoplePageFlipVolumePopoverToFitViewport (copy), fFlagPeoplePageDismissCardMenuOnScrollOutOfView (copy), var30 (ref), var10 (copy), getFFlagAddPeoplePageCardLayout (copy), var11 (copy)
			return if signalsReactModule.useSignalState(var23) then reactModule.createElement(coreScriptsRootProvider, {}, {
				LocalizationProvider = reactModule.createElement(localizationProvider, { localization = var15 }, {
					FocusRoot = reactModule.createElement(PeopleFocusRoot, {}, {
						PeopleReactView = reactModule.createElement(peopleReactView, {
							blockingModalScreen = blockingModalScreenModule,
							blockingFlags = {},
							scrollingFrame = if getFFlagPeoplePageLazyRenderCards() or fFlagEnablePeopleListLazyRender or (fFlagPeopleCardsEnableVirtualizedGrid or fFlagPeoplePageDismissVolumePopoverOnScrollOutOfView) or (fFlagPeoplePageFlipVolumePopoverToFitViewport or fFlagPeoplePageDismissCardMenuOnScrollOutOfView) then var30 else nil,
							chromeEnabled = var10,
							getUniversesExposedTo = if getFFlagAddPeoplePageCardLayout() and var11 then var11.getUniversesExposedTo else nil,
							addUniverseToExposureList = if getFFlagAddPeoplePageCardLayout() and var11 then var11.addUniverseToExposureList else nil
						})
					})
				})
			}) else nil
		end
		
		var22 = reactRobloxModule.createRoot(var27.Page)
		
		if var22 then
			var22:render(reactModule.createElement(PeopleConditionalView))
		end
	end
	
	var27.Displayed.Event:Connect(function()
		-- upvalues: renderPeoplePageOnTabSwitch (copy), var23 (copy), createReactTree (ref), var24 (copy), fFlagIEMFocusNavPeoplePageToButtons (copy), var27 (ref)
		if not renderPeoplePageOnTabSwitch or not var23(false) then
			createReactTree()
			var24(true)
		end
		if fFlagIEMFocusNavPeoplePageToButtons then
			local menuContainer = var27.Page:FindFirstAncestor("MenuContainer")
			
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
			-- upvalues: var24 (copy)
			if not p1 then
				var24(false)
			end
		end)
	else
		var27.Hidden.Event:Connect(function()
			-- upvalues: var24 (copy)
			var24(false)
		end)
	end
	var27.Page.Size = UDim2.new(1, 0, 0, 0)
	var27.Page.AutomaticSize = Enum.AutomaticSize.Y
	
	return var27
end)() else require(modules.Settings.Pages.Players)