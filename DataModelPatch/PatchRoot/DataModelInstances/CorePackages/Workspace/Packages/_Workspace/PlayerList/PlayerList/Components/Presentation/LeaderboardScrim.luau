local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local SignalsReactModule = require(Parent1.SignalsReact)
local FoundationModule = require(Parent1.Foundation)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local PlayerListVisibilityStoreModule = require(Parent.Common.PlayerListVisibilityStore)
local PlayerContextualMenuStoreModule = require(Parent.Common.PlayerContextualMenuStore)
local StateLayer = {
	affordance = FoundationModule.Enums.StateLayerAffordance.None
}

local function LeaderboardScrimMobile()
	-- upvalues: UseTokensFunction (copy), SignalsReactModule (copy), PlayerListVisibilityStoreModule (copy), ReactModule (copy), PlayerContextualMenuStoreModule (copy), View (copy), StateLayer (copy)
	return ReactModule.createElement(View, {
		tag = "size-full",
		ZIndex = 0,
		backgroundStyle = UseTokensFunction().Color.Common.Scrim,
		Visible = SignalsReactModule.useSignalBinding(PlayerListVisibilityStoreModule.getEffectiveVisible),
		onActivated = ReactModule.useCallback(function()
			-- upvalues: PlayerContextualMenuStoreModule (upval), PlayerListVisibilityStoreModule (upval)
			PlayerContextualMenuStoreModule.closeContextMenu()
			PlayerListVisibilityStoreModule.setVisible(false)
		end, {}),
		stateLayer = StateLayer
	})
end

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), LeaderboardScrimMobile (copy)
	return if p1.isSmallTouchDevice then ReactModule.createElement(LeaderboardScrimMobile) else nil
end)