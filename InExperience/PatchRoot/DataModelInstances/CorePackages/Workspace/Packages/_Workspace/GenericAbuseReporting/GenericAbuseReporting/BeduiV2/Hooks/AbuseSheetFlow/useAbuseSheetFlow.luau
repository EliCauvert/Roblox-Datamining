local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local dashModule = require(parent.Dash)
local _ = require(parent.LuauPolyfill)
local promiseModule = require(parent.Promise)
local reactModule = require(parent.React)
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local _ = require(genericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext)
local _ = require(script.Parent.AbuseSheetFlowTypes)
local abuseVectorModule = require(genericAbuseReporting.Enums.AbuseVector)
local analyticsServiceModule = require(genericAbuseReporting.BeduiV2.Analytics.analyticsService)
local contentNodeModule = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.ContentNode)
local getInitialState = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.reducer).getInitialState
local reducerModule = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.reducer)
local resolveArConfig = require(genericAbuseReporting.BeduiV2.Utils.Resolver.configResolvers).resolveArConfig
local resolveStartNode = require(genericAbuseReporting.BeduiV2.Utils.Resolver.resolveStartNode).resolveStartNode
local sendReportModule = require(genericAbuseReporting.BeduiV2.Api.sendReport)
local useOpenLinkModule = require(genericAbuseReporting.BeduiV2.Hooks.useOpenLink)
local getNewRunId = reducerModule.getNewRunId
local reducer = reducerModule.reducer
local selectStore = reducerModule.selectStore
local sendAnalyticsEvent = analyticsServiceModule.sendAnalyticsEvent
local telemetryEventType = analyticsServiceModule.TelemetryEventType
local linkOpenedSource = analyticsServiceModule.LinkOpenedSource
local submitSource = analyticsServiceModule.SubmitSource
local fFlagAbuseReportMenuV2 = require(parent.SharedFlags).FFlagAbuseReportMenuV2
local fFlagEnableReportingFlowForMomentsFeed = require(parent.SharedFlags).FFlagEnableReportingFlowForMomentsFeed
local fFlagFixAnalyticsForDynamicReportV2 = require(parent.SharedFlags).FFlagFixAnalyticsForDynamicReportV2
local fFlagAbuseReportLinkOpenedAnalytics = require(parent.SharedFlags).FFlagAbuseReportLinkOpenedAnalytics
local fFlagAbuseReportSceneSelectionNextOnFailureModule = require(genericAbuseReporting.Flags.FFlagAbuseReportSceneSelectionNextOnFailure)
local fFlagAbuseReportSceneSelectionSubmitTrackingModule = require(genericAbuseReporting.Flags.FFlagAbuseReportSceneSelectionSubmitTracking)
local fFlagAbuseReportSubmissionTargetV4 = require(parent.SharedFlags).FFlagAbuseReportSubmissionTargetV4

local function getSubmissionTargetTelemetry(p1)
	return if type(p1) == "table" then if p1.type == "default" then { target_type = "default" } elseif p1.type == "clientAction" then {
		target_type = "clientAction",
		client_action_name = if type(p1.name) == "string" then p1.name else nil
	} else {} else {}
end

local function useAbuseSheetAnalytics(p1, p2, p3, p4)
	-- upvalues: reactModule (ref), dashModule (ref), fFlagAbuseReportMenuV2 (ref), sendAnalyticsEvent (ref)
	return reactModule.useCallback(function(p1)
		-- upvalues: p1 (ref), dashModule (copy), p2 (ref), p3 (ref), fFlagAbuseReportMenuV2 (copy), p4 (ref), sendAnalyticsEvent (copy)
		sendAnalyticsEvent({
			run_id = p1.runId,
			user_id = p1.userId,
			abuse_vector = p2,
			target_id = p3,
			total_duration = if p1.openTime then DateTime.now().UnixTimestampMillis - p1.openTime else 0,
			path = dashModule.map(p1.stack, function(p1)
				return p1.nodeId
			end),
			config_name = if fFlagAbuseReportMenuV2 then p4 else nil
		}, p1)
	end, {
		p1.stack, p1.openTime, p1.runId, p2, p3,
		if fFlagAbuseReportMenuV2 then p4 else nil
	})
end

