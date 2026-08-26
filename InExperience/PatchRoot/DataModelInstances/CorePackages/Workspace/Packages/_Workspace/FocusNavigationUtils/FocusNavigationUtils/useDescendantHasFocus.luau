local guiService = game:GetService("GuiService")
local reactModule = require(script:FindFirstAncestor("FocusNavigationUtils").Parent.React)

local function _(p1)
	-- upvalues: guiService (ref)
	local selectedCoreObject = guiService.SelectedCoreObject
	
	return not (not p1 or not selectedCoreObject) and ((if selectedCoreObject ~= p1 then selectedCoreObject:IsDescendantOf(p1) else true) and selectedCoreObject:FindFirstAncestorOfClass("CoreGui") ~= nil)
end

return function(p1)
	-- upvalues: guiService (ref), reactModule (ref)
	local var1
	local selectedCoreObject = guiService.SelectedCoreObject
	
	if p1 and selectedCoreObject then
		var1 = if selectedCoreObject ~= p1 then selectedCoreObject:IsDescendantOf(p1) else true
		
		if var1 then
			var1 = selectedCoreObject:FindFirstAncestorOfClass("CoreGui") ~= nil
			var1 = nil
		end
	else
		var1 = false
	end
	local var2, var3 = reactModule.useState(var1)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref), guiService (copy)
		local var4 = nil
		local var5 = nil
		
		if p1 then
			local var6
			local selectedCoreObject = guiService.SelectedCoreObject
			
			if p1 and selectedCoreObject then
				var6 = if selectedCoreObject ~= p1 then selectedCoreObject:IsDescendantOf(p1) else true
				
				if var6 then
					var6 = selectedCoreObject:FindFirstAncestorOfClass("CoreGui") ~= nil
					var6 = nil
				end
			else
				var6 = false
			end
			var3(var6)
			var4 = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
				-- upvalues: var5 (write), p1 (copy), guiService (copy), var3 (copy)
				if var5 then
					var5:Disconnect()
				end
				local var7
				local selectedCoreObject = guiService.SelectedCoreObject
				
				if p1 and selectedCoreObject then
					var7 = if selectedCoreObject ~= p1 then selectedCoreObject:IsDescendantOf(p1) else true
					
					if var7 then
						var7 = selectedCoreObject:FindFirstAncestorOfClass("CoreGui") ~= nil
						var7 = nil
					end
				else
					var7 = false
				end
				local selectedCoreObject_1 = guiService.SelectedCoreObject
				
				if var7 and selectedCoreObject_1 then
					var5 = selectedCoreObject_1.AncestryChanged:Connect(function()
						-- upvalues: selectedCoreObject_1 (ref), var5 (copy), var3 (copy), p1 (copy), guiService (copy)
						if selectedCoreObject_1:FindFirstAncestorOfClass("CoreGui") == nil then
							local var8
							var5:Disconnect()
							local var9 = var3
							local var10 = p1
							local selectedCoreObject = guiService.SelectedCoreObject
							
							if var10 and selectedCoreObject then
								var8 = if selectedCoreObject ~= var10 then selectedCoreObject:IsDescendantOf(var10) else true
								
								if var8 then
									var8 = selectedCoreObject:FindFirstAncestorOfClass("CoreGui") ~= nil
									var8 = nil
								end
							else
								var8 = false
							end
							var9(var8)
						end
					end)
				end
				var3(var7)
			end)
		else
			var3(false)
		end
		return function()
			-- upvalues: var4 (write), var5 (write)
			if var4 then
				var4:Disconnect()
			end
			if var5 then
				var5:Disconnect()
			end
		end
	end, { p1 })
	
	return var2
end