local function isOnScreen(Object): boolean
	if not Object:IsDescendantOf(game) then
		return false
	end
	local Parent = Object
	while Parent ~= nil do
		if Parent:IsA("GuiObject") and not Parent.Visible then
			return false
		end
		if Parent:IsA("LayerCollector") and not Parent.Enabled then
			return false
		end
		Parent = Parent.Parent
	end
	return true
end

return function(p1, Callback)
	-- upvalues: isOnScreen (copy)
	local Tbl = {}
	local v1 = nil
	local Flag = false
	
	local function evaluate()
		-- upvalues: Flag (ref), isOnScreen (upval), p1 (copy), v1 (ref), Callback (copy)
		if Flag then return end
		local IsOnScreen = isOnScreen(p1)
		
		if IsOnScreen ~= v1 then
			v1 = IsOnScreen
			Callback(IsOnScreen)
		end
	end
	
	local function _()
		-- upvalues: Tbl (copy)
		for _, Connection in Tbl do
			Connection:Disconnect()
		end
		table.clear(Tbl)
	end
	
	local function rewire()
		-- upvalues: Tbl (copy), p1 (copy), evaluate (copy), Flag (ref), isOnScreen (upval), v1 (ref), Callback (copy)
		for _, Connection in Tbl do
			Connection:Disconnect()
		end
		table.clear(Tbl)
		local Object = p1
		while Object ~= nil do
			if Object:IsA("GuiObject") then
				table.insert(Tbl, Object:GetPropertyChangedSignal("Visible"):Connect(evaluate))
			elseif Object:IsA("LayerCollector") then
				table.insert(Tbl, Object:GetPropertyChangedSignal("Enabled"):Connect(evaluate))
			end
			Object = Object.Parent
		end
		if Flag then return end
		local IsOnScreen = isOnScreen(p1)
		
		if IsOnScreen ~= v1 then
			v1 = IsOnScreen
			Callback(IsOnScreen)
		end
	end
	
	local AncestryChangedConnection = p1.AncestryChanged:Connect(rewire)
	rewire()
	
	return function()
		-- upvalues: Flag (ref), AncestryChangedConnection (copy), Tbl (copy)
		Flag = true
		AncestryChangedConnection:Disconnect()
		
		for _, Connection in Tbl do
			Connection:Disconnect()
		end
		table.clear(Tbl)
	end
end