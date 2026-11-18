local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local MomentsTypesModule = require(Parent.MomentsTypes)
local RobloxAppEventsModule = require(Parent.RobloxAppEvents)
local GetDeepLinkStoreModule = require(Moments.Stores.GetDeepLinkStore)
local ShareLinkTargetIdType = MomentsTypesModule.Enums.ShareLinkTargetIdType

return function(p1)
	-- upvalues: GetDeepLinkStoreModule (copy), ShareLinkTargetIdType (copy), RobloxAppEventsModule (copy), AppPage (copy)
	local HasCommentId: boolean = if p1.kind == "comments" or p1.kind == "likes" then p1.commentId ~= nil else p1.kind == "rollup" and p1.category == "commenter" and p1.commentId ~= nil
	GetDeepLinkStoreModule().setDeepLinkedMoment(p1.feedItemId, ShareLinkTargetIdType.FeedItemId, if HasCommentId then { commentId = p1.commentId } else nil)
	RobloxAppEventsModule.ReloadPage:fire(AppPage.Moments)
end