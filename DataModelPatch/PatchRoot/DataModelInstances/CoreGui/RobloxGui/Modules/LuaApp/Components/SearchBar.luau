local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local IXPService = game:GetService("IXPService")
local CorePackages = game:GetService("CorePackages")
local TelemetryService = game:GetService("TelemetryService")
local GuiService = game:GetService("GuiService")
local TModule = require(CorePackages.Packages.t)
local OtterModule = require(CorePackages.Packages.Otter)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local CryoModule = require(CorePackages.Packages.Cryo)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local FocusNavigableSurfaceWrapper = FocusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AppSessionService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppSessionService
local SessionType = require(CorePackages.Workspace.Packages.RobloxAppSessionization).SessionType
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local GameIconRoduxModule = require(CorePackages.Workspace.Packages.GameIconRodux)
local ApiFetchGameIconsFunction = GameIconRoduxModule.GameIcons.ApiFetchGameIcons
local GameIconReducer = GameIconRoduxModule.GameIcons.GameIconReducer
local SearchTypes = require(CorePackages.Workspace.Packages.RobloxAppEnums).SearchTypes
local AppEventIngestService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppEventIngestService
local SetCentralOverlayFunction = require(CorePackages.Workspace.Packages.CentralOverlay).Actions.SetCentralOverlay
local CentralOverlayType = require(CorePackages.Workspace.Packages.RobloxAppEnums).CentralOverlayType
local DiscoveryUtilsModule = require(CorePackages.Workspace.Packages.DiscoveryUtils)
local FoundationModule = require(CorePackages.Packages.Foundation)
local View = FoundationModule.View
local Image = FoundationModule.Image
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local Default = require(CorePackages.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default
local SettingsRoute = require(CorePackages.Workspace.Packages.LinkingProtocol).Enums.SettingsRoute
local GetAppFeaturePoliciesFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies
local SocialLuaAnalyticsModule = require(CorePackages.Workspace.Packages.SocialLuaAnalytics)
local EventTypes = SocialLuaAnalyticsModule.Analytics.Enums.EventTypes
local SupportedTelemetryBackends = SocialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends
local Sources = SocialLuaAnalyticsModule.Analytics.Enums.Sources
local SearchConstants = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.Search.SearchConstants
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local SearchUtilModule = require(Modules.LuaApp.Util.SearchUtil)
local DEPRECATEDImageSetLabelModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetLabel)
local DEPRECATEDImageSetButtonModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetButton)
local SearchBarListPickerModule = require(Modules.LuaApp.Components.SearchBarListPicker)
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local FetchAutocompleteSuggestionModule = require(Modules.LuaApp.Thunks.FetchAutocompleteSuggestion)
local SetSearchBarFocusedModule = require(Modules.LuaApp.Actions.SetSearchBarFocused)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local AutocompleteSuggestionModule = require(Modules.LuaApp.Models.AutocompleteSuggestion)
local SearchAutocompleteModule = require(Modules.LuaApp.Analytics.Events.searchAutocomplete)
local SearchAutocompleteEventNewModule = require(Modules.LuaApp.Analytics.Events.searchAutocompleteEventNew)
local SearchTextTrimModule = require(Modules.LuaApp.Analytics.Events.searchTextTrim)
local SearchClearModule = require(Modules.LuaApp.Analytics.Events.searchClear)
local SearchSuggestionClickedModule = require(Modules.LuaApp.Analytics.Events.searchSuggestionClicked)
local GetCurrentPageModule = require(Modules.LuaApp.getCurrentPage)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local NavigateDownTo3DQRCodePageModule = require(Modules.LuaApp.Thunks.NavigateDownTo3DQRCodePage)
local AppPageModule = require(Modules.LuaApp.AppPage)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagSignalsNavP3hMisc = SharedFlagsModule.FFlagSignalsNavP3hMisc
local UseSignalState = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3hMisc then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local GetSearchBarStoreFunction = require(CorePackages.Workspace.Packages.SearchBarStore).GetSearchBarStore
local GetFIntLuaAppAutocompleteSearchTextMaxLenModule = require(Modules.LuaApp.Flags.GetFIntLuaAppAutocompleteSearchTextMaxLen)
local GetFFlagLuaAppAutocompleteIXPConfigModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppAutocompleteIXPConfig)
local GetFFlagAvatarAutocompleteEnabledForAllModule = require(Modules.AvatarExperience.Flags.GetFFlagAvatarAutocompleteEnabledForAll)
local FFlagUseSignalsForSearchBar = SharedFlagsModule.FFlagUseSignalsForSearchBar
local FFlagBoldSearchListPickerSuggestionsModule = require(Modules.LuaApp.Flags.FFlagBoldSearchListPickerSuggestions)
local FFlagSearchOmniAutocompletePage = SharedFlagsModule.FFlagSearchOmniAutocompletePage
local ImproveSearchSelectionUX2 = game:DefineFastFlag("ImproveSearchSelectionUX2", false)
local FFlagUsesCancelSearchAppPolicy = SharedFlagsModule.FFlagUsesCancelSearchAppPolicy
local FFlagEnableAppNavGamepadRemoval = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableAppNavGamepadRemoval
local FFlagQRInSearchScanner = require(CorePackages.Workspace.Packages.SharedFlags).FFlagQRInSearchScanner
local FFlagQRInSearchProfileQR = require(CorePackages.Workspace.Packages.SharedFlags).FFlagQRInSearchProfileQR
local AXMigrateSearchBarToFocusNavigation = game:DefineFastFlag("AXMigrateSearchBarToFocusNavigation", false)
local FFlagEnableLeftNavOnConsole = SharedFlagsModule.FFlagEnableLeftNavOnConsole
local LuaAppNewSlpEndpointIxpEnabled = game:DefineFastFlag("LuaAppNewSlpEndpointIxpEnabled", false)
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local LuaAppNewSlpEndpointIxpLayer = game:DefineFastString("LuaAppNewSlpEndpointIxpLayer", "Growth.Omnisearch.SearchLandingPage")
local RecentSearchTermsAppStorage = require(CorePackages.Workspace.Packages.AvatarExperienceSearch).Utils.RecentSearchTermsAppStorage
local SEARCHBARHEIGHT = if FFlagSearchOmniAutocompletePage then SearchConstants.SEARCH_BAR_HEIGHT else 28
local SEARCHBARPADDING = if FFlagSearchOmniAutocompletePage then SearchConstants.SEARCH_BAR_PADDING else 12
local SEARCHBARTEXTSIZE = if FFlagSearchOmniAutocompletePage then SearchConstants.SEARCH_BAR_TEXT_SIZE else 20
local SEARCHBARICONPADDING = if FFlagSearchOmniAutocompletePage then SearchConstants.SEARCH_BAR_ICON_PADDING else 9
local SEARCHBARTEXTPADDINGWITHICON = if FFlagSearchOmniAutocompletePage then SearchConstants.SEARCH_BAR_TEXT_PADDING_WITH_ICON else 36
local SEARCHBARTEXTPADDINGWITHOUTICON = if FFlagSearchOmniAutocompletePage then SearchConstants.SEARCH_BAR_TEXT_PADDING_WITHOUT_ICON else 12
local CLEARIMAGESIZE = if FFlagSearchOmniAutocompletePage then SearchConstants.CLEAR_IMAGE_SIZE else 16
local CLEARIMAGEPADDING = if FFlagSearchOmniAutocompletePage then SearchConstants.CLEAR_IMAGE_PADDING else 6
local XOffset = CLEARIMAGEPADDING * 2 + CLEARIMAGESIZE
local CANCELBUTTONWIDTH = if FFlagSearchOmniAutocompletePage then SearchConstants.CANCEL_BUTTON_WIDTH else 88
local CANCELBUTTONPADDING = if FFlagSearchOmniAutocompletePage then SearchConstants.CANCEL_BUTTON_PADDING else 7
local TABLETLISTPICKERHEIGHT = if FFlagSearchOmniAutocompletePage then SearchConstants.TABLET_LIST_PICKER_HEIGHT else 540
local v1 = require(Modules.LuaApp.Flags.GetFIntLuaAppAutocompleteDebounceMs)() / 1000
local config = {
	Image = "LuaApp/buttons/buttonFill",
	SliceCenter = Rect.new(8, 8, 9, 9)
}
local IconsActionsEditClearSmall = Images["icons/actions/edit/clear_small"]
local Config = if FFlagQRInSearchScanner or FFlagQRInSearchProfileQR then {
	description = "QR code button in SearchBar",
	links = "",
	eventName = EventTypes.ButtonClick,
	backends = { SupportedTelemetryBackends.EventIngest },
	throttlingPercentage = game:DefineFastInt("QRClickInOmniSearchThrottlingPercentage", 10000),
	lastUpdated = { 25, 11, 6 }
} else nil
local Config1 = if FFlagEnableAppNavGamepadRemoval then nil else {
	[Enum.UserInputType.Keyboard] = true,
	[Enum.UserInputType.Gamepad1] = true,
	[Enum.UserInputType.Gamepad2] = true,
	[Enum.UserInputType.Gamepad3] = true,
	[Enum.UserInputType.Gamepad4] = true,
	[Enum.UserInputType.Gamepad5] = true,
	[Enum.UserInputType.Gamepad6] = true,
	[Enum.UserInputType.Gamepad7] = true,
	[Enum.UserInputType.Gamepad8] = true
}
local Platform = UserInputService:GetPlatform()
local IsPlatformMatch: boolean = Platform == Enum.Platform.XBox360 or Platform == Enum.Platform.XBoxOne
local IsTenFootInterface = GuiService:IsTenFootInterface()
local IsPlatformMatch1: boolean = Platform == Enum.Platform.IOS or Platform == Enum.Platform.Android
local IsPlatformMatch2 = Platform == Enum.Platform.Android

