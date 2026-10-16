local ReactModule = require(script:FindFirstAncestor("InExperienceShop").Parent.React)
local GuiService = game:GetService("GuiService")

return function(Callback) --[[ Line: 11 | Named "useCloseOnCoreMenu" ]]
	-- upvalues: ReactModule (copy), GuiService (copy)
	ReactModule.useEffect(function() --[[ Line: 12 ]]
		-- upvalues: GuiService (upval), Callback (copy)
		local MenuOpenedConnection = GuiService.MenuOpened:Connect(Callback)
		
		return function() --[[ Line: 14 ]]
			-- upvalues: MenuOpenedConnection (copy)
			MenuOpenedConnection:Disconnect()
		end
	end, { Callback })
end