return function(p1, p2)
	-- upvalues: reactModule (ref), fFlagAbuseReportMenuV2 (ref), resolveStartNode (ref), reducer (ref), getInitialState (ref), getNewRunId (ref), useOpenLinkModule (ref), useRoactService (ref), roactNetworking (ref), useAbuseSheetAnalytics (ref), selectStore (ref), resolveArConfig (ref), telemetryEventType (ref), fFlagFixAnalyticsForDynamicReportV2 (ref), dashModule (ref), fFlagAbuseReportLinkOpenedAnalytics (ref), linkOpenedSource (ref), fFlagAbuseReportSubmissionTargetV4 (ref), getSubmissionTargetTelemetry (ref), sendReportModule (ref), promiseModule (ref), fFlagEnableReportingFlowForMomentsFeed (ref), abuseVectorModule (ref), fFlagAbuseReportSceneSelectionNextOnFailureModule (ref), fFlagAbuseReportSceneSelectionSubmitTrackingModule (ref), submitSource (ref), contentNodeModule (ref)
	local var1, var2
	local var3 = reactModule.useMemo(function()
		-- upvalues: fFlagAbuseReportMenuV2 (copy), p1 (ref), resolveStartNode (copy)
		return if fFlagAbuseReportMenuV2 and p1 then resolveStartNode(p1) else "root"
	end, { p1 })
	local _ = nil
	local _ = nil
	
	if fFlagAbuseReportMenuV2 then
		local var1, var2 = reactModule.useReducer(reducer, nil, function()
			-- upvalues: getInitialState (copy), getNewRunId (copy), var3 (ref)
			return getInitialState(getNewRunId(), DateTime.now().UnixTimestampMillis, var3)
		end)
		var1 = var1
		var2 = var2
	else
		local var3, var4 = reactModule.useReducer(reducer, getInitialState(getNewRunId(), DateTime.now().UnixTimestampMillis, var3))
		var1 = var3
		var2 = var4
	end
	local var5 = useOpenLinkModule()
	local var6 = useRoactService(roactNetworking)
	local var7 = useAbuseSheetAnalytics(var1, p2.abuseVector, p2.targetId, if fFlagAbuseReportMenuV2 and p1 then p1.name else nil)
	local var8 = reactModule.useMemo(function()
		-- upvalues: selectStore (copy), var1 (write)
		return selectStore(var1)
	end, { var1 })
	local var9 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), resolveArConfig (copy), var8 (ref)
		return if p1 then resolveArConfig(p1, {
			attribute = p1.attributes,
			resources = p1.resources or {},
			store = var8
		}) else nil
	end, { p1, var8 })
	local var1 = reactModule.useRef(true)
	local var2 = reactModule.useRef(false)
	local var3 = fFlagAbuseReportMenuV2 and p2.attemptTrigger == "onFirstAction"
	local none = reactModule.useRef("none")
	local var4 = reactModule.useRef(var7)
	var4.current = var7
	local var5 = reactModule.useRef(var1.submissionState)
	var5.current = var1.submissionState
	
	local function _(value)
		-- upvalues: p2 (ref)
		if p2.inlineAlertController then
			p2.inlineAlertController.setInlineAlert(value)
		end
	end
	
	reactModule.useEffect(function()
		-- upvalues: fFlagAbuseReportMenuV2 (copy), none (ref), var4 (ref), var5 (ref), telemetryEventType (copy)
		if fFlagAbuseReportMenuV2 then
			return function()
				-- upvalues: none (copy), var4 (copy), var5 (copy), telemetryEventType (copy)
				if none.current == "started" then
					none.current = "completed"
					var4.current(if var5.current == "completed" then { sub_event_type = telemetryEventType.ReportCompleted } else { sub_event_type = telemetryEventType.ReportAbandoned })
					
					return
				end
			end
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), var1 (ref), getNewRunId (copy), var2 (write), var3 (ref), fFlagFixAnalyticsForDynamicReportV2 (copy), var2 (ref), fFlagAbuseReportMenuV2 (copy), var3 (ref), var7 (ref), telemetryEventType (copy), none (ref)
		if p2.open and not var1.current then
			var2({
				type = "reset",
				payload = {
					runId = getNewRunId(),
					initialEnterTime = DateTime.now().UnixTimestampMillis,
					startNodeId = var3
				}
			})
			
			if p2.inlineAlertController then
				p2.inlineAlertController.setInlineAlert(nil)
			end
			if fFlagFixAnalyticsForDynamicReportV2 then
				var2.current = false
			end
		end
		var1.current = false
		
		if p2.open and not fFlagAbuseReportMenuV2 or fFlagAbuseReportMenuV2 and p2.open and not var3 then
			var7({ sub_event_type = telemetryEventType.ReportStarted })
			
			if fFlagAbuseReportMenuV2 then
				none.current = "started"
			end
		end
	end, { p2.open })
	reactModule.useLayoutEffect(function()
		-- upvalues: fFlagAbuseReportMenuV2 (copy), p1 (ref), var1 (write), var3 (ref), var2 (write)
		if not fFlagAbuseReportMenuV2 then return end
		if not p1 then return end
		if #var1.stack > 1 then return end
		local var1 = var1.stack[1]
		
		if var1 and var1.nodeId == var3 then
			return
		end
		var2({
			type = "reset",
			payload = {
				runId = var1.runId,
				initialEnterTime = var1.openTime or DateTime.now().UnixTimestampMillis,
				startNodeId = var3
			}
		})
	end, { p1, var3 })
	local var1 = dashModule.last(var1.stack)
	local nodeId = var9 and (var9.nodes and (var1 and var9.nodes[var1.nodeId]))
	
	if not fFlagFixAnalyticsForDynamicReportV2 then
		if not var1 then
			var7({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "No current page found in abuse sheet flow."
				}
			})
		elseif not var1.nodeId then
			var7({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "Current page has no nodeId in abuse sheet flow."
				}
			})
		end
		if not var9 or not var9.nodes then
			var7({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "Abuse sheet flow config or nodes is nil."
				}
			})
		end
		if not nodeId then
			var7({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = `No config found for current nodeId: {var1 and var1.nodeId}`
				}
			})
		end
	end
	reactModule.useEffect(function()
		-- upvalues: fFlagFixAnalyticsForDynamicReportV2 (copy), p2 (ref), var2 (ref), p1 (ref), var1 (ref), var7 (ref), telemetryEventType (copy), var9 (ref), nodeId (ref)
		if not fFlagFixAnalyticsForDynamicReportV2 or not p2.open or var2.current then return end
		if not p1 then return end
		if not var1 then
			var7({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "No current page found in abuse sheet flow."
				}
			})
			var2.current = true
			
			return
		elseif not var1.nodeId then
			var7({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "Current page has no nodeId in abuse sheet flow."
				}
			})
			var2.current = true
			
			return
		elseif not var9 or not var9.nodes then
			var7({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "Abuse sheet flow config or nodes is nil."
				}
			})
			var2.current = true
			
			return
		elseif not nodeId then
			var7({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = `No config found for current nodeId: {var1.nodeId}`
				}
			})
			var2.current = true
		end
	end, {
		p2.open, p1, var9, var1, nodeId, var7
	})
	
	local function onExternalSubmit(p1)
		-- upvalues: var4 (ref), telemetryEventType (copy), var2 (write), var5 (ref)
		var4.current({
			sub_event_type = telemetryEventType.Submit,
			submit_detail = { submit_source = p1 }
		})
		var2({ type = "completedSubmission" })
		var5.current = "completed"
		var4.current({
			sub_event_type = telemetryEventType.SubmitSuccess,
			submit_detail = { submit_source = p1 }
		})
	end
	
	local function notifyFinish()
		-- upvalues: fFlagAbuseReportMenuV2 (copy), p2 (ref), var5 (ref), none (ref), var4 (ref), telemetryEventType (copy)
		if fFlagAbuseReportMenuV2 and p2.onFinish then
			p2.onFinish({ didSubmit = var5.current == "completed" })
		end
		if fFlagAbuseReportMenuV2 and none.current == "started" then
			none.current = "completed"
			var4.current(if var5.current == "completed" then { sub_event_type = telemetryEventType.ReportCompleted } else { sub_event_type = telemetryEventType.ReportAbandoned })
		end
	end
	
	local function handleClose()
		-- upvalues: notifyFinish (ref), p2 (ref), fFlagAbuseReportMenuV2 (copy), var1 (write), var7 (ref), telemetryEventType (copy)
		notifyFinish()
		p2.onClose()
		
		if not fFlagAbuseReportMenuV2 then
			if var1.submissionState ~= "completed" and var1.openTime ~= nil then
				var7({ sub_event_type = telemetryEventType.ReportAbandoned })
				
				return
			end
			var7({ sub_event_type = telemetryEventType.ReportCompleted })
		end
	end
	
	local function reset(value)
		-- upvalues: getNewRunId (copy), var2 (write), var3 (ref), p2 (ref), none (ref)
		var2({
			type = "reset",
			payload = {
				runId = getNewRunId(),
				initialEnterTime = DateTime.now().UnixTimestampMillis,
				startNodeId = var3
			}
		})
		
		if p2.inlineAlertController then
			p2.inlineAlertController.setInlineAlert(value)
		end
		none.current = "none"
	end
	
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), nodeId (ref), var1 (write), dashModule (copy), p2 (ref), fFlagAbuseReportMenuV2 (copy), var2 (write), fFlagAbuseReportLinkOpenedAnalytics (copy), var4 (ref), telemetryEventType (copy), linkOpenedSource (copy), var5 (ref), handleClose (ref), notifyFinish (ref), reset (ref), fFlagAbuseReportSubmissionTargetV4 (copy), getSubmissionTargetTelemetry (copy), sendReportModule (copy), var6 (ref), promiseModule (copy), fFlagEnableReportingFlowForMomentsFeed (copy), abuseVectorModule (copy), fFlagAbuseReportSceneSelectionNextOnFailureModule (copy), var7 (ref), fFlagAbuseReportSceneSelectionSubmitTrackingModule (copy), submitSource (copy), var5 (ref)
		if not var9 or not nodeId then return end
		if var1.navigationState ~= "gotoNext" and var1.navigationState ~= "gotoFailure" then return end
		local var1 = dashModule.last(var1.stack)
		
		if not var1 or not var1.nodeId then
			warn("Navigation triggered but current page or nodeId is invalid")
			
			return
		end
		local nodeId_1 = var9.nodes[var1.nodeId]
		
		if not nodeId_1 then
			warn(`Navigation triggered but no config found for nodeId: {var1.nodeId}`)
			
			return
		end
		local function handleNextSimple(p1)
			-- upvalues: p2 (copy), fFlagAbuseReportMenuV2 (copy), var2 (copy), fFlagAbuseReportLinkOpenedAnalytics (copy), var4 (copy), telemetryEventType (copy), linkOpenedSource (copy), var5 (copy), handleClose (copy), notifyFinish (copy), reset (copy)
			if not p1 then
				warn("handleNextSimple called with nil next value")
				p2.onClose()
				
				return
			end
			local unixTimestampMillis = DateTime.now().UnixTimestampMillis
			local var1 = if fFlagAbuseReportMenuV2 and type(p1) == "table" then p1.inlineAlert else nil
			
			if type(p1) == "string" then
				var2({
					type = "gotoNode",
					payload = { nodeId = p1, enterTime = unixTimestampMillis }
				})
				
				if p2.inlineAlertController then
					p2.inlineAlertController.setInlineAlert(nil)
					
					return
				end
			elseif type(p1) ~= "table" or p1.type ~= "goto" then
				if type(p1) == "table" and p1.type == "link" then
					if fFlagAbuseReportLinkOpenedAnalytics then
						var4.current({
							sub_event_type = telemetryEventType.LinkOpened,
							link_detail = { href = p1.href, source = linkOpenedSource.NextAction }
						})
					end
					var5("", p1.href)
					handleClose()
					
					return
				elseif type(p1) == "table" and p1.type == "close" then
					handleClose()
					
					return
				elseif fFlagAbuseReportMenuV2 and type(p1) == "table" and p1.type == "reset" then
					notifyFinish()
					reset(var1)
					
					return
				end
				warn(`Unknown next type: {typeof(p1)}, value: {p1}`)
				handleClose()
			elseif fFlagAbuseReportMenuV2 and p1.replace then
				var2({
					type = "replaceAndGotoNode",
					payload = { nodeId = p1.nodeId, enterTime = unixTimestampMillis }
				})
				
				if p2.inlineAlertController then
					p2.inlineAlertController.setInlineAlert(var1)
					
					return
				end
			else
				var2({
					type = "gotoNode",
					payload = { nodeId = p1.nodeId, enterTime = unixTimestampMillis }
				})
				
				if p2.inlineAlertController then
					p2.inlineAlertController.setInlineAlert(nil)
					
					return
				end
			end
		end
		
		local submission = var9.submission
		local target = submission and submission.target
		local var2 = if fFlagAbuseReportSubmissionTargetV4 then getSubmissionTargetTelemetry(target) else {}
		local var3 = nil
		
		local function onSubmitForm()
			-- upvalues: fFlagAbuseReportSubmissionTargetV4 (copy), target (ref), sendReportModule (copy), var6 (copy), submission (ref), p2 (copy), var3 (write), promiseModule (copy), fFlagEnableReportingFlowForMomentsFeed (copy), abuseVectorModule (copy), fFlagAbuseReportMenuV2 (copy)
			if fFlagAbuseReportSubmissionTargetV4 then
				if type(target) == "table" and target.type == "default" then
					return sendReportModule(var6, "abuse-reporting/v1/abuse-report", submission.data)
				elseif type(target) == "table" and target.type == "clientAction" then
					local name = target.name
					local var1 = p2.clientActionHandlers and p2.clientActionHandlers[name]
					
					if var1 then
						return var1(submission)
					end
					var3 = "missing-client-action-handler"
					
					return promiseModule.reject(`Missing client action handler: {name}`)
				else
					var3 = "unsupported-submission-target"
					
					return promiseModule.reject("Unsupported submission target")
				end
			elseif p2.onCustomSubmit then
				if fFlagEnableReportingFlowForMomentsFeed and p2.abuseVector == abuseVectorModule.MomentsFeed then
					local var2 = p2.onCustomSubmit(submission)
					
					if var2 == nil then
					else
						return var2
					end
				else
					return if fFlagAbuseReportMenuV2 then p2.onCustomSubmit(submission) else sendReportModule(var6, submission.endpoint, submission.data)
				end
			end
		end
		
		local var3 = if var1.navigationState == "gotoFailure" then nodeId_1.nextOnFailure else nodeId.next
		
		if not var3 then
			warn(if fFlagAbuseReportSceneSelectionNextOnFailureModule then "Navigation target is nil, closing" else "currentNode.next is nil, closing")
			p2.onClose()
		elseif type(var3) == "table" and var3.type == "submitForm" then
			local unixTimestampMillis = DateTime.now().UnixTimestampMillis
			var7({
				sub_event_type = telemetryEventType.Submit,
				submit_detail = if fFlagAbuseReportSceneSelectionSubmitTrackingModule or fFlagAbuseReportSubmissionTargetV4 then {
					submit_source = if fFlagAbuseReportSceneSelectionSubmitTrackingModule then submitSource.Flow else nil,
					target_type = var2.target_type,
					client_action_name = var2.client_action_name
				} else nil
			})
			var2({ type = "startedSubmission" });
			(if fFlagAbuseReportSubmissionTargetV4 then promiseModule.try(function()
				-- upvalues: onSubmitForm (ref)
				return onSubmitForm()
			end) else onSubmitForm()):andThen(function(p1)
				-- upvalues: var2 (copy), var7 (copy), telemetryEventType (copy), unixTimestampMillis (ref), fFlagAbuseReportSceneSelectionSubmitTrackingModule (copy), submitSource (copy), var2 (ref), fFlagAbuseReportMenuV2 (copy), var5 (copy), handleNextSimple (ref), var3 (ref)
				var2({ type = "completedSubmission" })
				var7({
					sub_event_type = telemetryEventType.SubmitSuccess,
					submit_detail = {
						report_id = p1.responseBody and p1.responseBody.reportId,
						submit_api_duration = DateTime.now().UnixTimestampMillis - unixTimestampMillis,
						submit_source = if fFlagAbuseReportSceneSelectionSubmitTrackingModule then submitSource.Flow else nil,
						target_type = var2.target_type,
						client_action_name = var2.client_action_name
					}
				})
				
				if fFlagAbuseReportMenuV2 then
					var5.current = "completed"
				end
				handleNextSimple(var3.onSuccess)
			end):catch(function(p1)
				-- upvalues: var2 (copy), var7 (copy), telemetryEventType (copy), unixTimestampMillis (ref), fFlagAbuseReportSceneSelectionSubmitTrackingModule (copy), submitSource (copy), var2 (ref), var3 (write), dashModule (copy), fFlagAbuseReportMenuV2 (copy), var5 (copy), var3 (ref), handleNextSimple (ref)
				var2({ type = "submissionFailed" })
				var7({
					sub_event_type = telemetryEventType.SubmitFail,
					submit_detail = {
						submit_api_duration = DateTime.now().UnixTimestampMillis - unixTimestampMillis,
						submit_source = if fFlagAbuseReportSceneSelectionSubmitTrackingModule then submitSource.Flow else nil,
						target_type = var2.target_type,
						client_action_name = var2.client_action_name,
						target_failure_reason = var3
					}
				})
				var7({
					sub_event_type = telemetryEventType.Error,
					error_detail = {
						error_message = "submitReport: " .. dashModule.pretty(p1, { depth = 10 })
					}
				})
				
				if fFlagAbuseReportMenuV2 then
					var5.current = "failed"
				end
				if var3.onFailure then
					handleNextSimple(var3.onFailure)
				end
			end)
		else
			handleNextSimple(var3)
		end
	end, { var1.navigationState })
	local var4 = #var1.stack > 1 and not (var1.submissionState == "completed")
	
	local function goBack()
		-- upvalues: var9 (ref), nodeId (ref), var1 (ref), var4 (ref), var2 (write), p2 (ref), var7 (ref), telemetryEventType (copy)
		if not var9 or not nodeId or not var1 then return end
		local unixTimestampMillis = DateTime.now().UnixTimestampMillis
		
		if var4 then
			var2({ type = "goBack" })
			
			if p2.inlineAlertController then
				p2.inlineAlertController.setInlineAlert(nil)
			end
			var7({
				sub_event_type = telemetryEventType.NodeDone,
				node_done_detail = {
					node_exit_reason = "back",
					node_id = var1.nodeId,
					node_type = nodeId.type,
					node_duration = unixTimestampMillis - var1.enterTime
				}
			})
		end
	end
	
	return if var9 and nodeId and var1 then {
		config = var9,
		canGoBack = var4,
		goBack = goBack,
		reset = reset,
		isSubmitting = var1.submissionState == "submitting",
		display = var9.display,
		onClose = handleClose,
		currentPageElement = reactModule.createElement(contentNodeModule, {
			key = var1.nodeId,
			node = nodeId,
			onNext = if nodeId and nodeId.next ~= nil then function(p1)
				-- upvalues: var9 (ref), nodeId (ref), var1 (ref), fFlagAbuseReportMenuV2 (copy), none (ref), var4 (ref), telemetryEventType (copy), var2 (write), var7 (ref)
				if not var9 or not nodeId or not var1 then return end
				if fFlagAbuseReportMenuV2 and none.current == "none" then
					none.current = "started"
					var4.current({ sub_event_type = telemetryEventType.ReportStarted })
				end
				local unixTimestampMillis = DateTime.now().UnixTimestampMillis
				var2({
					type = "updateDataAndNavigateNext",
					payload = {
						store = if p1 and p1.store then p1.store else {},
						expectedFromNodeId = if fFlagAbuseReportMenuV2 then var1.nodeId else nil
					}
				})
				var7({
					sub_event_type = telemetryEventType.NodeDone,
					node_done_detail = {
						node_exit_reason = "next",
						node_id = var1.nodeId,
						node_type = nodeId.type,
						node_duration = unixTimestampMillis - var1.enterTime
					}
				})
			end else nil,
			onFailure = if fFlagAbuseReportSceneSelectionNextOnFailureModule and (nodeId and nodeId.nextOnFailure ~= nil) then function()
				-- upvalues: var9 (ref), nodeId (ref), var1 (ref), var2 (write), var7 (ref), telemetryEventType (copy)
				if var9 and nodeId and var1 then
					local unixTimestampMillis = DateTime.now().UnixTimestampMillis
					var2({
						type = "navigateFailure",
						payload = { expectedFromNodeId = var1.nodeId }
					})
					var7({
						sub_event_type = telemetryEventType.NodeDone,
						node_done_detail = {
							node_exit_reason = "failure",
							node_id = var1.nodeId,
							node_type = nodeId.type,
							node_duration = unixTimestampMillis - var1.enterTime
						}
					})
					
					return
				end
			end else nil,
			goBack = if fFlagAbuseReportMenuV2 then goBack else nil,
			onExternalSubmit = if fFlagAbuseReportSceneSelectionSubmitTrackingModule then onExternalSubmit else nil,
			store = var8,
			isSubmitting = var1.submissionState == "submitting"
		}),
		currentNodeId = if fFlagAbuseReportMenuV2 then var1.nodeId else nil,
		currentNodeType = if fFlagAbuseReportMenuV2 then nodeId.type else nil,
		navigationDirection = if fFlagAbuseReportMenuV2 then var1.lastNavigationDirection else nil,
		analytics = reactModule.useMemo(function()
			-- upvalues: var7 (ref)
			return { sendEvent = var7 }
		end, { var7 }),
		pendingInlineAlert = if fFlagAbuseReportMenuV2 then if p2.inlineAlertController then p2.inlineAlertController.pendingInlineAlert else nil else nil,
		dismissInlineAlert = reactModule.useCallback(function()
			-- upvalues: p2 (ref)
			if p2.inlineAlertController then
				p2.inlineAlertController.setInlineAlert(nil)
			end
		end, {})
	} else nil
end