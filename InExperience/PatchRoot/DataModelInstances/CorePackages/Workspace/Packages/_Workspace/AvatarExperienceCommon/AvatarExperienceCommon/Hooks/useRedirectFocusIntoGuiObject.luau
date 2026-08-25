local guiService = game:GetService("GuiService")
local reactModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.React)

local function _(p0)
	-- upvalues: guiService (ref)
	return guiService.SelectedCoreObject and (not guiService.SelectedCoreObject:IsDescendantOf(p0) and not (guiService.SelectedCoreObject == p0))
end

return function(p1)
	-- upvalues: reactModule (ref), guiService (ref)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), guiService (copy)
		local current = p1.current
		
		if current then
			if guiService.SelectedCoreObject and (not guiService.SelectedCoreObject:IsDescendantOf(current) and not (guiService.SelectedCoreObject == current)) then
				current.Selectable = true
			else
				current.Selectable = false
			end
		end
		local changedConnection = guiService.Changed:Connect(function(p2)
			-- upvalues: p1 (copy), guiService (copy)
			if p2 == "SelectedCoreObject" then
				local current = p1.current
				
				if current then
					if guiService.SelectedCoreObject and (not guiService.SelectedCoreObject:IsDescendantOf(current) and not (guiService.SelectedCoreObject == current)) then
						current.Selectable = true
						
						return
					elseif guiService.SelectedCoreObject == current then
						current.Selectable = false
						guiService:Select(current)
						
						return
					elseif guiService.SelectedCoreObject and guiService.SelectedCoreObject:IsDescendantOf(current) then
						current.Selectable = false
					end
				end
			end
		end)
		
		return function()
			-- upvalues: changedConnection (ref)
			return changedConnection:Disconnect()
		end
	end, {})
end