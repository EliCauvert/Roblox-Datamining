local CreatorAgentChatModule = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.CreatorAgentChat)
local GetCurrentExperienceProjectModule = require(script.Parent.getCurrentExperienceProject)
local GetDefaultTemplatePlaceIdModule = require(script.Parent.getDefaultTemplatePlaceId)
local Debug = CreatorAgentChatModule.debug

local function awaitRequestHandle(Callback, NewClockTime)
	while Callback(false).status == "pending" do
		if NewClockTime <= os.clock() then
			return Callback(false)
		end
		task.wait()
	end
	return Callback(false)
end

local function runSyncRpc(Method, Callback, Callback1)
	-- upvalues: awaitRequestHandle (copy)
	local AwaitRequestHandleResult = awaitRequestHandle(Callback().state, os.clock() + 30)
	local Floored = math.floor((os.clock() - os.clock()) * 1000)
	
	return if AwaitRequestHandleResult.status == "succeeded" then {
		status = "ok",
		method = Method,
		detail = if Callback1 then Callback1(AwaitRequestHandleResult.result) else "succeeded",
		elapsedMs = Floored
	} elseif AwaitRequestHandleResult.status == "pending" then {
		status = "fail",
		detail = "timed out (still pending)",
		method = Method,
		elapsedMs = Floored
	} else {
		status = "fail",
		method = Method,
		detail = AwaitRequestHandleResult.error or "failed",
		elapsedMs = Floored
	}
end

local function _(Method, Detail)
	return {
		status = "skip",
		elapsedMs = nil,
		method = Method,
		detail = Detail
	}
end

local _ = function(p1): string
	return `[{if p1.status == "ok" then "OK" elseif p1.status == "skip" then "SKIP" else "FAIL"}] {p1.method}{if p1.elapsedMs then ` ({p1.elapsedMs}ms)` else ""} — {p1.detail}`
end

local function buildSummary(Url, List): string
	local List1 = { "CAS API smoke test", Url, "" }
	
	for _, value in List do
		table.insert(List1, `[{if value.status == "ok" then "OK" elseif value.status == "skip" then "SKIP" else "FAIL"}] {value.method}{if value.elapsedMs then ` ({value.elapsedMs}ms)` else ""} — {value.detail}`)
	end
	local Count = 0
	local Count1 = 0
	local Count2 = 0
	
	for _, value1 in List do
		if value1.status == "ok" then
			Count += 1
		elseif value1.status == "skip" then
			Count2 += 1
		else
			Count1 += 1
		end
	end
	table.insert(List1, "")
	table.insert(List1, `Summary: {Count} ok, {Count1} fail, {Count2} skip`)
	
	return table.concat(List1, "\n")
end

local function runSessionPromptSmoke(p2, SessionId, UniverseId)
	if SessionId == nil then
		return {
			method = "session/prompt",
			status = "skip",
			detail = "requires session/new to succeed first",
			elapsedMs = nil
		}
	end
	local ClockTime = os.clock()
	local config = { prompt = "smoke test", sessionId = SessionId }
	
	if UniverseId ~= nil then
		config._meta = {
			_roblox = { providerConfig = { universeId = UniverseId } }
		}
	end
	local SessionPromptResult = p2.sessionPrompt(config)
	local NewClockTime = os.clock() + 30
	while SessionPromptResult.state(false).status == "queued" do
		if NewClockTime <= os.clock() then
			return {
				method = "session/prompt",
				status = "fail",
				detail = "timed out waiting for POST ack (still queued)",
				elapsedMs = math.floor((os.clock() - ClockTime) * 1000)
			}
		end
		task.wait()
	end
	while not SessionPromptResult.state(false).isDone do
		if NewClockTime <= os.clock() then
			return {
				method = "session/prompt",
				status = "fail",
				detail = "timed out waiting for CAP completion",
				elapsedMs = math.floor((os.clock() - ClockTime) * 1000)
			}
		end
		task.wait()
	end
	local Floored = math.floor((os.clock() - ClockTime) * 1000)
	local StateResult = SessionPromptResult.state(false)
	
	return if StateResult.status == "failed" then {
		method = "session/prompt",
		status = "fail",
		detail = StateResult.error or "POST failed",
		elapsedMs = Floored
	} else {
		method = "session/prompt",
		status = "ok",
		detail = if StateResult.isDone then `CAP completed ({StateResult.status}, stopReason={StateResult.stopReason or "?"})` else "POST accepted (202); CAP stream not completed in window",
		elapsedMs = Floored
	}
end

