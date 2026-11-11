local CorePackages = game:GetService("CorePackages")
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ReactModule = require(CorePackages.Packages.React)
local ReactOtterModule = require(CorePackages.Packages.ReactOtter)
local UseAnimatedBindingFunction = ReactOtterModule.useAnimatedBinding
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local RoactServiceTagsModule = require(CorePackages.Workspace.Packages.RoactServiceTags)
local AppSessionService = RoactServiceTagsModule.AppSessionService
local AppEventIngestService = RoactServiceTagsModule.AppEventIngestService
local RoactNetworking = RoactServiceTagsModule.RoactNetworking
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local SessionType = require(CorePackages.Workspace.Packages.RobloxAppSessionization).SessionType
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local UseCurrentSquadIdFunction = require(CorePackages.Workspace.Packages.SquadsCore.Hooks).useCurrentSquadId
local SearchLandingPageSurface = require(CorePackages.Workspace.Packages.DiscoveryTypes).SearchLandingPageSurface
local Modules = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local SearchConstants = Modules.Personalization.Search.SearchConstants
local SearchLandingPageSession = Modules.Personalization.Sessions.SearchLandingPageSession
local ApiFetchSearchLandingPageFunction = Modules.LuaApp.Thunks.Search.ApiFetchSearchLandingPage
local Modules1 = game:GetService("CoreGui").RobloxGui.Modules
local ConfirmSearchModule = require(Modules1.LuaApp.Thunks.ConfirmSearch)
local SearchModule = require(Modules1.LuaApp.Analytics.Events.search)
local SearchBarModule = require(Modules1.LuaApp.Components.SearchBar)
local SearchBarListPickerModule = require(Modules1.LuaApp.Components.SearchBarListPicker)
local SearchLandingPageModule = require(Modules1.Personalization.Search.SearchLandingPage)
local SetSearchLandingPageSessionInfoModule = require(Modules1.Personalization.Sessions.setSearchLandingPageSessionInfo)
local FFlagBoldSearchListPickerSuggestionsModule = require(Modules1.LuaApp.Flags.FFlagBoldSearchListPickerSuggestions)
local FIntSearchLandingPageSideMargin = Modules.Personalization.Search.FIntSearchLandingPageSideMargin
local SearchOverlayIgnoreTopGuiInset = game:DefineFastFlag("SearchOverlayIgnoreTopGuiInset", false)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagRenameDeprecatedUIBloxTokens = SharedFlagsModule.FFlagRenameDeprecatedUIBloxTokens
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local FFlagSignalsNavP3hMisc = SharedFlagsModule.FFlagSignalsNavP3hMisc
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3hMisc then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local NAVBARSIZE = require(Modules1.LuaApp.Constants).NAV_BAR_SIZE

