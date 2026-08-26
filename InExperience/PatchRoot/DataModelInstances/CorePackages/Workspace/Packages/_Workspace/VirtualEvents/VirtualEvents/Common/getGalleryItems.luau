local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local _ = require(virtualEvents.Parent.GraphQLServer)
local constantsModule = require(virtualEvents.constants)
local _ = require(virtualEvents.Parent.AppBlox)
local fFlagLuaAppLimitEventThumbnailToOneModule = require(virtualEvents.Flags.FFlagLuaAppLimitEventThumbnailToOne)

return function(p1)
	-- upvalues: fFlagLuaAppLimitEventThumbnailToOneModule (ref), constantsModule (ref)
	local t = {}
	
	if p1 then
		for i, v in p1 do
			if v.assetType == "Image" and v.imageId then
				table.insert(t, {
					isYouTubeVideo = false,
					imageId = ("rbxassetid://%s"):format(v.imageId)
				})
			end
		end
	end
	return if #t > 0 then if fFlagLuaAppLimitEventThumbnailToOneModule then { t[1] } else t else {
		{
			isYouTubeVideo = false,
			imageId = constantsModule.DEFAULT_EVENT_THUMBNAIL
		}
	}
end