local Parent = script:FindFirstAncestor("SduiCoreSystem").Parent
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local GetInputModeStoreFunction = ResponsiveModule.GetInputModeStore

return ReactModule.memo(function(p1) --[[ Line: 12 | Named "SduiHoverDetector" ]]
	-- upvalues: ReactModule (copy), GetInputModeStoreFunction (copy), ResponsiveModule (copy)
	local GuiObject = p1.guiObject
	ReactModule.useEffect(function() --[[ Line: 18 ]]
		-- upvalues: GuiObject (copy), GetInputModeStoreFunction (upval), ResponsiveModule (upval), p1 (copy)
		local List = {}
		
		if GuiObject then
			table.insert(List, GuiObject.MouseEnter:Connect(function() --[[ Line: 23 ]]
				-- upvalues: GetInputModeStoreFunction (upval), ResponsiveModule (upval), p1 (upval)
				if GetInputModeStoreFunction(false).getLastInputType(false) == ResponsiveModule.Input.Pointer then
					p1.setHovered(true)
				end
			end))
			table.insert(List, GuiObject.MouseLeave:Connect(function() --[[ Line: 33 ]]
				-- upvalues: p1 (upval)
				p1.setHovered(false)
			end))
		end
		return function() --[[ Line: 38 ]]
			-- upvalues: List (copy)
			for _, Connection in List do
				if Connection then
					Connection:Disconnect()
				end
			end
		end
	end, { GuiObject })
end)