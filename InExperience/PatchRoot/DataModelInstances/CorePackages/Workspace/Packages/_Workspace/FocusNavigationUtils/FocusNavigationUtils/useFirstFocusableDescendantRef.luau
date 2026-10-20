local ReactModule = require(script:FindFirstAncestor("FocusNavigationUtils").Parent.React)
local GetFirstFocusableDescendantModule = require(script.Parent.getFirstFocusableDescendant)

local function _(Connection)
	if Connection then
		Connection:Disconnect()
	end
end

return function(p1)
	-- upvalues: ReactModule (copy), GetFirstFocusableDescendantModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: GetFirstFocusableDescendantModule (upval), UseRefResult (copy), p1 (copy)
		local Connection = nil
		local DescendantAddedConnection = nil
		local AncestryChangedConnection = nil
		
		local function updateFirstFocusable(p2)
			-- upvalues: Connection (ref), AncestryChangedConnection (ref), GetFirstFocusableDescendantModule (upval), updateFirstFocusable (copy), UseRefResult (upval)
			local Connection1 = Connection
			
			if Connection1 then
				Connection1:Disconnect()
			end
			local Connection2 = AncestryChangedConnection
			
			if Connection2 then
				Connection2:Disconnect()
			end
			local FirstFocusableDescendantModule = GetFirstFocusableDescendantModule(p2)
			
			if FirstFocusableDescendantModule then
				Connection = FirstFocusableDescendantModule:GetPropertyChangedSignal("Selectable"):Connect(function()
					-- upvalues: updateFirstFocusable (upval), p2 (copy)
					updateFirstFocusable(p2)
				end)
				AncestryChangedConnection = FirstFocusableDescendantModule.AncestryChanged:Connect(function()
					-- upvalues: updateFirstFocusable (upval), p2 (copy)
					updateFirstFocusable(p2)
				end)
			end
			UseRefResult.current = FirstFocusableDescendantModule
		end
		
		if p1 then
			updateFirstFocusable(p1)
			DescendantAddedConnection = p1.DescendantAdded:Connect(function()
				-- upvalues: updateFirstFocusable (copy), p1 (upval)
				updateFirstFocusable(p1)
			end)
		else
			UseRefResult.current = nil
		end
		return function()
			-- upvalues: Connection (ref), DescendantAddedConnection (ref), AncestryChangedConnection (ref)
			local Connection1 = Connection
			
			if Connection1 then
				Connection1:Disconnect()
			end
			local Connection2 = DescendantAddedConnection
			
			if Connection2 then
				Connection2:Disconnect()
			end
			local Connection3 = AncestryChangedConnection
			
			if Connection3 then
				Connection3:Disconnect()
			end
		end
	end, { p1 })
	
	return UseRefResult
end