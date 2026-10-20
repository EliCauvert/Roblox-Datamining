local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local TileVisibilityModule = require(script.Parent.tileVisibility)
local PresenceTypes = require(SocialCarousel.Parent.SocialCommon).Enums.PresenceTypes
local Tile = require(SocialCarousel.Common.Enums).Tile

local function _(Text, Text1, p1)
	if p1 == nil then
		return 2
	else
		local v1 = p1[Text .. "\0" .. Text1]
		
		return if v1 == nil then 2 else v1
	end
end

local function isEligible(p1, p2, p3)
	-- upvalues: Tile (copy), PresenceTypes (copy), TileVisibilityModule (copy)
	local IsSubtitleMatch = nil
	if p1.tileType == Tile.Friend then
		local Presence = p1.presence
		
		if Presence == nil or Presence.userPresenceType ~= PresenceTypes.InGame then
			IsSubtitleMatch = false
		else
			local LastLocation = Presence.lastLocation
			IsSubtitleMatch = LastLocation ~= nil and LastLocation ~= "" and p1.subtitle == LastLocation
		end
	else
		IsSubtitleMatch = false
	end
	if not IsSubtitleMatch then
		return false
	end
	local Presence = p1.presence
	local LastLocation = if Presence == nil then nil else Presence.lastLocation
	
	if LastLocation ~= nil then
		local Id = p1.id
		local LoopsRemaining = p3.loopsRemaining
		local v1 = nil
		
		if LoopsRemaining == nil then
			v1 = 2
		else
			local LoopsRemainingEntry = LoopsRemaining[Id .. "\0" .. LastLocation]
			v1 = if LoopsRemainingEntry == nil then 2 else LoopsRemainingEntry
		end
		if v1 > 0 then
			return TileVisibilityModule.isAtLeast70PercentVisible(p2, p3.canvasX, p3.containerWidth, p3.tileWidth, p3.gap)
		end
	end
	return false
end

local function scanRow(List, p1, Id)
	-- upvalues: isEligible (copy)
	local List1 = {}
	local v1 = nil
	
	if p1.interacting or p1.reducedMotion then
		return List1, nil
	end
	for i, value in ipairs(List) do
		if Id ~= nil and v1 == nil and value.id == Id then
			v1 = i
		end
		if isEligible(value, i, p1) then
			table.insert(List1, i)
		end
	end
	return List1, v1
end

local _ = function(Entry, TextDirection)
	local CountEntry = #Entry
	
	return if CountEntry == 0 then nil elseif TextDirection == Enum.TextDirection.RightToLeft then Entry[CountEntry] else Entry[1]
end

local function nextIndex(Entry, p2, TextDirection)
	local CountEntry = #Entry
	
	if CountEntry == 0 then
		return nil
	end
	if p2 == nil then
		local CountEntry1 = #Entry
		
		return if CountEntry1 == 0 then nil elseif TextDirection == Enum.TextDirection.RightToLeft then Entry[CountEntry1] else Entry[1]
	end
	if TextDirection == Enum.TextDirection.RightToLeft then
		local Entry1 = nil
		for i = CountEntry, 1, -1 do
			Entry1 = Entry[i]
			
			if Entry1 < p2 then
				return Entry1
			end
		end
		return Entry[CountEntry]
	else
		for _, value in ipairs(Entry) do
			if p2 < value then
				return value
			end
		end
		return Entry[1]
	end
end

return {
	DEFAULT_LOOPS = 2,
	loopKey = function(Text, Text1): string
		return Text .. "\0" .. Text1
	end,
	recordFinishedLoop = function(p3, Text, Text1)
		local Text2 = Text .. "\0" .. Text1
		local v2 = p3[Text2]
		
		if v2 == nil then
			v2 = 2
		end
		p3[Text2] = v2 - 1
	end,
	isHoverEligible = function(p3): boolean
		-- upvalues: Tile (copy), PresenceTypes (copy)
		if p3.tileType ~= Tile.Friend then
			return false
		end
		local Presence = p3.presence
		
		if Presence == nil or Presence.userPresenceType ~= PresenceTypes.InGame then
			return false
		else
			local LastLocation = Presence.lastLocation
			
			return LastLocation ~= nil and LastLocation ~= "" and p3.subtitle == LastLocation
		end
	end,
	leadingEligible = function(p3, p4)
		-- upvalues: scanRow (copy)
		local ScanRowResult = scanRow(p3, p4, nil)
		local Direction = p4.direction
		local CountScanRowResult = #ScanRowResult
		local ScanRowResultEntry = if CountScanRowResult == 0 then nil elseif Direction == Enum.TextDirection.RightToLeft then ScanRowResult[CountScanRowResult] else ScanRowResult[1]
		
		return if ScanRowResultEntry == nil then nil else p3[ScanRowResultEntry].id
	end,
	resolveActiveTileId = function(p3, p4, _)
		-- upvalues: scanRow (copy)
		local ScanRowResult = scanRow(p3, p4, nil)
		local Direction = p4.direction
		local CountScanRowResult = #ScanRowResult
		local ScanRowResultEntry = if CountScanRowResult == 0 then nil elseif Direction == Enum.TextDirection.RightToLeft then ScanRowResult[CountScanRowResult] else ScanRowResult[1]
		
		return if ScanRowResultEntry == nil then nil else p3[ScanRowResultEntry].id
	end,
	nextEligibleAfter = function(p3, p4, p5)
		-- upvalues: scanRow (copy), nextIndex (copy)
		local ScanRowResult, ScanRowResult2 = scanRow(p3, p5, p4)
		local NextIndexResult = nextIndex(ScanRowResult, ScanRowResult2, p5.direction)
		
		return if NextIndexResult == nil then nil else p3[NextIndexResult].id
	end
}