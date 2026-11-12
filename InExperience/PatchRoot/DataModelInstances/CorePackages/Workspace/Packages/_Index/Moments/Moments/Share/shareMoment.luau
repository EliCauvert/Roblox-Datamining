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
local FFlagMomentsLinkCopiedOnlyWhenCopiedModule = require(Moments.Flags.FFlagMomentsLinkCopiedOnlyWhenCopied)

return function(p1)
	-- upvalues: GetToastStoreModule (copy), FetchShareLinkModule (copy), FFlagMomentsLinkCopiedOnlyWhenCopiedModule (copy), ReadAppPolicyModule (copy), Default (copy), GetShareCountsStoreModule (copy), MakeFeedActionFieldsModule (copy), Analytics (copy), EventNames (copy)
	local MomentId = p1.momentId
	local Strings = p1.strings
	task.spawn(function()
		-- upvalues: GetToastStoreModule (upval), Strings (copy), p1 (copy), FetchShareLinkModule (upval), MomentId (copy), FFlagMomentsLinkCopiedOnlyWhenCopiedModule (upval), ReadAppPolicyModule (upval), Default (upval), GetShareCountsStoreModule (upval), MakeFeedActionFieldsModule (upval), Analytics (upval), EventNames (upval)
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
		local Flag = not FFlagMomentsLinkCopiedOnlyWhenCopiedModule and nil
		
		if not pcall(function()
			-- upvalues: ReadAppPolicyModule (upval), Default (upval), Result (copy), FFlagMomentsLinkCopiedOnlyWhenCopiedModule (upval), Flag (ref)
			local AppPolicyModule = ReadAppPolicyModule()
			
			if AppPolicyModule and AppPolicyModule.EnableShareCaptureCTA and AppPolicyModule.EligibleForCapturesFeature or false then
				Default:shareUrl({ context = "MomentsFeed", url = Result })
				
				return
			end
			Default:setClipboardText({ context = "MomentsFeed", text = Result })
			
			if FFlagMomentsLinkCopiedOnlyWhenCopiedModule then
				Flag = true
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
		if not FFlagMomentsLinkCopiedOnlyWhenCopiedModule or Flag then
			GetToastStoreModule(false).triggerToast({ text = "", title = Strings.linkCopied })
		end
	end)
end