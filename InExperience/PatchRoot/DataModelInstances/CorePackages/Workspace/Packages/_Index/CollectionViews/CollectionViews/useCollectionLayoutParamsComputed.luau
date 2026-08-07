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

return function(p0, p1) --[[ line: 28 | named "useCollectionLayoutParamsComputed" ]]
	-- upvalues: collectionLayoutCalculatorsModule (ref), useTokens (ref), usePreferredInput (ref), useAppPolicy (ref), reactModule (ref), signalsModule (ref), useBreakpointXOrSmaller (ref), luaAppFixComputedSideMarginResponsiveBreakpoint (ref), responsiveModule (ref), displayModule (ref), GAME_CAROUSEL_SIDE_COMPACT_PADDING (ref), GAME_CAROUSEL_SIDE_WIDE_PADDING (ref)
	local var8 = useTokens()
	local var9 = usePreferredInput()
	local var10 = useAppPolicy(function(p2) --[[ line: 35 ]]
		return p2.useGridPageLayout()
	end)
	local var11, var12 = reactModule.useMemo(function() --[[ line: 39 ]]
		-- upvalues: signalsModule (copy)
		return signalsModule.createSignal(false)
	end, {})
	var12(useBreakpointXOrSmaller(if luaAppFixComputedSideMarginResponsiveBreakpoint then responsiveModule.Keys.Small else responsiveModule.Keys.Medium))
	local var13 = reactModule.useMemo(function() --[[ line: 47 ]]
		-- upvalues: signalsModule (copy), displayModule (copy)
		return signalsModule.createComputed(function(p3) --[[ line: 48 ]]
			-- upvalues: displayModule (copy)
			local viewportSize = displayModule.GetDisplayStore(p3).getViewportSize(p3)
			
			return if viewportSize then viewportSize.X else 0
		end)
	end, {})
	local var14, var15 = reactModule.useMemo(function() --[[ line: 56 ]]
		-- upvalues: var13 (ref), signalsModule (copy)
		return signalsModule.createSignal(var13(false))
	end, {})
	local var16 = reactModule.useMemo(function() --[[ line: 62 ]]
		-- upvalues: signalsModule (copy), p1 (ref), var10 (ref), var11 (ref), GAME_CAROUSEL_SIDE_COMPACT_PADDING (copy), GAME_CAROUSEL_SIDE_WIDE_PADDING (copy), var13 (ref), var14 (ref), collectionLayoutCalculatorsModule (ref), var8 (ref)
		return signalsModule.createComputed(function(p4) --[[ line: 63 ]]
			-- upvalues: p1 (copy), var10 (copy), var11 (copy), GAME_CAROUSEL_SIDE_COMPACT_PADDING (copy), GAME_CAROUSEL_SIDE_WIDE_PADDING (copy), var13 (copy), var14 (copy), collectionLayoutCalculatorsModule (copy), var8 (copy)
			return p1 or (if var10 then collectionLayoutCalculatorsModule.calculateSideMargin(var14(p4), var8, var13(p4)) elseif var11(p4) then GAME_CAROUSEL_SIDE_COMPACT_PADDING else GAME_CAROUSEL_SIDE_WIDE_PADDING)
		end)
	end, {
		var13, var14, var11, p1, collectionLayoutCalculatorsModule, var8, var10
	})
	local var17 = reactModule.useMemo(function() --[[ line: 87 ]]
		-- upvalues: signalsModule (copy), var13 (ref), var14 (ref), collectionLayoutCalculatorsModule (ref), var8 (ref)
		return signalsModule.createComputed(function(p5) --[[ line: 88 ]]
			-- upvalues: var13 (copy), var14 (copy), collectionLayoutCalculatorsModule (copy), var8 (copy)
			return collectionLayoutCalculatorsModule.calculateColumnGap(var14(p5), var8, var13(p5))
		end)
	end, { var13, var14, collectionLayoutCalculatorsModule, var8 })
	local var18 = reactModule.useCallback(function(p6) --[[ line: 95 ]]
		-- upvalues: signalsModule (copy), var14 (ref), var16 (ref), var17 (ref), collectionLayoutCalculatorsModule (ref), var8 (ref)
		return signalsModule.createComputed(function(p7) --[[ line: 96 ]]
			-- upvalues: var14 (copy), var16 (copy), var17 (copy), collectionLayoutCalculatorsModule (copy), p6 (ref), var8 (copy)
			return collectionLayoutCalculatorsModule.calculateNumColumns(var14(p7), var16(p7), var17(p7), p6, var8)
		end)
	end, {
		var14,
		var16,
		var17,
		collectionLayoutCalculatorsModule,
		var8
	})
	local var19 = reactModule.useCallback(function(p8) --[[ line: 105 ]]
		-- upvalues: var15 (ref)
		var15(p8.X)
	end, { var15 })
	reactModule.useEffect(function() --[[ line: 113 ]]
		-- upvalues: p0 (ref), var19 (ref)
		local var21 = nil
		
		if p0 then
			var19(p0.AbsoluteSize)
			var21 = p0:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 117 ]]
				-- upvalues: var19 (copy), p0 (copy)
				var19(p0.AbsoluteSize)
			end)
		end
		return function() --[[ line: 121 ]]
			-- upvalues: var21 (write)
			if var21 then
				var21:Disconnect()
			end
		end
	end, { var19, p0 })
	
	return reactModule.useCallback(function(p9) --[[ line: 129 ]]
		-- upvalues: signalsModule (copy), var18 (ref), var17 (ref), var16 (ref), collectionLayoutCalculatorsModule (ref), var9 (ref), var8 (ref)
		return signalsModule.createComputed(function(p10) --[[ line: 130 ]]
			-- upvalues: var18 (copy), p9 (ref), var17 (copy), var16 (copy), collectionLayoutCalculatorsModule (copy), var9 (copy), var8 (copy)
			return {
				numColumns = var18(p9)(p10),
				fractionalItemAmount = collectionLayoutCalculatorsModule.calculateFractionalItemAmount(p9, var9),
				columnGap = var17(p10),
				sideMargin = var16(p10),
				verticalPadding = collectionLayoutCalculatorsModule.calculateVerticalPadding(var8, p9),
				maxTilesToShow = collectionLayoutCalculatorsModule.calculateMaxTilesToShow(var9)
			}
		end)
	end, {
		var18, var17, var16, var9, var8, collectionLayoutCalculatorsModule
	})
end