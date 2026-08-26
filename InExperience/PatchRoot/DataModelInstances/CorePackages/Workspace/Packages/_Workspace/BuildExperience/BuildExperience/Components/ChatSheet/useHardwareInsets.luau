local guiService = game:GetService("GuiService")
local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)

local function getHardwareSafeAreaInsets()
	-- upvalues: guiService (ref)
	local deviceSafeInsetsInsetArea = guiService:GetInsetArea(Enum.ScreenInsets.DeviceSafeInsets)
	local noneInsetArea = guiService:GetInsetArea(Enum.ScreenInsets.None)
	
	return {
		left = deviceSafeInsetsInsetArea.Min.X - noneInsetArea.Min.X,
		top = deviceSafeInsetsInsetArea.Min.Y - noneInsetArea.Min.Y,
		right = noneInsetArea.Max.X - deviceSafeInsetsInsetArea.Max.X,
		bottom = noneInsetArea.Max.Y - deviceSafeInsetsInsetArea.Max.Y
	}
end

return function(value)
	-- upvalues: reactModule (ref), getHardwareSafeAreaInsets (ref)
	local var1, var2 = reactModule.useState(getHardwareSafeAreaInsets)
	reactModule.useEffect(function()
		-- upvalues: value (ref), var2 (ref), getHardwareSafeAreaInsets (copy)
		local var3 = if value then value:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			-- upvalues: var2 (copy), getHardwareSafeAreaInsets (copy)
			var2(function(p1)
				-- upvalues: getHardwareSafeAreaInsets (copy)
				local var4 = getHardwareSafeAreaInsets()
				
				return if var4.bottom == p1.bottom and var4.top == p1.top and (var4.left == p1.left and var4.right == p1.right) then p1 else var4
			end)
		end) else nil
		
		return function()
			-- upvalues: var3 (write)
			if var3 then
				var3:Disconnect()
			end
		end
	end, { value })
	
	return var1
end