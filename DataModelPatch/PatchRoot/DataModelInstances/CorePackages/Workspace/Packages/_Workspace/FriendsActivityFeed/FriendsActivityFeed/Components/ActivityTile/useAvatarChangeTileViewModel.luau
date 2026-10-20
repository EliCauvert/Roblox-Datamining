local FriendsActivityFeed = script:FindFirstAncestor("FriendsActivityFeed")
local Parent = FriendsActivityFeed.Parent
local _ = require(Parent.ActivityTile)
local FoundationModule = require(Parent.Foundation)
local _ = require(FriendsActivityFeed.Common.ActivityFeedTypes)
local ResolveActorNameModule = require(FriendsActivityFeed.Common.resolveActorName)
local UseItemNameModule = require(FriendsActivityFeed.Hooks.useItemName)
local GetRbxThumbFunction = FoundationModule.Utility.getRbxThumb
local ThumbnailType = FoundationModule.Enums.ThumbnailType

return function(p1)
	-- upvalues: ResolveActorNameModule (copy), UseItemNameModule (copy), GetRbxThumbFunction (copy), ThumbnailType (copy)
	local Item = p1.item
	local Actor = Item.actors[1]
	local ResolveActorNameModuleResult = ResolveActorNameModule(Actor) or ""
	local UserId = if Actor == nil then nil else Actor.userId
	local UseItemNameModuleResult = UseItemNameModule(Item.assetIds[1])
	local Count = if Item.count > 0 then Item.count else #Item.assetIds
	local Message: string = `{ResolveActorNameModuleResult} has a new avatar`
	local MoreName = nil
	
	if UseItemNameModuleResult ~= nil then
		local Largest = math.max(0, Count - 1)
		MoreName = if Largest > 0 then `{UseItemNameModuleResult} + {Largest} more` else UseItemNameModuleResult
	end
	local TimestampText = MoreName
	
	if p1.timestampText ~= nil then
		if TimestampText == nil then
			TimestampText = p1.timestampText
		else
			TimestampText = `{TimestampText} • {p1.timestampText}`
		end
	end
	return {
		thumbnail = if UserId == nil then nil else GetRbxThumbFunction(ThumbnailType.Avatar, UserId),
		title = Message,
		subtitle = TimestampText,
		isUnread = p1.isUnread,
		onActivated = p1.onActivated,
		layoutOrder = p1.layoutOrder
	}
end