local parent = script:FindFirstAncestor("SduiCoreSystem").Parent
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local getInputModeStore = responsiveModule.GetInputModeStore

return reactModule.memo(function(p0) --[[ line: 12 | named "SduiHoverDetector" ]]
	-- upvalues: reactModule (ref), getInputModeStore (ref), responsiveModule (ref)
	local guiObject = p0.guiObject
	reactModule.useEffect(function() --[[ line: 18 ]]
		-- upvalues: guiObject (ref), getInputModeStore (copy), responsiveModule (copy), p0 (ref)
		local t = {}
		
		if guiObject then
			table.insert(t, guiObject.MouseEnter:Connect(function() --[[ line: 23 ]]
				-- upvalues: getInputModeStore (copy), responsiveModule (copy), p0 (copy)
				if getInputModeStore(false).getLastInputType(false) == responsiveModule.Input.Pointer then
					p0.setHovered(true)
				end
			end))
			table.insert(t, guiObject.MouseLeave:Connect(function() --[[ line: 33 ]]
				-- upvalues: p0 (copy)
				p0.setHovered(false)
			end))
		end
		return function() --[[ line: 38 ]]
			-- upvalues: t (ref)
			for i, v in t do
				if v then
					v:Disconnect()
				end
			end
		end
	end, { guiObject })
end)