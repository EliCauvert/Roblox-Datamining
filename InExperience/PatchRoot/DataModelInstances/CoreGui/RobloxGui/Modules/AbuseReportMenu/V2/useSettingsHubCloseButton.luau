local GuiService = game:GetService("GuiService")
local ReactModule = require(game:GetService("CorePackages").Packages.React)

return function(Callback, p1)
	-- upvalues: ReactModule (copy), GuiService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: Callback (copy), UseStateResult2 (copy)
		local CallbackResult = if Callback then Callback() else nil
		UseStateResult2(if CallbackResult then CallbackResult.PageTitleCloseButton else nil)
	end, { Callback, p1 })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseStateResult2_1 (copy), GuiService (upval)
		if UseStateResult then
			local function updateIsSelected()
				-- upvalues: UseStateResult2_1 (upval), GuiService (upval), UseStateResult (upval)
				UseStateResult2_1(GuiService.SelectedCoreObject == UseStateResult)
			end
			
			UseStateResult2_1(GuiService.SelectedCoreObject == UseStateResult)
			local Connection = GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(updateIsSelected)
			
			return function()
				-- upvalues: Connection (copy)
				Connection:Disconnect()
			end
		else
			UseStateResult2_1(false)
			
			return nil
		end
	end, { UseStateResult })
	
	return UseStateResult, UseStateResult1
end