local GuiService = game:GetService("GuiService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local UserInputService = game:GetService("UserInputService")
local FFlagEnableConsoleExpControls = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls

function dismissRobloxMenuAndRun(Callback: (any) -> ()) --[[ Line: 10 ]]
	-- upvalues: FFlagEnableConsoleExpControls (copy), UserInputService (copy), GuiService (copy), RobloxGui (copy)
	if FFlagEnableConsoleExpControls and UserInputService.GamepadEnabled then
		GuiService.SelectedCoreObject = nil
	end
	local SettingsHubModule = require(RobloxGui.Modules.Settings.SettingsHub)
	
	if GuiService.MenuIsOpen then
		local NewCurrentTime = tick() + 3
		local Connection = nil
		Connection = GuiService.MenuClosed:Connect(function() --[[ Line: 20 ]]
			-- upvalues: Connection (ref), NewCurrentTime (copy), Callback (copy)
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
			if tick() < NewCurrentTime then
				Callback(true)
			end
		end)
		SettingsHubModule:SetVisibility(false)
		
		return
	else
		local Connection = false
		Callback(Connection)
	end
end

return { dismissRobloxMenuAndRun = dismissRobloxMenuAndRun }