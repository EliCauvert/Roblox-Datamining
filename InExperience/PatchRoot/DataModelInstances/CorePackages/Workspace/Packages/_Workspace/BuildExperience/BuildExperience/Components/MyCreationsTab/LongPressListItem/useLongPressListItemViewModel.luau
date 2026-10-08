local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(script.Parent.LongPressListItemView)
local useMeasurableRef = foundationModule.Hooks.useMeasurableRef
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), useMeasurableRef (ref)
	local var1 = useTokens()
	local var2, var3 = reactModule.useState(nil)
	local var4 = reactModule.useRef(nil)
	local var5 = useMeasurableRef(Vector2.zero, Vector2.zero)
	local var6 = reactModule.useRef(false)
	local onActivated = p1.onActivated
	local onLongPress = p1.onLongPress
	local var7 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), onLongPress (ref)
		local current = var4.current
		
		if current ~= nil then
			onLongPress(current, false)
		end
	end, { onLongPress })
	local var8 = reactModule.useCallback(function(_, p2)
		-- upvalues: var7 (ref), var5 (ref), onLongPress (ref)
		if p2.UserInputType == Enum.UserInputType.MouseButton2 then
			local current = var5.current
			current:SetPosition(Vector2.new(p2.Position.X, p2.Position.Y))
			onLongPress(current, true)
			
			return
		end
		var7()
	end, { onLongPress, var7 })
	local var9 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), onActivated (ref)
		if var6.current then
			var6.current = false
			
			return
		end
		onActivated()
	end, { onActivated })
	local var10 = reactModule.useCallback(function()
		-- upvalues: var6 (ref)
		var6.current = false
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var6 (ref), var7 (ref)
		if var2 == nil then
			return nil
		end
		local touchLongPressConnection = var2.TouchLongPress:Connect(function(_, p2)
			-- upvalues: var6 (copy), var7 (copy)
			if p2 == Enum.UserInputState.Begin then
				var6.current = true
				var7()
			end
		end)
		
		return function()
			-- upvalues: touchLongPressConnection (ref)
			touchLongPressConnection:Disconnect()
		end
	end, { var2, var7 })
	
	return {
		LayoutOrder = p1.LayoutOrder,
		bleed = UDim.new(0, -var1.Padding.Small),
		isHighlighted = p1.isHighlighted,
		pressableRef = var3,
		anchorRef = var4,
		onActivated = var9,
		onStateChanged = var10,
		onSecondaryActivated = var8,
		testId = p1.testId,
		children = p1.children
	}
end