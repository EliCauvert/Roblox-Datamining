local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local socialCommonModule = require(socialCarousel.Parent.SocialCommon)
local enumsModule = require(socialCarousel.Common.Enums)
local tileVisibilityModule = require(script.Parent.tileVisibility)
local presenceTypes = socialCommonModule.Enums.PresenceTypes
local tile = enumsModule.Tile

local function loopKey(p1, p2)
	return p1 .. "\0" .. p1
end

local function _(p1, p2, p3)
	if p3 == nil then
		return 2
	end
	local var1 = p3[p1 .. "\0" .. p3]
	
	return if var1 == nil then 2 else var1
end

local function recordFinishedLoop(p1, p2, p3)
	local text = p2 .. "\0" .. p7
	local var1 = p1[text]
	
	if var1 == nil then
		var1 = 2
	end
	p1[text] = var1 - 1
end

local function isEligible(p1, p2, p3)
	-- upvalues: tile (ref), presenceTypes (ref), tileVisibilityModule (ref)
	if p1.tileType ~= tile.Friend then
		return false
	end
	local presence = p1.presence
	
	if presence == nil or presence.userPresenceType ~= presenceTypes.InGame then
		return false
	end
	local lastLocation = presence.lastLocation
	
	if lastLocation == nil or lastLocation == "" or p1.subtitle ~= lastLocation then
		return false
	end
	local var1
	local id = p1.id
	local loopsRemaining = p3.loopsRemaining
	
	if loopsRemaining == nil then
		var1 = 2
	else
		local var2 = loopsRemaining[id .. "\0" .. lastLocation]
		var1 = if var2 == nil then 2 else var2
	end
	return if var1 <= 0 then false else tileVisibilityModule.isAtLeast70PercentVisible(p2, p3.canvasX, p3.containerWidth, p3.tileWidth, p3.gap)
end

local function scanRow(p1, p2, p3)
	-- upvalues: isEligible (ref)
	local t = {}
	local var1 = nil
	
	if p2.interacting or p2.reducedMotion then
		return t, nil
	end
	for i, v in ipairs(p1) do
		if p3 ~= nil and var1 == nil and v.id == p3 then
			var1 = i
		end
		if isEligible(v, i, p2) then
			table.insert(t, i)
		end
	end
	return t, var1
end

local _ = function(p4, p5)
	local p14Count = #p4
	
	return if p14Count == 0 then nil elseif p5 == Enum.TextDirection.RightToLeft then p4[p14Count] else p4[1]
end

local function nextIndex(p4, p5, p6)
	local p16Count = #p4
	
	if p16Count == 0 then
		return nil
	elseif p5 == nil then
		local p16Count_1 = #p4
		
		return if p16Count_1 == 0 then nil elseif p6 == Enum.TextDirection.RightToLeft then p4[p16Count_1] else p4[1]
	elseif p6 == Enum.TextDirection.RightToLeft then
		for i = p16Count, 1, -1 do
			local var2 = p4[i]
			
			if var2 >= p5 then
				continue
			end
			return var2
		end
		return p4[p16Count]
	else
		for var2, v in ipairs(p4) do
			if p5 < v then
				return v
			end
		end
		return p4[1]
	end
end

return {
	DEFAULT_LOOPS = 2,
	loopKey = loopKey,
	recordFinishedLoop = recordFinishedLoop,
	leadingEligible = function(p7, p8)
		-- upvalues: scanRow (ref)
		local var3 = scanRow(p7, p8, nil)
		local var20Count = #var3
		local var4 = if var20Count == 0 then nil elseif p8.direction == Enum.TextDirection.RightToLeft then var3[var20Count] else var3[1]
		
		return if var4 == nil then nil else p7[var4].id
	end,
	resolveActiveTileId = function(p7, p8, _)
		-- upvalues: scanRow (ref)
		local var3 = scanRow(p7, p8, nil)
		local var23Count = #var3
		local var4 = if var23Count == 0 then nil elseif p8.direction == Enum.TextDirection.RightToLeft then var3[var23Count] else var3[1]
		
		return if var4 == nil then nil else p7[var4].id
	end,
	nextEligibleAfter = function(p7, p8, p9)
		-- upvalues: scanRow (ref), nextIndex (ref)
		local var3, var4 = scanRow(p7, p9, p8)
		local var5 = nextIndex(var3, var4, p9.direction)
		
		return if var5 == nil then nil else p7[var5].id
	end
}