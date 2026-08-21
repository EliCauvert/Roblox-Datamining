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

return reactModule.memo(function(p0) --[[ line: 20 | named "MenuActionRow" ]]
	-- upvalues: useTokens (ref), signalsReactModule (ref), playerContextualMenuStoreModule (ref), reactModule (ref), playerListIconModule (ref), view (ref), text (ref), t (ref)
	local var6 = useTokens()
	local item = p0.item
	local var7 = if (item.requiresConfirm == true and signalsReactModule.useSignalState(playerContextualMenuStoreModule.getPendingConfirmKey) == item.key) and item.confirmLabel ~= nil then item.confirmLabel else item.label
	local var8 = p0.isInteractable ~= false
	local var9 = if item.icon ~= nil then nil else reactModule.createElement(playerListIconModule, {
		layoutOrder = 1,
		testId = "menu-action-row-icon",
		icon = item.icon,
		size = var6.Size.Size_500
	})
	
	return reactModule.createElement(view, {
		tag = "row align-x-left align-y-center gap-none size-full-1000 auto-y",
		testId = "menu-action-row",
		LayoutOrder = p0.layoutOrder,
		onActivated = if var8 then reactModule.useCallback(function() --[[ line: 34 ]]
			-- upvalues: var8 (ref), playerContextualMenuStoreModule (copy), item (ref)
			if var8 then
				playerContextualMenuStoreModule.activateMenuItem(item)
				
				return
			end
		end, { item, var8 }) else nil,
		ref = p0.rowRef,
		stateLayer = if var8 then t else nil
	}, {
		Icon = if var9 ~= nil then nil else reactModule.createElement(view, {
			tag = "row align-x-center align-y-center size-1000-1000",
			LayoutOrder = 1,
			testId = "menu-action-row-icon-column"
		}, { Icon = var9 }),
		Label = reactModule.createElement(text, {
			tag = "auto-xy text-body-medium text-align-x-left content-default",
			LayoutOrder = 2,
			Text = var7
		})
	})
end)