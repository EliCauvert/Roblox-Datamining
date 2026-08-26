local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Components.Types)
local paginationDirectionModule = require(foundation.Enums.PaginationDirection)
local _ = require(foundation.Enums.PaginationSize)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local navPaginationLayoutModule = require(script.Parent.Nav.NavPaginationLayout)
local paginationSlotsUtilsModule = require(script.Parent.paginationSlotsUtils)
local usePaginationSelectionChainModule = require(script.Parent.usePaginationSelectionChain)

local function useNavCallbacks(p1, p2)
	-- upvalues: reactModule (ref), paginationDirectionModule (ref)
	return {
		onDirectionActivated = reactModule.useCallback(function(p3)
			-- upvalues: paginationDirectionModule (copy), p1 (ref)
			if p3 == paginationDirectionModule.First then
				p1.onActivated(1)
				
				return
			elseif p3 == paginationDirectionModule.Last then
				if p1.count == nil then
					return
				else
					p1.onActivated(p1.count)
					
					return
				end
			elseif p3 == paginationDirectionModule.Backward then
				p1.onActivated(p1.page - 1)
				
				return
			end
			p1.onActivated(p1.page + 1)
		end, { p1.count, p1.onActivated, p1.page }),
		isFirstDisabled = p2.isFirstDisabled or p2.isBackDisabled
	}
end

local function _(p1, p2, p3)
	-- upvalues: withCommonPropsModule (ref)
	local var1 = withCommonPropsModule(p1, p2)
	var1.ref = p3
	
	return var1
end

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), paginationSlotsUtilsModule (ref), usePaginationSelectionChainModule (ref), useNavCallbacks (ref), navPaginationLayoutModule (ref), withCommonPropsModule (ref)
	local disabledState = p2.disabledState
	local var1 = usePaginationSelectionChainModule(reactModule.useMemo(function()
		-- upvalues: paginationSlotsUtilsModule (copy), p2 (ref), disabledState (ref)
		return paginationSlotsUtilsModule.getPaginationSelectableSlotOrder({
			hasFirstLastButtons = p2.hasFirstLastButtons,
			isFirstDisabled = disabledState.isFirstDisabled,
			isBackDisabled = disabledState.isBackDisabled,
			isForwardDisabled = disabledState.isForwardDisabled,
			isLastDisabled = disabledState.isLastDisabled,
			pageSlots = p2.pageSlots,
			currentPage = p2.currentPage
		})
	end, {
		p2.hasFirstLastButtons, p2.currentPage, p2.pageSlots,
		disabledState.isBackDisabled, disabledState.isFirstDisabled,
		disabledState.isForwardDisabled, disabledState.isLastDisabled
	}), {
		NextSelectionUp = p1.NextSelectionUp,
		NextSelectionDown = p1.NextSelectionDown
	}, p3)
	local var2 = useNavCallbacks(p1, {
		isBackDisabled = disabledState.isBackDisabled,
		isFirstDisabled = disabledState.isFirstDisabled
	})
	
	return {
		selection = var1,
		createLayout = reactModule.useCallback(function(p4, p5)
			-- upvalues: reactModule (copy), navPaginationLayoutModule (copy), p1 (ref), disabledState (ref), var2 (ref), var1 (ref), p2 (ref), withCommonPropsModule (copy)
			local createElement = reactModule.createElement
			local var3 = withCommonPropsModule(p1, {
				pageContent = p4,
				size = p1.size,
				isBackDisabled = disabledState.isBackDisabled,
				isFirstDisabled = var2.isFirstDisabled,
				isForwardDisabled = disabledState.isForwardDisabled,
				isLastDisabled = disabledState.isLastDisabled,
				onDirectionActivated = var2.onDirectionActivated,
				selection = var1,
				hasFirstLastButtons = p2.hasFirstLastButtons,
				testId = p1.testId
			})
			var3.ref = p5
			
			return createElement(navPaginationLayoutModule, var3)
		end, {
			p2.hasFirstLastButtons, disabledState.isBackDisabled,
			disabledState.isForwardDisabled, disabledState.isLastDisabled,
			var2.isFirstDisabled, var2.onDirectionActivated, p1, var1
		})
	}
end