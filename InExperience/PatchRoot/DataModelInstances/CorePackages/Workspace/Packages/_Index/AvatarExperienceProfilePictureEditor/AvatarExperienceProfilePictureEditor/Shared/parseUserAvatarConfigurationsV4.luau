local ParseCloseupCameraConfigModule = require(script.Parent.parseCloseupCameraConfig)
local ParseProfileFrameAssetIdModule = require(script.Parent.parseProfileFrameAssetId)

local function parseProfileFrameAssetIdFromV4(ProfileFrame)
	-- upvalues: ParseProfileFrameAssetIdModule (copy)
	if ProfileFrame == nil then
		return nil
	end
	local FrameAsset = ProfileFrame.frameAsset or (ProfileFrame.profileFrameAsset or ProfileFrame)
	
	if typeof(FrameAsset) == "table" then
		local Id = FrameAsset.id or (FrameAsset.assetId or FrameAsset.FrameAssetId)
		
		return if typeof(Id) == "number" and Id ~= 0 then tostring(Id) else ParseProfileFrameAssetIdModule({ FrameAssetId = Id })
	else
		return nil
	end
end

return {
	parseProfileFrameAssetIdFromV4 = parseProfileFrameAssetIdFromV4,
	parseUserAvatarConfigurationsV4 = function(p1)
		-- upvalues: ParseCloseupCameraConfigModule (copy), parseProfileFrameAssetIdFromV4 (copy)
		local AvatarConfigurations = if typeof(p1) == "table" then p1.avatarConfigurations else nil
		
		return {
			closeupCameraConfig = ParseCloseupCameraConfigModule({
				avatarThumbnailCustomizations = if AvatarConfigurations then AvatarConfigurations.thumbnailCustomizations else nil
			}),
			profileFrameAssetId = parseProfileFrameAssetIdFromV4(if AvatarConfigurations then AvatarConfigurations.profileFrame else nil)
		}
	end
}