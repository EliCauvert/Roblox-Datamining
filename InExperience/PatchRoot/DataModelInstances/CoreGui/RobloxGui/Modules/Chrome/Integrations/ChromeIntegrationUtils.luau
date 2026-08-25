local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local userInputService = game:GetService("UserInputService")
local fFlagEnableConsoleExpControls = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls

function dismissRobloxMenuAndRun(p0)
	-- upvalues: fFlagEnableConsoleExpControls (ref), userInputService (ref), guiService (ref), robloxGui (ref)
	if fFlagEnableConsoleExpControls and userInputService.GamepadEnabled then
		guiService.SelectedCoreObject = nil
	end
	local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
	
	if guiService.MenuIsOpen then
		local var5 = tick() + 3
		local menuClosedConnection = nil
		menuClosedConnection = guiService.MenuClosed:Connect(function()
			-- upvalues: menuClosedConnection (write), var5 (ref), p0 (ref)
			if menuClosedConnection then
				menuClosedConnection:Disconnect()
				menuClosedConnection = nil
			end
			if tick() < var5 then
				p0(true)
			end
		end)
		settingsHubModule:SetVisibility(false)
		
		return
	end
	p0(false)
end

return { dismissRobloxMenuAndRun = dismissRobloxMenuAndRun }