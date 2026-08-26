local collectionViews = script:FindFirstAncestor("CollectionViews")
local parent = collectionViews.Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local responsiveModule = require(parent.Responsive)
local usePreferredInput = responsiveModule.usePreferredInput
local useBreakpointXOrSmaller = responsiveModule.useBreakpointXOrSmaller
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local signalsModule = require(parent.Signals)
local displayModule = require(parent.Display)
local discoveryTypesModule = require(parent.DiscoveryTypes)
local luaAppFixComputedSideMarginResponsiveBreakpoint = game:DefineFastFlag("LuaAppFixComputedSideMarginResponsiveBreakpoint", false)
local collectionLayoutCalculatorsModule = require(collectionViews.CollectionLayoutCalculators)
local _ = require(collectionViews.CollectionViewTypes)
local GAME_CAROUSEL_SIDE_COMPACT_PADDING = discoveryTypesModule.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING
local GAME_CAROUSEL_SIDE_WIDE_PADDING = discoveryTypesModule.Constants.GAME_CAROUSEL_SIDE_WIDE_PADDING

return function(p1, p2)
	-- upvalues: collectionLayoutCalculatorsModule (ref), useTokens (ref), usePreferredInput (ref), useAppPolicy (ref), reactModule (ref), signalsModule (ref), useBreakpointXOrSmaller (ref), luaAppFixComputedSideMarginResponsiveBreakpoint (ref), responsiveModule (ref), displayModule (ref), GAME_CAROUSEL_SIDE_COMPACT_PADDING (ref), GAME_CAROUSEL_SIDE_WIDE_PADDING (ref)
	local var1 = useTokens()
	local var2 = usePreferredInput()
	local var3 = useAppPolicy(function(p3)
		return p3.useGridPageLayout()
	end)
	local var4, var5 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy)
		return signalsModule.createSignal(false)
	end, {})
	var5(useBreakpointXOrSmaller(if luaAppFixComputedSideMarginResponsiveBreakpoint then responsiveModule.Keys.Small else responsiveModule.Keys.Medium))
	local var6 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), displayModule (copy)
		return signalsModule.createComputed(function(p3)
			-- upvalues: displayModule (copy)
			local viewportSize = displayModule.GetDisplayStore(p3).getViewportSize(p3)
			
			return if viewportSize then viewportSize.X else 0
		end)
	end, {})
	local var7, var8 = reactModule.useMemo(function()
		-- upvalues: var6 (ref), signalsModule (copy)
		return signalsModule.createSignal(var6(false))
	end, {})
	local var9 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p2 (ref), var3 (ref), var4 (ref), GAME_CAROUSEL_SIDE_COMPACT_PADDING (copy), GAME_CAROUSEL_SIDE_WIDE_PADDING (copy), var6 (ref), var7 (ref), collectionLayoutCalculatorsModule (ref), var1 (ref)
		return signalsModule.createComputed(function(p3)
			-- upvalues: p2 (copy), var3 (copy), var4 (copy), GAME_CAROUSEL_SIDE_COMPACT_PADDING (copy), GAME_CAROUSEL_SIDE_WIDE_PADDING (copy), var6 (copy), var7 (copy), collectionLayoutCalculatorsModule (copy), var1 (copy)
			return p2 or (if var3 then collectionLayoutCalculatorsModule.calculateSideMargin(var7(p3), var1, var6(p3)) elseif var4(p3) then GAME_CAROUSEL_SIDE_COMPACT_PADDING else GAME_CAROUSEL_SIDE_WIDE_PADDING)
		end)
	end, {
		var6, var7, var4, p2, collectionLayoutCalculatorsModule, var1, var3
	})
	local var10 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var6 (ref), var7 (ref), collectionLayoutCalculatorsModule (ref), var1 (ref)
		return signalsModule.createComputed(function(p3)
			-- upvalues: var6 (copy), var7 (copy), collectionLayoutCalculatorsModule (copy), var1 (copy)
			return collectionLayoutCalculatorsModule.calculateColumnGap(var7(p3), var1, var6(p3))
		end)
	end, { var6, var7, collectionLayoutCalculatorsModule, var1 })
	local var11 = reactModule.useCallback(function(p3)
		-- upvalues: signalsModule (copy), var7 (ref), var9 (ref), var10 (ref), collectionLayoutCalculatorsModule (ref), var1 (ref)
		return signalsModule.createComputed(function(p4)
			-- upvalues: var7 (copy), var9 (copy), var10 (copy), collectionLayoutCalculatorsModule (copy), p3 (ref), var1 (copy)
			return collectionLayoutCalculatorsModule.calculateNumColumns(var7(p4), var9(p4), var10(p4), p3, var1)
		end)
	end, {
		var7,
		var9,
		var10,
		collectionLayoutCalculatorsModule,
		var1
	})
	local var12 = reactModule.useCallback(function(p3)
		-- upvalues: var8 (ref)
		var8(p3.X)
	end, { var8 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var12 (ref)
		local var13 = nil
		
		if p1 then
			var12(p1.AbsoluteSize)
			var13 = p1:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: var12 (copy), p1 (copy)
				var12(p1.AbsoluteSize)
			end)
		end
		return function()
			-- upvalues: var13 (write)
			if var13 then
				var13:Disconnect()
			end
		end
	end, { var12, p1 })
	
	return reactModule.useCallback(function(p3)
		-- upvalues: signalsModule (copy), var11 (ref), var10 (ref), var9 (ref), collectionLayoutCalculatorsModule (ref), var2 (ref), var1 (ref)
		return signalsModule.createComputed(function(p4)
			-- upvalues: var11 (copy), p3 (ref), var10 (copy), var9 (copy), collectionLayoutCalculatorsModule (copy), var2 (copy), var1 (copy)
			return {
				numColumns = var11(p3)(p4),
				fractionalItemAmount = collectionLayoutCalculatorsModule.calculateFractionalItemAmount(p3, var2),
				columnGap = var10(p4),
				sideMargin = var9(p4),
				verticalPadding = collectionLayoutCalculatorsModule.calculateVerticalPadding(var1, p3),
				maxTilesToShow = collectionLayoutCalculatorsModule.calculateMaxTilesToShow(var2)
			}
		end)
	end, {
		var11, var10, var9, var2, var1, collectionLayoutCalculatorsModule
	})
end