local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local gridTileTextFooterModule = require(gameTile.Footer.GridTileTextFooter)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local char = utf8.char(57344)

return function(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), char (ref), gridTileTextFooterModule (ref)
	local creatorByLabel = useLocalization({ creatorByLabel = "Feature.GameDetails.Label.By" }).creatorByLabel
	
	return reactModule.createElement(gridTileTextFooterModule, {
		RichText = true,
		useLargerFont = true,
		isUnifiedGameTile = true,
		LayoutOrder = p1.LayoutOrder,
		AnchorPoint = p1.AnchorPoint,
		Position = p1.Position,
		text = reactModule.useMemo(function()
			-- upvalues: p1 (ref), creatorByLabel (ref), char (copy)
			return if p1.name == nil or p1.name == "" then "" else `<b>{creatorByLabel} {p1.name}</b>{if p1.hasVerifiedBadge then char else ""}`
		end, { creatorByLabel, p1.name, p1.hasVerifiedBadge })
	})
end