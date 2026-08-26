local parent = script:FindFirstAncestor("SduiCoreSystem").Parent
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local getInputModeStore = responsiveModule.GetInputModeStore

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), getInputModeStore (ref), responsiveModule (ref)
	local guiObject = p1.guiObject
	reactModule.useEffect(function()
		-- upvalues: guiObject (ref), getInputModeStore (copy), responsiveModule (copy), p1 (ref)
		local t = {}
		
		if guiObject then
			table.insert(t, guiObject.MouseEnter:Connect(function()
				-- upvalues: getInputModeStore (copy), responsiveModule (copy), p1 (copy)
				if getInputModeStore(false).getLastInputType(false) == responsiveModule.Input.Pointer then
					p1.setHovered(true)
				end
			end))
			table.insert(t, guiObject.MouseLeave:Connect(function()
				-- upvalues: p1 (copy)
				p1.setHovered(false)
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
	end, { guiObject })
end)