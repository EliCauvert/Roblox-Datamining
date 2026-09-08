local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local signalsReactModule = require(parent_1.SignalsReact)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local playerListVisibilityStoreModule = require(parent.Common.PlayerListVisibilityStore)
local playerContextualMenuStoreModule = require(parent.Common.PlayerContextualMenuStore)
local constantsModule = require(parent.Common.Constants)
local t = { affordance = stateLayerAffordance.None }

local function LeaderboardScrimMobile()
	-- upvalues: useTokens (ref), signalsReactModule (ref), playerListVisibilityStoreModule (ref), reactModule (ref), playerContextualMenuStoreModule (ref), view (ref), t (ref), constantsModule (ref)
	return reactModule.createElement(view, {
		tag = "size-full",
		ZIndex = 0,
		backgroundStyle = useTokens().Color.Common.Scrim,
		Visible = signalsReactModule.useSignalBinding(playerListVisibilityStoreModule.getEffectiveVisible),
		onActivated = reactModule.useCallback(function()
			-- upvalues: playerContextualMenuStoreModule (copy), playerListVisibilityStoreModule (copy)
			playerContextualMenuStoreModule.closeContextMenu()
			playerListVisibilityStoreModule.setVisible(false)
		end, {}),
		stateLayer = t,
		selection = constantsModule.NOT_SELECTABLE
	})
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), LeaderboardScrimMobile (ref)
	return if p1.isSmallTouchDevice then reactModule.createElement(LeaderboardScrimMobile) else nil
end)