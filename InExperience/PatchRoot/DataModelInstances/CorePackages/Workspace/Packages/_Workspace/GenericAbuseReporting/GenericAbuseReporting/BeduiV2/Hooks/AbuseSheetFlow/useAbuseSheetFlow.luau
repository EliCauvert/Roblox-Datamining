local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local dashModule = require(parent.Dash)
local _ = require(parent.LuauPolyfill)
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

local function useAbuseSheetAnalytics(p0, p1, p2, p3) --[[ line: 57 ]]
	-- upvalues: reactModule (ref), dashModule (ref), fFlagAbuseReportMenuV2 (ref), sendAnalyticsEvent (ref)
	return reactModule.useCallback(function(p4) --[[ line: 59 ]]
		-- upvalues: p0 (ref), dashModule (copy), p1 (ref), p2 (ref), fFlagAbuseReportMenuV2 (copy), p3 (ref), sendAnalyticsEvent (copy)
		sendAnalyticsEvent({
			run_id = p0.runId,
			user_id = p0.userId,
			abuse_vector = p1,
			target_id = p2,
			total_duration = if p0.openTime then DateTime.now().UnixTimestampMillis - p0.openTime else 0,
			path = dashModule.map(p0.stack, function(p5) --[[ line: 62 ]]
				return p5.nodeId
			end),
			config_name = if fFlagAbuseReportMenuV2 then p3 else nil
		}, p4)
	end, {
		p0.stack, p0.openTime, p0.runId, p1, p2,
		if fFlagAbuseReportMenuV2 then p3 else nil
	})
end