function SearchPageOverlay(p1)
	-- upvalues: UseNavigationFunction (copy), UseDispatchFunction (copy), UseStyleFunction (copy), UseDesignTokensFunction (copy), UseCurrentSquadIdFunction (copy), UseRoactServiceFunction (copy), AppEventIngestService (copy), AppSessionService (copy), RoactNetworking (copy), FFlagSignalsNavP3hMisc (copy), GetLegacyNavigationStore (copy), UseSignalStateFunction (copy), UseSelectorFunction (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), FormFactor (copy), SearchOverlayIgnoreTopGuiInset (copy), SearchConstants (copy), ReactModule (copy), UseAnimatedBindingFunction (copy), ReactOtterModule (copy), ConfirmSearchModule (copy), SessionType (copy), SetSearchLandingPageSessionInfoModule (copy), SearchModule (copy), ApiFetchSearchLandingPageFunction (copy), SearchLandingPageSession (copy), SearchLandingPageSurface (copy), FFlagRenameDeprecatedUIBloxTokens (copy), ImageSetLabel (copy), Images (copy), NAVBARSIZE (copy), SearchBarModule (copy), FIntSearchLandingPageSideMargin (copy), SearchLandingPageModule (copy), SearchBarListPickerModule (copy), FFlagBoldSearchListPickerSuggestionsModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseStyleResult = UseStyleFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseCurrentSquadIdResult = UseCurrentSquadIdFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppSessionService)
	local UseRoactServiceResult2 = UseRoactServiceFunction(RoactNetworking)
	local Key = nil
	Key = if FFlagSignalsNavP3hMisc then UseSignalStateFunction(GetLegacyNavigationStore(false).getCurrentRoute).key else UseSelectorFunction(function(p2)
		-- upvalues: FFlagUseNavigationSelectors (upval), Selectors (upval)
		return if FFlagUseNavigationSelectors then Selectors.selectCurrentRoactNavigationRoute(p2).key else p2.Navigation.currentRoute.key
	end)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.ScreenSize
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2): boolean
		-- upvalues: FormFactor (upval)
		return p2.FormFactor == FormFactor.COMPACT
	end)
	local UseSelectorResult2 = if SearchOverlayIgnoreTopGuiInset then UseSelectorFunction(function(p2): boolean
		return (p2.AppTopBanner.expanded and not p2.AppTopBanner.isDisabled) == true
	end) else false
	local UseSelectorResult3 = if SearchOverlayIgnoreTopGuiInset then UseSelectorFunction(function(p2)
		return p2.TopBar.statusBarHeight
	end) else 0
	local UseSelectorResult4 = UseSelectorFunction(function(p2)
		return p2.TopBar.topBarHeight
	end)
	local UseSelectorResult5 = UseSelectorFunction(function(p2)
		return p2.GlobalGuiInset or { left = 0, top = 0, right = 0, bottom = 0 }
	end)
	local SearchTokens = SearchConstants.getSearchTokens(UseDesignTokensResult)
	local SearchMargin: number = SearchTokens.searchMargin
	local ShadowBoldness: number = SearchTokens.backgroundContainer.shadowBoldness
	local ShadowTopOffset = SearchTokens.backgroundContainer.shadowTopOffset
	local ShadowBottomOffset = SearchTokens.backgroundContainer.shadowBottomOffset
	local XOffset = ShadowBoldness * 2 + SearchMargin * 2
	local UseSelectorResult6 = if SearchOverlayIgnoreTopGuiInset and UseSelectorResult2 then UseSelectorResult3 else 0
	local UseSelectorResultDelta = if SearchOverlayIgnoreTopGuiInset and UseSelectorResult2 then UseSelectorResult4 - UseSelectorResult3 else UseSelectorResult4
	local _UDim2: UDim2 = if UseSelectorResult1 then UDim2.new(0, 0, 0, if SearchOverlayIgnoreTopGuiInset then UseSelectorResult6 else 0) else UDim2.new(0.5, 0, 0, if SearchOverlayIgnoreTopGuiInset then UseSelectorResult6 else 0)
	local _Vector2: Vector2 = if UseSelectorResult1 then Vector2.new(0, 0) else Vector2.new(0.5, 0)
	local _UDim: UDim = if UseSelectorResult1 then UDim.new(0, SearchMargin) else UDim.new(0, 0)
	local UseSelectorResultDelta1 = if SearchOverlayIgnoreTopGuiInset then UseSelectorResultDelta else UseSelectorResult5.top + UseSelectorResult4
	local X = UseSelectorResult.X
	local _UDim1: UDim = if UseSelectorResult1 then UDim.new(1, 0) else UDim.new(0, math.clamp(X * SearchTokens.backgroundContainer.screenWidthScale, math.min(SearchTokens.backgroundContainer.minimumWidth, X - SearchTokens.backgroundContainer.padding), SearchTokens.backgroundContainer.maximumWidth) - XOffset)
	local UseRefResult = ReactModule.useRef(Key)
	local UseRefResult1 = ReactModule.useRef(UseSelectorResultDelta1)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = UseAnimatedBindingFunction(UseSelectorResultDelta1)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.initialSearchText)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState({})
	local AutocompleteSuggestions = if UseStateResult and UseStateResult ~= "" then if #UseStateResult1 > 0 then SearchConstants.OverlayContentPageType.AutocompleteSuggestions else SearchConstants.OverlayContentPageType.NoResults else SearchConstants.OverlayContentPageType.LandingPage
	local UseResult = ReactModule.useCallback(function(Value: number)
		-- upvalues: UseSelectorResult1 (copy), SearchOverlayIgnoreTopGuiInset (upval), UseSelectorResult (copy), UseSelectorResult5 (copy), UseSelectorResult6 (copy), UseSelectorResultDelta1 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval)
		UseAnimatedBindingResult2(ReactOtterModule.spring(UseSelectorResult1 and (if SearchOverlayIgnoreTopGuiInset then UseSelectorResult.Y - UseSelectorResult5.top - UseSelectorResult6 else UseSelectorResult.Y) or math.clamp(Value, UseSelectorResultDelta1, if SearchOverlayIgnoreTopGuiInset then UseSelectorResult.Y - UseSelectorResult5.top - UseSelectorResult6 else UseSelectorResult.Y), { dampingRatio = 0.9, frequency = 6 }))
	end, {
		UseSelectorResult1, UseSelectorResult, UseSelectorResultDelta1,
		UseAnimatedBindingResult2,
		if SearchOverlayIgnoreTopGuiInset then UseSelectorResult5.top else nil,
		if SearchOverlayIgnoreTopGuiInset then UseSelectorResult6 else nil
	})
	local UseResult1 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: UseDispatchResult (copy), ConfirmSearchModule (upval)
		return UseDispatchResult(ConfirmSearchModule(p2, p3))
	end, { UseDispatchResult })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseDispatchResult (copy), UseRoactServiceResult1 (copy), SessionType (upval)
		if p1.closeCentralOverlayThunk then
			UseDispatchResult(p1.closeCentralOverlayThunk())
		end
		if UseRoactServiceResult1:SessionExists(SessionType.StructuralIdentifier.GameSearchAutocomplete) then
			UseRoactServiceResult1:RemoveSession(SessionType.StructuralIdentifier.GameSearchAutocomplete)
		end
	end, {
		p1.closeCentralOverlayThunk,
		UseDispatchResult,
		UseRoactServiceResult1
	})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseResult2 (copy), UseRoactServiceResult1 (copy), SessionType (upval)
		UseResult2()
		UseRoactServiceResult1:RemoveSession(SessionType.StructuralIdentifier.SearchLandingPage)
	end, { UseResult2, UseRoactServiceResult1 })
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: SetSearchLandingPageSessionInfoModule (upval), UseRoactServiceResult1 (copy)
		SetSearchLandingPageSessionInfoModule(UseRoactServiceResult1)
	end, { UseRoactServiceResult1 })
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseRoactServiceResult1 (copy), SessionType (upval)
		UseRoactServiceResult1:SetSession(SessionType.StructuralIdentifier.Level1, SessionType.StructuralIdentifier.GameSearchAutocomplete, SessionType.StructuralIdentifier.GameSearchAutocomplete)
	end, { UseRoactServiceResult1 })
	local UseResult6 = ReactModule.useCallback(function(p2)
		-- upvalues: SearchOverlayIgnoreTopGuiInset (upval), UseSelectorResultDelta (copy), UseSelectorResult5 (copy), UseSelectorResult4 (copy), UseRefResult1 (copy), UseResult (copy)
		if p2 then
			assert(p2 ~= nil, "onAbsoluteContentSizeChangedCallback: obj is nil")
			local Y = p2.AbsoluteContentSize.Y
			local NewY = if SearchOverlayIgnoreTopGuiInset then Y + UseSelectorResultDelta else Y + UseSelectorResult5.top + UseSelectorResult4
			UseRefResult1.current = NewY
			UseResult(NewY)
			
			return
		end
	end, {
		if SearchOverlayIgnoreTopGuiInset then nil else UseSelectorResult5.top,
		if SearchOverlayIgnoreTopGuiInset then nil else UseSelectorResult4,
		UseResult,
		if SearchOverlayIgnoreTopGuiInset then UseSelectorResultDelta else nil
	})
	local UseResult7 = ReactModule.useCallback(function()
		-- upvalues: SearchModule (upval), UseRoactServiceResult (copy), UseRefResult (copy), UseResult3 (copy)
		SearchModule(UseRoactServiceResult, "searchLandingPage", "cancel", nil, true, UseRefResult.current)
		UseResult3()
	end, { UseResult3, UseRoactServiceResult })
	local UseResult8 = ReactModule.useCallback(function()
		-- upvalues: UseResult4 (copy), UseResult5 (copy), SearchModule (upval), UseRoactServiceResult (copy), UseRefResult (copy)
		UseResult4()
		UseResult5()
		SearchModule(UseRoactServiceResult, "searchLandingPage", "open", nil, true, UseRefResult.current)
	end, { UseRoactServiceResult, UseResult4, UseResult5 })
	local UseResult9 = ReactModule.useCallback(function(p2, IsAutocompleteSuggestion, AllAutocompleteSuggestions)
		-- upvalues: p1 (copy), UseNavigationResult (copy), UseRoactServiceResult1 (copy), UseRoactServiceResult (copy), UseResult1 (copy), UseResult3 (copy)
		UseResult1(p2, {
			isAvatarAutocompleteEnabled = false,
			isAutocompleteSuggestion = IsAutocompleteSuggestion,
			allAutocompleteSuggestions = AllAutocompleteSuggestions,
			searchType = p1.searchType,
			navigation = UseNavigationResult,
			pageOwner = UseNavigationResult.state.routeName,
			sessionService = UseRoactServiceResult1,
			eventIngest = UseRoactServiceResult
		})
		UseResult3()
	end, {
		UseResult1, UseResult3, p1.searchType, UseRoactServiceResult,
		UseRoactServiceResult1, UseNavigationResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UseCurrentSquadIdResult (copy), UseDispatchResult (copy), ApiFetchSearchLandingPageFunction (upval), UseRoactServiceResult2 (copy), SearchLandingPageSession (upval), SearchLandingPageSurface (upval), UseResult4 (copy), UseResult3 (copy)
		if UseCurrentSquadIdResult == "" or UseCurrentSquadIdResult == nil then
			UseDispatchResult(ApiFetchSearchLandingPageFunction(UseRoactServiceResult2, SearchLandingPageSession:Get()))
		else
			UseDispatchResult(ApiFetchSearchLandingPageFunction(UseRoactServiceResult2, SearchLandingPageSession:Get(), SearchLandingPageSurface.Party))
		end
		UseResult4()
		
		return function()
			-- upvalues: UseResult3 (upval)
			UseResult3()
		end
	end, {
		UseResult4, UseResult3, UseRoactServiceResult2, UseDispatchResult,
		UseRoactServiceResult1, UseCurrentSquadIdResult
	})
	ReactModule.useEffect(function()
		-- upvalues: AutocompleteSuggestions (copy), SearchConstants (upval), UseResult (copy), UseRefResult1 (copy), SearchTokens (copy), UseSelectorResultDelta1 (copy)
		if AutocompleteSuggestions == SearchConstants.OverlayContentPageType.LandingPage then
			UseResult(UseRefResult1.current)
			
			return
		end
		if AutocompleteSuggestions == SearchConstants.OverlayContentPageType.AutocompleteSuggestions then
			UseResult(SearchTokens.searchBarListPicker.height + UseSelectorResultDelta1)
			
			return
		end
		if AutocompleteSuggestions == SearchConstants.OverlayContentPageType.NoResults then
			UseResult(UseSelectorResultDelta1)
		end
	end, {
		AutocompleteSuggestions,
		UseSelectorResultDelta1,
		UseResult
	})
	ReactModule.useEffect(function()
		-- upvalues: Key (ref), UseRefResult (copy), UseResult2 (copy)
		if Key ~= UseRefResult.current then
			UseResult2()
		end
	end, { Key, UseResult2 })
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		AbsorbInput = ReactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 1, if SearchOverlayIgnoreTopGuiInset then if UseSelectorResult1 then -UseSelectorResult6 else UseSelectorResult5.top else 0),
			Position = UDim2.new(0.5, 0, 0.5, if SearchOverlayIgnoreTopGuiInset then if UseSelectorResult1 then UseSelectorResult6 * 0.5 else -UseSelectorResult5.top * 0.5 else 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Text = "",
			TextTransparency = 1,
			BackgroundTransparency = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Common.Scrim else UseDesignTokensResult.Semantic.Color.Common.Overlay).Transparency,
			BackgroundColor3 = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Common.Scrim else UseDesignTokensResult.Semantic.Color.Common.Overlay).Color3,
			AutoButtonColor = false,
			BorderSizePixel = 0,
			[ReactModule.Event.Activated] = UseResult7,
			ZIndex = 1,
			Selectable = false
		}),
		OverlayContainer = ReactModule.createElement("TextButton", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Selectable = false,
			ZIndex = 2,
			AutoButtonColor = false,
			Active = true,
			Text = "",
			Position = _UDim2,
			AnchorPoint = _Vector2,
			Size = UseAnimatedBindingResult:map(function(YOffset): UDim2
				-- upvalues: UseSelectorResult1 (copy), _UDim1 (copy)
				return if UseSelectorResult1 then UDim2.new(1, 0, 0, YOffset) else UDim2.new(_UDim1.Scale, _UDim1.Offset, 0, YOffset)
			end),
			ClipsDescendants = UseSelectorResult1
		}, {
			Shadow = ReactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = -1,
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0, -ShadowBoldness - ShadowTopOffset),
				Size = UDim2.new(1, XOffset, 1, ShadowBoldness * 2 + ShadowTopOffset + ShadowBottomOffset),
				Image = Images["component_assets/dropshadow_16_20"],
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(28, 28, 29, 29),
				ImageColor3 = UseStyleResult.Theme.DropShadow.Color,
				ImageTransparency = UseStyleResult.Theme.DropShadow.Transparency
			}, {
				Background = ReactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Position = UDim2.new(0, ShadowBoldness, 0, ShadowBoldness),
					Size = UDim2.new(1, -ShadowBoldness * 2, 1, -ShadowBoldness * 2),
					BackgroundColor3 = SearchTokens.backgroundContainer.backgroundColor3,
					BackgroundTransparency = SearchTokens.backgroundContainer.backgroundTransparency
				}, {
					UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 14) })
				})
			}),
			ContentWrapper = ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
				Padding = ReactModule.createElement("UIPadding", {
					PaddingLeft = _UDim,
					PaddingRight = _UDim,
					PaddingTop = UDim.new(0, UseSelectorResultDelta1 - NAVBARSIZE)
				}),
				Layout = ReactModule.createElement("UIListLayout", {
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					Padding = UDim.new(0, 0),
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				SearchBar = ReactModule.createElement(SearchBarModule, {
					layoutOrder = 1,
					isCompactView = false,
					autocomplete = true,
					isSearching = true,
					animated = true,
					modernUI = true,
					searchBarPadding = 0,
					disableListPicker = true,
					updateAutocompleteOnMount = true,
					Size = UDim2.new(1, if UseSelectorResult1 then 0 else SearchMargin * 2 - FIntSearchLandingPageSideMargin * 2, 0, NAVBARSIZE),
					anchorPoint = Vector2.new(0.5, 0),
					cancelSearch = UseResult7,
					confirmSearch = UseResult9,
					onFocused = UseResult8,
					placeholderText = p1.placeholderText,
					searchType = p1.searchType,
					focusController = p1.focusController,
					initialSearchText = p1.initialSearchText,
					onTextChanged = UseStateResult2,
					onPickerItemsChanged = UseStateResult2_1,
					listPickerRef = UseRefResult3,
					animationSettings = if UseSelectorResult1 then nil else {
						originalWidth = SearchConstants.NON_COMPACT_SEARCH_BAR_SIZE,
						animationStyle = SearchConstants.SearchBarAnimationStyle.ExpandFromCenter
					}
				}),
				Content = if AutocompleteSuggestions == SearchConstants.OverlayContentPageType.LandingPage then ReactModule.createElement(SearchLandingPageModule, {
					layoutOrder = 2,
					size = UDim2.new(1, SearchMargin * 2, 1, -UseSelectorResultDelta1),
					position = UDim2.new(0.5, 0, 0, 0),
					scrollingFrameRef = UseRefResult2,
					onAbsoluteContentSizeChanged = UseResult6,
					isCompactView = UseSelectorResult1,
					defaultContainerSize = Vector2.new(UseSelectorResult.X * _UDim1.Scale + _UDim1.Offset + SearchMargin * 2, 0)
				}) elseif AutocompleteSuggestions == SearchConstants.OverlayContentPageType.AutocompleteSuggestions then ReactModule.createElement(SearchBarListPickerModule, {
					layoutOrder = 2,
					BackgroundTransparency = 1,
					removeAdditionalMargins = true,
					items = UseStateResult1,
					width = UDim.new(1, if UseSelectorResult1 then 0 else SearchMargin * 2 - FIntSearchLandingPageSideMargin * 2),
					height = UDim.new(1, -UseSelectorResultDelta1),
					ref = UseRefResult3,
					currentKeyword = if FFlagBoldSearchListPickerSuggestionsModule then UseStateResult else nil
				}) else nil
			})
		})
	})
end

return SearchPageOverlay