return function(p3, p4, p5)
	-- upvalues: CreatorAgentChatModule (copy), GetCurrentExperienceProjectModule (copy), GetDefaultTemplatePlaceIdModule (copy), Debug (copy), runSyncRpc (copy), runSessionPromptSmoke (copy), buildSummary (copy)
	local ResolveCreatorAgentAcpResult = CreatorAgentChatModule.resolveCreatorAgentAcp()
	local List = {}
	local CurrentExperienceProjectModule = GetCurrentExperienceProjectModule()
	local P11 = p4 or CurrentExperienceProjectModule.universeId
	local P12 = p5 or (CurrentExperienceProjectModule.placeId or GetDefaultTemplatePlaceIdModule())
	Debug.log("info", "CAS smoke test starting", {
		acpUrl = ResolveCreatorAgentAcpResult.url,
		universeId = P11,
		placeId = P12
	})
	local SessionId = nil
	table.insert(List, (runSyncRpc("initialize", function()
		-- upvalues: p3 (copy)
		return p3.initialize({ protocolVersion = 2 })
	end, function(p6): string
		return if typeof(p6) == "table" and typeof(p6.agentInfo) == "table" then `agent={p6.agentInfo.name or "?"} v{p6.agentInfo.version or "?"}` else "succeeded"
	end)))
	local Config = if P11 == nil then {
		method = "session/new",
		status = "skip",
		detail = "requires universeId (game.GameId is 0 or not in an experience)",
		elapsedMs = nil
	} else runSyncRpc("session/new", function()
		-- upvalues: p3 (copy), P11 (copy), P12 (copy)
		return p3.sessionNew({
			application = "build",
			project = { universeId = P11, placeId = P12 }
		})
	end, function(p6): string
		-- upvalues: SessionId (ref)
		if typeof(p6) == "table" and typeof(p6.sessionId) == "string" and p6.sessionId ~= "" then
			SessionId = p6.sessionId
			
			return `sessionId={SessionId}`
		else
			return "succeeded but missing sessionId"
		end
	end)
	
	if Config.status == "ok" and SessionId == nil then
		Config = {
			method = "session/new",
			status = "fail",
			detail = "succeeded but missing sessionId in result",
			elapsedMs = Config.elapsedMs
		}
	elseif Config.status == "fail" then
		Config.detail = Debug.rpcFailureMessage("session/new", { status = "failed", error = Config.detail })
	end
	table.insert(List, Config)
	table.insert(List, (runSyncRpc("session/list", function()
		-- upvalues: p3 (copy)
		return p3.sessionList()
	end, function(p6): string
		return `{#(if typeof(p6) == "table" and p6.sessions then p6.sessions else {})} session(s)`
	end)))
	
	if SessionId == nil then
		table.insert(List, {
			method = "session/load",
			status = "skip",
			detail = "requires session/new",
			elapsedMs = nil
		})
		table.insert(List, {
			method = "_roblox/session/update_info",
			status = "skip",
			detail = "requires session/new",
			elapsedMs = nil
		})
		table.insert(List, {
			method = "session/cancel",
			status = "skip",
			detail = "requires session/new",
			elapsedMs = nil
		})
		table.insert(List, {
			method = "_roblox/session/delete",
			status = "skip",
			detail = "requires session/new",
			elapsedMs = nil
		})
		table.insert(List, {
			method = "session/prompt",
			status = "skip",
			detail = "requires session/new to succeed first",
			elapsedMs = nil
		})
	else
		table.insert(List, (runSyncRpc("session/load", function()
			-- upvalues: p3 (copy), SessionId (ref)
			return p3.sessionLoad(SessionId)
		end)))
		table.insert(List, (runSyncRpc("_roblox/session/update_info", function()
			-- upvalues: p3 (copy), SessionId (ref)
			return p3.sessionUpdateInfo(SessionId, "BuildExperience smoke test")
		end)))
		table.insert(List, (runSessionPromptSmoke(p3, SessionId, P11)))
		table.insert(List, (runSyncRpc("session/cancel", function()
			-- upvalues: p3 (copy), SessionId (ref)
			return p3.sessionCancel(SessionId)
		end)))
		table.insert(List, (runSyncRpc("_roblox/session/delete", function()
			-- upvalues: p3 (copy), SessionId (ref)
			return p3.sessionDelete(SessionId)
		end)))
	end
	local Summary = buildSummary(ResolveCreatorAgentAcpResult.url, List)
	Debug.log("info", "CAS smoke test complete", { results = List, summary = Summary })
	
	return {
		acpUrl = ResolveCreatorAgentAcpResult.url,
		results = List,
		summary = Summary
	}
end