return function(p6, p7) --[[ line: 122 | named "useAbuseSheetFlow" ]]
	-- upvalues: reactModule (ref), fFlagAbuseReportMenuV2 (ref), resolveStartNode (ref), reducer (ref), getInitialState (ref), getNewRunId (ref), useOpenLinkModule (ref), useRoactService (ref), roactNetworking (ref), useAbuseSheetAnalytics (ref), selectStore (ref), resolveArConfig (ref), telemetryEventType (ref), fFlagAbuseReportInlineAlertStateOutsideReducerModule (ref), fFlagFixAnalyticsForDynamicReportV2 (ref), dashModule (ref), fFlagAbuseReportLinkOpenedAnalytics (ref), linkOpenedSource (ref), fFlagEnableReportingFlowForMomentsFeed (ref), abuseVectorModule (ref), sendReportModule (ref), fFlagAbuseReportSceneSelectionNextOnFailureModule (ref), fFlagAbuseReportSceneSelectionSubmitTrackingModule (ref), submitSource (ref), contentNodeModule (ref)
	local var16, var17
	local var13 = reactModule.useMemo(function() --[[ line: 143 ]]
		-- upvalues: fFlagAbuseReportMenuV2 (copy), p6 (ref), resolveStartNode (copy)
		return if fFlagAbuseReportMenuV2 and p6 then resolveStartNode(p6) else "root"
	end, { p6 })
	local _ = nil
	local _ = nil
	
	if fFlagAbuseReportMenuV2 then
		local var14, var15 = reactModule.useReducer(reducer, nil, function() --[[ line: 148 ]]
			-- upvalues: getInitialState (copy), getNewRunId (copy), var13 (ref)
			return getInitialState(getNewRunId(), DateTime.now().UnixTimestampMillis, var13)
		end)
		var16 = var14
		var17 = var15
	else
		local var18, var19 = reactModule.useReducer(reducer, getInitialState(getNewRunId(), DateTime.now().UnixTimestampMillis, var13))
		var16 = var18
		var17 = var19
	end
	local var20 = useOpenLinkModule()
	local var21 = useRoactService(roactNetworking)
	local var22 = useAbuseSheetAnalytics(var16, p7.abuseVector, p7.targetId, if fFlagAbuseReportMenuV2 and p6 then p6.name else nil)
	local var23 = reactModule.useMemo(function() --[[ line: 166 ]]
		-- upvalues: selectStore (copy), var16 (write)
		return selectStore(var16)
	end, { var16 })
	local var24 = reactModule.useMemo(function() --[[ line: 171 ]]
		-- upvalues: p6 (ref), resolveArConfig (copy), var23 (ref)
		return if p6 then resolveArConfig(p6, {
			attribute = p6.attributes,
			resources = p6.resources or {},
			store = var23
		}) else nil
	end, { p6, var23 })
	local var25 = reactModule.useRef(true)
	local var26 = reactModule.useRef(false)
	local var27 = fFlagAbuseReportMenuV2 and p7.attemptTrigger == "onFirstAction"
	local none = reactModule.useRef("none")
	local var29 = reactModule.useRef(var22)
	var29.current = var22
	local var30 = reactModule.useRef(var16.submissionState)
	var30.current = var16.submissionState
	
	local function _(value) --[[ line: 202 | named "setNonReducerPendingInlineAlert" ]]
		-- upvalues: p7 (ref)
		if p7.inlineAlertController then
			p7.inlineAlertController.setInlineAlert(value)
		end
	end
	
	reactModule.useEffect(function() --[[ line: 210 ]]
		-- upvalues: fFlagAbuseReportMenuV2 (copy), none (ref), var29 (ref), var30 (ref), telemetryEventType (copy)
		if fFlagAbuseReportMenuV2 then
			return function() --[[ line: 214 ]]
				-- upvalues: none (copy), var29 (copy), var30 (copy), telemetryEventType (copy)
				if none.current == "started" then
					none.current = "completed"
					var29.current(if var30.current == "completed" then { sub_event_type = telemetryEventType.ReportCompleted } else { sub_event_type = telemetryEventType.ReportAbandoned })
					
					return
				end
			end
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 232 ]]
		-- upvalues: p7 (ref), var25 (ref), getNewRunId (copy), var17 (write), var13 (ref), fFlagAbuseReportInlineAlertStateOutsideReducerModule (copy), fFlagFixAnalyticsForDynamicReportV2 (copy), var26 (ref), fFlagAbuseReportMenuV2 (copy), var27 (ref), var22 (ref), telemetryEventType (copy), none (ref)
		if p7.open and not var25.current then
			var17({
				type = "reset",
				payload = {
					runId = getNewRunId(),
					initialEnterTime = DateTime.now().UnixTimestampMillis,
					startNodeId = var13
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
			var22({ sub_event_type = telemetryEventType.ReportStarted })
			
			if fFlagAbuseReportMenuV2 then
				none.current = "started"
			end
		end
	end, { p7.open })
	reactModule.useLayoutEffect(function() --[[ line: 279 ]]
		-- upvalues: fFlagAbuseReportMenuV2 (copy), p6 (ref), var16 (write), var13 (ref), var17 (write), fFlagAbuseReportInlineAlertStateOutsideReducerModule (copy)
		if not fFlagAbuseReportMenuV2 then return end
		if not p6 then return end
		if #var16.stack > 1 then return end
		local var39 = var16.stack[1]
		
		if var39 and var39.nodeId == var13 then
			return
		end
		var17({
			type = "reset",
			payload = {
				runId = var16.runId,
				initialEnterTime = var16.openTime or DateTime.now().UnixTimestampMillis,
				startNodeId = var13,
				inlineAlert = if not fFlagAbuseReportInlineAlertStateOutsideReducerModule then var16.pendingInlineAlert else nil
			}
		})
	end, { p6, var13 })
	local var31 = dashModule.last(var16.stack)
	local nodeId = var24 and (var24.nodes and (var31 and var24.nodes[var31.nodeId]))
	
	if not fFlagFixAnalyticsForDynamicReportV2 then
		if not var31 then
			var22({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "No current page found in abuse sheet flow."
				}
			})
		elseif not var31.nodeId then
			var22({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "Current page has no nodeId in abuse sheet flow."
				}
			})
		end
		if not var24 or not var24.nodes then
			var22({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "Abuse sheet flow config or nodes is nil."
				}
			})
		end
		if not nodeId then
			var22({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = `No config found for current nodeId: {var31 and var31.nodeId}`
				}
			})
		end
	end
	reactModule.useEffect(function() --[[ line: 346 ]]
		-- upvalues: fFlagFixAnalyticsForDynamicReportV2 (copy), p7 (ref), var26 (ref), p6 (ref), var31 (ref), var22 (ref), telemetryEventType (copy), var24 (ref), nodeId (ref)
		if not fFlagFixAnalyticsForDynamicReportV2 or not p7.open or var26.current then return end
		if not p6 then return end
		if not var31 then
			var22({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "No current page found in abuse sheet flow."
				}
			})
			var26.current = true
			
			return
		elseif not var31.nodeId then
			var22({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "Current page has no nodeId in abuse sheet flow."
				}
			})
			var26.current = true
			
			return
		elseif not var24 or not var24.nodes then
			var22({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "Abuse sheet flow config or nodes is nil."
				}
			})
			var26.current = true
			
			return
		elseif not nodeId then
			var22({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = `No config found for current nodeId: {var31.nodeId}`
				}
			})
			var26.current = true
		end
	end, {
		p7.open, p6, var24, var31, nodeId, var22
	})
	
	local function onExternalSubmit(p8) --[[ line: 392 ]]
		-- upvalues: var29 (ref), telemetryEventType (copy), var17 (write), var30 (ref)
		var29.current({
			sub_event_type = telemetryEventType.Submit,
			submit_detail = { submit_source = p8 }
		})
		var17({ type = "completedSubmission" })
		var30.current = "completed"
		var29.current({
			sub_event_type = telemetryEventType.SubmitSuccess,
			submit_detail = { submit_source = p8 }
		})
	end
	
	local function notifyFinish() --[[ line: 405 ]]
		-- upvalues: fFlagAbuseReportMenuV2 (copy), p7 (ref), var30 (ref), none (ref), var29 (ref), telemetryEventType (copy)
		if fFlagAbuseReportMenuV2 and p7.onFinish then
			p7.onFinish({ didSubmit = var30.current == "completed" })
		end
		if fFlagAbuseReportMenuV2 and none.current == "started" then
			none.current = "completed"
			var29.current(if var30.current == "completed" then { sub_event_type = telemetryEventType.ReportCompleted } else { sub_event_type = telemetryEventType.ReportAbandoned })
		end
	end
	
	local function handleClose() --[[ line: 420 ]]
		-- upvalues: notifyFinish (ref), p7 (ref), fFlagAbuseReportMenuV2 (copy), var16 (write), var22 (ref), telemetryEventType (copy)
		notifyFinish()
		p7.onClose()
		
		if not fFlagAbuseReportMenuV2 then
			if var16.submissionState ~= "completed" and var16.openTime ~= nil then
				var22({ sub_event_type = telemetryEventType.ReportAbandoned })
				
				return
			end
			var22({ sub_event_type = telemetryEventType.ReportCompleted })
		end
	end
	
	local function reset(value) --[[ line: 436 ]]
		-- upvalues: getNewRunId (copy), var17 (write), var13 (ref), fFlagAbuseReportMenuV2 (copy), fFlagAbuseReportInlineAlertStateOutsideReducerModule (copy), p7 (ref), none (ref)
		var17({
			type = "reset",
			payload = {
				runId = getNewRunId(),
				initialEnterTime = DateTime.now().UnixTimestampMillis,
				startNodeId = var13,
				inlineAlert = if fFlagAbuseReportMenuV2 and not fFlagAbuseReportInlineAlertStateOutsideReducerModule then value else nil
			}
		})
		
		if fFlagAbuseReportInlineAlertStateOutsideReducerModule and p7.inlineAlertController then
			p7.inlineAlertController.setInlineAlert(value)
		end
		none.current = "none"
	end
	
	reactModule.useEffect(function() --[[ line: 467 ]]
		-- upvalues: var24 (ref), nodeId (ref), var16 (write), dashModule (copy), p7 (ref), fFlagAbuseReportMenuV2 (copy), var17 (write), fFlagAbuseReportInlineAlertStateOutsideReducerModule (copy), fFlagAbuseReportLinkOpenedAnalytics (copy), var29 (ref), telemetryEventType (copy), linkOpenedSource (copy), var20 (ref), handleClose (ref), notifyFinish (ref), reset (ref), fFlagEnableReportingFlowForMomentsFeed (copy), abuseVectorModule (copy), sendReportModule (copy), var21 (ref), fFlagAbuseReportSceneSelectionNextOnFailureModule (copy), var22 (ref), fFlagAbuseReportSceneSelectionSubmitTrackingModule (copy), submitSource (copy), var30 (ref)
		if not var24 or not nodeId then return end
		if var16.navigationState ~= "gotoNext" and var16.navigationState ~= "gotoFailure" then return end
		local var40 = dashModule.last(var16.stack)
		
		if not var40 or not var40.nodeId then
			warn("Navigation triggered but current page or nodeId is invalid")
			
			return
		end
		local nodeId_1 = var24.nodes[var40.nodeId]
		
		if not nodeId_1 then
			warn(`Navigation triggered but no config found for nodeId: {var40.nodeId}`)
			
			return
		end
		local function handleNextSimple(p9) --[[ line: 489 ]]
			-- upvalues: p7 (copy), fFlagAbuseReportMenuV2 (copy), var17 (copy), fFlagAbuseReportInlineAlertStateOutsideReducerModule (copy), fFlagAbuseReportLinkOpenedAnalytics (copy), var29 (copy), telemetryEventType (copy), linkOpenedSource (copy), var20 (copy), handleClose (copy), notifyFinish (copy), reset (copy)
			if not p9 then
				warn("handleNextSimple called with nil next value")
				p7.onClose()
				
				return
			end
			local unixTimestampMillis = DateTime.now().UnixTimestampMillis
			local var45 = if fFlagAbuseReportMenuV2 and type(p9) == "table" then p9.inlineAlert else nil
			
			if type(p9) == "string" then
				var17({
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
						var29.current({
							sub_event_type = telemetryEventType.LinkOpened,
							link_detail = { href = p9.href, source = linkOpenedSource.NextAction }
						})
					end
					var20("", p9.href)
					handleClose()
					
					return
				elseif type(p9) == "table" and p9.type == "close" then
					handleClose()
					
					return
				elseif fFlagAbuseReportMenuV2 and type(p9) == "table" and p9.type == "reset" then
					notifyFinish()
					reset(var45)
					
					return
				end
				warn(`Unknown next type: {typeof(p9)}, value: {p9}`)
				handleClose()
			elseif fFlagAbuseReportMenuV2 and p9.replace then
				var17({
					type = "replaceAndGotoNode",
					payload = {
						nodeId = p9.nodeId,
						enterTime = unixTimestampMillis,
						inlineAlert = if not fFlagAbuseReportInlineAlertStateOutsideReducerModule then var45 else nil
					}
				})
				
				if fFlagAbuseReportInlineAlertStateOutsideReducerModule and p7.inlineAlertController then
					p7.inlineAlertController.setInlineAlert(var45)
					
					return
				end
			else
				var17({
					type = "gotoNode",
					payload = { nodeId = p9.nodeId, enterTime = unixTimestampMillis }
				})
				
				if fFlagAbuseReportInlineAlertStateOutsideReducerModule and p7.inlineAlertController then
					p7.inlineAlertController.setInlineAlert(nil)
					
					return
				end
			end
		end
		
		local function _() --[[ line: 562 | named "onSubmitForm" ]]
			-- upvalues: var24 (copy), p7 (copy), fFlagEnableReportingFlowForMomentsFeed (copy), abuseVectorModule (copy), fFlagAbuseReportMenuV2 (copy), sendReportModule (copy), var21 (copy)
			local submission = var24.submission
			
			if p7.onCustomSubmit then
				if fFlagEnableReportingFlowForMomentsFeed and p7.abuseVector == abuseVectorModule.MomentsFeed then
					local var46 = p7.onCustomSubmit(submission)
					
					if var46 == nil then
					else
						return var46
					end
				else
					return if fFlagAbuseReportMenuV2 then p7.onCustomSubmit(submission) else sendReportModule(var21, submission.endpoint, submission.data)
				end
			end
		end
		
		local var42 = if var16.navigationState == "gotoFailure" then nodeId_1.nextOnFailure else nodeId.next
		
		if not var42 then
			warn(if fFlagAbuseReportSceneSelectionNextOnFailureModule then "Navigation target is nil, closing" else "currentNode.next is nil, closing")
			p7.onClose()
			
			return
		elseif type(var42) ~= "table" or var42.type ~= "submitForm" then
			handleNextSimple(var42)
			
			return
		end
		local var43
		local unixTimestampMillis = DateTime.now().UnixTimestampMillis
		var22({
			sub_event_type = telemetryEventType.Submit,
			submit_detail = if fFlagAbuseReportSceneSelectionSubmitTrackingModule then { submit_source = submitSource.Flow } else nil
		})
		var17({ type = "startedSubmission" })
		local submission = var24.submission
		
		if p7.onCustomSubmit then
			if fFlagEnableReportingFlowForMomentsFeed and p7.abuseVector == abuseVectorModule.MomentsFeed then
				local var44 = p7.onCustomSubmit(submission)
				
				if var44 == nil then
					var43:andThen(function(p11) --[[ line: 602 ]]
						-- upvalues: var17 (copy), var22 (copy), telemetryEventType (copy), unixTimestampMillis (ref), fFlagAbuseReportSceneSelectionSubmitTrackingModule (copy), submitSource (copy), fFlagAbuseReportMenuV2 (copy), var30 (copy), handleNextSimple (ref), var42 (ref)
						var17({ type = "completedSubmission" })
						var22({
							sub_event_type = telemetryEventType.SubmitSuccess,
							submit_detail = {
								report_id = p11.responseBody and p11.responseBody.reportId,
								submit_api_duration = DateTime.now().UnixTimestampMillis - unixTimestampMillis,
								submit_source = if fFlagAbuseReportSceneSelectionSubmitTrackingModule then submitSource.Flow else nil
							}
						})
						
						if fFlagAbuseReportMenuV2 then
							var30.current = "completed"
						end
						handleNextSimple(var42.onSuccess)
					end):catch(function(p10) --[[ line: 621 ]]
						-- upvalues: var17 (copy), var22 (copy), telemetryEventType (copy), unixTimestampMillis (ref), fFlagAbuseReportSceneSelectionSubmitTrackingModule (copy), submitSource (copy), dashModule (copy), fFlagAbuseReportMenuV2 (copy), var30 (copy), var42 (ref), handleNextSimple (ref)
						var17({ type = "submissionFailed" })
						var22({
							sub_event_type = telemetryEventType.SubmitFail,
							submit_detail = {
								submit_api_duration = DateTime.now().UnixTimestampMillis - unixTimestampMillis,
								submit_source = if fFlagAbuseReportSceneSelectionSubmitTrackingModule then submitSource.Flow else nil
							}
						})
						var22({
							sub_event_type = telemetryEventType.Error,
							error_detail = {
								error_message = "submitReport: " .. dashModule.pretty(p10, { depth = 10 })
							}
						})
						
						if fFlagAbuseReportMenuV2 then
							var30.current = "failed"
						end
						if var42.onFailure then
							handleNextSimple(var42.onFailure)
						end
					end)
					
					return
				else
					var43 = var44
				end
			else
				var43 = if fFlagAbuseReportMenuV2 then p7.onCustomSubmit(submission) else sendReportModule(var21, submission.endpoint, submission.data)
			end
		end
	end, { var16.navigationState })
	local var37 = #var16.stack > 1 and not (var16.submissionState == "completed")
	
	local function goBack() --[[ line: 651 ]]
		-- upvalues: var24 (ref), nodeId (ref), var31 (ref), var37 (ref), var17 (write), fFlagAbuseReportInlineAlertStateOutsideReducerModule (copy), p7 (ref), var22 (ref), telemetryEventType (copy)
		if not var24 or not nodeId or not var31 then return end
		local unixTimestampMillis = DateTime.now().UnixTimestampMillis
		
		if var37 then
			var17({ type = "goBack" })
			
			if fFlagAbuseReportInlineAlertStateOutsideReducerModule and p7.inlineAlertController then
				p7.inlineAlertController.setInlineAlert(nil)
			end
			var22({
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
		canGoBack = var37,
		goBack = goBack,
		reset = reset,
		isSubmitting = var16.submissionState == "submitting",
		display = var24.display,
		onClose = handleClose,
		currentPageElement = reactModule.createElement(contentNodeModule, {
			key = var31.nodeId,
			node = nodeId,
			onNext = if nodeId and nodeId.next ~= nil then function(p12) --[[ line: 675 | named "onNext" ]]
				-- upvalues: var24 (ref), nodeId (ref), var31 (ref), fFlagAbuseReportMenuV2 (copy), none (ref), var29 (ref), telemetryEventType (copy), var17 (write), var22 (ref)
				if not var24 or not nodeId or not var31 then return end
				if fFlagAbuseReportMenuV2 and none.current == "none" then
					none.current = "started"
					var29.current({ sub_event_type = telemetryEventType.ReportStarted })
				end
				local unixTimestampMillis = DateTime.now().UnixTimestampMillis
				var17({
					type = "updateDataAndNavigateNext",
					payload = {
						store = if p12 and p12.store then p12.store else {},
						expectedFromNodeId = if fFlagAbuseReportMenuV2 then var31.nodeId else nil
					}
				})
				var22({
					sub_event_type = telemetryEventType.NodeDone,
					node_done_detail = {
						node_exit_reason = "next",
						node_id = var31.nodeId,
						node_type = nodeId.type,
						node_duration = unixTimestampMillis - var31.enterTime
					}
				})
			end else nil,
			onFailure = if fFlagAbuseReportSceneSelectionNextOnFailureModule and (nodeId and nodeId.nextOnFailure ~= nil) then function() --[[ line: 706 | named "onFailure" ]]
				-- upvalues: var24 (ref), nodeId (ref), var31 (ref), var17 (write), var22 (ref), telemetryEventType (copy)
				if var24 and nodeId and var31 then
					local unixTimestampMillis = DateTime.now().UnixTimestampMillis
					var17({
						type = "navigateFailure",
						payload = { expectedFromNodeId = var31.nodeId }
					})
					var22({
						sub_event_type = telemetryEventType.NodeDone,
						node_done_detail = {
							node_exit_reason = "failure",
							node_id = var31.nodeId,
							node_type = nodeId.type,
							node_duration = unixTimestampMillis - var31.enterTime
						}
					})
					
					return
				end
			end else nil,
			goBack = if fFlagAbuseReportMenuV2 then goBack else nil,
			onExternalSubmit = if fFlagAbuseReportSceneSelectionSubmitTrackingModule then onExternalSubmit else nil,
			store = var23,
			isSubmitting = var16.submissionState == "submitting"
		}),
		currentNodeId = if fFlagAbuseReportMenuV2 then var31.nodeId else nil,
		currentNodeType = if fFlagAbuseReportMenuV2 then nodeId.type else nil,
		navigationDirection = if fFlagAbuseReportMenuV2 then var16.lastNavigationDirection else nil,
		analytics = reactModule.useMemo(function() --[[ line: 736 ]]
			-- upvalues: var22 (ref)
			return { sendEvent = var22 }
		end, { var22 }),
		pendingInlineAlert = if fFlagAbuseReportMenuV2 then if fFlagAbuseReportInlineAlertStateOutsideReducerModule then if p7.inlineAlertController then p7.inlineAlertController.pendingInlineAlert else nil else var16.pendingInlineAlert else nil,
		dismissInlineAlert = reactModule.useCallback(function() --[[ line: 729 ]]
			-- upvalues: var17 (write), fFlagAbuseReportInlineAlertStateOutsideReducerModule (copy), p7 (ref)
			var17({ type = "clearInlineAlert" })
			
			if fFlagAbuseReportInlineAlertStateOutsideReducerModule and p7.inlineAlertController then
				p7.inlineAlertController.setInlineAlert(nil)
			end
		end, {})
	} else nil
end