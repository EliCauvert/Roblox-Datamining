local FriendsActivityFeed = script:FindFirstAncestor("FriendsActivityFeed")
local Parent = FriendsActivityFeed.Parent
local _ = require(Parent.ActivityTile)
local FoundationModule = require(Parent.Foundation)
local _ = require(FriendsActivityFeed.Common.ActivityFeedTypes)
local ResolveActorNameModule = require(FriendsActivityFeed.Common.resolveActorName)
local UseBadgeNameModule = require(FriendsActivityFeed.Hooks.useBadgeName)
local UseExperienceNameModule = require(FriendsActivityFeed.Hooks.useExperienceName)
local GetRbxThumbFunction = FoundationModule.Utility.getRbxThumb
local ThumbnailType = FoundationModule.Enums.ThumbnailType

return function(p1)
	-- upvalues: ResolveActorNameModule (copy), UseBadgeNameModule (copy), UseExperienceNameModule (copy), GetRbxThumbFunction (copy), ThumbnailType (copy)
	local Item = p1.item
	local ResolveActorNameModuleResult = ResolveActorNameModule(Item.actors[1]) or ""
	local AssetId = if Item.assetIds[1] == nil or Item.assetIds[1] == 0 then nil else Item.assetIds[1]
	local UseBadgeNameModuleResult = UseBadgeNameModule(AssetId)
	local Count = if Item.count > 0 then Item.count else #Item.assetIds
	local EarnedName: string = if Count > 1 then `{ResolveActorNameModuleResult} earned {Count} badges` elseif UseBadgeNameModuleResult == nil then `{ResolveActorNameModuleResult} earned a new badge` else `{ResolveActorNameModuleResult} achieved {UseBadgeNameModuleResult}`
	local UseExperienceNameModuleResult = UseExperienceNameModule(Item.experienceId)
	
	if p1.timestampText ~= nil then
		if UseExperienceNameModuleResult == nil then
			UseExperienceNameModuleResult = p1.timestampText
		else
			UseExperienceNameModuleResult = `{UseExperienceNameModuleResult} • {p1.timestampText}`
		end
	end
	return {
		thumbnail = if AssetId == nil then nil else GetRbxThumbFunction(ThumbnailType.BadgeIcon, AssetId),
		title = EarnedName,
		subtitle = UseExperienceNameModuleResult,
		isUnread = p1.isUnread,
		onActivated = p1.onActivated,
		layoutOrder = p1.layoutOrder
	}
end