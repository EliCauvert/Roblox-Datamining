local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local GridTileTextFooterModule = require(GameTile.Footer.GridTileTextFooter)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Character = utf8.char(57344)

return function(Frame: Frame)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), Character (copy), GridTileTextFooterModule (copy)
	local CreatorByLabel = UseLocalizationFunction({ creatorByLabel = "Feature.GameDetails.Label.By" }).creatorByLabel
	
	return ReactModule.createElement(GridTileTextFooterModule, {
		RichText = true,
		useLargerFont = true,
		isUnifiedGameTile = true,
		LayoutOrder = Frame.LayoutOrder,
		AnchorPoint = Frame.AnchorPoint,
		Position = Frame.Position,
		text = ReactModule.useMemo(function(): string
			-- upvalues: Frame (copy), CreatorByLabel (copy), Character (upval)
			return if Frame.name == nil or Frame.name == "" then "" else `<b>{CreatorByLabel} {Frame.name}</b>{if Frame.hasVerifiedBadge then Character else ""}`
		end, { CreatorByLabel, Frame.name, Frame.hasVerifiedBadge })
	})
end