local function _(p1, p2)
	return p1 * (p2.Stroke and p2.Stroke.Standard or (p2.Global and p2.Stroke.Standard or 1))
end

local SearchBar = RoactModule.PureComponent:extend("SearchBar")
SearchBar.validateProps = TModule.strictInterface({
	Size = TModule.optional(TModule.UDim2),
	position = TModule.optional(TModule.UDim2),
	anchorPoint = TModule.optional(TModule.Vector2),
	cancelSearch = TModule.optional(TModule.callback),
	confirmSearch = TModule.optional(TModule.callback),
	onTextCleared = TModule.optional(TModule.callback),
	onFocused = TModule.optional(TModule.callback),
	placeholderText = TModule.optional(TModule.string),
	isCompactView = TModule.optional(TModule.boolean),
	modernUI = TModule.optional(TModule.boolean),
	initialSearchText = TModule.optional(TModule.string),
	autocomplete = TModule.optional(TModule.boolean),
	searchType = TModule.optional(TModule.string),
	isSearching = TModule.optional(TModule.boolean),
	searchBarPadding = TModule.optional(TModule.number),
	animated = TModule.optional(TModule.boolean),
	animationSettings = TModule.optional(TModule.table),
	focusController = TModule.optional(TModule.table),
	forwardRef = TModule.optional(TModule.table),
	[RoactModule.Ref] = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	autocompleteIXPConfigTbl = TModule.optional(TModule.table),
	ixpDisableGamesAutocomplete = TModule.optional(TModule.boolean),
	forceShowCancelButton = TModule.optional(TModule.boolean),
	onSameTermConfirmSearch = TModule.optional(TModule.callback),
	searchPageOverlayEnabled = if FFlagSearchOmniAutocompletePage then TModule.optional(TModule.boolean) else nil,
	disableListPicker = if FFlagSearchOmniAutocompletePage then TModule.optional(TModule.boolean) else nil,
	onTextChanged = if FFlagSearchOmniAutocompletePage then TModule.optional(TModule.callback) else nil,
	listPickerRef = if FFlagSearchOmniAutocompletePage then TModule.optional(TModule.table) else nil,
	onPickerItemsChanged = if FFlagSearchOmniAutocompletePage then TModule.optional(TModule.callback) else nil,
	layoutOrder = if FFlagSearchOmniAutocompletePage then TModule.optional(TModule.integer) else nil,
	updateAutocompleteOnMount = if FFlagSearchOmniAutocompletePage then TModule.optional(TModule.boolean) else nil,
	onExitSearch = if FFlagSearchOmniAutocompletePage then TModule.optional(TModule.callback) else nil,
	focusGuiObject = if ImproveSearchSelectionUX2 then TModule.optional(TModule.callback) else nil,
	focusedGuiObject = if ImproveSearchSelectionUX2 then TModule.optional(TModule.Instance) else nil,
	gameIcons = TModule.optional(TModule.table),
	autocompleteSuggestions = TModule.optional(TModule.table),
	avatarAutocompleteSuggestions = TModule.optional(TModule.table),
	currentPage = TModule.string,
	getAutocompleteFetchingStatus = TModule.callback,
	fetchAutocompleteSuggestion = TModule.callback,
	fetchGameIcons = TModule.callback,
	setSearchBarFocused = TModule.callback,
	dispatchSearchPageOverlay = if FFlagSearchOmniAutocompletePage then TModule.callback else nil,
	navigateToScanQrCode = if FFlagQRInSearchScanner then TModule.callback else nil,
	navigateToCameraPermissionOverlay = if FFlagQRInSearchScanner then TModule.callback else nil,
	navigateToProfileQrCode = if FFlagQRInSearchProfileQR then TModule.callback else nil,
	networking = TModule.callback,
	eventIngest = TModule.table,
	sessionService = TModule.optional(TModule.union(TModule.Instance, TModule.table)),
	shouldShowRecentSearchTerms = TModule.optional(TModule.boolean)
})
SearchBar.defaultProps = {
	cancelSearch = nil,
	confirmSearch = nil,
	onTextCleared = nil,
	onFocused = nil,
	placeholderText = "",
	isCompactView = false,
	modernUI = false,
	initialSearchText = "",
	autocomplete = false,
	searchType = "None",
	isSearching = false,
	searchBarPadding = 24,
	animated = false,
	forceShowCancelButton = false,
	Size = UDim2.new(1, 0, 1, 0)
}

