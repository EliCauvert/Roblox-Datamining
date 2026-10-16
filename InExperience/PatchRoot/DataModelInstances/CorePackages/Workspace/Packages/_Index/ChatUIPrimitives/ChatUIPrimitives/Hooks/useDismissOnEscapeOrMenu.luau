local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local ReactModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.React)

return function(p1, Callback, p2, p3) --[[ Line: 20 | Named "useDismissOnEscapeOrMenu" ]]
	-- upvalues: UserInputService (copy), GuiService (copy), ReactModule (copy)
	local P1 = p2 or UserInputService
	local P2 = p3 or GuiService
	ReactModule.useEffect(function() --[[ Line: 28 ]]
		-- upvalues: p1 (copy), Callback (copy), P1 (copy), P2 (copy)
		if not p1 then return end
		local Flag = false
		local InputBeganConnection = P1.InputBegan:Connect(function(Input) --[[ Line: 40 ]]
			-- upvalues: Flag (ref), Callback (upval)
			if Input.KeyCode == Enum.KeyCode.Escape or Input.KeyCode == Enum.KeyCode.ButtonB then
				if Flag then return end
				Flag = true
				Callback()
			end
		end)
		local MenuOpenedConnection = P2.MenuOpened:Connect(function() --[[ Line: 33 | Named "dismissOnce" ]]
			-- upvalues: Flag (ref), Callback (upval)
			if not Flag then
				Flag = true
				Callback()
				
				return
			end
		end)
		
		return function() --[[ Line: 46 ]]
			-- upvalues: InputBeganConnection (copy), MenuOpenedConnection (copy)
			InputBeganConnection:Disconnect()
			MenuOpenedConnection:Disconnect()
		end
	end, { p1, Callback, P1, P2 })
end