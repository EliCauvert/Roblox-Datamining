local CollectionViews = script:FindFirstAncestor("CollectionViews")
local Parent = CollectionViews.Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local ResponsiveModule = require(Parent.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local UseBreakpointXOrSmallerFunction = ResponsiveModule.useBreakpointXOrSmaller
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local SignalsModule = require(Parent.Signals)
local DisplayModule = require(Parent.Display)
local DiscoveryTypesModule = require(Parent.DiscoveryTypes)
local LuaAppFixComputedSideMarginResponsiveBreakpoint = game:DefineFastFlag("LuaAppFixComputedSideMarginResponsiveBreakpoint", false)
local CollectionLayoutCalculatorsModule = require(CollectionViews.CollectionLayoutCalculators)
local _ = require(CollectionViews.CollectionViewTypes)
local GAMECAROUSELSIDECOMPACTPADDING = DiscoveryTypesModule.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING
local GAMECAROUSELSIDEWIDEPADDING = DiscoveryTypesModule.Constants.GAME_CAROUSEL_SIDE_WIDE_PADDING

return function(Frame: Frame, p1) --[[ Line: 28 | Named "useCollectionLayoutParamsComputed" ]]
	-- upvalues: CollectionLayoutCalculatorsModule (copy), UseTokensFunction (copy), UsePreferredInputFunction (copy), UseAppPolicyFunction (copy), ReactModule (copy), SignalsModule (copy), UseBreakpointXOrSmallerFunction (copy), LuaAppFixComputedSideMarginResponsiveBreakpoint (copy), ResponsiveModule (copy), DisplayModule (copy), GAMECAROUSELSIDECOMPACTPADDING (copy), GAMECAROUSELSIDEWIDEPADDING (copy)
	local UseTokensResult = UseTokensFunction()
	local UsePreferredInputResult = UsePreferredInputFunction()
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2) --[[ Line: 35 ]]
		return p2.useGridPageLayout()
	end)
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 39 ]]
		-- upvalues: SignalsModule (upval)
		return SignalsModule.createSignal(false)
	end, {})
	UseMemoResult2((UseBreakpointXOrSmallerFunction(if LuaAppFixComputedSideMarginResponsiveBreakpoint then ResponsiveModule.Keys.Small else ResponsiveModule.Keys.Medium)))
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 47 ]]
		-- upvalues: SignalsModule (upval), DisplayModule (upval)
		return SignalsModule.createComputed(function(p2) --[[ Line: 48 ]]
			-- upvalues: DisplayModule (upval)
			local ViewportSize = DisplayModule.GetDisplayStore(p2).getViewportSize(p2)
			
			return ViewportSize and ViewportSize.X or 0
		end)
	end, {})
	local UseMemoResult3, UseMemoResult2_1 = ReactModule.useMemo(function() --[[ Line: 56 ]]
		-- upvalues: UseMemoResult1 (copy), SignalsModule (upval)
		return SignalsModule.createSignal((UseMemoResult1(false)))
	end, {})
	local UseMemoResult4 = ReactModule.useMemo(function() --[[ Line: 62 ]]
		-- upvalues: SignalsModule (upval), p1 (copy), UseAppPolicyResult (copy), UseMemoResult (copy), GAMECAROUSELSIDECOMPACTPADDING (upval), GAMECAROUSELSIDEWIDEPADDING (upval), UseMemoResult1 (copy), UseMemoResult3 (copy), CollectionLayoutCalculatorsModule (copy), UseTokensResult (copy)
		return SignalsModule.createComputed(function(p2) --[[ Line: 63 ]]
			-- upvalues: p1 (upval), UseAppPolicyResult (upval), UseMemoResult (upval), GAMECAROUSELSIDECOMPACTPADDING (upval), GAMECAROUSELSIDEWIDEPADDING (upval), UseMemoResult1 (upval), UseMemoResult3 (upval), CollectionLayoutCalculatorsModule (upval), UseTokensResult (upval)
			return if p1 then p1 elseif UseAppPolicyResult then CollectionLayoutCalculatorsModule.calculateSideMargin(UseMemoResult3(p2), UseTokensResult, (UseMemoResult1(p2))) elseif UseMemoResult(p2) then GAMECAROUSELSIDECOMPACTPADDING else GAMECAROUSELSIDEWIDEPADDING
		end)
	end, {
		UseMemoResult1, UseMemoResult3, UseMemoResult, p1,
		CollectionLayoutCalculatorsModule, UseTokensResult, UseAppPolicyResult
	})
	local UseMemoResult5 = ReactModule.useMemo(function() --[[ Line: 87 ]]
		-- upvalues: SignalsModule (upval), UseMemoResult1 (copy), UseMemoResult3 (copy), CollectionLayoutCalculatorsModule (copy), UseTokensResult (copy)
		return SignalsModule.createComputed(function(p2) --[[ Line: 88 ]]
			-- upvalues: UseMemoResult1 (upval), UseMemoResult3 (upval), CollectionLayoutCalculatorsModule (upval), UseTokensResult (upval)
			return CollectionLayoutCalculatorsModule.calculateColumnGap(UseMemoResult3(p2), UseTokensResult, (UseMemoResult1(p2)))
		end)
	end, {
		UseMemoResult1,
		UseMemoResult3,
		CollectionLayoutCalculatorsModule,
		UseTokensResult
	})
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 95 ]]
		-- upvalues: SignalsModule (upval), UseMemoResult3 (copy), UseMemoResult4 (copy), UseMemoResult5 (copy), CollectionLayoutCalculatorsModule (copy), UseTokensResult (copy)
		return SignalsModule.createComputed(function(p3) --[[ Line: 96 ]]
			-- upvalues: UseMemoResult3 (upval), UseMemoResult4 (upval), UseMemoResult5 (upval), CollectionLayoutCalculatorsModule (upval), p2 (copy), UseTokensResult (upval)
			return CollectionLayoutCalculatorsModule.calculateNumColumns(UseMemoResult3(p3), UseMemoResult4(p3), UseMemoResult5(p3), p2, UseTokensResult)
		end)
	end, {
		UseMemoResult3,
		UseMemoResult4,
		UseMemoResult5,
		CollectionLayoutCalculatorsModule,
		UseTokensResult
	})
	local UseResult1 = ReactModule.useCallback(function(p2) --[[ Line: 105 ]]
		-- upvalues: UseMemoResult2_1 (copy)
		UseMemoResult2_1(p2.X)
	end, { UseMemoResult2_1 })
	ReactModule.useEffect(function() --[[ Line: 113 ]]
		-- upvalues: Frame (copy), UseResult1 (copy)
		local Connection = nil
		
		if Frame then
			UseResult1(Frame.AbsoluteSize)
			Connection = Frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 117 ]]
				-- upvalues: UseResult1 (upval), Frame (upval)
				UseResult1(Frame.AbsoluteSize)
			end)
		end
		return function() --[[ Line: 121 ]]
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
			end
		end
	end, { UseResult1, Frame })
	
	return (ReactModule.useCallback(function(p2) --[[ Line: 129 ]]
		-- upvalues: SignalsModule (upval), UseResult (copy), UseMemoResult5 (copy), UseMemoResult4 (copy), CollectionLayoutCalculatorsModule (copy), UsePreferredInputResult (copy), UseTokensResult (copy)
		return SignalsModule.createComputed(function(p3) --[[ Line: 130 ]]
			-- upvalues: UseResult (upval), p2 (copy), UseMemoResult5 (upval), UseMemoResult4 (upval), CollectionLayoutCalculatorsModule (upval), UsePreferredInputResult (upval), UseTokensResult (upval)
			return {
				numColumns = UseResult(p2)(p3),
				fractionalItemAmount = CollectionLayoutCalculatorsModule.calculateFractionalItemAmount(p2, UsePreferredInputResult),
				columnGap = UseMemoResult5(p3),
				sideMargin = UseMemoResult4(p3),
				verticalPadding = CollectionLayoutCalculatorsModule.calculateVerticalPadding(UseTokensResult, p2),
				maxTilesToShow = CollectionLayoutCalculatorsModule.calculateMaxTilesToShow(UsePreferredInputResult)
			}
		end)
	end, {
		UseResult, UseMemoResult5, UseMemoResult4, UsePreferredInputResult,
		UseTokensResult, CollectionLayoutCalculatorsModule
	}))
end