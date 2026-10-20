local Foundation = game:GetService("CorePackages").Packages._Index.Foundation.Foundation
local FlagsModule = require(Foundation.Utility.Flags)
local WrappersModule = require(Foundation.Utility.Wrappers)
local GetMainGuiModule = require(Foundation.Utility.getMainGui)
local GuiService = WrappersModule.Services.GuiService
local CoreGui = WrappersModule.Services.CoreGui
local RunService = WrappersModule.Services.RunService
local Players = WrappersModule.Services.Players
local PlayerGui = if FlagsModule.FoundationUseMainGuiUtility then nil elseif Players.LocalPlayer and RunService:IsRunning() then Players.LocalPlayer:WaitForChild("PlayerGui", 3) else nil
local IsPluginSecurityModule = require(Foundation.Utility.isPluginSecurity)

return function()
	-- upvalues: FlagsModule (copy), GuiService (copy), GetMainGuiModule (copy), IsPluginSecurityModule (copy), CoreGui (copy), PlayerGui (ref)
	if FlagsModule.FoundationUseGetInsetArea then
		local InsetArea = GuiService:GetInsetArea(Enum.ScreenInsets.DeviceSafeInsets)
		local InsetArea1 = GuiService:GetInsetArea(Enum.ScreenInsets.None)
		
		return {
			left = InsetArea.Min.X - InsetArea1.Min.X,
			top = InsetArea.Min.Y - InsetArea1.Min.Y,
			right = InsetArea1.Max.X - InsetArea.Max.X,
			bottom = InsetArea1.Max.Y - InsetArea.Max.Y
		}
	else
		local MainGuiModule = if FlagsModule.FoundationUseMainGuiUtility then GetMainGuiModule() elseif IsPluginSecurityModule() then CoreGui else PlayerGui
		local _FullscreenTestGui = Instance.new("ScreenGui")
		_FullscreenTestGui.Name = "_FullscreenTestGui"
		_FullscreenTestGui.Parent = MainGuiModule
		_FullscreenTestGui.ScreenInsets = Enum.ScreenInsets.None
		local _DeviceTestGui = Instance.new("ScreenGui")
		_DeviceTestGui.Name = "_DeviceTestGui"
		_DeviceTestGui.Parent = MainGuiModule
		_DeviceTestGui.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
		local AbsolutePositionDelta = _DeviceTestGui.AbsolutePosition - _FullscreenTestGui.AbsolutePosition
		local AbsolutePositionDelta1 = _FullscreenTestGui.AbsolutePosition + _FullscreenTestGui.AbsoluteSize - (_DeviceTestGui.AbsolutePosition + _DeviceTestGui.AbsoluteSize)
		local config = {
			left = AbsolutePositionDelta.X,
			top = AbsolutePositionDelta.Y,
			right = AbsolutePositionDelta1.X,
			bottom = AbsolutePositionDelta1.Y
		}
		_FullscreenTestGui.Parent = nil
		_DeviceTestGui.Parent = nil
		_FullscreenTestGui:Destroy()
		_DeviceTestGui:Destroy()
		
		return config
	end
end