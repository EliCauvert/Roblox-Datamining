local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local DisplayModule = require(Parent.Display)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local FFlagEnableHomeRobloxLogo = require(Parent.SharedFlags).FFlagEnableHomeRobloxLogo
local HeaderBar = require(Parent.UIBlox).App.Bar.HeaderBar
local Button = FoundationModule.Button
local IconButton = FoundationModule.IconButton
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FlyoutSidePanelIXP = require(Parent.SharedExperimentDefinition).FlyoutSidePanelIXP
local FlyoutLeftHeader = require(Parent.FlyoutSidePanel).Components.FlyoutLeftHeader
local SearchBarContainerModule = require(BuildExperience.Components.SearchBar.SearchBarContainer)
local GetSearchQueryStoreModule = require(BuildExperience.Stores.GetSearchQueryStore)
local _ = require(BuildExperience.Stores.GetSearchQueryStore.createSearchQueryStore)
local BuildSearchBarWidth = game:DefineFastInt("BuildSearchBarWidth", 400)

local function renderFlyoutLeftHeader(TitleText)
	-- upvalues: ReactModule (copy), FlyoutLeftHeader (copy), FFlagEnableHomeRobloxLogo (copy), FlyoutSidePanelIXP (copy)
	return ReactModule.createElement(FlyoutLeftHeader, {
		isRobloxLogoEnabled = false,
		titleText = TitleText,
		isFlyoutEntrypointEnabled = if FFlagEnableHomeRobloxLogo then FlyoutSidePanelIXP.isFlyoutSidePanelEnabled() else nil,
		isAlternateEntryPointEnabled = FlyoutSidePanelIXP.isAlternateEntryPointEnabled()
	})
end

local function renderEmptyRight()
	return nil
end

local function HeaderSearch(p1)
	-- upvalues: UseScaledValueFunction (copy), BuildSearchBarWidth (copy), UseTokensFunction (copy), SignalsReactModule (copy), UseLocalizationFunction (copy), ReactModule (copy), View (copy), SearchBarContainerModule (copy), Button (copy), ButtonVariant (copy), InputSize (copy)
	local UseScaledValueResult = UseScaledValueFunction(BuildSearchBarWidth)
	local Size2200 = UseTokensFunction().Size.Size_2200
	local SearchQueryStore = p1.searchQueryStore
	local UseIsSearchActiveResult = SearchQueryStore.useIsSearchActive()
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding(SearchQueryStore.getDraftQuery)
	local UseLocalizationResult = UseLocalizationFunction({
		searchbarPlaceholder = "Feature.Build.Label.SearchGames",
		cancelText = "Feature.Build.Action.Cancel"
	})
	ReactModule.useEffect(function()
		-- upvalues: SearchQueryStore (copy)
		return function()
			-- upvalues: SearchQueryStore (upval)
			SearchQueryStore.setIsSearchActive(false)
		end
	end, { SearchQueryStore })
	
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-small size-full",
		testId = "BuildPageHeader.CenterSearchContainer"
	}, {
		LeftSpacer = ReactModule.createElement(View, { LayoutOrder = 1, tag = "fill size-0-full" }),
		SearchBarContainer = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row align-y-center shrink",
			Size = UDim2.new(0, UseScaledValueResult, 1, 0)
		}, {
			SearchBar = ReactModule.createElement(SearchBarContainerModule, {
				clear = SearchQueryStore.clear,
				onDismiss = SearchQueryStore.endSearch,
				onFocusGained = SearchQueryStore.beginSearch,
				onFocusLost = SearchQueryStore.endSearchIfEmpty,
				placeholder = UseLocalizationResult.searchbarPlaceholder,
				query = UseSignalBindingResult,
				setQuery = SearchQueryStore.setQuery
			})
		}),
		RightContainer = ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = "row align-y-center fill size-0-full"
		}, {
			Cancel = if UseIsSearchActiveResult then ReactModule.createElement(Button, {
				testId = "BuildPageHeader.SearchCancelButton",
				width = UDim.new(0, Size2200),
				text = UseLocalizationResult.cancelText,
				variant = ButtonVariant.Utility,
				size = InputSize.Medium,
				onActivated = SearchQueryStore.endSearch
			}) else nil
		})
	})
