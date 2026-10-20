local FriendsActivityFeed = script:FindFirstAncestor("FriendsActivityFeed")
local Parent = FriendsActivityFeed.Parent
local _ = require(Parent.ActivityTile)
local FoundationModule = require(Parent.Foundation)
local _ = require(FriendsActivityFeed.Common.ActivityFeedTypes)
local FormatActorNamesModule = require(FriendsActivityFeed.Common.formatActorNames)
local ResolveActorNameModule = require(FriendsActivityFeed.Common.resolveActorName)
local UseExperienceNameModule = require(FriendsActivityFeed.Hooks.useExperienceName)
local GetRbxThumbFunction = FoundationModule.Utility.getRbxThumb
local ThumbnailType = FoundationModule.Enums.ThumbnailType

return function(p1)
	-- upvalues: UseExperienceNameModule (copy), ResolveActorNameModule (copy), FormatActorNamesModule (copy), GetRbxThumbFunction (copy), ThumbnailType (copy)
	local Item = p1.item
	local ExperienceId = if Item.experienceId == nil or Item.experienceId == 0 then nil else Item.experienceId
	local UseExperienceNameModuleResult = UseExperienceNameModule(ExperienceId)
	local List = {}
	
	for _, actor in Item.actors do
		local ResolveActorNameModuleResult = ResolveActorNameModule(actor)
		
		if ResolveActorNameModuleResult ~= nil then
			table.insert(List, ResolveActorNameModuleResult)
		end
	end
	local PlayingName: string = `{FormatActorNamesModule(List, Item.count)} {if Item.count <= 1 then "is" else "are"} playing`
	local TimestampText = UseExperienceNameModuleResult
	
	if p1.timestampText ~= nil then
		if TimestampText == nil then
			TimestampText = p1.timestampText
		else
			TimestampText = `{TimestampText} • {p1.timestampText}`
		end
	end
	return {
		thumbnail = if ExperienceId == nil then nil else GetRbxThumbFunction(ThumbnailType.GameIcon, ExperienceId),
		title = PlayingName,
		subtitle = TimestampText,
		isUnread = p1.isUnread,
		onActivated = p1.onActivated,
		layoutOrder = p1.layoutOrder
	}
end