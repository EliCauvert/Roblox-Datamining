local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local SignalsReactModule = require(Parent1.SignalsReact)
local UseTokensFunction = require(Parent1.Foundation).Hooks.useTokens
local PlayerIconInfoStore = require(Parent1.PlayerIconInfoStore).PlayerIconInfoStore
local GetPlayerBadgeIconModule = require(Parent.Common.getPlayerBadgeIcon)
local LayoutValuesContextModule = require(Parent.Common.LayoutValuesContext)
local PlayerListIconModule = require(Parent.Common.PlayerListIcon)
local PlayerRelationshipStoreModule = require(Parent.Common.PlayerRelationshipStore)

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), LayoutValuesContextModule (copy), UseTokensFunction (copy), SignalsReactModule (copy), PlayerIconInfoStore (copy), PlayerRelationshipStoreModule (copy), GetPlayerBadgeIconModule (copy), PlayerListIconModule (copy)
	return ReactModule.createElement(PlayerListIconModule, {
		icon = GetPlayerBadgeIconModule(ReactModule.useContext(LayoutValuesContextModule), p1.player, SignalsReactModule.useSignalState(PlayerIconInfoStore.getPlayerIconInfoReactive(p1.player.UserId)), (SignalsReactModule.useSignalState(PlayerRelationshipStoreModule.getPlayerRelationshipReactive(p1.player.UserId)))),
		size = UseTokensFunction().Size.Size_400,
		layoutOrder = p1.layoutOrder
	})
end)