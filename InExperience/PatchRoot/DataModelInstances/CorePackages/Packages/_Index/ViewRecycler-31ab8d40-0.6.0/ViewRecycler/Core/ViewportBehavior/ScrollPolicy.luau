local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local AutoScrollModule = require(script.Parent.AutoScroll)
local AutoScrollTargetModule = require(ViewRecycler.Core.Enums.AutoScrollTarget)
local PaginationEdgesModule = require(script.Parent.PaginationEdges)
local ReachedThresholdModule = require(script.Parent.ReachedThreshold)
local ScrollAlignmentModule = require(ViewRecycler.Core.Enums.ScrollAlignment)
local _ = require(ViewRecycler.Core.Types)
local InitialScrollPositionModule = require(script.Parent.InitialScrollPosition)

local function _(p1)
	-- upvalues: ReachedThresholdModule (copy)
	if p1.autoScrollThreshold ~= nil then
		ReachedThresholdModule.validate(p1.autoScrollThreshold, "Virtualizer: autoScrollThreshold")
	end
	if p1.startReachedThreshold ~= nil then
		ReachedThresholdModule.validate(p1.startReachedThreshold, "Virtualizer: startReachedThreshold")
	end
end

return function(p1)
	-- upvalues: ReachedThresholdModule (copy), InitialScrollPositionModule (copy), AutoScrollModule (copy), PaginationEdgesModule (copy), ScrollAlignmentModule (copy), AutoScrollTargetModule (copy)
	if p1.autoScrollThreshold ~= nil then
		ReachedThresholdModule.validate(p1.autoScrollThreshold, "Virtualizer: autoScrollThreshold")
	end
	if p1.startReachedThreshold ~= nil then
		ReachedThresholdModule.validate(p1.startReachedThreshold, "Virtualizer: startReachedThreshold")
	end
	local v1 = p1
	local InitialScrollPositionModuleResult = InitialScrollPositionModule()
	local NewAutoScroll = AutoScrollModule.create()
	local NewPaginationEdges = PaginationEdgesModule.create()
	
	local function _(p2, p3: number)
		-- upvalues: v1 (ref), ScrollAlignmentModule (upval), NewAutoScroll (copy), AutoScrollTargetModule (upval)
		if p2 ~= nil and p3 > 0 and v1.initialScrollAlignment == ScrollAlignmentModule.End then
			NewAutoScroll.settleAt(AutoScrollTargetModule.End)
		end
		return p2
	end
	
	local function followThreshold(ViewportLength)
		-- upvalues: ReachedThresholdModule (upval), v1 (ref)
		return ReachedThresholdModule.resolve(v1.autoScrollThreshold, ViewportLength, 1)
	end
	
	return {
		configure = function(p2)
			-- upvalues: ReachedThresholdModule (upval), v1 (ref)
			if p2.autoScrollThreshold ~= nil then
				ReachedThresholdModule.validate(p2.autoScrollThreshold, "Virtualizer: autoScrollThreshold")
			end
			if p2.startReachedThreshold ~= nil then
				ReachedThresholdModule.validate(p2.startReachedThreshold, "Virtualizer: startReachedThreshold")
			end
			v1 = p2
		end,
		contentLengthChanged = function(p2)
			-- upvalues: NewAutoScroll (copy)
			return NewAutoScroll.getSettleOffset(p2.contentLength, p2.viewportLength)
		end,
		dataChanged = function(p2, p3, p4)
			-- upvalues: InitialScrollPositionModuleResult (copy), v1 (ref), NewAutoScroll (copy), AutoScrollModule (upval), followThreshold (copy), ScrollAlignmentModule (upval), AutoScrollTargetModule (upval)
			local OnDataSourceChangeResult = InitialScrollPositionModuleResult.onDataSourceChange(p2.itemCount, v1.initialScrollAlignment, p2.getScrollOffsetForItem)
			local OnDataSourceChangedResult = NewAutoScroll.onDataSourceChanged(AutoScrollModule.resolveTarget(v1.autoScrollOnChange, p3, p4, followThreshold(p4.viewportLength)))
			
			if OnDataSourceChangedResult ~= false then
				return AutoScrollModule.getTargetOffset(OnDataSourceChangedResult, p2.scrollState.contentLength, p2.scrollState.viewportLength)
			end
			local ItemCount: number = p2.itemCount
			
			if OnDataSourceChangeResult ~= nil and ItemCount > 0 and v1.initialScrollAlignment == ScrollAlignmentModule.End then
				NewAutoScroll.settleAt(AutoScrollTargetModule.End)
			end
			return OnDataSourceChangeResult
		end,
		dataReplaced = function(p2)
			-- upvalues: InitialScrollPositionModuleResult (copy), v1 (ref), ScrollAlignmentModule (upval), NewAutoScroll (copy), AutoScrollTargetModule (upval)
			local OnDataSourceReplacedResult = InitialScrollPositionModuleResult.onDataSourceReplaced(p2.itemCount, v1.initialScrollAlignment, p2.getScrollOffsetForItem)
			local ItemCount: number = p2.itemCount
			
			if OnDataSourceReplacedResult ~= nil and ItemCount > 0 and v1.initialScrollAlignment == ScrollAlignmentModule.End then
				NewAutoScroll.settleAt(AutoScrollTargetModule.End)
			end
			return OnDataSourceReplacedResult
		end,
		viewportChanged = function(p2)
			-- upvalues: InitialScrollPositionModuleResult (copy), v1 (ref), ScrollAlignmentModule (upval), NewAutoScroll (copy), AutoScrollTargetModule (upval)
			local ScrollState = p2.scrollState
			
			if p2.itemCount ~= 0 and ScrollState.contentLength <= 0 then
				return nil
			end
			local OnViewportChangedResult = InitialScrollPositionModuleResult.onViewportChanged(p2.itemCount, v1.initialScrollAlignment, p2.getScrollOffsetForItem)
			local ItemCount: number = p2.itemCount
			
			if OnViewportChangedResult ~= nil and ItemCount > 0 and v1.initialScrollAlignment == ScrollAlignmentModule.End then
				NewAutoScroll.settleAt(AutoScrollTargetModule.End)
			end
			return if OnViewportChangedResult == nil then NewAutoScroll.getSettleOffset(ScrollState.contentLength, ScrollState.viewportLength) else OnViewportChangedResult
		end,
		observe = function(p2)
			-- upvalues: NewAutoScroll (copy), ReachedThresholdModule (upval), v1 (ref), AutoScrollModule (upval)
			NewAutoScroll.onScrollOffsetChanged(p2, ReachedThresholdModule.resolve(v1.autoScrollThreshold, p2.viewportLength, 1), AutoScrollModule.followedEdge(v1.autoScrollOnChange))
		end,
		pin = NewAutoScroll.pin,
		checkEdges = function(p2, p3: number, RearmAfterStructureChange)
			-- upvalues: v1 (ref), NewPaginationEdges (copy), ReachedThresholdModule (upval)
			if not v1.startReachedEnabled and not v1.endReachedEnabled then
				return false, false
			end
			local ViewportLength: number = p2.viewportLength
			
			if ViewportLength <= 0 or p3 > 0 and p2.contentLength == 0 then
				return false, false
			else
				local CheckResult = NewPaginationEdges.check({
					scrollOffset = p2.scrollOffset,
					viewportLength = ViewportLength,
					contentLength = p2.contentLength,
					startThreshold = ReachedThresholdModule.resolve(v1.startReachedThreshold, ViewportLength, 0),
					atEnd = p2.atEnd,
					canReachStart = v1.startReachedEnabled,
					canReachEnd = v1.endReachedEnabled,
					rearmAfterStructureChange = RearmAfterStructureChange
				})
				
				return CheckResult.startReached, CheckResult.endReached
			end
		end,
		reachesEdges = function()
			-- upvalues: v1 (ref)
			return v1.startReachedEnabled or v1.endReachedEnabled
		end
	}
end