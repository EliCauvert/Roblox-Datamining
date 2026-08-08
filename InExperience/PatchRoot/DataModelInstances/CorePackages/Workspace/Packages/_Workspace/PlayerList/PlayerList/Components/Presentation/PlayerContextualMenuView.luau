local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local contextActionService = game:GetService("ContextActionService")
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
local fFlagPlayerListReskinConsoleFocusNavModule = require(parent.Flags.FFlagPlayerListReskinConsoleFocusNav)
local t = { Transparency = 1, Color3 = Color3.new(0, 0, 0) }
local t_1 = { affordance = stateLayerAffordance.None }

return reactModule.memo(function(p0) --[[ line: 31 | named "PlayerContextualMenuView" ]]
	-- upvalues: signalsReactModule (ref), playerContextualMenuStoreModule (ref), useTokens (ref), reactModule (ref), fFlagPlayerListReskinConsoleFocusNavModule (ref), contextActionService (ref), playerContextMenuHeaderModule (ref), divider (ref), menuActionRowModule (ref), view (ref), t (ref), t_1 (ref)
	local var10 = signalsReactModule.useSignalState(playerContextualMenuStoreModule.getMenuData)
	local var11 = useTokens()
	local var12, var13 = reactModule.useBinding(false)
	local var14 = reactModule.useRef(false)
	local var15 = reactModule.useRef(nil)
	local var16 = reactModule.useRef(nil)
	local var17 = var10 ~= nil
	local contextActionServiceOverride = p0.contextActionServiceOverride
	reactModule.useEffect(function() --[[ line: 61 ]]
		-- upvalues: fFlagPlayerListReskinConsoleFocusNavModule (copy), p0 (ref), var17 (ref), contextActionServiceOverride (ref), contextActionService (copy), playerContextualMenuStoreModule (copy)
		if fFlagPlayerListReskinConsoleFocusNavModule and p0.isSmallTouchDevice and var17 then
			local contextActionServiceOverride_1 = contextActionServiceOverride or contextActionService
			contextActionServiceOverride_1:BindCoreAction("RbxPlayerListReskinGamepadMenuClose", function(_, p1, _) --[[ line: 66 ]]
				-- upvalues: playerContextualMenuStoreModule (copy)
				if p1 == Enum.UserInputState.Begin then
					playerContextualMenuStoreModule.closeContextMenu()
					
					return Enum.ContextActionResult.Sink
				end
				return Enum.ContextActionResult.Pass
			end, false, Enum.KeyCode.ButtonB)
			
			return function() --[[ line: 73 ]]
				-- upvalues: contextActionServiceOverride_1 (ref)
				contextActionServiceOverride_1:UnbindCoreAction("RbxPlayerListReskinGamepadMenuClose")
			end
		end
		return function() --[[ line: 63 ]] end
	end, {
		var17,
		p0.isSmallTouchDevice,
		contextActionServiceOverride
	})
	reactModule.useEffect(function() --[[ line: 78 ]]
		-- upvalues: var13 (ref), var14 (ref), var10 (ref), var15 (ref), var16 (ref)
		var13(false)
		var14.current = false
		
		if var10 == nil then return end
		local current = var15.current
		
		if current ~= nil and current.AbsoluteSize.Y > 0 then
			var13(true)
			var14.current = true
			
			return
		elseif current == nil then
			return
		end
		var16.current = current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 93 ]]
			-- upvalues: var15 (copy), var16 (copy), var14 (copy), var13 (copy)
			local current = var15.current
			
			if current ~= nil and current.AbsoluteSize.Y > 0 then
				if var16.current then
					var16.current:Disconnect()
					var16.current = nil
				end
				if not var14.current then
					var14.current = true
					var13(true)
				end
			end
		end)
		
		return function() --[[ line: 106 ]]
			-- upvalues: var16 (copy)
			if var16.current then
				var16.current:Disconnect()
				var16.current = nil
			end
		end
	end, { var10 })
	
	if var10 == nil then
		return nil
	end
	local anchorPosition = var10.anchorPosition
	local vector2 = Vector2.new(0.5, 0.5)
	local uDim2 = UDim2.fromScale(0.5, 0.5)
	
	if not p0.isSmallTouchDevice and anchorPosition ~= nil then
		vector2 = Vector2.new(1, 0)
		uDim2 = UDim2.fromOffset(anchorPosition.X - 8, anchorPosition.Y)
	end
	local t_2 = {
		Header = reactModule.createElement(playerContextMenuHeaderModule, { layoutOrder = 1, header = var10.header }),
		HeaderDivider = reactModule.createElement(divider, { LayoutOrder = 2 })
	}
	
	for i, v in ipairs(var10.items) do
		t_2[`Action_{tostring(v.key)}`] = reactModule.createElement(menuActionRowModule, { item = v, layoutOrder = 2 + i })
	end
	return reactModule.createElement(view, { ZIndex = 10, tag = "size-full", backgroundStyle = t }, {
		Backdrop = reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = 1,
			backgroundStyle = if p0.isSmallTouchDevice then var11.Color.Common.Scrim else t,
			onActivated = playerContextualMenuStoreModule.closeContextMenu,
			stateLayer = t_1
		}),
		Menu = reactModule.createElement(view, {
			ZIndex = 2,
			tag = "col align-x-left gap-xxsmall auto-y padding-small stroke-standard stroke-default radius-large bg-over-media-100",
			AnchorPoint = vector2,
			Position = uDim2,
			Size = UDim2.fromOffset(260, 0),
			Visible = var12,
			ref = var15
		}, t_2)
	})
end)