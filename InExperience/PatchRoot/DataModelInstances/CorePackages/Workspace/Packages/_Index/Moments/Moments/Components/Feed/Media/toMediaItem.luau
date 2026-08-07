local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local httpService = game:GetService("HttpService")
local foundationModule = require(parent.Foundation)
local _ = require(parent.MomentsCommon)
local _ = require(moments.Components.Feed.FeedTypes)
local getRbxThumb = foundationModule.Utility.getRbxThumb
local thumbnailType = foundationModule.Enums.ThumbnailType

local function _(p0, p1, p2) --[[ line: 35 | named "getMediaContentUri" ]]
	local var3 = `rbxassetid://{p0}`
	
	return if p1 == Enum.CaptureType.Video and p2 ~= nil then `{var3}&accessContext={p2}&permissionContext=ignoreUniverse` else var3
end

return function(p3) --[[ line: 44 | named "toMediaItem" ]]
	-- upvalues: httpService (ref), getRbxThumb (ref), thumbnailType (ref)
	if p3.kind ~= "moment" then
		return nil
	end
	local moment = p3.moment
	
	if moment == nil or moment.metadata == nil then
		return nil
	end
	local assetId = moment.assetId
	local assetAccessContext = moment.metadata.assetAccessContext
	local var4 = if assetAccessContext == nil or assetAccessContext == "" then nil else httpService:UrlEncode(assetAccessContext)
	local var5 = if assetId > 0 then Content.fromUri(if var4 ~= nil then getRbxThumb(thumbnailType.Asset, assetId) else `{getRbxThumb(thumbnailType.Asset, assetId)}&accessContext={var4}`) else nil
	local t = { momentId = moment.momentId }
	local var7 = `rbxassetid://{assetId}`
	t.content = Content.fromUri(if moment.metadata.captureType == Enum.CaptureType.Video and var4 ~= nil then `{var7}&accessContext={var4}&permissionContext=ignoreUniverse` else var7)
	t.posterContent = var5
	t.captureType = moment.metadata.captureType
	t.edits = moment.metadata.edits
	
	return t
end