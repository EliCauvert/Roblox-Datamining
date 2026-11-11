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

local function bar(RttMs: number)
	-- upvalues: colorTag (copy), _Color3_7 (copy), _Color3_4 (copy), _Color3_5 (copy), _Color3_6 (copy)
	if RttMs < 0 then
		return colorTag(_Color3_7, string.rep("░", 18))
	else
		local Largest = math.max(1, (math.min(18, (math.floor(math.min(RttMs / 300, 1) * 18 + 0.5)))))
		local Color = if RttMs < 0 then _Color3_7 elseif RttMs < 30 then _Color3_4 elseif RttMs < 80 then _Color3_5 else _Color3_6
		
		return string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(Color.R * 255), math.floor(Color.G * 255), (math.floor(Color.B * 255))), (string.rep("█", Largest))) .. string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_7.R * 255), math.floor(_Color3_7.G * 255), (math.floor(_Color3_7.B * 255))), (string.rep("▒", 18 - Largest)))
	end
end

local function sparkline(List)
	-- upvalues: colorTag (copy), _Color3_7 (copy), list (copy), _Color3_4 (copy), _Color3_5 (copy), _Color3_6 (copy)
	if not List or #List == 0 then
		return colorTag(_Color3_7, string.rep(" ", 12))
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
		table.insert(List1, colorTag(_Color3_7, string.rep(" ", Count)))
	end
	for _, value1 in ipairs(List) do
		if value1 < 0 then
			table.insert(List1, colorTag(_Color3_7, "×"))
		else
			table.insert(List1, colorTag(if value1 < 0 then _Color3_7 elseif value1 < 30 then _Color3_4 elseif value1 < 80 then _Color3_5 else _Color3_6, list[math.min(#list, (math.max(1, (math.floor(value1 / v1 * (#list - 1) + 1)))))]))
		end
	end
	return table.concat(List1)
end

local function formatIp(Text: string): string
	local List = {}
	
	for i in Text:gmatch("[^.]+") do
		table.insert(List, string.format("%3s", i))
	end
	return table.concat(List, ".")
end

local function separator()
	-- upvalues: colorTag (copy), _Color3 (copy)
	return colorTag(_Color3, string.rep("─", 96))
end

return {
	POLL_INTERVAL_SECONDS = 1,
	HISTORY_LEN = 12,
	TEXT_SIZE = 14,
	SEP_WIDTH = 96,
	COLOR_BG = Color3.fromRGB(14, 14, 18),
	COLOR_BORDER = _Color3,
	COLOR_HEADER = _Color3_3,
	COLOR_CLOSE = Color3.fromRGB(220, 90, 90),
	COLOR_RED = _Color3_6,
	rttColor = function(p1: number)
		-- upvalues: _Color3_7 (copy), _Color3_4 (copy), _Color3_5 (copy), _Color3_6 (copy)
		return if p1 < 0 then _Color3_7 elseif p1 < 30 then _Color3_4 elseif p1 < 80 then _Color3_5 else _Color3_6
	end,
	colorTag = colorTag,
	escapeRich = function(Text: string)
		return (Text:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"))
	end,
	bar = bar,
	sparkline = sparkline,
	rttText = function(p1: number)
		-- upvalues: colorTag (copy), _Color3_7 (copy), _Color3_4 (copy), _Color3_5 (copy), _Color3_6 (copy)
		return if p1 < 0 then colorTag(_Color3_7, "  timeout") else colorTag(if p1 < 0 then _Color3_7 elseif p1 < 30 then _Color3_4 elseif p1 < 80 then _Color3_5 else _Color3_6, string.format("%6.1f ms", p1))
	end,
	formatIp = formatIp,
	separator = separator,
	appendHistory = function(p1, Key, p2)
		local List = p1[Key]
		
		if not List then
			List = {}
			p1[Key] = List
		end
		table.insert(List, p2)
		
		if #List > 12 then
			table.remove(List, 1)
		end
	end,
	renderSnapshot = function(List, p1, p2, Value: number): string
		-- upvalues: _Color3_1 (copy), _Color3_2 (copy), separator (copy), colorTag (copy), _Color3_3 (copy), _Color3_7 (copy), _Color3_4 (copy), _Color3_5 (copy), _Color3_6 (copy), bar (copy), sparkline (copy), formatIp (copy)
		local List1 = {}
		local List2 = {}
		
		for _, value in ipairs(List) do
			if value.rttMs and value.rttMs >= 0 then
				table.insert(List1, value)
			else
				table.insert(List2, value)
			end
		end
		table.sort(List1, function(A, B): boolean
			return A.rttMs < B.rttMs
		end)
		table.sort(List2, function(A, B): boolean
			return tostring(A.popCode) < tostring(B.popCode)
		end)
		local List3 = {}
		local Count = 96 - #string.format("Roblox TURN/STUN UDP Latency Monitor [engine]   probe #%d   %ds elapsed", p2, (math.floor(Value)))
		
		if Count < 3 then
			Count = 3
		end
		table.insert(List3, string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_1.R * 255), math.floor(_Color3_1.G * 255), (math.floor(_Color3_1.B * 255))), "Roblox TURN/STUN UDP Latency Monitor") .. " " .. string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_2.R * 255), math.floor(_Color3_2.G * 255), (math.floor(_Color3_2.B * 255))), "[engine]") .. string.rep(" ", Count) .. string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_2.R * 255), math.floor(_Color3_2.G * 255), (math.floor(_Color3_2.B * 255))), (string.format("probe #%d   %ds elapsed", p2, (math.floor(Value))))))
		table.insert(List3, separator())
		table.insert(List3, colorTag(_Color3_3, (string.format("%-3s %-10s%10s   %-18s   %-12s   %s", "#", "PoP", "RTT", "Bar", "Trend", "TURN VIP"):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"))))
		table.insert(List3, separator())
		local Count1 = 1
		
		for _, value3 in ipairs(List1) do
			local RttMs = value3.rttMs or -1
			local Text = tostring(value3.popCode or "?")
			local Text1 = tostring(value3.ipString or "—")
			local Formatted = string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_2.R * 255), math.floor(_Color3_2.G * 255), (math.floor(_Color3_2.B * 255))), (string.format("%2d.", Count1):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")))
			local v2 = " "
			local Formatted1 = string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_1.R * 255), math.floor(_Color3_1.G * 255), (math.floor(_Color3_1.B * 255))), (string.format("%-10s", Text):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")))
			local Formatted2 = nil
			
			if RttMs < 0 then
				Formatted2 = string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_7.R * 255), math.floor(_Color3_7.G * 255), (math.floor(_Color3_7.B * 255))), "  timeout")
			else
				local Color = if RttMs < 0 then _Color3_7 elseif RttMs < 30 then _Color3_4 elseif RttMs < 80 then _Color3_5 else _Color3_6
				Formatted2 = string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(Color.R * 255), math.floor(Color.G * 255), (math.floor(Color.B * 255))), (string.format("%6.1f ms", RttMs)))
			end
			table.insert(List3, Formatted .. v2 .. Formatted1 .. Formatted2 .. "   " .. bar(RttMs) .. "   " .. sparkline(p1[Text]) .. "   " .. string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_2.R * 255), math.floor(_Color3_2.G * 255), (math.floor(_Color3_2.B * 255))), ((formatIp(Text1) .. ":3478"):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"))))
			Count1 += 1
		end
		for _, value4 in ipairs(List2) do
			local Text = tostring(value4.popCode or "?")
			table.insert(List3, string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_7.R * 255), math.floor(_Color3_7.G * 255), (math.floor(_Color3_7.B * 255))), " — ") .. " " .. string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_2.R * 255), math.floor(_Color3_2.G * 255), (math.floor(_Color3_2.B * 255))), (string.format("%-10s", Text):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"))) .. string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_7.R * 255), math.floor(_Color3_7.G * 255), (math.floor(_Color3_7.B * 255))), "  timeout") .. "   " .. string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_7.R * 255), math.floor(_Color3_7.G * 255), (math.floor(_Color3_7.B * 255))), (string.rep("░", 18))) .. "   " .. sparkline(p1[Text]) .. "   " .. string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_2.R * 255), math.floor(_Color3_2.G * 255), (math.floor(_Color3_2.B * 255))), ((formatIp((tostring(value4.ipString or "—"))) .. ":3478"):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"))))
		end
		table.insert(List3, separator())
		local Count2 = 0
		local NewRttMs = 0
		local value2 = nil
		local v3 = nil
		
		for _, value1 in ipairs(List1) do
			Count2 += 1
			NewRttMs += value1.rttMs
			
			if not value2 or value1.rttMs < value2.rttMs then
				value2 = value1
			end
			if not v3 or v3.rttMs < value1.rttMs then
				v3 = value1
			end
		end
		local NewRttMsRatio: number = Count2 > 0 and NewRttMs / Count2 or 0
		local CountList2 = #List2
		local List4 = {}
		
		if value2 then
			table.insert(List4, "best " .. string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_4.R * 255), math.floor(_Color3_4.G * 255), (math.floor(_Color3_4.B * 255))), (string.format("%s %dms", tostring(value2.popCode), (math.floor(value2.rttMs + 0.5))))))
		end
		if v3 then
			table.insert(List4, "worst " .. string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_6.R * 255), math.floor(_Color3_6.G * 255), (math.floor(_Color3_6.B * 255))), (string.format("%s %dms", tostring(v3.popCode), (math.floor(v3.rttMs + 0.5))))))
		end
		if Count2 > 0 then
			table.insert(List4, "avg " .. string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_5.R * 255), math.floor(_Color3_5.G * 255), (math.floor(_Color3_5.B * 255))), (string.format("%dms", (math.floor(NewRttMsRatio + 0.5))))))
		end
		table.insert(List4, string.format("%d ok   ", Count2) .. string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", math.floor(_Color3_7.R * 255), math.floor(_Color3_7.G * 255), (math.floor(_Color3_7.B * 255))), (string.format("%d timeout", CountList2))))
		table.insert(List3, (table.concat(List4, "   │   ")))
		
		return table.concat(List3, "\n")
	end
}