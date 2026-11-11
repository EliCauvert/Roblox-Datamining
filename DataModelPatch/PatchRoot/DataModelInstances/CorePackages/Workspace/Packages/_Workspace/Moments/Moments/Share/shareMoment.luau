local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local MomentsCommonModule = require(Parent.MomentsCommon)
local Default = require(Parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local Analytics = MomentsCommonModule.Analytics
local EventNames = Analytics.EventNames
local MakeFeedActionFieldsModule = require(Moments.Analytics.makeFeedActionFields)
local FetchShareLinkModule = require(script.Parent.fetchShareLink)
local GetShareCountsStoreModule = require(Moments.Stores.GetShareCountsStore)
local GetToastStoreModule = require(Moments.Stores.GetToastStore)

return function(p1)
	-- upvalues: GetToastStoreModule (copy), FetchShareLinkModule (copy), Default (copy), GetShareCountsStoreModule (copy), MakeFeedActionFieldsModule (copy), MomentsCommonModule (copy), Analytics (copy), EventNames (copy)
	local MomentId = p1.momentId
	local Strings = p1.strings
	task.spawn(function()
		-- upvalues: GetToastStoreModule (upval), Strings (copy), FetchShareLinkModule (upval), MomentId (copy), p1 (copy), Default (upval), GetShareCountsStoreModule (upval), MakeFeedActionFieldsModule (upval), MomentsCommonModule (upval), Analytics (upval), EventNames (upval)
		local function _()
			-- upvalues: GetToastStoreModule (upval), Strings (upval)
			GetToastStoreModule(false).triggerToast({ text = "", title = Strings.linkCopyFailed })
		end
		
		local Success, Result = pcall(FetchShareLinkModule, {
			momentId = MomentId,
			description = p1.description,
			title = Strings.linkPreviewTitle
		})
		
		if not Success or not Result then
			GetToastStoreModule(false).triggerToast({ text = "", title = Strings.linkCopyFailed })
			
			return
		end
		if not pcall(function()
			-- upvalues: Default (upval), Result (copy)
			Default:shareUrl({ context = "MomentsFeed", url = Result })
		end) then
			GetToastStoreModule(false).triggerToast({ text = "", title = Strings.linkCopyFailed })
			
			return
		end
		GetShareCountsStoreModule(false).markShared(MomentId)
		
		if p1.logAction then
			p1.logAction({})
		end
		local FeedActionFieldsModule = MakeFeedActionFieldsModule(MomentId, p1.feedItemId, p1.feedSessionId, if MomentsCommonModule.Flags.GetFFlagMomentsAnalyticsSchemaIdentity() then "share" else nil)
		
		if FeedActionFieldsModule then
			Analytics.fireAnalyticsEvent(EventNames.FeedShareButtonPressed, FeedActionFieldsModule)
		end
		GetToastStoreModule(false).triggerToast({ text = "", title = Strings.linkCopied })
	end)
end