local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local abuseReportAnalyticsContextModule = require(genericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext)
local analyticsServiceModule = require(genericAbuseReporting.BeduiV2.Analytics.analyticsService)
local _ = require(script.Parent.AbuseSheetFlowTypes)
local commentNodeModule = require(genericAbuseReporting.BeduiV2.Components.Nodes.CommentNode)
local confirmationNodeModule = require(genericAbuseReporting.BeduiV2.Components.Nodes.ConfirmationNode)
local listNodeModule = require(genericAbuseReporting.BeduiV2.Components.Nodes.ListNode)
local listNodeV2Module = require(genericAbuseReporting.BeduiV2.Components.Nodes.ListNodeV2)
local paragraphNodeModule = require(genericAbuseReporting.BeduiV2.Components.Nodes.ParagraphNode)
local reviewNodeModule = require(genericAbuseReporting.BeduiV2.Components.Nodes.ReviewNode)
local telemetryEventType = analyticsServiceModule.TelemetryEventType
local useAbuseReportAnalytics = abuseReportAnalyticsContextModule.useAbuseReportAnalytics
local fFlagSupportSubmissionOnAllReportNodes = require(parent.SharedFlags).FFlagSupportSubmissionOnAllReportNodes
local fFlagAbuseReportMenuV2 = require(parent.SharedFlags).FFlagAbuseReportMenuV2
local fFlagAbuseReportInExpPlayerListV3 = require(parent.SharedFlags).FFlagAbuseReportInExpPlayerListV3
local fFlagAbuseReportSceneSelectionSubmitTrackingModule = require(genericAbuseReporting.Flags.FFlagAbuseReportSceneSelectionSubmitTracking)

return reactModule.memo(function(p0)
	-- upvalues: useAbuseReportAnalytics (ref), reactModule (ref), fFlagAbuseReportMenuV2 (ref), listNodeV2Module (ref), listNodeModule (ref), dashModule (ref), commentNodeModule (ref), confirmationNodeModule (ref), fFlagSupportSubmissionOnAllReportNodes (ref), paragraphNodeModule (ref), reviewNodeModule (ref), genericAbuseReporting (ref), fFlagAbuseReportSceneSelectionSubmitTrackingModule (ref), fFlagAbuseReportInExpPlayerListV3 (ref), telemetryEventType (ref)
	local sendEvent = useAbuseReportAnalytics().sendEvent
	
	if p0.node.type == "list" then
		local var12 = if p0.store then p0.store[p0.node.storeAs] else nil
		
		return reactModule.createElement(if fFlagAbuseReportMenuV2 then listNodeV2Module else listNodeModule, dashModule.join(p0.node, {
			initialValue = if type(var12) == "table" then var12.id else nil,
			isSubmitting = p0.isSubmitting,
			onNext = function(_, p1)
				-- upvalues: p0 (ref)
				if p0.onNext then
					p0.onNext({
						store = if p0.node.storeAs then { [p0.node.storeAs] = p1 } else {}
					})
				end
			end
		}))
	elseif p0.node.type == "comment" then
		return reactModule.createElement(commentNodeModule, dashModule.join(p0.node, {
			initialValue = if p0.store then p0.store[p0.node.storeAs] else nil,
			isSubmitting = p0.isSubmitting,
			onNext = function(p2)
				-- upvalues: p0 (ref)
				if p0.onNext then
					p0.onNext({
						store = if p0.node.storeAs then { [p0.node.storeAs] = p2 } else {}
					})
				end
			end
		}))
	elseif p0.node.type == "confirmation" then
		return reactModule.createElement(confirmationNodeModule, dashModule.join(p0.node, {
			isSubmitting = if fFlagSupportSubmissionOnAllReportNodes then p0.isSubmitting else nil,
			onNext = if p0.onNext then function()
				-- upvalues: p0 (ref)
				p0.onNext({})
			end else nil
		}))
	elseif p0.node.type == "paragraph" then
		return reactModule.createElement(paragraphNodeModule, dashModule.join(p0.node, {
			isSubmitting = if fFlagSupportSubmissionOnAllReportNodes then p0.isSubmitting else nil,
			onNext = if p0.onNext then function()
				-- upvalues: p0 (ref)
				p0.onNext({})
			end else nil
		}))
	elseif fFlagAbuseReportMenuV2 and p0.node.type == "review" then
		return reactModule.createElement(reviewNodeModule, dashModule.join(p0.node, {
			isSubmitting = if fFlagSupportSubmissionOnAllReportNodes then p0.isSubmitting else nil,
			onNext = if p0.onNext then function()
				-- upvalues: p0 (ref)
				p0.onNext({})
			end else nil
		}))
	elseif fFlagAbuseReportMenuV2 and p0.node.type == "inExpChatSelection" then
		local var13 = if p0.store then p0.store[p0.node.storeAs] else nil
		
		return reactModule.createElement(require(genericAbuseReporting.BeduiV2.Components.Nodes.InExpChatSelectionNode), dashModule.join(p0.node, {
			initialValue = if type(var13) == "table" then var13.id else nil,
			isSubmitting = p0.isSubmitting,
			goBack = p0.goBack,
			onNext = function(_, p3)
				-- upvalues: p0 (ref)
				if p0.onNext then
					p0.onNext({
						store = if p0.node.storeAs then { [p0.node.storeAs] = p3 } else {}
					})
				end
			end
		}))
	elseif fFlagAbuseReportMenuV2 and p0.node.type == "inExpConfirmation" then
		return reactModule.createElement(require(genericAbuseReporting.BeduiV2.Components.Nodes.InExpConfirmationNode), dashModule.join(p0.node, {
			isSubmitting = p0.isSubmitting,
			onNext = if p0.onNext then function(p4)
				-- upvalues: p0 (ref)
				p0.onNext({
					store = if p0.node.storeAs then {
						[p0.node.storeAs.didBlockUser] = p4.didBlockUser,
						[p0.node.storeAs.didMuteUser] = p4.didMuteUser
					} else {}
				})
			end else nil
		}))
	elseif fFlagAbuseReportMenuV2 and p0.node.type == "inExpSceneSelection" then
		return reactModule.createElement(require(genericAbuseReporting.BeduiV2.Components.Nodes.InExpSceneSelectionNode), dashModule.join(p0.node, {
			onNext = if p0.onNext then function()
				-- upvalues: p0 (ref)
				p0.onNext({})
			end else nil,
			onFailure = p0.onFailure,
			goBack = p0.goBack,
			onExternalSubmit = if fFlagAbuseReportSceneSelectionSubmitTrackingModule then p0.onExternalSubmit else nil
		}))
	elseif fFlagAbuseReportInExpPlayerListV3 and p0.node.type == "inExpUserSelection" then
		local var14 = if p0.store then p0.store[p0.node.storeAs] else nil
		
		return reactModule.createElement(require(genericAbuseReporting.BeduiV2.Components.Nodes.InExpUserSelectionNode), dashModule.join(p0.node, {
			initialValue = if type(var14) == "table" then var14.id else nil,
			isSubmitting = p0.isSubmitting,
			onNext = if p0.onNext then function(_, p5)
				-- upvalues: p0 (ref)
				if p0.onNext then
					p0.onNext({
						store = if p0.node.storeAs then { [p0.node.storeAs] = p5 } else {}
					})
				end
			end else nil,
			goBack = p0.goBack
		}))
	end
	sendEvent({
		sub_event_type = telemetryEventType.Error,
		error_detail = { error_message = `Unknown node type: {p0.node.type}` }
	})
	
	return reactModule.createElement(reactModule.Fragment)
end)