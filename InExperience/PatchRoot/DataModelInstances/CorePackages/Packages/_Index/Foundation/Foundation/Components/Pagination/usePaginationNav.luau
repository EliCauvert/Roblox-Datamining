local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Components.Types)
local paginationDirectionModule = require(foundation.Enums.PaginationDirection)
local _ = require(foundation.Enums.PaginationSize)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local navPaginationLayoutModule = require(script.Parent.Nav.NavPaginationLayout)
local paginationSlotsUtilsModule = require(script.Parent.paginationSlotsUtils)
local usePaginationSelectionChainModule = require(script.Parent.usePaginationSelectionChain)

local function useNavCallbacks(p0, p1) --[[ line: 60 ]]
	-- upvalues: reactModule (ref), paginationDirectionModule (ref)
	return {
		onDirectionActivated = reactModule.useCallback(function(p2) --[[ line: 64 ]]
			-- upvalues: paginationDirectionModule (copy), p0 (ref)
			if p2 == paginationDirectionModule.First then
				p0.onActivated(1)
				
				return
			elseif p2 == paginationDirectionModule.Last then
				if p0.count == nil then
					return
				else
					p0.onActivated(p0.count)
					
					return
				end
			elseif p2 == paginationDirectionModule.Backward then
				p0.onActivated(p0.page - 1)
				
				return
			end
			p0.onActivated(p0.page + 1)
		end, { p0.count, p0.onActivated, p0.page }),
		isFirstDisabled = p1.isFirstDisabled or p1.isBackDisabled
	}
end

local function _(p3, p4, p5) --[[ line: 85 | named "mergeNavPaginationLayoutProps" ]]
	-- upvalues: withCommonPropsModule (ref)
	local var8 = withCommonPropsModule(p3, p4)
	var8.ref = p5
	
	return var8
end

return function(p6, p7, p8) --[[ line: 95 | named "usePaginationNav" ]]
	-- upvalues: reactModule (ref), paginationSlotsUtilsModule (ref), usePaginationSelectionChainModule (ref), useNavCallbacks (ref), navPaginationLayoutModule (ref), withCommonPropsModule (ref)
	local disabledState = p7.disabledState
	local var9 = usePaginationSelectionChainModule(reactModule.useMemo(function() --[[ line: 103 ]]
		-- upvalues: paginationSlotsUtilsModule (copy), p7 (ref), disabledState (ref)
		return paginationSlotsUtilsModule.getPaginationSelectableSlotOrder({
			hasFirstLastButtons = p7.hasFirstLastButtons,
			isFirstDisabled = disabledState.isFirstDisabled,
			isBackDisabled = disabledState.isBackDisabled,
			isForwardDisabled = disabledState.isForwardDisabled,
			isLastDisabled = disabledState.isLastDisabled,
			pageSlots = p7.pageSlots,
			currentPage = p7.currentPage
		})
	end, {
		p7.hasFirstLastButtons, p7.currentPage, p7.pageSlots,
		disabledState.isBackDisabled, disabledState.isFirstDisabled,
		disabledState.isForwardDisabled, disabledState.isLastDisabled
	}), {
		NextSelectionUp = p6.NextSelectionUp,
		NextSelectionDown = p6.NextSelectionDown
	}, p8)
	local var10 = useNavCallbacks(p6, {
		isBackDisabled = disabledState.isBackDisabled,
		isFirstDisabled = disabledState.isFirstDisabled
	})
	
	return {
		selection = var9,
		createLayout = reactModule.useCallback(function(p9, p10) --[[ line: 136 ]]
			-- upvalues: reactModule (copy), navPaginationLayoutModule (copy), p6 (ref), disabledState (ref), var10 (ref), var9 (ref), p7 (ref), withCommonPropsModule (copy)
			local createElement = reactModule.createElement
			local var11 = withCommonPropsModule(p6, {
				pageContent = p9,
				size = p6.size,
				isBackDisabled = disabledState.isBackDisabled,
				isFirstDisabled = var10.isFirstDisabled,
				isForwardDisabled = disabledState.isForwardDisabled,
				isLastDisabled = disabledState.isLastDisabled,
				onDirectionActivated = var10.onDirectionActivated,
				selection = var9,
				hasFirstLastButtons = p7.hasFirstLastButtons,
				testId = p6.testId
			})
			var11.ref = p10
			
			return createElement(navPaginationLayoutModule, var11)
		end, {
			p7.hasFirstLastButtons, disabledState.isBackDisabled,
			disabledState.isForwardDisabled, disabledState.isLastDisabled,
			var10.isFirstDisabled, var10.onDirectionActivated, p6, var9
		})
	}
end