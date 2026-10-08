local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local autoScrollModule = require(script.Parent.AutoScroll)
local autoScrollTargetModule = require(viewRecycler.Core.Enums.AutoScrollTarget)
local paginationEdgesModule = require(script.Parent.PaginationEdges)
local reachedThresholdModule = require(script.Parent.ReachedThreshold)
local scrollAlignmentModule = require(viewRecycler.Core.Enums.ScrollAlignment)
local _ = require(viewRecycler.Core.Types)
local initialScrollPositionModule = require(script.Parent.InitialScrollPosition)

local function _(p1)
	-- upvalues: reachedThresholdModule (ref)
	if p1.autoScrollThreshold ~= nil then
		reachedThresholdModule.validate(p1.autoScrollThreshold, "Virtualizer: autoScrollThreshold")
	end
	if p1.startReachedThreshold ~= nil then
		reachedThresholdModule.validate(p1.startReachedThreshold, "Virtualizer: startReachedThreshold")
	end
end

return function(p1)
	-- upvalues: reachedThresholdModule (ref), initialScrollPositionModule (ref), autoScrollModule (ref), paginationEdgesModule (ref), scrollAlignmentModule (ref), autoScrollTargetModule (ref)
	if p1.autoScrollThreshold ~= nil then
		reachedThresholdModule.validate(p1.autoScrollThreshold, "Virtualizer: autoScrollThreshold")
	end
	if p1.startReachedThreshold ~= nil then
		reachedThresholdModule.validate(p1.startReachedThreshold, "Virtualizer: startReachedThreshold")
	end
	local var1 = p1
	local var2 = initialScrollPositionModule()
	local var3 = autoScrollModule.create()
	local var4 = paginationEdgesModule.create()
	
	local function _(value, p2)
		-- upvalues: var1 (write), scrollAlignmentModule (copy), var3 (ref), autoScrollTargetModule (copy)
		if value ~= nil and p2 > 0 and var1.initialScrollAlignment == scrollAlignmentModule.End then
			var3.settleAt(autoScrollTargetModule.End)
		end
		return value
	end
	
	local function followThreshold(p2)
		-- upvalues: reachedThresholdModule (copy), var1 (write)
		return reachedThresholdModule.resolve(var1.autoScrollThreshold, p2, 1)
	end
	
	return {
		configure = function(p2)
			-- upvalues: reachedThresholdModule (copy), var1 (write)
			if p2.autoScrollThreshold ~= nil then
				reachedThresholdModule.validate(p2.autoScrollThreshold, "Virtualizer: autoScrollThreshold")
			end
			if p2.startReachedThreshold ~= nil then
				reachedThresholdModule.validate(p2.startReachedThreshold, "Virtualizer: startReachedThreshold")
			end
			var1 = p2
		end,
		contentLengthChanged = function(p2)
			-- upvalues: var3 (ref)
			return var3.getSettleOffset(p2.contentLength, p2.viewportLength)
		end,
		dataChanged = function(p2, p3, p4)
			-- upvalues: var2 (ref), var1 (write), var3 (ref), autoScrollModule (copy), followThreshold (ref), scrollAlignmentModule (copy), autoScrollTargetModule (copy)
			local var5 = var2.onDataSourceChange(p2.itemCount, var1.initialScrollAlignment, p2.getScrollOffsetForItem)
			local var6 = var3.onDataSourceChanged(autoScrollModule.resolveTarget(var1.autoScrollOnChange, p3, p4, followThreshold(p4.viewportLength)))
			
			if var6 ~= false then
				return autoScrollModule.getTargetOffset(var6, p2.scrollState.contentLength, p2.scrollState.viewportLength)
			elseif var5 ~= nil and p2.itemCount > 0 and var1.initialScrollAlignment == scrollAlignmentModule.End then
				var3.settleAt(autoScrollTargetModule.End)
			end
			return var5
		end,
		dataReplaced = function(p2)
			-- upvalues: var2 (ref), var1 (write), scrollAlignmentModule (copy), var3 (ref), autoScrollTargetModule (copy)
			local var5 = var2.onDataSourceReplaced(p2.itemCount, var1.initialScrollAlignment, p2.getScrollOffsetForItem)
			
			if var5 ~= nil and p2.itemCount > 0 and var1.initialScrollAlignment == scrollAlignmentModule.End then
				var3.settleAt(autoScrollTargetModule.End)
			end
			return var5
		end,
		viewportChanged = function(p2)
			-- upvalues: var2 (ref), var1 (write), scrollAlignmentModule (copy), var3 (ref), autoScrollTargetModule (copy)
			local scrollState = p2.scrollState
			
			if p2.itemCount ~= 0 and scrollState.contentLength <= 0 then
				return nil
			end
			local var5 = var2.onViewportChanged(p2.itemCount, var1.initialScrollAlignment, p2.getScrollOffsetForItem)
			
			if var5 ~= nil and p2.itemCount > 0 and var1.initialScrollAlignment == scrollAlignmentModule.End then
				var3.settleAt(autoScrollTargetModule.End)
			end
			local var6 = var5
			
			return if var6 == nil then var3.getSettleOffset(scrollState.contentLength, scrollState.viewportLength) else var6
		end,
		observe = function(p2)
			-- upvalues: var3 (ref), reachedThresholdModule (copy), var1 (write), autoScrollModule (copy)
			var3.onScrollOffsetChanged(p2, reachedThresholdModule.resolve(var1.autoScrollThreshold, p2.viewportLength, 1), autoScrollModule.followedEdge(var1.autoScrollOnChange))
		end,
		pin = var3.pin,
		checkEdges = function(p2, p3, p4)
			-- upvalues: var1 (write), var4 (ref), reachedThresholdModule (copy)
			if not var1.startReachedEnabled and not var1.endReachedEnabled then
				return false, false
			end
			local viewportLength = p2.viewportLength
			
			if viewportLength <= 0 or p3 > 0 and p2.contentLength == 0 then
				return false, false
			end
			local var5 = var4.check({
				scrollOffset = p2.scrollOffset,
				viewportLength = viewportLength,
				contentLength = p2.contentLength,
				startThreshold = reachedThresholdModule.resolve(var1.startReachedThreshold, viewportLength, 0),
				atEnd = p2.atEnd,
				canReachStart = var1.startReachedEnabled,
				canReachEnd = var1.endReachedEnabled,
				rearmAfterStructureChange = p4
			})
			
			return var5.startReached, var5.endReached
		end,
		reachesEdges = function()
			-- upvalues: var1 (write)
			return var1.startReachedEnabled or var1.endReachedEnabled
		end
	}
end