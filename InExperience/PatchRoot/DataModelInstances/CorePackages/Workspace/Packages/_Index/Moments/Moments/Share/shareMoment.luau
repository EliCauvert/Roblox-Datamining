local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local momentsCommonModule = require(parent.MomentsCommon)
local sharedFlagsModule = require(parent.SharedFlags)
local default = require(parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local analytics = momentsCommonModule.Analytics
local eventNames = analytics.EventNames
local fFlagMomentsCopyShareLinkWhenShareSheetUnavailableModule = require(moments.Flags.FFlagMomentsCopyShareLinkWhenShareSheetUnavailable)
local fFlagMomentsPassFeedItemIdToBackendApis = sharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis
local makeFeedActionFieldsModule = require(moments.Analytics.makeFeedActionFields)
local fetchShareLinkModule = require(script.Parent.fetchShareLink)
local getShareCountsStoreModule = require(moments.Stores.GetShareCountsStore)
local getToastStoreModule = require(moments.Stores.GetToastStore)
local readAppPolicyModule = require(script.Parent.readAppPolicy)

return function(p1)
	-- upvalues: getToastStoreModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), fetchShareLinkModule (ref), fFlagMomentsCopyShareLinkWhenShareSheetUnavailableModule (ref), readAppPolicyModule (ref), default (ref), getShareCountsStoreModule (ref), makeFeedActionFieldsModule (ref), analytics (ref), eventNames (ref)
	local momentId = p1.momentId
	local strings = p1.strings
	task.spawn(function()
		-- upvalues: getToastStoreModule (copy), strings (ref), fFlagMomentsPassFeedItemIdToBackendApis (copy), p1 (ref), fetchShareLinkModule (copy), momentId (ref), fFlagMomentsCopyShareLinkWhenShareSheetUnavailableModule (copy), readAppPolicyModule (copy), default (copy), getShareCountsStoreModule (copy), makeFeedActionFieldsModule (copy), analytics (copy), eventNames (copy)
		local function _()
			-- upvalues: getToastStoreModule (copy), strings (copy)
			getToastStoreModule(false).triggerToast({ text = "", title = strings.linkCopyFailed })
		end
		
		if fFlagMomentsPassFeedItemIdToBackendApis and (p1.feedItemId == nil or p1.feedItemId == "") then
			getToastStoreModule(false).triggerToast({ text = "", title = strings.linkCopyFailed })
			
			return
		end
		local ok, status = pcall(fetchShareLinkModule, {
			momentId = momentId,
			feedItemId = if fFlagMomentsPassFeedItemIdToBackendApis then p1.feedItemId else nil,
			description = p1.description,
			title = strings.linkPreviewTitle
		})
		
		if not ok or not status then
			getToastStoreModule(false).triggerToast({ text = "", title = strings.linkCopyFailed })
			
			return
		elseif not pcall(function()
			-- upvalues: fFlagMomentsCopyShareLinkWhenShareSheetUnavailableModule (copy), readAppPolicyModule (copy), default (copy), status (ref)
			if fFlagMomentsCopyShareLinkWhenShareSheetUnavailableModule then
				local eligibleForCapturesFeature
				local var1 = readAppPolicyModule()
				
				if var1 then
					eligibleForCapturesFeature = var1.EnableShareCaptureCTA and (var1.EligibleForCapturesFeature or false)
				end
				if eligibleForCapturesFeature then
					default:shareUrl({ context = "MomentsFeed", url = status })
					
					return
				else
					default:setClipboardText({ context = "MomentsFeed", text = status })
				end
			end
		end) then
			getToastStoreModule(false).triggerToast({ text = "", title = strings.linkCopyFailed })
			
			return
		end
		getShareCountsStoreModule(false).markShared(momentId)
		
		if p1.logAction then
			p1.logAction({})
		end
		local var1 = makeFeedActionFieldsModule(momentId, p1.feedItemId, p1.feedSessionId, "share")
		
		if var1 then
			analytics.fireAnalyticsEvent(eventNames.FeedShareButtonPressed, var1)
		end
		getToastStoreModule(false).triggerToast({ text = "", title = strings.linkCopied })
	end)
end