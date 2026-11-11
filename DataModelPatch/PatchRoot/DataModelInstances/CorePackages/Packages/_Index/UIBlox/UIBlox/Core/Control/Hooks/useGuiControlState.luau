local Parent = script.Parent.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local UseForwardRefFunction = require(Parent1.ReactUtils).useForwardRef
local ControlStateModule = require(Parent.Core.Control.Enum.ControlState)
local ControlStateEventModule = require(Parent.Core.Control.Enum.ControlStateEvent)
local CreateGuiControlStateTableModule = require(Parent.Core.Control.createGuiControlStateTable)

return function(p1, Callback, Current)
	-- upvalues: ReactModule (copy), ControlStateModule (copy), CreateGuiControlStateTableModule (copy), ControlStateEventModule (copy), UseForwardRefFunction (copy)
	local UseRefResult = ReactModule.useRef(ControlStateModule.Initialize)
	local UseRefResult1 = ReactModule.useRef(Current)
	local UseRefResult2 = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function(p2, Current)
		-- upvalues: UseRefResult (copy), Callback (copy)
		UseRefResult.current = Current
		Callback(p2, Current)
	end, { Callback })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CreateGuiControlStateTableModule (upval), UseResult (copy)
		return CreateGuiControlStateTableModule(UseResult)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), UseResult (copy)
		UseMemoResult:onStateChange(UseResult)
	end, { UseResult })
	local UseResult1 = ReactModule.useCallback(function(Frame: Frame)
		-- upvalues: UseRefResult1 (copy), UseMemoResult (copy), ControlStateEventModule (upval), UseRefResult2 (copy)
		local List = {}
		
		if Frame then
			table.insert(List, Frame.InputBegan:Connect(function(Input)
				-- upvalues: UseRefResult1 (upval), UseMemoResult (upval), ControlStateEventModule (upval)
				if not UseRefResult1.current then
					return nil
				elseif Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch or Input.KeyCode == Enum.KeyCode.ButtonA or Input.KeyCode == Enum.KeyCode.Return then
					UseMemoResult.events[ControlStateEventModule.PrimaryPressed]()
				end
			end))
			table.insert(List, Frame.InputEnded:Connect(function(Input)
				-- upvalues: UseRefResult1 (upval), UseMemoResult (upval), ControlStateEventModule (upval)
				if not UseRefResult1.current then
					return nil
				elseif Input.UserInputType == Enum.UserInputType.MouseButton1 then
					UseMemoResult.events[ControlStateEventModule.PrimaryReleasedHover]()
					
					return
				else
					if Input.UserInputType == Enum.UserInputType.Touch or Input.KeyCode == Enum.KeyCode.ButtonA or Input.KeyCode == Enum.KeyCode.Return then
						UseMemoResult.events[ControlStateEventModule.PrimaryReleased]()
					end
				end
			end))
			table.insert(List, Frame.SelectionGained:Connect(function()
				-- upvalues: UseRefResult1 (upval), UseMemoResult (upval), ControlStateEventModule (upval)
				if UseRefResult1.current then
					UseMemoResult.events[ControlStateEventModule.SelectionGained]()
					
					return
				else
					return nil
				end
			end))
			table.insert(List, Frame.SelectionLost:Connect(function()
				-- upvalues: UseRefResult1 (upval), UseMemoResult (upval), ControlStateEventModule (upval)
				if UseRefResult1.current then
					UseMemoResult.events[ControlStateEventModule.SelectionLost]()
					
					return
				else
					return nil
				end
			end))
			table.insert(List, Frame.MouseEnter:Connect(function()
				-- upvalues: UseRefResult1 (upval), UseRefResult2 (upval), UseMemoResult (upval), ControlStateEventModule (upval)
				if UseRefResult1.current then
					UseRefResult2.current = true
					UseMemoResult.events[ControlStateEventModule.PointerHover]()
					
					return
				else
					return nil
				end
			end))
			table.insert(List, Frame.MouseLeave:Connect(function()
				-- upvalues: UseRefResult1 (upval), UseRefResult2 (upval), UseMemoResult (upval), ControlStateEventModule (upval)
				if UseRefResult1.current then
					UseRefResult2.current = false
					UseMemoResult.events[ControlStateEventModule.PointerHoverEnd]()
					
					return
				else
					return nil
				end
			end))
		end
		return function()
			-- upvalues: List (copy)
			for _, Connection in ipairs(List) do
				Connection:Disconnect()
			end
		end
	end, { UseMemoResult, UseRefResult2 })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), Current (copy)
		UseRefResult1.current = Current
	end, { Current })
	
	return UseForwardRefFunction(p1, UseResult1), UseMemoResult
end