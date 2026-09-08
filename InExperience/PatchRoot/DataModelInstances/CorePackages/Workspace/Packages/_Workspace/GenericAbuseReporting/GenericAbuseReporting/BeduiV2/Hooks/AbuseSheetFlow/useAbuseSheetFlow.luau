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
local fFlagEnableReportingFlowForMomentsFeed = require(parent.SharedFlags).FFlagEnableReportingFlowForMomentsFeed
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
	-- upvalues: reactModule (ref), dashModule (ref), sendAnalyticsEvent (ref)
	return reactModule.useCallback(function(p5)
		-- upvalues: p1 (ref), dashModule (copy), p2 (ref), p3 (ref), p4 (ref), sendAnalyticsEvent (copy)
		sendAnalyticsEvent({
			run_id = p1.runId,
			user_id = p1.userId,
			abuse_vector = p2,
			target_id = p3,
			total_duration = if p1.openTime then DateTime.now().UnixTimestampMillis - p1.openTime else 0,
			path = dashModule.map(p1.stack, function(p6)
				return p6.nodeId
			end),
			config_name = p4
		}, p5)
	end, {
		p1.stack, p1.openTime, p1.runId, p2, p3, p4
	})
end

return function(p1, p2)
	-- upvalues: reactModule (ref), resolveStartNode (ref), reducer (ref), getInitialState (ref), getNewRunId (ref), useOpenLinkModule (ref), useRoactService (ref), roactNetworking (ref), useAbuseSheetAnalytics (ref), selectStore (ref), resolveArConfig (ref), telemetryEventType (ref), dashModule (ref), fFlagAbuseReportLinkOpenedAnalytics (ref), linkOpenedSource (ref), fFlagAbuseReportSubmissionTargetV4 (ref), getSubmissionTargetTelemetry (ref), sendReportModule (ref), promiseModule (ref), fFlagEnableReportingFlowForMomentsFeed (ref), abuseVectorModule (ref), fFlagAbuseReportSceneSelectionNextOnFailureModule (ref), fFlagAbuseReportSceneSelectionSubmitTrackingModule (ref), submitSource (ref), contentNodeModule (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), resolveStartNode (copy)
		return if p1 then resolveStartNode(p1) else "root"
	end, { p1 })
	local var2, var3 = reactModule.useReducer(reducer, nil, function()
		-- upvalues: getInitialState (copy), getNewRunId (copy), var1 (ref)
		return getInitialState(getNewRunId(), DateTime.now().UnixTimestampMillis, var1)
	end)
	local var4 = useOpenLinkModule()
	local var5 = useRoactService(roactNetworking)
	local var6 = useAbuseSheetAnalytics(var2, p2.abuseVector, p2.targetId, if p1 then p1.name else nil)
	local var7 = reactModule.useMemo(function()
		-- upvalues: selectStore (copy), var2 (ref)
		return selectStore(var2)
	end, { var2 })
	local var8 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), resolveArConfig (copy), var7 (ref)
		return if p1 then resolveArConfig(p1, {
			attribute = p1.attributes,
			resources = p1.resources or {},
			store = var7
		}) else nil
	end, { p1, var7 })
	local var9 = reactModule.useRef(true)
	local var10 = reactModule.useRef(false)
	local isOnFirstAction = p2.attemptTrigger == "onFirstAction"
	local none = reactModule.useRef("none")
	local var11 = reactModule.useRef(var6)
	var11.current = var6
	local var12 = reactModule.useRef(var2.submissionState)
	var12.current = var2.submissionState
	
	local function _(value)
		-- upvalues: p2 (ref)
		if p2.inlineAlertController then
			p2.inlineAlertController.setInlineAlert(value)
		end
	end
	
	reactModule.useEffect(function()
		-- upvalues: none (ref), var11 (ref), var12 (ref), telemetryEventType (copy)
		return function()
			-- upvalues: none (copy), var11 (copy), var12 (copy), telemetryEventType (copy)
			if none.current == "started" then
				none.current = "completed"
				var11.current(if var12.current == "completed" then { sub_event_type = telemetryEventType.ReportCompleted } else { sub_event_type = telemetryEventType.ReportAbandoned })
				
				return
			end
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), var9 (ref), getNewRunId (copy), var3 (ref), var1 (ref), var10 (ref), isOnFirstAction (ref), var6 (ref), telemetryEventType (copy), none (ref)
		if p2.open and not var9.current then
			var3({
				type = "reset",
				payload = {
					runId = getNewRunId(),
					initialEnterTime = DateTime.now().UnixTimestampMillis,
					startNodeId = var1
				}
			})
			
			if p2.inlineAlertController then
				p2.inlineAlertController.setInlineAlert(nil)
			end
			var10.current = false
		end
		var9.current = false
		
		if p2.open and not isOnFirstAction then
			var6({ sub_event_type = telemetryEventType.ReportStarted })
			none.current = "started"
		end
	end, { p2.open })
	reactModule.useLayoutEffect(function()
		-- upvalues: p1 (ref), var2 (ref), var1 (ref), var3 (ref)
		if not p1 then return end
		if #var2.stack > 1 then return end
		local var13 = var2.stack[1]
		
		if var13 and var13.nodeId == var1 then
			return
		end
		var3({
			type = "reset",
			payload = {
				runId = var2.runId,
				initialEnterTime = var2.openTime or DateTime.now().UnixTimestampMillis,
				startNodeId = var1
			}
		})
	end, { p1, var1 })
	local var13 = dashModule.last(var2.stack)
	local nodeId = var8 and (var8.nodes and (var13 and var8.nodes[var13.nodeId]))
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), var10 (ref), p1 (ref), var13 (ref), var6 (ref), telemetryEventType (copy), var8 (ref), nodeId (ref)
		if not p2.open or var10.current then return end
		if not p1 then return end
		if not var13 then
			var6({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "No current page found in abuse sheet flow."
				}
			})
			var10.current = true
			
			return
		elseif not var13.nodeId then
			var6({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "Current page has no nodeId in abuse sheet flow."
				}
			})
			var10.current = true
			
			return
		elseif not var8 or not var8.nodes then
			var6({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "Abuse sheet flow config or nodes is nil."
				}
			})
			var10.current = true
			
			return
		elseif not nodeId then
			var6({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = `No config found for current nodeId: {var13.nodeId}`
				}
			})
			var10.current = true
		end
	end, {
		p2.open, p1, var8, var13, nodeId, var6
	})
	
	local function onExternalSubmit(p3)
		-- upvalues: var11 (ref), telemetryEventType (copy), var3 (ref), var12 (ref)
		var11.current({
			sub_event_type = telemetryEventType.Submit,
			submit_detail = { submit_source = p3 }
		})
		var3({ type = "completedSubmission" })
		var12.current = "completed"
		var11.current({
			sub_event_type = telemetryEventType.SubmitSuccess,
			submit_detail = { submit_source = p3 }
		})
	end
	
	local function notifyFinish()
		-- upvalues: p2 (ref), var12 (ref), none (ref), var11 (ref), telemetryEventType (copy)
		if p2.onFinish then
			p2.onFinish({ didSubmit = var12.current == "completed" })
		end
		if none.current == "started" then
			none.current = "completed"
			var11.current(if var12.current == "completed" then { sub_event_type = telemetryEventType.ReportCompleted } else { sub_event_type = telemetryEventType.ReportAbandoned })
		end
	end
	
	local function handleClose()
		-- upvalues: notifyFinish (ref), p2 (ref)
		notifyFinish()
		p2.onClose()
	end
	
	local function reset(value)
		-- upvalues: getNewRunId (copy), var3 (ref), var1 (ref), p2 (ref), none (ref)
		var3({
			type = "reset",
			payload = {
				runId = getNewRunId(),
				initialEnterTime = DateTime.now().UnixTimestampMillis,
				startNodeId = var1
			}
		})
		
		if p2.inlineAlertController then
			p2.inlineAlertController.setInlineAlert(value)
		end
		none.current = "none"
	end
	
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), nodeId (ref), var2 (ref), dashModule (copy), p2 (ref), var3 (ref), fFlagAbuseReportLinkOpenedAnalytics (copy), var11 (ref), telemetryEventType (copy), linkOpenedSource (copy), var4 (ref), notifyFinish (ref), reset (ref), fFlagAbuseReportSubmissionTargetV4 (copy), getSubmissionTargetTelemetry (copy), sendReportModule (copy), var5 (ref), promiseModule (copy), fFlagEnableReportingFlowForMomentsFeed (copy), abuseVectorModule (copy), fFlagAbuseReportSceneSelectionNextOnFailureModule (copy), var6 (ref), fFlagAbuseReportSceneSelectionSubmitTrackingModule (copy), submitSource (copy), var12 (ref)
		if not var8 or not nodeId then return end
		if var2.navigationState ~= "gotoNext" and var2.navigationState ~= "gotoFailure" then return end
		local var14 = dashModule.last(var2.stack)
		
		if not var14 or not var14.nodeId then
			warn("Navigation triggered but current page or nodeId is invalid")
			
			return
		end
		local nodeId_1 = var8.nodes[var14.nodeId]
		
		if not nodeId_1 then
			warn(`Navigation triggered but no config found for nodeId: {var14.nodeId}`)
			
			return
		end
		local function handleNextSimple(p3)
			-- upvalues: p2 (copy), var3 (copy), fFlagAbuseReportLinkOpenedAnalytics (copy), var11 (copy), telemetryEventType (copy), linkOpenedSource (copy), var4 (copy), notifyFinish (copy), reset (copy)
			if not p3 then
				warn("handleNextSimple called with nil next value")
				p2.onClose()
				
				return
			end
			local unixTimestampMillis = DateTime.now().UnixTimestampMillis
			local var15 = if type(p3) == "table" then p3.inlineAlert else nil
			
			if type(p3) == "string" then
				var3({
					type = "gotoNode",
					payload = { nodeId = p3, enterTime = unixTimestampMillis }
				})
				
				if p2.inlineAlertController then
					p2.inlineAlertController.setInlineAlert(nil)
					
					return
				end
			elseif type(p3) ~= "table" or p3.type ~= "goto" then
				if type(p3) == "table" and p3.type == "link" then
					if fFlagAbuseReportLinkOpenedAnalytics then
						var11.current({
							sub_event_type = telemetryEventType.LinkOpened,
							link_detail = { href = p3.href, source = linkOpenedSource.NextAction }
						})
					end
					var4("", p3.href)
					notifyFinish()
					p2.onClose()
					
					return
				elseif type(p3) == "table" and p3.type == "close" then
					notifyFinish()
					p2.onClose()
					
					return
				elseif type(p3) == "table" and p3.type == "reset" then
					notifyFinish()
					reset(var15)
					
					return
				end
				warn(`Unknown next type: {typeof(p3)}, value: {p3}`)
				notifyFinish()
				p2.onClose()
			elseif p3.replace then
				var3({
					type = "replaceAndGotoNode",
					payload = { nodeId = p3.nodeId, enterTime = unixTimestampMillis }
				})
				
				if p2.inlineAlertController then
					p2.inlineAlertController.setInlineAlert(var15)
					
					return
				end
			else
				var3({
					type = "gotoNode",
					payload = { nodeId = p3.nodeId, enterTime = unixTimestampMillis }
				})
				
				if p2.inlineAlertController then
					p2.inlineAlertController.setInlineAlert(nil)
					
					return
				end
			end
		end
		
		local submission = var8.submission
		local target = submission and submission.target
		local var15 = if fFlagAbuseReportSubmissionTargetV4 then getSubmissionTargetTelemetry(target) else {}
		local var16 = nil
		
		local function onSubmitForm()
			-- upvalues: fFlagAbuseReportSubmissionTargetV4 (copy), target (ref), sendReportModule (copy), var5 (copy), submission (ref), p2 (copy), var16 (write), promiseModule (copy), fFlagEnableReportingFlowForMomentsFeed (copy), abuseVectorModule (copy)
			if fFlagAbuseReportSubmissionTargetV4 then
				if type(target) == "table" and target.type == "default" then
					return sendReportModule(var5, "abuse-reporting/v1/abuse-report", submission.data)
				elseif type(target) == "table" and target.type == "clientAction" then
					local name = target.name
					local var17 = p2.clientActionHandlers and p2.clientActionHandlers[name]
					
					if var17 then
						return var17(submission)
					end
					var16 = "missing-client-action-handler"
					
					return promiseModule.reject(`Missing client action handler: {name}`)
				else
					var16 = "unsupported-submission-target"
					
					return promiseModule.reject("Unsupported submission target")
				end
			elseif p2.onCustomSubmit then
				if not fFlagEnableReportingFlowForMomentsFeed or p2.abuseVector ~= abuseVectorModule.MomentsFeed then
					return p2.onCustomSubmit(submission)
				end
				local var18 = p2.onCustomSubmit(submission)
				
				return if var18 == nil then sendReportModule(var5, submission.endpoint, submission.data) else var18
			end
		end
		
		local var17 = if var2.navigationState == "gotoFailure" then nodeId_1.nextOnFailure else nodeId.next
		
		if not var17 then
			warn(if fFlagAbuseReportSceneSelectionNextOnFailureModule then "Navigation target is nil, closing" else "currentNode.next is nil, closing")
			p2.onClose()
		elseif type(var17) == "table" and var17.type == "submitForm" then
			local unixTimestampMillis = DateTime.now().UnixTimestampMillis
			var6({
				sub_event_type = telemetryEventType.Submit,
				submit_detail = if fFlagAbuseReportSceneSelectionSubmitTrackingModule or fFlagAbuseReportSubmissionTargetV4 then {
					submit_source = if fFlagAbuseReportSceneSelectionSubmitTrackingModule then submitSource.Flow else nil,
					target_type = var15.target_type,
					client_action_name = var15.client_action_name
				} else nil
			})
			var3({ type = "startedSubmission" });
			(if fFlagAbuseReportSubmissionTargetV4 then promiseModule.try(function()
				-- upvalues: onSubmitForm (ref)
				return onSubmitForm()
			end) else onSubmitForm()):andThen(function(p3)
				-- upvalues: var3 (copy), var6 (copy), telemetryEventType (copy), unixTimestampMillis (ref), fFlagAbuseReportSceneSelectionSubmitTrackingModule (copy), submitSource (copy), var15 (ref), var12 (copy), handleNextSimple (ref), var17 (ref)
				var3({ type = "completedSubmission" })
				var6({
					sub_event_type = telemetryEventType.SubmitSuccess,
					submit_detail = {
						report_id = p3.responseBody and p3.responseBody.reportId,
						submit_api_duration = DateTime.now().UnixTimestampMillis - unixTimestampMillis,
						submit_source = if fFlagAbuseReportSceneSelectionSubmitTrackingModule then submitSource.Flow else nil,
						target_type = var15.target_type,
						client_action_name = var15.client_action_name
					}
				})
				var12.current = "completed"
				handleNextSimple(var17.onSuccess)
			end):catch(function(p3)
				-- upvalues: var3 (copy), var6 (copy), telemetryEventType (copy), unixTimestampMillis (ref), fFlagAbuseReportSceneSelectionSubmitTrackingModule (copy), submitSource (copy), var15 (ref), var16 (write), dashModule (copy), var12 (copy), var17 (ref), handleNextSimple (ref)
				var3({ type = "submissionFailed" })
				var6({
					sub_event_type = telemetryEventType.SubmitFail,
					submit_detail = {
						submit_api_duration = DateTime.now().UnixTimestampMillis - unixTimestampMillis,
						submit_source = if fFlagAbuseReportSceneSelectionSubmitTrackingModule then submitSource.Flow else nil,
						target_type = var15.target_type,
						client_action_name = var15.client_action_name,
						target_failure_reason = var16
					}
				})
				var6({
					sub_event_type = telemetryEventType.Error,
					error_detail = {
						error_message = "submitReport: " .. dashModule.pretty(p3, { depth = 10 })
					}
				})
				var12.current = "failed"
				
				if var17.onFailure then
					handleNextSimple(var17.onFailure)
				end
			end)
		else
			handleNextSimple(var17)
		end
	end, { var2.navigationState })
	local var18 = #var2.stack > 1 and not (var2.submissionState == "completed")
	
	local function goBack()
		-- upvalues: var8 (ref), nodeId (ref), var13 (ref), var18 (ref), var3 (ref), p2 (ref), var6 (ref), telemetryEventType (copy)
		if not var8 or not nodeId or not var13 then return end
		local unixTimestampMillis = DateTime.now().UnixTimestampMillis
		
		if var18 then
			var3({ type = "goBack" })
			
			if p2.inlineAlertController then
				p2.inlineAlertController.setInlineAlert(nil)
			end
			var6({
				sub_event_type = telemetryEventType.NodeDone,
				node_done_detail = {
					node_exit_reason = "back",
					node_id = var13.nodeId,
					node_type = nodeId.type,
					node_duration = unixTimestampMillis - var13.enterTime
				}
			})
		end
	end
	
	return if not (not var8 or not nodeId or not var13) then {
		config = var8,
		canGoBack = var18,
		goBack = goBack,
		reset = reset,
		isSubmitting = var2.submissionState == "submitting",
		display = var8.display,
		onClose = handleClose,
		currentPageElement = reactModule.createElement(contentNodeModule, {
			key = var13.nodeId,
			node = nodeId,
			onNext = if nodeId and nodeId.next ~= nil then function(p3)
				-- upvalues: var8 (ref), nodeId (ref), var13 (ref), none (ref), var11 (ref), telemetryEventType (copy), var3 (ref), var6 (ref)
				if not var8 or not nodeId or not var13 then return end
				if none.current == "none" then
					none.current = "started"
					var11.current({ sub_event_type = telemetryEventType.ReportStarted })
				end
				local unixTimestampMillis = DateTime.now().UnixTimestampMillis
				var3({
					type = "updateDataAndNavigateNext",
					payload = {
						store = if p3 and p3.store then p3.store else {},
						expectedFromNodeId = var13.nodeId
					}
				})
				var6({
					sub_event_type = telemetryEventType.NodeDone,
					node_done_detail = {
						node_exit_reason = "next",
						node_id = var13.nodeId,
						node_type = nodeId.type,
						node_duration = unixTimestampMillis - var13.enterTime
					}
				})
			end else nil,
			onFailure = if fFlagAbuseReportSceneSelectionNextOnFailureModule and (nodeId and nodeId.nextOnFailure ~= nil) then function()
				-- upvalues: var8 (ref), nodeId (ref), var13 (ref), var3 (ref), var6 (ref), telemetryEventType (copy)
				if var8 and nodeId and var13 then
					local unixTimestampMillis = DateTime.now().UnixTimestampMillis
					var3({
						type = "navigateFailure",
						payload = { expectedFromNodeId = var13.nodeId }
					})
					var6({
						sub_event_type = telemetryEventType.NodeDone,
						node_done_detail = {
							node_exit_reason = "failure",
							node_id = var13.nodeId,
							node_type = nodeId.type,
							node_duration = unixTimestampMillis - var13.enterTime
						}
					})
					
					return
				end
			end else nil,
			goBack = goBack,
			onExternalSubmit = if fFlagAbuseReportSceneSelectionSubmitTrackingModule then onExternalSubmit else nil,
			store = var7,
			isSubmitting = var2.submissionState == "submitting"
		}),
		currentNodeId = var13.nodeId,
		currentNodeType = nodeId.type,
		navigationDirection = var2.lastNavigationDirection,
		analytics = reactModule.useMemo(function()
			-- upvalues: var6 (ref)
			return { sendEvent = var6 }
		end, { var6 }),
		pendingInlineAlert = if p2.inlineAlertController then p2.inlineAlertController.pendingInlineAlert else nil,
		dismissInlineAlert = reactModule.useCallback(function()
			-- upvalues: p2 (ref)
			if p2.inlineAlertController then
				p2.inlineAlertController.setInlineAlert(nil)
			end
		end, {})
	} else nil
end