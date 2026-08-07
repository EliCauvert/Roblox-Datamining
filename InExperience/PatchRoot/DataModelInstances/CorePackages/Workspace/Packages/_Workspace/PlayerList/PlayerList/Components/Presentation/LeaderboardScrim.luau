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
local t = { affordance = stateLayerAffordance.None }

local function LeaderboardScrimMobile() --[[ line: 18 ]]
	-- upvalues: useTokens (ref), signalsReactModule (ref), playerListVisibilityStoreModule (ref), reactModule (ref), playerContextualMenuStoreModule (ref), view (ref), t (ref)
	return reactModule.createElement(view, {
		tag = "size-full",
		ZIndex = 0,
		backgroundStyle = useTokens().Color.Common.Scrim,
		Visible = signalsReactModule.useSignalBinding(playerListVisibilityStoreModule.getEffectiveVisible),
		onActivated = reactModule.useCallback(function() --[[ line: 22 ]]
			-- upvalues: playerContextualMenuStoreModule (copy), playerListVisibilityStoreModule (copy)
			playerContextualMenuStoreModule.closeContextMenu()
			playerListVisibilityStoreModule.setVisible(false)
		end, {}),
		stateLayer = t
	})
end

return reactModule.memo(function(p0) --[[ line: 38 | named "LeaderboardScrim" ]]
	-- upvalues: reactModule (ref), LeaderboardScrimMobile (ref)
	return if p0.isSmallTouchDevice then reactModule.createElement(LeaderboardScrimMobile) else nil
end)