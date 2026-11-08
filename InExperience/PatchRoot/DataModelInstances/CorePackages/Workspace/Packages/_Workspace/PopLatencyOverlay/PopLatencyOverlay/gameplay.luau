local FormatModule = require(script.Parent.format)

local function regionOf(Text: string): string
	return string.upper((string.sub(Text, 1, 3)))
end

local function _(p1)
	-- upvalues: FormatModule (copy)
	return FormatModule.historyMedian(p1)
end

local function pooledHistory(List)
	-- upvalues: FormatModule (copy)
	local Largest = 0
	
	for _, value in List do
		Largest = math.max(Largest, #value)
	end
	local Buffer = table.create(Largest, -1)
	
	for i = 0, Largest - 1 do
		local List1 = {}
		
		for _, value1 in List do
			local v1: number = value1[#value1 - i]
			
			if v1 ~= nil and v1 >= 0 then
				table.insert(List1, v1)
			end
		end
		Buffer[Largest - i] = FormatModule.historyMedian(List1) or -1
	end
	return Buffer
end

local function statsByRegion(List)
	-- upvalues: FormatModule (copy), pooledHistory (copy)
	local t = {}
	local t1 = {}
	
	for _, value in List do
		if typeof(value.popCode) == "string" then
			local Uppered = string.upper((string.sub(value.popCode, 1, 3)))
			t[Uppered] = t[Uppered] or {}
			t1[Uppered] = t1[Uppered] or {}
			local CommittedHistoryResult = FormatModule.committedHistory(value.history or {})
			local Flag = false
			
			for _, value1 in CommittedHistoryResult do
				if value1 >= 0 then
					table.insert(t[Uppered], value1)
					Flag = true
				end
			end
			if not Flag and typeof(value.rttMs) == "number" and value.rttMs >= 0 then
				table.insert(t[Uppered], value.rttMs)
			end
			if #CommittedHistoryResult > 0 then
				table.insert(t1[Uppered], CommittedHistoryResult)
			end
		end
	end
	local t2 = {}
	
	for i, value2 in t do
		local HistoryMedianResult = FormatModule.historyMedian(value2)
		
		if HistoryMedianResult then
			local _, _, HistoryStatsResult3 = FormatModule.historyStats(value2)
			t2[i] = {
				medianMs = HistoryMedianResult,
				jitterMs = if #value2 >= 2 then HistoryStatsResult3 else nil,
				history = pooledHistory(t1[i])
			}
		end
	end
	return t2
end

local _ = function(p1: number)
	-- upvalues: FormatModule (copy)
	return if p1 == nil or p1 < 0 then FormatModule.colorTag(FormatModule.COLOR_RED, "—") else FormatModule.colorTag(FormatModule.rttColor(p1), string.format("%.0f ms", p1))
end

local _ = function(p1)
	-- upvalues: FormatModule (copy)
	return if p1 then FormatModule.colorTag(FormatModule.COLOR_DIM, string.format(" ±%.0f ms jitter", p1)) else ""
end

local function alternatives(List, Uppered)
	local List1 = {}
	
	for Region, value in List do
		if Region ~= Uppered then
			table.insert(List1, {
				region = Region,
				medianMs = value.medianMs,
				jitterMs = value.jitterMs
			})
		end
	end
	table.sort(List1, function(A, B): boolean
		return A.medianMs < B.medianMs
	end)
	while #List1 > 3 do
		table.remove(List1)
	end
	return List1
end

local function dim(PoPREGIONSProbeOnly)
	-- upvalues: FormatModule (copy)
	return FormatModule.colorTag(FormatModule.COLOR_DIM, PoPREGIONSProbeOnly)
end

local Repeated = string.rep(" ", 24)

local _ = function(p1, p2)
	-- upvalues: FormatModule (copy)
	return if p1 and p2 then FormatModule.colorTag(FormatModule.COLOR_DIM, string.format("%+.0f ms", p1 - p2)) else nil
end

local config = { Server = "Server", Automatic = "Client (Automatic)" }

local function addPingLines(List, p1): boolean
	-- upvalues: FormatModule (copy), Repeated (copy)
	local HasClientMs: boolean = p1.lastMs ~= nil and (p1.serverMs ~= nil and p1.clientMs ~= nil)
	local DataMs: number = p1.dataMs
	table.insert(List, "  Data Ping (RCC)       " .. (if DataMs == nil or DataMs < 0 then FormatModule.colorTag(FormatModule.COLOR_RED, "—") else FormatModule.colorTag(FormatModule.rttColor(DataMs), string.format("%.0f ms", DataMs))))
	
	if HasClientMs then
		local LastMs: number = p1.lastMs
		table.insert(List, "  Last ping             " .. (if LastMs == nil or LastMs < 0 then FormatModule.colorTag(FormatModule.COLOR_RED, "—") else FormatModule.colorTag(FormatModule.rttColor(LastMs), string.format("%.0f ms", LastMs))))
		local ServerMs: number = p1.serverMs
		table.insert(List, "    server              " .. (if ServerMs == nil or ServerMs < 0 then FormatModule.colorTag(FormatModule.COLOR_RED, "—") else FormatModule.colorTag(FormatModule.rttColor(ServerMs), string.format("%.0f ms", ServerMs))))
		local ClientMs: number = p1.clientMs
		table.insert(List, "    client              " .. (if ClientMs == nil or ClientMs < 0 then FormatModule.colorTag(FormatModule.COLOR_RED, "—") else FormatModule.colorTag(FormatModule.rttColor(ClientMs), string.format("%.0f ms", ClientMs))))
		local SplitRakMs: number = p1.splitRakMs
		table.insert(List, "    network (RakNet)    " .. (if SplitRakMs == nil or SplitRakMs < 0 then FormatModule.colorTag(FormatModule.COLOR_RED, "—") else FormatModule.colorTag(FormatModule.rttColor(SplitRakMs), string.format("%.0f ms", SplitRakMs))))
		local LastMsDelta = if p1.lastMs and p1.serverMs and p1.clientMs and p1.splitRakMs then p1.lastMs - (p1.serverMs + p1.clientMs + p1.splitRakMs) else nil
		
		if LastMsDelta and LastMsDelta < -10 then
			table.insert(List, "    unaccounted         " .. FormatModule.colorTag(FormatModule.COLOR_DIM, "stages out of sync"))
		elseif LastMsDelta and LastMsDelta > 10 then
			table.insert(List, "    unaccounted         " .. FormatModule.colorTag(FormatModule.COLOR_DIM, (string.format("+%.0f ms", LastMsDelta))))
		end
	end
	if p1.fps and p1.fps > 0 then
		table.insert(List, "  Client frame rate     " .. string.format("%.0f fps", p1.fps) .. FormatModule.colorTag(FormatModule.COLOR_DIM, (string.format(" · %.1f ms/frame", 1000 / p1.fps))))
		
		if p1.worstFrameMs then
			local Formatted = string.format("worst frame %.0f ms", p1.worstFrameMs)
			table.insert(List, Repeated .. (if p1.worstFrameMs >= 100 then FormatModule.colorTag(FormatModule.COLOR_RED, Formatted) else FormatModule.colorTag(FormatModule.COLOR_DIM, Formatted)))
		end
	end
	return HasClientMs
end

local function addProbeLines(List, p1, p2)
	-- upvalues: FormatModule (copy), Repeated (copy)
	local MedianMs = if p2 then p2.medianMs else nil
	local ColorTagResult = if MedianMs == nil or MedianMs < 0 then FormatModule.colorTag(FormatModule.COLOR_RED, "—") else FormatModule.colorTag(FormatModule.rttColor(MedianMs), string.format("%.0f ms", MedianMs))
	local JitterMs = if p2 then p2.jitterMs else nil
	table.insert(List, "  PoP probe             " .. ColorTagResult .. (if JitterMs then FormatModule.colorTag(FormatModule.COLOR_DIM, string.format(" ±%.0f ms jitter", JitterMs)) else ""))
	
	if p2 and #p2.history > 0 then
		table.insert(List, Repeated .. FormatModule.sparkline(p2.history))
	end
	if p1.probeIntervalMs and p1.probeIntervalMs > 0 then
		local ProbeTargets = p1.probeTargets or {}
		table.insert(List, string.format("  Probe rate            %.0f/s", 1000 / p1.probeIntervalMs) .. FormatModule.colorTag(FormatModule.COLOR_DIM, (string.format(" · every %.0f ms · %d PoP%s", p1.probeIntervalMs, #ProbeTargets, if #ProbeTargets == 1 then "" else "s"))))
	end
	if p1.probeDown then
		table.insert(List, "  Probe loss (1 s)      " .. FormatModule.colorTag(FormatModule.COLOR_DIM, "no replies · probe server may be draining"))
		
		return
	end
	if p1.probeLoss then
		local Formatted = string.format("%.0f %%", p1.probeLoss * 100)
		local ProbeSilentPops = p1.probeSilentPops
		table.insert(List, "  Probe loss (1 s)      " .. (if p1.probeLoss > 0 then FormatModule.colorTag(FormatModule.COLOR_RED, Formatted) else Formatted) .. FormatModule.colorTag(FormatModule.COLOR_DIM, if ProbeSilentPops and #ProbeSilentPops > 0 then " · " .. FormatModule.escapeRich(table.concat(ProbeSilentPops, ", ")) .. " not answering" else " · your link to the edge"))
	end
end

local function addPeerLines(List, p1)
	-- upvalues: FormatModule (copy)
	if p1.peerStatsInvalid then
		table.insert(List, "  RakNet peer stats     " .. FormatModule.colorTag(FormatModule.COLOR_DIM, "unavailable"))
	end
	if p1.loss then
		local Formatted = string.format("%.1f %%", p1.loss * 100)
		table.insert(List, "  Packet loss           " .. (if p1.loss >= 0.01 then FormatModule.colorTag(FormatModule.COLOR_RED, Formatted) else Formatted))
	end
	if p1.resendMsgs then
		table.insert(List, string.format("  Resend queue          %d %s%s", p1.resendMsgs, if p1.resendMsgs == 1 then "msg" else "msgs", if p1.resendBytes then FormatModule.colorTag(FormatModule.COLOR_DIM, (string.format(" · %.1f KB", p1.resendBytes / 1024))) else ""))
	end
	if p1.sendKbps or p1.receiveKbps then
		table.insert(List, string.format("  Bandwidth             ↑ %.0f kB/s · ↓ %.0f kB/s", p1.sendKbps or 0, p1.receiveKbps or 0))
	end
	if p1.congested ~= nil then
		table.insert(List, "  Congestion limited    " .. (if p1.congested then FormatModule.colorTag(FormatModule.COLOR_RED, "<b>YES</b>") else "no"))
	end
end

local function locationText(p1, Uppered)
	-- upvalues: FormatModule (copy)
	return if p1 == nil then "Connecting…" elseif p1.localServer == true then "LOCAL RCC" .. FormatModule.colorTag(FormatModule.COLOR_DIM, " · this machine, region not applicable") elseif Uppered then FormatModule.escapeRich(if p1.popCode then string.upper(p1.popCode) else Uppered) else FormatModule.escapeRich(string.format("unknown location (DC %s)", (tostring(p1.dataCenterId or "?"))))
end

return {
	render = function(p1, p2, p3, p4): string
		-- upvalues: statsByRegion (copy), dim (copy), locationText (copy), FormatModule (copy), config (copy), addPingLines (copy), addProbeLines (copy), addPeerLines (copy), alternatives (copy)
		local StatsByRegionResult = statsByRegion(p2)
		local Uppered = if p1 == nil or p1.localServer then nil elseif p1.popCode then string.upper((string.sub(p1.popCode, 1, 3))) else nil
		local StatsByRegionResultEntry = if Uppered then StatsByRegionResult[Uppered] else nil
		local IsLocalServer: boolean = p1 ~= nil and p1.localServer == true
		local List = {}
		table.insert(List, dim("CONNECTED TO"))
		table.insert(List, "<b>" .. locationText(p1, Uppered) .. "</b>")
		
		if p1 and p1.udmuxEndpoint then
			table.insert(List, "  Edge (UDMUX)          " .. FormatModule.colorTag(FormatModule.COLOR_DIM, (FormatModule.escapeRich(p1.udmuxEndpoint))))
		end
		if p1 and p1.rccEndpoint then
			table.insert(List, "  RCC                   " .. FormatModule.colorTag(FormatModule.COLOR_DIM, (FormatModule.escapeRich(p1.rccEndpoint))))
		end
		if p1 and p1.ipVersion then
			table.insert(List, "  IP version            IPv" .. tostring(p1.ipVersion))
		end
		if p4 then
			table.insert(List, "  Authority             " .. FormatModule.escapeRich(config[p4] or p4))
		end
		local AddPingLinesResult = addPingLines(List, p3)
		table.insert(List, "")
		table.insert(List, dim("CONNECTION"))
		local RakMs: number = p3.rakMs
		table.insert(List, "  RakPing               " .. (if RakMs == nil or RakMs < 0 then FormatModule.colorTag(FormatModule.COLOR_RED, "—") else FormatModule.colorTag(FormatModule.rttColor(RakMs), string.format("%.0f ms", RakMs))))
		
		if not IsLocalServer then
			addProbeLines(List, p3, StatsByRegionResultEntry)
		end
		if not AddPingLinesResult then
			local DataMs = p3.dataMs
			local RakMs1 = p3.rakMs
			local ColorTagResult = if DataMs and RakMs1 then FormatModule.colorTag(FormatModule.COLOR_DIM, string.format("%+.0f ms", DataMs - RakMs1)) else nil
			
			if ColorTagResult then
				table.insert(List, "  Replication overhead  " .. ColorTagResult)
			end
		end
		local ColorTagResult = nil
		if IsLocalServer then
			ColorTagResult = nil
		else
			local RakMs2 = p3.rakMs
			local MedianMs = if StatsByRegionResultEntry then StatsByRegionResultEntry.medianMs else nil
			ColorTagResult = if RakMs2 and MedianMs then FormatModule.colorTag(FormatModule.COLOR_DIM, string.format("%+.0f ms", RakMs2 - MedianMs)) else nil
		end
		if ColorTagResult then
			table.insert(List, "  RakPing vs probe      " .. ColorTagResult)
		end
		addPeerLines(List, p3)
		local AlternativesResult = alternatives(StatsByRegionResult, Uppered)
		
		if #AlternativesResult > 0 then
			table.insert(List, "")
			table.insert(List, dim(if IsLocalServer then "PoP REGIONS · probe only" else "OTHER REGIONS · probe only"))
			
			for _, value in AlternativesResult do
				local MedianMs: number = value.medianMs
				local JitterMs = value.jitterMs
				table.insert(List, string.format("  %-20s  %s%s", FormatModule.escapeRich(value.region), if MedianMs == nil or MedianMs < 0 then FormatModule.colorTag(FormatModule.COLOR_RED, "—") else FormatModule.colorTag(FormatModule.rttColor(MedianMs), string.format("%.0f ms", MedianMs)), if JitterMs then FormatModule.colorTag(FormatModule.COLOR_DIM, string.format(" ±%.0f ms jitter", JitterMs)) else ""))
			end
		end
		return table.concat(List, "\n")
	end,
	peerStatsPlausible = function(p5: number, p6: number): boolean
		return (not p5 or p5 >= 0 and p5 <= 1) and (not p6 or p6 >= 0 and p6 <= 1000000)
	end,
	statsByRegion = statsByRegion,
	currentRegion = function(p5)
		-- upvalues: regionOf (copy)
		return if p5 == nil or p5.localServer then nil elseif p5.popCode then regionOf(p5.popCode) else nil
	end,
	recentProbe = function(List, Uppered, p5)
		-- upvalues: FormatModule (copy)
		local Total = 0
		local Total1 = 0
		local Count = 0
		local List1 = {}
		local SilentPops = {}
		
		for _, value in List do
			if typeof(value.popCode) == "string" and string.upper((string.sub(value.popCode, 1, 3))) == Uppered then
				Count += 1
				local CommittedHistoryResult = FormatModule.committedHistory(value.history or {})
				local List2 = {}
				
				for i = math.max(1, #CommittedHistoryResult - p5 + 1), #CommittedHistoryResult do
					table.insert(List2, CommittedHistoryResult[i])
				end
				local List3 = {}
				
				for _, value1 in List2 do
					if value1 >= 0 then
						table.insert(List3, value1)
					end
				end
				if p5 <= #List2 and #List3 == 0 then
					table.insert(SilentPops, value.popCode)
				else
					Total += #List2
					Total1 += #List2 - #List3
					
					for _, value2 in List3 do
						table.insert(List1, value2)
					end
				end
			end
		end
		return {
			loss = if Total > 0 then Total1 / Total else nil,
			medianMs = FormatModule.historyMedian(List1),
			silentPops = SilentPops,
			allSilent = Count > 0 and #SilentPops == Count
		}
	end
}