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
local fFlagAbuseReportInlineAlertStateOutsideReducerModule = require(genericAbuseReporting.Flags.FFlagAbuseReportInlineAlertStateOutsideReducer)
local fFlagAbuseReportSceneSelectionNextOnFailureModule = require(genericAbuseReporting.Flags.FFlagAbuseReportSceneSelectionNextOnFailure)
local fFlagAbuseReportSceneSelectionSubmitTrackingModule = require(genericAbuseReporting.Flags.FFlagAbuseReportSceneSelectionSubmitTracking)
local fFlagAbuseReportSubmissionTargetV4 = require(parent.SharedFlags).FFlagAbuseReportSubmissionTargetV4

local function getSubmissionTargetTelemetry(p0)
	return if type(p0) == "table" then if p0.type == "default" then { target_type = "default" } elseif p0.type == "clientAction" then {
		target_type = "clientAction",
		client_action_name = if type(p0.name) == "string" then p0.name else nil
	} else {} else {}
end

local function useAbuseSheetAnalytics(p1, p2, p3, p4)
	-- upvalues: reactModule (ref), dashModule (ref), fFlagAbuseReportMenuV2 (ref), sendAnalyticsEvent (ref)
	return reactModule.useCallback(function(p5)
		-- upvalues: p1 (ref), dashModule (copy), p2 (ref), p3 (ref), fFlagAbuseReportMenuV2 (copy), p4 (ref), sendAnalyticsEvent (copy)
		sendAnalyticsEvent({
			run_id = p1.runId,
			user_id = p1.userId,
			abuse_vector = p2,
			target_id = p3,
			total_duration = if p1.openTime then DateTime.now().UnixTimestampMillis - p1.openTime else 0,
			path = dashModule.map(p1.stack, function(p6)
				return p6.nodeId
			end),
			config_name = if fFlagAbuseReportMenuV2 then p4 else nil
		}, p5)
	end, {
		p1.stack, p1.openTime, p1.runId, p2, p3,
		if fFlagAbuseReportMenuV2 then p4 else nil
	})
end

