local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local autoScrollPolicyModule = require(viewRecycler.Core.Enums.AutoScrollPolicy)
local autoScrollTargetModule = require(viewRecycler.Core.Enums.AutoScrollTarget)
local _ = require(viewRecycler.Core.Types)
local t = {
	followedEdge = function(p1)
		-- upvalues: autoScrollPolicyModule (ref), autoScrollTargetModule (ref)
		return if p1 == autoScrollPolicyModule.WhenAtStart then autoScrollTargetModule.Start elseif p1 == autoScrollPolicyModule.WhenAtEnd then autoScrollTargetModule.End else nil
	end,
	distanceFromEdge = function(p1, p2)
		-- upvalues: autoScrollTargetModule (ref)
		return if p1 == autoScrollTargetModule.Start then p2.scrollOffset else p2.distanceFromEnd
	end
}

function t.resolveTarget(p1, p2, p3, p4)
	-- upvalues: t (ref)
	if type(p1) == "function" then
		return p1(p2, p3)
	end
	local var1 = t.followedEdge(p1)
	
	return if var1 == nil or t.distanceFromEdge(var1, p3) > p4 then false else var1
end

function t.getTargetOffset(value, p1, p2)
	-- upvalues: autoScrollTargetModule (ref)
	return if value == autoScrollTargetModule.Start then 0 else math.max(0, p1 - p2)
end

function t.create()
	-- upvalues: t (ref)
	local var1 = nil
	local var2 = false
	
	return {
		onDataSourceChanged = function(p1)
			-- upvalues: var2 (write), var1 (write)
			if p1 ~= false then
				var2 = var2 and p1 == var1
				var1 = p1
				
				return p1
			elseif var2 then
				return var1
			end
			var2 = var2 and var1 == nil
			var1 = nil
			
			return false
		end,
		settleAt = function(value)
			-- upvalues: var2 (write), var1 (write)
			var2 = var2 and value == var1
			var1 = value
		end,
		pin = function(p1)
			-- upvalues: var1 (write), var2 (write)
			var1 = p1
			var2 = true
		end,
		getSettleOffset = function(value, p1)
			-- upvalues: var1 (write), t (copy)
			return if var1 == nil then nil else t.getTargetOffset(var1, value, p1)
		end,
		onScrollOffsetChanged = function(value, p1, p2)
			-- upvalues: var1 (write), t (copy), var2 (write)
			if var1 ~= nil and t.distanceFromEdge(var1, value) <= p1 then return end
			if p2 == nil or t.distanceFromEdge(p2, value) > p1 then
				var2 = var2 and var1 == nil
				var1 = nil
				
				return
			end
			var2 = var2 and p2 == var1
			var1 = p2
		end
	}
end

return t