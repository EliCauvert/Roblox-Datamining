local parent = script.Parent.Parent
local error = require(parent.Parent.LuauPolyfill).Error
local httpService = game:GetService("HttpService")
local t = {}
local invariantModule = require(parent.jsUtils.invariant)

local function elementsThatOverlapOffsets(value, p0, p1) --[[ line: 26 ]]
	-- upvalues: invariantModule (ref), httpService (ref)
	local t = {}
	local var5 = 0
	
	for i_1 = 1, p0 do
		local var6 = p1(i_1)
		local var7 = var6.offset + var6.length
		
		for i = 1, #value do
			if t[i] == nil and value[i] <= var7 then
				t[i] = i_1
				var5 += 1
				
				if i ~= #value then
					continue
				end
				if var5 ~= #value then
					invariantModule(var5 == #value, "bad offsets input, should be in increasing order: %s", httpService:JSONEncode(value))
				end
				return t
			end
		end
	end
	return t
end

t.elementsThatOverlapOffsets = elementsThatOverlapOffsets

function t.newRangeCount(p2, p3) --[[ line: 65 ]]
	return p3.last - p3.first + 1 - math.max(0, math.min(p3.last, p2.last) + 1 - math.max(p3.first, p2.first))
end

function t.computeWindowedRenderLimits(p4, p5, p6, p7, p8, p9, p10) --[[ line: 82 ]]
	-- upvalues: elementsThatOverlapOffsets (ref), error (ref), httpService (ref)
	local var8 = p5(p4)
	
	if var8 == 0 then
		return p8
	end
	local offset = p10.offset
	local velocity = p10.velocity
	local visibleLength = p10.visibleLength
	local maxValue = math.max(0, offset)
	local var10 = maxValue + visibleLength
	local var11 = (p7 - 1) * visibleLength
	local var12 = if velocity > 1 then "after" elseif velocity < -1 then "before" else "none"
	local maxValue_1 = math.max(0, maxValue - 0.5 * var11)
	local maxValue_2 = math.max(0, var10 + 0.5 * var11)
	
	if p9(var8).offset < maxValue_1 then
		return { first = math.max(1, var8 - p6), last = var8 }
	end
	local unpacked, unpacked_1, unpacked_2, unpacked_3 = table.unpack(elementsThatOverlapOffsets({ maxValue_1, maxValue, var10, maxValue_2 }, var8, p9), 1, 4)
	
	if unpacked == nil then
		unpacked = 1
	end
	if unpacked_1 == nil then
		unpacked_1 = math.max(1, unpacked)
	end
	if unpacked_3 == nil then
		unpacked_3 = var8
	end
	if unpacked_2 == nil then
		unpacked_2 = math.min(unpacked_3, unpacked_1 + p6 - 1)
	end
	local t = { first = unpacked_1, last = unpacked_2 }
	local var20 = t.last - t.first + 1 - math.max(0, math.min(t.last, p8.last) + 1 - math.max(t.first, p8.first))
	while unpacked_1 > unpacked or unpacked_3 > unpacked_2 do
		local var21 = p6 <= var20
		local var22 = if unpacked_1 > p8.first then p8.last < unpacked_1 else true
		local var23 = unpacked < unpacked_1 and (not var21 or not var22)
		local var24 = if p8.last > unpacked_2 then unpacked_2 < p8.first else true
		local var25 = unpacked_2 < unpacked_3 and (not var21 or not var24)
		
		if var21 and not var23 and not var25 then break end
		if var23 and (var12 ~= "after" or not var25 or not var24) then
			if var22 then
				var20 += 1
			end
			unpacked_1 -= 1
		end
		if not var25 or var12 == "before" and var23 and var22 then continue end
		if var24 then
			var20 += 1
		end
		unpacked_2 += 1
	end
	if unpacked_1 > unpacked_2 or unpacked_1 < 1 or (unpacked_2 > var8 or unpacked > unpacked_1) or (unpacked_2 > unpacked_3 or unpacked_1 > t.first or t.last > unpacked_2) then
		error(error.new("Bad window calculation " .. httpService:JSONEncode({
			first = unpacked_1,
			last = unpacked_2,
			itemCount = var8,
			overscanFirst = unpacked,
			overscanLast = unpacked_3,
			visible = t
		})))
	end
	return { first = unpacked_1, last = unpacked_2 }
end

function t.keyExtractor(p11, p12) --[[ line: 204 ]]
	return if typeof(p11) == "table" and p11.key ~= nil then p11.key elseif typeof(p11) == "table" and p11.id ~= nil then p11.id else tostring(p12)
end

return t