function SearchBar.init(p1)
	-- upvalues: FFlagEnableAppNavGamepadRemoval (copy), CANCELBUTTONWIDTH (copy), RoactModule (copy), FFlagSearchOmniAutocompletePage (copy), ImproveSearchSelectionUX2 (copy), FocusNavigationUtilsModule (copy), InputHandlersModule (copy), AutocompleteSuggestionModule (copy), GetFIntLuaAppAutocompleteSearchTextMaxLenModule (copy), v1 (copy), DiscoveryUtilsModule (copy), GetFFlagAvatarAutocompleteEnabledForAllModule (copy), IXPService (copy), AppUserLayers (copy), LuaAppNewSlpEndpointIxpEnabled (copy), LuaAppNewSlpEndpointIxpLayer (copy), IsPlatformMatch2 (copy), FFlagEnableLeftNavOnConsole (copy), IsTenFootInterface (copy), IsPlatformMatch (copy), IsVRAppBuildFunction (copy), FFlagUsesCancelSearchAppPolicy (copy), GetAppFeaturePoliciesFunction (copy), IsPlatformMatch1 (copy), RunService (copy), SessionType (copy), SearchClearModule (copy), Config1 (copy), SearchUtilModule (copy), SearchTextTrimModule (copy), RecentSearchTermsAppStorage (copy), RetrievalStatus (copy), SearchSuggestionClickedModule (copy), SearchTypes (copy), SearchAutocompleteEventNewModule (copy), SearchAutocompleteModule (copy)
	local InitialSearchText = p1.props.initialSearchText or ""
	p1.state = {
		autocompleteKeyword = "",
		listPickerShown = false,
		clearButtonVisible = InitialSearchText ~= "",
		lastInputType = if FFlagEnableAppNavGamepadRemoval then nil else Enum.UserInputType.None,
		cancelButtonWidth = CANCELBUTTONWIDTH
	}
	p1.searchBoxBackgroundRef = RoactModule.createRef()
	p1.searchBoxRef = RoactModule.createRef()
	p1.clearRef = RoactModule.createRef()
	p1.cancelRef = RoactModule.createRef()
	p1.listPickerRef = FFlagSearchOmniAutocompletePage and p1.props.listPickerRef or RoactModule.createRef()
	p1.listPickerContainerRef = if ImproveSearchSelectionUX2 then RoactModule.createRef() else nil
	p1.lastSearchBoxText = InitialSearchText or ""
	p1.lastAutocompleteUpdateTime = 0
	p1.lastAutocompleteCached = false
	p1.lastAutocompleteEventKeyword = ""
	p1.lastStoredListPickerItems = {}
	p1.customEventHandlers = if ImproveSearchSelectionUX2 then {
		[FocusNavigationUtilsModule.FocusNavigationEventNameEnum.NavigateBack] = {
			handler = InputHandlersModule.onRelease(function(p2)
				-- upvalues: p1 (copy)
				local ListPickerShown = p1.state.listPickerShown
				
				if p1.props.isSearching then
					if ListPickerShown then
						local Current = p1.listPickerRef.current
						local Current1 = p1.listPickerContainerRef.current
						local FocusedGuiObject = p1.props.focusedGuiObject
						
						if Current1 and FocusedGuiObject and Current and FocusedGuiObject:IsDescendantOf(Current1) then
							p1.doCancelSearch()
							
							if p1.props.focusGuiObject and p1.searchBoxRef then
								p1.props.focusGuiObject(p1.searchBoxRef.current)
							end
						end
					else
						p1.doCancelSearch()
					end
					p2:cancel()
				end
			end)
		}
	} else nil
	
	function p1.requestAutocompleteSuggestion(AutocompleteKeyword)
		-- upvalues: p1 (copy)
		p1.props.fetchAutocompleteSuggestion(p1.props.networking, AutocompleteKeyword, p1.props.autocompleteIXPConfigTbl, p1.props.searchType)
	end
	
	function p1.requestRichSuggestionIcons(CachedAutocompleteSuggestion)
		-- upvalues: p1 (copy), AutocompleteSuggestionModule (upval)
		local Networking = p1.props.networking
		local FetchGameIconsFunction: (any, any) -> () = p1.props.fetchGameIcons
		local List = {}
		
		for i = 1, #CachedAutocompleteSuggestion.entries do
			local Entry = CachedAutocompleteSuggestion.entries[i]
			
			if Entry.type == AutocompleteSuggestionModule.EntryType.Rich then
				table.insert(List, Entry.universeId)
			end
		end
		if #List > 0 then
			FetchGameIconsFunction(Networking, List)
		end
	end
	
	function p1.updateAutocomplete(Text: string)
		-- upvalues: p1 (copy), GetFIntLuaAppAutocompleteSearchTextMaxLenModule (upval), v1 (upval)
		if Text == p1.state.autocompleteKeyword then return end
		if GetFIntLuaAppAutocompleteSearchTextMaxLenModule() < string.len(Text) then return end
		local CachedAutocompleteSuggestion = p1.getCachedAutocompleteSuggestion(Text)
		local IsCurrentTimeBelow: boolean = CachedAutocompleteSuggestion ~= nil and tick() < CachedAutocompleteSuggestion.expirationTime
		p1.lastAutocompleteUpdateTime = tick()
		p1.lastAutocompleteCached = IsCurrentTimeBelow
		p1:setState({ autocompleteKeyword = Text })
		
		if Text ~= "" and not IsCurrentTimeBelow then
			local CurrentTime = tick()
			spawn(function()
				-- upvalues: Text (copy), CurrentTime (copy), v1 (upval), p1 (upval)
				local CurrentTimeDelta = CurrentTime + v1 - tick()
				
				if CurrentTimeDelta > 0 then
					wait(CurrentTimeDelta)
				end
				if Text == p1.state.autocompleteKeyword then
					p1.requestAutocompleteSuggestion(Text)
				end
			end)
			
			return
		end
		if IsCurrentTimeBelow and CachedAutocompleteSuggestion.preloadedCache then
			p1.requestRichSuggestionIcons(CachedAutocompleteSuggestion)
		end
	end
	
	function p1.doConfirmSearch(Text, p2, Entries)
		-- upvalues: p1 (copy), DiscoveryUtilsModule (upval), GetFFlagAvatarAutocompleteEnabledForAllModule (upval)
		if not p1.isMounted then return end
		local Current = p1.searchBoxRef.current
		
		if Current and Current:IsFocused() then
			Current:ReleaseFocus()
		end
		if DiscoveryUtilsModule.isSearchTypeInOmniSearch(p1.props.searchType) and Text == "" then return end
		if p1.props.initialSearchText == Text then
			if p1.props.shouldShowRecentSearchTerms then
				if p1.searchBoxRef and p1.searchBoxRef.current then
					p1.searchBoxRef.current.Text = Text
				end
				if p1.props.onSameTermConfirmSearch then
					p1.props.onSameTermConfirmSearch()
				end
			end
			return
		else
			local ConfirmSearchFunction: (any, any, any) -> () = p1.props.confirmSearch
			
			if ConfirmSearchFunction then
				if GetFFlagAvatarAutocompleteEnabledForAllModule() then
					ConfirmSearchFunction(Text, p2, Entries)
					
					return
				end
				ConfirmSearchFunction(Text, p2)
			end
		end
	end
	
	function p1.doCancelSearch()
		-- upvalues: p1 (copy), FFlagSearchOmniAutocompletePage (upval)
		if not p1.isMounted then return end
		local Current = p1.searchBoxRef.current
		
		if Current and Current:IsFocused() then
			Current:ReleaseFocus()
		end
		local CancelSearchFunction: () -> () = p1.props.cancelSearch
		local OnExitSearch: () -> () = if FFlagSearchOmniAutocompletePage then p1.props.onExitSearch else nil
		
		if FFlagSearchOmniAutocompletePage and p1.props.searchPageOverlayEnabled then
			if OnExitSearch then
				OnExitSearch()
			end
		elseif CancelSearchFunction then
			CancelSearchFunction()
		end
		if Current then
			p1.searchBoxRef.current.Text = p1.props.initialSearchText
		end
	end
	
	function p1.onFocused()
		-- upvalues: p1 (copy), IXPService (upval), AppUserLayers (upval), LuaAppNewSlpEndpointIxpEnabled (upval), LuaAppNewSlpEndpointIxpLayer (upval), FFlagSearchOmniAutocompletePage (upval)
		if not p1.isMounted then return end
		p1.props.setSearchBarFocused(true)
		IXPService:LogUserLayerExposure(AppUserLayers.SearchLandingPageLayer)
		
		if LuaAppNewSlpEndpointIxpEnabled then
			IXPService:LogFlagLinkedUserLayerExposure(LuaAppNewSlpEndpointIxpLayer)
		end
		if FFlagSearchOmniAutocompletePage and p1.props.searchPageOverlayEnabled then
			local Current = p1.searchBoxRef.current
			
			if Current and Current:IsFocused() then
				p1.doCancelSearch()
			end
			p1.props.dispatchSearchPageOverlay(p1.props.initialSearchText, p1.props.searchType, p1.props.placeholderText)
			
			return
		elseif p1.props.onFocused then
			p1.props.onFocused()
		end
	end
	
	function p1.onFocusLost(p2, p3, Input)
		-- upvalues: p1 (copy), IsPlatformMatch2 (upval), FFlagEnableLeftNavOnConsole (upval), IsTenFootInterface (upval), IsPlatformMatch (upval), IsVRAppBuildFunction (upval), FFlagUsesCancelSearchAppPolicy (upval), GetAppFeaturePoliciesFunction (upval), ImproveSearchSelectionUX2 (upval), IsPlatformMatch1 (upval), RunService (upval)
		if not p1.isMounted then return end
		p1.props.setSearchBarFocused(false)
		
		if Input == nil and (IsPlatformMatch2 or (if FFlagEnableLeftNavOnConsole then IsTenFootInterface else IsPlatformMatch)) and not IsVRAppBuildFunction() then
			if not FFlagUsesCancelSearchAppPolicy then
				p1.doCancelSearch()
				
				return
			end
			local GetCancelSearchOnLostFocusFunction = GetAppFeaturePoliciesFunction().getCancelSearchOnLostFocus
			
			if GetCancelSearchOnLostFocusFunction == nil or GetCancelSearchOnLostFocusFunction() then
				p1.doCancelSearch()
				
				return
			end
		elseif ImproveSearchSelectionUX2 and Input ~= nil and Input.KeyCode == Enum.KeyCode.Return or p3 and (not IsPlatformMatch1 or RunService:IsStudio()) then
			p1.doConfirmSearch(p2.Text)
		end
	end
	
	function p1.onReturnPressedFromOnScreenKeyboard(p2)
		-- upvalues: p1 (copy)
		p1.doConfirmSearch(p2.Text)
	end
	
	function p1.onCancelButtonActivated()
		-- upvalues: p1 (copy), SessionType (upval)
		if p1.isMounted then
			p1.doCancelSearch()
			local SessionService = p1.props.sessionService
			
			if SessionService:SessionExists(SessionType.StructuralIdentifier.GameSearchAutocomplete) then
				SessionService:RemoveSession(SessionType.StructuralIdentifier.GameSearchAutocomplete)
			end
		end
	end
	
	function p1.onClearText()
		-- upvalues: p1 (copy), SearchClearModule (upval), FFlagSearchOmniAutocompletePage (upval), FFlagEnableAppNavGamepadRemoval (upval), Config1 (upval)
		if not p1.isMounted then return end
		if p1.searchBoxRef.current then
			SearchClearModule(p1.props.eventIngest, p1.getEventContext(), p1.searchBoxRef.current.Text, p1.props.searchType)
			
			if FFlagSearchOmniAutocompletePage and p1.props.searchPageOverlayEnabled then
				p1.props.dispatchSearchPageOverlay("", p1.props.searchType, p1.props.placeholderText)
			else
				p1.searchBoxRef.current.Text = ""
				p1.searchBoxRef.current:captureFocus()
			end
			if not FFlagEnableAppNavGamepadRemoval and Config1[p1.state.lastInputType] and p1.props.focusController then
				p1.props.focusController.moveFocusTo(p1.searchBoxRef)
			end
		end
	end
	
	function p1.onTextChanged(TextBox)
		-- upvalues: p1 (copy), SearchUtilModule (upval), SearchTextTrimModule (upval), FFlagSearchOmniAutocompletePage (upval)
		if not p1.isMounted then return end
		if not TextBox then return end
		local Text: string = TextBox.Text
		local IsNotTextMatch = Text ~= ""
		
		if IsNotTextMatch ~= p1.state.clearButtonVisible then
			p1:setState({ clearButtonVisible = IsNotTextMatch })
		end
		if p1.props.autocomplete and not p1.props.ixpDisableGamesAutocomplete then
			p1.updateAutocomplete((SearchUtilModule.KeywordNormalize((Text:lower()))))
		end
		if TextBox:IsFocused() then
			local LastSearchBoxText: string = p1.lastSearchBoxText
			
			if string.len(Text) < string.len(LastSearchBoxText) then
				SearchTextTrimModule(p1.props.eventIngest, p1.getEventContext(), LastSearchBoxText, Text, p1.props.searchType)
			end
		end
		p1.lastSearchBoxText = Text
		
		if Text == "" then
			local OnTextClearedFunction: () -> () = p1.props.onTextCleared
			
			if OnTextClearedFunction then
				OnTextClearedFunction()
			end
		end
		if FFlagSearchOmniAutocompletePage and p1.props.onTextChanged then
			p1.props.onTextChanged(Text)
		end
	end
	
	function p1.onCancelButtonSizeChanged(Frame)
		-- upvalues: p1 (copy)
		if Frame then
			p1:setState({ cancelButtonWidth = Frame.AbsoluteSize.X })
		end
	end
	
	function p1.getListPickerItems()
		-- upvalues: p1 (copy), RecentSearchTermsAppStorage (upval), RetrievalStatus (upval), AutocompleteSuggestionModule (upval), SearchSuggestionClickedModule (upval), FFlagSearchOmniAutocompletePage (upval)
		local LastStoredListPickerItems = {}
		local AutocompleteKeyword = p1.state.autocompleteKeyword
		
		if AutocompleteKeyword == "" then
			p1.lastStoredListPickerItems = LastStoredListPickerItems
			
			return LastStoredListPickerItems
		end
		local CachedAutocompleteSuggestion = p1.getCachedAutocompleteSuggestion(AutocompleteKeyword)
		local t = {}
		
		if p1.props.shouldShowRecentSearchTerms then
			for _, Text in RecentSearchTermsAppStorage.findTermsForQuery(AutocompleteKeyword) do
				t[Text] = true
				table.insert(LastStoredListPickerItems, {
					isRichItem = false,
					isRecentCatalogSearchItem = true,
					displayIcon = nil,
					text = Text,
					onSelect = function()
						-- upvalues: p1 (upval), Text (copy), CachedAutocompleteSuggestion (copy)
						p1.doConfirmSearch(Text, false, if CachedAutocompleteSuggestion then CachedAutocompleteSuggestion.entries else nil)
					end
				})
			end
		end
		if not CachedAutocompleteSuggestion then
			local AutocompleteFetchingStatus = p1.props.getAutocompleteFetchingStatus(AutocompleteKeyword, p1.props.searchType)
			
			if AutocompleteFetchingStatus == RetrievalStatus.NotStarted or AutocompleteFetchingStatus == RetrievalStatus.Fetching then
				return p1.lastStoredListPickerItems
			end
		end
		if CachedAutocompleteSuggestion then
			local GameIcons = p1.props.gameIcons
			
			for i = 1, #CachedAutocompleteSuggestion.entries do
				local Entry = CachedAutocompleteSuggestion.entries[i]
				local IsRichItem = false
				local Url = nil
				local CanonicalTitle = ""
				local CanonicalTitle1 = ""
				
				if Entry.type == AutocompleteSuggestionModule.EntryType.Rich then
					IsRichItem = true
					local GameIcon = GameIcons[tostring(Entry.universeId)]
					
					if GameIcon then
						Url = GameIcon.url
					end
					CanonicalTitle = Entry.canonicalTitle
					CanonicalTitle1 = Entry.canonicalTitle
				elseif Entry.type == AutocompleteSuggestionModule.EntryType.Keyword then
					CanonicalTitle = Entry.searchQuery:lower()
					CanonicalTitle1 = CanonicalTitle
				end
				if not p1.props.shouldShowRecentSearchTerms or not t[CanonicalTitle] then
					table.insert(LastStoredListPickerItems, {
						isRichItem = IsRichItem,
						displayIcon = Url,
						text = CanonicalTitle,
						onSelect = function()
							-- upvalues: SearchSuggestionClickedModule (upval), p1 (upval), AutocompleteKeyword (copy), CachedAutocompleteSuggestion (copy), i (copy), Entry (copy), CanonicalTitle1 (ref), FFlagSearchOmniAutocompletePage (upval)
							SearchSuggestionClickedModule(p1.props.eventIngest, p1.getEventContext(), AutocompleteKeyword, p1.props.searchType, CachedAutocompleteSuggestion.entries, i, Entry)
							p1.doConfirmSearch(CanonicalTitle1, true, CachedAutocompleteSuggestion.entries)
							
							if FFlagSearchOmniAutocompletePage and not p1.getCachedAutocompleteSuggestion(CanonicalTitle1) then
								p1.requestAutocompleteSuggestion(CanonicalTitle1)
							end
						end
					})
				end
			end
		end
		p1.lastStoredListPickerItems = LastStoredListPickerItems
		
		return LastStoredListPickerItems
	end
	
	function p1.getCachedAutocompleteSuggestion(AutocompleteKeyword)
		-- upvalues: p1 (copy), GetFFlagAvatarAutocompleteEnabledForAllModule (upval), SearchTypes (upval)
		return (if GetFFlagAvatarAutocompleteEnabledForAllModule() and p1.props.searchType == SearchTypes.Catalog then p1.props.avatarAutocompleteSuggestions else p1.props.autocompleteSuggestions)[AutocompleteKeyword]
	end
	
	function p1.getEventContext(): string
		-- upvalues: GetFFlagAvatarAutocompleteEnabledForAllModule (upval), p1 (copy), SearchTypes (upval)
		return if GetFFlagAvatarAutocompleteEnabledForAllModule() and p1.props.searchType == SearchTypes.Catalog then "AvatarShopSearch" else "GameSearch"
	end
	
	function p1.updateAutocompleteEvent()
		-- upvalues: p1 (copy), GetFFlagAvatarAutocompleteEnabledForAllModule (upval), SearchAutocompleteEventNewModule (upval), SearchAutocompleteModule (upval)
		if p1.props.autocomplete and not p1.props.ixpDisableGamesAutocomplete then
			local AutocompleteKeyword = p1.state.autocompleteKeyword
			
			if p1.lastAutocompleteEventKeyword ~= AutocompleteKeyword then
				local CachedAutocompleteSuggestion = p1.getCachedAutocompleteSuggestion(AutocompleteKeyword)
				
				if CachedAutocompleteSuggestion then
					local EventIngest = p1.props.eventIngest
					local CurrentPage = p1.props.currentPage
					local ScaledCurrentTime = (tick() - p1.lastAutocompleteUpdateTime) * 1000
					
					if GetFFlagAvatarAutocompleteEnabledForAllModule() then
						SearchAutocompleteEventNewModule(EventIngest, p1.getEventContext(), AutocompleteKeyword, p1.lastAutocompleteEventKeyword, CachedAutocompleteSuggestion, CurrentPage, ScaledCurrentTime, p1.lastAutocompleteCached, p1.props.searchType)
					else
						SearchAutocompleteModule(EventIngest, "GameSearch", AutocompleteKeyword, p1.lastAutocompleteEventKeyword, CachedAutocompleteSuggestion, CurrentPage, ScaledCurrentTime, p1.lastAutocompleteCached)
					end
					p1.lastAutocompleteEventKeyword = AutocompleteKeyword
				end
			end
		end
	end
	
	function p1.onSearchIconActivated()
		-- upvalues: p1 (copy)
		local Current = p1.searchBoxRef.current
		local IsSearching = p1.props.isSearching
		
		if Current and IsSearching and not Current:IsFocused() then
			Current:CaptureFocus()
		end
	end
