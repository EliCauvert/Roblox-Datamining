local DateTimeEqualityUtilitiesModule = require(script.Parent.DateTimeEqualityUtilities)
local DateTimePickerVariantModule = require(script:FindFirstAncestor("Foundation").Enums.DateTimePickerVariant)
local DateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)

local function parseTimeFromText(Text: string) --[[ Line: 18 ]]
	local S: string = Text:gsub("%s+", "")
	local Match: string? = string.match(S, "^%d%d?:%d%d[AP]M$")
	
	if not string.match(S, "^%d%d:%d%d$") and not Match then
		return nil
	elseif Match then
		local Match1, Match2 = string.match(S, "^(%d%d?):(%d%d)[AP]M$")
		local Number: number? = tonumber(Match1)
		local Number1: number? = tonumber(Match2)
		
		if not Number or not Number1 or Number < 1 or Number > 12 or Number1 < 0 or Number1 > 59 then
			return nil
		elseif string.sub(S, -2) == "PM" and Number ~= 12 then
			return Number + 12, Number1
		elseif string.sub(S, -2) == "AM" and Number == 12 then
			return 0, Number1
		else
			return Number, Number1
		end
	else
		local Match1, Match2_1 = string.match(S, "^(%d%d?):(%d%d)$")
		local Number2: number? = tonumber(Match1)
		local Number3: number? = tonumber(Match2_1)
		
		if Number2 and Number3 and Number2 >= 0 and Number2 <= 23 and Number3 >= 0 and Number3 <= 59 then
			return Number2, Number3
		else
			return nil
		end
	end
end

local function adjustForDaylightSaving(p1) --[[ Line: 68 ]]
	local DateInfo = os.date("*t", p1.UnixTimestamp)
	
	return if DateInfo and DateInfo.isdst then DateTime.fromUnixTimestamp(p1.UnixTimestamp - 3600) else p1
end

local function parseDateTimeFromText(Text: string) --[[ Line: 83 ]]
	-- upvalues: parseTimeFromText (copy), adjustForDaylightSaving (copy)
	local S = nil
	local S2 = nil
	if string.find(Text, ",") then
		S, S2 = Text:match("^([^,]+),%s*(.+)$")
	else
		S = Text
		S2 = "00:00"
	end
	if not S or not S2 then
		return nil
	end
	local S1: string = S:gsub("%s+", "")
	local ParseTimeFromTextResult, ParseTimeFromTextResult2 = parseTimeFromText(S2)
	
	if ParseTimeFromTextResult == nil or ParseTimeFromTextResult2 == nil then
		return nil
	else
		local v1 = S1:find("[/%.%-]")
		local Success, Result = pcall(function() --[[ Line: 105 ]]
			-- upvalues: v1 (copy), S1 (copy), ParseTimeFromTextResult (copy), ParseTimeFromTextResult2 (copy)
			if v1 == 3 then
				local DDDD, DDDD2, DDDD3 = S1:match("^(%d%d)[/%.%-](%d%d)[/%.%-](%d%d%d%d)$")
				
				return DateTime.fromLocalTime(tonumber(DDDD3), tonumber(DDDD), tonumber(DDDD2), ParseTimeFromTextResult, ParseTimeFromTextResult2, 0)
			elseif v1 ~= 5 then
				error("Invalid date format: " .. S1)
				
				return
			else
				local DD, DD2, DD3 = S1:match("^(%d%d%d%d)[/%.%-](%d%d)[/%.%-](%d%d)$")
				
				return DateTime.fromLocalTime(tonumber(DD), tonumber(DD2), tonumber(DD3), ParseTimeFromTextResult, ParseTimeFromTextResult2, 0)
			end
		end)
		
		return if Success and Result then adjustForDaylightSaving(Result) else nil
	end
end

return {
	adjustForDaylightSaving = adjustForDaylightSaving,
	formatInputText = function(p1) --[[ Line: 176 ]]
		-- upvalues: DateTimePickerVariantModule (copy), DateTimeUtilitiesModule (copy)
		local Date = p1.dates[1]
		
		if not Date then
			return ""
		elseif p1.variant == DateTimePickerVariantModule.Dual or p1.variant == DateTimePickerVariantModule.DualWithPresets then
			local Date1 = p1.dates[2]
			
			return `{DateTimeUtilitiesModule.formatLocalTime(Date)} - {if Date1 then DateTimeUtilitiesModule.formatLocalTime(Date1) else ""}`
		else
			return DateTimeUtilitiesModule.formatLocalTime(Date, p1.variant == DateTimePickerVariantModule.SingleWithTime)
		end
	end,
	parseDateTimeFromText = parseDateTimeFromText,
	parseDualInputEndpoints = function(Text: string) --[[ Line: 132 ]]
		-- upvalues: parseDateTimeFromText (copy)
		local v1 = Text:split(" - ")
		local ParseDateTimeFromTextResult = if v1[1] then parseDateTimeFromText((v1[1]:gsub("^%s*(.-)%s*$", "%1"))) else nil
		
		if v1[2] then
			return ParseDateTimeFromTextResult, (parseDateTimeFromText((v1[2]:gsub("^%s*(.-)%s*$", "%1"))))
		else
			return ParseDateTimeFromTextResult, nil
		end
	end,
	parseInputToDraftDates = function(Text: string, p2) --[[ Line: 145 ]]
		-- upvalues: parseDateTimeFromText (copy), DateTimeUtilitiesModule (copy), DateTimeEqualityUtilitiesModule (copy)
		if #Text:split(" - ") ~= 2 then
			return nil
		end
		local v1 = Text:split(" - ")
		local ParseDateTimeFromTextResult = if v1[1] then parseDateTimeFromText((v1[1]:gsub("^%s*(.-)%s*$", "%1"))) else nil
		local ParseDateTimeFromTextResult1 = if v1[2] then parseDateTimeFromText((v1[2]:gsub("^%s*(.-)%s*$", "%1"))) else nil
		
		if not ParseDateTimeFromTextResult or not ParseDateTimeFromTextResult1 then
			return nil
		end
		if DateTimeUtilitiesModule.roundToStartOfDay(ParseDateTimeFromTextResult1) < DateTimeUtilitiesModule.roundToStartOfDay(ParseDateTimeFromTextResult) then
			local EndDate = ParseDateTimeFromTextResult1
			ParseDateTimeFromTextResult1 = ParseDateTimeFromTextResult
			ParseDateTimeFromTextResult = EndDate
		end
		return if p2 and not DateTimeEqualityUtilitiesModule.isRangeWithinSelectableRange({
			startDate = ParseDateTimeFromTextResult,
			endDate = ParseDateTimeFromTextResult1
		}, p2) then nil else {
			ParseDateTimeFromTextResult,
			ParseDateTimeFromTextResult1
		}
	end,
	trimInputText = function(Text: string): string --[[ Line: 124 ]]
		return (Text:gsub("^%s*(.-)%s*$", "%1"))
	end
}