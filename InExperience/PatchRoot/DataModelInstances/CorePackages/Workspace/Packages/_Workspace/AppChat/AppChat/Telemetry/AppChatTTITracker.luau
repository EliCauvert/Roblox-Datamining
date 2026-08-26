local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatPerf = require(appChat.Logger):new("AppChatPerf")
local timeToInteractiveTracker = require(parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local milestone = timeToInteractiveTracker.Milestone
local pageGateModule = require(parent.PageGate)
local fFlagEnablePLTPrefetchCallbacks = pageGateModule.FFlagEnablePLTPrefetchCallbacks
local cryoModule = require(parent.Cryo)
local _ = require(parent.SocialCommon)
local appChatPerfEventInfoModule = require(appChat.Telemetry.AppChatPerfEventInfo)
local _ = require(appChat.Contexts.ChatPlacementContext)
local t = {
	started = false,
	interactive = false,
	interactiveTimestamp = nil,
	eventName = nil
}
local t_1 = {}

local function _(p1)
	-- upvalues: t_1 (ref), t (ref)
	if not t_1[p1] then
		t_1[p1] = table.clone(t)
	end
	return t_1[p1]
end

local var1 = nil
local t_2 = {}
local t_3 = { category = appChatPerfEventInfoModule.TTI_CATEGORY }
local var2 = nil

local function alwaysMatch(_)
	return true, nil
end

local function matchConversation(p1)
	-- upvalues: var1 (write)
	if p1.conversationId and var1 and p1.conversationId ~= var1 then
		return false, "conversation_id_mismatch"
	end
	return true, nil
end

local t_4 = {
	useBaseName = true,
	noInteractiveState = true,
	getColdStart = function(_)
		return false
	end,
	isContextMatching = matchConversation
}
local t_5 = {
	ChatLandingTTI = {
		getColdStart = function(p1)
			return p1.coldStart == true
		end,
		isContextMatching = alwaysMatch
	},
	ChatConversationTTI = {
		getColdStart = function(p1)
			-- upvalues: t_2 (ref)
			local conversationId = p1.conversationId
			local var3 = conversationId ~= nil and not t_2[conversationId]
			
			if conversationId then
				t_2[conversationId] = true
			end
			return var3
		end,
		isContextMatching = matchConversation,
		onStart = function(p1)
			-- upvalues: var1 (write), var2 (write)
			local conversationId = p1.conversationId
			
			if conversationId ~= nil and conversationId ~= var1 then
				var1 = conversationId
				
				if var2 then
					var2("ChatConversationTTI")
				end
			end
		end
	},
	MessageSendTTI = t_4,
	MessageReceiveTTI = t_4
}

local function buildTTIMetadata(p1, p2)
	-- upvalues: appChatPerfEventInfoModule (ref), cryoModule (ref), t_3 (write)
	local TTIPage = appChatPerfEventInfoModule.getTTIPage(p1)
	
	return cryoModule.Dictionary.join(t_3, { subcategory = TTIPage, page = TTIPage }, p2 or {})
end

return {
	setSharedContext = function(value)
		-- upvalues: t_3 (write), cryoModule (ref), appChatPerf (ref)
		t_3 = cryoModule.Dictionary.join(t_3, value)
		appChatPerf:debug("Shared context updated: placement={}, entryPoint={}, hasActiveParty={}", value.placement or "nil", value.entryPoint or "nil", value.hasActiveParty or false)
	end,
	getSharedContext = function()
		-- upvalues: t_3 (write)
		return t_3
	end,
	setOnConversationSwitch = function(value)
		-- upvalues: var2 (write)
		var2 = value
	end,
	start = function(p1, p2)
		-- upvalues: t_1 (ref), appChatPerf (ref), t_5 (ref), appChatPerfEventInfoModule (ref), t_3 (write), timeToInteractiveTracker (ref), buildTTIMetadata (ref), cryoModule (ref)
		local var3 = t_1[p1]
		
		if var3 and var3.started then
			appChatPerf:debug("TTI Start ignored: {} (reason=already_started, eventName={})", p1, var3.eventName)
			
			return false
		end
		local var4 = t_5[p1]
		
		if var4.onStart then
			var4.onStart(p2)
		end
		local coldStart = var4.getColdStart(p2)
		local var5 = if var4.useBaseName then appChatPerfEventInfoModule.getTTIBaseName(p1) else appChatPerfEventInfoModule.buildTTIEventName(p1, t_3.placement, coldStart)
		t_1[p1] = {
			started = true,
			interactive = false,
			interactiveTimestamp = nil,
			eventName = var5
		}
		appChatPerf:debug("TTI Start: {} (coldStart={}, conversationId={}, entryPoint={})", var5, coldStart, p2.conversationId, p2.entryPoint)
		timeToInteractiveTracker.trackStart(var5)
		timeToInteractiveTracker.updateMetadata(var5, buildTTIMetadata(p1, cryoModule.Dictionary.join(p2, { coldStart = coldStart })))
		
		return true
	end,
	finish = function(p1, p2)
		-- upvalues: t_5 (ref), t_1 (ref), t (ref), appChatPerf (ref), timeToInteractiveTracker (ref), buildTTIMetadata (ref), milestone (ref), fFlagEnablePLTPrefetchCallbacks (ref), pageGateModule (ref)
		local var3 = t_5[p1]
		
		if not t_1[p1] then
			t_1[p1] = table.clone(t)
		end
		local var4 = t_1[p1]
		
		if not var4.started then
			appChatPerf:debug("TTI End ignored: {} (reason=not_started)", p1)
			
			return false
		end
		local var5, var6 = var3.isContextMatching(p2)
		
		if not var5 then
			appChatPerf:debug("TTI End ignored: {} (reason={})", p1, var6 or "unknown")
			
			return false
		end
		local eventName = var4.eventName
		
		if eventName == nil then
			appChatPerf:debug("TTI End ignored: {} (reason=missing_event_name)", p1)
			
			return false
		end
		appChatPerf:debug("TTI End: {} (numElementsRendered={})", eventName, p2.numElementsRendered)
		timeToInteractiveTracker.updateMetadata(eventName, buildTTIMetadata(p1, p2))
		
		if timeToInteractiveTracker.trackMilestone then
			timeToInteractiveTracker.trackMilestone(eventName, milestone.SurfaceReady)
		end
		if fFlagEnablePLTPrefetchCallbacks and p1 == "ChatLandingTTI" then
			pageGateModule.signal(pageGateModule.Page.Party, pageGateModule.Milestone.SurfaceReady)
		end
		timeToInteractiveTracker.trackEnd(eventName)
		var4.started = false
		
		if not var3.noInteractiveState then
			var4.interactive = true
			var4.interactiveTimestamp = os.clock()
		end
		var4.eventName = nil
		
		return true
	end,
	cancel = function(p1, _)
		-- upvalues: t_1 (ref), t (ref), appChatPerf (ref), timeToInteractiveTracker (ref)
		if not t_1[p1] then
			t_1[p1] = table.clone(t)
		end
		local var3 = t_1[p1]
		
		if not var3.started then
			appChatPerf:debug("TTI Cancel ignored: {} (reason=not_started)", p1)
			
			return false
		end
		local eventName = var3.eventName
		
		if eventName == nil then
			appChatPerf:debug("TTI Cancel ignored: {} (reason=missing_event_name)", p1)
			
			return false
		end
		appChatPerf:debug("TTI Cancel: {}", eventName)
		timeToInteractiveTracker.resetEvent(eventName)
		var3.started = false
		var3.interactive = false
		var3.interactiveTimestamp = nil
		var3.eventName = nil
		
		return true
	end,
	isActive = function(p1, p2)
		-- upvalues: t_5 (ref), t_1 (ref), t (ref)
		local var3 = t_5[p1]
		
		if not t_1[p1] then
			t_1[p1] = table.clone(t)
		end
		return if t_1[p1].started then var3.isContextMatching(p2) else false
	end,
	trackMilestone = function(p1, p2, p3)
		-- upvalues: timeToInteractiveTracker (ref), t_5 (ref), t_1 (ref), t (ref), appChatPerf (ref)
		if not timeToInteractiveTracker.trackMilestone then
			return false
		end
		local var3 = t_5[p1]
		
		if not t_1[p1] then
			t_1[p1] = table.clone(t)
		end
		local var4 = t_1[p1]
		
		if not var4.started or not var4.eventName then
			return false
		elseif var3.isContextMatching(p3) then
			appChatPerf:debug("TTI Milestone: {} -> {}", var4.eventName, p2)
			timeToInteractiveTracker.trackMilestone(var4.eventName, p2)
			
			return true
		end
		return false
	end,
	trackSubphase = function(p1, p2, p3, p4)
		-- upvalues: timeToInteractiveTracker (ref), t_5 (ref), t_1 (ref), t (ref), appChatPerf (ref)
		if not timeToInteractiveTracker.trackSubphase then
			return false
		end
		local var3 = t_5[p1]
		
		if not t_1[p1] then
			t_1[p1] = table.clone(t)
		end
		local var4 = t_1[p1]
		
		if not var4.started or not var4.eventName then
			return false
		elseif var3.isContextMatching(p4) then
			appChatPerf:debug("TTI Subphase: {} -> {}.{}", var4.eventName, p2, p3)
			timeToInteractiveTracker.trackSubphase(var4.eventName, p2, p3)
			
			return true
		end
		return false
	end,
	trackRequest = function(p1, p2, p3, p4)
		-- upvalues: timeToInteractiveTracker (ref), t_5 (ref), t_1 (ref), t (ref), appChatPerf (ref)
		if not timeToInteractiveTracker.trackRequest then
			return false
		end
		local var3 = t_5[p1]
		
		if not t_1[p1] then
			t_1[p1] = table.clone(t)
		end
		local var4 = t_1[p1]
		
		if not var4.started or not var4.eventName then
			return false
		elseif var3.isContextMatching(p4) then
			appChatPerf:debug("TTI Request: {} -> {}.{}", var4.eventName, p2, p3)
			timeToInteractiveTracker.trackRequest(var4.eventName, p2, p3)
			
			return true
		end
		return false
	end,
	getEventName = function(p1)
		-- upvalues: t_1 (ref), t (ref)
		if not t_1[p1] then
			t_1[p1] = table.clone(t)
		end
		local var3 = t_1[p1]
		
		return if var3.started then var3.eventName else nil
	end,
	Milestone = milestone,
	Hooks = timeToInteractiveTracker.Hooks,
	isInteractive = function(p1)
		-- upvalues: t_1 (ref), t (ref)
		if not t_1[p1] then
			t_1[p1] = table.clone(t)
		end
		return t_1[p1].interactive
	end,
	getInteractiveTimestamp = function(p1)
		-- upvalues: t_1 (ref), t (ref)
		if not t_1[p1] then
			t_1[p1] = table.clone(t)
		end
		return t_1[p1].interactiveTimestamp
	end
}