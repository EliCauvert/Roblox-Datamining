local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local cryoModule = require(parent.Cryo)
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(gameTile.GameTileOverflowMenu)
local useGameTileActionsModule = require(gameTile.useGameTileActions)
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconButton = foundationModule.IconButton
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local sendGameTileDirectActionActivatedEvent = discoveryAnalyticsModule.Events.sendGameTileDirectActionActivatedEvent
local sendGameTileDirectActionImpressedEvent = discoveryAnalyticsModule.Events.sendGameTileDirectActionImpressedEvent
local luaAppGameTileDirectActionTelemetry = game:DefineFastFlag("LuaAppGameTileDirectActionTelemetry", false)
local luaAppGameTileDirectActionImpressionTelemetry = game:DefineFastFlag("LuaAppGameTileDirectActionImpressionTelemetry", false)

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), cryoModule (ref), useGameTileActionsModule (ref), luaAppGameTileDirectActionImpressionTelemetry (ref), sendGameTileDirectActionImpressedEvent (ref), view (ref), iconButton (ref), luaAppGameTileDirectActionTelemetry (ref), sendGameTileDirectActionActivatedEvent (ref), iconSize (ref), buttonVariant (ref)
	local var1 = useTokens()
	local var2 = useGameTileActionsModule(cryoModule.Dictionary.join(p1, {
		availableMenuItems = reactModule.useMemo(function()
			-- upvalues: p1 (ref)
			return { [p1.actionId] = true }
		end, { p1.actionId })
	}))[1]
	local _ = nil
	
	if luaAppGameTileDirectActionImpressionTelemetry then
		local var3 = reactModule.useRef(false)
		reactModule.useEffect(function()
			-- upvalues: var2 (ref), p1 (ref), var3 (write), sendGameTileDirectActionImpressedEvent (copy)
			if not var2 or not p1.isHovered then return end
			local id = var2.id
			
			if (p1.iconOverride or var2.icon) and id and (var2.onActivated and not var3.current) then
				sendGameTileDirectActionImpressedEvent({
					universeId = p1.universeId,
					sortId = p1.collectionId,
					actionId = id,
					contentType = p1.contentType
				}, p1.appPage or "Unknown")
				var3.current = true
				
				return
			end
		end, {
			var2, p1.isHovered, p1.iconOverride, p1.universeId, p1.collectionId,
			p1.contentType, p1.appPage
		})
	end
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
				-- upvalues: onActivated (ref), id (ref), luaAppGameTileDirectActionTelemetry (copy), sendGameTileDirectActionActivatedEvent (copy), p1 (ref)
				onActivated(id)
				
				if luaAppGameTileDirectActionTelemetry then
					sendGameTileDirectActionActivatedEvent({
						universeId = p1.universeId,
						sortId = p1.collectionId,
						actionId = id,
						contentType = p1.contentType
					}, p1.appPage or "Unknown")
				end
			end,
			size = iconSize.Small,
			variant = buttonVariant.Utility
		})
	}) else nil
end