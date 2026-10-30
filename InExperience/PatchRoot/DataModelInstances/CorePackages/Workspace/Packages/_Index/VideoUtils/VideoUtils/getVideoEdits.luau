local function _(p1: number): boolean
	return type(p1) == "number" and p1 >= 0 and p1 < 1e999
end

local _ = function(p1): boolean
	return p1 == nil or (p1 == "" or p1 == 0)
end

return {
	getVideoEdits = function(p1)
		local Trim = nil
		local TrimStartTime = p1.trimStartTime
		repeat
			if TrimStartTime == nil or (TrimStartTime == "" or TrimStartTime == 0) then
				local TrimEndTime = p1.trimEndTime
				
				if TrimEndTime == nil or (TrimEndTime == "" or TrimEndTime == 0) then break end
			end
			local TrimStartTime1: number = p1.trimStartTime
			
			if type(TrimStartTime1) == "number" and (TrimStartTime1 >= 0 and TrimStartTime1 < 1e999) then
				local TrimEndTime: number = p1.trimEndTime
				
				if type(TrimEndTime) == "number" and (TrimEndTime >= 0 and TrimEndTime < 1e999) then
					local TrimStartTime2 = p1.trimStartTime
					local TrimEndTime1 = p1.trimEndTime
					
					if TrimEndTime1 <= TrimStartTime2 then
						return nil, false
					end
					Trim = { startTime = TrimStartTime2, endTime = TrimEndTime1 }
				end
			end
			return nil, false
		until true
		local Music = nil
		local MusicAssetId = p1.musicAssetId
		repeat
			if MusicAssetId == nil or (MusicAssetId == "" or MusicAssetId == 0) then
				local MusicStartTime = p1.musicStartTime
				
				if MusicStartTime == nil or (MusicStartTime == "" or MusicStartTime == 0) then break end
			end
			local MusicAssetId1: string = p1.musicAssetId
			local MusicStartTime = if p1.musicStartTime == nil then 0 else p1.musicStartTime
			
			if type(MusicAssetId1) ~= "string" or string.match(MusicAssetId1, "^%d+$") == nil or (tonumber(MusicAssetId1) or 0) <= 0 or (tonumber(MusicAssetId1) or 0) == 1e999 or (type(MusicStartTime) ~= "number" or (MusicStartTime < 0 or MusicStartTime >= 1e999)) then
				return nil, false
			end
			Music = { assetId = MusicAssetId1, startTime = MusicStartTime }
		until true
		return if Trim == nil and Music == nil then nil else { trim = Trim, music = Music }, true
	end,
	getPlaybackRange = function(p1: number, p2)
		local Smallest: number = if p2 then math.min(p2.startTime, p1) else 0
		
		if p2 then
			return Smallest, (math.min(p2.endTime, p1))
		else
			return Smallest, p1
		end
	end
}