local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local DashModule = require(Parent.Dash)
local _ = require(Parent.LuauPolyfill)
local PromiseModule = require(Parent.Promise)
local ReactModule = require(Parent.React)
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local _ = require(GenericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext)
local _ = require(script.Parent.AbuseSheetFlowTypes)
local AbuseVectorModule = require(GenericAbuseReporting.Enums.AbuseVector)
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
local LinkOpenedSource = AnalyticsServiceModule.LinkOpenedSource
local SubmitSource = AnalyticsServiceModule.SubmitSource
local FormatErrorDetailForAnalyticsFunction = AnalyticsServiceModule.formatErrorDetailForAnalytics
local FFlagAbuseReportSubmissionTargetV4 = require(Parent.SharedFlags).FFlagAbuseReportSubmissionTargetV4
local FFlagAbuseReportImproveErrorEventsModule = require(GenericAbuseReporting.Flags.FFlagAbuseReportImproveErrorEvents)

local function getSubmissionTargetTelemetry(Target) --[[ Line: 60 ]]
	return if type(Target) == "table" then if Target.type == "default" then { target_type = "default" } elseif Target.type == "clientAction" then {
		target_type = "clientAction",
		client_action_name = if type(Target.name) == "string" then Target.name else nil
	} else {} else {}
end

local function useAbuseSheetAnalytics(p1, Abuse_vector, Target_id, Config_name) --[[ Line: 76 ]]
	-- upvalues: ReactModule (copy), DashModule (copy), SendAnalyticsEventFunction (copy)
	return (ReactModule.useCallback(function(p2) --[[ Line: 85 ]]
		-- upvalues: p1 (copy), DashModule (upval), Abuse_vector (copy), Target_id (copy), Config_name (copy), SendAnalyticsEventFunction (upval)
		local UnixTimestampMillis = DateTime.now().UnixTimestampMillis
		SendAnalyticsEventFunction({
			run_id = p1.runId,
			user_id = p1.userId,
			abuse_vector = Abuse_vector,
			target_id = Target_id,
			total_duration = if p1.openTime then UnixTimestampMillis - p1.openTime else 0,
			path = DashModule.map(p1.stack, function(p3) --[[ Line: 88 ]]
				return p3.nodeId
			end),
			config_name = Config_name
		}, p2)
	end, {
		p1.stack, p1.openTime, p1.runId, Abuse_vector, Target_id, Config_name
	}))
end

