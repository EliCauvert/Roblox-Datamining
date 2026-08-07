local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local dashModule = require(parent.Dash)
local _ = require(parent.LuauPolyfill)
local reactModule = require(parent.React)
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local _ = require(genericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext)
local _ = require(script.Parent.AbuseSheetFlowTypes)
local _ = require(genericAbuseReporting.Enums.AbuseVector)
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
local fFlagFixAnalyticsForDynamicReportV2 = require(parent.SharedFlags).FFlagFixAnalyticsForDynamicReportV2
local fFlagAbuseReportLinkOpenedAnalytics = require(parent.SharedFlags).FFlagAbuseReportLinkOpenedAnalytics
local fFlagAbuseReportInlineAlertStateOutsideReducerModule = require(genericAbuseReporting.Flags.FFlagAbuseReportInlineAlertStateOutsideReducer)
local fFlagAbuseReportSceneSelectionSubmitTrackingModule = require(genericAbuseReporting.Flags.FFlagAbuseReportSceneSelectionSubmitTracking)

local function useAbuseSheetAnalytics(p0, p1, p2, p3) --[[ line: 55 ]]
	-- upvalues: reactModule (ref), dashModule (ref), fFlagAbuseReportMenuV2 (ref), sendAnalyticsEvent (ref)
	return reactModule.useCallback(function(p4) --[[ line: 57 ]]
		-- upvalues: p0 (ref), dashModule (copy), p1 (ref), p2 (ref), fFlagAbuseReportMenuV2 (copy), p3 (ref), sendAnalyticsEvent (copy)
		sendAnalyticsEvent({
			run_id = p0.runId,
			user_id = p0.userId,
			abuse_vector = p1,
			target_id = p2,
			total_duration = if p0.openTime then DateTime.now().UnixTimestampMillis - p0.openTime else 0,
			path = dashModule.map(p0.stack, function(p5) --[[ line: 60 ]]
				return p5.nodeId
			end),
			config_name = if fFlagAbuseReportMenuV2 then p3 else nil
		}, p4)
	end, {
		p0.stack, p0.openTime, p0.runId, p1, p2,
		if fFlagAbuseReportMenuV2 then p3 else nil
	})
end

