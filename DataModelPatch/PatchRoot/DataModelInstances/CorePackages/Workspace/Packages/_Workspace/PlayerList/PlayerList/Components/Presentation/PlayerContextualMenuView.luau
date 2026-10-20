local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local SignalsReactModule = require(Parent1.SignalsReact)
local FoundationModule = require(Parent1.Foundation)
local View = FoundationModule.View
local Divider = FoundationModule.Divider
local UseTokensFunction = FoundationModule.Hooks.useTokens
local PlayerContextualMenuStoreModule = require(Parent.Common.PlayerContextualMenuStore)
local PlayerContextMenuHeaderModule = require(Parent.Components.Presentation.PlayerContextMenuHeader)
local MenuActionRowModule = require(Parent.Components.Presentation.MenuActionRow)
local BackgroundStyle = { Transparency = 1, Color3 = Color3.new(0, 0, 0) }
local StateLayer = {
	affordance = FoundationModule.Enums.StateLayerAffordance.None
}

return ReactModule.memo(function(p1)
	-- upvalues: SignalsReactModule (copy), PlayerContextualMenuStoreModule (copy), UseTokensFunction (copy), ReactModule (copy), PlayerContextMenuHeaderModule (copy), Divider (copy), MenuActionRowModule (copy), View (copy), BackgroundStyle (copy), StateLayer (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(PlayerContextualMenuStoreModule.getMenuData)
	local UseTokensResult = UseTokensFunction()
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(false)
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseBindingResult2 (copy), UseRefResult (copy), UseSignalStateResult (copy), UseRefResult1 (copy), UseRefResult2 (copy)
		UseBindingResult2(false)
		UseRefResult.current = false
		
		if UseSignalStateResult == nil then return end
		local Current = UseRefResult1.current
		
		if Current ~= nil and Current.AbsoluteSize.Y > 0 then
			UseBindingResult2(true)
			UseRefResult.current = true
			
			return
		end
		if Current == nil then return end
		UseRefResult2.current = Current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			-- upvalues: UseRefResult1 (upval), UseRefResult2 (upval), UseRefResult (upval), UseBindingResult2 (upval)
			local Current = UseRefResult1.current
			
			if Current ~= nil and Current.AbsoluteSize.Y > 0 then
				if UseRefResult2.current then
					UseRefResult2.current:Disconnect()
					UseRefResult2.current = nil
				end
				if not UseRefResult.current then
					UseRefResult.current = true
					UseBindingResult2(true)
				end
			end
		end)
		
		return function()
			-- upvalues: UseRefResult2 (upval)
			if UseRefResult2.current then
				UseRefResult2.current:Disconnect()
				UseRefResult2.current = nil
			end
		end
	end, { UseSignalStateResult })
	
	if UseSignalStateResult == nil then
		return nil
	end
	local AnchorPosition = UseSignalStateResult.anchorPosition
	local _Vector2 = Vector2.new(0.5, 0.5)
	local _UDim2 = UDim2.fromScale(0.5, 0.5)
	
	if not p1.isSmallTouchDevice and AnchorPosition ~= nil then
		_Vector2 = Vector2.new(1, 0)
		_UDim2 = UDim2.fromOffset(AnchorPosition.X - 8, AnchorPosition.Y)
	end
	local config = {
		Header = ReactModule.createElement(PlayerContextMenuHeaderModule, { layoutOrder = 1, header = UseSignalStateResult.header }),
		HeaderDivider = ReactModule.createElement(Divider, { LayoutOrder = 2 })
	}
	
	for i, item in ipairs(UseSignalStateResult.items) do
		config[`Action_{tostring(item.key)}`] = ReactModule.createElement(MenuActionRowModule, { item = item, layoutOrder = 2 + i })
	end
	return ReactModule.createElement(View, {
		ZIndex = 10,
		tag = "size-full",
		backgroundStyle = BackgroundStyle
	}, {
		Backdrop = ReactModule.createElement(View, {
			tag = "size-full",
			ZIndex = 1,
			backgroundStyle = if p1.isSmallTouchDevice then UseTokensResult.Color.Common.Scrim else BackgroundStyle,
			onActivated = PlayerContextualMenuStoreModule.closeContextMenu,
			stateLayer = StateLayer
		}),
		Menu = ReactModule.createElement(View, {
			ZIndex = 2,
			tag = "col align-x-left gap-xxsmall auto-y padding-small stroke-standard stroke-default radius-large bg-over-media-100",
			AnchorPoint = _Vector2,
			Position = _UDim2,
			Size = UDim2.fromOffset(260, 0),
			Visible = UseBindingResult,
			ref = UseRefResult1
		}, config)
	})
end)