end

local function HeaderCenter(p1)
	-- upvalues: DisplayModule (copy), SignalsReactModule (copy), ReactModule (copy), HeaderSearch (copy), GetSearchQueryStoreModule (copy)
	return if SignalsReactModule.useSignalState(DisplayModule.GetDisplayStore(false).getDisplaySize) == Enum.DisplaySize.Small then nil else ReactModule.createElement(HeaderSearch, {
		searchQueryStore = p1.searchQueryStore or GetSearchQueryStoreModule()
	})
end

return function(Frame)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), FlyoutSidePanelIXP (copy), DisplayModule (copy), SignalsReactModule (copy), GetSearchQueryStoreModule (copy), ReactModule (copy), HeaderCenter (copy), View (copy), IconButton (copy), IconName (copy), InputSize (copy), ButtonVariant (copy), renderEmptyRight (copy), HeaderBar (copy), renderFlyoutLeftHeader (copy)
	local Title = UseLocalizationFunction({ title = LocalizationStringsModule.BUILD_HEADER_TITLE }).title
	local IsFlyoutSidePanelEnabled = FlyoutSidePanelIXP.isFlyoutSidePanelEnabled()
	local HasOnOpenSearch = false
	local SearchQueryStore = nil
	local UseSignalStateResult = SignalsReactModule.useSignalState(DisplayModule.GetDisplayStore(false).getDisplaySize)
	SearchQueryStore = Frame.searchQueryStore or GetSearchQueryStoreModule()
	local IsNotUseSignalStateResultMatch = UseSignalStateResult ~= Enum.DisplaySize.Small
	HasOnOpenSearch = UseSignalStateResult == Enum.DisplaySize.Small and Frame.onOpenSearch ~= nil
	
	return ReactModule.createElement(View, {
		ZIndex = 3,
		tag = "composition-content-header size-full-0 auto-y",
		testId = "BuildPageHeader",
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.new(1, 0, 0, Frame.height)
	}, {
		HeaderBar = ReactModule.createElement(HeaderBar, {
			isTitleCentered = false,
			barHeight = Frame.height,
			paddingLeft = UDim.new(0, 0),
			paddingRight = UDim.new(0, 0),
			renderLeft = if IsFlyoutSidePanelEnabled then function()
				-- upvalues: renderFlyoutLeftHeader (upval), Title (copy)
				return renderFlyoutLeftHeader(Title)
			end else nil,
			title = if IsFlyoutSidePanelEnabled then nil else Title,
			renderCenter = if IsNotUseSignalStateResultMatch then function()
				-- upvalues: ReactModule (upval), HeaderCenter (upval), SearchQueryStore (ref)
				return ReactModule.createElement(HeaderCenter, { searchQueryStore = SearchQueryStore })
			end else nil,
			renderRight = if HasOnOpenSearch then function()
				-- upvalues: ReactModule (upval), View (upval), HasOnOpenSearch (ref), IconButton (upval), IconName (upval), Frame (copy), InputSize (upval), ButtonVariant (upval)
				return ReactModule.createElement(View, {
					tag = "row align-y-center gap-medium auto-xy",
					testId = "BuildPageHeader.RightActions"
				}, {
					Search = if HasOnOpenSearch then ReactModule.createElement(IconButton, {
						LayoutOrder = 1,
						isCircular = true,
						testId = "BuildPageHeader.SearchButton",
						icon = IconName.MagnifyingGlass,
						onActivated = Frame.onOpenSearch,
						size = InputSize.Medium,
						variant = ButtonVariant.Utility
					}) else nil
				})
			end else renderEmptyRight
		})
	})
end