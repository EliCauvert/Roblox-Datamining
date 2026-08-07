local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatPerf = require(appChat.Logger):new("AppChatPerf")
local timeToInteractiveTracker = require(parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local milestone = timeToInteractiveTracker.Milestone
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

local function _(p0) --[[ line: 60 | named "getTTIState" ]]
	-- upvalues: t_1 (ref), t (ref)
	if not t_1[p0] then
		t_1[p0] = table.clone(t)
	end
	return t_1[p0]
end

local var6 = nil
local t_2 = {}
local t_3 = { category = appChatPerfEventInfoModule.TTI_CATEGORY }
local var9 = nil

local function alwaysMatch(_) --[[ line: 101 ]]
	return true, nil
end

local function matchConversation(p1) --[[ line: 105 ]]
	-- upvalues: var6 (write)
	if p1.conversationId and var6 and p1.conversationId ~= var6 then
		return false, "conversation_id_mismatch"
	end
	return true, nil
end

local t_4 = {
	useBaseName = true,
	noInteractiveState = true,
	getColdStart = function(_) --[[ line: 123 ]]
		return false
	end,
	isContextMatching = matchConversation
}
local t_5 = {
	ChatLandingTTI = {
		getColdStart = function(p2) --[[ line: 136 ]]
			return p2.coldStart == true
		end,
		isContextMatching = alwaysMatch
	},
	ChatConversationTTI = {
		getColdStart = function(p3) --[[ line: 142 ]]
			-- upvalues: t_2 (ref)
			local conversationId = p3.conversationId
			local var15 = conversationId ~= nil and not t_2[conversationId]
			
			if conversationId then
				t_2[conversationId] = true
			end
			return var15
		end,
		isContextMatching = matchConversation,
		onStart = function(p4) --[[ line: 112 ]]
			-- upvalues: var6 (write), var9 (write)
			local conversationId = p4.conversationId
			
			if conversationId ~= nil and conversationId ~= var6 then
				var6 = conversationId
				
				if var9 then
					var9("ChatConversationTTI")
				end
			end
		end
	},
	MessageSendTTI = t_4,
	MessageReceiveTTI = t_4
}

local function buildTTIMetadata(p5, p6) --[[ line: 162 ]]
	-- upvalues: appChatPerfEventInfoModule (ref), cryoModule (ref), t_3 (write)
	local TTIPage = appChatPerfEventInfoModule.getTTIPage(p5)
	
	return cryoModule.Dictionary.join(t_3, { subcategory = TTIPage, page = TTIPage }, p6 or {})
end

return {
	setSharedContext = function(value) --[[ line: 176 ]]
		-- upvalues: t_3 (write), cryoModule (ref), appChatPerf (ref)
		t_3 = cryoModule.Dictionary.join(t_3, value)
		appChatPerf:debug("Shared context updated: placement={}, entryPoint={}, hasActiveParty={}", value.placement or "nil", value.entryPoint or "nil", value.hasActiveParty or false)
	end,
	getSharedContext = function() --[[ line: 186 ]]
		-- upvalues: t_3 (write)
		return t_3
	end,
	setOnConversationSwitch = function(value) --[[ line: 192 ]]
		-- upvalues: var9 (write)
		var9 = value
	end,
	start = function(p7, p8) --[[ line: 196 ]]
		-- upvalues: t_1 (ref), appChatPerf (ref), t_5 (ref), appChatPerfEventInfoModule (ref), t_3 (write), timeToInteractiveTracker (ref), buildTTIMetadata (ref), cryoModule (ref)
		local var17 = t_1[p7]
		
		if var17 and var17.started then
			appChatPerf:debug("TTI Start ignored: {} (reason=already_started, eventName={})", p7, var17.eventName)
			
			return false
		end
		local var18 = t_5[p7]
		
		if var18.onStart then
			var18.onStart(p8)
		end
		local coldStart = var18.getColdStart(p8)
		local var20 = if var18.useBaseName then appChatPerfEventInfoModule.getTTIBaseName(p7) else appChatPerfEventInfoModule.buildTTIEventName(p7, t_3.placement, coldStart)
		t_1[p7] = {
			started = true,
			interactive = false,
			interactiveTimestamp = nil,
			eventName = var20
		}
		appChatPerf:debug("TTI Start: {} (coldStart={}, conversationId={}, entryPoint={})", var20, coldStart, p8.conversationId, p8.entryPoint)
		timeToInteractiveTracker.trackStart(var20)
		timeToInteractiveTracker.updateMetadata(var20, buildTTIMetadata(p7, cryoModule.Dictionary.join(p8, { coldStart = coldStart })))
		
		return true
	end,
	finish = function(p9, p10) --[[ line: 243 ]]
		-- upvalues: t_5 (ref), t_1 (ref), t (ref), appChatPerf (ref), timeToInteractiveTracker (ref), buildTTIMetadata (ref), milestone (ref)
		local var21 = t_5[p9]
		
		if not t_1[p9] then
			t_1[p9] = table.clone(t)
		end
		local var22 = t_1[p9]
		
		if not var22.started then
			appChatPerf:debug("TTI End ignored: {} (reason=not_started)", p9)
			
			return false
		end
		local var23, var24 = var21.isContextMatching(p10)
		
		if not var23 then
			appChatPerf:debug("TTI End ignored: {} (reason={})", p9, var24 or "unknown")
			
			return false
		end
		local eventName = var22.eventName
		
		if eventName == nil then
			appChatPerf:debug("TTI End ignored: {} (reason=missing_event_name)", p9)
			
			return false
		end
		appChatPerf:debug("TTI End: {} (numElementsRendered={})", eventName, p10.numElementsRendered)
		timeToInteractiveTracker.updateMetadata(eventName, buildTTIMetadata(p9, p10))
		
		if timeToInteractiveTracker.trackMilestone then
			timeToInteractiveTracker.trackMilestone(eventName, milestone.SurfaceReady)
		end
		timeToInteractiveTracker.trackEnd(eventName)
		var22.started = false
		
		if not var21.noInteractiveState then
			var22.interactive = true
			var22.interactiveTimestamp = os.clock()
		end
		var22.eventName = nil
		
		return true
	end,
	cancel = function(p11, _) --[[ line: 282 ]]
		-- upvalues: t_1 (ref), t (ref), appChatPerf (ref), timeToInteractiveTracker (ref)
		if not t_1[p11] then
			t_1[p11] = table.clone(t)
		end
		local var25 = t_1[p11]
		
		if not var25.started then
			appChatPerf:debug("TTI Cancel ignored: {} (reason=not_started)", p11)
			
			return false
		end
		local eventName = var25.eventName
		
		if eventName == nil then
			appChatPerf:debug("TTI Cancel ignored: {} (reason=missing_event_name)", p11)
			
			return false
		end
		appChatPerf:debug("TTI Cancel: {}", eventName)
		timeToInteractiveTracker.resetEvent(eventName)
		var25.started = false
		var25.interactive = false
		var25.interactiveTimestamp = nil
		var25.eventName = nil
		
		return true
	end,
	isActive = function(p12, p13) --[[ line: 306 ]]
		-- upvalues: t_5 (ref), t_1 (ref), t (ref)
		local var26 = t_5[p12]
		
		if not t_1[p12] then
			t_1[p12] = table.clone(t)
		end
		return if t_1[p12].started then var26.isContextMatching(p13) else false
	end,
	trackMilestone = function(p14, p15, p16) --[[ line: 320 ]]
		-- upvalues: timeToInteractiveTracker (ref), t_5 (ref), t_1 (ref), t (ref), appChatPerf (ref)
		if not timeToInteractiveTracker.trackMilestone then
			return false
		end
		local var27 = t_5[p14]
		
		if not t_1[p14] then
			t_1[p14] = table.clone(t)
		end
		local var28 = t_1[p14]
		
		if not var28.started or not var28.eventName then
			return false
		elseif var27.isContextMatching(p16) then
			appChatPerf:debug("TTI Milestone: {} -> {}", var28.eventName, p15)
			timeToInteractiveTracker.trackMilestone(var28.eventName, p15)
			
			return true
		end
		return false
	end,
	trackSubphase = function(p17, p18, p19, p20) --[[ line: 338 ]]
		-- upvalues: timeToInteractiveTracker (ref), t_5 (ref), t_1 (ref), t (ref), appChatPerf (ref)
		if not timeToInteractiveTracker.trackSubphase then
			return false
		end
		local var29 = t_5[p17]
		
		if not t_1[p17] then
			t_1[p17] = table.clone(t)
		end
		local var30 = t_1[p17]
		
		if not var30.started or not var30.eventName then
			return false
		elseif var29.isContextMatching(p20) then
			appChatPerf:debug("TTI Subphase: {} -> {}.{}", var30.eventName, p18, p19)
			timeToInteractiveTracker.trackSubphase(var30.eventName, p18, p19)
			
			return true
		end
		return false
	end,
	trackRequest = function(p21, p22, p23, p24) --[[ line: 361 ]]
		-- upvalues: timeToInteractiveTracker (ref), t_5 (ref), t_1 (ref), t (ref), appChatPerf (ref)
		if not timeToInteractiveTracker.trackRequest then
			return false
		end
		local var31 = t_5[p21]
		
		if not t_1[p21] then
			t_1[p21] = table.clone(t)
		end
		local var32 = t_1[p21]
		
		if not var32.started or not var32.eventName then
			return false
		elseif var31.isContextMatching(p24) then
			appChatPerf:debug("TTI Request: {} -> {}.{}", var32.eventName, p22, p23)
			timeToInteractiveTracker.trackRequest(var32.eventName, p22, p23)
			
			return true
		end
		return false
	end,
	getEventName = function(p25) --[[ line: 386 ]]
		-- upvalues: t_1 (ref), t (ref)
		if not t_1[p25] then
			t_1[p25] = table.clone(t)
		end
		local var33 = t_1[p25]
		
		return if var33.started then var33.eventName else nil
	end,
	Milestone = milestone,
	Hooks = timeToInteractiveTracker.Hooks,
	isInteractive = function(p26) --[[ line: 398 ]]
		-- upvalues: t_1 (ref), t (ref)
		if not t_1[p26] then
			t_1[p26] = table.clone(t)
		end
		return t_1[p26].interactive
	end,
	getInteractiveTimestamp = function(p27) --[[ line: 402 ]]
		-- upvalues: t_1 (ref), t (ref)
		if not t_1[p27] then
			t_1[p27] = table.clone(t)
		end
		return t_1[p27].interactiveTimestamp
	end
}