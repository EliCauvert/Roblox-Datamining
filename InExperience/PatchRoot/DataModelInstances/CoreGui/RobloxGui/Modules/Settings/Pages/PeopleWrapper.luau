local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local Modules = RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local ReactRobloxModule = require(CorePackages.Packages.ReactRoblox)
local FFlagRefactorPeoplePageModule = require(Modules.Settings.Flags.FFlagRefactorPeoplePage)
local FFlagRelocateMobileMenuButtonsModule = require(Modules.Settings.Flags.FFlagRelocateMobileMenuButtons)
local FIntRelocateMobileMenuButtonsVariantModule = require(Modules.Settings.Flags.FIntRelocateMobileMenuButtonsVariant)
local Chrome = RobloxGui.Modules.Chrome
local EnabledResult = require(CorePackages.Workspace.Packages.Chrome).Enabled()
local LocalStoreModule = if EnabledResult then require(Chrome.ChromeShared.Service.LocalStore) else nil
local LocalizationProvider = require(CorePackages.Workspace.Packages.Localization).LocalizationProvider
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local SettingsPageFactoryModule = require(Modules.Settings.SettingsPageFactory)
local SettingsShowSignal = require(CorePackages.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local NewResult = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)
local BuilderIconsModule = require(CorePackages.Packages.BuilderIcons)
local BlockingModalScreenModule = require(Modules.Settings.Components.Blocking.BlockingModalScreen)
local Uiblox = BuilderIconsModule.Migration.uiblox
local InExperienceSideSheetModule = require(CorePackages.Workspace.Packages.InExperienceSideSheet)
local FFlagSideSheetOpenPeoplePage = InExperienceSideSheetModule.Flags.FFlagSideSheetOpenPeoplePage
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local CoreScriptsRootProvider = require(CorePackages.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local Constants = if FFlagRefactorPeoplePageModule() then require(CorePackages.Workspace.Packages.PeopleReactView).Constants else nil
local FlagsService = require(CorePackages.Workspace.Packages.PeopleService).getService("Flags")
local GetFFlagAddPeoplePageCardLayoutFunction = FlagsService.GetFFlagAddPeoplePageCardLayout
local GetFFlagPeoplePageLazyRenderCardsFunction = FlagsService.GetFFlagPeoplePageLazyRenderCards
local FFlagEnablePeopleListLazyRender = FlagsService.FFlagEnablePeopleListLazyRender
local FFlagPeopleCardsEnableVirtualizedGrid = FlagsService.FFlagPeopleCardsEnableVirtualizedGrid
local FFlagPeoplePageDismissVolumePopoverOnScrollOutOfView = FlagsService.FFlagPeoplePageDismissVolumePopoverOnScrollOutOfView
local FFlagPeoplePageFlipVolumePopoverToFitViewport = FlagsService.FFlagPeoplePageFlipVolumePopoverToFitViewport
local FFlagPeoplePageDismissCardMenuOnScrollOutOfView = FlagsService.FFlagPeoplePageDismissCardMenuOnScrollOutOfView
local Root = nil
local Signal, Signal2 = require(CorePackages.Packages.Signals).createSignal(false)

local function PeopleFocusRoot(p1)
	-- upvalues: ReactModule (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy)
	return ReactModule.createElement(FocusRoot, {
		isAutoFocusRoot = false,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.RouterView
	}, p1.children)
end

local function createPeoplePage()
	-- upvalues: CorePackages (copy), SettingsPageFactoryModule (copy), Constants (ref), Uiblox (copy), BuilderIconsModule (copy), NewResult (copy), FFlagRelocateMobileMenuButtonsModule (copy), FIntRelocateMobileMenuButtonsVariantModule (copy), Root (ref), GetFFlagPeoplePageLazyRenderCardsFunction (copy), FFlagEnablePeopleListLazyRender (copy), FFlagPeopleCardsEnableVirtualizedGrid (copy), FFlagPeoplePageDismissVolumePopoverOnScrollOutOfView (copy), FFlagPeoplePageFlipVolumePopoverToFitViewport (copy), FFlagPeoplePageDismissCardMenuOnScrollOutOfView (copy), SignalsReactModule (copy), Signal (copy), FFlagSideSheetOpenPeoplePage (copy), InExperienceSideSheetModule (copy), ReactModule (copy), CoreScriptsRootProvider (copy), LocalizationProvider (copy), PeopleFocusRoot (copy), BlockingModalScreenModule (copy), EnabledResult (copy), GetFFlagAddPeoplePageCardLayoutFunction (copy), LocalStoreModule (copy), ReactRobloxModule (copy), Signal2 (copy), SettingsShowSignal (copy)
	local PeopleReactViewModule = require(CorePackages.Workspace.Packages.PeopleReactView)
	local PeopleReactView = PeopleReactViewModule.PeopleReactView
	local SideSheetFocusContext = PeopleReactViewModule.SideSheetFocusContext
	local PeopleServiceModule = require(CorePackages.Workspace.Packages.PeopleService)
	local NewPage = SettingsPageFactoryModule:CreateNewPage()
	NewPage.TabHeader.Name = Constants.PEOPLEPAGE.TAB_HEADER.NAME
	NewPage.Page.Name = Constants.PEOPLEPAGE.PAGE_ID
	local UibloxEntry = Uiblox[Constants.PEOPLEPAGE.TAB_HEADER.ICON]
	NewPage.TabHeader.TabLabel.Icon.Text = UibloxEntry.name
	NewPage.TabHeader.TabLabel.Icon.FontFace = BuilderIconsModule.Font[UibloxEntry.variant]
	NewPage.TabHeader.TabLabel.Title.Text = NewResult:Format(Constants.PEOPLEPAGE.TAB_HEADER.TEXT)
	local SettingsHubService = PeopleServiceModule.getService("SettingsHubService")
	SettingsHubService.register(NewPage)
	
	function NewPage:CreateMenuButtonsContainer()
		-- upvalues: SettingsHubService (copy)
		SettingsHubService.setShowMenuButtonsContainer(true)
	end
	
	if FFlagRelocateMobileMenuButtonsModule and FIntRelocateMobileMenuButtonsVariantModule == 2 then
		function NewPage:UnmountMenuButtonsContainer()
			-- upvalues: SettingsHubService (copy)
			SettingsHubService.setShowMenuButtonsContainer(false)
		end
	end
	local function createReactTree()
		-- upvalues: Root (upval), GetFFlagPeoplePageLazyRenderCardsFunction (upval), FFlagEnablePeopleListLazyRender (upval), FFlagPeopleCardsEnableVirtualizedGrid (upval), FFlagPeoplePageDismissVolumePopoverOnScrollOutOfView (upval), FFlagPeoplePageFlipVolumePopoverToFitViewport (upval), FFlagPeoplePageDismissCardMenuOnScrollOutOfView (upval), NewPage (copy), SignalsReactModule (upval), Signal (upval), FFlagSideSheetOpenPeoplePage (upval), InExperienceSideSheetModule (upval), ReactModule (upval), CoreScriptsRootProvider (upval), LocalizationProvider (upval), NewResult (upval), PeopleFocusRoot (upval), PeopleReactView (copy), BlockingModalScreenModule (upval), EnabledResult (upval), GetFFlagAddPeoplePageCardLayoutFunction (upval), LocalStoreModule (upval), Constants (upval), SideSheetFocusContext (copy), ReactRobloxModule (upval)
		if Root then return end
		local ScrollingFrame = if GetFFlagPeoplePageLazyRenderCardsFunction() or FFlagEnablePeopleListLazyRender or FFlagPeopleCardsEnableVirtualizedGrid or FFlagPeoplePageDismissVolumePopoverOnScrollOutOfView or FFlagPeoplePageFlipVolumePopoverToFitViewport or FFlagPeoplePageDismissCardMenuOnScrollOutOfView then NewPage.Page:FindFirstAncestorWhichIsA("ScrollingFrame") else nil
		
		local function PeopleConditionalView()
			-- upvalues: SignalsReactModule (upval), Signal (upval), FFlagSideSheetOpenPeoplePage (upval), InExperienceSideSheetModule (upval), ReactModule (upval), CoreScriptsRootProvider (upval), LocalizationProvider (upval), NewResult (upval), PeopleFocusRoot (upval), PeopleReactView (upval), BlockingModalScreenModule (upval), GetFFlagPeoplePageLazyRenderCardsFunction (upval), FFlagEnablePeopleListLazyRender (upval), FFlagPeopleCardsEnableVirtualizedGrid (upval), FFlagPeoplePageDismissVolumePopoverOnScrollOutOfView (upval), FFlagPeoplePageFlipVolumePopoverToFitViewport (upval), FFlagPeoplePageDismissCardMenuOnScrollOutOfView (upval), ScrollingFrame (copy), EnabledResult (upval), GetFFlagAddPeoplePageCardLayoutFunction (upval), LocalStoreModule (upval), Constants (upval), SideSheetFocusContext (upval)
			local UseSignalStateResult = if FFlagSideSheetOpenPeoplePage then SignalsReactModule.useSignalState(InExperienceSideSheetModule.getSideSheetVisibility) else false
			local UseSignalStateResult1 = if FFlagSideSheetOpenPeoplePage then SignalsReactModule.useSignalState(InExperienceSideSheetModule.getDidSideSheetOpenWithPeoplePage) else false
			local Element = if SignalsReactModule.useSignalState(Signal) then ReactModule.createElement(CoreScriptsRootProvider, {}, {
				LocalizationProvider = ReactModule.createElement(LocalizationProvider, { localization = NewResult }, {
					FocusRoot = ReactModule.createElement(PeopleFocusRoot, {}, {
						PeopleReactView = ReactModule.createElement(PeopleReactView, {
							blockingModalScreen = BlockingModalScreenModule,
							blockingFlags = {},
							scrollingFrame = if GetFFlagPeoplePageLazyRenderCardsFunction() or FFlagEnablePeopleListLazyRender or FFlagPeopleCardsEnableVirtualizedGrid or FFlagPeoplePageDismissVolumePopoverOnScrollOutOfView or FFlagPeoplePageFlipVolumePopoverToFitViewport or FFlagPeoplePageDismissCardMenuOnScrollOutOfView then ScrollingFrame else nil,
							chromeEnabled = EnabledResult,
							getUniversesExposedTo = if GetFFlagAddPeoplePageCardLayoutFunction() and LocalStoreModule then LocalStoreModule.getUniversesExposedTo else nil,
							addUniverseToExposureList = if GetFFlagAddPeoplePageCardLayoutFunction() and LocalStoreModule then LocalStoreModule.addUniverseToExposureList else nil,
							minimumCardWidth = if FFlagSideSheetOpenPeoplePage and UseSignalStateResult and UseSignalStateResult1 then Constants.PEOPLEPAGE.PEOPLE_CARDS.SIDE_SHEET_MINIMUM_CARD_WIDTH else nil
						})
					})
				})
			}) else nil
			
			if FFlagSideSheetOpenPeoplePage and Element then
				Element = ReactModule.createElement(SideSheetFocusContext.Provider, { value = UseSignalStateResult and UseSignalStateResult1 }, { People = Element })
			end
			return Element
		end
		
		Root = ReactRobloxModule.createRoot(NewPage.Page)
		
		if Root then
			Root:render(ReactModule.createElement(PeopleConditionalView))
		end
	end
	
	NewPage.Displayed.Event:Connect(function()
		-- upvalues: Signal (upval), createReactTree (copy), Signal2 (upval), NewPage (copy)
		if not Signal(false) then
			createReactTree()
			Signal2(true)
		end
		local MenuContainer = NewPage.Page:FindFirstAncestor("MenuContainer")
		
		if MenuContainer then
			local BottomButtonFrame = MenuContainer:FindFirstChild("BottomButtonFrame", true)
			
			if BottomButtonFrame then
				BottomButtonFrame.SelectionBehaviorUp = Enum.SelectionBehavior.Escape
			end
		end
	end)
	SettingsShowSignal:connect(function(p1)
		-- upvalues: Signal2 (upval)
		if not p1 then
			Signal2(false)
		end
	end)
	NewPage.Page.Size = UDim2.new(1, 0, 0, 0)
	NewPage.Page.AutomaticSize = Enum.AutomaticSize.Y
	
	return NewPage
end

return if FFlagRefactorPeoplePageModule() then createPeoplePage() else require(Modules.Settings.Pages.Players)