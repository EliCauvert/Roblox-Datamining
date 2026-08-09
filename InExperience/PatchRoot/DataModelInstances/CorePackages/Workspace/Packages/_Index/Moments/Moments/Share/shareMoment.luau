local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local default = require(parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local analytics = require(parent.MomentsCommon).Analytics
local eventNames = analytics.EventNames
local fetchShareLinkModule = require(script.Parent.fetchShareLink)
local getShareCountsStoreModule = require(moments.Stores.GetShareCountsStore)
local getToastStoreModule = require(moments.Stores.GetToastStore)

return function(p0) --[[ line: 33 | named "shareMoment" ]]
	-- upvalues: getToastStoreModule (ref), fetchShareLinkModule (ref), default (ref), getShareCountsStoreModule (ref), analytics (ref), eventNames (ref)
	local momentId = p0.momentId
	local strings = p0.strings
	task.spawn(function() --[[ line: 37 ]]
		-- upvalues: getToastStoreModule (copy), strings (ref), fetchShareLinkModule (copy), momentId (ref), p0 (ref), default (copy), getShareCountsStoreModule (copy), analytics (copy), eventNames (copy)
		local function _() --[[ line: 38 | named "notifyFailure" ]]
			-- upvalues: getToastStoreModule (copy), strings (copy)
			getToastStoreModule(false).triggerToast({ text = "", title = strings.linkCopyFailed })
		end
		
		local ok, status = pcall(fetchShareLinkModule, {
			momentId = momentId,
			description = p0.description,
			title = strings.linkPreviewTitle
		})
		
		if not ok or not status then
			getToastStoreModule(false).triggerToast({ text = "", title = strings.linkCopyFailed })
			
			return
		elseif not pcall(function() --[[ line: 52 ]]
			-- upvalues: default (copy), status (ref)
			default:shareUrl({ context = "MomentsFeed", url = status })
		end) then
			getToastStoreModule(false).triggerToast({ text = "", title = strings.linkCopyFailed })
			
			return
		end
		getShareCountsStoreModule(false).markShared(momentId)
		
		if p0.logAction then
			p0.logAction({})
		end
		analytics.fireAnalyticsEvent(eventNames.FeedShareButtonPressed, { momentId = momentId })
		getToastStoreModule(false).triggerToast({ text = "", title = strings.linkCopied })
	end)
end