local foundation = game:GetService("CorePackages").Packages._Index.Foundation.Foundation
local flagsModule = require(foundation.Utility.Flags)
local wrappersModule = require(foundation.Utility.Wrappers)
local getMainGuiModule = require(foundation.Utility.getMainGui)
local guiService = wrappersModule.Services.GuiService
local coreGui = wrappersModule.Services.CoreGui
local runService = wrappersModule.Services.RunService
local players = wrappersModule.Services.Players
local var3 = nil

if not flagsModule.FoundationUseMainGuiUtility then
	var3 = if players.LocalPlayer and runService:IsRunning() then players.LocalPlayer:WaitForChild("PlayerGui", 3) else nil
end
local isPluginSecurityModule = require(foundation.Utility.isPluginSecurity)

return function() --[[ line: 23 | named "getHardwareSafeAreaInsets" ]]
	-- upvalues: flagsModule (ref), guiService (ref), getMainGuiModule (ref), isPluginSecurityModule (ref), coreGui (ref), var3 (write)
	if flagsModule.FoundationUseGetInsetArea then
		local deviceSafeInsetsInsetArea = guiService:GetInsetArea(Enum.ScreenInsets.DeviceSafeInsets)
		local noneInsetArea = guiService:GetInsetArea(Enum.ScreenInsets.None)
		
		return {
			left = deviceSafeInsetsInsetArea.Min.X - noneInsetArea.Min.X,
			top = deviceSafeInsetsInsetArea.Min.Y - noneInsetArea.Min.Y,
			right = noneInsetArea.Max.X - deviceSafeInsetsInsetArea.Max.X,
			bottom = noneInsetArea.Max.Y - deviceSafeInsetsInsetArea.Max.Y
		}
	end
	local var7 = if flagsModule.FoundationUseMainGuiUtility then getMainGuiModule() elseif isPluginSecurityModule() then coreGui else var3
	local fullscreenTestGui = Instance.new("ScreenGui")
	fullscreenTestGui.Name = "_FullscreenTestGui"
	fullscreenTestGui.Parent = var7
	fullscreenTestGui.ScreenInsets = Enum.ScreenInsets.None
	local deviceTestGui = Instance.new("ScreenGui")
	deviceTestGui.Name = "_DeviceTestGui"
	deviceTestGui.Parent = var7
	deviceTestGui.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
	local var10 = deviceTestGui.AbsolutePosition - fullscreenTestGui.AbsolutePosition
	local var11 = fullscreenTestGui.AbsolutePosition + fullscreenTestGui.AbsoluteSize - (deviceTestGui.AbsolutePosition + deviceTestGui.AbsoluteSize)
	local t = {
		left = var10.X,
		top = var10.Y,
		right = var11.X,
		bottom = var11.Y
	}
	fullscreenTestGui.Parent = nil
	deviceTestGui.Parent = nil
	fullscreenTestGui:Destroy()
	deviceTestGui:Destroy()
	
	return t
end