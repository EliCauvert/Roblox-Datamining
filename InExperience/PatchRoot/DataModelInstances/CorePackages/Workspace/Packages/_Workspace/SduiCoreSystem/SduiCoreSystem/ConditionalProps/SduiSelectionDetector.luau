local ReactModule = require(script:FindFirstAncestor("SduiCoreSystem").Parent.React)

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy)
	local GuiObject = p1.guiObject
	local SetSelectedFunction = p1.setSelected
	ReactModule.useEffect(function()
		-- upvalues: GuiObject (copy), SetSelectedFunction (copy)
		local List = {}
		
		if GuiObject then
			table.insert(List, GuiObject.SelectionGained:Connect(function()
				-- upvalues: SetSelectedFunction (upval)
				SetSelectedFunction(true)
			end))
			table.insert(List, GuiObject.SelectionLost:Connect(function()
				-- upvalues: SetSelectedFunction (upval)
				SetSelectedFunction(false)
			end))
		end
		return function()
			-- upvalues: List (copy)
			for _, Connection in List do
				if Connection then
					Connection:Disconnect()
				end
			end
		end
	end, { GuiObject, SetSelectedFunction })
end)