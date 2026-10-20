local GuiService = game:GetService("GuiService")
local ReactModule = require(script.Parent.Parent.Parent.React)

return function()
	-- upvalues: ReactModule (copy), GuiService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(GuiService:GetSafeZoneOffsets())
	ReactModule.useEffect(function()
		-- upvalues: GuiService (upval), UseStateResult2 (copy)
		local SafeZoneOffsetsChangedConnection = GuiService.SafeZoneOffsetsChanged:Connect(function()
			-- upvalues: UseStateResult2 (upval), GuiService (upval)
			UseStateResult2(GuiService:GetSafeZoneOffsets())
		end)
		
		return function()
			-- upvalues: SafeZoneOffsetsChangedConnection (copy)
			SafeZoneOffsetsChangedConnection:Disconnect()
		end
	end, {})
	
	return UseStateResult
end