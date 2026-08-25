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

local function _(p0)
	-- upvalues: t_1 (ref), t (ref)
	if not t_1[p0] then
		t_1[p0] = table.clone(t)
	end
	return t_1[p0]
end

local var7 = nil
local t_2 = {}
local t_3 = { category = appChatPerfEventInfoModule.TTI_CATEGORY }
local var10 = nil

local function alwaysMatch(_)
	return true, nil
end

local function matchConversation(p1)
	-- upvalues: var7 (write)
	if p1.conversationId and var7 and p1.conversationId ~= var7 then
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
		getColdStart = function(p2)
			return p2.coldStart == true
		end,
		isContextMatching = alwaysMatch
	},
	ChatConversationTTI = {
		getColdStart = function(p3)
			-- upvalues: t_2 (ref)
			local conversationId = p3.conversationId
			local var16 = conversationId ~= nil and not t_2[conversationId]
			
			if conversationId then
				t_2[conversationId] = true
			end
			return var16
		end,
		isContextMatching = matchConversation,
		onStart = function(p4)
			-- upvalues: var7 (write), var10 (write)
			local conversationId = p4.conversationId
			
			if conversationId ~= nil and conversationId ~= var7 then
				var7 = conversationId
				
				if var10 then
					var10("ChatConversationTTI")
				end
			end
		end
	},
	MessageSendTTI = t_4,
	MessageReceiveTTI = t_4
}

