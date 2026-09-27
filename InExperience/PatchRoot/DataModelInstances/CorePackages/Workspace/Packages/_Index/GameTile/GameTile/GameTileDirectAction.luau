local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local cryoModule = require(parent.Cryo)
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local _ = require(gameTile.GameTileOverflowMenu)
local useGameTileActionsModule = require(gameTile.useGameTileActions)
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconButton = foundationModule.IconButton
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local gameTileOverflowMenuAction = discoveryAnalyticsModule.Events.gameTileOverflowMenuAction
local fFlagLuaAppEnableHomepageOneByTwoTile = sharedFlagsModule.FFlagLuaAppEnableHomepageOneByTwoTile
local fFlagLuaAppGameTileDirectActionTelemetry = sharedFlagsModule.FFlagLuaAppGameTileDirectActionTelemetry

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), cryoModule (ref), fFlagLuaAppGameTileDirectActionTelemetry (ref), gameTileOverflowMenuAction (ref), fFlagLuaAppEnableHomepageOneByTwoTile (ref), useGameTileActionsModule (ref), view (ref), iconButton (ref), iconSize (ref), buttonVariant (ref)
	local var1 = useTokens()
	local var2 = useGameTileActionsModule(cryoModule.Dictionary.join(p1, {
		availableMenuItems = reactModule.useMemo(function()
			-- upvalues: p1 (ref)
			return { [p1.actionId] = true }
		end, { p1.actionId })
	}), if fFlagLuaAppGameTileDirectActionTelemetry then if fFlagLuaAppGameTileDirectActionTelemetry then reactModule.useCallback(function(p2)
		-- upvalues: gameTileOverflowMenuAction (copy), p1 (ref), fFlagLuaAppEnableHomepageOneByTwoTile (copy)
		gameTileOverflowMenuAction({
			actionType = "GameTileOverflowMenuItemActivated",
			isDirectAction = true,
			universeId = p1.universeId,
			sortId = p1.collectionId or "",
			menuItem = p2,
			availableMenuItems = p2,
			contentType = if fFlagLuaAppEnableHomepageOneByTwoTile then p1.contentType else nil
		}, p1.appPage)
	end, {
		p1.appPage,
		p1.universeId,
		p1.collectionId,
		if fFlagLuaAppEnableHomepageOneByTwoTile then p1.contentType else nil
	}) else nil else nil)[1]
	
	if not var2 or not p1.isHovered then
		return nil
	end
	local iconOverride = p1.iconOverride or var2.icon
	local id = var2.id
	local onActivated = var2.onActivated
	
	return if iconOverride and id and onActivated then reactModule.createElement(view, {
		tag = "auto-xy radius-circle",
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, -var1.Padding.Medium, 0, var1.Padding.Medium),
		backgroundStyle = var1.Color.OverMedia.OverMedia_0
	}, {
		IconButton = reactModule.createElement(iconButton, {
			isCircular = true,
			testId = "game-tile-direct-action",
			icon = iconOverride,
			onActivated = function()
				-- upvalues: onActivated (ref), id (ref)
				onActivated(id)
			end,
			size = iconSize.Small,
			variant = buttonVariant.Utility
		})
	}) else nil
end