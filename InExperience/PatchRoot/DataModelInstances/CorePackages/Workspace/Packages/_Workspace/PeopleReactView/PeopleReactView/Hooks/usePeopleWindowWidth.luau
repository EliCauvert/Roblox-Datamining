local reactModule = require(script:FindFirstAncestor("PeopleReactView").Parent.React)

return function()
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(0)
	local var3 = reactModule.useRef(nil)
	
	return var1, reactModule.useCallback(function(p1)
		-- upvalues: var3 (ref), var2 (ref)
		if var3.current then
			var3.current()
			var3.current = nil
		end
		if p1 then
			local var4 = nil
			
			local function track()
				-- upvalues: var4 (write), p1 (ref), var2 (copy)
				if var4 then
					var4:Disconnect()
				end
				local scrollingFrame = p1:FindFirstAncestorWhichIsA("ScrollingFrame") or p1
				var2(scrollingFrame.AbsoluteSize.X)
				var4 = scrollingFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
					-- upvalues: var2 (copy), scrollingFrame (ref)
					var2(scrollingFrame.AbsoluteSize.X)
				end)
			end
			
			track()
			local ancestryChangedConnection = p1.AncestryChanged:Connect(track)
			
			function var3.current()
				-- upvalues: ancestryChangedConnection (ref), var4 (write)
				ancestryChangedConnection:Disconnect()
				
				if var4 then
					var4:Disconnect()
				end
			end
			
			return
		end
	end, {})
end