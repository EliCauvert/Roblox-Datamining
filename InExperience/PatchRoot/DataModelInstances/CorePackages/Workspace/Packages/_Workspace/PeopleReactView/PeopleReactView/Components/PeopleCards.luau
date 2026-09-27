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
local fFlagSideSheetOpenPeoplePage = require(parent.SharedFlags).FFlagSideSheetOpenPeoplePage
local flags = peopleServiceModule.getService("Flags")
local getFFlagPeoplePageEnablePersonSignalStore = flags.GetFFlagPeoplePageEnablePersonSignalStore
local getFFlagPeoplePageLazyRenderCards = flags.GetFFlagPeoplePageLazyRenderCards
local fFlagPeoplePageRemoveUseMemoElements = flags.FFlagPeoplePageRemoveUseMemoElements
local fFlagPeopleCardsEnableVirtualizedGrid = flags.FFlagPeopleCardsEnableVirtualizedGrid
local maxNumUniversesExposedToCardTooltip = game:DefineFastInt("MaxNumUniversesExposedToCardTooltip", 3)
local var1 = false

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), useScaledValue (ref), constantsModule (ref), fFlagSideSheetOpenPeoplePage (ref), reactModule (ref), fFlagPeopleCardsEnableVirtualizedGrid (ref), useCardLayoutValuesModule (ref), useCardWidthModule (ref), useGetPeopleServiceModule (ref), getFFlagPeoplePageEnablePersonSignalStore (ref), signalsReactModule (ref), getFFlagPeoplePageLazyRenderCards (ref), useLastInputMode (ref), usePreferredInput (ref), input (ref), var1 (write), maxNumUniversesExposedToCardTooltip (ref), fFlagPeoplePageRemoveUseMemoElements (ref), lazyPersonCardModule (ref), personCardModule (ref), localPlayer (ref), virtualizedGridModule (ref), view (ref)
	local var2 = useTokens()
	local medium = var2.Gap.Medium
	local var3 = useScaledValue(constantsModule.PEOPLEPAGE.PEOPLE_CARDS.MINIMUM_CARD_WIDTH)
	local var4 = if fFlagSideSheetOpenPeoplePage and p1.minimumCardWidth then p1.minimumCardWidth * var2.Config.UI.Scale else var3
	local var5 = nil
	local _ = nil
	local var6 = nil
	
	if fFlagSideSheetOpenPeoplePage then
		local var7, var8 = reactModule.useState(false)
		var5 = var7
		local var9 = var8
		var6 = reactModule.useCallback(function(p2)
			-- upvalues: var9 (write), var3 (ref)
			var9(p2 < var3)
		end, { var3 })
	end
	local var10
	local _ = nil
	local var11 = nil
	local var12 = nil
	local var13 = nil
	local var14 = nil
	
	if fFlagPeopleCardsEnableVirtualizedGrid then
		local var15, var16, var17, var18 = useCardLayoutValuesModule()
		var10 = var15
		var12 = var16
		var13 = var17
		var14 = var18
	else
		local var19, var20 = useCardWidthModule()
		var10 = var19
		var11 = var20
	end
	local var21 = nil
	local var22 = nil
	
	if fFlagPeopleCardsEnableVirtualizedGrid then
		local var23, var24 = reactModule.useState(false)
		var21 = var23
		var22 = var24
	end
	local var25 = useGetPeopleServiceModule("PeopleListStore")
	local var26 = if not getFFlagPeoplePageEnablePersonSignalStore() then signalsReactModule.useSignalState(var25.people) else nil
	local var27 = if getFFlagPeoplePageEnablePersonSignalStore() then signalsReactModule.useSignalState(var25.peopleSignalMap.getCount) else nil
	local var28 = if getFFlagPeoplePageLazyRenderCards() then useLastInputMode() else nil
	local var29 = if getFFlagPeoplePageLazyRenderCards() then usePreferredInput() else nil
	local var30 = if getFFlagPeoplePageLazyRenderCards() then reactModule.useMemo(function()
		-- upvalues: var28 (ref), var29 (ref), input (copy)
		return if var28 ~= "Focus" then var29 ~= input.Pointer else true
	end, { var28, var29 }) else nil
	local var31 = reactModule.useMemo(function()
		-- upvalues: fFlagPeopleCardsEnableVirtualizedGrid (copy), var21 (write), var1 (copy), p1 (ref), constantsModule (copy), maxNumUniversesExposedToCardTooltip (copy)
		if fFlagPeopleCardsEnableVirtualizedGrid and var21 or (var1 or not p1.getUniversesExposedTo) or not p1.addUniverseToExposureList then
			return false
		end
		local var32 = 0
		
		for i, v in p1.getUniversesExposedTo(constantsModule.PEOPLEPAGE.CARD_TOOLTIP.UNIVERSES_EXPOSED_TO_CARD_TOOLTIP) do
			if v ~= game.GameId then
				var32 += 1
				continue
			end
			return false
		end
		if maxNumUniversesExposedToCardTooltip <= var32 then
			return false
		end
		p1.addUniverseToExposureList(constantsModule.PEOPLEPAGE.CARD_TOOLTIP.UNIVERSES_EXPOSED_TO_CARD_TOOLTIP, game.GameId)
		
		return true
	end, if fFlagPeopleCardsEnableVirtualizedGrid then {
		var21,
		p1.getUniversesExposedTo,
		p1.addUniverseToExposureList
	} else { p1.getUniversesExposedTo, p1.addUniverseToExposureList })
	local var33 = reactModule.useCallback(function()
		-- upvalues: var1 (copy), fFlagPeopleCardsEnableVirtualizedGrid (copy), var22 (write)
		var1 = true
		
		if fFlagPeopleCardsEnableVirtualizedGrid then
			var22(true)
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var33 (ref)
		return function()
			-- upvalues: var33 (copy)
			var33()
		end
	end, {})
	local var34 = reactModule.useCallback(function(p2)
		-- upvalues: var11 (write), var4 (ref), medium (ref), fFlagSideSheetOpenPeoplePage (copy), var6 (write)
		local var35 = var11(var4, p2.AbsoluteSize.X, medium)
		
		if fFlagSideSheetOpenPeoplePage then
			var6(var35)
		end
	end, if fFlagSideSheetOpenPeoplePage then { var11, var6, var4, medium } else { var11, var4, medium })
	local t = {}
	
	if not fFlagPeopleCardsEnableVirtualizedGrid then
		if not fFlagPeoplePageRemoveUseMemoElements then
			t = if getFFlagPeoplePageEnablePersonSignalStore() then reactModule.useMemo(function()
				-- upvalues: var25 (ref), reactModule (copy), getFFlagPeoplePageLazyRenderCards (copy), lazyPersonCardModule (copy), personCardModule (copy), var10 (write), var31 (ref), localPlayer (copy), var33 (ref), p1 (ref), var30 (ref), var5 (write)
				local t = {}
				var25.peopleSignalMap.iterateData(function(p2, p3)
					-- upvalues: t (ref), reactModule (copy), getFFlagPeoplePageLazyRenderCards (copy), lazyPersonCardModule (copy), personCardModule (copy), var10 (copy), var31 (copy), localPlayer (copy), var33 (copy), p1 (copy), var30 (copy), var5 (copy)
					t["PersonCard_" .. p3] = reactModule.createElement(if getFFlagPeoplePageLazyRenderCards() then lazyPersonCardModule else personCardModule, {
						width = var10,
						person = p3.getPerson(),
						showTooltip = var31 and (localPlayer ~= nil and p2 == localPlayer.UserId),
						onDismissTooltip = var33,
						layoutOrder = p3.getOrder,
						scrollingFrameStore = if getFFlagPeoplePageLazyRenderCards() then p1.scrollingFrameStore else nil,
						shouldShowMenu = if getFFlagPeoplePageLazyRenderCards() then var30 else nil,
						isCompactCardLayout = var5
					})
				end, false)
				
				return t
			end, {
				var27,
				var31,
				p1.scrollingFrameStore,
				var30,
				var5
			}) else reactModule.useMemo(function()
				-- upvalues: var26 (ref), reactModule (copy), getFFlagPeoplePageLazyRenderCards (copy), lazyPersonCardModule (copy), personCardModule (copy), var10 (write), var31 (ref), var33 (ref), p1 (ref), var30 (ref), var5 (write)
				local t = {}
				
				for i, v in var26 do
					t["PersonCard_" .. v.UserId] = reactModule.createElement(if getFFlagPeoplePageLazyRenderCards() then lazyPersonCardModule else personCardModule, {
						width = var10,
						person = v,
						showTooltip = var31 and i == 1,
						onDismissTooltip = var33,
						layoutOrder = i,
						scrollingFrameStore = if getFFlagPeoplePageLazyRenderCards() then p1.scrollingFrameStore else nil,
						shouldShowMenu = if getFFlagPeoplePageLazyRenderCards() then var30 else nil,
						isCompactCardLayout = var5
					})
				end
				return t
			end, {
				var26,
				var31,
				p1.scrollingFrameStore,
				var30,
				var5
			})
		elseif getFFlagPeoplePageEnablePersonSignalStore() then
			t = {}
			var25.peopleSignalMap.iterateData(function(p2, p3)
				-- upvalues: t (write), reactModule (copy), getFFlagPeoplePageLazyRenderCards (copy), lazyPersonCardModule (copy), personCardModule (copy), var10 (write), var31 (ref), localPlayer (copy), var33 (ref), p1 (ref), var30 (ref), var5 (write)
				t["PersonCard_" .. p5] = reactModule.createElement(if getFFlagPeoplePageLazyRenderCards() then lazyPersonCardModule else personCardModule, {
					width = var10,
					person = p3.getPerson(),
					showTooltip = var31 and (localPlayer ~= nil and p2 == localPlayer.UserId),
					onDismissTooltip = var33,
					layoutOrder = p3.getOrder,
					scrollingFrameStore = if getFFlagPeoplePageLazyRenderCards() then p1.scrollingFrameStore else nil,
					shouldShowMenu = if getFFlagPeoplePageLazyRenderCards() then var30 else nil,
					isCompactCardLayout = var5
				})
			end, false)
		else
			t = {}
			
			for i, v in var26 do
				t["PersonCard_" .. v.UserId] = reactModule.createElement(if getFFlagPeoplePageLazyRenderCards() then lazyPersonCardModule else personCardModule, {
					width = var10,
					person = v,
					showTooltip = var31 and i == 1,
					onDismissTooltip = var33,
					layoutOrder = i,
					scrollingFrameStore = if getFFlagPeoplePageLazyRenderCards() then p1.scrollingFrameStore else nil,
					shouldShowMenu = if getFFlagPeoplePageLazyRenderCards() then var30 else nil,
					isCompactCardLayout = var5
				})
			end
		end
	end
	return if fFlagPeopleCardsEnableVirtualizedGrid then reactModule.createElement(virtualizedGridModule, {
		scrollingFrameStore = p1.scrollingFrameStore,
		itemWidth = var10,
		itemHeight = var12,
		numColumns = var13,
		gapSize = medium,
		numItems = #var26,
		layoutOrder = p1.LayoutOrder,
		onContainerWidthChanged = reactModule.useCallback(function(p2)
			-- upvalues: var14 (write), var4 (ref), medium (ref), fFlagSideSheetOpenPeoplePage (copy), var6 (write)
			local var35 = var14(var4, p2, medium)
			
			if fFlagSideSheetOpenPeoplePage then
				var6(var35)
			end
		end, if fFlagSideSheetOpenPeoplePage then { var14, var6, var4, medium } else { var4, medium }),
		getElement = reactModule.useCallback(function(p2)
			-- upvalues: var26 (ref), reactModule (copy), personCardModule (copy), var10 (write), var31 (ref), var33 (ref), var30 (ref), var5 (write)
			local var35 = if p2 > 0 and p2 <= #var26 then var26[p2] else nil
			
			return if var35 then reactModule.createElement(personCardModule, {
				width = var10,
				person = var35,
				showTooltip = var31,
				onDismissTooltip = var33,
				shouldShowMenu = var30,
				isCompactCardLayout = var5
			}) else nil
		end, {
			var26,
			var31,
			var30,
			var33,
			var5
		})
	}) else reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		layout = {
			Wraps = true,
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, medium)
		},
		LayoutOrder = p1.LayoutOrder,
		onAbsoluteSizeChanged = var34
	}, t)
end)