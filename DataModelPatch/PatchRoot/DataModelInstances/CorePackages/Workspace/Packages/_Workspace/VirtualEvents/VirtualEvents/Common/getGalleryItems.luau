local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local _ = require(VirtualEvents.Parent.GraphQLServer)
local ConstantsModule = require(VirtualEvents.constants)
local _ = require(VirtualEvents.Parent.AppBlox)
local FFlagLuaAppLimitEventThumbnailToOneModule = require(VirtualEvents.Flags.FFlagLuaAppLimitEventThumbnailToOne)

return function(List)
	-- upvalues: FFlagLuaAppLimitEventThumbnailToOneModule (copy), ConstantsModule (copy)
	local List1 = {}
	
	if List then
		for _, value in List do
			if value.assetType == "Image" and value.imageId then
				table.insert(List1, {
					isYouTubeVideo = false,
					imageId = ("rbxassetid://%s"):format(value.imageId)
				})
			end
		end
	end
	return if #List1 > 0 then if FFlagLuaAppLimitEventThumbnailToOneModule then { List1[1] } else List1 else {
		{
			isYouTubeVideo = false,
			imageId = ConstantsModule.DEFAULT_EVENT_THUMBNAIL
		}
	}
end