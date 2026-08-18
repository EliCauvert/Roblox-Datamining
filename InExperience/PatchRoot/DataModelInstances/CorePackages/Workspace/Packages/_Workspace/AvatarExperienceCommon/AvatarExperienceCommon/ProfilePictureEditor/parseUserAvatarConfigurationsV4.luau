local parseCloseupCameraConfigModule = require(script.Parent.parseCloseupCameraConfig)
local parseProfileFrameAssetIdModule = require(script.Parent.parseProfileFrameAssetId)

local function parseProfileFrameAssetIdFromV4(value) --[[ line: 11 ]]
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
	parseUserAvatarConfigurationsV4 = function(p0) --[[ line: 32 ]]
		-- upvalues: parseCloseupCameraConfigModule (ref), parseProfileFrameAssetIdFromV4 (ref)
		local var5 = if typeof(p0) == "table" then p0.avatarConfigurations else nil
		
		return {
			closeupCameraConfig = parseCloseupCameraConfigModule({
				avatarThumbnailCustomizations = if var5 then var5.thumbnailCustomizations else nil
			}),
			profileFrameAssetId = parseProfileFrameAssetIdFromV4(if var5 then var5.profileFrame else nil)
		}
	end
}