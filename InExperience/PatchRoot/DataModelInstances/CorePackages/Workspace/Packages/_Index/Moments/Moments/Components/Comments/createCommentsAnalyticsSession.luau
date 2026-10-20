local HttpService = game:GetService("HttpService")
local MomentsCommonModule = require(script:FindFirstAncestor("Moments").Parent.MomentsCommon)
local EventNames = MomentsCommonModule.Analytics.EventNames
local ReportMomentsCommentsFunction = MomentsCommonModule.Analytics.reportMomentsComments
local ReportMomentsCommentActionFunction = MomentsCommonModule.Analytics.reportMomentsCommentAction

return function(FeedItemId, Surface, Callback, p1, p2, p3, Callback2)
	-- upvalues: MomentsCommonModule (copy), HttpService (copy), ReportMomentsCommentsFunction (copy), ReportMomentsCommentActionFunction (copy), EventNames (copy)
	local Callback1 = p1 or MomentsCommonModule.Analytics.fireAnalyticsEvent
	local P3 = p2 or HttpService:GenerateGUID(false)
	local Flag = false
	local Flag1 = false
	local Flag2 = false
	
	local function logEvent(MomentCommentsPanelClosed, p4)
		-- upvalues: Flag2 (ref), Callback (copy), FeedItemId (copy), Surface (copy), P3 (copy), Callback1 (copy), ReportMomentsCommentsFunction (upval), p3 (copy)
		if not Flag2 and Callback() then
			local Copy = table.clone(p4 or {})
			Copy.feedItemId = FeedItemId
			Copy.surface = Surface
			Copy.commentPanelSessionId = P3
			Callback1(MomentCommentsPanelClosed, Copy)
			ReportMomentsCommentsFunction(MomentCommentsPanelClosed, Copy, p3)
			
			return
		end
	end
	
	return {
		open = function()
			-- upvalues: Flag1 (ref), logEvent (copy), EventNames (upval), Callback2 (copy)
			if not Flag1 then
				Flag1 = true
				logEvent(EventNames.MomentCommentsPanelOpened, if Callback2 then Callback2() else nil)
			end
		end,
		startView = function()
			-- upvalues: Flag2 (ref), Flag (ref)
			if not Flag2 then
				Flag = true
			end
		end,
		finishView = function(CloseReason)
			-- upvalues: Flag (ref), logEvent (copy), EventNames (upval)
			if Flag then
				Flag = false
				logEvent(EventNames.MomentCommentsPanelClosed, { closeReason = CloseReason })
			end
		end,
		cancel = function()
			-- upvalues: Flag2 (ref), Flag (ref)
			Flag2 = true
			Flag = false
		end,
		logEvent = logEvent,
		logRealtimeEvent = function(p4, Tbl)
			-- upvalues: Flag2 (ref), Callback (copy), Surface (copy), ReportMomentsCommentActionFunction (upval), p3 (copy)
			if not Flag2 and Callback() then
				local Copy = table.clone(Tbl)
				Copy.surface = Surface
				ReportMomentsCommentActionFunction(p4, Copy, p3)
				
				return
			end
		end
	}
end