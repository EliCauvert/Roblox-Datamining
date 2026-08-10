local httpService = game:GetService("HttpService")
local foundationModule = require(script:FindFirstAncestor("AppChat").Parent.Foundation)
local getRbxThumb = foundationModule.Utility.getRbxThumb
local thumbnailType = foundationModule.Enums.ThumbnailType

local function _(p0, p1, p2) --[[ line: 23 | named "getMediaContentUri" ]]
	local var2 = `rbxassetid://{p0}`
	
	return if p1 == Enum.CaptureType.Video and p2 ~= nil then `{var2}&accessContext={p2}&permissionContext=ignoreUniverse` else var2
end

return function(p3) --[[ line: 31 | named "buildMomentShareCardMedia" ]]
	-- upvalues: httpService (ref), getRbxThumb (ref), thumbnailType (ref)
	local assetId = p3.assetId
	local captureType = p3.captureType
	
	if assetId == nil or captureType == nil then
		return nil
	end
	local assetAccessContext = p3.assetAccessContext
	local var3 = if assetAccessContext == nil or assetAccessContext == "" then nil else httpService:UrlEncode(assetAccessContext)
	local var4 = if assetId > 0 then Content.fromUri(if var3 ~= nil then getRbxThumb(thumbnailType.Asset, assetId) else `{getRbxThumb(thumbnailType.Asset, assetId)}&accessContext={var3}`) else nil
	local t = {}
	local var6 = `rbxassetid://{assetId}`
	t.content = Content.fromUri(if captureType == Enum.CaptureType.Video and var3 ~= nil then `{var6}&accessContext={var3}&permissionContext=ignoreUniverse` else var6)
	t.posterContent = var4
	t.captureType = captureType
	
	return t
end