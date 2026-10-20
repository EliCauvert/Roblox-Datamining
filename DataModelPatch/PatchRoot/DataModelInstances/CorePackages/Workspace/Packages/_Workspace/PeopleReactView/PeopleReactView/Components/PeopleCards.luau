local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local Parent = PeopleReactView.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local FoundationModule = require(Parent.Foundation)
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local ResponsiveModule = require(Parent.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local Input = ResponsiveModule.Input
local UseLastInputModeFunction = require(Parent.FocusNavigationUtils).useLastInputMode
local _ = require(PeopleReactView.Stores.GetScrollingFrameStore)
local UseCardWidthModule = require(PeopleReactView.Hooks.useCardWidth)
local UseCardLayoutValuesModule = require(PeopleReactView.Hooks.useCardLayoutValues)
local UseGetPeopleServiceModule = require(PeopleReactView.Hooks.useGetPeopleService)
local PersonCardModule = require(PeopleReactView.Components.Card.PersonCard)
local LazyPersonCardModule = require(PeopleReactView.Components.Card.LazyPersonCard)
local VirtualizedGridModule = require(PeopleReactView.Components.Common.VirtualizedGrid)
local ConstantsModule = require(PeopleReactView.Constants)
local LocalPlayer = game:GetService("Players").LocalPlayer
local FlagsService = require(Parent.PeopleService).getService("Flags")
local GetFFlagPeoplePageEnablePersonSignalStoreFunction = FlagsService.GetFFlagPeoplePageEnablePersonSignalStore
local GetFFlagPeoplePageLazyRenderCardsFunction = FlagsService.GetFFlagPeoplePageLazyRenderCards
local FFlagPeoplePageRemoveUseMemoElements = FlagsService.FFlagPeoplePageRemoveUseMemoElements
local FFlagPeopleCardsEnableVirtualizedGrid = FlagsService.FFlagPeopleCardsEnableVirtualizedGrid
local MaxNumUniversesExposedToCardTooltip = game:DefineFastInt("MaxNumUniversesExposedToCardTooltip", 3)
local Flag = false

return ReactModule.memo(function(Frame: Frame)
	-- upvalues: UseTokensFunction (copy), UseScaledValueFunction (copy), ConstantsModule (copy), FFlagPeopleCardsEnableVirtualizedGrid (copy), UseCardLayoutValuesModule (copy), UseCardWidthModule (copy), ReactModule (copy), UseGetPeopleServiceModule (copy), GetFFlagPeoplePageEnablePersonSignalStoreFunction (copy), SignalsReactModule (copy), GetFFlagPeoplePageLazyRenderCardsFunction (copy), UseLastInputModeFunction (copy), UsePreferredInputFunction (copy), Input (copy), Flag (ref), MaxNumUniversesExposedToCardTooltip (copy), FFlagPeoplePageRemoveUseMemoElements (copy), LazyPersonCardModule (copy), PersonCardModule (copy), LocalPlayer (copy), VirtualizedGridModule (copy), View (copy)
	local Medium = UseTokensFunction().Gap.Medium
	local UseScaledValueResult = UseScaledValueFunction(ConstantsModule.PEOPLEPAGE.PEOPLE_CARDS.MINIMUM_CARD_WIDTH)
	local UseCardLayoutValuesModuleResult = nil
	local Callback1 = nil
	local ItemHeight = nil
	local NumColumns = nil
	local Callback2 = nil
	
	if FFlagPeopleCardsEnableVirtualizedGrid then
		UseCardLayoutValuesModuleResult, ItemHeight, NumColumns, Callback2 = UseCardLayoutValuesModule()
	else
		UseCardLayoutValuesModuleResult, Callback1 = UseCardWidthModule()
	end
	local v1 = nil
	local Callback = nil
	
	if FFlagPeopleCardsEnableVirtualizedGrid then
		v1, Callback = ReactModule.useState(false)
	end
	local PeopleListStore = UseGetPeopleServiceModule("PeopleListStore")
	local UseSignalStateResult = if GetFFlagPeoplePageEnablePersonSignalStoreFunction() then nil else SignalsReactModule.useSignalState(PeopleListStore.people)
	local UseSignalStateResult1 = if GetFFlagPeoplePageEnablePersonSignalStoreFunction() then SignalsReactModule.useSignalState(PeopleListStore.peopleSignalMap.getCount) else nil
	local UseLastInputModeResult = if GetFFlagPeoplePageLazyRenderCardsFunction() then UseLastInputModeFunction() else nil
	local UsePreferredInputResult = if GetFFlagPeoplePageLazyRenderCardsFunction() then UsePreferredInputFunction() else nil
	local UseMemoResult = if GetFFlagPeoplePageLazyRenderCardsFunction() then ReactModule.useMemo(function(): boolean
		-- upvalues: UseLastInputModeResult (copy), UsePreferredInputResult (copy), Input (upval)
		return UseLastInputModeResult == "Focus" or UsePreferredInputResult ~= Input.Pointer
	end, { UseLastInputModeResult, UsePreferredInputResult }) else nil
	local UseMemoResult1 = ReactModule.useMemo(function(): boolean
		-- upvalues: FFlagPeopleCardsEnableVirtualizedGrid (upval), v1 (ref), Flag (upval), Frame (copy), ConstantsModule (upval), MaxNumUniversesExposedToCardTooltip (upval)
		if FFlagPeopleCardsEnableVirtualizedGrid and v1 or (Flag or not Frame.getUniversesExposedTo or not Frame.addUniverseToExposureList) then
			return false
		end
		local Count = 0
		
		for _, value in Frame.getUniversesExposedTo(ConstantsModule.PEOPLEPAGE.CARD_TOOLTIP.UNIVERSES_EXPOSED_TO_CARD_TOOLTIP) do
			if value == game.GameId then
				return false
			end
			Count += 1
		end
		if MaxNumUniversesExposedToCardTooltip <= Count then
			return false
		else
			Frame.addUniverseToExposureList(ConstantsModule.PEOPLEPAGE.CARD_TOOLTIP.UNIVERSES_EXPOSED_TO_CARD_TOOLTIP, game.GameId)
			
			return true
		end
	end, if FFlagPeopleCardsEnableVirtualizedGrid then {
		v1,
		Frame.getUniversesExposedTo,
		Frame.addUniverseToExposureList
	} else {
		Frame.getUniversesExposedTo,
		Frame.addUniverseToExposureList
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: Flag (upval), FFlagPeopleCardsEnableVirtualizedGrid (upval), Callback (ref)
		Flag = true
		
		if FFlagPeopleCardsEnableVirtualizedGrid then
			Callback(true)
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy)
		return function()
			-- upvalues: UseResult (upval)
			UseResult()
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function(Frame)
		-- upvalues: Callback1 (ref), UseScaledValueResult (copy), Medium (copy)
		Callback1(UseScaledValueResult, Frame.AbsoluteSize.X, Medium)
	end, { Callback1, UseScaledValueResult, Medium })
	local Elements = {}
	
	if not FFlagPeopleCardsEnableVirtualizedGrid then
		if FFlagPeoplePageRemoveUseMemoElements then
			if GetFFlagPeoplePageEnablePersonSignalStoreFunction() then
				Elements = {}
				PeopleListStore.peopleSignalMap.iterateData(function(Text, p1)
					-- upvalues: Elements (ref), ReactModule (upval), GetFFlagPeoplePageLazyRenderCardsFunction (upval), LazyPersonCardModule (upval), PersonCardModule (upval), UseCardLayoutValuesModuleResult (ref), UseMemoResult1 (copy), LocalPlayer (upval), UseResult (copy), Frame (copy), UseMemoResult (copy)
					Elements["PersonCard_" .. Text] = ReactModule.createElement(if GetFFlagPeoplePageLazyRenderCardsFunction() then LazyPersonCardModule else PersonCardModule, {
						width = UseCardLayoutValuesModuleResult,
						person = p1.getPerson(),
						showTooltip = UseMemoResult1 and (LocalPlayer ~= nil and Text == LocalPlayer.UserId),
						onDismissTooltip = UseResult,
						layoutOrder = p1.getOrder,
						scrollingFrameStore = if GetFFlagPeoplePageLazyRenderCardsFunction() then Frame.scrollingFrameStore else nil,
						shouldShowMenu = if GetFFlagPeoplePageLazyRenderCardsFunction() then UseMemoResult else nil
					})
				end, false)
			else
				Elements = {}
				
				for LayoutOrder, Person in UseSignalStateResult do
					Elements["PersonCard_" .. Person.UserId] = ReactModule.createElement(if GetFFlagPeoplePageLazyRenderCardsFunction() then LazyPersonCardModule else PersonCardModule, {
						width = UseCardLayoutValuesModuleResult,
						person = Person,
						showTooltip = UseMemoResult1 and LayoutOrder == 1,
						onDismissTooltip = UseResult,
						layoutOrder = LayoutOrder,
						scrollingFrameStore = if GetFFlagPeoplePageLazyRenderCardsFunction() then Frame.scrollingFrameStore else nil,
						shouldShowMenu = if GetFFlagPeoplePageLazyRenderCardsFunction() then UseMemoResult else nil
					})
				end
			end
		else
			Elements = if GetFFlagPeoplePageEnablePersonSignalStoreFunction() then ReactModule.useMemo(function()
				-- upvalues: PeopleListStore (copy), ReactModule (upval), GetFFlagPeoplePageLazyRenderCardsFunction (upval), LazyPersonCardModule (upval), PersonCardModule (upval), UseCardLayoutValuesModuleResult (ref), UseMemoResult1 (copy), LocalPlayer (upval), UseResult (copy), Frame (copy), UseMemoResult (copy)
				local Elements = {}
				PeopleListStore.peopleSignalMap.iterateData(function(Text, p1)
					-- upvalues: Elements (copy), ReactModule (upval), GetFFlagPeoplePageLazyRenderCardsFunction (upval), LazyPersonCardModule (upval), PersonCardModule (upval), UseCardLayoutValuesModuleResult (upval), UseMemoResult1 (upval), LocalPlayer (upval), UseResult (upval), Frame (upval), UseMemoResult (upval)
					Elements["PersonCard_" .. Text] = ReactModule.createElement(if GetFFlagPeoplePageLazyRenderCardsFunction() then LazyPersonCardModule else PersonCardModule, {
						width = UseCardLayoutValuesModuleResult,
						person = p1.getPerson(),
						showTooltip = UseMemoResult1 and (LocalPlayer ~= nil and Text == LocalPlayer.UserId),
						onDismissTooltip = UseResult,
						layoutOrder = p1.getOrder,
						scrollingFrameStore = if GetFFlagPeoplePageLazyRenderCardsFunction() then Frame.scrollingFrameStore else nil,
						shouldShowMenu = if GetFFlagPeoplePageLazyRenderCardsFunction() then UseMemoResult else nil
					})
				end, false)
				
				return Elements
			end, {
				UseSignalStateResult1,
				UseMemoResult1,
				Frame.scrollingFrameStore,
				UseMemoResult
			}) else ReactModule.useMemo(function()
				-- upvalues: UseSignalStateResult (copy), ReactModule (upval), GetFFlagPeoplePageLazyRenderCardsFunction (upval), LazyPersonCardModule (upval), PersonCardModule (upval), UseCardLayoutValuesModuleResult (ref), UseMemoResult1 (copy), UseResult (copy), Frame (copy), UseMemoResult (copy)
				local Elements = {}
				
				for LayoutOrder, Person in UseSignalStateResult do
					Elements["PersonCard_" .. Person.UserId] = ReactModule.createElement(if GetFFlagPeoplePageLazyRenderCardsFunction() then LazyPersonCardModule else PersonCardModule, {
						width = UseCardLayoutValuesModuleResult,
						person = Person,
						showTooltip = UseMemoResult1 and LayoutOrder == 1,
						onDismissTooltip = UseResult,
						layoutOrder = LayoutOrder,
						scrollingFrameStore = if GetFFlagPeoplePageLazyRenderCardsFunction() then Frame.scrollingFrameStore else nil,
						shouldShowMenu = if GetFFlagPeoplePageLazyRenderCardsFunction() then UseMemoResult else nil
					})
				end
				return Elements
			end, {
				UseSignalStateResult,
				UseMemoResult1,
				Frame.scrollingFrameStore,
				UseMemoResult
			})
		end
	end
	return if FFlagPeopleCardsEnableVirtualizedGrid then ReactModule.createElement(VirtualizedGridModule, {
		scrollingFrameStore = Frame.scrollingFrameStore,
		itemWidth = UseCardLayoutValuesModuleResult,
		itemHeight = ItemHeight,
		numColumns = NumColumns,
		gapSize = Medium,
		numItems = #UseSignalStateResult,
		layoutOrder = Frame.LayoutOrder,
		onContainerWidthChanged = ReactModule.useCallback(function(p1)
			-- upvalues: Callback2 (ref), UseScaledValueResult (copy), Medium (copy)
			Callback2(UseScaledValueResult, p1, Medium)
		end, { UseScaledValueResult, Medium }),
		getElement = ReactModule.useCallback(function(p1: number)
			-- upvalues: UseSignalStateResult (copy), ReactModule (upval), PersonCardModule (upval), UseCardLayoutValuesModuleResult (ref), UseMemoResult1 (copy), UseResult (copy), UseMemoResult (copy)
			local UseSignalStateResultEntry = if p1 > 0 and p1 <= #UseSignalStateResult then UseSignalStateResult[p1] else nil
			
			return if UseSignalStateResultEntry then ReactModule.createElement(PersonCardModule, {
				width = UseCardLayoutValuesModuleResult,
				person = UseSignalStateResultEntry,
				showTooltip = UseMemoResult1,
				onDismissTooltip = UseResult,
				shouldShowMenu = UseMemoResult
			}) else nil
		end, {
			UseSignalStateResult,
			UseMemoResult1,
			UseMemoResult,
			UseResult
		})
	}) else ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		layout = {
			Wraps = true,
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, Medium)
		},
		LayoutOrder = Frame.LayoutOrder,
		onAbsoluteSizeChanged = UseResult1
	}, Elements)
end)