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
local fFlagAbuseReportConfigStoreResolver = require(parent.SharedFlags).FFlagAbuseReportConfigStoreResolver

return reactModule.memo(function(p0) --[[ line: 45 | named "ContentNode" ]]
	-- upvalues: useAbuseReportAnalytics (ref), fFlagAbuseReportConfigStoreResolver (ref), reactModule (ref), fFlagAbuseReportMenuV2 (ref), listNodeV2Module (ref), listNodeModule (ref), dashModule (ref), commentNodeModule (ref), confirmationNodeModule (ref), fFlagSupportSubmissionOnAllReportNodes (ref), paragraphNodeModule (ref), reviewNodeModule (ref), genericAbuseReporting (ref), telemetryEventType (ref)
	local sendEvent = useAbuseReportAnalytics().sendEvent
	
	if p0.node.type == "list" then
		local var12
		local _ = nil
		
		if fFlagAbuseReportConfigStoreResolver then
			local var11 = if p0.store then p0.store[p0.node.storeAs] else nil
			var12 = if type(var11) == "table" then var11.id else nil
		else
			var12 = if p0.data then p0.data[p0.node.formKey] else nil
		end
		return reactModule.createElement(if fFlagAbuseReportMenuV2 then listNodeV2Module else listNodeModule, dashModule.join(p0.node, {
			initialValue = var12,
			isSubmitting = p0.isSubmitting,
			onNext = function(p1, p2) --[[ line: 61 ]]
				-- upvalues: p0 (ref), fFlagAbuseReportConfigStoreResolver (copy)
				if p0.onNext then
					if fFlagAbuseReportConfigStoreResolver then
						p0.onNext({
							store = if p0.node.storeAs then { [p0.node.storeAs] = p2 } else {}
						})
						
						return
					end
					local t = {}
					local t_1 = {}
					
					if p0.node.formKey and p0.node.formKey ~= "" then
						t[p0.node.formKey] = p1
					end
					if p0.node.storeSelectionAsContext and p0.node.storeSelectionAsContext ~= "" then
						t_1[p0.node.storeSelectionAsContext] = p2
					end
					p0.onNext({ data = t, context = t_1 })
				end
			end
		}))
	elseif p0.node.type == "comment" then
		return reactModule.createElement(commentNodeModule, dashModule.join(p0.node, {
			initialValue = if fFlagAbuseReportConfigStoreResolver then if p0.store then p0.store[p0.node.storeAs] else nil elseif p0.data then p0.data[p0.node.formKey] else nil,
			isSubmitting = p0.isSubmitting,
			onNext = function(p3) --[[ line: 99 ]]
				-- upvalues: p0 (ref), fFlagAbuseReportConfigStoreResolver (copy)
				if p0.onNext then
					if fFlagAbuseReportConfigStoreResolver then
						p0.onNext({
							store = if p0.node.storeAs then { [p0.node.storeAs] = p3 } else {}
						})
						
						return
					end
					local t = {}
					
					if p0.node.formKey and p0.node.formKey ~= "" then
						t[p0.node.formKey] = p3
					end
					p0.onNext({ data = t })
				end
			end
		}))
	elseif p0.node.type == "confirmation" then
		return reactModule.createElement(confirmationNodeModule, dashModule.join(p0.node, {
			isSubmitting = if fFlagSupportSubmissionOnAllReportNodes then p0.isSubmitting else nil,
			onNext = if p0.onNext then function() --[[ line: 125 ]]
				-- upvalues: p0 (ref)
				p0.onNext({})
			end else nil
		}))
	elseif p0.node.type == "paragraph" then
		return reactModule.createElement(paragraphNodeModule, dashModule.join(p0.node, {
			isSubmitting = if fFlagSupportSubmissionOnAllReportNodes then p0.isSubmitting else nil,
			onNext = if p0.onNext then function() --[[ line: 135 ]]
				-- upvalues: p0 (ref)
				p0.onNext({})
			end else nil
		}))
	elseif fFlagAbuseReportMenuV2 and p0.node.type == "review" then
		return reactModule.createElement(reviewNodeModule, dashModule.join(p0.node, {
			isSubmitting = if fFlagSupportSubmissionOnAllReportNodes then p0.isSubmitting else nil,
			onNext = if p0.onNext then function() --[[ line: 145 ]]
				-- upvalues: p0 (ref)
				p0.onNext({})
			end else nil
		}))
	elseif fFlagAbuseReportMenuV2 and p0.node.type == "inExpChatSelection" then
		local var15
		local inExpChatSelectionNodeModule = require(genericAbuseReporting.BeduiV2.Components.Nodes.InExpChatSelectionNode)
		local _ = nil
		
		if fFlagAbuseReportConfigStoreResolver then
			local var14 = if p0.store then p0.store[p0.node.storeAs] else nil
			var15 = if type(var14) == "table" then var14.id else nil
		else
			var15 = if p0.data then p0.data[p0.node.formKey] else nil
		end
		return reactModule.createElement(inExpChatSelectionNodeModule, dashModule.join(p0.node, {
			initialValue = var15,
			isSubmitting = p0.isSubmitting,
			goBack = p0.goBack,
			onNext = function(p4, p5) --[[ line: 165 ]]
				-- upvalues: p0 (ref), fFlagAbuseReportConfigStoreResolver (copy)
				if p0.onNext then
					if fFlagAbuseReportConfigStoreResolver then
						p0.onNext({
							store = if p0.node.storeAs then { [p0.node.storeAs] = p5 } else {}
						})
						
						return
					end
					local t = {}
					local t_1 = {}
					
					if p0.node.formKey and p0.node.formKey ~= "" then
						t[p0.node.formKey] = p4
					end
					if p0.node.storeSelectionAsContext and p0.node.storeSelectionAsContext ~= "" then
						t_1[p0.node.storeSelectionAsContext] = p5
					end
					p0.onNext({ data = t, context = t_1 })
				end
			end
		}))
	elseif fFlagAbuseReportMenuV2 and p0.node.type == "inExpConfirmation" then
		return reactModule.createElement(require(genericAbuseReporting.BeduiV2.Components.Nodes.InExpConfirmationNode), dashModule.join(p0.node, {
			isSubmitting = p0.isSubmitting,
			onNext = if p0.onNext then function(p6) --[[ line: 197 ]]
				-- upvalues: p0 (ref)
				p0.onNext({
					store = if p0.node.storeAs then {
						[p0.node.storeAs.didBlockUser] = p6.didBlockUser,
						[p0.node.storeAs.didMuteUser] = p6.didMuteUser
					} else {}
				})
			end else nil
		}))
	elseif fFlagAbuseReportMenuV2 and p0.node.type == "inExpSceneSelection" then
		return reactModule.createElement(require(genericAbuseReporting.BeduiV2.Components.Nodes.InExpSceneSelectionNode), dashModule.join(p0.node, {
			onNext = if p0.onNext then function() --[[ line: 215 ]]
				-- upvalues: p0 (ref)
				p0.onNext({})
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