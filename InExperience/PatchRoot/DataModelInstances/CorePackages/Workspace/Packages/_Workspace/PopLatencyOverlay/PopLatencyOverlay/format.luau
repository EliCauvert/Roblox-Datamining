local list = {
	" ", "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█"
}
local _Color3 = Color3.fromRGB(70, 180, 200)
local _Color3_1 = Color3.fromRGB(255, 255, 255)
local _Color3_2 = Color3.fromRGB(140, 140, 150)
local _Color3_3 = Color3.fromRGB(200, 200, 220)
local _Color3_4 = Color3.fromRGB(80, 220, 100)
local _Color3_5 = Color3.fromRGB(220, 200, 80)
local _Color3_6 = Color3.fromRGB(220, 80, 80)
local _Color3_7 = Color3.fromRGB(110, 110, 120)

local function _(p1): string
	return string.format("rgb(%d,%d,%d)", math.floor(p1.R * 255), math.floor(p1.G * 255), (math.floor(p1.B * 255)))
end

local function colorTag(p1, Repeated): string
	return string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(p1.R * 255), math.floor(p1.G * 255), (math.floor(p1.B * 255))), Repeated)
end

local _ = function(Count: number): string
	return "<font transparency=\"1\">" .. string.rep("█", Count) .. "</font>"
end

local _ = function(Count: number, p1): string
	-- upvalues: _Color3_7 (copy)
	return if p1 then "<font transparency=\"1\">" .. string.rep("█", Count) .. "</font>" else string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_7.R * 255), math.floor(_Color3_7.G * 255), (math.floor(_Color3_7.B * 255))), (string.rep(" ", Count)))
end

local function bar(Sort: number)
	-- upvalues: colorTag (copy), _Color3_7 (copy), _Color3_4 (copy), _Color3_5 (copy), _Color3_6 (copy)
	if Sort < 0 then
		return colorTag(_Color3_7, string.rep("░", 18))
	else
		local Largest = math.max(1, (math.min(18, (math.floor(math.min(Sort / 300, 1) * 18 + 0.5)))))
		local Color = if Sort < 0 then _Color3_7 elseif Sort < 30 then _Color3_4 elseif Sort < 80 then _Color3_5 else _Color3_6
		
		return string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(Color.R * 255), math.floor(Color.G * 255), (math.floor(Color.B * 255))), (string.rep("█", Largest))) .. string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_7.R * 255), math.floor(_Color3_7.G * 255), (math.floor(_Color3_7.B * 255))), (string.rep("▒", 18 - Largest)))
	end
end

local function sparkline(List, p1): string
	-- upvalues: _Color3_7 (copy), colorTag (copy), list (copy), _Color3_4 (copy), _Color3_5 (copy), _Color3_6 (copy)
	if not List or #List == 0 then
		return if p1 then "<font transparency=\"1\">" .. string.rep("█", 12) .. "</font>" else string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_7.R * 255), math.floor(_Color3_7.G * 255), (math.floor(_Color3_7.B * 255))), (string.rep(" ", 12)))
	end
	local v1 = 1
	
	for _, value in ipairs(List) do
		if value >= 0 and v1 < value then
			v1 = value
		end
	end
	local Count = 12 - #List
	local List1 = {}
	
	if Count > 0 then
		table.insert(List1, if p1 then "<font transparency=\"1\">" .. string.rep("█", Count) .. "</font>" else string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_7.R * 255), math.floor(_Color3_7.G * 255), (math.floor(_Color3_7.B * 255))), (string.rep(" ", Count))))
	end
	for _, value1 in ipairs(List) do
		if value1 < 0 then
			table.insert(List1, colorTag(_Color3_7, if p1 then "░" else "×"))
			continue
		end
		local Smallest = math.min(#list, (math.max(1, (math.floor(value1 / v1 * (#list - 1) + 1)))))
		local Formatted = nil
		
		if Smallest == 1 and p1 then
			Formatted = "<font transparency=\"1\">" .. string.rep("█", 1) .. "</font>"
		else
			local Color = if value1 < 0 then _Color3_7 elseif value1 < 30 then _Color3_4 elseif value1 < 80 then _Color3_5 else _Color3_6
			Formatted = string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(Color.R * 255), math.floor(Color.G * 255), (math.floor(Color.B * 255))), list[Smallest])
		end
		table.insert(List1, Formatted)
	end
	return table.concat(List1)