return function(p1, p2) --[[ Line: 148 | Named "useAbuseSheetFlow" ]]
	-- upvalues: ReactModule (copy), ResolveStartNodeFunction (copy), Reducer (copy), GetInitialStateFunction (copy), GetNewRunIdFunction (copy), UseOpenLinkModule (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), useAbuseSheetAnalytics (copy), SelectStoreFunction (copy), ResolveArConfigFunction (copy), TelemetryEventType (copy), DashModule (copy), FFlagAbuseReportImproveErrorEventsModule (copy), LinkOpenedSource (copy), FFlagAbuseReportSubmissionTargetV4 (copy), getSubmissionTargetTelemetry (copy), SendReportModule (copy), PromiseModule (copy), AbuseVectorModule (copy), SubmitSource (copy), FormatErrorDetailForAnalyticsFunction (copy), ContentNodeModule (copy)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 170 ]]
		-- upvalues: p1 (copy), ResolveStartNodeFunction (upval)
		return if p1 then ResolveStartNodeFunction(p1) else "root"
	end, { p1 })
	local UseReducerResult, UseReducerResult2 = ReactModule.useReducer(Reducer, nil, function() --[[ Line: 173 ]]
		-- upvalues: GetInitialStateFunction (upval), GetNewRunIdFunction (upval), UseMemoResult (copy)
		return GetInitialStateFunction(GetNewRunIdFunction(), DateTime.now().UnixTimestampMillis, UseMemoResult)
	end)
	local UseOpenLinkModuleResult = UseOpenLinkModule()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseAbuseSheetAnalyticsResult = useAbuseSheetAnalytics(UseReducerResult, p2.abuseVector, p2.analyticsTargetId, if p1 then p1.name else nil)
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 187 ]]
		-- upvalues: SelectStoreFunction (upval), UseReducerResult (copy)
		return SelectStoreFunction(UseReducerResult)
	end, { UseReducerResult })
	local UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 192 ]]
		-- upvalues: p1 (copy), ResolveArConfigFunction (upval), UseMemoResult1 (copy)
		return if p1 then ResolveArConfigFunction(p1, {
			attribute = p1.attributes,
			resources = p1.resources or {},
			store = UseMemoResult1
		}) else nil
	end, { p1, UseMemoResult1 })
	local UseRefResult = ReactModule.useRef(true)
	local UseRefResult1 = ReactModule.useRef(false)
	local IsOnFirstAction = p2.attemptTrigger == "onFirstAction"
	local None = ReactModule.useRef("none")
	local UseRefResult2 = ReactModule.useRef(UseAbuseSheetAnalyticsResult)
	UseRefResult2.current = UseAbuseSheetAnalyticsResult
	local UseRefResult3 = ReactModule.useRef(UseReducerResult.submissionState)
	UseRefResult3.current = UseReducerResult.submissionState
	
	local function _(p3) --[[ Line: 223 | Named "setPendingInlineAlert" ]]
		-- upvalues: p2 (copy)
		if p2.inlineAlertController then
			p2.inlineAlertController.setInlineAlert(p3)
		end
	end
	
	ReactModule.useEffect(function() --[[ Line: 231 ]]
		-- upvalues: None (copy), UseRefResult2 (copy), UseRefResult3 (copy), TelemetryEventType (upval)
		return function() --[[ Line: 232 ]]
			-- upvalues: None (upval), UseRefResult2 (upval), UseRefResult3 (upval), TelemetryEventType (upval)
			if None.current == "started" then
				None.current = "completed"
				UseRefResult2.current(if UseRefResult3.current == "completed" then { sub_event_type = TelemetryEventType.ReportCompleted } else { sub_event_type = TelemetryEventType.ReportAbandoned })
				
				return
			end
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 250 ]]
		-- upvalues: p2 (copy), UseRefResult (copy), GetNewRunIdFunction (upval), UseReducerResult2 (copy), UseMemoResult (copy), UseRefResult1 (copy), IsOnFirstAction (copy), UseAbuseSheetAnalyticsResult (copy), TelemetryEventType (upval), None (copy)
		if p2.open and not UseRefResult.current then
			UseReducerResult2({
				type = "reset",
				payload = {
					runId = GetNewRunIdFunction(),
					initialEnterTime = DateTime.now().UnixTimestampMillis,
					startNodeId = UseMemoResult
				}
			})
			
			if p2.inlineAlertController then
				p2.inlineAlertController.setInlineAlert(nil)
			end
			UseRefResult1.current = false
		end
		UseRefResult.current = false
		
		if p2.open and not IsOnFirstAction then
			UseAbuseSheetAnalyticsResult({ sub_event_type = TelemetryEventType.ReportStarted })
			None.current = "started"
		end
	end, { p2.open })
	ReactModule.useLayoutEffect(function() --[[ Line: 288 ]]
		-- upvalues: p1 (copy), UseReducerResult (copy), UseMemoResult (copy), UseReducerResult2 (copy)
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
					startNodeId = UseMemoResult
				}
			})
			
			return
		end
	end, { p1, UseMemoResult })
	local LastResult = DashModule.last(UseReducerResult.stack)
	local Node = UseMemoResult2 and (UseMemoResult2.nodes and (LastResult and UseMemoResult2.nodes[LastResult.nodeId]))
	ReactModule.useEffect(function() --[[ Line: 313 ]]
		-- upvalues: p2 (copy), UseRefResult1 (copy), p1 (copy), LastResult (copy), UseAbuseSheetAnalyticsResult (copy), TelemetryEventType (upval), UseMemoResult2 (copy), Node (copy), FFlagAbuseReportImproveErrorEventsModule (upval)
		if not p2.open or UseRefResult1.current then return end
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
				error_detail = if FFlagAbuseReportImproveErrorEventsModule then {
					error_message = "No config found for current nodeId",
					error_metadata = { node_id = LastResult.nodeId }
				} else {
					error_message = `No config found for current nodeId: {LastResult.nodeId}`
				}
			})
			UseRefResult1.current = true
		end
	end, {
		p2.open, p1, UseMemoResult2, LastResult, Node, UseAbuseSheetAnalyticsResult
	})
	
	local function onExternalSubmit(Submit_source) --[[ Line: 366 ]]
		-- upvalues: UseRefResult2 (copy), TelemetryEventType (upval), UseReducerResult2 (copy), UseRefResult3 (copy)
		UseRefResult2.current({
			sub_event_type = TelemetryEventType.Submit,
			submit_detail = { submit_source = Submit_source }
		})
		UseReducerResult2({ type = "completedSubmission" })
		UseRefResult3.current = "completed"
		UseRefResult2.current({
			sub_event_type = TelemetryEventType.SubmitSuccess,
			submit_detail = { submit_source = Submit_source }
		})
	end
	
	local function notifyFinish() --[[ Line: 379 ]]
		-- upvalues: p2 (copy), UseRefResult3 (copy), None (copy), UseRefResult2 (copy), TelemetryEventType (upval)
		if p2.onFinish then
			p2.onFinish({ didSubmit = UseRefResult3.current == "completed" })
		end
		if None.current == "started" then
			None.current = "completed"
			UseRefResult2.current(if UseRefResult3.current == "completed" then { sub_event_type = TelemetryEventType.ReportCompleted } else { sub_event_type = TelemetryEventType.ReportAbandoned })
		end
	end
	
	local function handleClose() --[[ Line: 394 ]]
		-- upvalues: notifyFinish (copy), p2 (copy)
		notifyFinish()
		p2.onClose()
	end
	
	local function reset(InlineAlert) --[[ Line: 403 ]]
		-- upvalues: GetNewRunIdFunction (upval), UseReducerResult2 (copy), UseMemoResult (copy), p2 (copy), None (copy)
		UseReducerResult2({
			type = "reset",
			payload = {
				runId = GetNewRunIdFunction(),
				initialEnterTime = DateTime.now().UnixTimestampMillis,
				startNodeId = UseMemoResult
			}
		})
		
		if p2.inlineAlertController then
			p2.inlineAlertController.setInlineAlert(InlineAlert)
		end
		None.current = "none"
	end
	
	ReactModule.useEffect(function() --[[ Line: 429 ]]
		-- upvalues: UseMemoResult2 (copy), Node (copy), UseReducerResult (copy), DashModule (upval), p2 (copy), UseReducerResult2 (copy), UseRefResult2 (copy), TelemetryEventType (upval), LinkOpenedSource (upval), UseOpenLinkModuleResult (copy), notifyFinish (copy), reset (copy), FFlagAbuseReportSubmissionTargetV4 (upval), getSubmissionTargetTelemetry (upval), SendReportModule (upval), UseRoactServiceResult (copy), PromiseModule (upval), AbuseVectorModule (upval), UseAbuseSheetAnalyticsResult (copy), SubmitSource (upval), UseRefResult3 (copy), FFlagAbuseReportImproveErrorEventsModule (upval), FormatErrorDetailForAnalyticsFunction (upval)
		if not UseMemoResult2 or not Node then return end
		if UseReducerResult.navigationState ~= "gotoNext" and UseReducerResult.navigationState ~= "gotoFailure" then return end
		local LastResult = DashModule.last(UseReducerResult.stack)
		
		if not LastResult or not LastResult.nodeId then
			warn("Navigation triggered but current page or nodeId is invalid")
			
			return
		end
		local Node1 = UseMemoResult2.nodes[LastResult.nodeId]
		
		if not Node1 then
			warn(`Navigation triggered but no config found for nodeId: {LastResult.nodeId}`)
			
			return
		end
		local function handleNextSimple(NodeId) --[[ Line: 451 ]]
			-- upvalues: p2 (upval), UseReducerResult2 (upval), UseRefResult2 (upval), TelemetryEventType (upval), LinkOpenedSource (upval), UseOpenLinkModuleResult (upval), notifyFinish (upval), reset (upval)
			if not NodeId then
				warn("handleNextSimple called with nil next value")
				p2.onClose()
				
				return
			end
			local UnixTimestampMillis = DateTime.now().UnixTimestampMillis
			local InlineAlert = if type(NodeId) == "table" then NodeId.inlineAlert else nil
			
			if type(NodeId) == "string" then
				UseReducerResult2({
					type = "gotoNode",
					payload = { nodeId = NodeId, enterTime = UnixTimestampMillis }
				})
				
				if p2.inlineAlertController then
					p2.inlineAlertController.setInlineAlert(nil)
					
					return
				end
			elseif type(NodeId) == "table" and NodeId.type == "goto" then
				if NodeId.replace then
					UseReducerResult2({
						type = "replaceAndGotoNode",
						payload = { nodeId = NodeId.nodeId, enterTime = UnixTimestampMillis }
					})
					
					if p2.inlineAlertController then
						p2.inlineAlertController.setInlineAlert(InlineAlert)
						
						return
					end
				else
					UseReducerResult2({
						type = "gotoNode",
						payload = { nodeId = NodeId.nodeId, enterTime = UnixTimestampMillis }
					})
					
					if p2.inlineAlertController then
						p2.inlineAlertController.setInlineAlert(nil)
						
						return
					end
				end
			elseif type(NodeId) == "table" and NodeId.type == "link" then
				UseRefResult2.current({
					sub_event_type = TelemetryEventType.LinkOpened,
					link_detail = { href = NodeId.href, source = LinkOpenedSource.NextAction }
				})
				UseOpenLinkModuleResult("", NodeId.href)
				notifyFinish()
				p2.onClose()
				
				return
			else
				if type(NodeId) == "table" and NodeId.type == "close" then
					notifyFinish()
					p2.onClose()
					
					return
				end
				if type(NodeId) == "table" and NodeId.type == "reset" then
					notifyFinish()
					reset(InlineAlert)
					
					return
				end
				warn(`Unknown next type: {typeof(NodeId)}, value: {NodeId}`)
				notifyFinish()
				p2.onClose()
			end
		end
		
		local Submission = UseMemoResult2.submission
		local Target = Submission and Submission.target
		local SubmissionTargetTelemetry = if FFlagAbuseReportSubmissionTargetV4 then getSubmissionTargetTelemetry(Target) else {}
		local Target_failure_reason = nil
		
		local function onSubmitForm() --[[ Line: 518 ]]
			-- upvalues: FFlagAbuseReportSubmissionTargetV4 (upval), Target (copy), SendReportModule (upval), UseRoactServiceResult (upval), Submission (copy), p2 (upval), Target_failure_reason (ref), PromiseModule (upval), AbuseVectorModule (upval)
			if not FFlagAbuseReportSubmissionTargetV4 then
				if p2.onCustomSubmit then
					if p2.abuseVector ~= AbuseVectorModule.MomentsFeed then
						return (p2.onCustomSubmit(Submission))
					end
					local OnCustomSubmitResult = p2.onCustomSubmit(Submission)
					
					if OnCustomSubmitResult ~= nil then
						return OnCustomSubmitResult
					end
				end
				return SendReportModule(UseRoactServiceResult, Submission.endpoint, Submission.data)
			elseif type(Target) == "table" and Target.type == "default" then
				return SendReportModule(UseRoactServiceResult, "abuse-reporting/v1/abuse-report", Submission.data)
			elseif type(Target) ~= "table" or Target.type ~= "clientAction" then
				Target_failure_reason = "unsupported-submission-target"
				
				return PromiseModule.reject("Unsupported submission target")
			else
				local Name = Target.name
				local ClientActionHandler = p2.clientActionHandlers and p2.clientActionHandlers[Name]
				
				if ClientActionHandler then
					return (ClientActionHandler(Submission))
				else
					Target_failure_reason = "missing-client-action-handler"
					
					return PromiseModule.reject(`Missing client action handler: {Name}`)
				end
			end
		end
		
		local NextOnFailure = if UseReducerResult.navigationState == "gotoFailure" then Node1.nextOnFailure else Node.next
		
		if not NextOnFailure then
			warn("Navigation target is nil, closing")
			p2.onClose()
		elseif type(NextOnFailure) == "table" and NextOnFailure.type == "submitForm" then
			local UnixTimestampMillis = DateTime.now().UnixTimestampMillis
			UseAbuseSheetAnalyticsResult({
				sub_event_type = TelemetryEventType.Submit,
				submit_detail = {
					submit_source = SubmitSource.Flow,
					target_type = SubmissionTargetTelemetry.target_type,
					client_action_name = SubmissionTargetTelemetry.client_action_name
				}
			})
			UseReducerResult2({ type = "startedSubmission" });
			(if FFlagAbuseReportSubmissionTargetV4 then PromiseModule.try(function() --[[ Line: 574 ]]
				-- upvalues: onSubmitForm (copy)
				return (onSubmitForm())
			end) else onSubmitForm()):andThen(function(Result) --[[ Line: 580 ]]
				-- upvalues: UseReducerResult2 (upval), UseAbuseSheetAnalyticsResult (upval), TelemetryEventType (upval), UnixTimestampMillis (copy), SubmitSource (upval), SubmissionTargetTelemetry (copy), UseRefResult3 (upval), handleNextSimple (copy), NextOnFailure (copy)
				UseReducerResult2({ type = "completedSubmission" })
				UseAbuseSheetAnalyticsResult({
					sub_event_type = TelemetryEventType.SubmitSuccess,
					submit_detail = {
						report_id = Result.responseBody and Result.responseBody.reportId,
						submit_api_duration = DateTime.now().UnixTimestampMillis - UnixTimestampMillis,
						submit_source = SubmitSource.Flow,
						target_type = SubmissionTargetTelemetry.target_type,
						client_action_name = SubmissionTargetTelemetry.client_action_name
					}
				})
				UseRefResult3.current = "completed"
				handleNextSimple(NextOnFailure.onSuccess)
			end):catch(function(Err) --[[ Line: 597 ]]
				-- upvalues: UseReducerResult2 (upval), UseAbuseSheetAnalyticsResult (upval), TelemetryEventType (upval), UnixTimestampMillis (copy), SubmitSource (upval), SubmissionTargetTelemetry (copy), Target_failure_reason (ref), FFlagAbuseReportImproveErrorEventsModule (upval), FormatErrorDetailForAnalyticsFunction (upval), DashModule (upval), UseRefResult3 (upval), NextOnFailure (copy), handleNextSimple (copy)
				UseReducerResult2({ type = "submissionFailed" })
				UseAbuseSheetAnalyticsResult({
					sub_event_type = TelemetryEventType.SubmitFail,
					submit_detail = {
						submit_api_duration = DateTime.now().UnixTimestampMillis - UnixTimestampMillis,
						submit_source = SubmitSource.Flow,
						target_type = SubmissionTargetTelemetry.target_type,
						client_action_name = SubmissionTargetTelemetry.client_action_name,
						target_failure_reason = Target_failure_reason
					}
				})
				UseAbuseSheetAnalyticsResult({
					sub_event_type = TelemetryEventType.Error,
					error_detail = if FFlagAbuseReportImproveErrorEventsModule then FormatErrorDetailForAnalyticsFunction("submitReport failed", Err) else {
						error_message = "submitReport: " .. DashModule.pretty(Err, { depth = 10 })
					}
				})
				UseRefResult3.current = "failed"
				
				if NextOnFailure.onFailure then
					handleNextSimple(NextOnFailure.onFailure)
				end
			end)
		else
			handleNextSimple(NextOnFailure)
		end
	end, { UseReducerResult.navigationState })
	local Inverted: boolean = #UseReducerResult.stack > 1 and not (UseReducerResult.submissionState == "completed")
	
	local function goBack() --[[ Line: 628 ]]
		-- upvalues: UseMemoResult2 (copy), Node (copy), LastResult (copy), Inverted (copy), UseReducerResult2 (copy), p2 (copy), UseAbuseSheetAnalyticsResult (copy), TelemetryEventType (upval)
		if not UseMemoResult2 or not Node or not LastResult then return end
		local UnixTimestampMillis = DateTime.now().UnixTimestampMillis
		
		if Inverted then
			UseReducerResult2({ type = "goBack" })
			
			if p2.inlineAlertController then
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
	local HasNextOnFailure: boolean = Node and Node.nextOnFailure ~= nil
	
	local function onNext(p3) --[[ Line: 650 ]]
		-- upvalues: UseMemoResult2 (copy), Node (copy), LastResult (copy), None (copy), UseRefResult2 (copy), TelemetryEventType (upval), UseReducerResult2 (copy), UseAbuseSheetAnalyticsResult (copy)
		if not UseMemoResult2 or not Node or not LastResult then return end
		if None.current == "none" then
			None.current = "started"
			UseRefResult2.current({ sub_event_type = TelemetryEventType.ReportStarted })
		end
		local UnixTimestampMillis = DateTime.now().UnixTimestampMillis
		UseReducerResult2({
			type = "updateDataAndNavigateNext",
			payload = {
				store = if p3 and p3.store then p3.store else {},
				expectedFromNodeId = LastResult.nodeId
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
	
	local function onFailure() --[[ Line: 681 ]]
		-- upvalues: UseMemoResult2 (copy), Node (copy), LastResult (copy), UseReducerResult2 (copy), UseAbuseSheetAnalyticsResult (copy), TelemetryEventType (upval)
		if UseMemoResult2 and Node and LastResult then
			local UnixTimestampMillis = DateTime.now().UnixTimestampMillis
			UseReducerResult2({
				type = "navigateFailure",
				payload = { expectedFromNodeId = LastResult.nodeId }
			})
			UseAbuseSheetAnalyticsResult({
				sub_event_type = TelemetryEventType.NodeDone,
				node_done_detail = {
					node_exit_reason = "failure",
					node_id = LastResult.nodeId,
					node_type = Node.type,
					node_duration = UnixTimestampMillis - LastResult.enterTime
				}
			})
			
			return
		end
	end
	
	local UseResult = ReactModule.useCallback(function() --[[ Line: 704 ]]
		-- upvalues: p2 (copy)
		if p2.inlineAlertController then
			p2.inlineAlertController.setInlineAlert(nil)
		end
	end, {})
	local UseMemoResult3 = ReactModule.useMemo(function() --[[ Line: 708 ]]
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
			onFailure = if HasNextOnFailure then onFailure else nil,
			goBack = goBack,
			onExternalSubmit = onExternalSubmit,
			store = UseMemoResult1,
			isSubmitting = UseReducerResult.submissionState == "submitting"
		}),
		currentNodeId = LastResult.nodeId,
		currentNodeType = Node.type,
		navigationDirection = UseReducerResult.lastNavigationDirection,
		analytics = UseMemoResult3,
		pendingInlineAlert = if p2.inlineAlertController then p2.inlineAlertController.pendingInlineAlert else nil,
		dismissInlineAlert = UseResult
	} else nil
end