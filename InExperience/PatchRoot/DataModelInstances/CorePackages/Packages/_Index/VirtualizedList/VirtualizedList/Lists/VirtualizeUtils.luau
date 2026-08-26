local parent = script.Parent.Parent
local error = require(parent.Parent.LuauPolyfill).Error
local httpService = game:GetService("HttpService")
local t = {}
local invariantModule = require(parent.jsUtils.invariant)

local function elementsThatOverlapOffsets(value, p1, p2)
	-- upvalues: invariantModule (ref), httpService (ref)
	local t = {}
	local var1 = 0
	
	for i_1 = 1, p1 do
		local var2 = p2(i_1)
		local var3 = var2.offset + var2.length
		
		for i = 1, #value do
			if t[i] == nil and value[i] <= var3 then
				t[i] = i_1
				var1 += 1
				
				if i ~= #value then
					continue
				end
				if var1 ~= #value then
					invariantModule(var1 == #value, "bad offsets input, should be in increasing order: %s", httpService:JSONEncode(value))
				end
				return t
			end
		end
	end
	return t
end

t.elementsThatOverlapOffsets = elementsThatOverlapOffsets

function t.newRangeCount(p3, p4)
	return p4.last - p4.first + 1 - math.max(0, math.min(p4.last, p3.last) + 1 - math.max(p4.first, p3.first))
end

function t.computeWindowedRenderLimits(p3, p4, p5, p6, p7, p8, p9)
	-- upvalues: elementsThatOverlapOffsets (ref), error (ref), httpService (ref)
	local var4 = p4(p3)
	
	if var4 == 0 then
		return p7
	end
	local offset = p9.offset
	local velocity = p9.velocity
	local visibleLength = p9.visibleLength
	local maxValue = math.max(0, offset)
	local var5 = maxValue + visibleLength
	local var6 = (p6 - 1) * visibleLength
	local var7 = if velocity > 1 then "after" elseif velocity < -1 then "before" else "none"
	local maxValue_1 = math.max(0, maxValue - 0.5 * var6)
	local maxValue_2 = math.max(0, var5 + 0.5 * var6)
	
	if p8(var4).offset < maxValue_1 then
		return { first = math.max(1, var4 - p5), last = var4 }
	end
	local unpacked, unpacked_1, unpacked_2, unpacked_3 = table.unpack(elementsThatOverlapOffsets({ maxValue_1, maxValue, var5, maxValue_2 }, var4, p8), 1, 4)
	
	if unpacked == nil then
		unpacked = 1
	end
	if unpacked_1 == nil then
		unpacked_1 = math.max(1, unpacked)
	end
	if unpacked_3 == nil then
		unpacked_3 = var4
	end
	if unpacked_2 == nil then
		unpacked_2 = math.min(unpacked_3, unpacked_1 + p5 - 1)
	end
	local t = { first = unpacked_1, last = unpacked_2 }
	local var8 = t.last - t.first + 1 - math.max(0, math.min(t.last, p7.last) + 1 - math.max(t.first, p7.first))
	while unpacked_1 > unpacked or unpacked_3 > unpacked_2 do
		local var9 = p5 <= var8
		local var10 = if unpacked_1 > p7.first then p7.last < unpacked_1 else true
		local var11 = unpacked < unpacked_1 and (not var9 or not var10)
		local var12 = if p7.last > unpacked_2 then unpacked_2 < p7.first else true
		local var13 = unpacked_2 < unpacked_3 and (not var9 or not var12)
		
		if var9 and not var11 and not var13 then break end
		if var11 and (var7 ~= "after" or not var13 or not var12) then
			if var10 then
				var8 += 1
			end
			unpacked_1 -= 1
		end
		if not var13 or var7 == "before" and var11 and var10 then continue end
		if var12 then
			var8 += 1
		end
		unpacked_2 += 1
	end
	if unpacked_1 > unpacked_2 or unpacked_1 < 1 or (unpacked_2 > var4 or unpacked > unpacked_1) or (unpacked_2 > unpacked_3 or unpacked_1 > t.first or t.last > unpacked_2) then
		error(error.new("Bad window calculation " .. httpService:JSONEncode({
			first = unpacked_1,
			last = unpacked_2,
			itemCount = var4,
			overscanFirst = unpacked,
			overscanLast = unpacked_3,
			visible = t
		})))
	end
	return { first = unpacked_1, last = unpacked_2 }
end

function t.keyExtractor(p10, p11)
	return if typeof(p10) == "table" and p10.key ~= nil then p10.key elseif typeof(p10) == "table" and p10.id ~= nil then p10.id else tostring(p11)
end

return t