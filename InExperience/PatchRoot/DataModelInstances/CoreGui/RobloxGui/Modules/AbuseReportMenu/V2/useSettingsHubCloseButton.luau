local guiService = game:GetService("GuiService")
local reactModule = require(game:GetService("CorePackages").Packages.React)

return function(value, p1)
	-- upvalues: reactModule (ref), guiService (ref)
	local var1, var2 = reactModule.useState(nil)
	local var3, var4 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: value (ref), var2 (ref)
		local var5 = if value then value() else nil
		var2(if var5 then var5.PageTitleCloseButton else nil)
	end, { value, p1 })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var4 (ref), guiService (copy)
		if var1 then
			local function updateIsSelected()
				-- upvalues: var4 (copy), guiService (copy), var1 (copy)
				var4(guiService.SelectedCoreObject == var1)
			end
			
			var4(guiService.SelectedCoreObject == var1)
			local var5 = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(updateIsSelected)
			
			return function()
				-- upvalues: var5 (ref)
				var5:Disconnect()
			end
		end
		var4(false)
		
		return nil
	end, { var1 })
	
	return var1, var3
end