end

if FFlagQRInSearchScanner then
	function SearchBar.openQrCodeScanner(p2)
		-- upvalues: Default (copy)
		Default.default:checkOrRequestPermissions({ Default.Permissions.CAMERA_ACCESS }):andThen(function(Result)
			-- upvalues: Default (upval), p2 (copy)
			if Result == Default.Status.AUTHORIZED then
				p2.props.navigateToScanQrCode()
				
				return
			else
				p2.props.navigateToCameraPermissionOverlay()
			end
		end)
	end
end
function SearchBar.didUpdate(p2, _)
	-- upvalues: FFlagSearchOmniAutocompletePage (copy)
	local Current = p2.searchBoxRef.current
	
	if Current then
		local ListPickerShown = p2.state.listPickerShown
		
		if p2.props.isSearching then
			local AutocompleteKeyword = p2.state.autocompleteKeyword
			
			if not ListPickerShown and AutocompleteKeyword ~= "" then
				p2:setState({ listPickerShown = true })
			end
		elseif ListPickerShown then
			p2:setState({ listPickerShown = false })
		end
	end
	if p2.cancelRef.current and p2.state.cancelButtonWidth ~= p2.cancelRef.current.AbsoluteSize.X then
		p2:setState({ cancelButtonWidth = p2.cancelRef.current.AbsoluteSize.X })
	end
	if Current and Current:IsFocused() then
		p2.updateAutocompleteEvent()
	end
	if FFlagSearchOmniAutocompletePage and p2.props.onPickerItemsChanged then
		if not p2.previousPickerItems then
			p2.previousPickerItems = {}
		end
		local PreviousPickerItems = p2.previousPickerItems
		local LastStoredListPickerItems = p2.lastStoredListPickerItems
		local Flag = true
		
		if #PreviousPickerItems == #LastStoredListPickerItems then
			for i = 1, #LastStoredListPickerItems do
				if PreviousPickerItems[i].text == LastStoredListPickerItems[i].text then
					continue
				end
				Flag = false
				break
			end
		else
			Flag = false
		end
		if not Flag then
			p2.previousPickerItems = LastStoredListPickerItems
			p2.props.onPickerItemsChanged(LastStoredListPickerItems)
		end
	end
