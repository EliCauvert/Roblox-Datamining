local AppChat = script:FindFirstAncestor("AppChat")
local HttpService = game:GetService("HttpService")
local FoundationModule = require(AppChat.Parent.Foundation)
local GetRbxThumbFunction = FoundationModule.Utility.getRbxThumb
local ThumbnailType = FoundationModule.Enums.ThumbnailType

local function _(p1, CaptureType, p2): string --[[ Line: 23 | Named "getMediaContentUri" ]]
	-- upvalues: AppChat (copy)
	local AssetId: string = `rbxassetid://{p1}`
	
	return if CaptureType == Enum.CaptureType.Video and p2 ~= nil then if require(AppChat.Flags.FFlagAppChatMomentShareCardPermissionContextFix) and game.GameId == 0 then `{AssetId}&accessContext={p2}` else `{AssetId}&accessContext={p2}&permissionContext=ignoreUniverse` else AssetId
end

return function(p1) --[[ Line: 38 | Named "buildMomentShareCardMedia" ]]
	-- upvalues: HttpService (copy), GetRbxThumbFunction (copy), ThumbnailType (copy), AppChat (copy)
	local AssetId: number = p1.assetId
	local CaptureType = p1.captureType
	
	if AssetId == nil or CaptureType == nil then
		return nil
	else
		local AssetAccessContext = p1.assetAccessContext
		local v1 = if AssetAccessContext == nil or AssetAccessContext == "" then nil else HttpService:UrlEncode(AssetAccessContext)
		local AssetId1: string = `rbxassetid://{AssetId}`
		
		return {
			content = Content.fromUri(if CaptureType == Enum.CaptureType.Video and v1 ~= nil then if require(AppChat.Flags.FFlagAppChatMomentShareCardPermissionContextFix) and game.GameId == 0 then `{AssetId1}&accessContext={v1}` else `{AssetId1}&accessContext={v1}&permissionContext=ignoreUniverse` else AssetId1),
			posterContent = if AssetId > 0 then Content.fromUri(if v1 == nil then GetRbxThumbFunction(ThumbnailType.Asset, AssetId) else `{GetRbxThumbFunction(ThumbnailType.Asset, AssetId)}&accessContext={v1}`) else nil,
			captureType = CaptureType
		}
	end
end