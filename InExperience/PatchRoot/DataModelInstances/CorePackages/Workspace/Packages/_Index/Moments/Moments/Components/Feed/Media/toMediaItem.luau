local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local httpService = game:GetService("HttpService")
local foundationModule = require(parent.Foundation)
local _ = require(parent.MomentsCommon)
local _ = require(moments.Components.Feed.FeedTypes)
local getRbxThumb = foundationModule.Utility.getRbxThumb
local thumbnailType = foundationModule.Enums.ThumbnailType

local function _(p1, p2, p3)
	local var1 = `rbxassetid://{p1}`
	
	return if p2 == Enum.CaptureType.Video and p3 ~= nil then `{var1}&accessContext={p3}&permissionContext=ignoreUniverse` else var1
end

return function(p1)
	-- upvalues: httpService (ref), getRbxThumb (ref), thumbnailType (ref)
	if p1.kind ~= "moment" then
		return nil
	end
	local moment = p1.moment
	
	if moment == nil or moment.metadata == nil then
		return nil
	end
	local assetId = moment.assetId
	local assetAccessContext = moment.metadata.assetAccessContext
	local var1 = if assetAccessContext == nil or assetAccessContext == "" then nil else httpService:UrlEncode(assetAccessContext)
	local var2 = if assetId > 0 then Content.fromUri(if var1 ~= nil then getRbxThumb(thumbnailType.Asset, assetId) else `{getRbxThumb(thumbnailType.Asset, assetId)}&accessContext={var1}`) else nil
	local t = { momentId = moment.momentId }
	local var3 = `rbxassetid://{assetId}`
	t.content = Content.fromUri(if moment.metadata.captureType == Enum.CaptureType.Video and var1 ~= nil then `{var3}&accessContext={var1}&permissionContext=ignoreUniverse` else var3)
	t.posterContent = var2
	t.captureType = moment.metadata.captureType
	t.edits = moment.metadata.edits
	
	return t
end