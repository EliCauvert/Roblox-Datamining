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

local function storedLoopKeys(List, Text)
	local Text1 = Text .. "\0"
	local List1 = {}
	
	for i in List do
		if string.sub(i, 1, #Text1) == Text1 then
			table.insert(List1, i)
		end
	end
	return List1
end

local function reconcileFriendPresence(p1, Id, Text)
	-- upvalues: storedLoopKeys (copy)
	local StoredLoopKeysResult = storedLoopKeys(p1, Id)
	
	if Text == nil or Text == "" then
		for _, value in StoredLoopKeysResult do
			p1[value] = nil
		end
		return
	else
		local Text1 = Id .. "\0" .. Text
		local v1 = p1[Text1] ~= nil
		for _, value1 in StoredLoopKeysResult do
			if value1 ~= Text1 then
				p1[value1] = nil
			end
		end
		if not v1 then
			p1[Text1] = 2
		end
	end
end

local _ = function(p2)
	-- upvalues: Tile (copy), PresenceTypes (copy)
	if p2.tileType ~= Tile.Friend then
		return nil
	end
	local Presence = p2.presence
	
	if Presence == nil or Presence.userPresenceType ~= PresenceTypes.InGame then
		return nil
	else
		local LastLocation = Presence.lastLocation
		
		return if LastLocation == nil or LastLocation == "" then nil else LastLocation
	end
end

local _ = function(Text: string)
	local FoundAt: number? = string.find(Text, "\0", 1, true)
	
	return if FoundAt == nil then nil else string.sub(Text, 1, FoundAt - 1)
end

local function isEligible(p2, p3, p4)
	-- upvalues: Tile (copy), PresenceTypes (copy), TileVisibilityModule (copy)
	local IsSubtitleMatch = nil
	if p2.tileType == Tile.Friend then
		local Presence = p2.presence
		
		if Presence == nil or Presence.userPresenceType ~= PresenceTypes.InGame then
			IsSubtitleMatch = false
		else
			local LastLocation = Presence.lastLocation
			IsSubtitleMatch = LastLocation ~= nil and LastLocation ~= "" and p2.subtitle == LastLocation
		end
	else
		IsSubtitleMatch = false
	end
	if not IsSubtitleMatch then
		return false
	end
	local Presence = p2.presence
	local LastLocation = if Presence == nil then nil else Presence.lastLocation
	
	if LastLocation ~= nil then
		local Id = p2.id
		local LoopsRemaining = p4.loopsRemaining
		local v2 = nil
		
		if LoopsRemaining == nil then
			v2 = 2
		else
			local LoopsRemainingEntry = LoopsRemaining[Id .. "\0" .. LastLocation]
			v2 = if LoopsRemainingEntry == nil then 2 else LoopsRemainingEntry
		end
		if v2 > 0 then
			return TileVisibilityModule.isAtLeast70PercentVisible(p3, p4.canvasX, p4.containerWidth, p4.tileWidth, p4.gap)
		end
	end
	return false
end

local function scanRow(List, p2, Id)
	-- upvalues: isEligible (copy)
	local List1 = {}
	local v2 = nil
	
	if p2.interacting or p2.reducedMotion then
		return List1, nil
	end
	for i, value in ipairs(List) do
		if Id ~= nil and v2 == nil and value.id == Id then
			v2 = i
		end
		if isEligible(value, i, p2) then
			table.insert(List1, i)
		end
	end
	return List1, v2
end

local _ = function(Entry, TextDirection)
	local CountEntry = #Entry
	
	return if CountEntry == 0 then nil elseif TextDirection == Enum.TextDirection.RightToLeft then Entry[CountEntry] else Entry[1]
end

local function nextIndex(Entry, p3, TextDirection)
	local CountEntry = #Entry
	
	if CountEntry == 0 then
		return nil
	end
	if p3 == nil then
		local CountEntry1 = #Entry
		
		return if CountEntry1 == 0 then nil elseif TextDirection == Enum.TextDirection.RightToLeft then Entry[CountEntry1] else Entry[1]
	end
	if TextDirection == Enum.TextDirection.RightToLeft then
		local Entry1 = nil
		for i = CountEntry, 1, -1 do
			Entry1 = Entry[i]
			
			if Entry1 < p3 then
				return Entry1
			end
		end
		return Entry[CountEntry]
	else
		for _, value in ipairs(Entry) do
			if p3 < value then
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
	recordFinishedLoop = function(p4, Text, Text1)
		local Text2 = Text .. "\0" .. Text1
		local v3 = p4[Text2]
		
		if v3 == nil then
			v3 = 2
		end
		p4[Text2] = v3 - 1
	end,
	reconcileFriendPresence = reconcileFriendPresence,
	reconcilePresence = function(List, List1)
		-- upvalues: Tile (copy), reconcileFriendPresence (copy), PresenceTypes (copy)
		local t = {}
		
		for _, value in ipairs(List1) do
			if value.tileType == Tile.Friend then
				t[value.id] = true
				local Id = value.id
				local v3 = nil
				
				if value.tileType == Tile.Friend then
					local Presence = value.presence
					
					if Presence == nil or Presence.userPresenceType ~= PresenceTypes.InGame then
						v3 = nil
					else
						local LastLocation = Presence.lastLocation
						v3 = if LastLocation == nil or LastLocation == "" then nil else LastLocation
					end
				else
					v3 = nil
				end
				reconcileFriendPresence(List, Id, v3)
			end
		end
		local List2 = {}
		
		for Text in List do
			local FoundAt: number? = string.find(Text, "\0", 1, true)
			local Segment = if FoundAt == nil then nil else string.sub(Text, 1, FoundAt - 1)
			
			if Segment ~= nil and t[Segment] ~= true then
				table.insert(List2, Text)
			end
		end
		for _, value1 in List2 do
			List[value1] = nil
		end
	end,
	isHoverEligible = function(p4): boolean
		-- upvalues: Tile (copy), PresenceTypes (copy)
		if p4.tileType ~= Tile.Friend then
			return false
		end
		local Presence = p4.presence
		
		if Presence == nil or Presence.userPresenceType ~= PresenceTypes.InGame then
			return false
		else
			local LastLocation = Presence.lastLocation
			
			return LastLocation ~= nil and LastLocation ~= "" and p4.subtitle == LastLocation
		end
	end,
	leadingEligible = function(p4, p5)
		-- upvalues: scanRow (copy)
		local ScanRowResult = scanRow(p4, p5, nil)
		local Direction = p5.direction
		local CountScanRowResult = #ScanRowResult
		local ScanRowResultEntry = if CountScanRowResult == 0 then nil elseif Direction == Enum.TextDirection.RightToLeft then ScanRowResult[CountScanRowResult] else ScanRowResult[1]
		
		return if ScanRowResultEntry == nil then nil else p4[ScanRowResultEntry].id
	end,
	resolveActiveTileId = function(p4, p5, p6)
		-- upvalues: scanRow (copy)
		if p6 ~= nil then
			local ScanRowResult, ScanRowResult2 = scanRow(p4, p5, p6)
			
			if ScanRowResult2 ~= nil and table.find(ScanRowResult, ScanRowResult2) ~= nil then
				return p6
			end
		end
		local ScanRowResult1 = scanRow(p4, p5, nil)
		local Direction = p5.direction
		local CountScanRowResult1 = #ScanRowResult1
		local ScanRowResultEntry = if CountScanRowResult1 == 0 then nil elseif Direction == Enum.TextDirection.RightToLeft then ScanRowResult1[CountScanRowResult1] else ScanRowResult1[1]
		
		return if ScanRowResultEntry == nil then nil else p4[ScanRowResultEntry].id
	end,
	nextEligibleAfter = function(p4, p5, p6)
		-- upvalues: scanRow (copy), nextIndex (copy)
		local ScanRowResult, ScanRowResult2 = scanRow(p4, p6, p5)
		local NextIndexResult = nextIndex(ScanRowResult, ScanRowResult2, p6.direction)
		
		return if NextIndexResult == nil then nil else p4[NextIndexResult].id
	end
}