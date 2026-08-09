local httpService = game:GetService("HttpService")
local creatorAgentChatModule = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.CreatorAgentChat)
local buildLiveActivityProtocolModule = require(script.Parent.BuildLiveActivityProtocol)
local buildLiveActivity = game:DefineFastFlag("BuildLiveActivity", false)
local buildLiveActivityCleanup = game:DefineFastFlag("BuildLiveActivityCleanup", false)
local t = {}
local t_1 = {}
local var7 = nil
local var8 = false

local function _() --[[ line: 28 | named "disconnectCanonicalObserver" ]]
	-- upvalues: var7 (write)
	if var7 ~= nil then
		var7()
		var7 = nil
	end
end

local _ = function() --[[ line: 35 | named "clearTurnState" ]]
	-- upvalues: t (ref), t_1 (ref)
	table.clear(t)
	table.clear(t_1)
end

local function terminalReason(a) --[[ line: 40 ]]
	return if not (a.sessionUpdate ~= "state_change" or a.state ~= "idle") then if a.stop_reason == "end_turn" or a.stopReason == "end_turn" then "responseReady" elseif a.stop_reason == "cancelled" or a.stopReason == "cancelled" then "cancelled" else "failed" else nil
end

local function isLiveTurnStart(p0) --[[ line: 53 ]]
	return p0.source == "live" and (p0.update.sessionUpdate == "state_change" and p0.update.state == "running")
end

local function canonicalUpdateAction(p1, p2, p3) --[[ line: 57 ]]
	return if not (p3 ~= nil and p1.sequenceId <= p3) then if p2 == p1.turnId then "consume" elseif p1.source == "live" and (p1.update.sessionUpdate == "state_change" and p1.update.state == "running") then "start" else "ignore" else "ignore"
end

local function onCanonicalUpdate(p4) --[[ line: 73 ]]
	-- upvalues: buildLiveActivity (ref), var8 (write), t_1 (ref), t (ref), buildLiveActivityProtocolModule (ref), httpService (ref)
	if not buildLiveActivity or not var8 then return end
	local sessionId = t_1[p4.sessionId]
	local var13 = if sessionId == nil or p4.sequenceId > sessionId then if t[p4.sessionId] == p4.turnId then "consume" elseif p4.source == "live" and (p4.update.sessionUpdate == "state_change" and p4.update.state == "running") then "start" else "ignore" else "ignore"
	
	if var13 == "ignore" then return end
	if var13 == "start" then
		if not buildLiveActivityProtocolModule.beginTurn(p4.sessionId, p4.turnId) then return end
		t[p4.sessionId] = p4.turnId
	end
	local ok, status = pcall(httpService.JSONEncode, httpService, { sequenceId = p4.sequenceId, update = p4.update })
	
	if not ok then return end
	if not buildLiveActivityProtocolModule.consume(p4.sessionId, p4.turnId, p4.sequenceId, status) then return end
	t_1[p4.sessionId] = p4.sequenceId
	local update = p4.update
	local var14 = if update.sessionUpdate ~= "state_change" or update.state ~= "idle" then if update.stop_reason == "end_turn" or update.stopReason == "end_turn" then "responseReady" elseif update.stop_reason == "cancelled" or update.stopReason == "cancelled" then "cancelled" else "failed" else nil
	
	if var14 ~= nil then
		buildLiveActivityProtocolModule.endTurn(p4.sessionId, p4.turnId, var14)
		t[p4.sessionId] = nil
	end
end

local _ = function() --[[ line: 109 | named "observeCanonicalUpdates" ]]
	-- upvalues: var7 (write), creatorAgentChatModule (ref), onCanonicalUpdate (ref)
	if var7 == nil then
		var7 = creatorAgentChatModule.getCreatorAgentChatStore().observeCanonicalSessionUpdates(onCanonicalUpdate)
	end
end

return {
	bootstrap = function(p5) --[[ line: 118 ]]
		-- upvalues: var8 (write), buildLiveActivity (ref), buildLiveActivityCleanup (ref), buildLiveActivityProtocolModule (ref), var7 (write), creatorAgentChatModule (ref), onCanonicalUpdate (ref), t (ref), t_1 (ref)
		var8 = p5
		p5 = buildLiveActivity and p5
		
		if buildLiveActivity or buildLiveActivityCleanup then
			buildLiveActivityProtocolModule.featureFlagDidChange(p5)
			buildLiveActivityProtocolModule.bootstrap(p5)
		end
		if p5 then
			if var7 == nil then
				var7 = creatorAgentChatModule.getCreatorAgentChatStore().observeCanonicalSessionUpdates(onCanonicalUpdate)
				
				return
			end
		elseif var7 ~= nil then
			var7()
			var7 = nil
		end
		table.clear(t)
		table.clear(t_1)
	end,
	featureFlagDidChange = function(p6) --[[ line: 133 ]]
		-- upvalues: buildLiveActivity (ref), var8 (write), buildLiveActivityCleanup (ref), buildLiveActivityProtocolModule (ref), var7 (write), creatorAgentChatModule (ref), onCanonicalUpdate (ref), t (ref), t_1 (ref)
		local var8_1 = buildLiveActivity and (p6 and var8)
		
		if buildLiveActivity or buildLiveActivityCleanup then
			buildLiveActivityProtocolModule.featureFlagDidChange(var8_1)
		end
		if var8_1 then
			buildLiveActivityProtocolModule.bootstrap(true)
			
			if var7 == nil then
				var7 = creatorAgentChatModule.getCreatorAgentChatStore().observeCanonicalSessionUpdates(onCanonicalUpdate)
				
				return
			end
		elseif var7 ~= nil then
			var7()
			var7 = nil
		end
		table.clear(t)
		table.clear(t_1)
	end,
	endAll = function() --[[ line: 147 ]]
		-- upvalues: buildLiveActivity (ref), buildLiveActivityCleanup (ref), buildLiveActivityProtocolModule (ref), var7 (write), t (ref), t_1 (ref)
		if buildLiveActivity or buildLiveActivityCleanup then
			buildLiveActivityProtocolModule.endAll()
		end
		if var7 ~= nil then
			var7()
			var7 = nil
		end
		table.clear(t)
		table.clear(t_1)
	end,
	onCanonicalUpdate = onCanonicalUpdate,
	terminalReason = terminalReason,
	isLiveTurnStart = isLiveTurnStart,
	canonicalUpdateAction = canonicalUpdateAction
}