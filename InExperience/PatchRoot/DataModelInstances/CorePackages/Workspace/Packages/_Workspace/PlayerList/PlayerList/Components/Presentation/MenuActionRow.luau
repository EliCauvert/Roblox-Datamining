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

return reactModule.memo(function(p0)
	-- upvalues: useTokens (ref), signalsReactModule (ref), playerContextualMenuStoreModule (ref), reactModule (ref), playerListIconModule (ref), view (ref), text (ref), t (ref), constantsModule (ref)
	local var7 = useTokens()
	local item = p0.item
	local var8 = if (item.requiresConfirm == true and signalsReactModule.useSignalState(playerContextualMenuStoreModule.getPendingConfirmKey) == item.key) and item.confirmLabel ~= nil then item.confirmLabel else item.label
	local var9 = p0.isInteractable ~= false
	local var10 = if item.icon ~= nil then nil else reactModule.createElement(playerListIconModule, {
		layoutOrder = 1,
		testId = "menu-action-row-icon",
		icon = item.icon,
		size = var7.Size.Size_500
	})
	
	return reactModule.createElement(view, {
		tag = "row align-x-left align-y-center gap-none size-full-1000 auto-y",
		testId = "menu-action-row",
		LayoutOrder = p0.layoutOrder,
		onActivated = if var9 then reactModule.useCallback(function()
			-- upvalues: var9 (ref), playerContextualMenuStoreModule (copy), item (ref)
			if var9 then
				playerContextualMenuStoreModule.activateMenuItem(item)
				
				return
			end
		end, { item, var9 }) else nil,
		ref = p0.rowRef,
		stateLayer = if var9 then t else nil,
		selection = constantsModule.SELECTABLE
	}, {
		Icon = if var10 ~= nil then nil else reactModule.createElement(view, {
			tag = "row align-x-center align-y-center size-1000-1000",
			LayoutOrder = 1,
			testId = "menu-action-row-icon-column"
		}, { Icon = var10 }),
		Label = reactModule.createElement(view, {
			tag = "fill auto-y",
			LayoutOrder = 2,
			testId = "menu-action-row-label-column"
		}, {
			Text = reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
				testId = "menu-action-row-label",
				Text = var8
			})
		})
	})
end)