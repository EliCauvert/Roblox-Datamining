local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ChatAttachmentTileModule = require(script.Parent.ChatAttachmentTile)
local IconTextTileContentModule = require(script.Parent.IconTextTileContent)
local TileAspectRatioModule = require(script.Parent.TileAspectRatio)
local TruncateWithEllipsisModule = require(script.Parent.truncateWithEllipsis)
local IconName = FoundationModule.Enums.IconName

local function _(Text: string)
	-- upvalues: TruncateWithEllipsisModule (copy)
	local TruncateWithEllipsisModuleResult = TruncateWithEllipsisModule(Text, 20)
	local Match, Match2 = string.match(Text, "^(.+)%.([^.]+)$")
	
	if TruncateWithEllipsisModuleResult == Text or not Match or not Match2 or #Match2 > 6 then
		return TruncateWithEllipsisModuleResult, nil
	else
		return TruncateWithEllipsisModule(Match, 12), `.{Match2}`
	end
end

return function(Tile)
	-- upvalues: TruncateWithEllipsisModule (copy), ReactModule (copy), ChatAttachmentTileModule (copy), TileAspectRatioModule (copy), IconTextTileContentModule (copy), IconName (copy)
	local TestId = Tile.testId or "TextFileTile"
	local FileName: string = Tile.fileName
	local TruncateWithEllipsisModuleResult = TruncateWithEllipsisModule(FileName, 20)
	local Match, Match2 = string.match(FileName, "^(.+)%.([^.]+)$")
	local Text = nil
	local Suffix = nil
	
	if TruncateWithEllipsisModuleResult == FileName or not Match or not Match2 or #Match2 > 6 then
		Text = TruncateWithEllipsisModuleResult
		Suffix = nil
	else
		Text = TruncateWithEllipsisModule(Match, 12)
		Suffix = `.{Match2}`
	end
	return ReactModule.createElement(ChatAttachmentTileModule, {
		isMedia = false,
		aspectRatio = TileAspectRatioModule.Square,
		tile = Tile,
		testId = TestId
	}, {
		Content = ReactModule.createElement(IconTextTileContentModule, {
			iconName = IconName.TextTSerif,
			text = Text,
			suffix = Suffix,
			testId = `{TestId}.Content`
		})
	})
end