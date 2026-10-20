local ReactModule = require(script:FindFirstAncestor("InExperienceShop").Parent.React)
local GuiService = game:GetService("GuiService")

return function(Callback)
	-- upvalues: ReactModule (copy), GuiService (copy)
	ReactModule.useEffect(function()
		-- upvalues: GuiService (upval), Callback (copy)
		local MenuOpenedConnection = GuiService.MenuOpened:Connect(Callback)
		
		return function()
			-- upvalues: MenuOpenedConnection (copy)
			MenuOpenedConnection:Disconnect()
		end
	end, { Callback })
end