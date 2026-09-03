local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local abuseReportAnalyticsContextModule = require(genericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext)
local analyticsServiceModule = require(genericAbuseReporting.BeduiV2.Analytics.analyticsService)
local _ = require(script.Parent.AbuseSheetFlowTypes)
local commentNodeModule = require(genericAbuseReporting.BeduiV2.Components.Nodes.CommentNode)
local confirmationNodeModule = require(genericAbuseReporting.BeduiV2.Components.Nodes.ConfirmationNode)
local listNodeV2Module = require(genericAbuseReporting.BeduiV2.Components.Nodes.ListNodeV2)
local paragraphNodeModule = require(genericAbuseReporting.BeduiV2.Components.Nodes.ParagraphNode)
local reviewNodeModule = require(genericAbuseReporting.BeduiV2.Components.Nodes.ReviewNode)
local telemetryEventType = analyticsServiceModule.TelemetryEventType
local useAbuseReportAnalytics = abuseReportAnalyticsContextModule.useAbuseReportAnalytics
local fFlagSupportSubmissionOnAllReportNodes = require(parent.SharedFlags).FFlagSupportSubmissionOnAllReportNodes
local fFlagAbuseReportInExpPlayerListV3 = require(parent.SharedFlags).FFlagAbuseReportInExpPlayerListV3
local fFlagAbuseReportSceneSelectionSubmitTrackingModule = require(genericAbuseReporting.Flags.FFlagAbuseReportSceneSelectionSubmitTracking)

return reactModule.memo(function(p1)
	-- upvalues: useAbuseReportAnalytics (ref), reactModule (ref), listNodeV2Module (ref), dashModule (ref), commentNodeModule (ref), confirmationNodeModule (ref), fFlagSupportSubmissionOnAllReportNodes (ref), paragraphNodeModule (ref), reviewNodeModule (ref), genericAbuseReporting (ref), fFlagAbuseReportSceneSelectionSubmitTrackingModule (ref), fFlagAbuseReportInExpPlayerListV3 (ref), telemetryEventType (ref)
	local sendEvent = useAbuseReportAnalytics().sendEvent
	
	if p1.node.type == "list" then
		local var1 = if p1.store then p1.store[p1.node.storeAs] else nil
		
		return reactModule.createElement(listNodeV2Module, dashModule.join(p1.node, {
			initialValue = if type(var1) == "table" then var1.id else nil,
			isSubmitting = p1.isSubmitting,
			onNext = function(_, p2)
				-- upvalues: p1 (ref)
				if p1.onNext then
					p1.onNext({
						store = if p1.node.storeAs then { [p1.node.storeAs] = p2 } else {}
					})
				end
			end
		}))
	elseif p1.node.type == "comment" then
		return reactModule.createElement(commentNodeModule, dashModule.join(p1.node, {
			initialValue = if p1.store then p1.store[p1.node.storeAs] else nil,
			isSubmitting = p1.isSubmitting,
			onNext = function(p2)
				-- upvalues: p1 (ref)
				if p1.onNext then
					p1.onNext({
						store = if p1.node.storeAs then { [p1.node.storeAs] = p2 } else {}
					})
				end
			end
		}))
	elseif p1.node.type == "confirmation" then
		return reactModule.createElement(confirmationNodeModule, dashModule.join(p1.node, {
			isSubmitting = if fFlagSupportSubmissionOnAllReportNodes then p1.isSubmitting else nil,
			onNext = if p1.onNext then function()
				-- upvalues: p1 (ref)
				p1.onNext({})
			end else nil
		}))
	elseif p1.node.type == "paragraph" then
		return reactModule.createElement(paragraphNodeModule, dashModule.join(p1.node, {
			isSubmitting = if fFlagSupportSubmissionOnAllReportNodes then p1.isSubmitting else nil,
			onNext = if p1.onNext then function()
				-- upvalues: p1 (ref)
				p1.onNext({})
			end else nil
		}))
	elseif p1.node.type == "review" then
		return reactModule.createElement(reviewNodeModule, dashModule.join(p1.node, {
			isSubmitting = if fFlagSupportSubmissionOnAllReportNodes then p1.isSubmitting else nil,
			onNext = if p1.onNext then function()
				-- upvalues: p1 (ref)
				p1.onNext({})
			end else nil
		}))
	elseif p1.node.type == "inExpChatSelection" then
		local var2 = if p1.store then p1.store[p1.node.storeAs] else nil
		
		return reactModule.createElement(require(genericAbuseReporting.BeduiV2.Components.Nodes.InExpChatSelectionNode), dashModule.join(p1.node, {
			initialValue = if type(var2) == "table" then var2.id else nil,
			isSubmitting = p1.isSubmitting,
			goBack = p1.goBack,
			onNext = function(_, p2)
				-- upvalues: p1 (ref)
				if p1.onNext then
					p1.onNext({
						store = if p1.node.storeAs then { [p1.node.storeAs] = p2 } else {}
					})
				end
			end
		}))
	elseif p1.node.type == "inExpConfirmation" then
		return reactModule.createElement(require(genericAbuseReporting.BeduiV2.Components.Nodes.InExpConfirmationNode), dashModule.join(p1.node, {
			isSubmitting = p1.isSubmitting,
			onNext = if p1.onNext then function(p2)
				-- upvalues: p1 (ref)
				p1.onNext({
					store = if p1.node.storeAs then {
						[p1.node.storeAs.didBlockUser] = p2.didBlockUser,
						[p1.node.storeAs.didMuteUser] = p2.didMuteUser
					} else {}
				})
			end else nil
		}))
	elseif p1.node.type == "inExpSceneSelection" then
		return reactModule.createElement(require(genericAbuseReporting.BeduiV2.Components.Nodes.InExpSceneSelectionNode), dashModule.join(p1.node, {
			onNext = if p1.onNext then function()
				-- upvalues: p1 (ref)
				p1.onNext({})
			end else nil,
			onFailure = p1.onFailure,
			goBack = p1.goBack,
			onExternalSubmit = if fFlagAbuseReportSceneSelectionSubmitTrackingModule then p1.onExternalSubmit else nil
		}))
	elseif fFlagAbuseReportInExpPlayerListV3 and p1.node.type == "inExpUserSelection" then
		local var3 = if p1.store then p1.store[p1.node.storeAs] else nil
		
		return reactModule.createElement(require(genericAbuseReporting.BeduiV2.Components.Nodes.InExpUserSelectionNode), dashModule.join(p1.node, {
			initialValue = if type(var3) == "table" then var3.id else nil,
			isSubmitting = p1.isSubmitting,
			onNext = if p1.onNext then function(_, p2)
				-- upvalues: p1 (ref)
				if p1.onNext then
					p1.onNext({
						store = if p1.node.storeAs then { [p1.node.storeAs] = p2 } else {}
					})
				end
			end else nil,
			goBack = p1.goBack
		}))
	end
	sendEvent({
		sub_event_type = telemetryEventType.Error,
		error_detail = { error_message = `Unknown node type: {p1.node.type}` }
	})
	
	return reactModule.createElement(reactModule.Fragment)
end)