local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local autoScrollModule = require(script.Parent.AutoScroll)
local autoScrollPolicyModule = require(viewRecycler.Core.Enums.AutoScrollPolicy)
local paginationEdgesModule = require(script.Parent.PaginationEdges)
local _ = require(viewRecycler.Core.Enums.ScrollAlignment)
local _ = require(viewRecycler.Core.Types)
local initialScrollPositionModule = require(script.Parent.InitialScrollPosition)

return function(p1)
	-- upvalues: initialScrollPositionModule (ref), autoScrollModule (ref), paginationEdgesModule (ref), autoScrollPolicyModule (ref)
	local var1 = initialScrollPositionModule()
	local var2 = autoScrollModule.create()
	local var3 = paginationEdgesModule.create()
	
	local function _(p2)
		-- upvalues: p1 (ref)
		p1.applyScrollAnchorOffset(p2)
	end
	
	local _ = function()
		-- upvalues: p1 (ref), var2 (ref), autoScrollPolicyModule (copy)
		var2.onScrollOffsetChanged(p1.getScrollState().atEnd, p1.getAutoScrollPolicy() == autoScrollPolicyModule.WhenAtEnd)
	end
	
	local function checkEdges(p2)
		-- upvalues: p1 (ref), var3 (ref)
		local onStartReached = p1.getOnStartReached()
		local onEndReached = p1.getOnEndReached()
		
		if onStartReached == nil and onEndReached == nil then return end
		local viewportState = p1.getViewportState()
		
		if viewportState == nil then return end
		local scrollState = p1.getScrollState()
		
		if p1.getItemCount() > 0 and scrollState.contentLength == 0 then return end
		local var4 = var3.check({
			scrollOffset = viewportState.scrollOffset,
			viewportLength = viewportState.viewportLength,
			contentLength = scrollState.contentLength,
			startThreshold = p1.getStartReachedThreshold() or 0,
			atEnd = scrollState.atEnd,
			canReachStart = onStartReached ~= nil,
			canReachEnd = onEndReached ~= nil,
			rearmAfterStructureChange = p2
		})
		
		if var4.startReached then
			onStartReached()
		end
		if var4.endReached then
			onEndReached()
		end
	end
	
	return {
		checkEdges = checkEdges,
		onContentLengthChanged = function(p2)
			-- upvalues: p1 (ref), var2 (ref)
			local viewportState = p1.getViewportState()
			
			if viewportState ~= nil then
				local contentLengthCorrection = var2.getContentLengthCorrection(p2, viewportState.viewportLength)
				
				if contentLengthCorrection ~= nil then
					p1.applyScrollAnchorOffset(contentLengthCorrection)
				end
			end
			if p1.onContentLengthChanged ~= nil then
				p1.onContentLengthChanged(p2)
			end
		end,
		onDataSourceChanged = function(p2, p3)
			-- upvalues: var1 (ref), p1 (ref), var2 (ref), autoScrollModule (copy), checkEdges (ref), paginationEdgesModule (copy)
			local var4 = var1.onDataSourceChange(p1.getItemCount(), p1.getInitialScrollAlignment(), p1.getScrollOffsetForItem)
			
			if var4 ~= nil then
				p1.applyScrollAnchorOffset(var4)
			end
			local var5 = var2.onDataSourceChanged(autoScrollModule.resolveTarget(p1.getAutoScrollPolicy(), p2, p3))
			
			if var5 ~= false then
				local viewportState = p1.getViewportState()
				
				if viewportState ~= nil then
					p1.applyScrollAnchorOffset(autoScrollModule.getTargetOffset(var5, p1.getScrollState().contentLength, viewportState.viewportLength))
				end
			end
			checkEdges(paginationEdgesModule.hasStructuralChange(p2))
		end,
		onDataSourceReplaced = function()
			-- upvalues: var1 (ref), p1 (ref), var2 (ref), autoScrollPolicyModule (copy)
			p1.applyScrollAnchorOffset(var1.onDataSourceReplaced(p1.getItemCount(), p1.getInitialScrollAlignment(), p1.getScrollOffsetForItem))
			var2.onScrollOffsetChanged(p1.getScrollState().atEnd, p1.getAutoScrollPolicy() == autoScrollPolicyModule.WhenAtEnd)
		end,
		onViewportChanged = function()
			-- upvalues: p1 (ref), var1 (ref), var2 (ref), autoScrollPolicyModule (copy)
			local itemCount = p1.getItemCount()
			
			if itemCount == 0 or p1.getScrollState().contentLength > 0 then
				local var4 = var1.onViewportChanged(itemCount, p1.getInitialScrollAlignment(), p1.getScrollOffsetForItem)
				
				if var4 ~= nil then
					p1.applyScrollAnchorOffset(var4)
				end
			end
			var2.onScrollOffsetChanged(p1.getScrollState().atEnd, p1.getAutoScrollPolicy() == autoScrollPolicyModule.WhenAtEnd)
		end,
		onScrollOffsetChanged = function()
			-- upvalues: p1 (ref), var2 (ref), autoScrollPolicyModule (copy)
			var2.onScrollOffsetChanged(p1.getScrollState().atEnd, p1.getAutoScrollPolicy() == autoScrollPolicyModule.WhenAtEnd)
		end
	}
end