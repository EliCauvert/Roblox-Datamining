local playersService = game:GetService("Players")
local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local foundationModule = require(parent.Foundation)
local useScaledValue = foundationModule.Hooks.useScaledValue
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local responsiveModule = require(parent.Responsive)
local usePreferredInput = responsiveModule.usePreferredInput
local input = responsiveModule.Input
local useLastInputMode = require(parent.FocusNavigationUtils).useLastInputMode
local peopleServiceModule = require(parent.PeopleService)
local _ = require(peopleReactView.Stores.GetScrollingFrameStore)
local useCardWidthModule = require(peopleReactView.Hooks.useCardWidth)
local useCardLayoutValuesModule = require(peopleReactView.Hooks.useCardLayoutValues)
local useGetPeopleServiceModule = require(peopleReactView.Hooks.useGetPeopleService)
local personCardModule = require(peopleReactView.Components.Card.PersonCard)
local lazyPersonCardModule = require(peopleReactView.Components.Card.LazyPersonCard)
local virtualizedGridModule = require(peopleReactView.Components.Common.VirtualizedGrid)
local constantsModule = require(peopleReactView.Constants)
local localPlayer = playersService.LocalPlayer
local flags = peopleServiceModule.getService("Flags")
local getFFlagPeoplePageEnablePersonSignalStore = flags.GetFFlagPeoplePageEnablePersonSignalStore
local getFFlagPeoplePageLazyRenderCards = flags.GetFFlagPeoplePageLazyRenderCards
local fFlagPeoplePageRemoveUseMemoElements = flags.FFlagPeoplePageRemoveUseMemoElements
local fFlagPeopleCardsEnableVirtualizedGrid = flags.FFlagPeopleCardsEnableVirtualizedGrid
local maxNumUniversesExposedToCardTooltip = game:DefineFastInt("MaxNumUniversesExposedToCardTooltip", 3)
local var1 = false

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), useScaledValue (ref), constantsModule (ref), fFlagPeopleCardsEnableVirtualizedGrid (ref), useCardLayoutValuesModule (ref), useCardWidthModule (ref), reactModule (ref), useGetPeopleServiceModule (ref), getFFlagPeoplePageEnablePersonSignalStore (ref), signalsReactModule (ref), getFFlagPeoplePageLazyRenderCards (ref), useLastInputMode (ref), usePreferredInput (ref), input (ref), var1 (write), maxNumUniversesExposedToCardTooltip (ref), fFlagPeoplePageRemoveUseMemoElements (ref), lazyPersonCardModule (ref), personCardModule (ref), localPlayer (ref), virtualizedGridModule (ref), view (ref)
	local var2
	local medium = useTokens().Gap.Medium
	local var3 = useScaledValue(constantsModule.PEOPLEPAGE.PEOPLE_CARDS.MINIMUM_CARD_WIDTH)
	local _ = nil
	local var4 = nil
	local var5 = nil
	local var6 = nil
	local var7 = nil
	
	if fFlagPeopleCardsEnableVirtualizedGrid then
		local var8, var9, var10, var11 = useCardLayoutValuesModule()
		var2 = var8
		var5 = var9
		var6 = var10
		var7 = var11
	else
		local var12, var13 = useCardWidthModule()
		var2 = var12
		var4 = var13
	end
	local var14 = nil
	local var15 = nil
	
	if fFlagPeopleCardsEnableVirtualizedGrid then
		local var16, var17 = reactModule.useState(false)
		var14 = var16
		var15 = var17
	end
	local var18 = useGetPeopleServiceModule("PeopleListStore")
	local var19 = if not getFFlagPeoplePageEnablePersonSignalStore() then signalsReactModule.useSignalState(var18.people) else nil
	local var20 = if getFFlagPeoplePageEnablePersonSignalStore() then signalsReactModule.useSignalState(var18.peopleSignalMap.getCount) else nil
	local var21 = if getFFlagPeoplePageLazyRenderCards() then useLastInputMode() else nil
	local var22 = if getFFlagPeoplePageLazyRenderCards() then usePreferredInput() else nil
	local var23 = if getFFlagPeoplePageLazyRenderCards() then reactModule.useMemo(function()
		-- upvalues: var21 (ref), var22 (ref), input (copy)
		return if var21 ~= "Focus" then var22 ~= input.Pointer else true
	end, { var21, var22 }) else nil
	local var24 = reactModule.useMemo(function()
		-- upvalues: fFlagPeopleCardsEnableVirtualizedGrid (copy), var14 (write), var1 (copy), p1 (ref), constantsModule (copy), maxNumUniversesExposedToCardTooltip (copy)
		if fFlagPeopleCardsEnableVirtualizedGrid and var14 or (var1 or not p1.getUniversesExposedTo) or not p1.addUniverseToExposureList then
			return false
		end
		local var25 = 0
		
		for i, v in p1.getUniversesExposedTo(constantsModule.PEOPLEPAGE.CARD_TOOLTIP.UNIVERSES_EXPOSED_TO_CARD_TOOLTIP) do
			if v ~= game.GameId then
				var25 += 1
				continue
			end
			return false
		end
		if maxNumUniversesExposedToCardTooltip <= var25 then
			return false
		end
		p1.addUniverseToExposureList(constantsModule.PEOPLEPAGE.CARD_TOOLTIP.UNIVERSES_EXPOSED_TO_CARD_TOOLTIP, game.GameId)
		
		return true
	end, if fFlagPeopleCardsEnableVirtualizedGrid then {
		var14,
		p1.getUniversesExposedTo,
		p1.addUniverseToExposureList
	} else { p1.getUniversesExposedTo, p1.addUniverseToExposureList })
	local var26 = reactModule.useCallback(function()
		-- upvalues: var1 (copy), fFlagPeopleCardsEnableVirtualizedGrid (copy), var15 (write)
		var1 = true
		
		if fFlagPeopleCardsEnableVirtualizedGrid then
			var15(true)
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var26 (ref)
		return function()
			-- upvalues: var26 (copy)
			var26()
		end
	end, {})
	local var27 = reactModule.useCallback(function(p2)
		-- upvalues: var4 (write), var3 (ref), medium (ref)
		var4(var3, p2.AbsoluteSize.X, medium)
	end, { var4, var3, medium })
	local t = {}
	
	if not fFlagPeopleCardsEnableVirtualizedGrid then
		if not fFlagPeoplePageRemoveUseMemoElements then
			t = if getFFlagPeoplePageEnablePersonSignalStore() then reactModule.useMemo(function()
				-- upvalues: var18 (ref), reactModule (copy), getFFlagPeoplePageLazyRenderCards (copy), lazyPersonCardModule (copy), personCardModule (copy), var2 (write), var24 (ref), localPlayer (copy), var26 (ref), p1 (ref), var23 (ref)
				local t = {}
				var18.peopleSignalMap.iterateData(function(p2, p3)
					-- upvalues: t (ref), reactModule (copy), getFFlagPeoplePageLazyRenderCards (copy), lazyPersonCardModule (copy), personCardModule (copy), var2 (copy), var24 (copy), localPlayer (copy), var26 (copy), p1 (copy), var23 (copy)
					t["PersonCard_" .. p2] = reactModule.createElement(if getFFlagPeoplePageLazyRenderCards() then lazyPersonCardModule else personCardModule, {
						width = var2,
						person = p3.getPerson(),
						showTooltip = var24 and (localPlayer ~= nil and p2 == localPlayer.UserId),
						onDismissTooltip = var26,
						layoutOrder = p3.getOrder,
						scrollingFrameStore = if getFFlagPeoplePageLazyRenderCards() then p1.scrollingFrameStore else nil,
						shouldShowMenu = if getFFlagPeoplePageLazyRenderCards() then var23 else nil
					})
				end, false)
				
				return t
			end, { var20, var24, p1.scrollingFrameStore, var23 }) else reactModule.useMemo(function()
				-- upvalues: var19 (ref), reactModule (copy), getFFlagPeoplePageLazyRenderCards (copy), lazyPersonCardModule (copy), personCardModule (copy), var2 (write), var24 (ref), var26 (ref), p1 (ref), var23 (ref)
				local t = {}
				
				for i, v in var19 do
					t["PersonCard_" .. v.UserId] = reactModule.createElement(if getFFlagPeoplePageLazyRenderCards() then lazyPersonCardModule else personCardModule, {
						width = var2,
						person = v,
						showTooltip = var24 and i == 1,
						onDismissTooltip = var26,
						layoutOrder = i,
						scrollingFrameStore = if getFFlagPeoplePageLazyRenderCards() then p1.scrollingFrameStore else nil,
						shouldShowMenu = if getFFlagPeoplePageLazyRenderCards() then var23 else nil
					})
				end
				return t
			end, { var19, var24, p1.scrollingFrameStore, var23 })
		elseif getFFlagPeoplePageEnablePersonSignalStore() then
			t = {}
			var18.peopleSignalMap.iterateData(function(p2, p3)
				-- upvalues: t (write), reactModule (copy), getFFlagPeoplePageLazyRenderCards (copy), lazyPersonCardModule (copy), personCardModule (copy), var2 (write), var24 (ref), localPlayer (copy), var26 (ref), p1 (ref), var23 (ref)
				t["PersonCard_" .. p4] = reactModule.createElement(if getFFlagPeoplePageLazyRenderCards() then lazyPersonCardModule else personCardModule, {
					width = var2,
					person = p3.getPerson(),
					showTooltip = var24 and (localPlayer ~= nil and p2 == localPlayer.UserId),
					onDismissTooltip = var26,
					layoutOrder = p3.getOrder,
					scrollingFrameStore = if getFFlagPeoplePageLazyRenderCards() then p1.scrollingFrameStore else nil,
					shouldShowMenu = if getFFlagPeoplePageLazyRenderCards() then var23 else nil
				})
			end, false)
		else
			t = {}
			
			for i, v in var19 do
				t["PersonCard_" .. v.UserId] = reactModule.createElement(if getFFlagPeoplePageLazyRenderCards() then lazyPersonCardModule else personCardModule, {
					width = var2,
					person = v,
					showTooltip = var24 and i == 1,
					onDismissTooltip = var26,
					layoutOrder = i,
					scrollingFrameStore = if getFFlagPeoplePageLazyRenderCards() then p1.scrollingFrameStore else nil,
					shouldShowMenu = if getFFlagPeoplePageLazyRenderCards() then var23 else nil
				})
			end
		end
	end
	return if fFlagPeopleCardsEnableVirtualizedGrid then reactModule.createElement(virtualizedGridModule, {
		scrollingFrameStore = p1.scrollingFrameStore,
		itemWidth = var2,
		itemHeight = var5,
		numColumns = var6,
		gapSize = medium,
		numItems = #var19,
		layoutOrder = p1.LayoutOrder,
		onContainerWidthChanged = reactModule.useCallback(function(p2)
			-- upvalues: var7 (write), var3 (ref), medium (ref)
			var7(var3, p2, medium)
		end, { var3, medium }),
		getElement = reactModule.useCallback(function(p2)
			-- upvalues: var19 (ref), reactModule (copy), personCardModule (copy), var2 (write), var24 (ref), var26 (ref), var23 (ref)
			local var28 = if p2 > 0 and p2 <= #var19 then var19[p2] else nil
			
			return if var28 then reactModule.createElement(personCardModule, {
				width = var2,
				person = var28,
				showTooltip = var24,
				onDismissTooltip = var26,
				shouldShowMenu = var23
			}) else nil
		end, { var19, var24, var23, var26 })
	}) else reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		layout = {
			Wraps = true,
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, medium)
		},
		LayoutOrder = p1.LayoutOrder,
		onAbsoluteSizeChanged = var27
	}, t)
end)