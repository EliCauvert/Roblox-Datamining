local Foundation = script:FindFirstAncestor("Foundation")
local DisplacedBehaviorModule = require(Foundation.Providers.ScreenRegion.DisplacedBehavior)
local RegionOrderModule = require(Foundation.Providers.ScreenRegion.RegionOrder)
local _ = require(Foundation.Providers.ScreenRegion.ScreenRegionKind)
local _ = require(Foundation.Providers.ScreenRegion.regionPolicies)

local function _(p1, p2, p3): boolean
	-- upvalues: RegionOrderModule (copy)
	if p3.order == RegionOrderModule.Priority then
		local Priority = p1.priority or 0
		local Priority1 = p2.priority or 0
		
		if Priority ~= Priority1 then
			return Priority1 < Priority
		end
	end
	local ClaimedAt = p1.claimedAt or 0
	local ClaimedAt1 = p2.claimedAt or 0
	
	return if ClaimedAt == ClaimedAt1 then p2.id < p1.id else ClaimedAt1 < ClaimedAt
end

return function(List, p1)
	-- upvalues: RegionOrderModule (copy), DisplacedBehaviorModule (copy)
	local List1 = {}
	
	for _, value in List do
		if value.isOpen and not value.isDismissed then
			table.insert(List1, value)
		end
	end
	table.sort(List1, function(A, B): boolean
		-- upvalues: p1 (copy), RegionOrderModule (upval)
		if p1.order == RegionOrderModule.Priority then
			local Priority = A.priority or 0
			local Priority1 = B.priority or 0
			
			if Priority ~= Priority1 then
				return Priority1 < Priority
			end
		end
		local ClaimedAt = A.claimedAt or 0
		local ClaimedAt1 = B.claimedAt or 0
		
		return if ClaimedAt == ClaimedAt1 then B.id < A.id else ClaimedAt1 < ClaimedAt
	end)
	local t = {}
	local Dismissed = {}
	local Count = 0
	local t1 = {}
	
	for _, value1 in List1 do
		local CapacityPerKindEntry = if p1.capacityPerKind then p1.capacityPerKind[value1.kind] else nil
		local Entry = t1[value1.kind] or 0
		
		if Count < p1.capacity and (CapacityPerKindEntry == nil or Entry < CapacityPerKindEntry) then
			t[value1.id] = value1
			Count += 1
			t1[value1.kind] = Entry + 1
		elseif p1.displaced[value1.kind] == DisplacedBehaviorModule.Dismiss then
			Dismissed[value1.id] = true
		end
	end
	local Visible = {}
	local Flag = nil
	
	for i, value2 in t do
		Flag = false
		
		if p1.sequential and not value2.isMounted then
			for _, value3 in List do
				if value3.isMounted and t[value3.id] == nil then
					Flag = true
					break
				end
			end
		end
		Visible[i] = not Flag
	end
	return { visible = Visible, dismissed = Dismissed }
end