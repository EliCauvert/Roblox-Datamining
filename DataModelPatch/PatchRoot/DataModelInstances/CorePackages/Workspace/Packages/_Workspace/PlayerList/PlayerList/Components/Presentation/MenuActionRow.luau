local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local SignalsReactModule = require(Parent1.SignalsReact)
local FoundationModule = require(Parent1.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local PlayerListIconModule = require(Parent.Common.PlayerListIcon)
local PlayerContextualMenuStoreModule = require(Parent.Common.PlayerContextualMenuStore)
local StateLayer = {
	affordance = FoundationModule.Enums.StateLayerAffordance.None
}

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), SignalsReactModule (copy), PlayerContextualMenuStoreModule (copy), ReactModule (copy), PlayerListIconModule (copy), Text (copy), View (copy), StateLayer (copy)
	local UseTokensResult = UseTokensFunction()
	local Item = p1.item
	local UseSignalStateResult = SignalsReactModule.useSignalState(PlayerContextualMenuStoreModule.getPendingConfirmKey)
	local IsUseSignalStateResultMatch: boolean = Item.requiresConfirm == true and UseSignalStateResult == Item.key
	
	return ReactModule.createElement(View, {
		tag = "row align-x-left align-y-center gap-medium size-full-1000 auto-y",
		LayoutOrder = p1.layoutOrder,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: PlayerContextualMenuStoreModule (upval), Item (copy)
			PlayerContextualMenuStoreModule.activateMenuItem(Item)
		end, { Item }),
		stateLayer = StateLayer
	}, {
		Icon = if Item.icon == nil then nil else ReactModule.createElement(PlayerListIconModule, {
			layoutOrder = 1,
			icon = Item.icon,
			size = UseTokensResult.Size.Size_500
		}),
		Label = ReactModule.createElement(Text, {
			tag = "auto-xy text-body-medium text-align-x-left content-default",
			LayoutOrder = 2,
			Text = if IsUseSignalStateResultMatch and Item.confirmLabel ~= nil then Item.confirmLabel else Item.label
		})
	})
end)