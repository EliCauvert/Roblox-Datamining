local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local Parent = AmpV2Wizard.Parent
local ReactModule = require(Parent.React)
local _ = require(AmpV2Wizard.Types)
local WalkerReducerModule = require(AmpV2Wizard.walkerReducer)
local FFlagAmpV2WizardAnalyticsModule = require(AmpV2Wizard.FFlagAmpV2WizardAnalytics)
local FFlagAmpV2WizardAuthorizationModalModule = require(AmpV2Wizard.FFlagAmpV2WizardAuthorizationModal)
local VpcEntryAnalyticsModule = require(AmpV2Wizard.VpcEntryAnalytics)
local FFlagLuaAppAmpWizardSendAnalyticsSessionId = require(Parent.SharedFlags).FFlagLuaAppAmpWizardSendAnalyticsSessionId
local EventNames = require(AmpV2Wizard.WizardEventNames).EventNames

local function buildEventContext(Current, Surface, RootFlow)
	-- upvalues: FFlagLuaAppAmpWizardSendAnalyticsSessionId (copy)
	local CurrentNodeId = Current.currentNodeId
	local Node = if CurrentNodeId == nil then nil else Current.nodes[CurrentNodeId]
	
	return {
		flowId = Current.flowId,
		chosenFlow = Current.chosenFlow,
		rootFlow = RootFlow,
		surface = Surface,
		node = CurrentNodeId,
		nodeType = if Node == nil then nil else Node.type,
		analyticsSessionId = if FFlagLuaAppAmpWizardSendAnalyticsSessionId and Current.analyticsSessionId ~= "" then Current.analyticsSessionId else nil
	}
end

local function _(Tbl, List)
	local Copy = table.clone(Tbl)
	
	if List ~= nil then
		for i, value in List do
			Copy[i] = value
		end
	end
	return Copy
end

local function noopSend(_, _) end

