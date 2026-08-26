local reactModule = require(script:FindFirstAncestor("SduiCoreSystem").Parent.React)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref)
	local guiObject = p1.guiObject
	local setSelected = p1.setSelected
	reactModule.useEffect(function()
		-- upvalues: guiObject (ref), setSelected (ref)
		local t = {}
		
		if guiObject then
			table.insert(t, guiObject.SelectionGained:Connect(function()
				-- upvalues: setSelected (copy)
				setSelected(true)
			end))
			table.insert(t, guiObject.SelectionLost:Connect(function()
				-- upvalues: setSelected (copy)
				setSelected(false)
			end))
		end
		return function()
			-- upvalues: t (ref)
			for i, v in t do
				if v then
					v:Disconnect()
				end
			end
		end
	end, { guiObject, setSelected })
end)