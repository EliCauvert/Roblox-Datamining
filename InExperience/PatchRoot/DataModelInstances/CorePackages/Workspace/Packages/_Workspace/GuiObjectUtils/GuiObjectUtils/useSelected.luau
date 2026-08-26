local guiService = game:GetService("GuiService")
local reactModule = require(script:FindFirstAncestor("GuiObjectUtils").Parent.React)

local function _(p1)
	-- upvalues: guiService (ref)
	return if p1.current == nil then false elseif guiService.SelectedCoreObject ~= p1.current then guiService.SelectedObject == p1.current else true
end

return function(p1)
	-- upvalues: reactModule (ref), guiService (ref)
	local var1, var2 = reactModule.useState(function()
		-- upvalues: p1 (ref), guiService (copy)
		return if p1.current == nil then false elseif guiService.SelectedCoreObject ~= p1.current then guiService.SelectedObject == p1.current else true
	end)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), p1 (ref), guiService (copy)
		var2(if p1.current == nil then false elseif guiService.SelectedCoreObject ~= p1.current then guiService.SelectedObject == p1.current else true)
	end, { p1 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref)
		local t = {}
		local current = p1.current
		
		if current then
			table.insert(t, current.SelectionGained:Connect(function()
				-- upvalues: var2 (copy)
				var2(true)
			end))
			table.insert(t, current.SelectionLost:Connect(function()
				-- upvalues: var2 (copy)
				var2(false)
			end))
		end
		return function()
			-- upvalues: t (ref)
			for i, v in ipairs(t) do
				v:Disconnect()
			end
		end
	end, { p1 })
	
	return var1
end