end

local function committedHistory(History)
	local v2: number? = nil
	
	for i = 1, #History do
		local HistoryEntry: number = History[i]
		
		if not HistoryEntry or HistoryEntry < 0 then
			continue
		end
		v2 = i
		break
	end
	if not v2 then
		return {}
	end
	local t = {}
	
	for i1 = v2, #History do
		t[#t + 1] = History[i1]
	end
	return t
end

local function historyStats(List)
	local Count = 0
	local Total = 0
	local Count1 = 0
	
	for _, value in ipairs(List) do
		if value < 0 then
			Count += 1
		else
			Total += value
			Count1 += 1
		end
	end
	local SquareRoot = 0
	
	if Count1 >= 2 then
		local TotalRatio = Total / Count1
		local Total1 = 0
		
		for _, value1 in ipairs(List) do
			if value1 >= 0 then
				Total1 += (value1 - TotalRatio) * (value1 - TotalRatio)
			end
		end
		SquareRoot = math.sqrt(Total1 / Count1)
	end
	return #List, Count, SquareRoot
end

local function historyMedian(Amounts)
	local List = {}
	
	for _, amount in ipairs(Amounts) do
		if amount >= 0 then
			List[#List + 1] = amount
		end
	end
	if #List == 0 then
		return nil
	else
		table.sort(List)
		local CountList = #List
		
		return if CountList % 2 == 1 then List[(CountList + 1) // 2] else (List[CountList // 2] + List[CountList // 2 + 1]) / 2
	end
end

local function statsCell(Amounts)
	-- upvalues: historyStats (copy), colorTag (copy), _Color3_7 (copy), _Color3_4 (copy), _Color3_6 (copy), _Color3_5 (copy)
	local HistoryStatsResult, HistoryStatsResult2, HistoryStatsResult3 = historyStats(Amounts)
	
	if HistoryStatsResult == 0 then
		return colorTag(_Color3_7, (string.format("%-" .. 11 .. "s", "—"):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")))
	else
		local Floored = math.floor(HistoryStatsResult2 / HistoryStatsResult * 100 + 0.5)
		
		return colorTag(HistoryStatsResult2 == 0 and _Color3_4 or (Floored >= 25 and _Color3_6 or _Color3_5), (string.format("%-" .. 11 .. "s", (string.format("%d%% ±%dms", Floored, (math.floor(HistoryStatsResult3 + 0.5))))):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")))
	end
end

local function rttCell(RttMs: number)
	-- upvalues: colorTag (copy), _Color3_7 (copy), _Color3_4 (copy), _Color3_5 (copy), _Color3_6 (copy)
	return if RttMs and RttMs >= 0 then colorTag(if RttMs < 0 then _Color3_7 elseif RttMs < 30 then _Color3_4 elseif RttMs < 80 then _Color3_5 else _Color3_6, (string.format("%" .. 8 .. "s", string.format("%.1fms", RttMs)):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"))) else colorTag(_Color3_7, string.rep(" ", 7) .. "—")
end

local _ = function()
	-- upvalues: colorTag (copy), _Color3_7 (copy)
	return colorTag(_Color3_7, (string.format("%" .. 8 .. "s", "timeout"):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")))
end

local function formatInterval(p2: number): string
	if not p2 or p2 <= 0 then
		return "?"
	end
	local Floored = math.floor(p2 / 1000 + 0.5)
	
	if Floored < 60 then
		return string.format("%ds", Floored)
	else
		local Value = Floored / 60
		
		return if Value == math.floor(Value) then string.format("%dm", Value) else string.format("%.1fm", Value)
	end
end

local function formatElapsed(Value: number): string
	local Largest = math.max(0, (math.floor(Value)))
	
	return string.format("%d:%02d:%02d", math.floor(Largest / 3600), math.floor(Largest % 3600 / 60), Largest % 60)
end

local function formatIp(Text: string): string
	local List = {}
	
	for i in Text:gmatch("[^.]+") do
		table.insert(List, string.format("%3s", i))
	end
	return table.concat(List, ".")
end

local function separator(p2)
	-- upvalues: colorTag (copy), _Color3 (copy)
	return colorTag(_Color3, string.rep("─", p2 or 96))
end

local function vipCell(Text: string, Number: number, p2, p3)
	-- upvalues: formatIp (copy), colorTag (copy), _Color3_2 (copy)
	local P21 = p3 or 20
	local Text1 = ":" .. tostring(Number and Number > 0 and Number or 3478)
	local Text2 = nil
	
	if p2 then
		local PDelta = P21 - #Text1 - 2
		
		if #Text <= PDelta then
			Text2 = "[" .. Text .. "]" .. Text1
		else
			local PDeltaDelta = PDelta - 1
			local Ceiled = math.ceil(PDeltaDelta / 2)
			local Segment = Text:sub(1, Ceiled)
			local Segment1: string = Text:sub(#Text - (PDeltaDelta - Ceiled) + 1)
			local v3 = Segment:match("^(.*:)[^:]*$")
			
			if v3 and #Segment <= #v3 * 2 then
				Segment = v3
			end
			local v4: string? = Segment1:match("^[^:]*(:.*)$")
			
			if v4 and #Segment1 <= #v4 * 2 then
				Segment1 = v4
			end
			Text2 = "[" .. Segment .. "~" .. Segment1 .. "]" .. Text1
		end
	else
		Text2 = formatIp(Text) .. Text1
	end
	return colorTag(_Color3_2, ((Text2 .. string.rep(" ", (math.max(0, P21 - (utf8.len(Text2) or #Text2))))):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")))
end

local Text = "    └ v6" .. string.rep(" ", 6)
local Text1 = "    └ v6 dbg" .. string.rep(" ", 2)

local _ = function(p2, p3): string
	-- upvalues: _Color3_4 (copy), _Color3_6 (copy)
	if p2 and p3 then
		local v3 = p2 - p3
		local _Color3_4_1 = v3 <= 0 and _Color3_4 or _Color3_6
		
		return "   " .. string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_4_1.R * 255), math.floor(_Color3_4_1.G * 255), (math.floor(_Color3_4_1.B * 255))), (string.format("Δ %+.1fms", v3):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")))
	else
		return ""
	end
end

local function renderIpv6Row(p2, Med, p3): string
	-- upvalues: committedHistory (copy), historyMedian (copy), rttCell (copy), _Color3_7 (copy), _Color3_2 (copy), Text1 (copy), Text (copy), statsCell (copy), vipCell (copy), bar (copy), sparkline (copy), _Color3_4 (copy), _Color3_6 (copy)
	local CommittedHistoryResult = committedHistory(p2.history or {})
	local IsRttMsAbove: boolean = p2.rttMs ~= nil and p2.rttMs >= 0
	local HistoryMedianResult = IsRttMsAbove and historyMedian(CommittedHistoryResult) or nil
	local v3 = nil
	
	if IsRttMsAbove then
		local Total = 0
		local Count = 0
		
		for _, value in ipairs(CommittedHistoryResult) do
			if value >= 0 then
				Total += value
				Count += 1
			end
		end
		v3 = (if Count == 0 then nil else Total / Count) or nil
	else
		v3 = nil
	end
	local RttCellResult = IsRttMsAbove and rttCell(p2.rttMs) or string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_7.R * 255), math.floor(_Color3_7.G * 255), (math.floor(_Color3_7.B * 255))), (string.format("%" .. 8 .. "s", "timeout"):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")))
	local Formatted = string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_2.R * 255), math.floor(_Color3_2.G * 255), (math.floor(_Color3_2.B * 255))), p2.debug and Text1 or Text)
	local RttCellResult1 = rttCell(HistoryMedianResult)
	local v4 = " "
	local RttCellResult2 = rttCell(v3)
	local v5 = " "
	local v6 = "   "
	local StatsCellResult = statsCell(CommittedHistoryResult)
	local v7 = "   "
	local VipCellResult = vipCell(tostring(p2.ipString or "?"), tonumber(p2.port), true, p3)
	local v8 = "   "
	local BarResult = bar(HistoryMedianResult or -1)
	local v9 = "   "
	local SparklineResult = sparkline(CommittedHistoryResult, true)
	local v10 = nil
	
	if HistoryMedianResult and Med then
		local HistoryMedianResultDelta = HistoryMedianResult - Med
		local _Color3_4_1 = HistoryMedianResultDelta <= 0 and _Color3_4 or _Color3_6
		v10 = "   " .. string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_4_1.R * 255), math.floor(_Color3_4_1.G * 255), (math.floor(_Color3_4_1.B * 255))), (string.format("Δ %+.1fms", HistoryMedianResultDelta):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")))
	else
		v10 = ""
	end
	return Formatted .. RttCellResult1 .. v4 .. RttCellResult2 .. v5 .. RttCellResult .. v6 .. StatsCellResult .. v7 .. VipCellResult .. v8 .. BarResult .. v9 .. SparklineResult .. v10
end

local function renderPopRows(List, p4, Formatted, p5, p6, p7)
	-- upvalues: _Color3_1 (copy), _Color3_2 (copy), rttCell (copy), _Color3_7 (copy), statsCell (copy), formatIp (copy), bar (copy), sparkline (copy), renderIpv6Row (copy)
	local Text = tostring(p4.ipString or "—")
	local _Color3_1_1 = p5 and _Color3_1 or _Color3_2
	local Formatted1 = string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_1_1.R * 255), math.floor(_Color3_1_1.G * 255), (math.floor(_Color3_1_1.B * 255))), (string.format("%-10s", (tostring(p4.popCode or "?"))):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")))
	local RttCellResult = rttCell(p5 and p4.__med or nil)
	local RttCellResult1 = rttCell(p5 and p4.__avg or nil)
	local RttCellResult2 = p5 and rttCell(p4.rttMs) or string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_7.R * 255), math.floor(_Color3_7.G * 255), (math.floor(_Color3_7.B * 255))), (string.format("%" .. 8 .. "s", "timeout"):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")))
	local StatsCellResult = statsCell(p4.__hist)
	local Number: number? = tonumber(p4.port)
	local P30 = p6 or 20
	local Text1 = formatIp(Text) .. (":" .. tostring(Number and Number > 0 and Number or 3478))
	table.insert(List, Formatted .. " " .. Formatted1 .. RttCellResult .. " " .. RttCellResult1 .. " " .. RttCellResult2 .. "   " .. StatsCellResult .. "   " .. string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_2.R * 255), math.floor(_Color3_2.G * 255), (math.floor(_Color3_2.B * 255))), ((Text1 .. string.rep(" ", (math.max(0, P30 - (utf8.len(Text1) or #Text1))))):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"))) .. "   " .. bar(p5 and p4.__sort or -1) .. "   " .. sparkline(p4.__hist, p7))
	
	if p4.v6 then
		table.insert(List, (renderIpv6Row(p4.v6, p5 and p4.__med or nil, p6)))
	end
end

local function prepareRows(List)
	-- upvalues: committedHistory (copy), historyMedian (copy)
	local List1 = {}
	local List2 = {}
	
	for _, value in ipairs(List) do
		value.__hist = committedHistory(value.history or {})
		
		if not value.rttMs or value.rttMs < 0 then
			table.insert(List2, value)
			continue
		end
		value.__med = historyMedian(value.__hist)
		local Total = 0
		local Count = 0
		
		for _, value1 in ipairs(value.__hist) do
			if value1 >= 0 then
				Total += value1
				Count += 1
			end
		end
		value.__avg = if Count == 0 then nil else Total / Count
		value.__sort = value.__med or value.rttMs
		table.insert(List1, value)
	end
	table.sort(List1, function(A, B): boolean
		return A.__sort < B.__sort
	end)
	table.sort(List2, function(A, B): boolean
		return tostring(A.popCode) < tostring(B.popCode)
	end)
	
	return List1, List2
end

local _ = function(List): boolean
	for _, value in ipairs(List) do
		if value.ipv6Enabled then
			return true
		end
	end
	return false
end

return {
	POLL_INTERVAL_SECONDS = 1,
	HISTORY_LEN = 12,
	TEXT_SIZE = 14,
	SEP_WIDTH = 96,
	COLOR_BG = Color3.fromRGB(14, 14, 18),
	COLOR_BORDER = _Color3,
	COLOR_HEADER = _Color3_3,
	COLOR_DIM = _Color3_2,
	COLOR_CLOSE = Color3.fromRGB(220, 90, 90),
	COLOR_RED = _Color3_6,
	rttColor = function(p4: number)
		-- upvalues: _Color3_7 (copy), _Color3_4 (copy), _Color3_5 (copy), _Color3_6 (copy)
		return if p4 < 0 then _Color3_7 elseif p4 < 30 then _Color3_4 elseif p4 < 80 then _Color3_5 else _Color3_6
	end,
	colorTag = colorTag,
	escapeRich = function(Text: string)
		return (Text:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"))
	end,
	bar = bar,
	sparkline = sparkline,
	rttCell = rttCell,
	formatIp = formatIp,
	vipCell = vipCell,
	separator = separator,
	formatInterval = formatInterval,
	formatElapsed = formatElapsed,
	committedHistory = committedHistory,
	historyStats = historyStats,
	historyMedian = historyMedian,
	historyMean = function(Amounts)
		local Total = 0
		local Count = 0
		
		for _, amount in ipairs(Amounts) do
			if amount >= 0 then
				Total += amount
				Count += 1
			end
		end
		return if Count == 0 then nil else Total / Count
	end,
	renderSnapshot = function(List, p4, p5, p6: number): string
		-- upvalues: prepareRows (copy), formatInterval (copy), formatElapsed (copy), _Color3_1 (copy), _Color3_2 (copy), separator (copy), colorTag (copy), _Color3_3 (copy), renderPopRows (copy), _Color3_7 (copy), _Color3_4 (copy), _Color3_6 (copy), _Color3_5 (copy)
		local t = {}
		local t1 = {}
		
		for _, value in ipairs(List) do
			table.insert(value.debug and t1 or t, value)
		end
		local PrepareRowsResult, PrepareRowsResult2 = prepareRows(t)
		local PrepareRowsResult1, PrepareRowsResult2_1 = prepareRows(t1)
		local Flag = false
		
		for _, value1 in ipairs(List) do
			if value1.v6 then
				Flag = true
				break
			end
		end
		local v11: number = if Flag then 107 else 96
		local v12 = 20
		
		for _, value2 in ipairs(List) do
			if Flag or (tonumber(value2.port) or 0) >= 10000 then
				v12 = 21
				break
			end
		end
		local List1 = {}
		local v13 = 0
		
		for _, value3 in ipairs(List) do
			local LastSampleEpochMs = value3.lastSampleEpochMs or 0
			
			if v13 < LastSampleEpochMs then
				v13 = LastSampleEpochMs
			end
		end
		local Formatted = string.format("probe #%d   every %s%s   up %s", p4, formatInterval(p6), if v13 > 0 and p6 and p6 > 0 then string.format("   next %ds", (math.max(0, (math.floor((v13 + p6 - os.time() * 1000) / 1000 + 0.5))))) else "", formatElapsed(p5))
		local Flag1 = false
		
		for _, value4 in ipairs(List) do
			if value4.ipv6Enabled then
				Flag1 = true
				break
			end
		end
		local EngineV6Enabled: string = if Flag1 then "[engine] [v6 enabled]" else "[engine]"
		local Count = v11 - #("Roblox TURN/STUN UDP Latency Monitor " .. EngineV6Enabled .. "   " .. Formatted)
		
		if Count < 3 then
			Count = 3
		end
		table.insert(List1, string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_1.R * 255), math.floor(_Color3_1.G * 255), (math.floor(_Color3_1.B * 255))), "Roblox TURN/STUN UDP Latency Monitor") .. " " .. string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_2.R * 255), math.floor(_Color3_2.G * 255), (math.floor(_Color3_2.B * 255))), EngineV6Enabled) .. string.rep(" ", Count) .. string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_2.R * 255), math.floor(_Color3_2.G * 255), (math.floor(_Color3_2.B * 255))), Formatted))
		table.insert(List1, separator(v11))
		local Text = "%" .. 8 .. "s"
		table.insert(List1, colorTag(_Color3_3, string.format("%-3s %-10s" .. Text .. " " .. Text .. " " .. Text .. "   " .. ("%-" .. 11 .. "s") .. "   " .. ("%-" .. v12 .. "s") .. "   ", "#", "PoP", "Med RTT", "Avg RTT", "Last RTT", "Loss/Jit", "TURN VIP"):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;") .. "Bar" .. (if Flag1 then "<font transparency=\"1\">" .. string.rep("█", 15) .. "</font>" else string.rep(" ", 15)) .. "   Trend" .. (if Flag then ("<font transparency=\"1\">" .. string.rep("█", 7) .. "</font>") .. "   Δ v6" else "")))
		table.insert(List1, separator(v11))
		local Count1 = 1
		
		for _, value7 in ipairs(PrepareRowsResult) do
			renderPopRows(List1, value7, string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_2.R * 255), math.floor(_Color3_2.G * 255), (math.floor(_Color3_2.B * 255))), (string.format("%2d.", Count1):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"))), true, v12, Flag1)
			Count1 += 1
		end
		for _, value8 in ipairs(PrepareRowsResult2) do
			renderPopRows(List1, value8, string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_7.R * 255), math.floor(_Color3_7.G * 255), (math.floor(_Color3_7.B * 255))), " — "), false, v12, Flag1)
		end
		if #t1 > 0 then
			table.insert(List1, colorTag(_Color3_2, (("debug — public STUN servers, not Roblox PoPs"):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"))))
			
			for _, value9 in ipairs(PrepareRowsResult1) do
				renderPopRows(List1, value9, string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_2.R * 255), math.floor(_Color3_2.G * 255), (math.floor(_Color3_2.B * 255))), " · "), true, v12, Flag1)
			end
			for _, value10 in ipairs(PrepareRowsResult2_1) do
				renderPopRows(List1, value10, string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_7.R * 255), math.floor(_Color3_7.G * 255), (math.floor(_Color3_7.B * 255))), " — "), false, v12, Flag1)
			end
		end
		table.insert(List1, separator(v11))
		local v14 = 0
		local NewSort = 0
		local v15: string? = nil
		local v16: number? = nil
		local Text1: string? = nil
		local Sort: number? = nil
		
		for _, value6 in ipairs(PrepareRowsResult) do
			v14 += 1
			local Sort1: number = value6.__sort
			NewSort += Sort1
			
			if not v16 or Sort1 < v16 then
				v16 = Sort1
				v15 = tostring(value6.popCode)
			end
			if not Sort or Sort < Sort1 then
				Sort = Sort1
				Text1 = tostring(value6.popCode)
			end
		end
		local NewSortRatio: number = v14 > 0 and NewSort / v14 or 0
		local CountPrepareRowsResult2 = #PrepareRowsResult2
		local List2 = {}
		
		if v15 then
			table.insert(List2, "best " .. string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_4.R * 255), math.floor(_Color3_4.G * 255), (math.floor(_Color3_4.B * 255))), (string.format("%s %.1fms", v15, v16))))
		end
		if Text1 then
			table.insert(List2, "worst " .. string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_6.R * 255), math.floor(_Color3_6.G * 255), (math.floor(_Color3_6.B * 255))), (string.format("%s %.1fms", Text1, Sort))))
		end
		if v14 > 0 then
			table.insert(List2, "avg " .. string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_5.R * 255), math.floor(_Color3_5.G * 255), (math.floor(_Color3_5.B * 255))), (string.format("%.1fms", NewSortRatio))))
		end
		table.insert(List2, string.format("%d ok   ", v14) .. string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_7.R * 255), math.floor(_Color3_7.G * 255), (math.floor(_Color3_7.B * 255))), (string.format("%d timeout", CountPrepareRowsResult2))))
		local Count2 = 0
		local v17 = 0
		
		for _, value5 in ipairs(t) do
			if value5.v6 and not value5.v6.debug then
				Count2 += 1
				
				if value5.v6.rttMs and value5.v6.rttMs >= 0 then
					v17 += 1
				end
			end
		end
		if Count2 > 0 then
			local _Color3_4_1 = v17 > 0 and _Color3_4 or _Color3_6
			table.insert(List2, "v6 " .. string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_4_1.R * 255), math.floor(_Color3_4_1.G * 255), (math.floor(_Color3_4_1.B * 255))), (string.format("%d/%d ok", v17, Count2))))
		end
		table.insert(List1, (table.concat(List2, "   │   ")))
		
		return table.concat(List1, "\n")
	end
}