local guiService = game:GetService("GuiService")
local reactModule = require(script:FindFirstAncestor("FocusNavigationUtils").Parent.React)

local function _(p0)
	-- upvalues: guiService (ref)
	local selectedCoreObject = guiService.SelectedCoreObject
	
	return not (not p0 or not selectedCoreObject) and ((if selectedCoreObject ~= p0 then selectedCoreObject:IsDescendantOf(p0) else true) and selectedCoreObject:FindFirstAncestorOfClass("CoreGui") ~= nil)
end

return function(p1)
	-- upvalues: guiService (ref), reactModule (ref)
	local var2
	local selectedCoreObject = guiService.SelectedCoreObject
	
	if p1 and selectedCoreObject then
		var2 = if selectedCoreObject ~= p1 then selectedCoreObject:IsDescendantOf(p1) else true
		
		if var2 then
			var2 = selectedCoreObject:FindFirstAncestorOfClass("CoreGui") ~= nil
			var2 = nil
		end
	else
		var2 = false
	end
	local var3, var4 = reactModule.useState(var2)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var4 (ref), guiService (copy)
		local var5 = nil
		local var6 = nil
		
		if p1 then
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
			var4(var7)
			var5 = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
				-- upvalues: var6 (write), p1 (copy), guiService (copy), var4 (copy)
				if var6 then
					var6:Disconnect()
				end
				local var8
				local selectedCoreObject = guiService.SelectedCoreObject
				
				if p1 and selectedCoreObject then
					var8 = if selectedCoreObject ~= p1 then selectedCoreObject:IsDescendantOf(p1) else true
					
					if var8 then
						var8 = selectedCoreObject:FindFirstAncestorOfClass("CoreGui") ~= nil
						var8 = nil
					end
				else
					var8 = false
				end
				local selectedCoreObject_1 = guiService.SelectedCoreObject
				
				if var8 and selectedCoreObject_1 then
					var6 = selectedCoreObject_1.AncestryChanged:Connect(function()
						-- upvalues: selectedCoreObject_1 (ref), var6 (copy), var4 (copy), p1 (copy), guiService (copy)
						if selectedCoreObject_1:FindFirstAncestorOfClass("CoreGui") == nil then
							local var11
							var6:Disconnect()
							local var9 = var4
							local var10 = p1
							local selectedCoreObject = guiService.SelectedCoreObject
							
							if var10 and selectedCoreObject then
								var11 = if selectedCoreObject ~= var10 then selectedCoreObject:IsDescendantOf(var10) else true
								
								if var11 then
									var11 = selectedCoreObject:FindFirstAncestorOfClass("CoreGui") ~= nil
									var11 = nil
								end
							else
								var11 = false
							end
							var9(var11)
						end
					end)
				end
				var4(var8)
			end)
		else
			var4(false)
		end
		return function()
			-- upvalues: var5 (write), var6 (write)
			if var5 then
				var5:Disconnect()
			end
			if var6 then
				var6:Disconnect()
			end
		end
	end, { p1 })
	
	return var3
end