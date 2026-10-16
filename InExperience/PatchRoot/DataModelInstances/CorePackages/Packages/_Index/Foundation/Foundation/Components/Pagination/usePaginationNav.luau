local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Components.Types)
local PaginationDirectionModule = require(Foundation.Enums.PaginationDirection)
local _ = require(Foundation.Enums.PaginationSize)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local NavPaginationLayoutModule = require(script.Parent.Nav.NavPaginationLayout)
local PaginationSlotsUtilsModule = require(script.Parent.paginationSlotsUtils)
local UsePaginationSelectionChainModule = require(script.Parent.usePaginationSelectionChain)

local function useNavCallbacks(Gui, p1) --[[ Line: 60 ]]
	-- upvalues: ReactModule (copy), PaginationDirectionModule (copy)
	return {
		onDirectionActivated = ReactModule.useCallback(function(Backward) --[[ Line: 64 ]]
			-- upvalues: PaginationDirectionModule (upval), Gui (copy)
			if Backward == PaginationDirectionModule.First then
				Gui.onActivated(1)
				
				return
			end
			if Backward == PaginationDirectionModule.Last then
				if Gui.count ~= nil then
					Gui.onActivated(Gui.count)
					
					return
				end
			elseif Backward == PaginationDirectionModule.Backward then
				Gui.onActivated(Gui.page - 1)
				
				return
			else
				Gui.onActivated(Gui.page + 1)
			end
		end, { Gui.count, Gui.onActivated, Gui.page }),
		isFirstDisabled = p1.isFirstDisabled or p1.isBackDisabled
	}
end

local function _(p1, p2, Ref) --[[ Line: 85 | Named "mergeNavPaginationLayoutProps" ]]
	-- upvalues: WithCommonPropsModule (copy)
	local WithCommonPropsModuleResult = WithCommonPropsModule(p1, p2)
	WithCommonPropsModuleResult.ref = Ref
	
	return WithCommonPropsModuleResult
end

return function(Gui, p1, p2) --[[ Line: 95 | Named "usePaginationNav" ]]
	-- upvalues: ReactModule (copy), PaginationSlotsUtilsModule (copy), UsePaginationSelectionChainModule (copy), useNavCallbacks (copy), NavPaginationLayoutModule (copy), WithCommonPropsModule (copy)
	local DisabledState = p1.disabledState
	local UsePaginationSelectionChainModuleResult = UsePaginationSelectionChainModule(ReactModule.useMemo(function() --[[ Line: 103 ]]
		-- upvalues: PaginationSlotsUtilsModule (upval), p1 (copy), DisabledState (copy)
		return PaginationSlotsUtilsModule.getPaginationSelectableSlotOrder({
			hasFirstLastButtons = p1.hasFirstLastButtons,
			isFirstDisabled = DisabledState.isFirstDisabled,
			isBackDisabled = DisabledState.isBackDisabled,
			isForwardDisabled = DisabledState.isForwardDisabled,
			isLastDisabled = DisabledState.isLastDisabled,
			pageSlots = p1.pageSlots,
			currentPage = p1.currentPage
		})
	end, {
		p1.hasFirstLastButtons, p1.currentPage, p1.pageSlots,
		DisabledState.isBackDisabled, DisabledState.isFirstDisabled,
		DisabledState.isForwardDisabled, DisabledState.isLastDisabled
	}), {
		NextSelectionUp = Gui.NextSelectionUp,
		NextSelectionDown = Gui.NextSelectionDown
	}, p2)
	local UseNavCallbacksResult = useNavCallbacks(Gui, {
		isBackDisabled = DisabledState.isBackDisabled,
		isFirstDisabled = DisabledState.isFirstDisabled
	})
	
	return {
		selection = UsePaginationSelectionChainModuleResult,
		createLayout = ReactModule.useCallback(function(PageContent, Ref) --[[ Line: 136 ]]
			-- upvalues: ReactModule (upval), NavPaginationLayoutModule (upval), Gui (copy), DisabledState (copy), UseNavCallbacksResult (copy), UsePaginationSelectionChainModuleResult (copy), p1 (copy), WithCommonPropsModule (upval)
			local CreateElementFunction = ReactModule.createElement
			local WithCommonPropsModuleResult = WithCommonPropsModule(Gui, {
				pageContent = PageContent,
				size = Gui.size,
				isBackDisabled = DisabledState.isBackDisabled,
				isFirstDisabled = UseNavCallbacksResult.isFirstDisabled,
				isForwardDisabled = DisabledState.isForwardDisabled,
				isLastDisabled = DisabledState.isLastDisabled,
				onDirectionActivated = UseNavCallbacksResult.onDirectionActivated,
				selection = UsePaginationSelectionChainModuleResult,
				hasFirstLastButtons = p1.hasFirstLastButtons,
				testId = Gui.testId
			})
			WithCommonPropsModuleResult.ref = Ref
			
			return CreateElementFunction(NavPaginationLayoutModule, WithCommonPropsModuleResult)
		end, {
			p1.hasFirstLastButtons, DisabledState.isBackDisabled,
			DisabledState.isForwardDisabled, DisabledState.isLastDisabled,
			UseNavCallbacksResult.isFirstDisabled,
			UseNavCallbacksResult.onDirectionActivated, Gui,
			UsePaginationSelectionChainModuleResult
		})
	}
end