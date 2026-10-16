local function _(p1, p2): number --[[ Line: 22 | Named "getAgeMilliseconds" ]]
	return (math.max(p2 - p1, 0))
end

local _ = function(p1, p2, p3, p4: number): number --[[ Line: 55 | Named "getNextBucketBoundary" ]]
	return p1 + math.min((math.floor(p2 / p3) + 1) * p3, p4)
end

return {
	parseTimestamp = function(p1) --[[ Line: 9 ]]
		if p1 == "" then
			return nil
		else
			local Success, Result = pcall(DateTime.fromIsoDate, p1)
			
			return if Success and Result ~= nil then Result.UnixTimestampMillis else nil
		end
	end,
	getRelativeAge = function(p1, p2) --[[ Line: 33 ]]
		if p1 == nil then
			return nil
		else
			local Largest = math.max(p2 - p1, 0)
			
			return if Largest < 60000 then { unit = "now", count = 0 } elseif Largest < 3600000 then { unit = "minutes", count = math.floor(Largest / 60000) } elseif Largest < 86400000 then { unit = "hours", count = math.floor(Largest / 3600000) } elseif Largest < 604800000 then { unit = "days", count = math.floor(Largest / 86400000) } elseif Largest < 2592000000 then { unit = "weeks", count = math.floor(Largest / 604800000) } elseif Largest < 31536000000 then {
				unit = "months",
				count = math.floor(Largest / 2592000000)
			} else {
				unit = "years",
				count = math.floor(Largest / 31536000000)
			}
		end
	end,
	getNextChangeTimestamp = function(p1: number, p2: number): number? --[[ Line: 65 ]]
		if p1 == nil then
			return nil
		else
			local Largest = math.max(p2 - p1, 0)
			
			return if Largest < 60000 then p1 + 60000 elseif Largest < 3600000 then p1 + math.min((math.floor(Largest / 60000) + 1) * 60000, 3600000) elseif Largest < 86400000 then p1 + math.min((math.floor(Largest / 3600000) + 1) * 3600000, 86400000) elseif Largest < 604800000 then p1 + math.min((math.floor(Largest / 86400000) + 1) * 86400000, 604800000) elseif Largest < 2592000000 then p1 + math.min((math.floor(Largest / 604800000) + 1) * 604800000, 2592000000) elseif Largest < 31536000000 then p1 + math.min((math.floor(Largest / 2592000000) + 1) * 2592000000, 31536000000) else p1 + math.min((math.floor(Largest / 31536000000) + 1) * 31536000000, 1e999)
		end
	end
}