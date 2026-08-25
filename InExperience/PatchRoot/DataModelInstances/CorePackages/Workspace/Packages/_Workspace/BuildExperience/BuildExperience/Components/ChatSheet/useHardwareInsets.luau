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
	local var5, var6 = reactModule.useState(getHardwareSafeAreaInsets)
	reactModule.useEffect(function()
		-- upvalues: value (ref), var6 (ref), getHardwareSafeAreaInsets (copy)
		local var7 = if value then value:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			-- upvalues: var6 (copy), getHardwareSafeAreaInsets (copy)
			var6(function(p0)
				-- upvalues: getHardwareSafeAreaInsets (copy)
				local var8 = getHardwareSafeAreaInsets()
				
				return if var8.bottom == p0.bottom and var8.top == p0.top and (var8.left == p0.left and var8.right == p0.right) then p0 else var8
			end)
		end) else nil
		
		return function()
			-- upvalues: var7 (write)
			if var7 then
				var7:Disconnect()
			end
		end
	end, { value })
	
	return var5
end