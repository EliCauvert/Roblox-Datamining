local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local signalsReactModule = require(parent_1.SignalsReact)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local playerListIconModule = require(parent.Common.PlayerListIcon)
local playerContextualMenuStoreModule = require(parent.Common.PlayerContextualMenuStore)
local t = { affordance = stateLayerAffordance.Background }

return reactModule.memo(function(p0)
	-- upvalues: useTokens (ref), signalsReactModule (ref), playerContextualMenuStoreModule (ref), reactModule (ref), playerListIconModule (ref), view (ref), text (ref), t (ref)
	local item = p0.item
	local var6 = if item.icon ~= nil then nil else reactModule.createElement(playerListIconModule, {
		layoutOrder = 1,
		testId = "menu-action-row-icon",
		icon = item.icon,
		size = useTokens().Size.Size_500
	})
	
	return reactModule.createElement(view, {
		tag = "row align-x-left align-y-center gap-none size-full-1000 auto-y",
		LayoutOrder = p0.layoutOrder,
		onActivated = reactModule.useCallback(function()
			-- upvalues: playerContextualMenuStoreModule (copy), item (ref)
			playerContextualMenuStoreModule.activateMenuItem(item)
		end, { item }),
		stateLayer = t
	}, {
		Icon = if var6 ~= nil then nil else reactModule.createElement(view, {
			tag = "row align-x-center align-y-center size-1000-1000",
			LayoutOrder = 1,
			testId = "menu-action-row-icon-column"
		}, { Icon = var6 }),
		Label = reactModule.createElement(text, {
			tag = "auto-xy text-body-medium text-align-x-left content-default",
			LayoutOrder = 2,
			Text = if (item.requiresConfirm == true and signalsReactModule.useSignalState(playerContextualMenuStoreModule.getPendingConfirmKey) == item.key) and item.confirmLabel ~= nil then item.confirmLabel else item.label
		})
	})
end)