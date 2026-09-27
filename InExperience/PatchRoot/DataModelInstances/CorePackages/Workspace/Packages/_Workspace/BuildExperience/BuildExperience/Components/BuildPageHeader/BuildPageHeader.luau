local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local displayModule = require(parent.Display)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsReactModule = require(parent.SignalsReact)
local UIBloxModule = require(parent.UIBlox)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagEnableHomeRobloxLogo = sharedFlagsModule.FFlagEnableHomeRobloxLogo
local headerBar = UIBloxModule.App.Bar.HeaderBar
local button = foundationModule.Button
local iconButton = foundationModule.IconButton
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local useScaledValue = foundationModule.Hooks.useScaledValue
local useTokens = foundationModule.Hooks.useTokens
local flyoutSidePanelIXP = require(parent.SharedExperimentDefinition).FlyoutSidePanelIXP
local flyoutLeftHeader = require(parent.FlyoutSidePanel).Components.FlyoutLeftHeader
local searchBarContainerModule = require(buildExperience.Components.SearchBar.SearchBarContainer)
local getSearchQueryStoreModule = require(buildExperience.Stores.GetSearchQueryStore)
local _ = require(buildExperience.Stores.GetSearchQueryStore.createSearchQueryStore)
local buildSearchBarWidth = game:DefineFastInt("BuildSearchBarWidth", 400)

local function renderFlyoutLeftHeader(p1)
	-- upvalues: reactModule (ref), flyoutLeftHeader (ref), fFlagEnableHomeRobloxLogo (ref), flyoutSidePanelIXP (ref)
	return reactModule.createElement(flyoutLeftHeader, {
		isRobloxLogoEnabled = false,
		titleText = p1,
		isFlyoutEntrypointEnabled = if fFlagEnableHomeRobloxLogo then flyoutSidePanelIXP.isFlyoutSidePanelEnabled() else nil,
		isAlternateEntryPointEnabled = flyoutSidePanelIXP.isAlternateEntryPointEnabled()
	})
end

local function renderEmptyRight()
	return nil
end

local function HeaderSearch(p1)
	-- upvalues: useScaledValue (ref), buildSearchBarWidth (ref), useTokens (ref), signalsReactModule (ref), useLocalization (ref), reactModule (ref), view (ref), searchBarContainerModule (ref), button (ref), buttonVariant (ref), inputSize (ref)
	local var1 = useScaledValue(buildSearchBarWidth)
	local size2200 = useTokens().Size.Size_2200
	local searchQueryStore = p1.searchQueryStore
	local var2 = searchQueryStore.useIsSearchActive()
	local var3 = signalsReactModule.useSignalBinding(searchQueryStore.getDraftQuery)
	local var4 = useLocalization({
		searchbarPlaceholder = "Feature.Build.Label.SearchGames",
		cancelText = "Feature.Build.Action.Cancel"
	})
	reactModule.useEffect(function()
		-- upvalues: searchQueryStore (ref)
		return function()
			-- upvalues: searchQueryStore (copy)
			searchQueryStore.setIsSearchActive(false)
		end
	end, { searchQueryStore })
	
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-small size-full",
		testId = "BuildPageHeader.CenterSearchContainer"
	}, {
		LeftSpacer = reactModule.createElement(view, { LayoutOrder = 1, tag = "fill size-0-full" }),
		SearchBarContainer = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row align-y-center shrink",
			Size = UDim2.new(0, var1, 1, 0)
		}, {
			SearchBar = reactModule.createElement(searchBarContainerModule, {
				clear = searchQueryStore.clear,
				onDismiss = searchQueryStore.endSearch,
				onFocusGained = searchQueryStore.beginSearch,
				onFocusLost = searchQueryStore.endSearchIfEmpty,
				placeholder = var4.searchbarPlaceholder,
				query = var3,
				setQuery = searchQueryStore.setQuery
			})
		}),
		RightContainer = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "row align-y-center fill size-0-full"
		}, {
			Cancel = if var2 then reactModule.createElement(button, {
				testId = "BuildPageHeader.SearchCancelButton",
				width = UDim.new(0, size2200),
				text = var4.cancelText,
				variant = buttonVariant.Utility,
				size = inputSize.Medium,
				onActivated = searchQueryStore.endSearch
			}) else nil
		})
	})
end

local function HeaderCenter(p1)
	-- upvalues: displayModule (ref), signalsReactModule (ref), reactModule (ref), HeaderSearch (ref), getSearchQueryStoreModule (ref)
	return if signalsReactModule.useSignalState(displayModule.GetDisplayStore(false).getDisplaySize) == Enum.DisplaySize.Small then nil else reactModule.createElement(HeaderSearch, {
		searchQueryStore = p1.searchQueryStore or getSearchQueryStoreModule()
	})
end

return function(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), flyoutSidePanelIXP (ref), displayModule (ref), signalsReactModule (ref), getSearchQueryStoreModule (ref), reactModule (ref), HeaderCenter (ref), view (ref), iconButton (ref), iconName (ref), inputSize (ref), buttonVariant (ref), renderEmptyRight (ref), headerBar (ref), renderFlyoutLeftHeader (ref)
	local title = useLocalization({ title = localizationStringsModule.BUILD_HEADER_TITLE }).title
	local var1 = flyoutSidePanelIXP.isFlyoutSidePanelEnabled()
	local _ = false
	local _ = false
	local _ = nil
	local var2 = signalsReactModule.useSignalState(displayModule.GetDisplayStore(false).getDisplaySize)
	local searchQueryStore = p1.searchQueryStore or getSearchQueryStoreModule()
	local var3 = var2 == Enum.DisplaySize.Small and p1.onOpenSearch ~= nil
	
	return reactModule.createElement(view, {
		ZIndex = 3,
		tag = "composition-content-header size-full-0 auto-y",
		testId = "BuildPageHeader",
		LayoutOrder = p1.LayoutOrder,
		Size = UDim2.new(1, 0, 0, p1.height)
	}, {
		HeaderBar = reactModule.createElement(headerBar, {
			isTitleCentered = false,
			barHeight = p1.height,
			paddingLeft = UDim.new(0, 0),
			paddingRight = UDim.new(0, 0),
			renderLeft = if var1 then function()
				-- upvalues: renderFlyoutLeftHeader (copy), title (ref)
				return renderFlyoutLeftHeader(title)
			end else nil,
			title = if var1 then nil else title,
			renderCenter = if var2 ~= Enum.DisplaySize.Small then function()
				-- upvalues: reactModule (copy), HeaderCenter (copy), searchQueryStore (write)
				return reactModule.createElement(HeaderCenter, { searchQueryStore = searchQueryStore })
			end else nil,
			renderRight = if var3 then function()
				-- upvalues: reactModule (copy), view (copy), var3 (write), iconButton (copy), iconName (copy), p1 (ref), inputSize (copy), buttonVariant (copy)
				return reactModule.createElement(view, {
					tag = "row align-y-center gap-medium auto-xy",
					testId = "BuildPageHeader.RightActions"
				}, {
					Search = if var3 then reactModule.createElement(iconButton, {
						LayoutOrder = 1,
						isCircular = true,
						testId = "BuildPageHeader.SearchButton",
						icon = iconName.MagnifyingGlass,
						onActivated = p1.onOpenSearch,
						size = inputSize.Medium,
						variant = buttonVariant.Utility
					}) else nil
				})
			end else renderEmptyRight
		})
	})
end