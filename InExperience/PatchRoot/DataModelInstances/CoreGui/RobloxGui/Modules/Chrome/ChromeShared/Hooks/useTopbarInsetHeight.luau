local GuiService = game:GetService("GuiService")
local ReactModule = require(game:GetService("CorePackages").Packages.React)

return function() --[[ Line: 6 ]]
	-- upvalues: ReactModule (copy), GuiService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(GuiService.TopbarInset.Height)
	ReactModule.useEffect(function() --[[ Line: 9 ]]
		-- upvalues: GuiService (upval), UseStateResult2 (copy)
		local Connection = GuiService:GetPropertyChangedSignal("TopbarInset"):Connect(function() --[[ Line: 10 ]]
			-- upvalues: UseStateResult2 (upval), GuiService (upval)
			UseStateResult2(GuiService.TopbarInset.Height)
		end)
		
		return function() --[[ Line: 14 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	
	return UseStateResult
end