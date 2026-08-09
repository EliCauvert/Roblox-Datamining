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
local _ = require(genericAbuseReporting.BeduiV2.Types)
local useOpenLinkModule = require(genericAbuseReporting.BeduiV2.Hooks.useOpenLink)
local getNewRunId = reducerModule.getNewRunId
local reducer = reducerModule.reducer
local selectContext = reducerModule.selectContext
local selectFormData = reducerModule.selectFormData
local selectStore = reducerModule.selectStore
local sendAnalyticsEvent = analyticsServiceModule.sendAnalyticsEvent
local telemetryEventType = analyticsServiceModule.TelemetryEventType
local fFlagAbuseReportMenuV2 = require(parent.SharedFlags).FFlagAbuseReportMenuV2
local fFlagAbuseReportConfigStoreResolver = require(parent.SharedFlags).FFlagAbuseReportConfigStoreResolver
local dynamicReportV2SubmitFailErrorEvent = game:DefineFastFlag("DynamicReportV2SubmitFailErrorEvent", false)
local fFlagFixAnalyticsForDynamicReportV2 = require(parent.SharedFlags).FFlagFixAnalyticsForDynamicReportV2
local fFlagAbuseReportInlineAlertStateOutsideReducerModule = require(genericAbuseReporting.Flags.FFlagAbuseReportInlineAlertStateOutsideReducer)

local function useAbuseSheetAnalytics(p0, p1, p2, p3) --[[ line: 60 ]]
	-- upvalues: reactModule (ref), dashModule (ref), fFlagAbuseReportMenuV2 (ref), sendAnalyticsEvent (ref)
	return reactModule.useCallback(function(p4) --[[ line: 62 ]]
		-- upvalues: p0 (ref), dashModule (copy), p1 (ref), p2 (ref), fFlagAbuseReportMenuV2 (copy), p3 (ref), sendAnalyticsEvent (copy)
		sendAnalyticsEvent({
			run_id = p0.runId,
			user_id = p0.userId,
			abuse_vector = p1,
			target_id = p2,
			total_duration = if p0.openTime then DateTime.now().UnixTimestampMillis - p0.openTime else 0,
			path = dashModule.map(p0.stack, function(p5) --[[ line: 65 ]]
				return p5.nodeId
			end),
			config_name = if fFlagAbuseReportMenuV2 then p3 else nil
		}, p4)
	end, {
		p0.stack, p0.openTime, p0.runId, p1, p2,
		if fFlagAbuseReportMenuV2 then p3 else nil
	})
end