return function(p1)
	-- upvalues: noopSend (copy), FFlagAmpV2WizardAnalyticsModule (copy), AmpV2Wizard (copy), ReactModule (copy), WalkerReducerModule (copy), FFlagAmpV2WizardAuthorizationModalModule (copy), buildEventContext (copy), EventNames (copy), FFlagLuaAppAmpWizardSendAnalyticsSessionId (copy), VpcEntryAnalyticsModule (copy)
	local Api = p1.api
	local Target = p1.target
	local RootFlow = p1.rootFlow
	local Surface = p1.surface
	local OnExitFunction = p1.onExit
	local OnEventFunction = p1.onEvent
	local SendEvent = if FFlagAmpV2WizardAnalyticsModule then p1.sendEvent or require(AmpV2Wizard.WizardAnalytics).default else noopSend
	local UseReducerResult, UseReducerResult2 = ReactModule.useReducer(WalkerReducerModule.reduce, p1.initialFragment, WalkerReducerModule.init)
	local UseRefResult = ReactModule.useRef(UseReducerResult)
	UseRefResult.current = UseReducerResult
	local UseRefResult1 = ReactModule.useRef(false)
	local Node = if UseReducerResult.currentNodeId then UseReducerResult.nodes[UseReducerResult.currentNodeId] else nil
	local UseRefResult3 = nil
	local UseRefResult2 = nil
	local UseResult = nil
	
	if FFlagAmpV2WizardAuthorizationModalModule then
		UseRefResult3 = ReactModule.useRef(nil)
		UseRefResult2 = ReactModule.useRef(0)
		
		if Node ~= nil then
			if Node.type == "VerificationMethodSelection" and UseReducerResult.currentNodeId ~= nil then
				UseRefResult3.current = {
					nodeId = UseReducerResult.currentNodeId,
					node = Node,
					flow = UseReducerResult.chosenFlow
				}
			elseif Node.behavior == nil or Node.behavior.presentsOverPrevious ~= true then
				UseRefResult3.current = nil
			end
		end
		UseResult = ReactModule.useCallback(function()
			-- upvalues: UseRefResult (copy), UseRefResult3 (ref), UseRefResult2 (ref), UseRefResult1 (copy), WalkerReducerModule (upval), UseReducerResult2 (copy)
			local Current = UseRefResult.current
			local Node = if Current.currentNodeId then Current.nodes[Current.currentNodeId] else nil
			
			if Current.exited or Node == nil or Node.type ~= "SessionPolling" then return end
			local Current1 = UseRefResult3.current
			
			if Current1 ~= nil and Current1.flow ~= Current.chosenFlow then
				Current1 = nil
			end
			local UseRefResult4 = UseRefResult2
			UseRefResult4.current += 1
			UseRefResult1.current = false
			local config = {
				type = "DismissPresentation",
				nodeId = if Current1 then Current1.nodeId else nil,
				node = if Current1 then Current1.node else nil
			}
			UseRefResult.current = WalkerReducerModule.reduce(Current, config)
			UseReducerResult2(config)
		end, {})
	end
	local EventContext = buildEventContext(UseReducerResult, Surface, RootFlow)
	local UseResult1 = ReactModule.useCallback(function(p2, List)
		-- upvalues: SendEvent (ref), buildEventContext (upval), UseRefResult (copy), Surface (copy), RootFlow (copy)
		local Callback: (any, any) -> () = SendEvent
		local Copy = table.clone((buildEventContext(UseRefResult.current, Surface, RootFlow)))
		
		if List ~= nil then
			for i, value in List do
				Copy[i] = value
			end
		end
		Callback(p2, Copy)
	end, { SendEvent, Surface, RootFlow })
	local UseRefResult4 = ReactModule.useRef(p1.initialFragment.resumeSourcePage ~= nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult4 (copy), UseRefResult (copy), UseResult1 (copy), EventNames (upval), FFlagLuaAppAmpWizardSendAnalyticsSessionId (upval), VpcEntryAnalyticsModule (upval), Surface (copy), RootFlow (copy), p1 (copy)
		if UseRefResult4.current or UseRefResult.current.currentNodeId == nil then return end
		UseRefResult4.current = true
		UseResult1(EventNames.FlowStart)
		
		if FFlagLuaAppAmpWizardSendAnalyticsSessionId then
			local Current = UseRefResult.current
			VpcEntryAnalyticsModule.sendWizardLaunch(Current.analyticsStrings, Current.analyticsSessionId, Surface, RootFlow, Current.chosenFlow, p1.initialFragment.entry)
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseReducerResult (copy), UseResult1 (copy), EventNames (upval)
		if UseReducerResult.currentNodeId ~= nil then
			UseResult1(EventNames.NodeShown)
			
			return
		end
	end, {
		UseReducerResult.currentNodeId,
		UseReducerResult.chosenFlow
	})
	local Exited = UseReducerResult.exited
	local ExitResult = UseReducerResult.exitResult
	local UseRefResult5 = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: Exited (copy), UseRefResult5 (copy), ExitResult (copy), UseRefResult4 (copy), UseResult1 (copy), EventNames (upval), OnExitFunction (copy)
		if not Exited or UseRefResult5.current then return end
		UseRefResult5.current = true
		
		if ExitResult == nil then return end
		if UseRefResult4.current then
			UseResult1(EventNames.FlowExit, { reason = ExitResult.reason, outcome = ExitResult.outcome })
		end
		if OnExitFunction then
			OnExitFunction(ExitResult)
		end
	end, { Exited, ExitResult, OnExitFunction, UseResult1 })
	
	return {
		dismissPresentation = UseResult,
		currentNode = Node,
		currentNodeId = UseReducerResult.currentNodeId,
		isLoading = UseReducerResult.isLoading,
		exited = Exited,
		presentingError = UseReducerResult.presentingError,
		acknowledgeError = ReactModule.useCallback(function()
			-- upvalues: UseReducerResult2 (copy)
			UseReducerResult2({ type = "AcknowledgeError" })
		end, {}),
		analyticsStrings = UseReducerResult.analyticsStrings,
		analyticsSessionId = UseReducerResult.analyticsSessionId,
		report = ReactModule.useCallback(function(Outcome, Data)
			-- upvalues: UseRefResult (copy), UseRefResult1 (copy), FFlagAmpV2WizardAuthorizationModalModule (upval), buildEventContext (upval), Surface (copy), RootFlow (copy), SendEvent (ref), EventNames (upval), OnEventFunction (copy), UseReducerResult2 (copy), UseRefResult2 (ref), Api (copy), Target (copy)
			local Current = UseRefResult.current
			local CurrentNodeId = Current.currentNodeId
			
			if CurrentNodeId == nil or Current.exited or Current.isLoading or UseRefResult1.current then return end
			local Node = Current.nodes[CurrentNodeId]
			
			if FFlagAmpV2WizardAuthorizationModalModule and Outcome == "Poll" and (Node == nil or Node.type ~= "SessionPolling") then return end
			local Transition = if Node then Node.transitions[Outcome] else nil
			local EventContext = buildEventContext(Current, Surface, RootFlow)
			local Callback: (any, any) -> () = SendEvent
			local NodeOutcome = EventNames.NodeOutcome
			local config = {
				outcome = Outcome,
				transitionKind = if Transition then Transition.kind else nil
			}
			local Copy = table.clone(EventContext)
			
			if config ~= nil then
				for i, value in config do
					Copy[i] = value
				end
			end
			Callback(NodeOutcome, Copy)
			
			if OnEventFunction then
				OnEventFunction({
					flowId = Current.flowId,
					node = CurrentNodeId,
					outcome = Outcome,
					transitionKind = if Transition then Transition.kind else nil
				})
			end
			UseReducerResult2({ type = "ReportOutcome", outcome = Outcome, data = Data })
			
			if Transition ~= nil and Transition.kind == "Continue" then
				UseRefResult1.current = true
				local Copy1 = table.clone(Current.history)
				table.insert(Copy1, {
					flow = Current.chosenFlow,
					node = CurrentNodeId,
					outcome = Outcome,
					data = Data
				})
				local Current1 = if UseRefResult2 then UseRefResult2.current else nil
				Api["continue"]({
					flowId = Current.flowId,
					state = Current.flowState,
					target = Target,
					rootFlow = RootFlow,
					flowInputs = Current.flowInputs,
					history = Copy1,
					payload = Data
				}):andThen(function(Result)
					-- upvalues: UseRefResult2 (upval), Current1 (copy), UseRefResult1 (upval), UseReducerResult2 (upval)
					if not UseRefResult2 or UseRefResult2.current == Current1 then
						UseRefResult1.current = false
						UseReducerResult2({ type = "FragmentLoaded", response = Result })
						
						return
					end
				end):catch(function(Err)
					-- upvalues: UseRefResult2 (upval), Current1 (copy), UseRefResult1 (upval), SendEvent (upval), EventNames (upval), EventContext (copy), UseReducerResult2 (upval)
					if UseRefResult2 and UseRefResult2.current ~= Current1 then return end
					UseRefResult1.current = false
					local Callback: (any, any) -> () = SendEvent
					local ContinueFailed = EventNames.ContinueFailed
					local config = { errorMessage = tostring(Err) }
					local Copy = table.clone(EventContext)
					
					if config ~= nil then
						for i, value in config do
							Copy[i] = value
						end
					end
					Callback(ContinueFailed, Copy)
					UseReducerResult2({ type = "ContinueFailed", message = tostring(Err) })
				end)
			end
		end, {
			Api, Target, RootFlow, Surface, OnEventFunction, SendEvent, UseRefResult2
		}),
		eventContext = EventContext,
		logEvent = UseResult1
	}
end