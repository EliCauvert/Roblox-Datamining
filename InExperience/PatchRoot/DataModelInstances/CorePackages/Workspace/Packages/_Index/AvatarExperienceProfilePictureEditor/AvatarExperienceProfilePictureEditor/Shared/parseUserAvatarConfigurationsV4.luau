local parseCloseupCameraConfigModule = require(script.Parent.parseCloseupCameraConfig)
local parseProfileFrameAssetIdModule = require(script.Parent.parseProfileFrameAssetId)

local function parseProfileFrameAssetIdFromV4(value)
	-- upvalues: parseProfileFrameAssetIdModule (ref)
	if value == nil then
		return nil
	end
	local frameAsset = value.frameAsset or (value.profileFrameAsset or value)
	
	if typeof(frameAsset) ~= "table" then
		return nil
	end
	local id = frameAsset.id or (frameAsset.assetId or frameAsset.FrameAssetId)
	
	return if typeof(id) == "number" and id ~= 0 then tostring(id) else parseProfileFrameAssetIdModule({ FrameAssetId = id })
end

return {
	parseProfileFrameAssetIdFromV4 = parseProfileFrameAssetIdFromV4,
	parseUserAvatarConfigurationsV4 = function(p1)
		-- upvalues: parseCloseupCameraConfigModule (ref), parseProfileFrameAssetIdFromV4 (ref)
		local var1 = if typeof(p1) == "table" then p1.avatarConfigurations else nil
		
		return {
			closeupCameraConfig = parseCloseupCameraConfigModule({
				avatarThumbnailCustomizations = if var1 then var1.thumbnailCustomizations else nil
			}),
			profileFrameAssetId = parseProfileFrameAssetIdFromV4(if var1 then var1.profileFrame else nil)
		}
	end
}