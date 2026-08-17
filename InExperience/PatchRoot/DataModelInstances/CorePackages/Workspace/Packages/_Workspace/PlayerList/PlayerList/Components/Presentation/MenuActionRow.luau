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
local fFlagPlayerListReskinContextMenuIconLayoutModule = require(parent.Flags.FFlagPlayerListReskinContextMenuIconLayout)
local t = { affordance = stateLayerAffordance.None }
local t_1 = { affordance = stateLayerAffordance.Background }

return reactModule.memo(function(p0) --[[ line: 25 | named "MenuActionRow" ]]
	-- upvalues: useTokens (ref), signalsReactModule (ref), playerContextualMenuStoreModule (ref), reactModule (ref), playerListIconModule (ref), fFlagPlayerListReskinContextMenuIconLayoutModule (ref), view (ref), text (ref), t_1 (ref), t (ref)
	local item = p0.item
	local var8 = if item.icon ~= nil then nil else reactModule.createElement(playerListIconModule, {
		layoutOrder = 1,
		testId = "menu-action-row-icon",
		icon = item.icon,
		size = useTokens().Size.Size_500
	})
	
	return reactModule.createElement(view, {
		LayoutOrder = p0.layoutOrder,
		onActivated = reactModule.useCallback(function() --[[ line: 36 ]]
			-- upvalues: playerContextualMenuStoreModule (copy), item (ref)
			playerContextualMenuStoreModule.activateMenuItem(item)
		end, { item }),
		tag = {
			["row align-x-left align-y-center size-full-1000 auto-y"] = true,
			["gap-none"] = fFlagPlayerListReskinContextMenuIconLayoutModule,
			["gap-medium"] = not fFlagPlayerListReskinContextMenuIconLayoutModule
		},
		stateLayer = if fFlagPlayerListReskinContextMenuIconLayoutModule then t_1 else t
	}, {
		Icon = if fFlagPlayerListReskinContextMenuIconLayoutModule and var8 ~= nil then reactModule.createElement(view, {
			tag = "row align-x-center align-y-center size-1000-1000",
			LayoutOrder = 1,
			testId = "menu-action-row-icon-column"
		}, { Icon = var8 }) else var8,
		Label = reactModule.createElement(text, {
			tag = "auto-xy text-body-medium text-align-x-left content-default",
			LayoutOrder = 2,
			Text = if (item.requiresConfirm == true and signalsReactModule.useSignalState(playerContextualMenuStoreModule.getPendingConfirmKey) == item.key) and item.confirmLabel ~= nil then item.confirmLabel else item.label
		})
	})
end)