local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local DashModule = require(Parent.Dash)
local _ = require(Parent.LuauPolyfill)
local ReactModule = require(Parent.React)
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local _ = require(GenericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext)
local _ = require(script.Parent.AbuseSheetFlowTypes)
local _ = require(GenericAbuseReporting.Enums.AbuseVector)
local AnalyticsServiceModule = require(GenericAbuseReporting.BeduiV2.Analytics.analyticsService)
local ContentNodeModule = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.ContentNode)
local GetInitialStateFunction = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.reducer).getInitialState
local ReducerModule = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.reducer)
local ResolveArConfigFunction = require(GenericAbuseReporting.BeduiV2.Utils.Resolver.configResolvers).resolveArConfig
local ResolveStartNodeFunction = require(GenericAbuseReporting.BeduiV2.Utils.Resolver.resolveStartNode).resolveStartNode
local SendReportModule = require(GenericAbuseReporting.BeduiV2.Api.sendReport)
local UseOpenLinkModule = require(GenericAbuseReporting.BeduiV2.Hooks.useOpenLink)
local GetNewRunIdFunction = ReducerModule.getNewRunId
local Reducer = ReducerModule.reducer
local SelectStoreFunction = ReducerModule.selectStore
local SendAnalyticsEventFunction = AnalyticsServiceModule.sendAnalyticsEvent
local TelemetryEventType = AnalyticsServiceModule.TelemetryEventType
local FFlagAbuseReportMenuV2 = require(Parent.SharedFlags).FFlagAbuseReportMenuV2
local FFlagFixAnalyticsForDynamicReportV2 = require(Parent.SharedFlags).FFlagFixAnalyticsForDynamicReportV2
local FFlagAbuseReportInlineAlertStateOutsideReducerModule = require(GenericAbuseReporting.Flags.FFlagAbuseReportInlineAlertStateOutsideReducer)

local function useAbuseSheetAnalytics(p1, Abuse_vector, Target_id, Name)
	-- upvalues: ReactModule (copy), DashModule (copy), FFlagAbuseReportMenuV2 (copy), SendAnalyticsEventFunction (copy)
	return (ReactModule.useCallback(function(p2)
		-- upvalues: p1 (copy), DashModule (upval), Abuse_vector (copy), Target_id (copy), FFlagAbuseReportMenuV2 (upval), Name (copy), SendAnalyticsEventFunction (upval)
		local UnixTimestampMillis = DateTime.now().UnixTimestampMillis
		SendAnalyticsEventFunction({
			run_id = p1.runId,
			user_id = p1.userId,
			abuse_vector = Abuse_vector,
			target_id = Target_id,
			total_duration = if p1.openTime then UnixTimestampMillis - p1.openTime else 0,
			path = DashModule.map(p1.stack, function(p3)
				return p3.nodeId
			end),
			config_name = if FFlagAbuseReportMenuV2 then Name else nil
		}, p2)
	end, {
		p1.stack, p1.openTime, p1.runId, Abuse_vector, Target_id,
		if FFlagAbuseReportMenuV2 then Name else nil
	}))
end

