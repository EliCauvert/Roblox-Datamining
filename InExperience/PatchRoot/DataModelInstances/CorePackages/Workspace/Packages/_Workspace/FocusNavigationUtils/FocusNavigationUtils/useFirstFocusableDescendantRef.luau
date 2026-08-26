local reactModule = require(script:FindFirstAncestor("FocusNavigationUtils").Parent.React)
local getFirstFocusableDescendantModule = require(script.Parent.getFirstFocusableDescendant)

local function _(p1)
	if p1 then
		p1:Disconnect()
	end
end

return function(p1)
	-- upvalues: reactModule (ref), getFirstFocusableDescendantModule (ref)
	local var1 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: getFirstFocusableDescendantModule (copy), var1 (ref), p1 (ref)
		local var2 = nil
		local descendantAddedConnection = nil
		local var3 = nil
		
		local function updateFirstFocusable(p2)
			-- upvalues: var2 (write), var3 (write), getFirstFocusableDescendantModule (copy), updateFirstFocusable (ref), var1 (copy)
			if var2 then
				var2:Disconnect()
			end
			if var3 then
				var3:Disconnect()
			end
			local var4 = getFirstFocusableDescendantModule(p2)
			
			if var4 then
				var2 = var4:GetPropertyChangedSignal("Selectable"):Connect(function()
					-- upvalues: updateFirstFocusable (copy), p2 (ref)
					updateFirstFocusable(p2)
				end)
				var3 = var4.AncestryChanged:Connect(function()
					-- upvalues: updateFirstFocusable (copy), p2 (ref)
					updateFirstFocusable(p2)
				end)
			end
			var1.current = var4
		end
		
		if p1 then
			updateFirstFocusable(p1)
			descendantAddedConnection = p1.DescendantAdded:Connect(function()
				-- upvalues: updateFirstFocusable (ref), p1 (copy)
				updateFirstFocusable(p1)
			end)
		else
			var1.current = nil
		end
		return function()
			-- upvalues: var2 (write), descendantAddedConnection (write), var3 (write)
			if var2 then
				var2:Disconnect()
			end
			if descendantAddedConnection then
				descendantAddedConnection:Disconnect()
			end
			if var3 then
				var3:Disconnect()
			end
		end
	end, { p1 })
	
	return var1
end