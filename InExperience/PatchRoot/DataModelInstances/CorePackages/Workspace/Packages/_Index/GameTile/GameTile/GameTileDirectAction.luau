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

return function(p0) --[[ line: 30 | named "GameTileDirectAction" ]]
	-- upvalues: useTokens (ref), reactModule (ref), cryoModule (ref), useGameTileActionsModule (ref), view (ref), fFlagLuaAppAdjustOverflowMenuVisual (ref), iconButton (ref), iconSize (ref), buttonVariant (ref)
	local var6 = useTokens()
	local var7 = useGameTileActionsModule(cryoModule.Dictionary.join(p0, {
		availableMenuItems = reactModule.useMemo(function() --[[ line: 32 ]]
			-- upvalues: p0 (ref)
			return { [p0.actionId] = true }
		end, { p0.actionId })
	}))[1]
	
	if not var7 or not p0.isHovered then
		return nil
	end
	local iconOverride = p0.iconOverride or var7.icon
	local id = var7.id
	local onActivated = var7.onActivated
	
	return if iconOverride and id and onActivated then reactModule.createElement(view, {
		tag = "auto-xy radius-circle",
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, if fFlagLuaAppAdjustOverflowMenuVisual then -var6.Padding.Medium else -var6.Padding.Small, 0, if fFlagLuaAppAdjustOverflowMenuVisual then var6.Padding.Medium else var6.Padding.Small),
		backgroundStyle = var6.Color.OverMedia.OverMedia_0
	}, {
		IconButton = reactModule.createElement(iconButton, {
			isCircular = true,
			testId = "game-tile-direct-action",
			icon = iconOverride,
			onActivated = function() --[[ line: 67 ]]
				-- upvalues: onActivated (ref), id (ref)
				onActivated(id)
			end,
			size = if fFlagLuaAppAdjustOverflowMenuVisual then iconSize.Small else iconSize.Medium,
			variant = buttonVariant.Utility
		})
	}) else nil
end