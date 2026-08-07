local guiService = game:GetService("GuiService")
local reactModule = require(script:FindFirstAncestor("GuiObjectUtils").Parent.React)

local function _(p0) --[[ line: 12 | named "isGuiObjectSelected" ]]
	-- upvalues: guiService (ref)
	return if p0.current == nil then false elseif guiService.SelectedCoreObject ~= p0.current then guiService.SelectedObject == p0.current else true
end

return function(p1) --[[ line: 19 | named "useSelected" ]]
	-- upvalues: reactModule (ref), guiService (ref)
	local var2, var3 = reactModule.useState(function() --[[ line: 20 ]]
		-- upvalues: p1 (ref), guiService (copy)
		return if p1.current == nil then false elseif guiService.SelectedCoreObject ~= p1.current then guiService.SelectedObject == p1.current else true
	end)
	reactModule.useEffect(function() --[[ line: 25 ]]
		-- upvalues: var3 (ref), p1 (ref), guiService (copy)
		var3(if p1.current == nil then false elseif guiService.SelectedCoreObject ~= p1.current then guiService.SelectedObject == p1.current else true)
	end, { p1 })
	reactModule.useEffect(function() --[[ line: 33 ]]
		-- upvalues: p1 (ref), var3 (ref)
		local t = {}
		local current = p1.current
		
		if current then
			table.insert(t, current.SelectionGained:Connect(function() --[[ line: 39 ]]
				-- upvalues: var3 (copy)
				var3(true)
			end))
			table.insert(t, current.SelectionLost:Connect(function() --[[ line: 45 ]]
				-- upvalues: var3 (copy)
				var3(false)
			end))
		end
		return function() --[[ line: 51 ]]
			-- upvalues: t (ref)
			for i, v in ipairs(t) do
				v:Disconnect()
			end
		end
	end, { p1 })
	
	return var2
end