return function(p1, p2)
	-- upvalues: ReactModule (copy), FFlagAbuseReportMenuV2 (copy), ResolveStartNodeFunction (copy), Reducer (copy), GetInitialStateFunction (copy), GetNewRunIdFunction (copy), UseOpenLinkModule (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), useAbuseSheetAnalytics (copy), SelectStoreFunction (copy), ResolveArConfigFunction (copy), TelemetryEventType (copy), FFlagAbuseReportInlineAlertStateOutsideReducerModule (copy), FFlagFixAnalyticsForDynamicReportV2 (copy), DashModule (copy), SendReportModule (copy), ContentNodeModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FFlagAbuseReportMenuV2 (upval), p1 (copy), ResolveStartNodeFunction (upval)
		return if FFlagAbuseReportMenuV2 and p1 then ResolveStartNodeFunction(p1) else "root"
	end, { p1 })
	local UseReducerResult = nil
	local UseReducerResult2 = nil
	
	if FFlagAbuseReportMenuV2 then
		UseReducerResult, UseReducerResult2 = ReactModule.useReducer(Reducer, nil, function()
			-- upvalues: GetInitialStateFunction (upval), GetNewRunIdFunction (upval), UseMemoResult (copy)
			return GetInitialStateFunction(GetNewRunIdFunction(), DateTime.now().UnixTimestampMillis, UseMemoResult)
		end)
	else
		UseReducerResult, UseReducerResult2 = ReactModule.useReducer(Reducer, GetInitialStateFunction(GetNewRunIdFunction(), DateTime.now().UnixTimestampMillis, UseMemoResult))
	end
	local UseOpenLinkModuleResult = UseOpenLinkModule()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseAbuseSheetAnalyticsResult: (any) -> () = useAbuseSheetAnalytics(UseReducerResult, p2.abuseVector, p2.targetId, if FFlagAbuseReportMenuV2 and p1 then p1.name else nil)
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: SelectStoreFunction (upval), UseReducerResult (ref)
		return SelectStoreFunction(UseReducerResult)
	end, { UseReducerResult })
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), ResolveArConfigFunction (upval), UseMemoResult1 (copy)
		return if p1 then ResolveArConfigFunction(p1, {
			attribute = p1.attributes,
			resources = p1.resources or {},
			store = UseMemoResult1
		}) else nil
	end, { p1, UseMemoResult1 })
	local UseRefResult = ReactModule.useRef(true)
	local UseRefResult1 = ReactModule.useRef(false)
	local IsOnFirstAction: boolean = FFlagAbuseReportMenuV2 and p2.attemptTrigger == "onFirstAction"
	local None = ReactModule.useRef("none")
	local UseRefResult2 = ReactModule.useRef(UseAbuseSheetAnalyticsResult)
	UseRefResult2.current = UseAbuseSheetAnalyticsResult
	local UseRefResult3 = ReactModule.useRef(UseReducerResult.submissionState)
	UseRefResult3.current = UseReducerResult.submissionState
	
	local function _(p3)
		-- upvalues: p2 (copy)
		if p2.inlineAlertController then
			p2.inlineAlertController.setInlineAlert(p3)
		end
	end
	
	ReactModule.useEffect(function()
		-- upvalues: FFlagAbuseReportMenuV2 (upval), None (copy), UseRefResult2 (copy), UseRefResult3 (copy), TelemetryEventType (upval)
		if not FFlagAbuseReportMenuV2 then return end
		return function()
			-- upvalues: None (upval), UseRefResult2 (upval), UseRefResult3 (upval), TelemetryEventType (upval)
			if None.current == "started" then
				None.current = "completed"
				UseRefResult2.current(if UseRefResult3.current == "completed" then { sub_event_type = TelemetryEventType.ReportCompleted } else { sub_event_type = TelemetryEventType.ReportAbandoned })
				
				return
			end
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: p2 (copy), UseRefResult (copy), GetNewRunIdFunction (upval), UseReducerResult2 (ref), UseMemoResult (copy), FFlagAbuseReportInlineAlertStateOutsideReducerModule (upval), FFlagFixAnalyticsForDynamicReportV2 (upval), UseRefResult1 (copy), FFlagAbuseReportMenuV2 (upval), IsOnFirstAction (copy), UseAbuseSheetAnalyticsResult (copy), TelemetryEventType (upval), None (copy)
		if p2.open and not UseRefResult.current then
			UseReducerResult2({
				type = "reset",
				payload = {
					runId = GetNewRunIdFunction(),
					initialEnterTime = DateTime.now().UnixTimestampMillis,
					startNodeId = UseMemoResult
				}
			})
			
			if FFlagAbuseReportInlineAlertStateOutsideReducerModule and p2.inlineAlertController then
				p2.inlineAlertController.setInlineAlert(nil)
			end
			if FFlagFixAnalyticsForDynamicReportV2 then
				UseRefResult1.current = false
			end
		end
		UseRefResult.current = false
		
		if p2.open and not FFlagAbuseReportMenuV2 or FFlagAbuseReportMenuV2 and p2.open and not IsOnFirstAction then
			UseAbuseSheetAnalyticsResult({ sub_event_type = TelemetryEventType.ReportStarted })
			
			if FFlagAbuseReportMenuV2 then
				None.current = "started"
			end
		end
	end, { p2.open })
	ReactModule.useLayoutEffect(function()
		-- upvalues: FFlagAbuseReportMenuV2 (upval), p1 (copy), UseReducerResult (ref), UseMemoResult (copy), UseReducerResult2 (ref), FFlagAbuseReportInlineAlertStateOutsideReducerModule (upval)
		if not FFlagAbuseReportMenuV2 then return end
		if not p1 then return end
		if #UseReducerResult.stack > 1 then return end
		local StackEntry = UseReducerResult.stack[1]
		
		if not StackEntry or StackEntry.nodeId ~= UseMemoResult then
			local UnixTimestampMillis = DateTime.now().UnixTimestampMillis
			UseReducerResult2({
				type = "reset",
				payload = {
					runId = UseReducerResult.runId,
					initialEnterTime = UseReducerResult.openTime or UnixTimestampMillis,
					startNodeId = UseMemoResult,
					inlineAlert = if FFlagAbuseReportInlineAlertStateOutsideReducerModule then nil else UseReducerResult.pendingInlineAlert
				}
			})
			
			return
		end
	end, { p1, UseMemoResult })
	local LastResult = DashModule.last(UseReducerResult.stack)
	local Node = UseMemoResult2 and (UseMemoResult2.nodes and (LastResult and UseMemoResult2.nodes[LastResult.nodeId]))
	
	if not FFlagFixAnalyticsForDynamicReportV2 then
		if LastResult then
			if not LastResult.nodeId then
				UseAbuseSheetAnalyticsResult({
					sub_event_type = TelemetryEventType.Error,
					error_detail = {
						error_message = "Current page has no nodeId in abuse sheet flow."
					}
				})
			end
		else
			UseAbuseSheetAnalyticsResult({
				sub_event_type = TelemetryEventType.Error,
				error_detail = {
					error_message = "No current page found in abuse sheet flow."
				}
			})
		end
		if not UseMemoResult2 or not UseMemoResult2.nodes then
			UseAbuseSheetAnalyticsResult({
				sub_event_type = TelemetryEventType.Error,
				error_detail = {
					error_message = "Abuse sheet flow config or nodes is nil."
				}
			})
		end
		if not Node then
			UseAbuseSheetAnalyticsResult({
				sub_event_type = TelemetryEventType.Error,
				error_detail = {
					error_message = `No config found for current nodeId: {LastResult and LastResult.nodeId}`
				}
			})
		end
	end
	ReactModule.useEffect(function()
		-- upvalues: FFlagFixAnalyticsForDynamicReportV2 (upval), p2 (copy), UseRefResult1 (copy), p1 (copy), LastResult (copy), UseAbuseSheetAnalyticsResult (copy), TelemetryEventType (upval), UseMemoResult2 (copy), Node (copy)
		if not FFlagFixAnalyticsForDynamicReportV2 or not p2.open or UseRefResult1.current then return end
		if not p1 then return end
		if not LastResult then
			UseAbuseSheetAnalyticsResult({
				sub_event_type = TelemetryEventType.Error,
				error_detail = {
					error_message = "No current page found in abuse sheet flow."
				}
			})
			UseRefResult1.current = true
			
			return
		end
		if not LastResult.nodeId then
			UseAbuseSheetAnalyticsResult({
				sub_event_type = TelemetryEventType.Error,
				error_detail = {
					error_message = "Current page has no nodeId in abuse sheet flow."
				}
			})
			UseRefResult1.current = true
			
			return
		end
		if not UseMemoResult2 or not UseMemoResult2.nodes then
			UseAbuseSheetAnalyticsResult({
				sub_event_type = TelemetryEventType.Error,
				error_detail = {
					error_message = "Abuse sheet flow config or nodes is nil."
				}
			})
			UseRefResult1.current = true
			
			return
		end
		if not Node then
			UseAbuseSheetAnalyticsResult({
				sub_event_type = TelemetryEventType.Error,
				error_detail = {
					error_message = `No config found for current nodeId: {LastResult.nodeId}`
				}
			})
			UseRefResult1.current = true
		end
	end, {
		p2.open, p1, UseMemoResult2, LastResult, Node, UseAbuseSheetAnalyticsResult
	})
	
	local function notifyFinish()
		-- upvalues: FFlagAbuseReportMenuV2 (upval), p2 (copy), UseRefResult3 (copy), None (copy), UseRefResult2 (copy), TelemetryEventType (upval)
		if FFlagAbuseReportMenuV2 and p2.onFinish then
			p2.onFinish({ didSubmit = UseRefResult3.current == "completed" })
		end
		if FFlagAbuseReportMenuV2 and None.current == "started" then
			None.current = "completed"
			UseRefResult2.current(if UseRefResult3.current == "completed" then { sub_event_type = TelemetryEventType.ReportCompleted } else { sub_event_type = TelemetryEventType.ReportAbandoned })
		end
	end
	
	local function handleClose()
		-- upvalues: notifyFinish (copy), p2 (copy), FFlagAbuseReportMenuV2 (upval), UseReducerResult (ref), UseAbuseSheetAnalyticsResult (copy), TelemetryEventType (upval)
		notifyFinish()
		p2.onClose()
		
		if not FFlagAbuseReportMenuV2 then
			if UseReducerResult.submissionState ~= "completed" and UseReducerResult.openTime ~= nil then
				UseAbuseSheetAnalyticsResult({ sub_event_type = TelemetryEventType.ReportAbandoned })
				
				return
			end
			UseAbuseSheetAnalyticsResult({ sub_event_type = TelemetryEventType.ReportCompleted })
		end
	end
	
	local function reset(InlineAlert)
		-- upvalues: GetNewRunIdFunction (upval), UseReducerResult2 (ref), UseMemoResult (copy), FFlagAbuseReportMenuV2 (upval), FFlagAbuseReportInlineAlertStateOutsideReducerModule (upval), p2 (copy), None (copy)
		UseReducerResult2({
			type = "reset",
			payload = {
				runId = GetNewRunIdFunction(),
				initialEnterTime = DateTime.now().UnixTimestampMillis,
				startNodeId = UseMemoResult,
				inlineAlert = if FFlagAbuseReportMenuV2 and not FFlagAbuseReportInlineAlertStateOutsideReducerModule then InlineAlert else nil
			}
		})
		
		if FFlagAbuseReportInlineAlertStateOutsideReducerModule and p2.inlineAlertController then
			p2.inlineAlertController.setInlineAlert(InlineAlert)
		end
		None.current = "none"
	end
	
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult2 (copy), Node (copy), UseReducerResult (ref), DashModule (upval), p2 (copy), FFlagAbuseReportMenuV2 (upval), UseReducerResult2 (ref), FFlagAbuseReportInlineAlertStateOutsideReducerModule (upval), UseOpenLinkModuleResult (copy), handleClose (copy), notifyFinish (copy), reset (copy), SendReportModule (upval), UseRoactServiceResult (copy), UseAbuseSheetAnalyticsResult (copy), TelemetryEventType (upval), UseRefResult3 (copy)
		if not UseMemoResult2 or not Node then return end
		if UseReducerResult.navigationState ~= "gotoNext" then return end
		local LastResult = DashModule.last(UseReducerResult.stack)
		
		if not LastResult or not LastResult.nodeId then
			warn("Navigation triggered but current page or nodeId is invalid")
			
			return
		end
		if not UseMemoResult2.nodes[LastResult.nodeId] then
			warn(`Navigation triggered but no config found for nodeId: {LastResult.nodeId}`)
			
			return
		end
		local function handleNextSimple(NodeId)
			-- upvalues: p2 (upval), FFlagAbuseReportMenuV2 (upval), UseReducerResult2 (upval), FFlagAbuseReportInlineAlertStateOutsideReducerModule (upval), UseOpenLinkModuleResult (upval), handleClose (upval), notifyFinish (upval), reset (upval)
			if not NodeId then
				warn("handleNextSimple called with nil next value")
				p2.onClose()
				
				return
			end
			local UnixTimestampMillis = DateTime.now().UnixTimestampMillis
			local InlineAlert = if FFlagAbuseReportMenuV2 and type(NodeId) == "table" then NodeId.inlineAlert else nil
			
			if type(NodeId) == "string" then
				UseReducerResult2({
					type = "gotoNode",
					payload = { nodeId = NodeId, enterTime = UnixTimestampMillis }
				})
				
				if FFlagAbuseReportInlineAlertStateOutsideReducerModule and p2.inlineAlertController then
					p2.inlineAlertController.setInlineAlert(nil)
					
					return
				end
			elseif type(NodeId) == "table" and NodeId.type == "goto" then
				if FFlagAbuseReportMenuV2 and NodeId.replace then
					UseReducerResult2({
						type = "replaceAndGotoNode",
						payload = {
							nodeId = NodeId.nodeId,
							enterTime = UnixTimestampMillis,
							inlineAlert = if FFlagAbuseReportInlineAlertStateOutsideReducerModule then nil else InlineAlert
						}
					})
					
					if FFlagAbuseReportInlineAlertStateOutsideReducerModule and p2.inlineAlertController then
						p2.inlineAlertController.setInlineAlert(InlineAlert)
						
						return
					end
				else
					UseReducerResult2({
						type = "gotoNode",
						payload = { nodeId = NodeId.nodeId, enterTime = UnixTimestampMillis }
					})
					
					if FFlagAbuseReportInlineAlertStateOutsideReducerModule and p2.inlineAlertController then
						p2.inlineAlertController.setInlineAlert(nil)
						
						return
					end
				end
			elseif type(NodeId) == "table" and NodeId.type == "link" then
				UseOpenLinkModuleResult("", NodeId.href)
				handleClose()
				
				return
			else
				if type(NodeId) == "table" and NodeId.type == "close" then
					handleClose()
					
					return
				end
				if FFlagAbuseReportMenuV2 and type(NodeId) == "table" and NodeId.type == "reset" then
					notifyFinish()
					reset(InlineAlert)
					
					return
				end
				warn(`Unknown next type: {typeof(NodeId)}, value: {NodeId}`)
				handleClose()
			end
		end
		
		local function _()
			-- upvalues: UseMemoResult2 (upval), FFlagAbuseReportMenuV2 (upval), p2 (upval), SendReportModule (upval), UseRoactServiceResult (upval)
			local Submission = UseMemoResult2.submission
			
			return if FFlagAbuseReportMenuV2 and p2.onCustomSubmit then p2.onCustomSubmit(Submission) else SendReportModule(UseRoactServiceResult, Submission.endpoint, Submission.data)
		end
		
		local Next = Node.next
		
		if not Next then
			warn("currentNode.next is nil, closing")
			p2.onClose()
			
			return
		end
		if type(Next) == "table" and Next.type == "submitForm" then
			local UnixTimestampMillis = DateTime.now().UnixTimestampMillis
			UseAbuseSheetAnalyticsResult({ sub_event_type = TelemetryEventType.Submit })
			UseReducerResult2({ type = "startedSubmission" })
			local Submission = UseMemoResult2.submission;
			(if FFlagAbuseReportMenuV2 and p2.onCustomSubmit then p2.onCustomSubmit(Submission) else SendReportModule(UseRoactServiceResult, Submission.endpoint, Submission.data)):andThen(function(Result)
				-- upvalues: UseReducerResult2 (upval), UseAbuseSheetAnalyticsResult (upval), TelemetryEventType (upval), UnixTimestampMillis (copy), FFlagAbuseReportMenuV2 (upval), UseRefResult3 (upval), handleNextSimple (copy), Next (copy)
				UseReducerResult2({ type = "completedSubmission" })
				UseAbuseSheetAnalyticsResult({
					sub_event_type = TelemetryEventType.SubmitSuccess,
					submit_detail = {
						report_id = Result.responseBody and Result.responseBody.reportId,
						submit_api_duration = DateTime.now().UnixTimestampMillis - UnixTimestampMillis
					}
				})
				
				if FFlagAbuseReportMenuV2 then
					UseRefResult3.current = "completed"
				end
				handleNextSimple(Next.onSuccess)
			end):catch(function(Err)
				-- upvalues: UseReducerResult2 (upval), UseAbuseSheetAnalyticsResult (upval), TelemetryEventType (upval), UnixTimestampMillis (copy), DashModule (upval), FFlagAbuseReportMenuV2 (upval), UseRefResult3 (upval), Next (copy), handleNextSimple (copy)
				UseReducerResult2({ type = "submissionFailed" })
				UseAbuseSheetAnalyticsResult({
					sub_event_type = TelemetryEventType.SubmitFail,
					submit_detail = {
						submit_api_duration = DateTime.now().UnixTimestampMillis - UnixTimestampMillis
					}
				})
				UseAbuseSheetAnalyticsResult({
					sub_event_type = TelemetryEventType.Error,
					error_detail = {
						error_message = "submitReport: " .. DashModule.pretty(Err, { depth = 10 })
					}
				})
				
				if FFlagAbuseReportMenuV2 then
					UseRefResult3.current = "failed"
				end
				if Next.onFailure then
					handleNextSimple(Next.onFailure)
				end
			end)
			
			return
		else
			handleNextSimple(Next)
		end
	end, { UseReducerResult.navigationState })
	local Inverted: boolean = #UseReducerResult.stack > 1 and not (UseReducerResult.submissionState == "completed")
	
	local function goBack()
		-- upvalues: UseMemoResult2 (copy), Node (copy), LastResult (copy), Inverted (copy), UseReducerResult2 (ref), FFlagAbuseReportInlineAlertStateOutsideReducerModule (upval), p2 (copy), UseAbuseSheetAnalyticsResult (copy), TelemetryEventType (upval)
		if not UseMemoResult2 or not Node or not LastResult then return end
		local UnixTimestampMillis = DateTime.now().UnixTimestampMillis
		
		if Inverted then
			UseReducerResult2({ type = "goBack" })
			
			if FFlagAbuseReportInlineAlertStateOutsideReducerModule and p2.inlineAlertController then
				p2.inlineAlertController.setInlineAlert(nil)
			end
			UseAbuseSheetAnalyticsResult({
				sub_event_type = TelemetryEventType.NodeDone,
				node_done_detail = {
					node_exit_reason = "back",
					node_id = LastResult.nodeId,
					node_type = Node.type,
					node_duration = UnixTimestampMillis - LastResult.enterTime
				}
			})
		end
	end
	
	local HasNext: boolean = Node and Node.next ~= nil
	
	local function onNext(p3)
		-- upvalues: UseMemoResult2 (copy), Node (copy), LastResult (copy), FFlagAbuseReportMenuV2 (upval), None (copy), UseRefResult2 (copy), TelemetryEventType (upval), UseReducerResult2 (ref), UseAbuseSheetAnalyticsResult (copy)
		if not UseMemoResult2 or not Node or not LastResult then return end
		if FFlagAbuseReportMenuV2 and None.current == "none" then
			None.current = "started"
			UseRefResult2.current({ sub_event_type = TelemetryEventType.ReportStarted })
		end
		local UnixTimestampMillis = DateTime.now().UnixTimestampMillis
		UseReducerResult2({
			type = "updateDataAndNavigateNext",
			payload = {
				store = if p3 and p3.store then p3.store else {},
				expectedFromNodeId = if FFlagAbuseReportMenuV2 then LastResult.nodeId else nil
			}
		})
		UseAbuseSheetAnalyticsResult({
			sub_event_type = TelemetryEventType.NodeDone,
			node_done_detail = {
				node_exit_reason = "next",
				node_id = LastResult.nodeId,
				node_type = Node.type,
				node_duration = UnixTimestampMillis - LastResult.enterTime
			}
		})
	end
	
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseReducerResult2 (ref), FFlagAbuseReportInlineAlertStateOutsideReducerModule (upval), p2 (copy)
		UseReducerResult2({ type = "clearInlineAlert" })
		
		if FFlagAbuseReportInlineAlertStateOutsideReducerModule and p2.inlineAlertController then
			p2.inlineAlertController.setInlineAlert(nil)
		end
	end, {})
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: UseAbuseSheetAnalyticsResult (copy)
		return { sendEvent = UseAbuseSheetAnalyticsResult }
	end, { UseAbuseSheetAnalyticsResult })
	
	return if UseMemoResult2 and Node and LastResult then {
		config = UseMemoResult2,
		canGoBack = Inverted,
		goBack = goBack,
		reset = reset,
		isSubmitting = UseReducerResult.submissionState == "submitting",
		display = UseMemoResult2.display,
		onClose = handleClose,
		currentPageElement = ReactModule.createElement(ContentNodeModule, {
			key = LastResult.nodeId,
			node = Node,
			onNext = if HasNext then onNext else nil,
			goBack = if FFlagAbuseReportMenuV2 then goBack else nil,
			store = UseMemoResult1,
			isSubmitting = UseReducerResult.submissionState == "submitting"
		}),
		currentNodeId = if FFlagAbuseReportMenuV2 then LastResult.nodeId else nil,
		currentNodeType = if FFlagAbuseReportMenuV2 then Node.type else nil,
		navigationDirection = if FFlagAbuseReportMenuV2 then UseReducerResult.lastNavigationDirection else nil,
		analytics = UseMemoResult3,
		pendingInlineAlert = if FFlagAbuseReportMenuV2 then if FFlagAbuseReportInlineAlertStateOutsideReducerModule then if p2.inlineAlertController then p2.inlineAlertController.pendingInlineAlert else nil else UseReducerResult.pendingInlineAlert else nil,
		dismissInlineAlert = UseResult
	} else nil
end