local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local _ = require(GameTile.GameTileOverflowMenu)
local UseGameTileActionsModule = require(GameTile.useGameTileActions)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconButton = FoundationModule.IconButton
local IconSize = FoundationModule.Enums.IconSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local GameTileOverflowMenuActionFunction = require(Parent.DiscoveryAnalytics).Events.gameTileOverflowMenuAction
local FFlagLuaAppEnableHomepageOneByTwoTile = SharedFlagsModule.FFlagLuaAppEnableHomepageOneByTwoTile
local FFlagLuaAppGameTileDirectActionTelemetry = SharedFlagsModule.FFlagLuaAppGameTileDirectActionTelemetry

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), CryoModule (copy), FFlagLuaAppGameTileDirectActionTelemetry (copy), GameTileOverflowMenuActionFunction (copy), FFlagLuaAppEnableHomepageOneByTwoTile (copy), UseGameTileActionsModule (copy), View (copy), IconButton (copy), IconSize (copy), ButtonVariant (copy)
	local UseTokensResult = UseTokensFunction()
	local UseResult = if FFlagLuaAppGameTileDirectActionTelemetry then ReactModule.useCallback(function(AvailableMenuItems)
		-- upvalues: GameTileOverflowMenuActionFunction (upval), p1 (copy), FFlagLuaAppEnableHomepageOneByTwoTile (upval)
		GameTileOverflowMenuActionFunction({
			actionType = "GameTileOverflowMenuItemActivated",
			isDirectAction = true,
			universeId = p1.universeId,
			sortId = p1.collectionId or "",
			menuItem = AvailableMenuItems,
			availableMenuItems = AvailableMenuItems,
			contentType = if FFlagLuaAppEnableHomepageOneByTwoTile then p1.contentType else nil
		}, p1.appPage)
	end, {
		p1.appPage,
		p1.universeId,
		p1.collectionId,
		if FFlagLuaAppEnableHomepageOneByTwoTile then p1.contentType else nil
	}) else nil
	local UseGameTileActionsModuleResultEntry = UseGameTileActionsModule(CryoModule.Dictionary.join(p1, {
		availableMenuItems = ReactModule.useMemo(function()
			-- upvalues: p1 (copy)
			return { [p1.actionId] = true }
		end, { p1.actionId })
	}), if FFlagLuaAppGameTileDirectActionTelemetry then UseResult else nil)[1]
	
	if UseGameTileActionsModuleResultEntry and p1.isHovered then
		local IconOverride = p1.iconOverride or UseGameTileActionsModuleResultEntry.icon
		local Id = UseGameTileActionsModuleResultEntry.id
		local OnActivatedFunction = UseGameTileActionsModuleResultEntry.onActivated
		
		return if IconOverride and Id and OnActivatedFunction then ReactModule.createElement(View, {
			tag = "auto-xy radius-circle",
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, -UseTokensResult.Padding.Medium, 0, UseTokensResult.Padding.Medium),
			backgroundStyle = UseTokensResult.Color.OverMedia.OverMedia_0
		}, {
			IconButton = ReactModule.createElement(IconButton, {
				isCircular = true,
				testId = "game-tile-direct-action",
				icon = IconOverride,
				onActivated = function()
					-- upvalues: OnActivatedFunction (copy), Id (copy)
					OnActivatedFunction(Id)
				end,
				size = IconSize.Small,
				variant = ButtonVariant.Utility
			})
		}) else nil
	else
		return nil
	end
end