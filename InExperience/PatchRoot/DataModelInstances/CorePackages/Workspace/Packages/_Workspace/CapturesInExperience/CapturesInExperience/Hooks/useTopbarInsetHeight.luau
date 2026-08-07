local guiService = game:GetService("GuiService")
local reactModule = require(script.Parent.Parent.Parent.React)

return function() --[[ line: 8 ]]
	-- upvalues: reactModule (ref), guiService (ref)
	local var2, var3 = reactModule.useState(guiService.TopbarInset.Height)
	reactModule.useEffect(function() --[[ line: 11 ]]
		-- upvalues: guiService (copy), var3 (ref)
		local var4 = guiService:GetPropertyChangedSignal("TopbarInset"):Connect(function() --[[ line: 13 ]]
			-- upvalues: var3 (copy), guiService (copy)
			var3(guiService.TopbarInset.Height)
		end)
		
		return function() --[[ line: 17 ]]
			-- upvalues: var4 (ref)
			var4:Disconnect()
		end
	end, {})
	
	return var2
end