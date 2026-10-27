local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local AutoScrollModule = require(script.Parent.AutoScroll)
local AutoScrollPolicyModule = require(ViewRecycler.Core.Enums.AutoScrollPolicy)
local PaginationEdgesModule = require(script.Parent.PaginationEdges)
local _ = require(ViewRecycler.Core.Enums.ScrollAlignment)
local _ = require(ViewRecycler.Core.Types)
local InitialScrollPositionModule = require(script.Parent.InitialScrollPosition)

return function(p1)
	-- upvalues: InitialScrollPositionModule (copy), AutoScrollModule (copy), PaginationEdgesModule (copy), AutoScrollPolicyModule (copy)
	local InitialScrollPositionModuleResult = InitialScrollPositionModule()
	local NewAutoScroll = AutoScrollModule.create()
	local NewPaginationEdges = PaginationEdgesModule.create()
	
	local function _(p2)
		-- upvalues: p1 (copy)
		p1.applyScrollAnchorOffset(p2)
	end
	
	local _ = function()
		-- upvalues: p1 (copy), NewAutoScroll (copy), AutoScrollPolicyModule (upval)
		NewAutoScroll.onScrollOffsetChanged(p1.getScrollState().atEnd, p1.getAutoScrollPolicy() == AutoScrollPolicyModule.WhenAtEnd)
	end
	
	local function checkEdges(RearmAfterStructureChange)
		-- upvalues: p1 (copy), NewPaginationEdges (copy)
		local OnStartReached: () -> () = p1.getOnStartReached()
		local OnEndReached: () -> () = p1.getOnEndReached()
		
		if OnStartReached == nil and OnEndReached == nil then return end
		local ViewportState = p1.getViewportState()
		
		if ViewportState == nil then return end
		local ScrollState = p1.getScrollState()
		
		if p1.getItemCount() > 0 and ScrollState.contentLength == 0 then return end
		local CheckResult = NewPaginationEdges.check({
			scrollOffset = ViewportState.scrollOffset,
			viewportLength = ViewportState.viewportLength,
			contentLength = ScrollState.contentLength,
			startThreshold = p1.getStartReachedThreshold() or 0,
			atEnd = ScrollState.atEnd,
			canReachStart = OnStartReached ~= nil,
			canReachEnd = OnEndReached ~= nil,
			rearmAfterStructureChange = RearmAfterStructureChange
		})
		
		if CheckResult.startReached then
			OnStartReached()
		end
		if CheckResult.endReached then
			OnEndReached()
		end
	end
	
	return {
		checkEdges = checkEdges,
		onContentLengthChanged = function(p2)
			-- upvalues: p1 (copy), NewAutoScroll (copy)
			local ViewportState = p1.getViewportState()
			
			if ViewportState ~= nil then
				local ContentLengthCorrection = NewAutoScroll.getContentLengthCorrection(p2, ViewportState.viewportLength)
				
				if ContentLengthCorrection ~= nil then
					p1.applyScrollAnchorOffset(ContentLengthCorrection)
				end
			end
			if p1.onContentLengthChanged ~= nil then
				p1.onContentLengthChanged(p2)
			end
		end,
		onDataSourceChanged = function(ResolveTargetResult, p2)
			-- upvalues: InitialScrollPositionModuleResult (copy), p1 (copy), NewAutoScroll (copy), AutoScrollModule (upval), checkEdges (copy), PaginationEdgesModule (upval)
			local OnDataSourceChangeResult = InitialScrollPositionModuleResult.onDataSourceChange(p1.getItemCount(), p1.getInitialScrollAlignment(), p1.getScrollOffsetForItem)
			
			if OnDataSourceChangeResult ~= nil then
				p1.applyScrollAnchorOffset(OnDataSourceChangeResult)
			end
			local OnDataSourceChangedResult = NewAutoScroll.onDataSourceChanged(AutoScrollModule.resolveTarget(p1.getAutoScrollPolicy(), ResolveTargetResult, p2))
			
			if OnDataSourceChangedResult ~= false then
				local ViewportState = p1.getViewportState()
				
				if ViewportState ~= nil then
					p1.applyScrollAnchorOffset((AutoScrollModule.getTargetOffset(OnDataSourceChangedResult, p1.getScrollState().contentLength, ViewportState.viewportLength)))
				end
			end
			checkEdges(PaginationEdgesModule.hasStructuralChange(ResolveTargetResult))
		end,
		onDataSourceReplaced = function()
			-- upvalues: InitialScrollPositionModuleResult (copy), p1 (copy), NewAutoScroll (copy), AutoScrollPolicyModule (upval)
			p1.applyScrollAnchorOffset((InitialScrollPositionModuleResult.onDataSourceReplaced(p1.getItemCount(), p1.getInitialScrollAlignment(), p1.getScrollOffsetForItem)))
			NewAutoScroll.onScrollOffsetChanged(p1.getScrollState().atEnd, p1.getAutoScrollPolicy() == AutoScrollPolicyModule.WhenAtEnd)
		end,
		onViewportChanged = function()
			-- upvalues: p1 (copy), InitialScrollPositionModuleResult (copy), NewAutoScroll (copy), AutoScrollPolicyModule (upval)
			local ItemCount = p1.getItemCount()
			
			if ItemCount == 0 or p1.getScrollState().contentLength > 0 then
				local OnViewportChangedResult = InitialScrollPositionModuleResult.onViewportChanged(ItemCount, p1.getInitialScrollAlignment(), p1.getScrollOffsetForItem)
				
				if OnViewportChangedResult ~= nil then
					p1.applyScrollAnchorOffset(OnViewportChangedResult)
				end
			end
			NewAutoScroll.onScrollOffsetChanged(p1.getScrollState().atEnd, p1.getAutoScrollPolicy() == AutoScrollPolicyModule.WhenAtEnd)
		end,
		onScrollOffsetChanged = function()
			-- upvalues: p1 (copy), NewAutoScroll (copy), AutoScrollPolicyModule (upval)
			NewAutoScroll.onScrollOffsetChanged(p1.getScrollState().atEnd, p1.getAutoScrollPolicy() == AutoScrollPolicyModule.WhenAtEnd)
		end
	}
end