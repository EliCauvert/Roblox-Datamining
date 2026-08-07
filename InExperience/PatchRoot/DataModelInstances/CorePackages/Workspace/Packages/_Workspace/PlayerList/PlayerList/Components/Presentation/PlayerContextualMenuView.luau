local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local signalsReactModule = require(parent_1.SignalsReact)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local divider = foundationModule.Divider
local useTokens = foundationModule.Hooks.useTokens
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local playerContextualMenuStoreModule = require(parent.Common.PlayerContextualMenuStore)
local playerContextMenuHeaderModule = require(parent.Components.Presentation.PlayerContextMenuHeader)
local menuActionRowModule = require(parent.Components.Presentation.MenuActionRow)
local t = { Transparency = 1, Color3 = Color3.new(0, 0, 0) }
local t_1 = { affordance = stateLayerAffordance.None }

return reactModule.memo(function(p0) --[[ line: 25 | named "PlayerContextualMenuView" ]]
	-- upvalues: signalsReactModule (ref), playerContextualMenuStoreModule (ref), useTokens (ref), reactModule (ref), playerContextMenuHeaderModule (ref), divider (ref), menuActionRowModule (ref), view (ref), t (ref), t_1 (ref)
	local var8 = signalsReactModule.useSignalState(playerContextualMenuStoreModule.getMenuData)
	local var9 = useTokens()
	local var10, var11 = reactModule.useBinding(false)
	local var12 = reactModule.useRef(false)
	local var13 = reactModule.useRef(nil)
	local var14 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 36 ]]
		-- upvalues: var11 (ref), var12 (ref), var8 (ref), var13 (ref), var14 (ref)
		var11(false)
		var12.current = false
		
		if var8 == nil then return end
		local current = var13.current
		
		if current ~= nil and current.AbsoluteSize.Y > 0 then
			var11(true)
			var12.current = true
			
			return
		elseif current == nil then
			return
		end
		var14.current = current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 51 ]]
			-- upvalues: var13 (copy), var14 (copy), var12 (copy), var11 (copy)
			local current = var13.current
			
			if current ~= nil and current.AbsoluteSize.Y > 0 then
				if var14.current then
					var14.current:Disconnect()
					var14.current = nil
				end
				if not var12.current then
					var12.current = true
					var11(true)
				end
			end
		end)
		
		return function() --[[ line: 64 ]]
			-- upvalues: var14 (copy)
			if var14.current then
				var14.current:Disconnect()
				var14.current = nil
			end
		end
	end, { var8 })
	
	if var8 == nil then
		return nil
	end
	local anchorPosition = var8.anchorPosition
	local vector2 = Vector2.new(0.5, 0.5)
	local uDim2 = UDim2.fromScale(0.5, 0.5)
	
	if not p0.isSmallTouchDevice and anchorPosition ~= nil then
		vector2 = Vector2.new(1, 0)
		uDim2 = UDim2.fromOffset(anchorPosition.X - 8, anchorPosition.Y)
	end
	local t_2 = {
		Header = reactModule.createElement(playerContextMenuHeaderModule, { layoutOrder = 1, header = var8.header }),
		HeaderDivider = reactModule.createElement(divider, { LayoutOrder = 2 })
	}
	
	for i, v in ipairs(var8.items) do
		t_2[`Action_{tostring(v.key)}`] = reactModule.createElement(menuActionRowModule, { item = v, layoutOrder = 2 + i })
	end
	return reactModule.createElement(view, { ZIndex = 10, tag = "size-full", backgroundStyle = t }, {
		Backdrop = reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = 1,
			backgroundStyle = if p0.isSmallTouchDevice then var9.Color.Common.Scrim else t,
			onActivated = playerContextualMenuStoreModule.closeContextMenu,
			stateLayer = t_1
		}),
		Menu = reactModule.createElement(view, {
			ZIndex = 2,
			tag = "col align-x-left gap-xxsmall auto-y padding-small stroke-standard stroke-default radius-large bg-over-media-100",
			AnchorPoint = vector2,
			Position = uDim2,
			Size = UDim2.fromOffset(260, 0),
			Visible = var10,
			ref = var13
		}, t_2)
	})
end)