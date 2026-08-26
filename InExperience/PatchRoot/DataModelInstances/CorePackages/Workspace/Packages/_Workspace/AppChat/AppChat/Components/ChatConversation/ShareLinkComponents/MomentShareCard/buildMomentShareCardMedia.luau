local httpService = game:GetService("HttpService")
local foundationModule = require(script:FindFirstAncestor("AppChat").Parent.Foundation)
local getRbxThumb = foundationModule.Utility.getRbxThumb
local thumbnailType = foundationModule.Enums.ThumbnailType

local function _(p1, p2, p3)
	local var1 = `rbxassetid://{p1}`
	
	return if p2 == Enum.CaptureType.Video and p3 ~= nil then `{var1}&accessContext={p3}&permissionContext=ignoreUniverse` else var1
end

return function(p1)
	-- upvalues: httpService (ref), getRbxThumb (ref), thumbnailType (ref)
	local assetId = p1.assetId
	local captureType = p1.captureType
	
	if assetId == nil or captureType == nil then
		return nil
	end
	local assetAccessContext = p1.assetAccessContext
	local var1 = if assetAccessContext == nil or assetAccessContext == "" then nil else httpService:UrlEncode(assetAccessContext)
	local var2 = if assetId > 0 then Content.fromUri(if var1 ~= nil then getRbxThumb(thumbnailType.Asset, assetId) else `{getRbxThumb(thumbnailType.Asset, assetId)}&accessContext={var1}`) else nil
	local t = {}
	local var3 = `rbxassetid://{assetId}`
	t.content = Content.fromUri(if captureType == Enum.CaptureType.Video and var1 ~= nil then `{var3}&accessContext={var1}&permissionContext=ignoreUniverse` else var3)
	t.posterContent = var2
	t.captureType = captureType
	
	return t
end