end

function SearchBar.didMount(p3)
	-- upvalues: OtterModule (copy), SearchConstants (copy), CANCELBUTTONPADDING (copy), CANCELBUTTONWIDTH (copy), FFlagSearchOmniAutocompletePage (copy), SearchUtilModule (copy)
	p3.isMounted = true
	
	if p3.animationMotor then
		p3.animationMotor:destroy()
	end
	p3.animationMotor = OtterModule.createSingleMotor(0)
	p3.animationMotor:onStep(function(XScale: number)
		-- upvalues: p3 (copy), SearchConstants (upval), CANCELBUTTONPADDING (upval), CANCELBUTTONWIDTH (upval)
		if p3.isMounted then
			local Current = p3.searchBoxBackgroundRef.current
			
			if Current then
				if p3.props.animationSettings and p3.props.animationSettings.animationStyle == SearchConstants.SearchBarAnimationStyle.ExpandFromCenter then
					local NewCANCELBUTTONPADDING = CANCELBUTTONPADDING + CANCELBUTTONWIDTH
					Current.Size = UDim2.new(XScale, (p3.props.animationSettings.originalWidth or 0) * (1 - XScale), 1, 0)
					Current.Position = UDim2.new(0.5, NewCANCELBUTTONPADDING / 2 * (1 - XScale), 0, 0)
					
					return
				else
					Current.Size = UDim2.new(XScale, 0, 1, 0)
					Current.Position = UDim2.new(1 - XScale, 0, 0, 0)
				end
			end
		end
	end)
	
	if p3.props.animated then
		p3.animationMotor:setGoal(OtterModule.spring(1, { dampingRatio = 1, frequency = 4 }))
	end
	local Current = p3.searchBoxRef.current
	
	if Current and p3.props.isSearching and not Current:IsFocused() then
		Current:CaptureFocus()
	end
	if FFlagSearchOmniAutocompletePage and p3.props.updateAutocompleteOnMount and (p3.props.autocomplete and not p3.props.ixpDisableGamesAutocomplete and Current) then
		p3.updateAutocomplete((SearchUtilModule.KeywordNormalize((Current.Text:lower()))))
	end
	if p3.cancelRef.current then
		p3:setState({ cancelButtonWidth = p3.cancelRef.current.AbsoluteSize.X })
	end
end

function SearchBar.willUnmount(p3)
	p3.isMounted = false
	
	if p3.animationMotor then
		p3.animationMotor:destroy()
	end
end

