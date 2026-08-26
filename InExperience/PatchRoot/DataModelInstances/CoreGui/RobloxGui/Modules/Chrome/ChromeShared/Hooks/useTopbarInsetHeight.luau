local guiService = game:GetService("GuiService")
local reactModule = require(game:GetService("CorePackages").Packages.React)

return function()
	-- upvalues: reactModule (ref), guiService (ref)
	local var1, var2 = reactModule.useState(guiService.TopbarInset.Height)
	reactModule.useEffect(function()
		-- upvalues: guiService (copy), var2 (ref)
		local var3 = guiService:GetPropertyChangedSignal("TopbarInset"):Connect(function()
			-- upvalues: var2 (copy), guiService (copy)
			var2(guiService.TopbarInset.Height)
		end)
		
		return function()
			-- upvalues: var3 (ref)
			var3:Disconnect()
		end
	end, {})
	
	return var1
end