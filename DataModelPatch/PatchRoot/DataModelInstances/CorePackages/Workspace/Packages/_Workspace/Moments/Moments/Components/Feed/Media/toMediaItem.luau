local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local HttpService = game:GetService("HttpService")
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.MomentsCommon)
local _ = require(Moments.Components.Feed.FeedTypes)
local GetRbxThumbFunction = FoundationModule.Utility.getRbxThumb
local ThumbnailType = FoundationModule.Enums.ThumbnailType

local function _(p1, CaptureType, p2): string
	local AssetId: string = `rbxassetid://{p1}`
	
	return if CaptureType == Enum.CaptureType.Video and p2 ~= nil then `{AssetId}&accessContext={p2}&permissionContext=ignoreUniverse` else AssetId
end

return function(p1)
	-- upvalues: HttpService (copy), GetRbxThumbFunction (copy), ThumbnailType (copy)
	if p1.kind ~= "moment" then
		return nil
	end
	local Moment = p1.moment
	
	if Moment == nil or Moment.metadata == nil then
		return nil
	else
		local AssetId: number = Moment.assetId
		local AssetAccessContext = Moment.metadata.assetAccessContext
		local v1 = if AssetAccessContext == nil or AssetAccessContext == "" then nil else HttpService:UrlEncode(AssetAccessContext)
		local AssetId1: string = `rbxassetid://{AssetId}`
		
		return {
			momentId = Moment.momentId,
			content = Content.fromUri(if Moment.metadata.captureType == Enum.CaptureType.Video and v1 ~= nil then `{AssetId1}&accessContext={v1}&permissionContext=ignoreUniverse` else AssetId1),
			posterContent = if AssetId > 0 then Content.fromUri(if v1 == nil then GetRbxThumbFunction(ThumbnailType.Asset, AssetId) else `{GetRbxThumbFunction(ThumbnailType.Asset, AssetId)}&accessContext={v1}`) else nil,
			captureType = Moment.metadata.captureType,
			edits = Moment.metadata.edits
		}
	end
end