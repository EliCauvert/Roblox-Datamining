local GuiService = game:GetService("GuiService")
local ReactModule = require(script.Parent.Parent.Parent.React)

return function() --[[ Line: 8 ]]
	-- upvalues: ReactModule (copy), GuiService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(GuiService.TopbarInset.Height)
	ReactModule.useEffect(function() --[[ Line: 11 ]]
		-- upvalues: GuiService (upval), UseStateResult2 (copy)
		local Connection = GuiService:GetPropertyChangedSignal("TopbarInset"):Connect(function() --[[ Line: 13 ]]
			-- upvalues: UseStateResult2 (upval), GuiService (upval)
			UseStateResult2(GuiService.TopbarInset.Height)
		end)
		
		return function() --[[ Line: 17 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	
	return UseStateResult
end