local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local signalsReactModule = require(parent_1.SignalsReact)
local useTokens = require(parent_1.Foundation).Hooks.useTokens
local playerIconInfoStore = require(parent_1.PlayerIconInfoStore).PlayerIconInfoStore
local getPlayerBadgeIconModule = require(parent.Common.getPlayerBadgeIcon)
local layoutValuesContextModule = require(parent.Common.LayoutValuesContext)
local playerListIconModule = require(parent.Common.PlayerListIcon)
local playerRelationshipStoreModule = require(parent.Common.PlayerRelationshipStore)

return reactModule.memo(function(p0) --[[ line: 17 | named "PlayerBadge" ]]
	-- upvalues: reactModule (ref), layoutValuesContextModule (ref), useTokens (ref), signalsReactModule (ref), playerIconInfoStore (ref), playerRelationshipStoreModule (ref), getPlayerBadgeIconModule (ref), playerListIconModule (ref)
	return reactModule.createElement(playerListIconModule, {
		icon = getPlayerBadgeIconModule(reactModule.useContext(layoutValuesContextModule), p0.player, signalsReactModule.useSignalState(playerIconInfoStore.getPlayerIconInfoReactive(p0.player.UserId)), signalsReactModule.useSignalState(playerRelationshipStoreModule.getPlayerRelationshipReactive(p0.player.UserId))),
		size = useTokens().Size.Size_400,
		layoutOrder = p0.layoutOrder
	})
end)