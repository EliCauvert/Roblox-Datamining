local function parseTimestamp(value)
	if value == "" then
		return nil
	end
	local ok, status = pcall(DateTime.fromIsoDate, value)
	
	return if ok and status ~= nil then status.UnixTimestampMillis else nil
end

local function _(p1, p2)
	return math.max(p2 - p1, 0)
end

local _ = function(p1, p2, p3, p4)
	return p1 + math.min((math.floor(p2 / p3) + 1) * p3, p4)
end

return {
	parseTimestamp = parseTimestamp,
	getRelativeAge = function(p1, p2)
		if p1 == nil then
			return nil
		end
		local maxValue = math.max(p2 - p1, 0)
		
		return if maxValue < 60000 then { unit = "now", count = 0 } elseif maxValue < 3600000 then { unit = "minutes", count = math.floor(maxValue / 60000) } elseif maxValue < 86400000 then { unit = "hours", count = math.floor(maxValue / 3600000) } elseif maxValue < 604800000 then { unit = "days", count = math.floor(maxValue / 86400000) } elseif maxValue < 2592000000 then { unit = "weeks", count = math.floor(maxValue / 604800000) } elseif maxValue < 31536000000 then {
			unit = "months",
			count = math.floor(maxValue / 2592000000)
		} else {
			unit = "years",
			count = math.floor(maxValue / 31536000000)
		}
	end,
	getNextChangeTimestamp = function(p1, p2)
		if p1 == nil then
			return nil
		end
		local maxValue = math.max(p2 - p1, 0)
		
		return if maxValue < 60000 then p1 + 60000 elseif maxValue < 3600000 then p1 + math.min((math.floor(maxValue / 60000) + 1) * 60000, 3600000) elseif maxValue < 86400000 then p1 + math.min((math.floor(maxValue / 3600000) + 1) * 3600000, 86400000) elseif maxValue < 604800000 then p1 + math.min((math.floor(maxValue / 86400000) + 1) * 86400000, 604800000) elseif maxValue < 2592000000 then p1 + math.min((math.floor(maxValue / 604800000) + 1) * 604800000, 2592000000) elseif maxValue < 31536000000 then p1 + math.min((math.floor(maxValue / 2592000000) + 1) * 2592000000, 31536000000) else p1 + math.min((math.floor(maxValue / 31536000000) + 1) * 31536000000, 1e999)
	end
}