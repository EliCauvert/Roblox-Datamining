local GuiService = game:GetService("GuiService")
local ReactModule = require(script:FindFirstAncestor("FocusNavigationUtils").Parent.React)

local function hasFocus(Ancestors): boolean
	-- upvalues: GuiService (copy)
	local SelectedCoreObject = GuiService.SelectedCoreObject
	
	if SelectedCoreObject == nil or Ancestors == nil then
		return false
	end
	if SelectedCoreObject:FindFirstAncestorOfClass("CoreGui") == nil then
		return false
	end
	for _, ancestor in Ancestors do
		if SelectedCoreObject == ancestor or SelectedCoreObject:IsDescendantOf(ancestor) then
			return true
		end
	end
	return false
end

return function(p1)
	-- upvalues: hasFocus (copy), ReactModule (copy), GuiService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState((hasFocus(p1)))
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult2 (copy), hasFocus (upval), GuiService (upval)
		local Connection = nil
		local AncestryChangedConnection = nil
		
		if p1 ~= nil and #p1 > 0 then
			UseStateResult2((hasFocus(p1)))
			Connection = GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
				-- upvalues: AncestryChangedConnection (ref), hasFocus (upval), p1 (upval), GuiService (upval), UseStateResult2 (upval)
				if AncestryChangedConnection then
					AncestryChangedConnection:Disconnect()
				end
				local HasFocus = hasFocus(p1)
				local SelectedCoreObject = GuiService.SelectedCoreObject
				
				if HasFocus and SelectedCoreObject then
					AncestryChangedConnection = SelectedCoreObject.AncestryChanged:Connect(function()
						-- upvalues: SelectedCoreObject (copy), AncestryChangedConnection (upval), UseStateResult2 (upval), hasFocus (upval), p1 (upval)
						if SelectedCoreObject:FindFirstAncestorOfClass("CoreGui") == nil then
							AncestryChangedConnection:Disconnect()
							UseStateResult2((hasFocus(p1)))
						end
					end)
				end
				UseStateResult2(HasFocus)
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
	end, { p1 })
	
	return UseStateResult
end