function SearchBar.renderWithProviders(p3, Callback, p4)
	-- upvalues: SEARCHBARHEIGHT (copy), SEARCHBARPADDING (copy), SEARCHBARTEXTSIZE (copy), SEARCHBARTEXTPADDINGWITHOUTICON (copy), SEARCHBARTEXTPADDINGWITHICON (copy), XOffset (copy), CANCELBUTTONWIDTH (copy), FFlagSearchOmniAutocompletePage (copy), FFlagQRInSearchScanner (copy), FFlagQRInSearchProfileQR (copy), GetAppFeaturePoliciesFunction (copy), WithStyleFunction (copy), RoactModule (copy), DEPRECATEDImageSetButtonModule (copy), SEARCHBARICONPADDING (copy), Focusable (copy), CursorKind (copy), ImageSetLabel (copy), CLEARIMAGESIZE (copy), CLEARIMAGEPADDING (copy), IconsActionsEditClearSmall (copy), TelemetryService (copy), Config (copy), Sources (copy), ReactModule (copy), View (copy), Image (copy), StateLayerAffordance (copy), AXMigrateSearchBarToFocusNavigation (copy), RoactGamepadModule (copy), CANCELBUTTONPADDING (copy), DEPRECATEDImageSetLabelModule (copy), SearchConstants (copy), config (copy), ImproveSearchSelectionUX2 (copy), FitChildrenModule (copy), SearchBarListPickerModule (copy), TABLETLISTPICKERHEIGHT (copy), FFlagBoldSearchListPickerSuggestionsModule (copy), GetFFlagAvatarAutocompleteEnabledForAllModule (copy), SearchTypes (copy), FocusNavigableSurfaceWrapper (copy), FocusNavigableSurfaceIdentifierEnum (copy), Images (copy), FFlagEnableAppNavGamepadRemoval (copy), ExternalEventConnection (copy), UserInputService (copy)
	local Size = p3.props.Size
	local IsCompactView = p3.props.isCompactView
	local ModernUI = p3.props.modernUI
	local ClearButtonVisible = p3.state.clearButtonVisible
	local YOffset: number = SEARCHBARHEIGHT
	local SearchBarPadding = SEARCHBARPADDING
	local SEARCHBARTEXTSIZE1: number = SEARCHBARTEXTSIZE
	local SEARCHBARTEXTPADDINGWITHOUTICON1 = IsCompactView and SEARCHBARTEXTPADDINGWITHOUTICON or SEARCHBARTEXTPADDINGWITHICON
	local NewSEARCHBARTEXTPADDINGWITHOUTICON = ClearButtonVisible and SEARCHBARTEXTPADDINGWITHOUTICON1 + XOffset or SEARCHBARTEXTPADDINGWITHOUTICON1
	local NoIsCompactView = not IsCompactView
	
	if IsCompactView or ModernUI then
		YOffset = 36
		SearchBarPadding = p3.props.searchBarPadding
		SEARCHBARTEXTSIZE1 = 24
		SEARCHBARTEXTPADDINGWITHOUTICON1 = 9 + SEARCHBARTEXTSIZE1 + 9
		NewSEARCHBARTEXTPADDINGWITHOUTICON = ClearButtonVisible and SEARCHBARTEXTPADDINGWITHOUTICON1 + XOffset or SEARCHBARTEXTPADDINGWITHOUTICON1
		NoIsCompactView = true
	end
	local NoIxpDisableGamesAutocomplete: boolean = p3.props.autocomplete and not p3.props.ixpDisableGamesAutocomplete
	local ListPickerShown = p3.state.listPickerShown
	local _UDim = UDim.new(1, 0)
	local NoDisableListPicker = if FFlagSearchOmniAutocompletePage then NoIxpDisableGamesAutocomplete and (ListPickerShown and not p3.props.disableListPicker) else NoIxpDisableGamesAutocomplete and ListPickerShown
	local IsSearching = p3.props.isSearching or p3.props.forceShowCancelButton
	local CancelButtonWidth = p3.state.cancelButtonWidth
	local CancelButtonWidth1 = IsSearching and CancelButtonWidth or 0
	local Animated = p3.props.animated
	local FriendCodeQrCodeScannerEnabled = if FFlagQRInSearchScanner then not ClearButtonVisible and GetAppFeaturePoliciesFunction().getFriendCodeQrCodeScannerEnabled() else FFlagQRInSearchProfileQR and (not ClearButtonVisible and GetAppFeaturePoliciesFunction().getFriendCodeQrCodeScannerEnabled())
	
	return WithStyleFunction(function(p5)
		-- upvalues: NoIsCompactView (ref), RoactModule (upval), DEPRECATEDImageSetButtonModule (upval), SEARCHBARTEXTSIZE1 (ref), SEARCHBARICONPADDING (upval), p3 (copy), FFlagQRInSearchScanner (upval), FFlagQRInSearchProfileQR (upval), FriendCodeQrCodeScannerEnabled (copy), Focusable (upval), NewSEARCHBARTEXTPADDINGWITHOUTICON (ref), SEARCHBARTEXTPADDINGWITHOUTICON1 (ref), ClearButtonVisible (copy), IsSearching (copy), NoDisableListPicker (copy), Callback (copy), CursorKind (upval), XOffset (upval), IsCompactView (copy), ImageSetLabel (upval), CLEARIMAGESIZE (upval), CLEARIMAGEPADDING (upval), IconsActionsEditClearSmall (upval), TelemetryService (upval), Config (upval), Sources (upval), ReactModule (upval), View (upval), Image (upval), StateLayerAffordance (upval), AXMigrateSearchBarToFocusNavigation (upval), RoactGamepadModule (upval), CANCELBUTTONPADDING (upval), CancelButtonWidth1 (copy), YOffset (ref), DEPRECATEDImageSetLabelModule (upval), SearchConstants (upval), Animated (copy), config (upval), p4 (copy), ImproveSearchSelectionUX2 (upval), FitChildrenModule (upval), SearchBarListPickerModule (upval), _UDim (copy), FFlagSearchOmniAutocompletePage (upval), TABLETLISTPICKERHEIGHT (upval), FFlagBoldSearchListPickerSuggestionsModule (upval), GetFFlagAvatarAutocompleteEnabledForAllModule (upval), SearchTypes (upval), FocusNavigableSurfaceWrapper (upval), FocusNavigableSurfaceIdentifierEnum (upval), Size (copy), SearchBarPadding (ref), Images (upval), FFlagEnableAppNavGamepadRemoval (upval), ExternalEventConnection (upval), UserInputService (upval)
		local TextEmphasis = p5.Theme.TextEmphasis
		local Element = NoIsCompactView
		
		if Element then
			local Tokens = p5.Tokens
			local Tokens1 = p5.Tokens
			Element = RoactModule.createElement(DEPRECATEDImageSetButtonModule, {
				Size = UDim2.new(0, SEARCHBARTEXTSIZE1 * (Tokens.Stroke and Tokens.Stroke.Standard or (Tokens.Global and Tokens.Stroke.Standard or 1)), 0, SEARCHBARTEXTSIZE1 * (Tokens1.Stroke and Tokens1.Stroke.Standard or (Tokens1.Global and Tokens1.Stroke.Standard or 1))),
				Position = UDim2.new(0, SEARCHBARICONPADDING, 0.5, 0),
				Selectable = false,
				Image = "LuaApp/icons/ic-search-new",
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0, 0.5),
				ImageColor3 = p5.Theme.IconEmphasis.Color,
				ImageTransparency = p5.Theme.IconEmphasis.Transparency,
				[RoactModule.Event.Activated] = p3.onSearchIconActivated
			})
		end
		local ListPickerItems = p3.getListPickerItems()
		local Tokens = p5.Tokens
		local SEARCHBARTEXTSIZEDelta = SEARCHBARTEXTSIZE1 * (Tokens.Stroke and Tokens.Stroke.Standard or (Tokens.Global and Tokens.Stroke.Standard or 1)) - SEARCHBARTEXTSIZE1
		local v2: number = if (FFlagQRInSearchScanner or FFlagQRInSearchProfileQR) and FriendCodeQrCodeScannerEnabled then 30 else 0
		local OnActivated = if FFlagQRInSearchScanner then function()
			-- upvalues: TelemetryService (upval), Config (upval), p3 (upval), Sources (upval)
			TelemetryService:LogEvent(Config, {
				customFields = { btn = "scanQR", page = p3.props.searchType },
				eventContext = Sources.OmniSearchBar
			})
			
			return p3:openQrCodeScanner()
		end elseif FFlagQRInSearchProfileQR then function()
			-- upvalues: TelemetryService (upval), Config (upval), p3 (upval), Sources (upval)
			TelemetryService:LogEvent(Config, {
				customFields = { btn = "myQR", page = p3.props.searchType },
				eventContext = Sources.OmniSearchBar
			})
			p3.props.navigateToProfileQrCode()
		end else nil
		local Element1 = if (FFlagQRInSearchScanner or FFlagQRInSearchProfileQR) and FriendCodeQrCodeScannerEnabled then ReactModule.createElement(View, {
			tag = "anchor-center-right position-center-right grow auto-xy padding-right-xxsmall",
			ZIndex = 3
		}, {
			ReactModule.createElement(Image, {
				tag = "size-700 content-emphasis",
				Image = if FFlagQRInSearchScanner then "icons/actions/scan" else "icons/menu/scanqr",
				onActivated = OnActivated,
				stateLayer = { affordance = StateLayerAffordance.None }
			})
		}) else nil
		local Tokens2 = p5.Tokens
		local Frame = NoDisableListPicker and RoactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 0),
			Position = UDim2.new(0, 0, 1, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			[RoactModule.Ref] = if ImproveSearchSelectionUX2 then p3.listPickerContainerRef else nil
		}, {
			Picker = RoactModule.createElement(FitChildrenModule.FitFrame, {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 0),
				fitAxis = FitChildrenModule.FitAxis.Height
			}, {
				SearchBarListPicker = RoactModule.createElement(Focusable[SearchBarListPickerModule], {
					items = ListPickerItems,
					width = _UDim,
					height = if IsCompactView then nil else (if FFlagSearchOmniAutocompletePage then UDim.new(0, TABLETLISTPICKERHEIGHT) else TABLETLISTPICKERHEIGHT) or nil,
					[RoactModule.Ref] = p3.listPickerRef,
					currentKeyword = if FFlagBoldSearchListPickerSuggestionsModule then p3.state.autocompleteKeyword else nil,
					NextSelectionUp = p3.searchBoxRef,
					inputBindings = if AXMigrateSearchBarToFocusNavigation then nil else {
						CancelSearch = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, p3.doCancelSearch)
					}
				})
			})
		})
		
		return RoactModule.createElement(FocusNavigableSurfaceWrapper, {
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.SearchBar,
			frameProps = {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = if FFlagSearchOmniAutocompletePage then p3.props.layoutOrder else nil,
				Position = p3.props.position or nil,
				AnchorPoint = p3.props.anchorPoint or nil,
				Size = Size
			},
			customEventHandlers = if ImproveSearchSelectionUX2 then p3.customEventHandlers else nil
		}, {
			Shadow = (if GetFFlagAvatarAutocompleteEnabledForAllModule() then Frame and (not IsCompactView or p3.props.searchType == SearchTypes.Catalog) else Frame and not IsCompactView) and RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = -1,
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0, -19),
				Size = UDim2.new(1, 28 + SearchBarPadding * 2, 1, Size.Y.Offset + TABLETLISTPICKERHEIGHT + 28 + 5 + 12),
				Image = Images["component_assets/dropshadow_16_20"],
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(28, 28, 29, 29),
				ImageColor3 = p5.Theme.DropShadow.Color,
				ImageTransparency = p5.Theme.DropShadow.Transparency
			}, {
				Background = RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Position = UDim2.new(0, 14, 0, 14),
					Size = UDim2.new(1, -28, 1, -28),
					BackgroundColor3 = p5.Theme.BackgroundDefault.Color,
					BackgroundTransparency = p5.Theme.BackgroundDefault.Transparency
				}, {
					UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 14) })
				})
			}),
			Bar = RoactModule.createElement(Focusable.Frame, {
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(0, 0, 0, 0),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				[RoactModule.Ref] = p3.props.forwardRef,
				NextSelectionDown = if NoDisableListPicker then p3.searchBoxRef else p3.props.NextSelectionDown,
				NextSelectionRight = p3.props.NextSelectionRight,
				defaultChild = p3.searchBoxRef,
				inputBindings = if AXMigrateSearchBarToFocusNavigation then nil else {
					CancelSearch = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, p3.doCancelSearch)
				}
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, CANCELBUTTONPADDING)
				}),
				SearchBoxContainer = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					Size = UDim2.new(1, -CancelButtonWidth1, 0, YOffset * (Tokens2.Stroke and Tokens2.Stroke.Standard or (Tokens2.Global and Tokens2.Stroke.Standard or 1)))
				}, {
					SearchBoxBackground = RoactModule.createElement(DEPRECATEDImageSetLabelModule, {
						AnchorPoint = if p3.props.animationSettings and p3.props.animationSettings.animationStyle == SearchConstants.SearchBarAnimationStyle.ExpandFromCenter then Vector2.new(0.5, 0) else nil,
						Size = Animated and UDim2.new(0, 0, 0, 0) or UDim2.new(1, 0, 1, 0),
						Position = if p3.props.animationSettings and p3.props.animationSettings.animationStyle == SearchConstants.SearchBarAnimationStyle.ExpandFromCenter then UDim2.fromScale(0.5, 0) else UDim2.new(0, 0, 0, 0),
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Image = config.Image,
						ImageColor3 = p5.Theme.UIDefault.Color,
						ImageTransparency = p5.Theme.UIDefault.Transparency,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = config.SliceCenter,
						[RoactModule.Ref] = p3.searchBoxBackgroundRef,
						ClipsDescendants = true
					}, {
						SearchIcon = Element,
						SearchBox = RoactModule.createElement(Focusable.TextBox, {
							Size = UDim2.new(1, -NewSEARCHBARTEXTPADDINGWITHOUTICON - SEARCHBARTEXTSIZEDelta - (if FFlagQRInSearchScanner or FFlagQRInSearchProfileQR then v2 else 0), 1, 0),
							Position = UDim2.new(0, SEARCHBARTEXTPADDINGWITHOUTICON1 + SEARCHBARTEXTSIZEDelta, 0.5, 0),
							AnchorPoint = Vector2.new(0, 0.5),
							BackgroundTransparency = 1,
							BorderSizePixel = 0,
							Text = p3.props.initialSearchText or "",
							Font = p5.Font.Body.Font,
							TextSize = p5.Font.BaseSize * p5.Font.Body.RelativeSize,
							TextColor3 = TextEmphasis.Color,
							TextTransparency = TextEmphasis.Transparency,
							TextWrapped = false,
							TextXAlignment = Enum.TextXAlignment.Left,
							ClipsDescendants = true,
							PlaceholderText = p3.props.placeholderText,
							PlaceholderColor3 = TextEmphasis.Color,
							OverlayNativeInput = true,
							TextInputType = Enum.TextInputType.NoSuggestions,
							ReturnKeyType = Enum.ReturnKeyType.Search,
							ClearTextOnFocus = false,
							[RoactModule.Ref] = p3.searchBoxRef,
							[RoactModule.Event.FocusLost] = p3.onFocusLost,
							[RoactModule.Event.Focused] = p3.onFocused,
							[RoactModule.Change.Text] = p3.onTextChanged,
							[RoactModule.Event.ReturnPressedFromOnScreenKeyboard] = p3.onReturnPressedFromOnScreenKeyboard,
							NextSelectionRight = if ClearButtonVisible then p3.clearRef elseif IsSearching then p3.cancelRef else nil,
							NextSelectionDown = if #ListPickerItems > 0 then p3.listPickerRef elseif NoDisableListPicker then p3.searchBoxRef else nil,
							SelectionImageObject = Callback(CursorKind.InputFields)
						}),
						ClearButton = RoactModule.createElement(Focusable[DEPRECATEDImageSetButtonModule], {
							AnchorPoint = Vector2.new(1, 0.5),
							Size = UDim2.new(0, XOffset, 1, 0),
							Position = UDim2.new(1, 0, 0.5, 0),
							BackgroundTransparency = 1,
							Visible = ClearButtonVisible,
							[RoactModule.Event.Activated] = p3.onClearText,
							[RoactModule.Ref] = p3.clearRef,
							NextSelectionLeft = p3.searchBoxRef,
							NextSelectionDown = if #ListPickerItems > 0 then p3.listPickerRef elseif NoDisableListPicker then p3.searchBoxRef else nil,
							NextSelectionRight = (IsSearching or IsCompactView) and p3.cancelRef or nil,
							SelectionImageObject = Callback(CursorKind.RoundedRectNoInset)
						}, {
							ClearImage = RoactModule.createElement(ImageSetLabel, {
								BackgroundTransparency = 1,
								AnchorPoint = Vector2.new(1, 0.5),
								Size = UDim2.new(0, CLEARIMAGESIZE, 0, CLEARIMAGESIZE),
								Position = UDim2.new(1, -CLEARIMAGEPADDING, 0.5, 0),
								Image = IconsActionsEditClearSmall,
								ImageColor3 = p5.Theme.IconEmphasis.Color,
								ImageTransparency = p5.Theme.IconEmphasis.Transparency
							})
						}),
						QRCodeButton = if FFlagQRInSearchScanner or FFlagQRInSearchProfileQR then Element1 else nil
					})
				}),
				CancelButton = IsSearching and RoactModule.createElement(Focusable.TextButton, {
					Size = UDim2.new(0, 0, 0, YOffset),
					AutomaticSize = Enum.AutomaticSize.X,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Text = p4.cancelButtonText,
					TextXAlignment = Enum.TextXAlignment.Center,
					Font = p5.Font.Body.Font,
					TextSize = p5.Font.BaseSize * p5.Font.Body.RelativeSize,
					TextColor3 = p5.Theme.TextEmphasis.Color,
					TextTransparency = p5.Theme.TextEmphasis.Transparency,
					LayoutOrder = 2,
					[RoactModule.Event.Activated] = p3.onCancelButtonActivated,
					[RoactModule.Ref] = p3.cancelRef,
					[RoactModule.Change.AbsoluteSize] = p3.onCancelButtonSizeChanged,
					NextSelectionLeft = ClearButtonVisible and p3.clearRef or p3.searchBoxRef,
					NextSelectionDown = if #ListPickerItems > 0 then p3.listPickerRef else nil,
					NextSelectionRight = p3.cancelRef,
					SelectionImageObject = Callback(CursorKind.RoundedRectNoInset)
				}, {
					Padding = RoactModule.createElement("UIPadding", {
						PaddingRight = UDim.new(0, CANCELBUTTONPADDING),
						PaddingLeft = UDim.new(0, CANCELBUTTONPADDING),
						PaddingTop = UDim.new(0, CANCELBUTTONPADDING),
						PaddingBottom = UDim.new(0, CANCELBUTTONPADDING)
					})
				})
			}),
			Picker = Frame,
			LastInputChangedListener = if FFlagEnableAppNavGamepadRemoval then nil else RoactModule.createElement(ExternalEventConnection, {
				event = UserInputService.LastInputTypeChanged,
				callback = function(LastInputType)
					-- upvalues: p3 (upval)
					p3:setState({ lastInputType = LastInputType })
				end
			})
		})
	end)