return function(p6, p7) --[[ line: 120 | named "useAbuseSheetFlow" ]]
	-- upvalues: reactModule (ref), fFlagAbuseReportMenuV2 (ref), resolveStartNode (ref), reducer (ref), getInitialState (ref), getNewRunId (ref), useOpenLinkModule (ref), useRoactService (ref), roactNetworking (ref), useAbuseSheetAnalytics (ref), selectStore (ref), resolveArConfig (ref), telemetryEventType (ref), fFlagAbuseReportInlineAlertStateOutsideReducerModule (ref), fFlagFixAnalyticsForDynamicReportV2 (ref), dashModule (ref), fFlagAbuseReportLinkOpenedAnalytics (ref), linkOpenedSource (ref), sendReportModule (ref), fFlagAbuseReportSceneSelectionSubmitTrackingModule (ref), submitSource (ref), contentNodeModule (ref)
	local var14, var15
	local var11 = reactModule.useMemo(function() --[[ line: 139 ]]
		-- upvalues: fFlagAbuseReportMenuV2 (copy), p6 (ref), resolveStartNode (copy)
		return if fFlagAbuseReportMenuV2 and p6 then resolveStartNode(p6) else "root"
	end, { p6 })
	local _ = nil
	local _ = nil
	
	if fFlagAbuseReportMenuV2 then
		local var12, var13 = reactModule.useReducer(reducer, nil, function() --[[ line: 144 ]]
			-- upvalues: getInitialState (copy), getNewRunId (copy), var11 (ref)
			return getInitialState(getNewRunId(), DateTime.now().UnixTimestampMillis, var11)
		end)
		var14 = var12
		var15 = var13
	else
		local var16, var17 = reactModule.useReducer(reducer, getInitialState(getNewRunId(), DateTime.now().UnixTimestampMillis, var11))
		var14 = var16
		var15 = var17
	end
	local var18 = useOpenLinkModule()
	local var19 = useRoactService(roactNetworking)
	local var20 = useAbuseSheetAnalytics(var14, p7.abuseVector, p7.targetId, if fFlagAbuseReportMenuV2 and p6 then p6.name else nil)
	local var21 = reactModule.useMemo(function() --[[ line: 162 ]]
		-- upvalues: selectStore (copy), var14 (write)
		return selectStore(var14)
	end, { var14 })
	local var22 = reactModule.useMemo(function() --[[ line: 167 ]]
		-- upvalues: p6 (ref), resolveArConfig (copy), var21 (ref)
		return if p6 then resolveArConfig(p6, {
			attribute = p6.attributes,
			resources = p6.resources or {},
			store = var21
		}) else nil
	end, { p6, var21 })
	local var23 = reactModule.useRef(true)
	local var24 = reactModule.useRef(false)
	local var25 = fFlagAbuseReportMenuV2 and p7.attemptTrigger == "onFirstAction"
	local none = reactModule.useRef("none")
	local var27 = reactModule.useRef(var20)
	var27.current = var20
	local var28 = reactModule.useRef(var14.submissionState)
	var28.current = var14.submissionState
	
	local function _(value) --[[ line: 198 | named "setNonReducerPendingInlineAlert" ]]
		-- upvalues: p7 (ref)
		if p7.inlineAlertController then
			p7.inlineAlertController.setInlineAlert(value)
		end
	end
	
	reactModule.useEffect(function() --[[ line: 206 ]]
		-- upvalues: fFlagAbuseReportMenuV2 (copy), none (ref), var27 (ref), var28 (ref), telemetryEventType (copy)
		if fFlagAbuseReportMenuV2 then
			return function() --[[ line: 210 ]]
				-- upvalues: none (copy), var27 (copy), var28 (copy), telemetryEventType (copy)
				if none.current == "started" then
					none.current = "completed"
					var27.current(if var28.current == "completed" then { sub_event_type = telemetryEventType.ReportCompleted } else { sub_event_type = telemetryEventType.ReportAbandoned })
					
					return
				end
			end
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 228 ]]
		-- upvalues: p7 (ref), var23 (ref), getNewRunId (copy), var15 (write), var11 (ref), fFlagAbuseReportInlineAlertStateOutsideReducerModule (copy), fFlagFixAnalyticsForDynamicReportV2 (copy), var24 (ref), fFlagAbuseReportMenuV2 (copy), var25 (ref), var20 (ref), telemetryEventType (copy), none (ref)
		if p7.open and not var23.current then
			var15({
				type = "reset",
				payload = {
					runId = getNewRunId(),
					initialEnterTime = DateTime.now().UnixTimestampMillis,
					startNodeId = var11
				}
			})
			
			if fFlagAbuseReportInlineAlertStateOutsideReducerModule and p7.inlineAlertController then
				p7.inlineAlertController.setInlineAlert(nil)
			end
			if fFlagFixAnalyticsForDynamicReportV2 then
				var24.current = false
			end
		end
		var23.current = false
		
		if p7.open and not fFlagAbuseReportMenuV2 or fFlagAbuseReportMenuV2 and p7.open and not var25 then
			var20({ sub_event_type = telemetryEventType.ReportStarted })
			
			if fFlagAbuseReportMenuV2 then
				none.current = "started"
			end
		end
	end, { p7.open })
	reactModule.useLayoutEffect(function() --[[ line: 275 ]]
		-- upvalues: fFlagAbuseReportMenuV2 (copy), p6 (ref), var14 (write), var11 (ref), var15 (write), fFlagAbuseReportInlineAlertStateOutsideReducerModule (copy)
		if not fFlagAbuseReportMenuV2 then return end
		if not p6 then return end
		if #var14.stack > 1 then return end
		local var37 = var14.stack[1]
		
		if var37 and var37.nodeId == var11 then
			return
		end
		var15({
			type = "reset",
			payload = {
				runId = var14.runId,
				initialEnterTime = var14.openTime or DateTime.now().UnixTimestampMillis,
				startNodeId = var11,
				inlineAlert = if not fFlagAbuseReportInlineAlertStateOutsideReducerModule then var14.pendingInlineAlert else nil
			}
		})
	end, { p6, var11 })
	local var29 = dashModule.last(var14.stack)
	local nodeId = var22 and (var22.nodes and (var29 and var22.nodes[var29.nodeId]))
	
	if not fFlagFixAnalyticsForDynamicReportV2 then
		if not var29 then
			var20({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "No current page found in abuse sheet flow."
				}
			})
		elseif not var29.nodeId then
			var20({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "Current page has no nodeId in abuse sheet flow."
				}
			})
		end
		if not var22 or not var22.nodes then
			var20({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "Abuse sheet flow config or nodes is nil."
				}
			})
		end
		if not nodeId then
			var20({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = `No config found for current nodeId: {var29 and var29.nodeId}`
				}
			})
		end
	end
	reactModule.useEffect(function() --[[ line: 342 ]]
		-- upvalues: fFlagFixAnalyticsForDynamicReportV2 (copy), p7 (ref), var24 (ref), p6 (ref), var29 (ref), var20 (ref), telemetryEventType (copy), var22 (ref), nodeId (ref)
		if not fFlagFixAnalyticsForDynamicReportV2 or not p7.open or var24.current then return end
		if not p6 then return end
		if not var29 then
			var20({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "No current page found in abuse sheet flow."
				}
			})
			var24.current = true
			
			return
		elseif not var29.nodeId then
			var20({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "Current page has no nodeId in abuse sheet flow."
				}
			})
			var24.current = true
			
			return
		elseif not var22 or not var22.nodes then
			var20({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "Abuse sheet flow config or nodes is nil."
				}
			})
			var24.current = true
			
			return
		elseif not nodeId then
			var20({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = `No config found for current nodeId: {var29.nodeId}`
				}
			})
			var24.current = true
		end
	end, {
		p7.open, p6, var22, var29, nodeId, var20
	})
	
	local function onExternalSubmit(p8) --[[ line: 388 ]]
		-- upvalues: var27 (ref), telemetryEventType (copy), var15 (write), var28 (ref)
		var27.current({
			sub_event_type = telemetryEventType.Submit,
			submit_detail = { submit_source = p8 }
		})
		var15({ type = "completedSubmission" })
		var28.current = "completed"
		var27.current({
			sub_event_type = telemetryEventType.SubmitSuccess,
			submit_detail = { submit_source = p8 }
		})
	end
	
	local function notifyFinish() --[[ line: 401 ]]
		-- upvalues: fFlagAbuseReportMenuV2 (copy), p7 (ref), var28 (ref), none (ref), var27 (ref), telemetryEventType (copy)
		if fFlagAbuseReportMenuV2 and p7.onFinish then
			p7.onFinish({ didSubmit = var28.current == "completed" })
		end
		if fFlagAbuseReportMenuV2 and none.current == "started" then
			none.current = "completed"
			var27.current(if var28.current == "completed" then { sub_event_type = telemetryEventType.ReportCompleted } else { sub_event_type = telemetryEventType.ReportAbandoned })
		end
	end
	
	local function handleClose() --[[ line: 416 ]]
		-- upvalues: notifyFinish (ref), p7 (ref), fFlagAbuseReportMenuV2 (copy), var14 (write), var20 (ref), telemetryEventType (copy)
		notifyFinish()
		p7.onClose()
		
		if not fFlagAbuseReportMenuV2 then
			if var14.submissionState ~= "completed" and var14.openTime ~= nil then
				var20({ sub_event_type = telemetryEventType.ReportAbandoned })
				
				return
			end
			var20({ sub_event_type = telemetryEventType.ReportCompleted })
		end
	end
	
	local function reset(value) --[[ line: 432 ]]
		-- upvalues: getNewRunId (copy), var15 (write), var11 (ref), fFlagAbuseReportMenuV2 (copy), fFlagAbuseReportInlineAlertStateOutsideReducerModule (copy), p7 (ref), none (ref)
		var15({
			type = "reset",
			payload = {
				runId = getNewRunId(),
				initialEnterTime = DateTime.now().UnixTimestampMillis,
				startNodeId = var11,
				inlineAlert = if fFlagAbuseReportMenuV2 and not fFlagAbuseReportInlineAlertStateOutsideReducerModule then value else nil
			}
		})
		
		if fFlagAbuseReportInlineAlertStateOutsideReducerModule and p7.inlineAlertController then
			p7.inlineAlertController.setInlineAlert(value)
		end
		none.current = "none"
	end
	
	reactModule.useEffect(function() --[[ line: 463 ]]
		-- upvalues: var22 (ref), nodeId (ref), var14 (write), dashModule (copy), p7 (ref), fFlagAbuseReportMenuV2 (copy), var15 (write), fFlagAbuseReportInlineAlertStateOutsideReducerModule (copy), fFlagAbuseReportLinkOpenedAnalytics (copy), var27 (ref), telemetryEventType (copy), linkOpenedSource (copy), var18 (ref), handleClose (ref), notifyFinish (ref), reset (ref), sendReportModule (copy), var19 (ref), var20 (ref), fFlagAbuseReportSceneSelectionSubmitTrackingModule (copy), submitSource (copy), var28 (ref)
		if not var22 or not nodeId then return end
		if var14.navigationState ~= "gotoNext" then return end
		local var38 = dashModule.last(var14.stack)
		
		if not var38 or not var38.nodeId then
			warn("Navigation triggered but current page or nodeId is invalid")
			
			return
		elseif not var22.nodes[var38.nodeId] then
			warn(`Navigation triggered but no config found for nodeId: {var38.nodeId}`)
			
			return
		end
		local function handleNextSimple(p9) --[[ line: 485 ]]
			-- upvalues: p7 (copy), fFlagAbuseReportMenuV2 (copy), var15 (copy), fFlagAbuseReportInlineAlertStateOutsideReducerModule (copy), fFlagAbuseReportLinkOpenedAnalytics (copy), var27 (copy), telemetryEventType (copy), linkOpenedSource (copy), var18 (copy), handleClose (copy), notifyFinish (copy), reset (copy)
			if not p9 then
				warn("handleNextSimple called with nil next value")
				p7.onClose()
				
				return
			end
			local unixTimestampMillis = DateTime.now().UnixTimestampMillis
			local var40 = if fFlagAbuseReportMenuV2 and type(p9) == "table" then p9.inlineAlert else nil
			
			if type(p9) == "string" then
				var15({
					type = "gotoNode",
					payload = { nodeId = p9, enterTime = unixTimestampMillis }
				})
				
				if fFlagAbuseReportInlineAlertStateOutsideReducerModule and p7.inlineAlertController then
					p7.inlineAlertController.setInlineAlert(nil)
					
					return
				end
			elseif type(p9) ~= "table" or p9.type ~= "goto" then
				if type(p9) == "table" and p9.type == "link" then
					if fFlagAbuseReportLinkOpenedAnalytics then
						var27.current({
							sub_event_type = telemetryEventType.LinkOpened,
							link_detail = { href = p9.href, source = linkOpenedSource.NextAction }
						})
					end
					var18("", p9.href)
					handleClose()
					
					return
				elseif type(p9) == "table" and p9.type == "close" then
					handleClose()
					
					return
				elseif fFlagAbuseReportMenuV2 and type(p9) == "table" and p9.type == "reset" then
					notifyFinish()
					reset(var40)
					
					return
				end
				warn(`Unknown next type: {typeof(p9)}, value: {p9}`)
				handleClose()
			elseif fFlagAbuseReportMenuV2 and p9.replace then
				var15({
					type = "replaceAndGotoNode",
					payload = {
						nodeId = p9.nodeId,
						enterTime = unixTimestampMillis,
						inlineAlert = if not fFlagAbuseReportInlineAlertStateOutsideReducerModule then var40 else nil
					}
				})
				
				if fFlagAbuseReportInlineAlertStateOutsideReducerModule and p7.inlineAlertController then
					p7.inlineAlertController.setInlineAlert(var40)
					
					return
				end
			else
				var15({
					type = "gotoNode",
					payload = { nodeId = p9.nodeId, enterTime = unixTimestampMillis }
				})
				
				if fFlagAbuseReportInlineAlertStateOutsideReducerModule and p7.inlineAlertController then
					p7.inlineAlertController.setInlineAlert(nil)
					
					return
				end
			end
		end
		
		local function _() --[[ line: 558 | named "onSubmitForm" ]]
			-- upvalues: var22 (copy), fFlagAbuseReportMenuV2 (copy), p7 (copy), sendReportModule (copy), var19 (copy)
			local submission = var22.submission
			
			return if fFlagAbuseReportMenuV2 and p7.onCustomSubmit then p7.onCustomSubmit(submission) else sendReportModule(var19, submission.endpoint, submission.data)
		end
		
		local next = nodeId.next
		
		if not next then
			warn("currentNode.next is nil, closing")
			p7.onClose()
			
			return
		elseif type(next) ~= "table" or next.type ~= "submitForm" then
			handleNextSimple(next)
			
			return
		end
		local unixTimestampMillis = DateTime.now().UnixTimestampMillis
		var20({
			sub_event_type = telemetryEventType.Submit,
			submit_detail = if fFlagAbuseReportSceneSelectionSubmitTrackingModule then { submit_source = submitSource.Flow } else nil
		})
		var15({ type = "startedSubmission" })
		local submission = var22.submission;
		(if fFlagAbuseReportMenuV2 and p7.onCustomSubmit then p7.onCustomSubmit(submission) else sendReportModule(var19, submission.endpoint, submission.data)):andThen(function(p11) --[[ line: 581 ]]
			-- upvalues: var15 (copy), var20 (copy), telemetryEventType (copy), unixTimestampMillis (ref), fFlagAbuseReportSceneSelectionSubmitTrackingModule (copy), submitSource (copy), fFlagAbuseReportMenuV2 (copy), var28 (copy), handleNextSimple (ref), next (ref)
			var15({ type = "completedSubmission" })
			var20({
				sub_event_type = telemetryEventType.SubmitSuccess,
				submit_detail = {
					report_id = p11.responseBody and p11.responseBody.reportId,
					submit_api_duration = DateTime.now().UnixTimestampMillis - unixTimestampMillis,
					submit_source = if fFlagAbuseReportSceneSelectionSubmitTrackingModule then submitSource.Flow else nil
				}
			})
			
			if fFlagAbuseReportMenuV2 then
				var28.current = "completed"
			end
			handleNextSimple(next.onSuccess)
		end):catch(function(p10) --[[ line: 600 ]]
			-- upvalues: var15 (copy), var20 (copy), telemetryEventType (copy), unixTimestampMillis (ref), fFlagAbuseReportSceneSelectionSubmitTrackingModule (copy), submitSource (copy), dashModule (copy), fFlagAbuseReportMenuV2 (copy), var28 (copy), next (ref), handleNextSimple (ref)
			var15({ type = "submissionFailed" })
			var20({
				sub_event_type = telemetryEventType.SubmitFail,
				submit_detail = {
					submit_api_duration = DateTime.now().UnixTimestampMillis - unixTimestampMillis,
					submit_source = if fFlagAbuseReportSceneSelectionSubmitTrackingModule then submitSource.Flow else nil
				}
			})
			var20({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "submitReport: " .. dashModule.pretty(p10, { depth = 10 })
				}
			})
			
			if fFlagAbuseReportMenuV2 then
				var28.current = "failed"
			end
			if next.onFailure then
				handleNextSimple(next.onFailure)
			end
		end)
	end, { var14.navigationState })
	local var35 = #var14.stack > 1 and not (var14.submissionState == "completed")
	
	local function goBack() --[[ line: 630 ]]
		-- upvalues: var22 (ref), nodeId (ref), var29 (ref), var35 (ref), var15 (write), fFlagAbuseReportInlineAlertStateOutsideReducerModule (copy), p7 (ref), var20 (ref), telemetryEventType (copy)
		if not var22 or not nodeId or not var29 then return end
		local unixTimestampMillis = DateTime.now().UnixTimestampMillis
		
		if var35 then
			var15({ type = "goBack" })
			
			if fFlagAbuseReportInlineAlertStateOutsideReducerModule and p7.inlineAlertController then
				p7.inlineAlertController.setInlineAlert(nil)
			end
			var20({
				sub_event_type = telemetryEventType.NodeDone,
				node_done_detail = {
					node_exit_reason = "back",
					node_id = var29.nodeId,
					node_type = nodeId.type,
					node_duration = unixTimestampMillis - var29.enterTime
				}
			})
		end
	end
	
	return if var22 and nodeId and var29 then {
		config = var22,
		canGoBack = var35,
		goBack = goBack,
		reset = reset,
		isSubmitting = var14.submissionState == "submitting",
		display = var22.display,
		onClose = handleClose,
		currentPageElement = reactModule.createElement(contentNodeModule, {
			key = var29.nodeId,
			node = nodeId,
			onNext = if nodeId and nodeId.next ~= nil then function(p12) --[[ line: 653 | named "onNext" ]]
				-- upvalues: var22 (ref), nodeId (ref), var29 (ref), fFlagAbuseReportMenuV2 (copy), none (ref), var27 (ref), telemetryEventType (copy), var15 (write), var20 (ref)
				if not var22 or not nodeId or not var29 then return end
				if fFlagAbuseReportMenuV2 and none.current == "none" then
					none.current = "started"
					var27.current({ sub_event_type = telemetryEventType.ReportStarted })
				end
				local unixTimestampMillis = DateTime.now().UnixTimestampMillis
				var15({
					type = "updateDataAndNavigateNext",
					payload = {
						store = if p12 and p12.store then p12.store else {},
						expectedFromNodeId = if fFlagAbuseReportMenuV2 then var29.nodeId else nil
					}
				})
				var20({
					sub_event_type = telemetryEventType.NodeDone,
					node_done_detail = {
						node_exit_reason = "next",
						node_id = var29.nodeId,
						node_type = nodeId.type,
						node_duration = unixTimestampMillis - var29.enterTime
					}
				})
			end else nil,
			goBack = if fFlagAbuseReportMenuV2 then goBack else nil,
			onExternalSubmit = if fFlagAbuseReportSceneSelectionSubmitTrackingModule then onExternalSubmit else nil,
			store = var21,
			isSubmitting = var14.submissionState == "submitting"
		}),
		currentNodeId = if fFlagAbuseReportMenuV2 then var29.nodeId else nil,
		currentNodeType = if fFlagAbuseReportMenuV2 then nodeId.type else nil,
		navigationDirection = if fFlagAbuseReportMenuV2 then var14.lastNavigationDirection else nil,
		analytics = reactModule.useMemo(function() --[[ line: 691 ]]
			-- upvalues: var20 (ref)
			return { sendEvent = var20 }
		end, { var20 }),
		pendingInlineAlert = if fFlagAbuseReportMenuV2 then if fFlagAbuseReportInlineAlertStateOutsideReducerModule then if p7.inlineAlertController then p7.inlineAlertController.pendingInlineAlert else nil else var14.pendingInlineAlert else nil,
		dismissInlineAlert = reactModule.useCallback(function() --[[ line: 684 ]]
			-- upvalues: var15 (write), fFlagAbuseReportInlineAlertStateOutsideReducerModule (copy), p7 (ref)
			var15({ type = "clearInlineAlert" })
			
			if fFlagAbuseReportInlineAlertStateOutsideReducerModule and p7.inlineAlertController then
				p7.inlineAlertController.setInlineAlert(nil)
			end
		end, {})
	} else nil
end