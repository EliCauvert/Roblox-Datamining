local creatorAgentChatModule = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.CreatorAgentChat)
local getCurrentExperienceProjectModule = require(script.Parent.getCurrentExperienceProject)
local getDefaultTemplatePlaceIdModule = require(script.Parent.getDefaultTemplatePlaceId)
local debug = creatorAgentChatModule.debug

local function awaitRequestHandle(p0, p1)
	while p0(false).status == "pending" do
		if p1 > os.clock() then
			task.wait()
			continue
		end
		return p0(false)
	end
	return p0(false)
end

local function runSyncRpc(p2, p3, p4)
	-- upvalues: awaitRequestHandle (ref)
	local var7 = awaitRequestHandle(p3().state, os.clock() + 30)
	local floored = math.floor((os.clock() - os.clock()) * 1000)
	
	return if var7.status == "succeeded" then {
		status = "ok",
		method = p2,
		detail = if p4 then p4(var7.result) else "succeeded",
		elapsedMs = floored
	} elseif var7.status == "pending" then {
		status = "fail",
		detail = "timed out (still pending)",
		method = p2,
		elapsedMs = floored
	} else {
		status = "fail",
		method = p2,
		detail = var7.error or "failed",
		elapsedMs = floored
	}
end

local function _(p5, p6)
	return {
		status = "skip",
		elapsedMs = nil,
		method = p5,
		detail = p6
	}
end

local _ = function(p7)
	return `[{if p7.status == "ok" then "OK" elseif p7.status == "skip" then "SKIP" else "FAIL"}] {p7.method}{if p7.elapsedMs then ` ({p7.elapsedMs}ms)` else ""} \226\128\148 {p7.detail}`
end

local function buildSummary(p8, p9)
	local list = { "CAS API smoke test", p8, "" }
	
	for i, v in p9 do
		table.insert(list, `[{if v.status == "ok" then "OK" elseif v.status == "skip" then "SKIP" else "FAIL"}] {v.method}{if v.elapsedMs then ` ({v.elapsedMs}ms)` else ""} \226\128\148 {v.detail}`)
	end
	local var10 = 0
	local var11 = 0
	local var12 = 0
	
	for i_1, v_1 in p9 do
		if v_1.status == "ok" then
			var10 += 1
		elseif v_1.status == "skip" then
			var12 += 1
		else
			var11 += 1
		end
	end
	table.insert(list, "")
	table.insert(list, `Summary: {var10} ok, {var11} fail, {var12} skip`)
	
	return table.concat(list, "\n")
end

local function runSessionPromptSmoke(p10, p11, p12)
	if p11 == nil then
		return {
			method = "session/prompt",
			status = "skip",
			detail = "requires session/new to succeed first",
			elapsedMs = nil
		}
	end
	local processTime = os.clock()
	local t = { prompt = "smoke test", sessionId = p11 }
	
	if p12 ~= nil then
		t._meta = { _roblox = { providerConfig = { universeId = p12 } } }
	end
	local var15 = p10.sessionPrompt(t)
	local var16 = os.clock() + 30
	while var15.state(false).status == "queued" do
		if var16 > os.clock() then
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
	while not var15.state(false).isDone do
		if var16 > os.clock() then
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
	local var18 = var15.state(false)
	
	return if var18.status == "failed" then {
		method = "session/prompt",
		status = "fail",
		detail = var18.error or "POST failed",
		elapsedMs = floored
	} else {
		method = "session/prompt",
		status = "ok",
		detail = if var18.isDone then `CAP completed ({var18.status}, stopReason={var18.stopReason or "?"})` else "POST accepted (202); CAP stream not completed in window",
		elapsedMs = floored
	}
end

return function(p13, p14, p15)
	-- upvalues: creatorAgentChatModule (ref), getCurrentExperienceProjectModule (ref), getDefaultTemplatePlaceIdModule (ref), debug (ref), runSyncRpc (ref), runSessionPromptSmoke (ref), buildSummary (ref)
	local var19 = creatorAgentChatModule.resolveCreatorAgentAcp()
	local t = {}
	local var21 = getCurrentExperienceProjectModule()
	p14 = p14 or var21.universeId
	p15 = p15 or (var21.placeId or getDefaultTemplatePlaceIdModule())
	debug.log("info", "CAS smoke test starting", { acpUrl = var19.url, universeId = p14, placeId = p15 })
	local var24 = nil
	table.insert(t, runSyncRpc("initialize", function()
		-- upvalues: p13 (ref)
		return p13.initialize({ protocolVersion = 2 })
	end, function(p16)
		return if typeof(p16) == "table" and typeof(p16.agentInfo) == "table" then `agent={p16.agentInfo.name or "?"} v{p16.agentInfo.version or "?"}` else "succeeded"
	end))
	local var25 = if p14 == nil then {
		method = "session/new",
		status = "skip",
		detail = "requires universeId (game.GameId is 0 or not in an experience)",
		elapsedMs = nil
	} else runSyncRpc("session/new", function()
		-- upvalues: p13 (ref), p14 (ref), p15 (ref)
		return p13.sessionNew({ project = { universeId = p14, placeId = p15 } })
	end, function(p17)
		-- upvalues: var24 (write)
		if typeof(p17) == "table" and typeof(p17.sessionId) == "string" and p17.sessionId ~= "" then
			var24 = p17.sessionId
			
			return `sessionId={var24}`
		end
		return "succeeded but missing sessionId"
	end)
	
	if var25.status == "ok" and var24 == nil then
		var25 = {
			method = "session/new",
			status = "fail",
			detail = "succeeded but missing sessionId in result",
			elapsedMs = var25.elapsedMs
		}
	elseif var25.status == "fail" then
		var25.detail = debug.rpcFailureMessage("session/new", { status = "failed", error = var25.detail })
	end
	table.insert(t, var25)
	table.insert(t, runSyncRpc("session/list", function()
		-- upvalues: p13 (ref)
		return p13.sessionList()
	end, function(p18)
		return `{#(if typeof(p18) == "table" and p18.sessions then p18.sessions else {})} session(s)`
	end))
	
	if var24 == nil then
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
			-- upvalues: p13 (ref), var24 (write)
			return p13.sessionLoad(var24)
		end))
		table.insert(t, runSyncRpc("_roblox/session/update_info", function()
			-- upvalues: p13 (ref), var24 (write)
			return p13.sessionUpdateInfo(var24, "BuildExperience smoke test")
		end))
		table.insert(t, runSessionPromptSmoke(p13, var24, p14))
		table.insert(t, runSyncRpc("session/cancel", function()
			-- upvalues: p13 (ref), var24 (write)
			return p13.sessionCancel(var24)
		end))
		table.insert(t, runSyncRpc("_roblox/session/delete", function()
			-- upvalues: p13 (ref), var24 (write)
			return p13.sessionDelete(var24)
		end))
	end
	local var26 = buildSummary(var19.url, t)
	debug.log("info", "CAS smoke test complete", { results = t, summary = var26 })
	
	return { acpUrl = var19.url, results = t, summary = var26 }
end