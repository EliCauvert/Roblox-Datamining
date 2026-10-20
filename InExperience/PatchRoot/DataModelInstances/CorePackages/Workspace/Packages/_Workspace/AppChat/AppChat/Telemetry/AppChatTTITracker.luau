local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppChatPerf = require(AppChat.Logger):new("AppChatPerf")
local TimeToInteractiveTracker = require(Parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local Milestone = TimeToInteractiveTracker.Milestone
local PageGateModule = require(Parent.PageGate)
local FFlagEnablePLTPrefetchCallbacks = PageGateModule.FFlagEnablePLTPrefetchCallbacks
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.SocialCommon)
local AppChatPerfEventInfoModule = require(AppChat.Telemetry.AppChatPerfEventInfo)
local _ = require(AppChat.Contexts.ChatPlacementContext)
local Tbl = {
	started = false,
	interactive = false,
	interactiveTimestamp = nil,
	eventName = nil
}
local t = {}

local function _(Key)
	-- upvalues: t (copy), Tbl (copy)
	if not t[Key] then
		t[Key] = table.clone(Tbl)
	end
	return t[Key]
end

local ConversationId = nil
local t1 = {}
local JoinResult = { category = AppChatPerfEventInfoModule.TTI_CATEGORY }
local Callback = nil

local function matchConversation(p1)
	-- upvalues: ConversationId (ref)
	if p1.conversationId and ConversationId and p1.conversationId ~= ConversationId then
		return false, "conversation_id_mismatch"
	else
		return true, nil
	end
end

local MessageReceiveTTI = {
	useBaseName = true,
	noInteractiveState = true,
	getColdStart = function(_): boolean
		return false
	end,
	isContextMatching = matchConversation
}
local config = {
	ChatLandingTTI = {
		getColdStart = function(p1): boolean
			return p1.coldStart == true
		end,
		isContextMatching = function(_)
			return true, nil
		end
	},
	ChatConversationTTI = {
		getColdStart = function(p1): boolean
			-- upvalues: t1 (copy)
			local ConversationId = p1.conversationId
			local Inverted: boolean = ConversationId ~= nil and not t1[ConversationId]
			
			if ConversationId then
				t1[ConversationId] = true
			end
			return Inverted
		end,
		isContextMatching = matchConversation,
		onStart = function(p1)
			-- upvalues: ConversationId (ref), Callback (ref)
			local ConversationId1 = p1.conversationId
			
			if ConversationId1 ~= nil and ConversationId1 ~= ConversationId then
				ConversationId = ConversationId1
				
				if Callback then
					Callback("ChatConversationTTI")
				end
			end
		end
	},
	MessageSendTTI = MessageReceiveTTI,
	MessageReceiveTTI = MessageReceiveTTI
}

local function buildTTIMetadata(Key, JoinResult1)
	-- upvalues: AppChatPerfEventInfoModule (copy), CryoModule (copy), JoinResult (ref)
	local TTIPage = AppChatPerfEventInfoModule.getTTIPage(Key)
	
	return CryoModule.Dictionary.join(JoinResult, { subcategory = TTIPage, page = TTIPage }, JoinResult1 or {})
end

