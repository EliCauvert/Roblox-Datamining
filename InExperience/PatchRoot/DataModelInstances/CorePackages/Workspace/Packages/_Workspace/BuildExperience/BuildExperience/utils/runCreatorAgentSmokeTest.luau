local parent = script:FindFirstAncestor("BuildExperience").Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local fFlagBuildExperiencePinForBuild = require(parent.SharedFlags).FFlagBuildExperiencePinForBuild
local getCurrentExperienceProjectModule = require(script.Parent.getCurrentExperienceProject)
local getDefaultTemplatePlaceIdModule = require(script.Parent.getDefaultTemplatePlaceId)
local debug = creatorAgentChatModule.debug

local function awaitRequestHandle(p1, p2)
	while p1(false).status == "pending" do
		if p2 > os.clock() then
			task.wait()
			continue
		end
		return p1(false)
	end
	return p1(false)
end

local function runSyncRpc(p1, p2, p3)
	-- upvalues: awaitRequestHandle (ref)
	local var1 = awaitRequestHandle(p2().state, os.clock() + 30)
	local floored = math.floor((os.clock() - os.clock()) * 1000)
	
	return if var1.status == "succeeded" then {
		status = "ok",
		method = p1,
		detail = if p3 then p3(var1.result) else "succeeded",
		elapsedMs = floored
	} elseif var1.status == "pending" then {
		status = "fail",
		detail = "timed out (still pending)",
		method = p1,
		elapsedMs = floored
	} else {
		status = "fail",
		method = p1,
		detail = var1.error or "failed",
		elapsedMs = floored
	}
end

local function _(p1, p2)
	return {
		status = "skip",
		elapsedMs = nil,
		method = p1,
		detail = p2
	}
end

local _ = function(p1)
	return `[{if p1.status == "ok" then "OK" elseif p1.status == "skip" then "SKIP" else "FAIL"}] {p1.method}{if p1.elapsedMs then ` ({p1.elapsedMs}ms)` else ""} \226\128\148 {p1.detail}`
end

local function buildSummary(p1, p2)
	local list = { "CAS API smoke test", p1, "" }
	
	for i, v in p2 do
		table.insert(list, `[{if v.status == "ok" then "OK" elseif v.status == "skip" then "SKIP" else "FAIL"}] {v.method}{if v.elapsedMs then ` ({v.elapsedMs}ms)` else ""} \226\128\148 {v.detail}`)
	end
	local var1 = 0
	local var2 = 0
	local var3 = 0
	
	for i_1, v_1 in p2 do
		if v_1.status == "ok" then
			var1 += 1
		elseif v_1.status == "skip" then
			var3 += 1
		else
			var2 += 1
		end
	end
	table.insert(list, "")
	table.insert(list, `Summary: {var1} ok, {var2} fail, {var3} skip`)
	
	return table.concat(list, "\n")
end

local function runSessionPromptSmoke(p1, p2, p3)
	if p2 == nil then
		return {
			method = "session/prompt",
			status = "skip",
			detail = "requires session/new to succeed first",
			elapsedMs = nil
		}
	end
	local processTime = os.clock()
	local t = { prompt = "smoke test", sessionId = p2 }
	
	if p3 ~= nil then
		t._meta = { _roblox = { providerConfig = { universeId = p3 } } }
	end
	local var1 = p1.sessionPrompt(t)
	local var2 = os.clock() + 30
	while var1.state(false).status == "queued" do
		if var2 > os.clock() then
			task.wait()
			continue
		end
		return {
			method = "session/prompt",
			status = "fail",
			detail = "timed out waiting for POST ack (still queued)",
			elapsedMs = math.floor((os.clock() - processTime) * 1000)
		}
	end
	while not var1.state(false).isDone do
		if var2 > os.clock() then
			task.wait()
			continue
		end
		return {
			method = "session/prompt",
			status = "fail",
			detail = "timed out waiting for CAP completion",
			elapsedMs = math.floor((os.clock() - processTime) * 1000)
		}
	end
	local floored = math.floor((os.clock() - processTime) * 1000)
	local var3 = var1.state(false)
	
	return if var3.status == "failed" then {
		method = "session/prompt",
		status = "fail",
		detail = var3.error or "POST failed",
		elapsedMs = floored
	} else {
		method = "session/prompt",
		status = "ok",
		detail = if var3.isDone then `CAP completed ({var3.status}, stopReason={var3.stopReason or "?"})` else "POST accepted (202); CAP stream not completed in window",
		elapsedMs = floored
	}
