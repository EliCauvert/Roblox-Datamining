local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local autoScrollModule = require(script.Parent.AutoScroll)
local autoScrollPolicyModule = require(viewRecycler.Core.Enums.AutoScrollPolicy)
local paginationEdgesModule = require(script.Parent.PaginationEdges)
local _ = require(viewRecycler.Core.Enums.ScrollAlignment)
local _ = require(viewRecycler.Core.Types)
local initialScrollPositionModule = require(script.Parent.InitialScrollPosition)

return function(p0) --[[ line: 38 | named "createScrollPolicyCoordinator" ]]
	-- upvalues: initialScrollPositionModule (ref), autoScrollModule (ref), paginationEdgesModule (ref), autoScrollPolicyModule (ref)
	local var5 = initialScrollPositionModule()
	local var6 = autoScrollModule.create()
	local var7 = paginationEdgesModule.create()
	
	local function _(p1) --[[ line: 43 | named "applyScrollAnchor" ]]
		-- upvalues: p0 (ref)
		p0.applyScrollAnchorOffset(p1)
	end
	
	local _ = function() --[[ line: 47 | named "updateAutoScrollFromCurrentOffset" ]]
		-- upvalues: p0 (ref), var6 (ref), autoScrollPolicyModule (copy)
		var6.onScrollOffsetChanged(p0.getScrollState().atEnd, p0.getAutoScrollPolicy() == autoScrollPolicyModule.WhenAtEnd)
	end
	
	local function checkEdges(p2) --[[ line: 52 ]]
		-- upvalues: p0 (ref), var7 (ref)
		local onStartReached = p0.getOnStartReached()
		local onEndReached = p0.getOnEndReached()
		
		if onStartReached == nil and onEndReached == nil then return end
		local viewportState = p0.getViewportState()
		
		if viewportState == nil then return end
		local scrollState = p0.getScrollState()
		
		if p0.getItemCount() > 0 and scrollState.contentLength == 0 then return end
		local var13 = var7.check({
			scrollOffset = viewportState.scrollOffset,
			viewportLength = viewportState.viewportLength,
			contentLength = scrollState.contentLength,
			startThreshold = p0.getStartReachedThreshold() or 0,
			atEnd = scrollState.atEnd,
			canReachStart = onStartReached ~= nil,
			canReachEnd = onEndReached ~= nil,
			rearmAfterStructureChange = p2
		})
		
		if var13.startReached then
			onStartReached()
		end
		if var13.endReached then
			onEndReached()
		end
	end
	
	return {
		checkEdges = checkEdges,
		onContentLengthChanged = function(p3) --[[ line: 84 ]]
			-- upvalues: p0 (ref), var6 (ref)
			local viewportState = p0.getViewportState()
			
			if viewportState ~= nil then
				local contentLengthCorrection = var6.getContentLengthCorrection(p3, viewportState.viewportLength)
				
				if contentLengthCorrection ~= nil then
					p0.applyScrollAnchorOffset(contentLengthCorrection)
				end
			end
			if p0.onContentLengthChanged ~= nil then
				p0.onContentLengthChanged(p3)
			end
		end,
		onDataSourceChanged = function(p4, p5) --[[ line: 97 ]]
			-- upvalues: var5 (ref), p0 (ref), var6 (ref), autoScrollModule (copy), checkEdges (ref), paginationEdgesModule (copy)
			local var16 = var5.onDataSourceChange(p0.getItemCount(), p0.getInitialScrollAlignment(), p0.getScrollOffsetForItem)
			
			if var16 ~= nil then
				p0.applyScrollAnchorOffset(var16)
			end
			local var17 = var6.onDataSourceChanged(autoScrollModule.resolveTarget(p0.getAutoScrollPolicy(), p4, p5))
			
			if var17 ~= false then
				local viewportState = p0.getViewportState()
				
				if viewportState ~= nil then
					p0.applyScrollAnchorOffset(autoScrollModule.getTargetOffset(var17, p0.getScrollState().contentLength, viewportState.viewportLength))
				end
			end
			checkEdges(paginationEdgesModule.hasStructuralChange(p4))
		end,
		onDataSourceReplaced = function() --[[ line: 123 ]]
			-- upvalues: var5 (ref), p0 (ref), var6 (ref), autoScrollPolicyModule (copy)
			p0.applyScrollAnchorOffset(var5.onDataSourceReplaced(p0.getItemCount(), p0.getInitialScrollAlignment(), p0.getScrollOffsetForItem))
			var6.onScrollOffsetChanged(p0.getScrollState().atEnd, p0.getAutoScrollPolicy() == autoScrollPolicyModule.WhenAtEnd)
		end,
		onViewportChanged = function() --[[ line: 134 ]]
			-- upvalues: p0 (ref), var5 (ref), var6 (ref), autoScrollPolicyModule (copy)
			local itemCount = p0.getItemCount()
			
			if itemCount == 0 or p0.getScrollState().contentLength > 0 then
				local var20 = var5.onViewportChanged(itemCount, p0.getInitialScrollAlignment(), p0.getScrollOffsetForItem)
				
				if var20 ~= nil then
					p0.applyScrollAnchorOffset(var20)
				end
			end
			var6.onScrollOffsetChanged(p0.getScrollState().atEnd, p0.getAutoScrollPolicy() == autoScrollPolicyModule.WhenAtEnd)
		end,
		onScrollOffsetChanged = function() --[[ line: 152 ]]
			-- upvalues: p0 (ref), var6 (ref), autoScrollPolicyModule (copy)
			var6.onScrollOffsetChanged(p0.getScrollState().atEnd, p0.getAutoScrollPolicy() == autoScrollPolicyModule.WhenAtEnd)
		end
	}
end