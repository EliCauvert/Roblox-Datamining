local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local gridTileTextFooterModule = require(gameTile.Footer.GridTileTextFooter)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local char = utf8.char(57344)

return function(p0) --[[ line: 18 | named "CreatorNameMetadata" ]]
	-- upvalues: useLocalization (ref), reactModule (ref), char (ref), gridTileTextFooterModule (ref)
	local creatorByLabel = useLocalization({ creatorByLabel = "Feature.GameDetails.Label.By" }).creatorByLabel
	
	return reactModule.createElement(gridTileTextFooterModule, {
		RichText = true,
		useLargerFont = true,
		isUnifiedGameTile = true,
		LayoutOrder = p0.LayoutOrder,
		AnchorPoint = p0.AnchorPoint,
		Position = p0.Position,
		text = reactModule.useMemo(function() --[[ line: 24 ]]
			-- upvalues: p0 (ref), creatorByLabel (ref), char (copy)
			return if p0.name == nil or p0.name == "" then "" else `<b>{creatorByLabel} {p0.name}</b>{if p0.hasVerifiedBadge then char else ""}`
		end, { creatorByLabel, p0.name, p0.hasVerifiedBadge })
	})
end