return function(p7, p8)
	-- upvalues: reactModule (ref), fFlagAbuseReportMenuV2 (ref), resolveStartNode (ref), reducer (ref), getInitialState (ref), getNewRunId (ref), useOpenLinkModule (ref), useRoactService (ref), roactNetworking (ref), useAbuseSheetAnalytics (ref), selectStore (ref), resolveArConfig (ref), telemetryEventType (ref), fFlagAbuseReportInlineAlertStateOutsideReducerModule (ref), fFlagFixAnalyticsForDynamicReportV2 (ref), dashModule (ref), fFlagAbuseReportLinkOpenedAnalytics (ref), linkOpenedSource (ref), fFlagAbuseReportSubmissionTargetV4 (ref), getSubmissionTargetTelemetry (ref), sendReportModule (ref), promiseModule (ref), fFlagEnableReportingFlowForMomentsFeed (ref), abuseVectorModule (ref), fFlagAbuseReportSceneSelectionNextOnFailureModule (ref), fFlagAbuseReportSceneSelectionSubmitTrackingModule (ref), submitSource (ref), contentNodeModule (ref)
	local var18, var19
	local var15 = reactModule.useMemo(function()
		-- upvalues: fFlagAbuseReportMenuV2 (copy), p7 (ref), resolveStartNode (copy)
		return if fFlagAbuseReportMenuV2 and p7 then resolveStartNode(p7) else "root"
	end, { p7 })
	local _ = nil
	local _ = nil
	
	if fFlagAbuseReportMenuV2 then
		local var16, var17 = reactModule.useReducer(reducer, nil, function()
			-- upvalues: getInitialState (copy), getNewRunId (copy), var15 (ref)
			return getInitialState(getNewRunId(), DateTime.now().UnixTimestampMillis, var15)
		end)
		var18 = var16
		var19 = var17
	else
		local var20, var21 = reactModule.useReducer(reducer, getInitialState(getNewRunId(), DateTime.now().UnixTimestampMillis, var15))
		var18 = var20
		var19 = var21
	end
	local var22 = useOpenLinkModule()
	local var23 = useRoactService(roactNetworking)
	local var24 = useAbuseSheetAnalytics(var18, p8.abuseVector, p8.targetId, if fFlagAbuseReportMenuV2 and p7 then p7.name else nil)
	local var25 = reactModule.useMemo(function()
		-- upvalues: selectStore (copy), var18 (write)
		return selectStore(var18)
	end, { var18 })
	local var26 = reactModule.useMemo(function()
		-- upvalues: p7 (ref), resolveArConfig (copy), var25 (ref)
		return if p7 then resolveArConfig(p7, {
			attribute = p7.attributes,
			resources = p7.resources or {},
			store = var25
		}) else nil
	end, { p7, var25 })
	local var27 = reactModule.useRef(true)
	local var28 = reactModule.useRef(false)
	local var29 = fFlagAbuseReportMenuV2 and p8.attemptTrigger == "onFirstAction"
	local none = reactModule.useRef("none")
	local var31 = reactModule.useRef(var24)
	var31.current = var24
	local var32 = reactModule.useRef(var18.submissionState)
	var32.current = var18.submissionState
	
	local function _(value)
		-- upvalues: p8 (ref)
		if p8.inlineAlertController then
			p8.inlineAlertController.setInlineAlert(value)
		end
	end
	
	reactModule.useEffect(function()
		-- upvalues: fFlagAbuseReportMenuV2 (copy), none (ref), var31 (ref), var32 (ref), telemetryEventType (copy)
		if fFlagAbuseReportMenuV2 then
			return function()
				-- upvalues: none (copy), var31 (copy), var32 (copy), telemetryEventType (copy)
				if none.current == "started" then
					none.current = "completed"
					var31.current(if var32.current == "completed" then { sub_event_type = telemetryEventType.ReportCompleted } else { sub_event_type = telemetryEventType.ReportAbandoned })
					
					return
				end
			end
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: p8 (ref), var27 (ref), getNewRunId (copy), var19 (write), var15 (ref), fFlagAbuseReportInlineAlertStateOutsideReducerModule (copy), fFlagFixAnalyticsForDynamicReportV2 (copy), var28 (ref), fFlagAbuseReportMenuV2 (copy), var29 (ref), var24 (ref), telemetryEventType (copy), none (ref)
		if p8.open and not var27.current then
			var19({
				type = "reset",
				payload = {
					runId = getNewRunId(),
					initialEnterTime = DateTime.now().UnixTimestampMillis,
					startNodeId = var15
				}
			})
			
			if fFlagAbuseReportInlineAlertStateOutsideReducerModule and p8.inlineAlertController then
				p8.inlineAlertController.setInlineAlert(nil)
			end
			if fFlagFixAnalyticsForDynamicReportV2 then
				var28.current = false
			end
		end
		var27.current = false
		
		if p8.open and not fFlagAbuseReportMenuV2 or fFlagAbuseReportMenuV2 and p8.open and not var29 then
			var24({ sub_event_type = telemetryEventType.ReportStarted })
			
			if fFlagAbuseReportMenuV2 then
				none.current = "started"
			end
		end
	end, { p8.open })
	reactModule.useLayoutEffect(function()
		-- upvalues: fFlagAbuseReportMenuV2 (copy), p7 (ref), var18 (write), var15 (ref), var19 (write), fFlagAbuseReportInlineAlertStateOutsideReducerModule (copy)
		if not fFlagAbuseReportMenuV2 then return end
		if not p7 then return end
		if #var18.stack > 1 then return end
		local var41 = var18.stack[1]
		
		if var41 and var41.nodeId == var15 then
			return
		end
		var19({
			type = "reset",
			payload = {
				runId = var18.runId,
				initialEnterTime = var18.openTime or DateTime.now().UnixTimestampMillis,
				startNodeId = var15,
				inlineAlert = if not fFlagAbuseReportInlineAlertStateOutsideReducerModule then var18.pendingInlineAlert else nil
			}
		})
	end, { p7, var15 })
	local var33 = dashModule.last(var18.stack)
	local nodeId = var26 and (var26.nodes and (var33 and var26.nodes[var33.nodeId]))
	
	if not fFlagFixAnalyticsForDynamicReportV2 then
		if not var33 then
			var24({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "No current page found in abuse sheet flow."
				}
			})
		elseif not var33.nodeId then
			var24({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "Current page has no nodeId in abuse sheet flow."
				}
			})
		end
		if not var26 or not var26.nodes then
			var24({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "Abuse sheet flow config or nodes is nil."
				}
			})
		end
		if not nodeId then
			var24({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = `No config found for current nodeId: {var33 and var33.nodeId}`
				}
			})
		end
	end
	reactModule.useEffect(function()
		-- upvalues: fFlagFixAnalyticsForDynamicReportV2 (copy), p8 (ref), var28 (ref), p7 (ref), var33 (ref), var24 (ref), telemetryEventType (copy), var26 (ref), nodeId (ref)
		if not fFlagFixAnalyticsForDynamicReportV2 or not p8.open or var28.current then return end
		if not p7 then return end
		if not var33 then
			var24({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "No current page found in abuse sheet flow."
				}
			})
			var28.current = true
			
			return
		elseif not var33.nodeId then
			var24({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "Current page has no nodeId in abuse sheet flow."
				}
			})
			var28.current = true
			
			return
		elseif not var26 or not var26.nodes then
			var24({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "Abuse sheet flow config or nodes is nil."
				}
			})
			var28.current = true
			
			return
		elseif not nodeId then
			var24({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = `No config found for current nodeId: {var33.nodeId}`
				}
			})
			var28.current = true
		end
	end, {
		p8.open, p7, var26, var33, nodeId, var24
	})
	
	local function onExternalSubmit(p9)
		-- upvalues: var31 (ref), telemetryEventType (copy), var19 (write), var32 (ref)
		var31.current({
			sub_event_type = telemetryEventType.Submit,
			submit_detail = { submit_source = p9 }
		})
		var19({ type = "completedSubmission" })
		var32.current = "completed"
		var31.current({
			sub_event_type = telemetryEventType.SubmitSuccess,
			submit_detail = { submit_source = p9 }
		})
	end
	
	local function notifyFinish()
		-- upvalues: fFlagAbuseReportMenuV2 (copy), p8 (ref), var32 (ref), none (ref), var31 (ref), telemetryEventType (copy)
		if fFlagAbuseReportMenuV2 and p8.onFinish then
			p8.onFinish({ didSubmit = var32.current == "completed" })
		end
		if fFlagAbuseReportMenuV2 and none.current == "started" then
			none.current = "completed"
			var31.current(if var32.current == "completed" then { sub_event_type = telemetryEventType.ReportCompleted } else { sub_event_type = telemetryEventType.ReportAbandoned })
		end
	end
	
	local function handleClose()
		-- upvalues: notifyFinish (ref), p8 (ref), fFlagAbuseReportMenuV2 (copy), var18 (write), var24 (ref), telemetryEventType (copy)
		notifyFinish()
		p8.onClose()
		
		if not fFlagAbuseReportMenuV2 then
			if var18.submissionState ~= "completed" and var18.openTime ~= nil then
				var24({ sub_event_type = telemetryEventType.ReportAbandoned })
				
				return
			end
			var24({ sub_event_type = telemetryEventType.ReportCompleted })
		end
	end
	
	local function reset(value)
		-- upvalues: getNewRunId (copy), var19 (write), var15 (ref), fFlagAbuseReportMenuV2 (copy), fFlagAbuseReportInlineAlertStateOutsideReducerModule (copy), p8 (ref), none (ref)
		var19({
			type = "reset",
			payload = {
				runId = getNewRunId(),
				initialEnterTime = DateTime.now().UnixTimestampMillis,
				startNodeId = var15,
				inlineAlert = if fFlagAbuseReportMenuV2 and not fFlagAbuseReportInlineAlertStateOutsideReducerModule then value else nil
			}
		})
		
		if fFlagAbuseReportInlineAlertStateOutsideReducerModule and p8.inlineAlertController then
			p8.inlineAlertController.setInlineAlert(value)
		end
		none.current = "none"
	end
	
	reactModule.useEffect(function()
		-- upvalues: var26 (ref), nodeId (ref), var18 (write), dashModule (copy), p8 (ref), fFlagAbuseReportMenuV2 (copy), var19 (write), fFlagAbuseReportInlineAlertStateOutsideReducerModule (copy), fFlagAbuseReportLinkOpenedAnalytics (copy), var31 (ref), telemetryEventType (copy), linkOpenedSource (copy), var22 (ref), handleClose (ref), notifyFinish (ref), reset (ref), fFlagAbuseReportSubmissionTargetV4 (copy), getSubmissionTargetTelemetry (copy), sendReportModule (copy), var23 (ref), promiseModule (copy), fFlagEnableReportingFlowForMomentsFeed (copy), abuseVectorModule (copy), fFlagAbuseReportSceneSelectionNextOnFailureModule (copy), var24 (ref), fFlagAbuseReportSceneSelectionSubmitTrackingModule (copy), submitSource (copy), var32 (ref)
		if not var26 or not nodeId then return end
		if var18.navigationState ~= "gotoNext" and var18.navigationState ~= "gotoFailure" then return end
		local var42 = dashModule.last(var18.stack)
		
		if not var42 or not var42.nodeId then
			warn("Navigation triggered but current page or nodeId is invalid")
			
			return
		end
		local nodeId_1 = var26.nodes[var42.nodeId]
		
		if not nodeId_1 then
			warn(`Navigation triggered but no config found for nodeId: {var42.nodeId}`)
			
			return
		end
		local function handleNextSimple(p10)
			-- upvalues: p8 (copy), fFlagAbuseReportMenuV2 (copy), var19 (copy), fFlagAbuseReportInlineAlertStateOutsideReducerModule (copy), fFlagAbuseReportLinkOpenedAnalytics (copy), var31 (copy), telemetryEventType (copy), linkOpenedSource (copy), var22 (copy), handleClose (copy), notifyFinish (copy), reset (copy)
			if not p10 then
				warn("handleNextSimple called with nil next value")
				p8.onClose()
				
				return
			end
			local unixTimestampMillis = DateTime.now().UnixTimestampMillis
			local var49 = if fFlagAbuseReportMenuV2 and type(p10) == "table" then p10.inlineAlert else nil
			
			if type(p10) == "string" then
				var19({
					type = "gotoNode",
					payload = { nodeId = p10, enterTime = unixTimestampMillis }
				})
				
				if fFlagAbuseReportInlineAlertStateOutsideReducerModule and p8.inlineAlertController then
					p8.inlineAlertController.setInlineAlert(nil)
					
					return
				end
			elseif type(p10) ~= "table" or p10.type ~= "goto" then
				if type(p10) == "table" and p10.type == "link" then
					if fFlagAbuseReportLinkOpenedAnalytics then
						var31.current({
							sub_event_type = telemetryEventType.LinkOpened,
							link_detail = { href = p10.href, source = linkOpenedSource.NextAction }
						})
					end
					var22("", p10.href)
					handleClose()
					
					return
				elseif type(p10) == "table" and p10.type == "close" then
					handleClose()
					
					return
				elseif fFlagAbuseReportMenuV2 and type(p10) == "table" and p10.type == "reset" then
					notifyFinish()
					reset(var49)
					
					return
				end
				warn(`Unknown next type: {typeof(p10)}, value: {p10}`)
				handleClose()
			elseif fFlagAbuseReportMenuV2 and p10.replace then
				var19({
					type = "replaceAndGotoNode",
					payload = {
						nodeId = p10.nodeId,
						enterTime = unixTimestampMillis,
						inlineAlert = if not fFlagAbuseReportInlineAlertStateOutsideReducerModule then var49 else nil
					}
				})
				
				if fFlagAbuseReportInlineAlertStateOutsideReducerModule and p8.inlineAlertController then
					p8.inlineAlertController.setInlineAlert(var49)
					
					return
				end
			else
				var19({
					type = "gotoNode",
					payload = { nodeId = p10.nodeId, enterTime = unixTimestampMillis }
				})
				
				if fFlagAbuseReportInlineAlertStateOutsideReducerModule and p8.inlineAlertController then
					p8.inlineAlertController.setInlineAlert(nil)
					
					return
				end
			end
		end
		
		local submission = var26.submission
		local target = submission and submission.target
		local var45 = if fFlagAbuseReportSubmissionTargetV4 then getSubmissionTargetTelemetry(target) else {}
		local var46 = nil
		
		local function onSubmitForm()
			-- upvalues: fFlagAbuseReportSubmissionTargetV4 (copy), target (ref), sendReportModule (copy), var23 (copy), submission (ref), p8 (copy), var46 (write), promiseModule (copy), fFlagEnableReportingFlowForMomentsFeed (copy), abuseVectorModule (copy), fFlagAbuseReportMenuV2 (copy)
			if fFlagAbuseReportSubmissionTargetV4 then
				if type(target) == "table" and target.type == "default" then
					return sendReportModule(var23, "abuse-reporting/v1/abuse-report", submission.data)
				elseif type(target) == "table" and target.type == "clientAction" then
					local name = target.name
					local var50 = p8.clientActionHandlers and p8.clientActionHandlers[name]
					
					if var50 then
						return var50(submission)
					end
					var46 = "missing-client-action-handler"
					
					return promiseModule.reject(`Missing client action handler: {name}`)
				else
					var46 = "unsupported-submission-target"
					
					return promiseModule.reject("Unsupported submission target")
				end
			elseif p8.onCustomSubmit then
				if fFlagEnableReportingFlowForMomentsFeed and p8.abuseVector == abuseVectorModule.MomentsFeed then
					local var51 = p8.onCustomSubmit(submission)
					
					if var51 == nil then
					else
						return var51
					end
				else
					return if fFlagAbuseReportMenuV2 then p8.onCustomSubmit(submission) else sendReportModule(var23, submission.endpoint, submission.data)
				end
			end
		end
		
		local var48 = if var18.navigationState == "gotoFailure" then nodeId_1.nextOnFailure else nodeId.next
		
		if not var48 then
			warn(if fFlagAbuseReportSceneSelectionNextOnFailureModule then "Navigation target is nil, closing" else "currentNode.next is nil, closing")
			p8.onClose()
		elseif type(var48) == "table" and var48.type == "submitForm" then
			local unixTimestampMillis = DateTime.now().UnixTimestampMillis
			var24({
				sub_event_type = telemetryEventType.Submit,
				submit_detail = if fFlagAbuseReportSceneSelectionSubmitTrackingModule or fFlagAbuseReportSubmissionTargetV4 then {
					submit_source = if fFlagAbuseReportSceneSelectionSubmitTrackingModule then submitSource.Flow else nil,
					target_type = var45.target_type,
					client_action_name = var45.client_action_name
				} else nil
			})
			var19({ type = "startedSubmission" });
			(if fFlagAbuseReportSubmissionTargetV4 then promiseModule.try(function()
				-- upvalues: onSubmitForm (ref)
				return onSubmitForm()
			end) else onSubmitForm()):andThen(function(p12)
				-- upvalues: var19 (copy), var24 (copy), telemetryEventType (copy), unixTimestampMillis (ref), fFlagAbuseReportSceneSelectionSubmitTrackingModule (copy), submitSource (copy), var45 (ref), fFlagAbuseReportMenuV2 (copy), var32 (copy), handleNextSimple (ref), var48 (ref)
				var19({ type = "completedSubmission" })
				var24({
					sub_event_type = telemetryEventType.SubmitSuccess,
					submit_detail = {
						report_id = p12.responseBody and p12.responseBody.reportId,
						submit_api_duration = DateTime.now().UnixTimestampMillis - unixTimestampMillis,
						submit_source = if fFlagAbuseReportSceneSelectionSubmitTrackingModule then submitSource.Flow else nil,
						target_type = var45.target_type,
						client_action_name = var45.client_action_name
					}
				})
				
				if fFlagAbuseReportMenuV2 then
					var32.current = "completed"
				end
				handleNextSimple(var48.onSuccess)
			end):catch(function(p11)
				-- upvalues: var19 (copy), var24 (copy), telemetryEventType (copy), unixTimestampMillis (ref), fFlagAbuseReportSceneSelectionSubmitTrackingModule (copy), submitSource (copy), var45 (ref), var46 (write), dashModule (copy), fFlagAbuseReportMenuV2 (copy), var32 (copy), var48 (ref), handleNextSimple (ref)
				var19({ type = "submissionFailed" })
				var24({
					sub_event_type = telemetryEventType.SubmitFail,
					submit_detail = {
						submit_api_duration = DateTime.now().UnixTimestampMillis - unixTimestampMillis,
						submit_source = if fFlagAbuseReportSceneSelectionSubmitTrackingModule then submitSource.Flow else nil,
						target_type = var45.target_type,
						client_action_name = var45.client_action_name,
						target_failure_reason = var46
					}
				})
				var24({
					sub_event_type = telemetryEventType.Error,
					error_detail = {
						error_message = "submitReport: " .. dashModule.pretty(p11, { depth = 10 })
					}
				})
				
				if fFlagAbuseReportMenuV2 then
					var32.current = "failed"
				end
				if var48.onFailure then
					handleNextSimple(var48.onFailure)
				end
			end)
		else
			handleNextSimple(var48)
		end
	end, { var18.navigationState })
	local var39 = #var18.stack > 1 and not (var18.submissionState == "completed")
	
	local function goBack()
		-- upvalues: var26 (ref), nodeId (ref), var33 (ref), var39 (ref), var19 (write), fFlagAbuseReportInlineAlertStateOutsideReducerModule (copy), p8 (ref), var24 (ref), telemetryEventType (copy)
		if not var26 or not nodeId or not var33 then return end
		local unixTimestampMillis = DateTime.now().UnixTimestampMillis
		
		if var39 then
			var19({ type = "goBack" })
			
			if fFlagAbuseReportInlineAlertStateOutsideReducerModule and p8.inlineAlertController then
				p8.inlineAlertController.setInlineAlert(nil)
			end
			var24({
				sub_event_type = telemetryEventType.NodeDone,
				node_done_detail = {
					node_exit_reason = "back",
					node_id = var33.nodeId,
					node_type = nodeId.type,
					node_duration = unixTimestampMillis - var33.enterTime
				}
			})
		end
	end
	
	return if var26 and nodeId and var33 then {
		config = var26,
		canGoBack = var39,
		goBack = goBack,
		reset = reset,
		isSubmitting = var18.submissionState == "submitting",
		display = var26.display,
		onClose = handleClose,
		currentPageElement = reactModule.createElement(contentNodeModule, {
			key = var33.nodeId,
			node = nodeId,
			onNext = if nodeId and nodeId.next ~= nil then function(p13)
				-- upvalues: var26 (ref), nodeId (ref), var33 (ref), fFlagAbuseReportMenuV2 (copy), none (ref), var31 (ref), telemetryEventType (copy), var19 (write), var24 (ref)
				if not var26 or not nodeId or not var33 then return end
				if fFlagAbuseReportMenuV2 and none.current == "none" then
					none.current = "started"
					var31.current({ sub_event_type = telemetryEventType.ReportStarted })
				end
				local unixTimestampMillis = DateTime.now().UnixTimestampMillis
				var19({
					type = "updateDataAndNavigateNext",
					payload = {
						store = if p13 and p13.store then p13.store else {},
						expectedFromNodeId = if fFlagAbuseReportMenuV2 then var33.nodeId else nil
					}
				})
				var24({
					sub_event_type = telemetryEventType.NodeDone,
					node_done_detail = {
						node_exit_reason = "next",
						node_id = var33.nodeId,
						node_type = nodeId.type,
						node_duration = unixTimestampMillis - var33.enterTime
					}
				})
			end else nil,
			onFailure = if fFlagAbuseReportSceneSelectionNextOnFailureModule and (nodeId and nodeId.nextOnFailure ~= nil) then function()
				-- upvalues: var26 (ref), nodeId (ref), var33 (ref), var19 (write), var24 (ref), telemetryEventType (copy)
				if var26 and nodeId and var33 then
					local unixTimestampMillis = DateTime.now().UnixTimestampMillis
					var19({
						type = "navigateFailure",
						payload = { expectedFromNodeId = var33.nodeId }
					})
					var24({
						sub_event_type = telemetryEventType.NodeDone,
						node_done_detail = {
							node_exit_reason = "failure",
							node_id = var33.nodeId,
							node_type = nodeId.type,
							node_duration = unixTimestampMillis - var33.enterTime
						}
					})
					
					return
				end
			end else nil,
			goBack = if fFlagAbuseReportMenuV2 then goBack else nil,
			onExternalSubmit = if fFlagAbuseReportSceneSelectionSubmitTrackingModule then onExternalSubmit else nil,
			store = var25,
			isSubmitting = var18.submissionState == "submitting"
		}),
		currentNodeId = if fFlagAbuseReportMenuV2 then var33.nodeId else nil,
		currentNodeType = if fFlagAbuseReportMenuV2 then nodeId.type else nil,
		navigationDirection = if fFlagAbuseReportMenuV2 then var18.lastNavigationDirection else nil,
		analytics = reactModule.useMemo(function()
			-- upvalues: var24 (ref)
			return { sendEvent = var24 }
		end, { var24 }),
		pendingInlineAlert = if fFlagAbuseReportMenuV2 then if fFlagAbuseReportInlineAlertStateOutsideReducerModule then if p8.inlineAlertController then p8.inlineAlertController.pendingInlineAlert else nil else var18.pendingInlineAlert else nil,
		dismissInlineAlert = reactModule.useCallback(function()
			-- upvalues: var19 (write), fFlagAbuseReportInlineAlertStateOutsideReducerModule (copy), p8 (ref)
			var19({ type = "clearInlineAlert" })
			
			if fFlagAbuseReportInlineAlertStateOutsideReducerModule and p8.inlineAlertController then
				p8.inlineAlertController.setInlineAlert(nil)
			end
		end, {})
	} else nil
end