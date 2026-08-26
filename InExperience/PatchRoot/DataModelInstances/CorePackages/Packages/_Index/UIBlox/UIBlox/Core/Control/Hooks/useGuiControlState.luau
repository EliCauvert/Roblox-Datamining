local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local useForwardRef = require(parent_1.ReactUtils).useForwardRef
local controlStateModule = require(parent.Core.Control.Enum.ControlState)
local controlStateEventModule = require(parent.Core.Control.Enum.ControlStateEvent)
local createGuiControlStateTableModule = require(parent.Core.Control.createGuiControlStateTable)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), controlStateModule (ref), createGuiControlStateTableModule (ref), controlStateEventModule (ref), useForwardRef (ref)
	local var1 = reactModule.useRef(controlStateModule.Initialize)
	local var2 = reactModule.useRef(p3)
	local var3 = reactModule.useRef(false)
	local var4 = reactModule.useCallback(function(p4, p5)
		-- upvalues: var1 (ref), p2 (ref)
		var1.current = p5
		p2(p4, p5)
	end, { p2 })
	local var5 = reactModule.useMemo(function()
		-- upvalues: createGuiControlStateTableModule (copy), var4 (ref)
		return createGuiControlStateTableModule(var4)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var4 (ref)
		var5:onStateChange(var4)
	end, { var4 })
	local var6 = reactModule.useCallback(function(p4)
		-- upvalues: var2 (ref), var5 (ref), controlStateEventModule (copy), var3 (ref)
		local t = {}
		
		if p4 then
			table.insert(t, p4.InputBegan:Connect(function(p5)
				-- upvalues: var2 (copy), var5 (copy), controlStateEventModule (copy)
				if not var2.current then
					return nil
				elseif p5.UserInputType == Enum.UserInputType.MouseButton1 or p5.UserInputType == Enum.UserInputType.Touch or (p5.KeyCode == Enum.KeyCode.ButtonA or p5.KeyCode == Enum.KeyCode.Return) then
					var5.events[controlStateEventModule.PrimaryPressed]()
				end
			end))
			table.insert(t, p4.InputEnded:Connect(function(p5)
				-- upvalues: var2 (copy), var5 (copy), controlStateEventModule (copy)
				if not var2.current then
					return nil
				elseif p5.UserInputType == Enum.UserInputType.MouseButton1 then
					var5.events[controlStateEventModule.PrimaryReleasedHover]()
					
					return
				elseif p5.UserInputType == Enum.UserInputType.Touch or p5.KeyCode == Enum.KeyCode.ButtonA or p5.KeyCode == Enum.KeyCode.Return then
					var5.events[controlStateEventModule.PrimaryReleased]()
				end
			end))
			table.insert(t, p4.SelectionGained:Connect(function()
				-- upvalues: var2 (copy), var5 (copy), controlStateEventModule (copy)
				if var2.current then
					var5.events[controlStateEventModule.SelectionGained]()
					
					return
				end
				return nil
			end))
			table.insert(t, p4.SelectionLost:Connect(function()
				-- upvalues: var2 (copy), var5 (copy), controlStateEventModule (copy)
				if var2.current then
					var5.events[controlStateEventModule.SelectionLost]()
					
					return
				end
				return nil
			end))
			table.insert(t, p4.MouseEnter:Connect(function()
				-- upvalues: var2 (copy), var3 (copy), var5 (copy), controlStateEventModule (copy)
				if var2.current then
					var3.current = true
					var5.events[controlStateEventModule.PointerHover]()
					
					return
				end
				return nil
			end))
			table.insert(t, p4.MouseLeave:Connect(function()
				-- upvalues: var2 (copy), var3 (copy), var5 (copy), controlStateEventModule (copy)
				if var2.current then
					var3.current = false
					var5.events[controlStateEventModule.PointerHoverEnd]()
					
					return
				end
				return nil
			end))
		end
		return function()
			-- upvalues: t (ref)
			for i, v in ipairs(t) do
				v:Disconnect()
			end
		end
	end, { var5, var3 })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), p3 (ref)
		var2.current = p3
	end, { p3 })
	
	return useForwardRef(p1, var6), var5
end