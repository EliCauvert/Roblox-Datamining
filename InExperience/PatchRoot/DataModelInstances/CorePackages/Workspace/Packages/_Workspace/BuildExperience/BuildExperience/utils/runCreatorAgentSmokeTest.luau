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

local function runSyncRpc(p3, p4, p5)
	-- upvalues: awaitRequestHandle (ref)
	local var1 = awaitRequestHandle(p4().state, os.clock() + 30)
	local floored = math.floor((os.clock() - os.clock()) * 1000)
	
	return if var1.status == "succeeded" then {
		status = "ok",
		method = p3,
		detail = if p5 then p5(var1.result) else "succeeded",
		elapsedMs = floored
	} elseif var1.status == "pending" then {
		status = "fail",
		detail = "timed out (still pending)",
		method = p3,
		elapsedMs = floored
	} else {
		status = "fail",
		method = p3,
		detail = var1.error or "failed",
		elapsedMs = floored
	}
end

local function _(p3, p4)
	return {
		status = "skip",
		elapsedMs = nil,
		method = p3,
		detail = p4
	}
end

local _ = function(p3)
	return `[{if p3.status == "ok" then "OK" elseif p3.status == "skip" then "SKIP" else "FAIL"}] {p3.method}{if p3.elapsedMs then ` ({p3.elapsedMs}ms)` else ""} \226\128\148 {p3.detail}`
end

local function buildSummary(p4, p5)
	local list = { "CAS API smoke test", p4, "" }
	
	for i, v in p5 do
		table.insert(list, `[{if v.status == "ok" then "OK" elseif v.status == "skip" then "SKIP" else "FAIL"}] {v.method}{if v.elapsedMs then ` ({v.elapsedMs}ms)` else ""} \226\128\148 {v.detail}`)
	end
	local var1 = 0
	local var2 = 0
	local var3 = 0
	
	for i_1, v_1 in p5 do
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

local function runSessionPromptSmoke(p6, p7, p8)
	if p7 == nil then
		return {
			method = "session/prompt",
			status = "skip",
			detail = "requires session/new to succeed first",
			elapsedMs = nil
		}
	end
	local processTime = os.clock()
	local t = { prompt = "smoke test", sessionId = p7 }
	
	if p8 ~= nil then
		t._meta = { _roblox = { providerConfig = { universeId = p8 } } }
	end
	local var4 = p6.sessionPrompt(t)
	local var5 = os.clock() + 30
	while var4.state(false).status == "queued" do
		if var5 > os.clock() then
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
	while not var4.state(false).isDone do
		if var5 > os.clock() then
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
	local var6 = var4.state(false)
	
	return if var6.status == "failed" then {
		method = "session/prompt",
		status = "fail",
		detail = var6.error or "POST failed",
		elapsedMs = floored
	} else {
		method = "session/prompt",
		status = "ok",
		detail = if var6.isDone then `CAP completed ({var6.status}, stopReason={var6.stopReason or "?"})` else "POST accepted (202); CAP stream not completed in window",
		elapsedMs = floored
	}
end

return function(p9, p10, p11)
	-- upvalues: creatorAgentChatModule (ref), getCurrentExperienceProjectModule (ref), getDefaultTemplatePlaceIdModule (ref), debug (ref), runSyncRpc (ref), fFlagBuildExperiencePinForBuild (ref), runSessionPromptSmoke (ref), buildSummary (ref)
	local var7 = creatorAgentChatModule.resolveCreatorAgentAcp()
	local t = {}
	local var8 = getCurrentExperienceProjectModule()
	p10 = p10 or var8.universeId
	p11 = p11 or (var8.placeId or getDefaultTemplatePlaceIdModule())
	debug.log("info", "CAS smoke test starting", { acpUrl = var7.url, universeId = p10, placeId = p11 })
	local var9 = nil
	table.insert(t, runSyncRpc("initialize", function()
		-- upvalues: p9 (ref)
		return p9.initialize({ protocolVersion = 2 })
	end, function(p12)
		return if typeof(p12) == "table" and typeof(p12.agentInfo) == "table" then `agent={p12.agentInfo.name or "?"} v{p12.agentInfo.version or "?"}` else "succeeded"
	end))
	local var7 = if p10 == nil then {
		method = "session/new",
		status = "skip",
		detail = "requires universeId (game.GameId is 0 or not in an experience)",
		elapsedMs = nil
	} else runSyncRpc("session/new", function()
		-- upvalues: p9 (ref), p10 (ref), p11 (ref), fFlagBuildExperiencePinForBuild (copy)
		return p9.sessionNew({
			project = { universeId = p10, placeId = p11 },
			application = if fFlagBuildExperiencePinForBuild then "build" else nil
		})
	end, function(p12)
		-- upvalues: var9 (write)
		if typeof(p12) == "table" and typeof(p12.sessionId) == "string" and p12.sessionId ~= "" then
			var9 = p12.sessionId
			
			return `sessionId={var9}`
		end
		return "succeeded but missing sessionId"
	end)
	
	if var7.status == "ok" and var9 == nil then
		var7 = {
			method = "session/new",
			status = "fail",
			detail = "succeeded but missing sessionId in result",
			elapsedMs = var7.elapsedMs
		}
	elseif var7.status == "fail" then
		var7.detail = debug.rpcFailureMessage("session/new", { status = "failed", error = var7.detail })
	end
	table.insert(t, var7)
	table.insert(t, runSyncRpc("session/list", function()
		-- upvalues: p9 (ref)
		return p9.sessionList()
	end, function(p12)
		return `{#(if typeof(p12) == "table" and p12.sessions then p12.sessions else {})} session(s)`
	end))
	
	if var9 == nil then
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
			-- upvalues: p9 (ref), var9 (write)
			return p9.sessionLoad(var9)
		end))
		table.insert(t, runSyncRpc("_roblox/session/update_info", function()
			-- upvalues: p9 (ref), var9 (write)
			return p9.sessionUpdateInfo(var9, "BuildExperience smoke test")
		end))
		table.insert(t, runSessionPromptSmoke(p9, var9, p10))
		table.insert(t, runSyncRpc("session/cancel", function()
			-- upvalues: p9 (ref), var9 (write)
			return p9.sessionCancel(var9)
		end))
		table.insert(t, runSyncRpc("_roblox/session/delete", function()
			-- upvalues: p9 (ref), var9 (write)
			return p9.sessionDelete(var9)
		end))
	end
	local var7 = buildSummary(var7.url, t)
	debug.log("info", "CAS smoke test complete", { results = t, summary = var7 })
	
	return { acpUrl = var7.url, results = t, summary = var7 }
end