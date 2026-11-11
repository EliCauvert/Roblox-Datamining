local Parent = script.Parent
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local GamepadService = game:GetService("GamepadService")
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local FFlagVCWasDisabledFromMenuOpen = require(Parent.Parent.SharedFlags).FFlagVCWasDisabledFromMenuOpen
local InputModule = require(Parent:WaitForChild("Input"))
local InterfaceModule = require(Parent:WaitForChild("Interface"))
local OnRenderStepModule = require(Parent:WaitForChild("OnRenderStep"))
local TextBox = nil
local LastInputTypeChangedConnection = nil
local MenuOpenedConnection = nil
local Flag = false
local Flag1 = false

local function enableVirtualCursor(MouseLocation)
	-- upvalues: TextBox (ref), InterfaceModule (copy), GamepadService (copy), InputModule (copy), RunService (copy), MenuOpenedConnection (ref), GuiService (copy), FFlagVCWasDisabledFromMenuOpen (copy), Flag1 (ref)
	if TextBox then
		local MouseLocation1 = MouseLocation or TextBox.CursorPosition
		TextBox.Enabled = true
		TextBox.CursorPosition = MouseLocation1
		InterfaceModule:EnableUI(MouseLocation1)
		GamepadService:SetGamepadCursorPosition(MouseLocation1)
		InputModule:EnableInput()
		InputModule:DisablePreview()
		RunService:BindToRenderStep("VirtualCursorStepped", Enum.RenderPriority.Input.Value + 1, TextBox.OnRenderStep)
		MenuOpenedConnection = GuiService.MenuOpened:Connect(function()
			-- upvalues: FFlagVCWasDisabledFromMenuOpen (upval), Flag1 (upval), GamepadService (upval)
			if FFlagVCWasDisabledFromMenuOpen then
				Flag1 = true
			end
			GamepadService.GamepadCursorEnabled = false
		end)
		
		return
	end
end

local function disableVirtualCursor()
	-- upvalues: TextBox (ref), MenuOpenedConnection (ref), InterfaceModule (copy), InputModule (copy), RunService (copy), FFlagVCWasDisabledFromMenuOpen (copy), Flag1 (ref), GuiService (copy)
	if not TextBox.Enabled then return end
	MenuOpenedConnection:Disconnect()
	MenuOpenedConnection = nil
	TextBox.PreviouslySelectedObject = nil
	InterfaceModule:DisableUI()
	InputModule:DisableInput()
	InputModule:EnablePreview()
	RunService:UnbindFromRenderStep("VirtualCursorStepped")
	
	if TextBox.SelectedObject then
		if FFlagVCWasDisabledFromMenuOpen and not Flag1 then
			GuiService.SelectedCoreObject = nil
		end
		GuiService.SelectedObject = nil
		
		if not FFlagVCWasDisabledFromMenuOpen then
			GuiService.SelectedCoreObject = nil
		end
		TextBox.SelectedObject = nil
	end
	if FFlagVCWasDisabledFromMenuOpen then
		Flag1 = false
	end
	TextBox.Enabled = false
end

local Module = {}
Module.__index = Module

function Module:GetEnabled()
	return self.Enabled
end

function Module.new()
	-- upvalues: OnRenderStepModule (copy), LastInputTypeChangedConnection (ref), UserInputService (copy), GamepadService (copy), Flag (ref), InputModule (copy), Module (copy), TextBox (ref)
	local config = {
		Enabled = false,
		SelectedObject = nil,
		PreviouslySelectedObject = nil,
		CursorPosition = Vector2.new()
	}
	
	function config.OnRenderStep(p1)
		-- upvalues: OnRenderStepModule (upval), config (copy)
		OnRenderStepModule(config, p1)
	end
	
	LastInputTypeChangedConnection = UserInputService.LastInputTypeChanged:Connect(function(UserInputType)
		-- upvalues: GamepadService (upval), Flag (upval)
		if UserInputType ~= Enum.UserInputType.Gamepad1 and UserInputType ~= Enum.UserInputType.Focus and GamepadService.GamepadCursorEnabled then
			GamepadService.GamepadCursorEnabled = false
			Flag = true
			
			return
		end
		if UserInputType == Enum.UserInputType.Gamepad1 and Flag then
			GamepadService.GamepadCursorEnabled = true
			Flag = false
		end
	end)
	InputModule:EnablePreview()
	setmetatable(config, Module)
	TextBox = config
	
	return config
end

GamepadService:GetPropertyChangedSignal("GamepadCursorEnabled"):Connect(function()
	-- upvalues: GamepadService (copy), TextBox (ref), UserInputService (copy), enableVirtualCursor (copy), disableVirtualCursor (copy)
	local GamepadCursorEnabled = GamepadService.GamepadCursorEnabled
	
	if TextBox then
		if GamepadCursorEnabled then
			enableVirtualCursor((UserInputService:GetMouseLocation()))
			
			return
		end
		disableVirtualCursor()
	end
end)

return Module.new()