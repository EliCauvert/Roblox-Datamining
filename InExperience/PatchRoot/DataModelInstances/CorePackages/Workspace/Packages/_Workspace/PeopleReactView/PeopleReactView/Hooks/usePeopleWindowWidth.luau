local ReactModule = require(script:FindFirstAncestor("PeopleReactView").Parent.React)

return function()
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseRefResult = ReactModule.useRef(nil)
	
	return UseStateResult, (ReactModule.useCallback(function(p1)
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
		if UseRefResult.current then
			UseRefResult.current()
			UseRefResult.current = nil
		end
		if p1 then
			local Connection = nil
			
			local function track()
				-- upvalues: Connection (ref), p1 (copy), UseStateResult2 (upval)
				if Connection then
					Connection:Disconnect()
				end
				local ScrollingFrame = p1:FindFirstAncestorWhichIsA("ScrollingFrame") or p1
				UseStateResult2(ScrollingFrame.AbsoluteSize.X)
				Connection = ScrollingFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
					-- upvalues: UseStateResult2 (upval), ScrollingFrame (copy)
					UseStateResult2(ScrollingFrame.AbsoluteSize.X)
				end)
			end
			
			track()
			local AncestryChangedConnection = p1.AncestryChanged:Connect(track)
			
			function UseRefResult.current()
				-- upvalues: AncestryChangedConnection (copy), Connection (ref)
				AncestryChangedConnection:Disconnect()
				
				if Connection then
					Connection:Disconnect()
				end
			end
			
			return
		end
	end, {}))
end