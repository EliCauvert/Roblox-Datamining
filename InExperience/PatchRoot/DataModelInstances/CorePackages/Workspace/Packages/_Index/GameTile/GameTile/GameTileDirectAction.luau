local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local cryoModule = require(parent.Cryo)
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
local fFlagLuaAppAdjustOverflowMenuVisual = sharedFlagsModule.FFlagLuaAppAdjustOverflowMenuVisual

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), cryoModule (ref), useGameTileActionsModule (ref), view (ref), fFlagLuaAppAdjustOverflowMenuVisual (ref), iconButton (ref), iconSize (ref), buttonVariant (ref)
	local var1 = useTokens()
	local var2 = useGameTileActionsModule(cryoModule.Dictionary.join(p1, {
		availableMenuItems = reactModule.useMemo(function()
			-- upvalues: p1 (ref)
			return { [p1.actionId] = true }
		end, { p1.actionId })
	}))[1]
	
	if not var2 or not p1.isHovered then
		return nil
	end
	local iconOverride = p1.iconOverride or var2.icon
	local id = var2.id
	local onActivated = var2.onActivated
	
	return if iconOverride and id and onActivated then reactModule.createElement(view, {
		tag = "auto-xy radius-circle",
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, if fFlagLuaAppAdjustOverflowMenuVisual then -var1.Padding.Medium else -var1.Padding.Small, 0, if fFlagLuaAppAdjustOverflowMenuVisual then var1.Padding.Medium else var1.Padding.Small),
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
			size = if fFlagLuaAppAdjustOverflowMenuVisual then iconSize.Small else iconSize.Medium,
			variant = buttonVariant.Utility
		})
	}) else nil
end