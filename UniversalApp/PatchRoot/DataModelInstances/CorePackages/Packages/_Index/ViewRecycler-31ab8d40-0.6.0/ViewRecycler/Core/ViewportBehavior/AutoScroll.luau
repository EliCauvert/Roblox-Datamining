local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local AutoScrollPolicyModule = require(ViewRecycler.Core.Enums.AutoScrollPolicy)
local AutoScrollTargetModule = require(ViewRecycler.Core.Enums.AutoScrollTarget)
local _ = require(ViewRecycler.Core.Types)
local AutoScrollModule = {
	followedEdge = function(WhenAtEnd)
		-- upvalues: AutoScrollPolicyModule (copy), AutoScrollTargetModule (copy)
		return if WhenAtEnd == AutoScrollPolicyModule.WhenAtStart then AutoScrollTargetModule.Start elseif WhenAtEnd == AutoScrollPolicyModule.WhenAtEnd then AutoScrollTargetModule.End else nil
	end,
	distanceFromEdge = function(FollowedEdgeResult, p1)
		-- upvalues: AutoScrollTargetModule (copy)
		return if FollowedEdgeResult == AutoScrollTargetModule.Start then p1.scrollOffset else p1.distanceFromEnd
	end
}

function AutoScrollModule.resolveTarget(Callback, p1, p2, p3)
	-- upvalues: AutoScrollModule (copy)
	if type(Callback) == "function" then
		return Callback(p1, p2)
	else
		local FollowedEdgeResult = AutoScrollModule.followedEdge(Callback)
		
		return FollowedEdgeResult ~= nil and AutoScrollModule.distanceFromEdge(FollowedEdgeResult, p2) <= p3 and FollowedEdgeResult
	end
end

function AutoScrollModule.getTargetOffset(Start, p1, p2): number
	-- upvalues: AutoScrollTargetModule (copy)
	return if Start == AutoScrollTargetModule.Start then 0 else math.max(0, p1 - p2)
end

function AutoScrollModule.create()
	-- upvalues: AutoScrollModule (copy)
	local v1 = nil
	local Flag = false
	
	return {
		onDataSourceChanged = function(Enabled)
			-- upvalues: Flag (ref), v1 (ref)
			if Enabled ~= false then
				Flag = Flag and Enabled == v1
				v1 = Enabled
				
				return Enabled
			elseif Flag then
				return v1
			else
				Flag = Flag and v1 == nil
				v1 = nil
				
				return false
			end
		end,
		settleAt = function(p1)
			-- upvalues: Flag (ref), v1 (ref)
			Flag = Flag and p1 == v1
			v1 = p1
		end,
		pin = function(p1)
			-- upvalues: v1 (ref), Flag (ref)
			v1 = p1
			Flag = true
		end,
		getSettleOffset = function(p1, p2)
			-- upvalues: v1 (ref), AutoScrollModule (upval)
			local v2 = v1
			
			return if v2 == nil then nil else AutoScrollModule.getTargetOffset(v2, p1, p2)
		end,
		onScrollOffsetChanged = function(p1, p2, p3)
			-- upvalues: v1 (ref), AutoScrollModule (upval), Flag (ref)
			local v2 = v1
			
			if v2 ~= nil and AutoScrollModule.distanceFromEdge(v2, p1) <= p2 then return end
			if p3 == nil or AutoScrollModule.distanceFromEdge(p3, p1) > p2 then
				Flag = Flag and v1 == nil
				v1 = nil
				
				return
			else
				Flag = Flag and p3 == v1
				v1 = p3
			end
		end
	}
end

return AutoScrollModule