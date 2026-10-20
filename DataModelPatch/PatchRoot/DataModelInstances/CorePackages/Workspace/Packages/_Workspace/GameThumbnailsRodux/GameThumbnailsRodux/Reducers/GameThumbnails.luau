local GameThumbnailsRodux = script:FindFirstAncestor("GameThumbnailsRodux")
local Immutable = require(GameThumbnailsRodux.Parent.AppCommonLib).Immutable
local SetGameThumbnailsModule = require(GameThumbnailsRodux.Actions.SetGameThumbnails)

return function(p1, p2)
	-- upvalues: SetGameThumbnailsModule (copy), Immutable (copy)
	local P0 = p1 or {}
	assert(P0, "")
	
	if p2.type == SetGameThumbnailsModule.name then
		local Urls = {}
		
		for i, thumbnail in pairs(p2.thumbnails) do
			Urls[i] = thumbnail.url
		end
		P0 = Immutable.JoinDictionaries(P0, Urls)
	end
	return P0
end