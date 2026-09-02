local reactModule = require(script:FindFirstAncestor("InExperienceShop").Parent.React)
local guiService = game:GetService("GuiService")

return function(p1)
	-- upvalues: reactModule (ref), guiService (ref)
	reactModule.useEffect(function()
		-- upvalues: guiService (copy), p1 (ref)
		local menuOpenedConnection = guiService.MenuOpened:Connect(p1)
		
		return function()
			-- upvalues: menuOpenedConnection (ref)
			menuOpenedConnection:Disconnect()
		end
	end, { p1 })
end