local function buildTTIMetadata(p5, p6)
	-- upvalues: appChatPerfEventInfoModule (ref), cryoModule (ref), t_3 (write)
	local TTIPage = appChatPerfEventInfoModule.getTTIPage(p5)
	
	return cryoModule.Dictionary.join(t_3, { subcategory = TTIPage, page = TTIPage }, p6 or {})
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
		-- upvalues: var10 (write)
		var10 = value
	end,
	start = function(p7, p8)
		-- upvalues: t_1 (ref), appChatPerf (ref), t_5 (ref), appChatPerfEventInfoModule (ref), t_3 (write), timeToInteractiveTracker (ref), buildTTIMetadata (ref), cryoModule (ref)
		local var18 = t_1[p7]
		
		if var18 and var18.started then
			appChatPerf:debug("TTI Start ignored: {} (reason=already_started, eventName={})", p7, var18.eventName)
			
			return false
		end
		local var19 = t_5[p7]
		
		if var19.onStart then
			var19.onStart(p8)
		end
		local coldStart = var19.getColdStart(p8)
		local var21 = if var19.useBaseName then appChatPerfEventInfoModule.getTTIBaseName(p7) else appChatPerfEventInfoModule.buildTTIEventName(p7, t_3.placement, coldStart)
		t_1[p7] = {
			started = true,
			interactive = false,
			interactiveTimestamp = nil,
			eventName = var21
		}
		appChatPerf:debug("TTI Start: {} (coldStart={}, conversationId={}, entryPoint={})", var21, coldStart, p8.conversationId, p8.entryPoint)
		timeToInteractiveTracker.trackStart(var21)
		timeToInteractiveTracker.updateMetadata(var21, buildTTIMetadata(p7, cryoModule.Dictionary.join(p8, { coldStart = coldStart })))
		
		return true
	end,
	finish = function(p9, p10)
		-- upvalues: t_5 (ref), t_1 (ref), t (ref), appChatPerf (ref), timeToInteractiveTracker (ref), buildTTIMetadata (ref), milestone (ref), fFlagEnablePLTPrefetchCallbacks (ref), pageGateModule (ref)
		local var22 = t_5[p9]
		
		if not t_1[p9] then
			t_1[p9] = table.clone(t)
		end
		local var23 = t_1[p9]
		
		if not var23.started then
			appChatPerf:debug("TTI End ignored: {} (reason=not_started)", p9)
			
			return false
		end
		local var24, var25 = var22.isContextMatching(p10)
		
		if not var24 then
			appChatPerf:debug("TTI End ignored: {} (reason={})", p9, var25 or "unknown")
			
			return false
		end
		local eventName = var23.eventName
		
		if eventName == nil then
			appChatPerf:debug("TTI End ignored: {} (reason=missing_event_name)", p9)
			
			return false
		end
		appChatPerf:debug("TTI End: {} (numElementsRendered={})", eventName, p10.numElementsRendered)
		timeToInteractiveTracker.updateMetadata(eventName, buildTTIMetadata(p9, p10))
		
		if timeToInteractiveTracker.trackMilestone then
			timeToInteractiveTracker.trackMilestone(eventName, milestone.SurfaceReady)
		end
		if fFlagEnablePLTPrefetchCallbacks and p9 == "ChatLandingTTI" then
			pageGateModule.signal(pageGateModule.Page.Party, pageGateModule.Milestone.SurfaceReady)
		end
		timeToInteractiveTracker.trackEnd(eventName)
		var23.started = false
		
		if not var22.noInteractiveState then
			var23.interactive = true
			var23.interactiveTimestamp = os.clock()
		end
		var23.eventName = nil
		
		return true
	end,
	cancel = function(p11, _)
		-- upvalues: t_1 (ref), t (ref), appChatPerf (ref), timeToInteractiveTracker (ref)
		if not t_1[p11] then
			t_1[p11] = table.clone(t)
		end
		local var26 = t_1[p11]
		
		if not var26.started then
			appChatPerf:debug("TTI Cancel ignored: {} (reason=not_started)", p11)
			
			return false
		end
		local eventName = var26.eventName
		
		if eventName == nil then
			appChatPerf:debug("TTI Cancel ignored: {} (reason=missing_event_name)", p11)
			
			return false
		end
		appChatPerf:debug("TTI Cancel: {}", eventName)
		timeToInteractiveTracker.resetEvent(eventName)
		var26.started = false
		var26.interactive = false
		var26.interactiveTimestamp = nil
		var26.eventName = nil
		
		return true
	end,
	isActive = function(p12, p13)
		-- upvalues: t_5 (ref), t_1 (ref), t (ref)
		local var27 = t_5[p12]
		
		if not t_1[p12] then
			t_1[p12] = table.clone(t)
		end
		return if t_1[p12].started then var27.isContextMatching(p13) else false
	end,
	trackMilestone = function(p14, p15, p16)
		-- upvalues: timeToInteractiveTracker (ref), t_5 (ref), t_1 (ref), t (ref), appChatPerf (ref)
		if not timeToInteractiveTracker.trackMilestone then
			return false
		end
		local var28 = t_5[p14]
		
		if not t_1[p14] then
			t_1[p14] = table.clone(t)
		end
		local var29 = t_1[p14]
		
		if not var29.started or not var29.eventName then
			return false
		elseif var28.isContextMatching(p16) then
			appChatPerf:debug("TTI Milestone: {} -> {}", var29.eventName, p15)
			timeToInteractiveTracker.trackMilestone(var29.eventName, p15)
			
			return true
		end
		return false
	end,
	trackSubphase = function(p17, p18, p19, p20)
		-- upvalues: timeToInteractiveTracker (ref), t_5 (ref), t_1 (ref), t (ref), appChatPerf (ref)
		if not timeToInteractiveTracker.trackSubphase then
			return false
		end
		local var30 = t_5[p17]
		
		if not t_1[p17] then
			t_1[p17] = table.clone(t)
		end
		local var31 = t_1[p17]
		
		if not var31.started or not var31.eventName then
			return false
		elseif var30.isContextMatching(p20) then
			appChatPerf:debug("TTI Subphase: {} -> {}.{}", var31.eventName, p18, p19)
			timeToInteractiveTracker.trackSubphase(var31.eventName, p18, p19)
			
			return true
		end
		return false
	end,
	trackRequest = function(p21, p22, p23, p24)
		-- upvalues: timeToInteractiveTracker (ref), t_5 (ref), t_1 (ref), t (ref), appChatPerf (ref)
		if not timeToInteractiveTracker.trackRequest then
			return false
		end
		local var32 = t_5[p21]
		
		if not t_1[p21] then
			t_1[p21] = table.clone(t)
		end
		local var33 = t_1[p21]
		
		if not var33.started or not var33.eventName then
			return false
		elseif var32.isContextMatching(p24) then
			appChatPerf:debug("TTI Request: {} -> {}.{}", var33.eventName, p22, p23)
			timeToInteractiveTracker.trackRequest(var33.eventName, p22, p23)
			
			return true
		end
		return false
	end,
	getEventName = function(p25)
		-- upvalues: t_1 (ref), t (ref)
		if not t_1[p25] then
			t_1[p25] = table.clone(t)
		end
		local var34 = t_1[p25]
		
		return if var34.started then var34.eventName else nil
	end,
	Milestone = milestone,
	Hooks = timeToInteractiveTracker.Hooks,
	isInteractive = function(p26)
		-- upvalues: t_1 (ref), t (ref)
		if not t_1[p26] then
			t_1[p26] = table.clone(t)
		end
		return t_1[p26].interactive
	end,
	getInteractiveTimestamp = function(p27)
		-- upvalues: t_1 (ref), t (ref)
		if not t_1[p27] then
			t_1[p27] = table.clone(t)
		end
		return t_1[p27].interactiveTimestamp
	end
}