end

return function(p1, p2, p3)
	-- upvalues: creatorAgentChatModule (ref), getCurrentExperienceProjectModule (ref), getDefaultTemplatePlaceIdModule (ref), debug (ref), runSyncRpc (ref), fFlagBuildExperiencePinForBuild (ref), runSessionPromptSmoke (ref), buildSummary (ref)
	local var1 = creatorAgentChatModule.resolveCreatorAgentAcp()
	local t = {}
	local var2 = getCurrentExperienceProjectModule()
	p2 = p2 or var2.universeId
	p3 = p3 or (var2.placeId or getDefaultTemplatePlaceIdModule())
	debug.log("info", "CAS smoke test starting", { acpUrl = var1.url, universeId = p2, placeId = p3 })
	local var3 = nil
	table.insert(t, runSyncRpc("initialize", function()
		-- upvalues: p1 (ref)
		return p1.initialize({ protocolVersion = 2 })
	end, function(p1)
		return if typeof(p1) == "table" and typeof(p1.agentInfo) == "table" then `agent={p1.agentInfo.name or "?"} v{p1.agentInfo.version or "?"}` else "succeeded"
	end))
	local var1 = if p2 == nil then {
		method = "session/new",
		status = "skip",
		detail = "requires universeId (game.GameId is 0 or not in an experience)",
		elapsedMs = nil
	} else runSyncRpc("session/new", function()
		-- upvalues: p1 (ref), p2 (ref), p3 (ref), fFlagBuildExperiencePinForBuild (copy)
		return p1.sessionNew({
			project = { universeId = p2, placeId = p3 },
			application = if fFlagBuildExperiencePinForBuild then "build" else nil
		})
	end, function(p1)
		-- upvalues: var3 (write)
		if typeof(p1) == "table" and typeof(p1.sessionId) == "string" and p1.sessionId ~= "" then
			var3 = p1.sessionId
			
			return `sessionId={var3}`
		end
		return "succeeded but missing sessionId"
	end)
	
	if var1.status == "ok" and var3 == nil then
		var1 = {
			method = "session/new",
			status = "fail",
			detail = "succeeded but missing sessionId in result",
			elapsedMs = var1.elapsedMs
		}
	elseif var1.status == "fail" then
		var1.detail = debug.rpcFailureMessage("session/new", { status = "failed", error = var1.detail })
	end
	table.insert(t, var1)
	table.insert(t, runSyncRpc("session/list", function()
		-- upvalues: p1 (ref)
		return p1.sessionList()
	end, function(p1)
		return `{#(if typeof(p1) == "table" and p1.sessions then p1.sessions else {})} session(s)`
	end))
	
	if var3 == nil then
		table.insert(t, {
			method = "session/load",
			status = "skip",
			detail = "requires session/new",
			elapsedMs = nil
		})
		table.insert(t, {
			method = "_roblox/session/update_info",
			status = "skip",
			detail = "requires session/new",
			elapsedMs = nil
		})
		table.insert(t, {
			method = "session/cancel",
			status = "skip",
			detail = "requires session/new",
			elapsedMs = nil
		})
		table.insert(t, {
			method = "_roblox/session/delete",
			status = "skip",
			detail = "requires session/new",
			elapsedMs = nil
		})
		table.insert(t, {
			method = "session/prompt",
			status = "skip",
			detail = "requires session/new to succeed first",
			elapsedMs = nil
		})
	else
		table.insert(t, runSyncRpc("session/load", function()
			-- upvalues: p1 (ref), var3 (write)
			return p1.sessionLoad(var3)
		end))
		table.insert(t, runSyncRpc("_roblox/session/update_info", function()
			-- upvalues: p1 (ref), var3 (write)
			return p1.sessionUpdateInfo(var3, "BuildExperience smoke test")
		end))
		table.insert(t, runSessionPromptSmoke(p1, var3, p2))
		table.insert(t, runSyncRpc("session/cancel", function()
			-- upvalues: p1 (ref), var3 (write)
			return p1.sessionCancel(var3)
		end))
		table.insert(t, runSyncRpc("_roblox/session/delete", function()
			-- upvalues: p1 (ref), var3 (write)
			return p1.sessionDelete(var3)
		end))
	end
	local var1 = buildSummary(var1.url, t)
	debug.log("info", "CAS smoke test complete", { results = t, summary = var1 })
	
	return { acpUrl = var1.url, results = t, summary = var1 }
end