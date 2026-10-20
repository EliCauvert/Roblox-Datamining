local GuiService = game:GetService("GuiService")
local ReactModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.React)

local function _(Ancestor): boolean
	-- upvalues: GuiService (copy)
	return GuiService.SelectedCoreObject and (not GuiService.SelectedCoreObject:IsDescendantOf(Ancestor) and not (GuiService.SelectedCoreObject == Ancestor))
end

return function(p1)
	-- upvalues: ReactModule (copy), GuiService (copy)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), GuiService (upval)
		local Current = p1.current
		
		if Current then
			if GuiService.SelectedCoreObject and (not GuiService.SelectedCoreObject:IsDescendantOf(Current) and not (GuiService.SelectedCoreObject == Current)) then
				Current.Selectable = true
			else
				Current.Selectable = false
			end
		end
		local ChangedConnection = GuiService.Changed:Connect(function(p2)
			-- upvalues: p1 (upval), GuiService (upval)
			if p2 == "SelectedCoreObject" then
				local Current = p1.current
				
				if Current then
					if GuiService.SelectedCoreObject and (not GuiService.SelectedCoreObject:IsDescendantOf(Current) and not (GuiService.SelectedCoreObject == Current)) then
						Current.Selectable = true
						
						return
					end
					if GuiService.SelectedCoreObject == Current then
						Current.Selectable = false
						GuiService:Select(Current)
						
						return
					end
					if GuiService.SelectedCoreObject and GuiService.SelectedCoreObject:IsDescendantOf(Current) then
						Current.Selectable = false
					end
				end
			end
		end)
		
		return function()
			-- upvalues: ChangedConnection (copy)
			return ChangedConnection:Disconnect()
		end
	end, {})
end