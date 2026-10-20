local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local _ = require(script.Parent.AbuseSheetFlowTypes)
local CommentNodeModule = require(GenericAbuseReporting.BeduiV2.Components.Nodes.CommentNode)
local ConfirmationNodeModule = require(GenericAbuseReporting.BeduiV2.Components.Nodes.ConfirmationNode)
local ListNodeModule = require(GenericAbuseReporting.BeduiV2.Components.Nodes.ListNode)
local ListNodeV2Module = require(GenericAbuseReporting.BeduiV2.Components.Nodes.ListNodeV2)
local ParagraphNodeModule = require(GenericAbuseReporting.BeduiV2.Components.Nodes.ParagraphNode)
local ReviewNodeModule = require(GenericAbuseReporting.BeduiV2.Components.Nodes.ReviewNode)
local TelemetryEventType = require(GenericAbuseReporting.BeduiV2.Analytics.analyticsService).TelemetryEventType
local UseAbuseReportAnalyticsFunction = require(GenericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext).useAbuseReportAnalytics
local FFlagSupportSubmissionOnAllReportNodes = require(Parent.SharedFlags).FFlagSupportSubmissionOnAllReportNodes
local FFlagAbuseReportMenuV2 = require(Parent.SharedFlags).FFlagAbuseReportMenuV2

return ReactModule.memo(function(p1)
	-- upvalues: UseAbuseReportAnalyticsFunction (copy), ReactModule (copy), FFlagAbuseReportMenuV2 (copy), ListNodeV2Module (copy), ListNodeModule (copy), DashModule (copy), CommentNodeModule (copy), ConfirmationNodeModule (copy), FFlagSupportSubmissionOnAllReportNodes (copy), ParagraphNodeModule (copy), ReviewNodeModule (copy), GenericAbuseReporting (copy), TelemetryEventType (copy)
	local SendEventFunction: (any) -> () = UseAbuseReportAnalyticsFunction().sendEvent
	
	if p1.node.type == "list" then
		local StoreEntry = if p1.store then p1.store[p1.node.storeAs] else nil
		
		return ReactModule.createElement(if FFlagAbuseReportMenuV2 then ListNodeV2Module else ListNodeModule, DashModule.join(p1.node, {
			initialValue = if type(StoreEntry) == "table" then StoreEntry.id else nil,
			isSubmitting = p1.isSubmitting,
			onNext = function(_, p2)
				-- upvalues: p1 (copy)
				if p1.onNext then
					p1.onNext({
						store = if p1.node.storeAs then { [p1.node.storeAs] = p2 } else {}
					})
				end
			end
		}))
	elseif p1.node.type == "comment" then
		return ReactModule.createElement(CommentNodeModule, DashModule.join(p1.node, {
			initialValue = if p1.store then p1.store[p1.node.storeAs] else nil,
			isSubmitting = p1.isSubmitting,
			onNext = function(p2)
				-- upvalues: p1 (copy)
				if p1.onNext then
					p1.onNext({
						store = if p1.node.storeAs then { [p1.node.storeAs] = p2 } else {}
					})
				end
			end
		}))
	elseif p1.node.type == "confirmation" then
		return ReactModule.createElement(ConfirmationNodeModule, DashModule.join(p1.node, {
			isSubmitting = if FFlagSupportSubmissionOnAllReportNodes then p1.isSubmitting else nil,
			onNext = p1.onNext and function()
				-- upvalues: p1 (copy)
				p1.onNext({})
			end or nil
		}))
	elseif p1.node.type == "paragraph" then
		return ReactModule.createElement(ParagraphNodeModule, DashModule.join(p1.node, {
			isSubmitting = if FFlagSupportSubmissionOnAllReportNodes then p1.isSubmitting else nil,
			onNext = p1.onNext and function()
				-- upvalues: p1 (copy)
				p1.onNext({})
			end or nil
		}))
	elseif FFlagAbuseReportMenuV2 and p1.node.type == "review" then
		return ReactModule.createElement(ReviewNodeModule, DashModule.join(p1.node, {
			isSubmitting = if FFlagSupportSubmissionOnAllReportNodes then p1.isSubmitting else nil,
			onNext = p1.onNext and function()
				-- upvalues: p1 (copy)
				p1.onNext({})
			end or nil
		}))
	elseif FFlagAbuseReportMenuV2 and p1.node.type == "inExpChatSelection" then
		local StoreEntry = if p1.store then p1.store[p1.node.storeAs] else nil
		
		return ReactModule.createElement(require(GenericAbuseReporting.BeduiV2.Components.Nodes.InExpChatSelectionNode), DashModule.join(p1.node, {
			initialValue = if type(StoreEntry) == "table" then StoreEntry.id else nil,
			isSubmitting = p1.isSubmitting,
			goBack = p1.goBack,
			onNext = function(_, p2)
				-- upvalues: p1 (copy)
				if p1.onNext then
					p1.onNext({
						store = if p1.node.storeAs then { [p1.node.storeAs] = p2 } else {}
					})
				end
			end
		}))
	elseif FFlagAbuseReportMenuV2 and p1.node.type == "inExpConfirmation" then
		return ReactModule.createElement(require(GenericAbuseReporting.BeduiV2.Components.Nodes.InExpConfirmationNode), DashModule.join(p1.node, {
			isSubmitting = p1.isSubmitting,
			onNext = p1.onNext and function(p2)
				-- upvalues: p1 (copy)
				p1.onNext({
					store = if p1.node.storeAs then {
						[p1.node.storeAs.didBlockUser] = p2.didBlockUser,
						[p1.node.storeAs.didMuteUser] = p2.didMuteUser
					} else {}
				})
			end or nil
		}))
	elseif FFlagAbuseReportMenuV2 and p1.node.type == "inExpSceneSelection" then
		return ReactModule.createElement(require(GenericAbuseReporting.BeduiV2.Components.Nodes.InExpSceneSelectionNode), DashModule.join(p1.node, {
			onNext = if p1.onNext then function()
				-- upvalues: p1 (copy)
				p1.onNext({})
			end else nil,
			goBack = p1.goBack
		}))
	else
		SendEventFunction({
			sub_event_type = TelemetryEventType.Error,
			error_detail = { error_message = `Unknown node type: {p1.node.type}` }
		})
		
		return ReactModule.createElement(ReactModule.Fragment)
	end
end)