local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local userInputService = game:GetService("UserInputService")
local fFlagEnableConsoleExpControls = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls

function dismissRobloxMenuAndRun(p1)
	-- upvalues: fFlagEnableConsoleExpControls (ref), userInputService (ref), guiService (ref), robloxGui (ref)
	if fFlagEnableConsoleExpControls and userInputService.GamepadEnabled then
		guiService.SelectedCoreObject = nil
	end
	local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
	
	if guiService.MenuIsOpen then
		local var1 = tick() + 3
		local menuClosedConnection = nil
		menuClosedConnection = guiService.MenuClosed:Connect(function()
			-- upvalues: menuClosedConnection (write), var1 (ref), p1 (ref)
			if menuClosedConnection then
				menuClosedConnection:Disconnect()
				menuClosedConnection = nil
			end
			if tick() < var1 then
				p1(true)
			end
		end)
		settingsHubModule:SetVisibility(false)
		
		return
	end
	p1(false)
end

return { dismissRobloxMenuAndRun = dismissRobloxMenuAndRun }