end

function SearchBar.render(p3)
	-- upvalues: WithSelectionCursorProviderFunction (copy), WithLocalizationFunction (copy)
	return WithSelectionCursorProviderFunction(function(p4)
		-- upvalues: WithLocalizationFunction (upval), p3 (copy)
		return WithLocalizationFunction({ cancelButtonText = "Feature.GamePage.LabelCancelField" })(function(p5)
			-- upvalues: p3 (upval), p4 (copy)
			return p3:renderWithProviders(p4, p5)
		end)
	end)
end

local _ = function(p3, p4)
	-- upvalues: FetchAutocompleteSuggestionModule (copy)
	return function(p5)
		-- upvalues: FetchAutocompleteSuggestionModule (upval), p3 (copy), p4 (copy)
		return FetchAutocompleteSuggestionModule.GetFetchingStatus(p5:getState(), p3, p4)
	end
end

local v2: (any) -> any = RoactRoduxModule.connect(function(p3, _)
	-- upvalues: GameIconReducer (copy), FFlagSignalsNavP3hMisc (copy), GetCurrentPageModule (copy)
	return {
		gameIcons = p3[GameIconReducer.key],
		autocompleteSuggestions = p3.AutocompleteSuggestions,
		avatarAutocompleteSuggestions = p3.AvatarExperience.AvatarAutocompleteSuggestions,
		currentPage = if FFlagSignalsNavP3hMisc then nil else GetCurrentPageModule(p3)
	}
end, function(Callback)
	-- upvalues: FFlagQRInSearchScanner (copy), AppPageModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy), SettingsRoute (copy), Sources (copy), FFlagQRInSearchProfileQR (copy), NavigateDownTo3DQRCodePageModule (copy), FetchAutocompleteSuggestionModule (copy), ApiFetchGameIconsFunction (copy), FFlagUseSignalsForSearchBar (copy), GetSearchBarStoreFunction (copy), SetSearchBarFocusedModule (copy), FFlagSearchOmniAutocompletePage (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy)
	return {
		navigateToScanQrCode = if FFlagQRInSearchScanner then function()
			-- upvalues: AppPageModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			local config = { name = AppPageModule.ScanQrCode }
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			else
				Callback(NavigateDownModule(config))
			end
		end else nil,
		navigateToCameraPermissionOverlay = if FFlagQRInSearchScanner then function()
			-- upvalues: AppPageModule (upval), SettingsRoute (upval), Sources (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			local config = {
				name = AppPageModule.SettingsPermissionInteractiveAlert,
				settingsRoute = SettingsRoute.Camera,
				source = Sources.OmniSearchBar
			}
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			else
				Callback(NavigateDownModule(config))
			end
		end else nil,
		navigateToProfileQrCode = if FFlagQRInSearchProfileQR then function()
			-- upvalues: Callback (copy), NavigateDownTo3DQRCodePageModule (upval), Sources (upval)
			Callback(NavigateDownTo3DQRCodePageModule({ source = Sources.OmniSearchBar }))
		end else nil,
		getAutocompleteFetchingStatus = function(p3, p4)
			-- upvalues: Callback (copy), FetchAutocompleteSuggestionModule (upval)
			return Callback(function(p5)
				-- upvalues: FetchAutocompleteSuggestionModule (upval), p3 (copy), p4 (copy)
				return FetchAutocompleteSuggestionModule.GetFetchingStatus(p5:getState(), p3, p4)
			end)
		end,
		fetchAutocompleteSuggestion = function(p3, p4, p5, p6)
			-- upvalues: Callback (copy), FetchAutocompleteSuggestionModule (upval)
			Callback(FetchAutocompleteSuggestionModule.Fetch(p3, p4, p5, p6))
		end,
		fetchGameIcons = function(p3, p4)
			-- upvalues: Callback (copy), ApiFetchGameIconsFunction (upval)
			Callback(ApiFetchGameIconsFunction(p3, p4))
		end,
		setSearchBarFocused = function(p3)
			-- upvalues: FFlagUseSignalsForSearchBar (upval), GetSearchBarStoreFunction (upval), Callback (copy), SetSearchBarFocusedModule (upval)
			if FFlagUseSignalsForSearchBar then
				GetSearchBarStoreFunction(false).setFocused(p3)
				
				return
			else
				return Callback(SetSearchBarFocusedModule(p3))
			end
		end,
		dispatchSearchPageOverlay = if FFlagSearchOmniAutocompletePage then function(InitialSearchText, SearchType, PlaceholderText)
			-- upvalues: Callback (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval)
			Callback(SetCentralOverlayFunction(CentralOverlayType.SearchPageOverlay, {
				isFocused = true,
				initialSearchText = InitialSearchText,
				searchType = SearchType,
				placeholderText = PlaceholderText
			}))
		end else nil
	}
end)(SearchBar)

