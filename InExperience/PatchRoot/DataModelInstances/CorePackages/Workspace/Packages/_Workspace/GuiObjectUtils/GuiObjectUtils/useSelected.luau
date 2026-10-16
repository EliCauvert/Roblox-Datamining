local GuiService = game:GetService("GuiService")
local ReactModule = require(script:FindFirstAncestor("GuiObjectUtils").Parent.React)

local function _(p1): boolean --[[ Line: 12 | Named "isGuiObjectSelected" ]]
	-- upvalues: GuiService (copy)
	return p1.current ~= nil and (GuiService.SelectedCoreObject == p1.current or GuiService.SelectedObject == p1.current)
end

return function(p1) --[[ Line: 19 | Named "useSelected" ]]
	-- upvalues: ReactModule (copy), GuiService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function(): boolean --[[ Line: 20 ]]
		-- upvalues: p1 (copy), GuiService (upval)
		return p1.current ~= nil and (GuiService.SelectedCoreObject == p1.current or GuiService.SelectedObject == p1.current)
	end)
	ReactModule.useEffect(function() --[[ Line: 25 ]]
		-- upvalues: UseStateResult2 (copy), p1 (copy), GuiService (upval)
		UseStateResult2(p1.current ~= nil and (GuiService.SelectedCoreObject == p1.current or GuiService.SelectedObject == p1.current))
	end, { p1 })
	ReactModule.useEffect(function() --[[ Line: 33 ]]
		-- upvalues: p1 (copy), UseStateResult2 (copy)
		local List = {}
		local Current = p1.current
		
		if Current then
			table.insert(List, Current.SelectionGained:Connect(function() --[[ Line: 39 ]]
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(true)
			end))
			table.insert(List, Current.SelectionLost:Connect(function() --[[ Line: 45 ]]
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(false)
			end))
		end
		return function() --[[ Line: 51 ]]
			-- upvalues: List (copy)
			for _, Connection in ipairs(List) do
				Connection:Disconnect()
			end
		end
	end, { p1 })
	
	return UseStateResult
end