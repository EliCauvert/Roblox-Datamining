local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ChatAttachmentTileModule = require(script.Parent.ChatAttachmentTile)
local IconTextTileContentModule = require(script.Parent.IconTextTileContent)
local TileAspectRatioModule = require(script.Parent.TileAspectRatio)
local TruncateWithEllipsisModule = require(script.Parent.truncateWithEllipsis)
local IconName = FoundationModule.Enums.IconName
local config = {
	[" "] = " ",
	[" "] = " ",
	[" "] = " ",
	[" "] = " ",
	[" "] = " ",
	["　"] = " ",
	[" "] = " ",
	[" "] = " "
}

local function getSnippet(Text: string)
	-- upvalues: config (copy), TruncateWithEllipsisModule (copy)
	return TruncateWithEllipsisModule(string.match(string.gsub(string.gsub(Text, utf8.charpattern, config), "%s+", " "), "^ ?(.-) ?$"), 27)
end

return function(Tile)
	-- upvalues: ReactModule (copy), ChatAttachmentTileModule (copy), TileAspectRatioModule (copy), IconTextTileContentModule (copy), IconName (copy), getSnippet (copy)
	local TestId = Tile.testId or "PastedTextTile"
	
	return ReactModule.createElement(ChatAttachmentTileModule, {
		isMedia = false,
		aspectRatio = TileAspectRatioModule.Landscape,
		tile = Tile,
		testId = TestId
	}, {
		Content = ReactModule.createElement(IconTextTileContentModule, {
			iconName = IconName.ClipboardPencil,
			text = getSnippet(Tile.text),
			testId = `{TestId}.Content`
		})
	})
end