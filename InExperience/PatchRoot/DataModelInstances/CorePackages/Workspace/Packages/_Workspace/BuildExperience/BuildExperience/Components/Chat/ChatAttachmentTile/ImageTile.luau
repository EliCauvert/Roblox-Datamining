local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ChatAttachmentTileModule = require(script.Parent.ChatAttachmentTile)
local TileAspectRatioModule = require(script.Parent.TileAspectRatio)
local Image = FoundationModule.Image

return function(Tile)
	-- upvalues: ReactModule (copy), ChatAttachmentTileModule (copy), TileAspectRatioModule (copy), Image (copy)
	local TestId = Tile.testId or "ImageTile"
	
	return ReactModule.createElement(ChatAttachmentTileModule, {
		isMedia = true,
		aspectRatio = if Tile.imageAspectRatio == nil then TileAspectRatioModule.Square else TileAspectRatioModule.fit(Tile.imageAspectRatio),
		tile = Tile,
		testId = TestId
	}, {
		Content = ReactModule.createElement(Image, {
			tag = "size-full radius-medium",
			ImageContent = Tile.image,
			ScaleType = Enum.ScaleType.Crop,
			testId = `{TestId}.Image`
		})
	})
end