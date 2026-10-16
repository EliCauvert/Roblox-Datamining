local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local _ = require(script.Parent.AbuseSheetFlowTypes)
local CommentNodeModule = require(GenericAbuseReporting.BeduiV2.Components.Nodes.CommentNode)
local ConfirmationNodeModule = require(GenericAbuseReporting.BeduiV2.Components.Nodes.ConfirmationNode)
local ListNodeV2Module = require(GenericAbuseReporting.BeduiV2.Components.Nodes.ListNodeV2)
local ParagraphNodeModule = require(GenericAbuseReporting.BeduiV2.Components.Nodes.ParagraphNode)
local ReviewNodeModule = require(GenericAbuseReporting.BeduiV2.Components.Nodes.ReviewNode)
local TelemetryEventType = require(GenericAbuseReporting.BeduiV2.Analytics.analyticsService).TelemetryEventType
local UseAbuseReportAnalyticsFunction = require(GenericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext).useAbuseReportAnalytics
local FFlagSupportSubmissionOnAllReportNodes = require(Parent.SharedFlags).FFlagSupportSubmissionOnAllReportNodes
local FFlagAbuseReportInExpPlayerListV3 = require(Parent.SharedFlags).FFlagAbuseReportInExpPlayerListV3
local FFlagAbuseReportImproveErrorEventsModule = require(GenericAbuseReporting.Flags.FFlagAbuseReportImproveErrorEvents)

return ReactModule.memo(function(p1) --[[ Line: 44 | Named "ContentNode" ]]
	-- upvalues: UseAbuseReportAnalyticsFunction (copy), ReactModule (copy), ListNodeV2Module (copy), DashModule (copy), CommentNodeModule (copy), ConfirmationNodeModule (copy), FFlagSupportSubmissionOnAllReportNodes (copy), ParagraphNodeModule (copy), ReviewNodeModule (copy), GenericAbuseReporting (copy), FFlagAbuseReportInExpPlayerListV3 (copy), TelemetryEventType (copy), FFlagAbuseReportImproveErrorEventsModule (copy)
	local SendEventFunction: (any) -> () = UseAbuseReportAnalyticsFunction().sendEvent
	
	if p1.node.type == "list" then
		local StoreEntry = if p1.store then p1.store[p1.node.storeAs] else nil
		
		return ReactModule.createElement(ListNodeV2Module, DashModule.join(p1.node, {
			initialValue = if type(StoreEntry) == "table" then StoreEntry.id else nil,
			isSubmitting = p1.isSubmitting,
			onNext = function(_, p2) --[[ Line: 55 ]]
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
			onNext = function(p2) --[[ Line: 73 ]]
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
			onNext = p1.onNext and function() --[[ Line: 87 ]]
				-- upvalues: p1 (copy)
				p1.onNext({})
			end or nil
		}))
	elseif p1.node.type == "paragraph" then
		return ReactModule.createElement(ParagraphNodeModule, DashModule.join(p1.node, {
			isSubmitting = if FFlagSupportSubmissionOnAllReportNodes then p1.isSubmitting else nil,
			onNext = p1.onNext and function() --[[ Line: 97 ]]
				-- upvalues: p1 (copy)
				p1.onNext({})
			end or nil
		}))
	elseif p1.node.type == "review" then
		return ReactModule.createElement(ReviewNodeModule, DashModule.join(p1.node, {
			isSubmitting = if FFlagSupportSubmissionOnAllReportNodes then p1.isSubmitting else nil,
			onNext = p1.onNext and function() --[[ Line: 107 ]]
				-- upvalues: p1 (copy)
				p1.onNext({})
			end or nil
		}))
	elseif p1.node.type == "inExpChatSelection" then
		local StoreEntry = if p1.store then p1.store[p1.node.storeAs] else nil
		
		return ReactModule.createElement(require(GenericAbuseReporting.BeduiV2.Components.Nodes.InExpChatSelectionNode), DashModule.join(p1.node, {
			initialValue = if type(StoreEntry) == "table" then StoreEntry.id else nil,
			isSubmitting = p1.isSubmitting,
			goBack = p1.goBack,
			onNext = function(_, p2) --[[ Line: 122 ]]
				-- upvalues: p1 (copy)
				if p1.onNext then
					p1.onNext({
						store = if p1.node.storeAs then { [p1.node.storeAs] = p2 } else {}
					})
				end
			end
		}))
	elseif p1.node.type == "inExpConfirmation" then
		return ReactModule.createElement(require(GenericAbuseReporting.BeduiV2.Components.Nodes.InExpConfirmationNode), DashModule.join(p1.node, {
			isSubmitting = p1.isSubmitting,
			onNext = p1.onNext and function(p2) --[[ Line: 139 ]]
				-- upvalues: p1 (copy)
				p1.onNext({
					store = if p1.node.storeAs then {
						[p1.node.storeAs.didBlockUser] = p2.didBlockUser,
						[p1.node.storeAs.didMuteUser] = p2.didMuteUser
					} else {}
				})
			end or nil
		}))
	elseif p1.node.type == "inExpSceneSelection" then
		return ReactModule.createElement(require(GenericAbuseReporting.BeduiV2.Components.Nodes.InExpSceneSelectionNode), DashModule.join(p1.node, {
			onNext = if p1.onNext then function() --[[ Line: 157 ]]
				-- upvalues: p1 (copy)
				p1.onNext({})
			end else nil,
			onFailure = p1.onFailure,
			goBack = p1.goBack,
			onExternalSubmit = p1.onExternalSubmit
		}))
	elseif FFlagAbuseReportInExpPlayerListV3 and p1.node.type == "inExpUserSelection" then
		local StoreEntry = if p1.store then p1.store[p1.node.storeAs] else nil
		
		return ReactModule.createElement(require(GenericAbuseReporting.BeduiV2.Components.Nodes.InExpUserSelectionNode), DashModule.join(p1.node, {
			initialValue = if type(StoreEntry) == "table" then StoreEntry.id else nil,
			isSubmitting = p1.isSubmitting,
			onNext = if p1.onNext then function(_, p2) --[[ Line: 176 ]]
				-- upvalues: p1 (copy)
				if p1.onNext then
					p1.onNext({
						store = if p1.node.storeAs then { [p1.node.storeAs] = p2 } else {}
					})
				end
			end else nil,
			goBack = p1.goBack
		}))
	else
		SendEventFunction({
			sub_event_type = TelemetryEventType.Error,
			error_detail = if FFlagAbuseReportImproveErrorEventsModule then {
				error_message = "Unknown node type",
				error_metadata = { node_type = tostring(p1.node.type) }
			} else { error_message = `Unknown node type: {p1.node.type}` }
		})
		
		return ReactModule.createElement(ReactModule.Fragment)
	end
end)