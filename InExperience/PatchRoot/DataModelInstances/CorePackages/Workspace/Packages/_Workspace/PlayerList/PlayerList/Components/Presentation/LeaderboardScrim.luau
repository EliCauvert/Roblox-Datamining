local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local signalsReactModule = require(parent_1.SignalsReact)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local playerListVisibilityStoreModule = require(parent.Common.PlayerListVisibilityStore)

return reactModule.memo(function(p0) --[[ line: 18 | named "LeaderboardScrim" ]]
	-- upvalues: useTokens (ref), signalsReactModule (ref), playerListVisibilityStoreModule (ref), reactModule (ref), view (ref)
	return if p0.isSmallTouchDevice then reactModule.createElement(view, {
		tag = "size-full",
		ZIndex = 0,
		backgroundStyle = useTokens().Color.Common.Scrim,
		Visible = signalsReactModule.useSignalBinding(playerListVisibilityStoreModule.getEffectiveVisible)
	}) else nil
end)