local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)

local function _(p1, p2, p3)
	return p2 or (p3 ~= nil and p3:IsDescendantOf(p1))
end

return {
	useDescendantSelected = function()
		-- upvalues: reactModule (ref)
		local var1, var2 = reactModule.useState(nil)
		local var3, var4 = reactModule.useState(false)
		local var5 = reactModule.useCallback(function(p1)
			-- upvalues: var2 (ref)
			var2(p1)
		end, {})
		reactModule.useEffect(function()
			-- upvalues: var4 (ref), var1 (ref)
			var4(false)
			
			if var1 then
				local selectionChangedConnection = var1.SelectionChanged:Connect(function(p1, _, p2)
					-- upvalues: var4 (copy), var1 (copy)
					var4(p1 or (p2 ~= nil and p2:IsDescendantOf(var1)))
				end)
				
				return function()
					-- upvalues: selectionChangedConnection (ref)
					selectionChangedConnection:Disconnect()
				end
			end
		end, { var1 })
		
		return var3, var5
	end
}