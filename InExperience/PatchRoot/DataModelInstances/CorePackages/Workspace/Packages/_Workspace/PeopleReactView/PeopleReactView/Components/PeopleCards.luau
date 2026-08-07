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
local var16 = false

return reactModule.memo(function(p0) --[[ line: 59 | named "PeopleCards" ]]
	-- upvalues: useTokens (ref), useScaledValue (ref), constantsModule (ref), fFlagPeopleCardsEnableVirtualizedGrid (ref), useCardLayoutValuesModule (ref), useCardWidthModule (ref), reactModule (ref), useGetPeopleServiceModule (ref), getFFlagPeoplePageEnablePersonSignalStore (ref), signalsReactModule (ref), getFFlagPeoplePageLazyRenderCards (ref), useLastInputMode (ref), usePreferredInput (ref), input (ref), var16 (write), maxNumUniversesExposedToCardTooltip (ref), fFlagPeoplePageRemoveUseMemoElements (ref), lazyPersonCardModule (ref), personCardModule (ref), localPlayer (ref), virtualizedGridModule (ref), view (ref)
	local var26
	local medium = useTokens().Gap.Medium
	local var17 = useScaledValue(constantsModule.PEOPLEPAGE.PEOPLE_CARDS.MINIMUM_CARD_WIDTH)
	local _ = nil
	local var18 = nil
	local var19 = nil
	local var20 = nil
	local var21 = nil
	
	if fFlagPeopleCardsEnableVirtualizedGrid then
		local var22, var23, var24, var25 = useCardLayoutValuesModule()
		var26 = var22
		var19 = var23
		var20 = var24
		var21 = var25
	else
		local var27, var28 = useCardWidthModule()
		var26 = var27
		var18 = var28
	end
	local var29 = nil
	local var30 = nil
	
	if fFlagPeopleCardsEnableVirtualizedGrid then
		local var31, var32 = reactModule.useState(false)
		var29 = var31
		var30 = var32
	end
	local var33 = useGetPeopleServiceModule("PeopleListStore")
	local var34 = if not getFFlagPeoplePageEnablePersonSignalStore() then signalsReactModule.useSignalState(var33.people) else nil
	local var35 = if getFFlagPeoplePageEnablePersonSignalStore() then signalsReactModule.useSignalState(var33.peopleSignalMap.getCount) else nil
	local var36 = if getFFlagPeoplePageLazyRenderCards() then useLastInputMode() else nil
	local var37 = if getFFlagPeoplePageLazyRenderCards() then usePreferredInput() else nil
	local var38 = if getFFlagPeoplePageLazyRenderCards() then reactModule.useMemo(function() --[[ line: 92 ]]
		-- upvalues: var36 (ref), var37 (ref), input (copy)
		return if var36 ~= "Focus" then var37 ~= input.Pointer else true
	end, { var36, var37 }) else nil
	local var39 = reactModule.useMemo(function() --[[ line: 98 ]]
		-- upvalues: fFlagPeopleCardsEnableVirtualizedGrid (copy), var29 (write), var16 (copy), p0 (ref), constantsModule (copy), maxNumUniversesExposedToCardTooltip (copy)
		if fFlagPeopleCardsEnableVirtualizedGrid and var29 or (var16 or not p0.getUniversesExposedTo) or not p0.addUniverseToExposureList then
			return false
		end
		local var43 = 0
		
		for i, v in p0.getUniversesExposedTo(constantsModule.PEOPLEPAGE.CARD_TOOLTIP.UNIVERSES_EXPOSED_TO_CARD_TOOLTIP) do
			if v ~= game.GameId then
				var43 += 1
				continue
			end
			return false
		end
		if maxNumUniversesExposedToCardTooltip <= var43 then
			return false
		end
		p0.addUniverseToExposureList(constantsModule.PEOPLEPAGE.CARD_TOOLTIP.UNIVERSES_EXPOSED_TO_CARD_TOOLTIP, game.GameId)
		
		return true
	end, if fFlagPeopleCardsEnableVirtualizedGrid then {
		var29,
		p0.getUniversesExposedTo,
		p0.addUniverseToExposureList
	} else { p0.getUniversesExposedTo, p0.addUniverseToExposureList })
	local var40 = reactModule.useCallback(function() --[[ line: 133 ]]
		-- upvalues: var16 (copy), fFlagPeopleCardsEnableVirtualizedGrid (copy), var30 (write)
		var16 = true
		
		if fFlagPeopleCardsEnableVirtualizedGrid then
			var30(true)
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 140 ]]
		-- upvalues: var40 (ref)
		return function() --[[ line: 141 ]]
			-- upvalues: var40 (copy)
			var40()
		end
	end, {})
	local var41 = reactModule.useCallback(function(p1) --[[ line: 146 ]]
		-- upvalues: var18 (write), var17 (ref), medium (ref)
		var18(var17, p1.AbsoluteSize.X, medium)
	end, { var18, var17, medium })
	local t = {}
	
	if not fFlagPeopleCardsEnableVirtualizedGrid then
		if not fFlagPeoplePageRemoveUseMemoElements then
			t = if getFFlagPeoplePageEnablePersonSignalStore() then reactModule.useMemo(function() --[[ line: 194 ]]
				-- upvalues: var33 (ref), reactModule (copy), getFFlagPeoplePageLazyRenderCards (copy), lazyPersonCardModule (copy), personCardModule (copy), var26 (write), var39 (ref), localPlayer (copy), var40 (ref), p0 (ref), var38 (ref)
				local t = {}
				var33.peopleSignalMap.iterateData(function(p2, p3) --[[ line: 197 ]]
					-- upvalues: t (ref), reactModule (copy), getFFlagPeoplePageLazyRenderCards (copy), lazyPersonCardModule (copy), personCardModule (copy), var26 (copy), var39 (copy), localPlayer (copy), var40 (copy), p0 (copy), var38 (copy)
					t["PersonCard_" .. p2] = reactModule.createElement(if getFFlagPeoplePageLazyRenderCards() then lazyPersonCardModule else personCardModule, {
						width = var26,
						person = p3.getPerson(),
						showTooltip = var39 and (localPlayer ~= nil and p2 == localPlayer.UserId),
						onDismissTooltip = var40,
						layoutOrder = p3.getOrder,
						scrollingFrameStore = if getFFlagPeoplePageLazyRenderCards() then p0.scrollingFrameStore else nil,
						shouldShowMenu = if getFFlagPeoplePageLazyRenderCards() then var38 else nil
					})
				end, false)
				
				return t
			end, { var35, var39, p0.scrollingFrameStore, var38 }) else reactModule.useMemo(function() --[[ line: 219 ]]
				-- upvalues: var34 (ref), reactModule (copy), getFFlagPeoplePageLazyRenderCards (copy), lazyPersonCardModule (copy), personCardModule (copy), var26 (write), var39 (ref), var40 (ref), p0 (ref), var38 (ref)
				local t = {}
				
				for i, v in var34 do
					t["PersonCard_" .. v.UserId] = reactModule.createElement(if getFFlagPeoplePageLazyRenderCards() then lazyPersonCardModule else personCardModule, {
						width = var26,
						person = v,
						showTooltip = var39 and i == 1,
						onDismissTooltip = var40,
						layoutOrder = i,
						scrollingFrameStore = if getFFlagPeoplePageLazyRenderCards() then p0.scrollingFrameStore else nil,
						shouldShowMenu = if getFFlagPeoplePageLazyRenderCards() then var38 else nil
					})
				end
				return t
			end, { var34, var39, p0.scrollingFrameStore, var38 })
		elseif getFFlagPeoplePageEnablePersonSignalStore() then
			t = {}
			var33.peopleSignalMap.iterateData(function(p4, p5) --[[ line: 156 ]]
				-- upvalues: t (write), reactModule (copy), getFFlagPeoplePageLazyRenderCards (copy), lazyPersonCardModule (copy), personCardModule (copy), var26 (write), var39 (ref), localPlayer (copy), var40 (ref), p0 (ref), var38 (ref)
				t["PersonCard_" .. p4] = reactModule.createElement(if getFFlagPeoplePageLazyRenderCards() then lazyPersonCardModule else personCardModule, {
					width = var26,
					person = p5.getPerson(),
					showTooltip = var39 and (localPlayer ~= nil and p4 == localPlayer.UserId),
					onDismissTooltip = var40,
					layoutOrder = p5.getOrder,
					scrollingFrameStore = if getFFlagPeoplePageLazyRenderCards() then p0.scrollingFrameStore else nil,
					shouldShowMenu = if getFFlagPeoplePageLazyRenderCards() then var38 else nil
				})
			end, false)
		else
			t = {}
			
			for i, v in var34 do
				t["PersonCard_" .. v.UserId] = reactModule.createElement(if getFFlagPeoplePageLazyRenderCards() then lazyPersonCardModule else personCardModule, {
					width = var26,
					person = v,
					showTooltip = var39 and i == 1,
					onDismissTooltip = var40,
					layoutOrder = i,
					scrollingFrameStore = if getFFlagPeoplePageLazyRenderCards() then p0.scrollingFrameStore else nil,
					shouldShowMenu = if getFFlagPeoplePageLazyRenderCards() then var38 else nil
				})
			end
		end
	end
	return if fFlagPeopleCardsEnableVirtualizedGrid then reactModule.createElement(virtualizedGridModule, {
		scrollingFrameStore = p0.scrollingFrameStore,
		itemWidth = var26,
		itemHeight = var19,
		numColumns = var20,
		gapSize = medium,
		numItems = #var34,
		layoutOrder = p0.LayoutOrder,
		onContainerWidthChanged = reactModule.useCallback(function(p6) --[[ line: 246 ]]
			-- upvalues: var21 (write), var17 (ref), medium (ref)
			var21(var17, p6, medium)
		end, { var17, medium }),
		getElement = reactModule.useCallback(function(p7) --[[ line: 250 ]]
			-- upvalues: var34 (ref), reactModule (copy), personCardModule (copy), var26 (write), var39 (ref), var40 (ref), var38 (ref)
			local var46 = if p7 > 0 and p7 <= #var34 then var34[p7] else nil
			
			return if var46 then reactModule.createElement(personCardModule, {
				width = var26,
				person = var46,
				showTooltip = var39,
				onDismissTooltip = var40,
				shouldShowMenu = var38
			}) else nil
		end, { var34, var39, var38, var40 })
	}) else reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		layout = {
			Wraps = true,
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, medium)
		},
		LayoutOrder = p0.LayoutOrder,
		onAbsoluteSizeChanged = var41
	}, t)
end)