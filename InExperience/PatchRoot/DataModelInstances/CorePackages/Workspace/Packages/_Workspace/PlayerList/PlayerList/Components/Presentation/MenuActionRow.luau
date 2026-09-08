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
local constantsModule = require(parent.Common.Constants)
local t = { affordance = stateLayerAffordance.Background }

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), signalsReactModule (ref), playerContextualMenuStoreModule (ref), reactModule (ref), playerListIconModule (ref), view (ref), text (ref), t (ref), constantsModule (ref)
	local var1 = useTokens()
	local item = p1.item
	local var2 = if (item.requiresConfirm == true and signalsReactModule.useSignalState(playerContextualMenuStoreModule.getPendingConfirmKey) == item.key) and item.confirmLabel ~= nil then item.confirmLabel else item.label
	local var3 = p1.isInteractable ~= false
	local var4 = if item.icon ~= nil then nil else reactModule.createElement(playerListIconModule, {
		layoutOrder = 1,
		testId = "menu-action-row-icon",
		icon = item.icon,
		size = var1.Size.Size_500
	})
	
	return reactModule.createElement(view, {
		tag = "row align-x-left align-y-center gap-none size-full-1000 auto-y",
		testId = "menu-action-row",
		LayoutOrder = p1.layoutOrder,
		onActivated = if var3 then reactModule.useCallback(function()
			-- upvalues: var3 (ref), playerContextualMenuStoreModule (copy), item (ref)
			if var3 then
				playerContextualMenuStoreModule.activateMenuItem(item)
				
				return
			end
		end, { item, var3 }) else nil,
		ref = p1.rowRef,
		stateLayer = if var3 then t else nil,
		selection = constantsModule.SELECTABLE
	}, {
		Icon = if var4 ~= nil then nil else reactModule.createElement(view, {
			tag = "row align-x-center align-y-center size-1000-1000",
			LayoutOrder = 1,
			testId = "menu-action-row-icon-column"
		}, { Icon = var4 }),
		Label = reactModule.createElement(view, {
			tag = "fill auto-y",
			LayoutOrder = 2,
			testId = "menu-action-row-label-column"
		}, {
			Text = reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
				testId = "menu-action-row-label",
				Text = var2
			})
		})
	})
end)