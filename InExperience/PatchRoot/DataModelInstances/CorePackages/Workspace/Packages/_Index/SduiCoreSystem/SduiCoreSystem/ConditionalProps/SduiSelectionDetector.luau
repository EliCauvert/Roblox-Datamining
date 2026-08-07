local reactModule = require(script:FindFirstAncestor("SduiCoreSystem").Parent.React)

return reactModule.memo(function(p0) --[[ line: 10 | named "SduiSelectionDetector" ]]
	-- upvalues: reactModule (ref)
	local guiObject = p0.guiObject
	local setSelected = p0.setSelected
	reactModule.useEffect(function() --[[ line: 14 ]]
		-- upvalues: guiObject (ref), setSelected (ref)
		local t = {}
		
		if guiObject then
			table.insert(t, guiObject.SelectionGained:Connect(function() --[[ line: 19 ]]
				-- upvalues: setSelected (copy)
				setSelected(true)
			end))
			table.insert(t, guiObject.SelectionLost:Connect(function() --[[ line: 25 ]]
				-- upvalues: setSelected (copy)
				setSelected(false)
			end))
		end
		return function() --[[ line: 30 ]]
			-- upvalues: t (ref)
			for i, v in t do
				if v then
					v:Disconnect()
				end
			end
		end
	end, { guiObject, setSelected })
end)