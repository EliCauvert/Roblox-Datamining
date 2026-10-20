local GuiService = game:GetService("GuiService")
local ReactModule = require(script:FindFirstAncestor("FocusNavigationUtils").Parent.React)

local function _(Ancestor): boolean
	-- upvalues: GuiService (copy)
	local SelectedCoreObject = GuiService.SelectedCoreObject
	
	return if Ancestor and SelectedCoreObject then (SelectedCoreObject == Ancestor or SelectedCoreObject:IsDescendantOf(Ancestor)) and SelectedCoreObject:FindFirstAncestorOfClass("CoreGui") ~= nil else false
end

return function(Ancestor)
	-- upvalues: GuiService (copy), ReactModule (copy)
	local SelectedCoreObject = GuiService.SelectedCoreObject
	local UseStateResult, UseStateResult2 = ReactModule.useState(if Ancestor and SelectedCoreObject then (SelectedCoreObject == Ancestor or SelectedCoreObject:IsDescendantOf(Ancestor)) and SelectedCoreObject:FindFirstAncestorOfClass("CoreGui") ~= nil else false)
	ReactModule.useEffect(function()
		-- upvalues: Ancestor (copy), UseStateResult2 (copy), GuiService (upval)
		local Connection = nil
		local AncestryChangedConnection = nil
		
		if Ancestor then
			local SelectedCoreObject = GuiService.SelectedCoreObject
			UseStateResult2(if Ancestor and SelectedCoreObject then (SelectedCoreObject == Ancestor or SelectedCoreObject:IsDescendantOf(Ancestor)) and SelectedCoreObject:FindFirstAncestorOfClass("CoreGui") ~= nil else false)
			Connection = GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
				-- upvalues: AncestryChangedConnection (ref), Ancestor (upval), GuiService (upval), UseStateResult2 (upval)
				if AncestryChangedConnection then
					AncestryChangedConnection:Disconnect()
				end
				local SelectedCoreObject = GuiService.SelectedCoreObject
				local HasCoreGui: boolean = if Ancestor and SelectedCoreObject then (SelectedCoreObject == Ancestor or SelectedCoreObject:IsDescendantOf(Ancestor)) and SelectedCoreObject:FindFirstAncestorOfClass("CoreGui") ~= nil else false
				local SelectedCoreObject1 = GuiService.SelectedCoreObject
				
				if HasCoreGui and SelectedCoreObject1 then
					AncestryChangedConnection = SelectedCoreObject1.AncestryChanged:Connect(function()
						-- upvalues: SelectedCoreObject1 (copy), AncestryChangedConnection (upval), UseStateResult2 (upval), Ancestor (upval), GuiService (upval)
						if SelectedCoreObject1:FindFirstAncestorOfClass("CoreGui") == nil then
							AncestryChangedConnection:Disconnect()
							local SelectedCoreObject1 = GuiService.SelectedCoreObject
							UseStateResult2(if Ancestor and SelectedCoreObject1 then (SelectedCoreObject1 == Ancestor or SelectedCoreObject1:IsDescendantOf(Ancestor)) and SelectedCoreObject1:FindFirstAncestorOfClass("CoreGui") ~= nil else false)
						end
					end)
				end
				UseStateResult2(HasCoreGui)
			end)
		else
			UseStateResult2(false)
		end
		return function()
			-- upvalues: Connection (ref), AncestryChangedConnection (ref)
			if Connection then
				Connection:Disconnect()
			end
			if AncestryChangedConnection then
				AncestryChangedConnection:Disconnect()
			end
		end
	end, { Ancestor })
	
	return UseStateResult
end