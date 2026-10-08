local httpService = game:GetService("HttpService")
local momentsCommonModule = require(script:FindFirstAncestor("Moments").Parent.MomentsCommon)
local eventNames = momentsCommonModule.Analytics.EventNames
local reportMomentsComments = momentsCommonModule.Analytics.reportMomentsComments
local reportMomentsCommentAction = momentsCommonModule.Analytics.reportMomentsCommentAction

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: momentsCommonModule (ref), httpService (ref), reportMomentsComments (ref), reportMomentsCommentAction (ref), eventNames (ref)
	p4 = p4 or momentsCommonModule.Analytics.fireAnalyticsEvent
	p5 = p5 or httpService:GenerateGUID(false)
	local var1 = false
	local var2 = false
	local var3 = false
	
	local function logEvent(p8, p9)
		-- upvalues: var3 (write), p3 (ref), p1 (ref), p2 (ref), p5 (ref), p4 (ref), reportMomentsComments (copy), p6 (ref)
		if var3 or not p3() then
			return
		end
		local cloned = table.clone(p9 or {})
		cloned.feedItemId = p1
		cloned.surface = p2
		cloned.commentPanelSessionId = p5
		p4(p8, cloned)
		reportMomentsComments(p8, cloned, p6)
	end
	
	return {
		open = function()
			-- upvalues: var2 (write), logEvent (ref), eventNames (copy), p7 (ref)
			if not var2 then
				var2 = true
				logEvent(eventNames.MomentCommentsPanelOpened, if p7 then p7() else nil)
			end
		end,
		startView = function()
			-- upvalues: var3 (write), var1 (write)
			if not var3 then
				var1 = true
			end
		end,
		finishView = function(p8)
			-- upvalues: var1 (write), logEvent (ref), eventNames (copy)
			if var1 then
				var1 = false
				logEvent(eventNames.MomentCommentsPanelClosed, { closeReason = p8 })
			end
		end,
		cancel = function()
			-- upvalues: var3 (write), var1 (write)
			var3 = true
			var1 = false
		end,
		logEvent = logEvent,
		logRealtimeEvent = function(p8, p9)
			-- upvalues: var3 (write), p3 (ref), p2 (ref), reportMomentsCommentAction (copy), p6 (ref)
			if var3 or not p3() then
				return
			end
			local cloned = table.clone(p9)
			cloned.surface = p2
			reportMomentsCommentAction(p8, cloned, p6)
		end
	}
end