return function(p6, p7) --[[ line: 125 | named "useAbuseSheetFlow" ]]
	-- upvalues: reactModule (ref), fFlagAbuseReportMenuV2 (ref), resolveStartNode (ref), reducer (ref), getInitialState (ref), getNewRunId (ref), useOpenLinkModule (ref), useRoactService (ref), roactNetworking (ref), useAbuseSheetAnalytics (ref), fFlagAbuseReportConfigStoreResolver (ref), selectContext (ref), selectFormData (ref), selectStore (ref), resolveArConfig (ref), telemetryEventType (ref), fFlagAbuseReportInlineAlertStateOutsideReducerModule (ref), fFlagFixAnalyticsForDynamicReportV2 (ref), dashModule (ref), sendReportModule (ref), dynamicReportV2SubmitFailErrorEvent (ref), contentNodeModule (ref)
	local var14, var15
	local var11 = reactModule.useMemo(function() --[[ line: 144 ]]
		-- upvalues: fFlagAbuseReportMenuV2 (copy), p6 (ref), resolveStartNode (copy)
		return if fFlagAbuseReportMenuV2 and p6 then resolveStartNode(p6) else "root"
	end, { p6 })
	local _ = nil
	local _ = nil
	
	if fFlagAbuseReportMenuV2 then
		local var12, var13 = reactModule.useReducer(reducer, nil, function() --[[ line: 149 ]]
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
	local var21 = reactModule.useMemo(function() --[[ line: 167 ]]
		-- upvalues: fFlagAbuseReportConfigStoreResolver (copy), selectContext (copy), var14 (write)
		return if fFlagAbuseReportConfigStoreResolver then {} else selectContext(var14)
	end, { var14 })
	local var22 = reactModule.useMemo(function() --[[ line: 171 ]]
		-- upvalues: fFlagAbuseReportConfigStoreResolver (copy), selectFormData (copy), var14 (write)
		return if fFlagAbuseReportConfigStoreResolver then {} else selectFormData(var14)
	end, { var14 })
	local var23 = reactModule.useMemo(function() --[[ line: 175 ]]
		-- upvalues: fFlagAbuseReportConfigStoreResolver (copy), selectStore (copy), var14 (write)
		return if fFlagAbuseReportConfigStoreResolver then selectStore(var14) else {}
	end, { var14 })
	local var24 = reactModule.useMemo(function() --[[ line: 180 ]]
		-- upvalues: p6 (ref), resolveArConfig (copy), fFlagAbuseReportConfigStoreResolver (copy), var21 (ref), var22 (ref), var23 (ref)
		return if p6 then resolveArConfig(p6, {
			attribute = p6.attributes,
			resources = p6.resources or {},
			context = if not fFlagAbuseReportConfigStoreResolver then var21 else {},
			formData = if not fFlagAbuseReportConfigStoreResolver then var22 else {},
			store = if fFlagAbuseReportConfigStoreResolver then var23 else {}
		}) else nil
	end, {
		p6,
		if not fFlagAbuseReportConfigStoreResolver then var21 else nil,
		if not fFlagAbuseReportConfigStoreResolver then var22 else nil,
		if fFlagAbuseReportConfigStoreResolver then var23 else nil
	})
	local var25 = reactModule.useRef(true)
	local var26 = reactModule.useRef(false)
	local var27 = fFlagAbuseReportMenuV2 and p7.attemptTrigger == "onFirstAction"
	local none = reactModule.useRef("none")
	local var29 = reactModule.useRef(var20)
	var29.current = var20
	local var30 = reactModule.useRef(var14.submissionState)
	var30.current = var14.submissionState
	
	local function _(value) --[[ line: 215 | named "setNonReducerPendingInlineAlert" ]]
		-- upvalues: p7 (ref)
		if p7.inlineAlertController then
			p7.inlineAlertController.setInlineAlert(value)
		end
	end
	
	reactModule.useEffect(function() --[[ line: 223 ]]
		-- upvalues: fFlagAbuseReportMenuV2 (copy), none (ref), var29 (ref), var30 (ref), telemetryEventType (copy)
		if fFlagAbuseReportMenuV2 then
			return function() --[[ line: 227 ]]
				-- upvalues: none (copy), var29 (copy), var30 (copy), telemetryEventType (copy)
				if none.current == "started" then
					none.current = "completed"
					var29.current(if var30.current == "completed" then { sub_event_type = telemetryEventType.ReportCompleted } else { sub_event_type = telemetryEventType.ReportAbandoned })
					
					return
				end
			end
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 245 ]]
		-- upvalues: p7 (ref), var25 (ref), getNewRunId (copy), var15 (write), var11 (ref), fFlagAbuseReportInlineAlertStateOutsideReducerModule (copy), fFlagFixAnalyticsForDynamicReportV2 (copy), var26 (ref), fFlagAbuseReportMenuV2 (copy), var27 (ref), var20 (ref), telemetryEventType (copy), none (ref)
		if p7.open and not var25.current then
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
				var26.current = false
			end
		end
		var25.current = false
		
		if p7.open and not fFlagAbuseReportMenuV2 or fFlagAbuseReportMenuV2 and p7.open and not var27 then
			var20({ sub_event_type = telemetryEventType.ReportStarted })
			
			if fFlagAbuseReportMenuV2 then
				none.current = "started"
			end
		end
	end, { p7.open })
	reactModule.useLayoutEffect(function() --[[ line: 292 ]]
		-- upvalues: fFlagAbuseReportMenuV2 (copy), p6 (ref), var14 (write), var11 (ref), var15 (write), fFlagAbuseReportInlineAlertStateOutsideReducerModule (copy)
		if not fFlagAbuseReportMenuV2 then return end
		if not p6 then return end
		if #var14.stack > 1 then return end
		local var38 = var14.stack[1]
		
		if var38 and var38.nodeId == var11 then
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
	local var31 = dashModule.last(var14.stack)
	local nodeId = var24 and (var24.nodes and (var31 and var24.nodes[var31.nodeId]))
	
	if not fFlagFixAnalyticsForDynamicReportV2 then
		if not var31 then
			var20({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "No current page found in abuse sheet flow."
				}
			})
		elseif not var31.nodeId then
			var20({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "Current page has no nodeId in abuse sheet flow."
				}
			})
		end
		if not var24 or not var24.nodes then
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
					error_message = `No config found for current nodeId: {var31 and var31.nodeId}`
				}
			})
		end
	end
	reactModule.useEffect(function() --[[ line: 359 ]]
		-- upvalues: fFlagFixAnalyticsForDynamicReportV2 (copy), p7 (ref), var26 (ref), p6 (ref), var31 (ref), var20 (ref), telemetryEventType (copy), var24 (ref), nodeId (ref)
		if not fFlagFixAnalyticsForDynamicReportV2 or not p7.open or var26.current then return end
		if not p6 then return end
		if not var31 then
			var20({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "No current page found in abuse sheet flow."
				}
			})
			var26.current = true
			
			return
		elseif not var31.nodeId then
			var20({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "Current page has no nodeId in abuse sheet flow."
				}
			})
			var26.current = true
			
			return
		elseif not var24 or not var24.nodes then
			var20({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "Abuse sheet flow config or nodes is nil."
				}
			})
			var26.current = true
			
			return
		elseif not nodeId then
			var20({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = `No config found for current nodeId: {var31.nodeId}`
				}
			})
			var26.current = true
		end
	end, {
		p7.open, p6, var24, var31, nodeId, var20
	})
	
	local function notifyFinish() --[[ line: 396 ]]
		-- upvalues: fFlagAbuseReportMenuV2 (copy), p7 (ref), var30 (ref), none (ref), var29 (ref), telemetryEventType (copy)
		if fFlagAbuseReportMenuV2 and p7.onFinish then
			p7.onFinish({ didSubmit = var30.current == "completed" })
		end
		if fFlagAbuseReportMenuV2 and none.current == "started" then
			none.current = "completed"
			var29.current(if var30.current == "completed" then { sub_event_type = telemetryEventType.ReportCompleted } else { sub_event_type = telemetryEventType.ReportAbandoned })
		end
	end
	
	local function handleClose() --[[ line: 411 ]]
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
	
	local function reset(value) --[[ line: 427 ]]
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
	
	reactModule.useEffect(function() --[[ line: 458 ]]
		-- upvalues: var24 (ref), nodeId (ref), var14 (write), dashModule (copy), p7 (ref), fFlagAbuseReportMenuV2 (copy), var15 (write), fFlagAbuseReportInlineAlertStateOutsideReducerModule (copy), var18 (ref), handleClose (ref), notifyFinish (ref), reset (ref), sendReportModule (copy), var19 (ref), var20 (ref), telemetryEventType (copy), var30 (ref), dynamicReportV2SubmitFailErrorEvent (copy)
		if not var24 or not nodeId then return end
		if var14.navigationState ~= "gotoNext" then return end
		local var39 = dashModule.last(var14.stack)
		
		if not var39 or not var39.nodeId then
			warn("Navigation triggered but current page or nodeId is invalid")
			
			return
		elseif not var24.nodes[var39.nodeId] then
			warn(`Navigation triggered but no config found for nodeId: {var39.nodeId}`)
			
			return
		end
		local function handleNextSimple(p8) --[[ line: 480 ]]
			-- upvalues: p7 (copy), fFlagAbuseReportMenuV2 (copy), var15 (copy), fFlagAbuseReportInlineAlertStateOutsideReducerModule (copy), var18 (copy), handleClose (copy), notifyFinish (copy), reset (copy)
			if not p8 then
				warn("handleNextSimple called with nil next value")
				p7.onClose()
				
				return
			end
			local unixTimestampMillis = DateTime.now().UnixTimestampMillis
			local var41 = if fFlagAbuseReportMenuV2 and type(p8) == "table" then p8.inlineAlert else nil
			
			if type(p8) == "string" then
				var15({
					type = "gotoNode",
					payload = { nodeId = p8, enterTime = unixTimestampMillis }
				})
				
				if fFlagAbuseReportInlineAlertStateOutsideReducerModule and p7.inlineAlertController then
					p7.inlineAlertController.setInlineAlert(nil)
					
					return
				end
			elseif type(p8) ~= "table" or p8.type ~= "goto" then
				if type(p8) == "table" and p8.type == "link" then
					var18("", p8.href)
					handleClose()
					
					return
				elseif type(p8) == "table" and p8.type == "close" then
					handleClose()
					
					return
				elseif fFlagAbuseReportMenuV2 and type(p8) == "table" and p8.type == "reset" then
					notifyFinish()
					reset(var41)
					
					return
				end
				warn(`Unknown next type: {typeof(p8)}, value: {p8}`)
				handleClose()
			elseif fFlagAbuseReportMenuV2 and p8.replace then
				var15({
					type = "replaceAndGotoNode",
					payload = {
						nodeId = p8.nodeId,
						enterTime = unixTimestampMillis,
						inlineAlert = if not fFlagAbuseReportInlineAlertStateOutsideReducerModule then var41 else nil
					}
				})
				
				if fFlagAbuseReportInlineAlertStateOutsideReducerModule and p7.inlineAlertController then
					p7.inlineAlertController.setInlineAlert(var41)
					
					return
				end
			else
				var15({
					type = "gotoNode",
					payload = { nodeId = p8.nodeId, enterTime = unixTimestampMillis }
				})
				
				if fFlagAbuseReportInlineAlertStateOutsideReducerModule and p7.inlineAlertController then
					p7.inlineAlertController.setInlineAlert(nil)
					
					return
				end
			end
		end
		
		local function _() --[[ line: 544 | named "onSubmitForm" ]]
			-- upvalues: var24 (copy), fFlagAbuseReportMenuV2 (copy), p7 (copy), sendReportModule (copy), var19 (copy)
			local submission = var24.submission
			
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
		var20({ sub_event_type = telemetryEventType.Submit })
		var15({ type = "startedSubmission" })
		local submission = var24.submission;
		(if fFlagAbuseReportMenuV2 and p7.onCustomSubmit then p7.onCustomSubmit(submission) else sendReportModule(var19, submission.endpoint, submission.data)):andThen(function(p10) --[[ line: 562 ]]
			-- upvalues: var15 (copy), var20 (copy), telemetryEventType (copy), unixTimestampMillis (ref), fFlagAbuseReportMenuV2 (copy), var30 (copy), handleNextSimple (ref), next (ref)
			var15({ type = "completedSubmission" })
			var20({
				sub_event_type = telemetryEventType.SubmitSuccess,
				submit_detail = {
					report_id = p10.responseBody and p10.responseBody.reportId,
					submit_api_duration = DateTime.now().UnixTimestampMillis - unixTimestampMillis
				}
			})
			
			if fFlagAbuseReportMenuV2 then
				var30.current = "completed"
			end
			handleNextSimple(next.onSuccess)
		end):catch(function(p9) --[[ line: 578 ]]
			-- upvalues: var15 (copy), var20 (copy), telemetryEventType (copy), unixTimestampMillis (ref), dynamicReportV2SubmitFailErrorEvent (copy), dashModule (copy), fFlagAbuseReportMenuV2 (copy), var30 (copy), next (ref), handleNextSimple (ref)
			var15({ type = "submissionFailed" })
			var20({
				sub_event_type = telemetryEventType.SubmitFail,
				submit_detail = {
					submit_api_duration = DateTime.now().UnixTimestampMillis - unixTimestampMillis
				}
			})
			
			if dynamicReportV2SubmitFailErrorEvent then
				var20({
					sub_event_type = telemetryEventType.Error,
					error_detail = {
						error_message = "submitReport: " .. dashModule.pretty(p9, { depth = 10 })
					}
				})
			end
			if fFlagAbuseReportMenuV2 then
				var30.current = "failed"
			end
			if next.onFailure then
				handleNextSimple(next.onFailure)
			end
		end)
	end, { var14.navigationState })
	local var36 = #var14.stack > 1 and not (var14.submissionState == "completed")
	
	local function goBack() --[[ line: 605 ]]
		-- upvalues: var24 (ref), nodeId (ref), var31 (ref), var36 (ref), var15 (write), fFlagAbuseReportInlineAlertStateOutsideReducerModule (copy), p7 (ref), var20 (ref), telemetryEventType (copy)
		if not var24 or not nodeId or not var31 then return end
		local unixTimestampMillis = DateTime.now().UnixTimestampMillis
		
		if var36 then
			var15({ type = "goBack" })
			
			if fFlagAbuseReportInlineAlertStateOutsideReducerModule and p7.inlineAlertController then
				p7.inlineAlertController.setInlineAlert(nil)
			end
			var20({
				sub_event_type = telemetryEventType.NodeDone,
				node_done_detail = {
					node_exit_reason = "back",
					node_id = var31.nodeId,
					node_type = nodeId.type,
					node_duration = unixTimestampMillis - var31.enterTime
				}
			})
		end
	end
	
	return if var24 and nodeId and var31 then {
		config = var24,
		canGoBack = var36,
		goBack = goBack,
		reset = reset,
		isSubmitting = var14.submissionState == "submitting",
		display = var24.display,
		onClose = handleClose,
		currentPageElement = reactModule.createElement(contentNodeModule, {
			key = var31.nodeId,
			node = nodeId,
			onNext = if nodeId and nodeId.next ~= nil then function(p11) --[[ line: 628 | named "onNext" ]]
				-- upvalues: var24 (ref), nodeId (ref), var31 (ref), fFlagAbuseReportMenuV2 (copy), none (ref), var29 (ref), telemetryEventType (copy), var15 (write), fFlagAbuseReportConfigStoreResolver (copy), var20 (ref)
				if not var24 or not nodeId or not var31 then return end
				if fFlagAbuseReportMenuV2 and none.current == "none" then
					none.current = "started"
					var29.current({ sub_event_type = telemetryEventType.ReportStarted })
				end
				local unixTimestampMillis = DateTime.now().UnixTimestampMillis
				var15({
					type = "updateDataAndNavigateNext",
					payload = {
						data = if fFlagAbuseReportConfigStoreResolver or not p11 or not p11.data then {} else p11.data,
						context = if fFlagAbuseReportConfigStoreResolver or not p11 or not p11.context then {} else p11.context,
						store = if fFlagAbuseReportConfigStoreResolver and p11 and p11.store then p11.store else {},
						expectedFromNodeId = if fFlagAbuseReportMenuV2 then var31.nodeId else nil
					}
				})
				var20({
					sub_event_type = telemetryEventType.NodeDone,
					node_done_detail = {
						node_exit_reason = "next",
						node_id = var31.nodeId,
						node_type = nodeId.type,
						node_duration = unixTimestampMillis - var31.enterTime
					}
				})
			end else nil,
			goBack = if fFlagAbuseReportMenuV2 then goBack else nil,
			data = if not fFlagAbuseReportConfigStoreResolver then var22 else {},
			store = if fFlagAbuseReportConfigStoreResolver then var23 else {},
			isSubmitting = var14.submissionState == "submitting"
		}),
		currentNodeId = if fFlagAbuseReportMenuV2 then var31.nodeId else nil,
		currentNodeType = if fFlagAbuseReportMenuV2 then nodeId.type else nil,
		navigationDirection = if fFlagAbuseReportMenuV2 then var14.lastNavigationDirection else nil,
		analytics = reactModule.useMemo(function() --[[ line: 672 ]]
			-- upvalues: var20 (ref)
			return { sendEvent = var20 }
		end, { var20 }),
		pendingInlineAlert = if fFlagAbuseReportMenuV2 then if fFlagAbuseReportInlineAlertStateOutsideReducerModule then if p7.inlineAlertController then p7.inlineAlertController.pendingInlineAlert else nil else var14.pendingInlineAlert else nil,
		dismissInlineAlert = reactModule.useCallback(function() --[[ line: 665 ]]
			-- upvalues: var15 (write), fFlagAbuseReportInlineAlertStateOutsideReducerModule (copy), p7 (ref)
			var15({ type = "clearInlineAlert" })
			
			if fFlagAbuseReportInlineAlertStateOutsideReducerModule and p7.inlineAlertController then
				p7.inlineAlertController.setInlineAlert(nil)
			end
		end, {})
	} else nil
end