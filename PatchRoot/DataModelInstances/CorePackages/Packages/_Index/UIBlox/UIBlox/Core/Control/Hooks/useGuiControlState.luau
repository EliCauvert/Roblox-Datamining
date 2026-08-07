-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:02 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local useForwardRef = require(parent_1.ReactUtils).useForwardRef
local controlStateModule = require(parent.Core.Control.Enum.ControlState)
local controlStateEventModule = require(parent.Core.Control.Enum.ControlStateEvent)
local createGuiControlStateTableModule = require(parent.Core.Control.createGuiControlStateTable)

return function(p0, p1, p2) --[[ line: 20 | named "useGuiControlState" ]]
	-- upvalues: reactModule (ref), controlStateModule (ref), createGuiControlStateTableModule (ref), controlStateEventModule (ref), useForwardRef (ref)
	local var4 = reactModule.useRef(controlStateModule.Initialize)
	local var5 = reactModule.useRef(p2)
	local var6 = reactModule.useRef(false)
	local var7 = reactModule.useCallback(function(p3, p4) --[[ line: 35 ]]
		-- upvalues: var4 (ref), p1 (ref)
		var4.current = p4
		p1(p3, p4)
	end, { p1 })
	local var8 = reactModule.useMemo(function() --[[ line: 40 ]]
		-- upvalues: createGuiControlStateTableModule (copy), var7 (ref)
		return createGuiControlStateTableModule(var7)
	end, {})
	reactModule.useEffect(function() --[[ line: 44 ]]
		-- upvalues: var8 (ref), var7 (ref)
		var8:onStateChange(var7)
	end, { var7 })
	local var9 = reactModule.useCallback(function(p5) --[[ line: 48 ]]
		-- upvalues: var5 (ref), var8 (ref), controlStateEventModule (copy), var6 (ref)
		local t = {}
		
		if p5 then
			table.insert(t, p5.InputBegan:Connect(function(p6) --[[ line: 66 ]]
				-- upvalues: var5 (copy), var8 (copy), controlStateEventModule (copy)
				if not var5.current then
					return nil
				elseif p6.UserInputType == Enum.UserInputType.MouseButton1 or p6.UserInputType == Enum.UserInputType.Touch or (p6.KeyCode == Enum.KeyCode.ButtonA or p6.KeyCode == Enum.KeyCode.Return) then
					var8.events[controlStateEventModule.PrimaryPressed]()
				end
			end))
			table.insert(t, p5.InputEnded:Connect(function(p7) --[[ line: 82 ]]
				-- upvalues: var5 (copy), var8 (copy), controlStateEventModule (copy)
				if not var5.current then
					return nil
				elseif p7.UserInputType == Enum.UserInputType.MouseButton1 then
					var8.events[controlStateEventModule.PrimaryReleasedHover]()
					
					return
				elseif p7.UserInputType == Enum.UserInputType.Touch or p7.KeyCode == Enum.KeyCode.ButtonA or p7.KeyCode == Enum.KeyCode.Return then
					var8.events[controlStateEventModule.PrimaryReleased]()
				end
			end))
			table.insert(t, p5.SelectionGained:Connect(function() --[[ line: 101 ]]
				-- upvalues: var5 (copy), var8 (copy), controlStateEventModule (copy)
				if var5.current then
					var8.events[controlStateEventModule.SelectionGained]()
					
					return
				end
				return nil
			end))
			table.insert(t, p5.SelectionLost:Connect(function() --[[ line: 110 ]]
				-- upvalues: var5 (copy), var8 (copy), controlStateEventModule (copy)
				if var5.current then
					var8.events[controlStateEventModule.SelectionLost]()
					
					return
				end
				return nil
			end))
			table.insert(t, p5.MouseEnter:Connect(function() --[[ line: 121 ]]
				-- upvalues: var5 (copy), var6 (copy), var8 (copy), controlStateEventModule (copy)
				if var5.current then
					var6.current = true
					var8.events[controlStateEventModule.PointerHover]()
					
					return
				end
				return nil
			end))
			table.insert(t, p5.MouseLeave:Connect(function() --[[ line: 131 ]]
				-- upvalues: var5 (copy), var6 (copy), var8 (copy), controlStateEventModule (copy)
				if var5.current then
					var6.current = false
					var8.events[controlStateEventModule.PointerHoverEnd]()
					
					return
				end
				return nil
			end))
		end
		return function() --[[ line: 141 ]]
			-- upvalues: t (ref)
			for i, v in ipairs(t) do
				v:Disconnect()
			end
		end
	end, { var8, var6 })
	reactModule.useEffect(function() --[[ line: 148 ]]
		-- upvalues: var5 (ref), p2 (ref)
		var5.current = p2
	end, { p2 })
	
	return useForwardRef(p0, var9), var8
end