if FFlagSignalsNavP3hMisc then
	local v3 = v2
	
	v2 = function(p3)
		-- upvalues: GetLegacyNavigationStore (copy), UseSignalState (copy), ReactModule (copy), v3 (copy), CryoModule (copy)
		return ReactModule.createElement(v3, CryoModule.Dictionary.join(p3, {
			currentPage = UseSignalState(GetLegacyNavigationStore(false).getCurrentPage).name
		}))
	end
end
if GetFFlagLuaAppAutocompleteIXPConfigModule() then
	v2 = RoactAppExperimentModule.connectUserLayer({ AppUserLayers.SearchAutocompleteLayer }, function(p3, _)
		-- upvalues: AppUserLayers (copy)
		local AutocompleteIXPConfigTbl = p3[AppUserLayers.SearchAutocompleteLayer] or {}
		
		return {
			autocompleteIXPConfigTbl = AutocompleteIXPConfigTbl,
			ixpDisableGamesAutocomplete = AutocompleteIXPConfigTbl.ixpDisableGamesAutocomplete == "true"
		}
	end)(v2)
end
local v4 = RoactServices.connect({
	networking = RoactNetworkingModule,
	eventIngest = AppEventIngestService,
	sessionService = AppSessionService
})(v2)

return RoactModule.forwardRef(function(p3, ForwardRef)
	-- upvalues: ImproveSearchSelectionUX2 (copy), ReactFocusNavigationModule (copy), RoactModule (copy), v4 (ref), CryoModule (copy)
	return RoactModule.createElement(v4, CryoModule.Dictionary.join(p3, {
		forwardRef = ForwardRef,
		focusGuiObject = if ImproveSearchSelectionUX2 then ReactFocusNavigationModule.useFocusGuiObject() else nil,
		focusedGuiObject = if ImproveSearchSelectionUX2 then ReactFocusNavigationModule.useFocusedGuiObject() else nil
	}))
end)