return {
	setSharedContext = function(p1)
		-- upvalues: JoinResult (ref), CryoModule (copy), AppChatPerf (copy)
		JoinResult = CryoModule.Dictionary.join(JoinResult, p1)
		AppChatPerf:debug("Shared context updated: placement={}, entryPoint={}, hasActiveParty={}", p1.placement or "nil", p1.entryPoint or "nil", p1.hasActiveParty or false)
	end,
	getSharedContext = function()
		-- upvalues: JoinResult (ref)
		return JoinResult
	end,
	setOnConversationSwitch = function(Value)
		-- upvalues: Callback (ref)
		Callback = Value
	end,
	start = function(Key, p1): boolean
		-- upvalues: t (copy), AppChatPerf (copy), config (copy), AppChatPerfEventInfoModule (copy), JoinResult (ref), TimeToInteractiveTracker (copy), buildTTIMetadata (copy), CryoModule (copy)
		local Entry = t[Key]
		
		if Entry and Entry.started then
			AppChatPerf:debug("TTI Start ignored: {} (reason=already_started, eventName={})", Key, Entry.eventName)
			
			return false
		end
		local Entry1 = config[Key]
		
		if Entry1.onStart then
			Entry1.onStart(p1)
		end
		local ColdStart = Entry1.getColdStart(p1)
		local TTIBaseName = if Entry1.useBaseName then AppChatPerfEventInfoModule.getTTIBaseName(Key) else AppChatPerfEventInfoModule.buildTTIEventName(Key, JoinResult.placement, ColdStart)
		t[Key] = {
			started = true,
			interactive = false,
			interactiveTimestamp = nil,
			eventName = TTIBaseName
		}
		AppChatPerf:debug("TTI Start: {} (coldStart={}, conversationId={}, entryPoint={})", TTIBaseName, ColdStart, p1.conversationId, p1.entryPoint)
		TimeToInteractiveTracker.trackStart(TTIBaseName)
		TimeToInteractiveTracker.updateMetadata(TTIBaseName, buildTTIMetadata(Key, CryoModule.Dictionary.join(p1, { coldStart = ColdStart })))
		
		return true
	end,
	finish = function(Key, p1): boolean
		-- upvalues: config (copy), t (copy), Tbl (copy), AppChatPerf (copy), TimeToInteractiveTracker (copy), buildTTIMetadata (copy), Milestone (copy), FFlagEnablePLTPrefetchCallbacks (copy), PageGateModule (copy)
		local Entry = config[Key]
		
		if not t[Key] then
			t[Key] = table.clone(Tbl)
		end
		local Entry1 = t[Key]
		
		if not Entry1.started then
			AppChatPerf:debug("TTI End ignored: {} (reason=not_started)", Key)
			
			return false
		end
		local IsContextMatching, IsContextMatching2 = Entry.isContextMatching(p1)
		
		if not IsContextMatching then
			AppChatPerf:debug("TTI End ignored: {} (reason={})", Key, IsContextMatching2 or "unknown")
			
			return false
		end
		local EventName = Entry1.eventName
		
		if EventName == nil then
			AppChatPerf:debug("TTI End ignored: {} (reason=missing_event_name)", Key)
			
			return false
		end
		AppChatPerf:debug("TTI End: {} (numElementsRendered={})", EventName, p1.numElementsRendered)
		TimeToInteractiveTracker.updateMetadata(EventName, buildTTIMetadata(Key, p1))
		
		if TimeToInteractiveTracker.trackMilestone then
			TimeToInteractiveTracker.trackMilestone(EventName, Milestone.SurfaceReady)
		end
		if FFlagEnablePLTPrefetchCallbacks and Key == "ChatLandingTTI" then
			PageGateModule.signal(PageGateModule.Page.Party, PageGateModule.Milestone.SurfaceReady)
		end
		TimeToInteractiveTracker.trackEnd(EventName)
		Entry1.started = false
		
		if not Entry.noInteractiveState then
			Entry1.interactive = true
			Entry1.interactiveTimestamp = os.clock()
		end
		Entry1.eventName = nil
		
		return true
	end,
	cancel = function(Key, _): boolean
		-- upvalues: t (copy), Tbl (copy), AppChatPerf (copy), TimeToInteractiveTracker (copy)
		if not t[Key] then
			t[Key] = table.clone(Tbl)
		end
		local Entry = t[Key]
		
		if not Entry.started then
			AppChatPerf:debug("TTI Cancel ignored: {} (reason=not_started)", Key)
			
			return false
		end
		local EventName = Entry.eventName
		
		if EventName == nil then
			AppChatPerf:debug("TTI Cancel ignored: {} (reason=missing_event_name)", Key)
			
			return false
		else
			AppChatPerf:debug("TTI Cancel: {}", EventName)
			TimeToInteractiveTracker.resetEvent(EventName)
			Entry.started = false
			Entry.interactive = false
			Entry.interactiveTimestamp = nil
			Entry.eventName = nil
			
			return true
		end
	end,
	isActive = function(Key, p1)
		-- upvalues: config (copy), t (copy), Tbl (copy)
		local Entry = config[Key]
		
		if not t[Key] then
			t[Key] = table.clone(Tbl)
		end
		return if t[Key].started then Entry.isContextMatching(p1) else false
	end,
	trackMilestone = function(EventName, SurfaceReady, p1): boolean
		-- upvalues: TimeToInteractiveTracker (copy), config (copy), t (copy), Tbl (copy), AppChatPerf (copy)
		if not TimeToInteractiveTracker.trackMilestone then
			return false
		end
		local Entry = config[EventName]
		
		if not t[EventName] then
			t[EventName] = table.clone(Tbl)
		end
		local Entry1 = t[EventName]
		
		if not Entry1.started or not Entry1.eventName then
			return false
		elseif Entry.isContextMatching(p1) then
			AppChatPerf:debug("TTI Milestone: {} -> {}", Entry1.eventName, SurfaceReady)
			TimeToInteractiveTracker.trackMilestone(Entry1.eventName, SurfaceReady)
			
			return true
		else
			return false
		end
	end,
	trackSubphase = function(EventName, p1, p2, p3): boolean
		-- upvalues: TimeToInteractiveTracker (copy), config (copy), t (copy), Tbl (copy), AppChatPerf (copy)
		if not TimeToInteractiveTracker.trackSubphase then
			return false
		end
		local Entry = config[EventName]
		
		if not t[EventName] then
			t[EventName] = table.clone(Tbl)
		end
		local Entry1 = t[EventName]
		
		if not Entry1.started or not Entry1.eventName then
			return false
		elseif Entry.isContextMatching(p3) then
			AppChatPerf:debug("TTI Subphase: {} -> {}.{}", Entry1.eventName, p1, p2)
			TimeToInteractiveTracker.trackSubphase(Entry1.eventName, p1, p2)
			
			return true
		else
			return false
		end
	end,
	trackRequest = function(EventName, p1, p2, p3): boolean
		-- upvalues: TimeToInteractiveTracker (copy), config (copy), t (copy), Tbl (copy), AppChatPerf (copy)
		if not TimeToInteractiveTracker.trackRequest then
			return false
		end
		local Entry = config[EventName]
		
		if not t[EventName] then
			t[EventName] = table.clone(Tbl)
		end
		local Entry1 = t[EventName]
		
		if not Entry1.started or not Entry1.eventName then
			return false
		elseif Entry.isContextMatching(p3) then
			AppChatPerf:debug("TTI Request: {} -> {}.{}", Entry1.eventName, p1, p2)
			TimeToInteractiveTracker.trackRequest(Entry1.eventName, p1, p2)
			
			return true
		else
			return false
		end
	end,
	getEventName = function(Key)
		-- upvalues: t (copy), Tbl (copy)
		if not t[Key] then
			t[Key] = table.clone(Tbl)
		end
		local Entry = t[Key]
		
		return if Entry.started then Entry.eventName else nil
	end,
	Milestone = Milestone,
	Hooks = TimeToInteractiveTracker.Hooks,
	isInteractive = function(Key)
		-- upvalues: t (copy), Tbl (copy)
		if not t[Key] then
			t[Key] = table.clone(Tbl)
		end
		return t[Key].interactive
	end,
	getInteractiveTimestamp = function(Key)
		-- upvalues: t (copy), Tbl (copy)
		if not t[Key] then
			t[Key] = table.clone(Tbl)
		end
		return t[Key].interactiveTimestamp
	end
}