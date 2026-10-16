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
local ConstantsModule = require(Parent.Common.Constants)
local config = {
	affordance = FoundationModule.Enums.StateLayerAffordance.Background
}

return ReactModule.memo(function(p1) --[[ Line: 21 | Named "MenuActionRow" ]]
	-- upvalues: UseTokensFunction (copy), SignalsReactModule (copy), PlayerContextualMenuStoreModule (copy), ReactModule (copy), PlayerListIconModule (copy), View (copy), Text (copy), config (copy), ConstantsModule (copy)
	local UseTokensResult = UseTokensFunction()
	local Item = p1.item
	local UseSignalStateResult = SignalsReactModule.useSignalState(PlayerContextualMenuStoreModule.getPendingConfirmKey)
	local IsUseSignalStateResultMatch: boolean = Item.requiresConfirm == true and UseSignalStateResult == Item.key
	local IsIsInteractable = p1.isInteractable ~= false
	local UseResult = ReactModule.useCallback(function() --[[ Line: 35 ]]
		-- upvalues: IsIsInteractable (copy), PlayerContextualMenuStoreModule (upval), Item (copy)
		if IsIsInteractable then
			PlayerContextualMenuStoreModule.activateMenuItem(Item)
			
			return
		end
	end, { Item, IsIsInteractable })
	local Element = if Item.icon == nil then nil else ReactModule.createElement(PlayerListIconModule, {
		layoutOrder = 1,
		testId = "menu-action-row-icon",
		icon = Item.icon,
		size = UseTokensResult.Size.Size_500
	})
	
	return ReactModule.createElement(View, {
		tag = "row align-x-left align-y-center gap-none size-full-1000 auto-y",
		testId = "menu-action-row",
		LayoutOrder = p1.layoutOrder,
		onActivated = if IsIsInteractable then UseResult else nil,
		ref = p1.rowRef,
		stateLayer = if IsIsInteractable then config else nil,
		selection = ConstantsModule.SELECTABLE
	}, {
		Icon = if Element == nil then nil else ReactModule.createElement(View, {
			tag = "row align-x-center align-y-center size-1000-1000",
			LayoutOrder = 1,
			testId = "menu-action-row-icon-column"
		}, { Icon = Element }),
		Label = ReactModule.createElement(View, {
			tag = "fill auto-y",
			LayoutOrder = 2,
			testId = "menu-action-row-label-column"
		}, {
			Text = ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
				testId = "menu-action-row-label",
				Text = if IsUseSignalStateResultMatch and Item.confirmLabel ~= nil then Item.confirmLabel else Item.label
			})
		})
	})
end)