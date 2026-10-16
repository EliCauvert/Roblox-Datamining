local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local SignalsReactModule = require(Parent1.SignalsReact)
local FoundationModule = require(Parent1.Foundation)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local PlayerListVisibilityStoreModule = require(Parent.Common.PlayerListVisibilityStore)
local PlayerContextualMenuStoreModule = require(Parent.Common.PlayerContextualMenuStore)
local ConstantsModule = require(Parent.Common.Constants)
local StateLayer = {
	affordance = FoundationModule.Enums.StateLayerAffordance.None
}

local function LeaderboardScrimMobile() --[[ Line: 20 ]]
	-- upvalues: UseTokensFunction (copy), SignalsReactModule (copy), PlayerListVisibilityStoreModule (copy), ReactModule (copy), PlayerContextualMenuStoreModule (copy), View (copy), StateLayer (copy), ConstantsModule (copy)
	return ReactModule.createElement(View, {
		tag = "size-full",
		ZIndex = 0,
		backgroundStyle = UseTokensFunction().Color.Common.Scrim,
		Visible = SignalsReactModule.useSignalBinding(PlayerListVisibilityStoreModule.getEffectiveVisible),
		onActivated = ReactModule.useCallback(function() --[[ Line: 24 ]]
			-- upvalues: PlayerContextualMenuStoreModule (upval), PlayerListVisibilityStoreModule (upval)
			PlayerContextualMenuStoreModule.closeContextMenu()
			PlayerListVisibilityStoreModule.setVisible(false)
		end, {}),
		stateLayer = StateLayer,
		selection = ConstantsModule.NOT_SELECTABLE
	})
end

return ReactModule.memo(function(p1) --[[ Line: 42 | Named "LeaderboardScrim" ]]
	-- upvalues: ReactModule (copy), LeaderboardScrimMobile (copy)
	return if p1.isSmallTouchDevice then ReactModule.createElement(LeaderboardScrimMobile) else nil
end)