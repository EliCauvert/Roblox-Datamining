local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local signalsReactModule = require(parent_1.SignalsReact)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local divider = foundationModule.Divider
local useTokens = foundationModule.Hooks.useTokens
local playerContextualMenuStoreModule = require(parent.Common.PlayerContextualMenuStore)
local playerContextMenuHeaderModule = require(parent.Components.Presentation.PlayerContextMenuHeader)
local menuActionRowModule = require(parent.Components.Presentation.MenuActionRow)

return reactModule.memo(function(p0) --[[ line: 28 | named "PlayerContextualMenuView" ]]
	-- upvalues: signalsReactModule (ref), playerContextualMenuStoreModule (ref), useTokens (ref), reactModule (ref), playerContextMenuHeaderModule (ref), divider (ref), menuActionRowModule (ref), view (ref)
	local var6 = signalsReactModule.useSignalState(playerContextualMenuStoreModule.getMenuData)
	local var7 = useTokens()
	
	if var6 == nil then
		return nil
	end
	local anchorPosition = var6.anchorPosition
	local vector2 = Vector2.new(0.5, 0.5)
	local uDim2 = UDim2.fromScale(0.5, 0.5)
	
	if not p0.isSmallTouchDevice and anchorPosition ~= nil then
		vector2 = Vector2.new(1, 0)
		uDim2 = UDim2.fromOffset(anchorPosition.X - 8, anchorPosition.Y)
	end
	local t = {
		Header = reactModule.createElement(playerContextMenuHeaderModule, { layoutOrder = 1, header = var6.header }),
		HeaderDivider = reactModule.createElement(divider, { LayoutOrder = 2 })
	}
	
	for i, v in ipairs(var6.items) do
		t[`Action_{tostring(v.key)}`] = reactModule.createElement(menuActionRowModule, {
			label = v.label,
			icon = v.icon,
			onActivated = v.onActivated,
			layoutOrder = 2 + i
		})
	end
	return reactModule.createElement(view, { ZIndex = 10, tag = "size-full" }, {
		Backdrop = reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = 1,
			backgroundStyle = if p0.isSmallTouchDevice then var7.Color.Common.Scrim else nil,
			onActivated = playerContextualMenuStoreModule.closeContextMenu
		}),
		Menu = reactModule.createElement(view, {
			ZIndex = 2,
			tag = "col align-x-left gap-xxsmall auto-y padding-small stroke-standard stroke-default radius-large bg-over-media-100",
			AnchorPoint = vector2,
			Position = uDim2,
			Size = UDim2.fromOffset(260, 0)
		}, t)
	})
end)