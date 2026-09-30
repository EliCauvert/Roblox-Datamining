local guiService = game:GetService("GuiService")
local reactModule = require(script:FindFirstAncestor("FocusNavigationUtils").Parent.React)

local function hasFocus(p1)
	-- upvalues: guiService (ref)
	local selectedCoreObject = guiService.SelectedCoreObject
	
	if selectedCoreObject == nil or p1 == nil then
		return false
	elseif selectedCoreObject:FindFirstAncestorOfClass("CoreGui") == nil then
		return false
	end
	for i, v in p1 do
		if selectedCoreObject == v or selectedCoreObject:IsDescendantOf(v) then
			return true
		end
	end
	return false
end

return function(p2)
	-- upvalues: hasFocus (ref), reactModule (ref), guiService (ref)
	local var1, var2 = reactModule.useState(hasFocus(p2))
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), var2 (ref), hasFocus (copy), guiService (copy)
		local var3 = nil
		local var4 = nil
		
		if p2 ~= nil and #p2 > 0 then
			var2(hasFocus(p2))
			var3 = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
				-- upvalues: var4 (write), hasFocus (copy), p2 (copy), guiService (copy), var2 (copy)
				if var4 then
					var4:Disconnect()
				end
				local var5 = hasFocus(p2)
				local selectedCoreObject = guiService.SelectedCoreObject
				
				if var5 and selectedCoreObject then
					var4 = selectedCoreObject.AncestryChanged:Connect(function()
						-- upvalues: selectedCoreObject (ref), var4 (copy), var2 (copy), hasFocus (copy), p2 (copy)
						if selectedCoreObject:FindFirstAncestorOfClass("CoreGui") == nil then
							var4:Disconnect()
							var2(hasFocus(p2))
						end
					end)
				end
				var2(var5)
			end)
		else
			var2(false)
		end
		return function()
			-- upvalues: var3 (write), var4 (write)
			if var3 then
				var3:Disconnect()
			end
			if var4 then
				var4:Disconnect()
			end
		end
	end, { p2 })
	
	return var1
end