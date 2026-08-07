local reactModule = require(script:FindFirstAncestor("FocusNavigationUtils").Parent.React)
local getFirstFocusableDescendantModule = require(script.Parent.getFirstFocusableDescendant)

local function _(p0) --[[ line: 6 | named "safeDisconnect" ]]
	if p0 then
		p0:Disconnect()
	end
end

return function(p1) --[[ line: 23 | named "useFirstFocusableDescendantRef" ]]
	-- upvalues: reactModule (ref), getFirstFocusableDescendantModule (ref)
	local var2 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 26 ]]
		-- upvalues: getFirstFocusableDescendantModule (copy), var2 (ref), p1 (ref)
		local var3 = nil
		local descendantAddedConnection = nil
		local var5 = nil
		
		local function updateFirstFocusable(p2) --[[ line: 31 ]]
			-- upvalues: var3 (write), var5 (write), getFirstFocusableDescendantModule (copy), updateFirstFocusable (ref), var2 (copy)
			if var3 then
				var3:Disconnect()
			end
			if var5 then
				var5:Disconnect()
			end
			local var7 = getFirstFocusableDescendantModule(p2)
			
			if var7 then
				var3 = var7:GetPropertyChangedSignal("Selectable"):Connect(function() --[[ line: 38 ]]
					-- upvalues: updateFirstFocusable (copy), p2 (ref)
					updateFirstFocusable(p2)
				end)
				var5 = var7.AncestryChanged:Connect(function() --[[ line: 42 ]]
					-- upvalues: updateFirstFocusable (copy), p2 (ref)
					updateFirstFocusable(p2)
				end)
			end
			var2.current = var7
		end
		
		if p1 then
			updateFirstFocusable(p1)
			descendantAddedConnection = p1.DescendantAdded:Connect(function() --[[ line: 51 ]]
				-- upvalues: updateFirstFocusable (ref), p1 (copy)
				updateFirstFocusable(p1)
			end)
		else
			var2.current = nil
		end
		return function() --[[ line: 58 ]]
			-- upvalues: var3 (write), descendantAddedConnection (write), var5 (write)
			if var3 then
				var3:Disconnect()
			end
			if descendantAddedConnection then
				descendantAddedConnection:Disconnect()
			end
			if var5 then
				var5:Disconnect()
			end
		end
	end, { p1 })
	
	return var2
end