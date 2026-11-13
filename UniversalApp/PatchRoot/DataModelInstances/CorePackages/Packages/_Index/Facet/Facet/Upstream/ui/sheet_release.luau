local SheetReleaseModule = { PROJECTION_S = 0.15, DISMISS_FRACTION = 0.7 }

local function _(p1: number, p2: number): number
	return if p2 <= 0 then 0 else p2 * p1 / (p1 + p2)
end

function SheetReleaseModule.choose(Entry, p1, p2, Id, p3)
	-- upvalues: SheetReleaseModule (copy)
	local NewPROJECTIONS = p1 + p2 * SheetReleaseModule.PROJECTION_S
	local ScaledHeight = Entry[1].height * SheetReleaseModule.DISMISS_FRACTION
	
	if p3 and p1 < ScaledHeight and NewPROJECTIONS < ScaledHeight then
		return "dismiss"
	end
	local v1 = nil
	local Magnitude = 1e999
	
	for _, value in Entry do
		local Magnitude1 = math.abs(value.height - NewPROJECTIONS)
		
		if Magnitude1 < Magnitude or Magnitude1 == Magnitude and (v1 ~= nil and (v1.id ~= Id and (value.id == Id or value.index < v1.index))) then
			v1 = value
			Magnitude = Magnitude1
		end
	end
	return assert(v1).id
end

function SheetReleaseModule.resist(p4: number, p5: number, p6: number, p7: number, p8, p9: number): number
	if p6 < p4 then
		local v2 = p4 - p6
		local Largest = math.max(0, p7 - p6)
		
		return (math.min(p7, p6 + (if Largest <= 0 then 0 else Largest * v2 / (v2 + Largest))))
	elseif p4 >= p5 then
		return p4
	elseif p8 then
		return (math.max(1, p4))
	else
		local v3 = p5 - p4
		
		return p5 - (if p9 <= 0 then 0 else p9 * v3 / (v3 + p9))
	end
end

return SheetReleaseModule