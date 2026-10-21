local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local Default = require(Parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local Analytics = require(Parent.MomentsCommon).Analytics
local EventNames = Analytics.EventNames
local MakeFeedActionFieldsModule = require(Moments.Analytics.makeFeedActionFields)
local FetchShareLinkModule = require(script.Parent.fetchShareLink)
local GetShareCountsStoreModule = require(Moments.Stores.GetShareCountsStore)
local GetToastStoreModule = require(Moments.Stores.GetToastStore)
local ReadAppPolicyModule = require(script.Parent.readAppPolicy)

return function(p1)
	-- upvalues: GetToastStoreModule (copy), FetchShareLinkModule (copy), ReadAppPolicyModule (copy), Default (copy), GetShareCountsStoreModule (copy), MakeFeedActionFieldsModule (copy), Analytics (copy), EventNames (copy)
	local MomentId = p1.momentId
	local Strings = p1.strings
	task.spawn(function()
		-- upvalues: GetToastStoreModule (upval), Strings (copy), p1 (copy), FetchShareLinkModule (upval), MomentId (copy), ReadAppPolicyModule (upval), Default (upval), GetShareCountsStoreModule (upval), MakeFeedActionFieldsModule (upval), Analytics (upval), EventNames (upval)
		local function _()
			-- upvalues: GetToastStoreModule (upval), Strings (upval)
			GetToastStoreModule(false).triggerToast({ text = "", title = Strings.linkCopyFailed })
		end
		
		if p1.feedItemId == nil or p1.feedItemId == "" then
			GetToastStoreModule(false).triggerToast({ text = "", title = Strings.linkCopyFailed })
			
			return
		end
		local Success, Result = pcall(FetchShareLinkModule, {
			momentId = MomentId,
			feedItemId = p1.feedItemId,
			description = p1.description,
			title = Strings.linkPreviewTitle
		})
		
		if not Success or not Result then
			GetToastStoreModule(false).triggerToast({ text = "", title = Strings.linkCopyFailed })
			
			return
		end
		if not pcall(function()
			-- upvalues: ReadAppPolicyModule (upval), Default (upval), Result (copy)
			local AppPolicyModule = ReadAppPolicyModule()
			
			if AppPolicyModule and AppPolicyModule.EnableShareCaptureCTA and AppPolicyModule.EligibleForCapturesFeature or false then
				Default:shareUrl({ context = "MomentsFeed", url = Result })
				
				return
			else
				Default:setClipboardText({ context = "MomentsFeed", text = Result })
			end
		end) then
			GetToastStoreModule(false).triggerToast({ text = "", title = Strings.linkCopyFailed })
			
			return
		end
		GetShareCountsStoreModule(false).markShared(MomentId)
		
		if p1.logAction then
			p1.logAction({})
		end
		local Share = MakeFeedActionFieldsModule(MomentId, p1.feedItemId, p1.feedSessionId, "share")
		
		if Share then
			Analytics.fireAnalyticsEvent(EventNames.FeedShareButtonPressed, Share)
		end
		GetToastStoreModule(false).triggerToast({ text = "", title = Strings.linkCopied })
	end)
end