local GuiService = game:GetService("GuiService")
local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)

local function getHardwareSafeAreaInsets() --[[ Line: 9 ]]
	-- upvalues: GuiService (copy)
	local InsetArea = GuiService:GetInsetArea(Enum.ScreenInsets.DeviceSafeInsets)
	local InsetArea1 = GuiService:GetInsetArea(Enum.ScreenInsets.None)
	
	return {
		left = InsetArea.Min.X - InsetArea1.Min.X,
		top = InsetArea.Min.Y - InsetArea1.Min.Y,
		right = InsetArea1.Max.X - InsetArea.Max.X,
		bottom = InsetArea1.Max.Y - InsetArea.Max.Y
	}
end

return function(Object) --[[ Line: 21 | Named "useHardwareInsets" ]]
	-- upvalues: ReactModule (copy), getHardwareSafeAreaInsets (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(getHardwareSafeAreaInsets)
	ReactModule.useEffect(function() --[[ Line: 24 ]]
		-- upvalues: Object (copy), UseStateResult2 (copy), getHardwareSafeAreaInsets (upval)
		local Connection = if Object then Object:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 28 ]]
			-- upvalues: UseStateResult2 (upval), getHardwareSafeAreaInsets (upval)
			UseStateResult2(function(HardwareSafeAreaInsets) --[[ Line: 29 ]]
				-- upvalues: getHardwareSafeAreaInsets (upval)
				local HardwareSafeAreaInsets1 = getHardwareSafeAreaInsets()
				
				return if HardwareSafeAreaInsets1.bottom == HardwareSafeAreaInsets.bottom and HardwareSafeAreaInsets1.top == HardwareSafeAreaInsets.top and HardwareSafeAreaInsets1.left == HardwareSafeAreaInsets.left and HardwareSafeAreaInsets1.right == HardwareSafeAreaInsets.right then HardwareSafeAreaInsets else HardwareSafeAreaInsets1
			end)
		end) else nil
		
		return function() --[[ Line: 45 ]]
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
			end
		end
	end, { Object })
	
	return UseStateResult
end