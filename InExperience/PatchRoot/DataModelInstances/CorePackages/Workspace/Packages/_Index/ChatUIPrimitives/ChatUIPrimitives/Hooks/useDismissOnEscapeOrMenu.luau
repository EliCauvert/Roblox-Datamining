local userInputService = game:GetService("UserInputService")
local guiService = game:GetService("GuiService")
local reactModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.React)

return function(p1, p2, p3, p4)
	-- upvalues: userInputService (ref), guiService (ref), reactModule (ref)
	p3 = p3 or userInputService
	p4 = p4 or guiService
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), p2 (ref), p3 (ref), p4 (ref)
		if p1 then
			local var1 = false
			local inputBeganConnection = p3.InputBegan:Connect(function(p5)
				-- upvalues: var1 (write), p2 (copy)
				if p5.KeyCode == Enum.KeyCode.Escape or p5.KeyCode == Enum.KeyCode.ButtonB then
					if var1 then return end
					var1 = true
					p2()
				end
			end)
			local menuOpenedConnection = p4.MenuOpened:Connect(function()
				-- upvalues: var1 (write), p2 (copy)
				if var1 then
					return
				end
				var1 = true
				p2()
			end)
			
			return function()
				-- upvalues: inputBeganConnection (ref), menuOpenedConnection (ref)
				inputBeganConnection:Disconnect()
				menuOpenedConnection:Disconnect()
			end
		end
	end, { p1, p2, p3, p4 })
end