local Parent = script.Parent.Parent
local Error1 = require(Parent.Parent.LuauPolyfill).Error
local HttpService = game:GetService("HttpService")
local InvariantModule = require(Parent.jsUtils.invariant)

local function elementsThatOverlapOffsets(Input, ItemCount, Callback) --[[ Line: 26 ]]
	-- upvalues: InvariantModule (copy), HttpService (copy)
	local t = {}
	local Count = 0
	
	for i = 1, ItemCount do
		local CallbackResult = Callback(i)
		local NewOffset = CallbackResult.offset + CallbackResult.length
		
		for i1 = 1, #Input do
			if t[i1] == nil and Input[i1] <= NewOffset then
				t[i1] = i
				Count += 1
				
				if i1 == #Input then
					if Count ~= #Input then
						InvariantModule(Count == #Input, "bad offsets input, should be in increasing order: %s", HttpService:JSONEncode(Input))
					end
					return t
				end
			end
		end
	end
	return t
end

return {
	elementsThatOverlapOffsets = elementsThatOverlapOffsets,
	newRangeCount = function(Visible, Visible1): number --[[ Line: 65 ]]
		return Visible1.last - Visible1.first + 1 - math.max(0, math.min(Visible1.last, Visible.last) + 1 - math.max(Visible1.first, Visible.first))
	end,
	computeWindowedRenderLimits = function(p1, Callback, p2: number, p3: number, Visible, Callback1, p4) --[[ Line: 82 ]]
		-- upvalues: elementsThatOverlapOffsets (copy), Error1 (copy), HttpService (copy)
		local CallbackResult: number = Callback(p1)
		
		if CallbackResult == 0 then
			return Visible
		end
		local Velocity: number = p4.velocity
		local VisibleLength: number = p4.visibleLength
		local Largest = math.max(0, p4.offset)
		local NewLargest = Largest + VisibleLength
		local ScaledVisibleLength = (p3 - 1) * VisibleLength
		local After: string = if Velocity > 1 then "after" elseif Velocity < -1 then "before" else "none"
		local Largest1 = math.max(0, Largest - 0.5 * ScaledVisibleLength)
		local Largest2 = math.max(0, NewLargest + 0.5 * ScaledVisibleLength)
		
		if Callback1(CallbackResult).offset < Largest1 then
			return {
				first = math.max(1, CallbackResult - p2),
				last = CallbackResult
			}
		end
		local Unpacked, Unpacked2, Unpacked3, Unpacked4 = table.unpack(elementsThatOverlapOffsets({ Largest1, Largest, NewLargest, Largest2 }, CallbackResult, Callback1), 1, 4)
		
		if Unpacked == nil then
			Unpacked = 1
		end
		if Unpacked2 == nil then
			Unpacked2 = math.max(1, Unpacked)
		end
		if Unpacked4 == nil then
			Unpacked4 = CallbackResult
		end
		if Unpacked3 == nil then
			Unpacked3 = math.min(Unpacked4, Unpacked2 + p2 - 1)
		end
		local Visible1 = { first = Unpacked2, last = Unpacked3 }
		local LastDelta = Visible1.last - Visible1.first + 1 - math.max(0, math.min(Visible1.last, Visible.last) + 1 - math.max(Visible1.first, Visible.first))
		while Unpacked2 > Unpacked or Unpacked4 > Unpacked3 do
			local IsLastDeltaAbove = p2 <= LastDelta
			local IsUnpackedBelow: boolean = Unpacked2 <= Visible.first or Visible.last < Unpacked2
			local NoIsLastDeltaAbove: boolean = Unpacked < Unpacked2 and (not IsLastDeltaAbove or not IsUnpackedBelow)
			local IsLastBelow: boolean = Visible.last <= Unpacked3 or Unpacked3 < Visible.first
			local NoIsLastDeltaAbove1: boolean = Unpacked3 < Unpacked4 and (not IsLastDeltaAbove or not IsLastBelow)
			
			if IsLastDeltaAbove and not NoIsLastDeltaAbove and not NoIsLastDeltaAbove1 then break end
			if NoIsLastDeltaAbove and (After ~= "after" or not NoIsLastDeltaAbove1 or not IsLastBelow) then
				if IsUnpackedBelow then
					LastDelta += 1
				end
				Unpacked2 -= 1
			end
			if not NoIsLastDeltaAbove1 or After == "before" and NoIsLastDeltaAbove and IsUnpackedBelow then continue end
			if IsLastBelow then
				LastDelta += 1
			end
			Unpacked3 += 1
		end
		if Unpacked2 > Unpacked3 or Unpacked2 < 1 or Unpacked3 > CallbackResult or Unpacked > Unpacked2 or Unpacked3 > Unpacked4 or Unpacked2 > Visible1.first or Visible1.last > Unpacked3 then
			error(Error1.new("Bad window calculation " .. HttpService:JSONEncode({
				first = Unpacked2,
				last = Unpacked3,
				itemCount = CallbackResult,
				overscanFirst = Unpacked,
				overscanLast = Unpacked4,
				visible = Visible1
			})))
		end
		return { first = Unpacked2, last = Unpacked3 }
	end,
	keyExtractor = function(p5, p6) --[[ Line: 204 ]]
		return if typeof(p5) == "table" and p5.key ~= nil then p5.key elseif typeof(p5) == "table" and p5.id ~= nil then p5.id else tostring(p6)
	end
}