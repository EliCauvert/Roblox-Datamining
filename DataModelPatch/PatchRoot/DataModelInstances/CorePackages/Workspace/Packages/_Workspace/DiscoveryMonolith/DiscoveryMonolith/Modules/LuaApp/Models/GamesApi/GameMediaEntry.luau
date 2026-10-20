local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local Logging = require(Parent.AppCommonLib).Logging
local ArgCheckModule = require(Parent.ArgCheck)
local GameMediaImageType = require(Parent.DiscoveryTypes).GameMediaImageType
local FFlagLuaAppEdpMediaGalleryVideoPreview = require(Parent.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview
local t = {}

for i, value in pairs(GameMediaImageType) do
	t[value] = i
end
local GameMediaEntryModule = {
	new = function()
		return {}
	end
}

function GameMediaEntryModule.fromJsonData(p1)
	-- upvalues: GameMediaEntryModule (copy), ArgCheckModule (copy), FFlagLuaAppEdpMediaGalleryVideoPreview (copy), GameMediaImageType (copy), t (copy), Logging (copy)
	local NewGameMediaEntry = GameMediaEntryModule.new()
	NewGameMediaEntry.id = p1.id and tostring(ArgCheckModule.isType(p1.id, "number", "jsonData.id"))
	NewGameMediaEntry.assetTypeId = ArgCheckModule.isType(p1.assetTypeId, "number", "jsonData.assetTypeId")
	NewGameMediaEntry.imageId = p1.imageId and tostring(ArgCheckModule.isType(p1.imageId, "number", "jsonData.imageId"))
	NewGameMediaEntry.youTubeVideoHash = p1.videoHash and ArgCheckModule.isType(p1.videoHash, "string", "jsonData.videoHash")
	NewGameMediaEntry.youTubeVideoTitle = p1.videoTitle and ArgCheckModule.isType(p1.videoTitle, "string", "jsonData.videoTitle")
	NewGameMediaEntry.approved = ArgCheckModule.isType(p1.approved, "boolean", "jsonData.approved")
	
	if FFlagLuaAppEdpMediaGalleryVideoPreview and NewGameMediaEntry.assetTypeId == GameMediaImageType.Video then
		NewGameMediaEntry.videoId = ArgCheckModule.isType(p1.videoId, "string", "jsonData.videoId")
	end
	if NewGameMediaEntry.assetTypeId == GameMediaImageType.GamePreviewVideo then
		NewGameMediaEntry.videoId = ArgCheckModule.isType(p1.videoId, "string", "jsonData.videoId")
	end
	if not t[NewGameMediaEntry.assetTypeId] then
		Logging.warn("Unrecognized assetTypeId: " .. tostring(NewGameMediaEntry.assetTypeId))
	end
	return NewGameMediaEntry
end

return GameMediaEntryModule