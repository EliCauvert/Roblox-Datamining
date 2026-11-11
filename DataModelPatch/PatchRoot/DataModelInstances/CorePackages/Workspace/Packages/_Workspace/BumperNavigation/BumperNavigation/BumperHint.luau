local Parent = script:FindFirstAncestor("BumperNavigation").Parent
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local ResponsiveModule = require(Parent.Responsive)
local Icon = FoundationModule.Icon
local Enums = FoundationModule.Enums
local FFlagPlayStationBumperHint = require(Parent.SharedFlags).FFlagPlayStationBumperHint
local config = { Xbox = "Xbox", PlayStation = "PlayStation" }
local config1 = {
	Xbox = {
		[Enum.KeyCode.ButtonL1] = Enums.IconName.XboxLb,
		[Enum.KeyCode.ButtonR1] = Enums.IconName.XboxRb
	},
	PlayStation = {
		[Enum.KeyCode.ButtonL1] = Enums.IconName.PsL1,
		[Enum.KeyCode.ButtonR1] = Enums.IconName.PsR1
	}
}

local function _(p1)
	-- upvalues: UserInputService (copy), config (copy), config1 (copy)
	local function _(): string
		-- upvalues: UserInputService (upval)
		return if UserInputService:GetStringForKeyCode(Enum.KeyCode.ButtonA) == "ButtonCross" then "PlayStation" else "Xbox"
	end
	
	return config1[if UserInputService:GetStringForKeyCode(Enum.KeyCode.ButtonA) == "ButtonCross" then config.PlayStation else config.Xbox][p1]
end

function BumperHint(p2)
	-- upvalues: ResponsiveModule (copy), FFlagPlayStationBumperHint (copy), UserInputService (copy), config (copy), config1 (copy), Enums (copy), CryoModule (copy), ReactModule (copy), Icon (copy)
	local IsUsePreferredInputResultMatch = ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional
	local IsUsePreferredInputResultMatch1: boolean = if p2.isPersistent then true else IsUsePreferredInputResultMatch
	local Entry = nil
	
	if FFlagPlayStationBumperHint then
		local function _(): string
			-- upvalues: UserInputService (upval)
			return if UserInputService:GetStringForKeyCode(Enum.KeyCode.ButtonA) == "ButtonCross" then "PlayStation" else "Xbox"
		end
		
		Entry = config1[if UserInputService:GetStringForKeyCode(Enum.KeyCode.ButtonA) == "ButtonCross" then config.PlayStation else config.Xbox][if p2.isLeftBumper then Enum.KeyCode.ButtonL1 else Enum.KeyCode.ButtonR1]
	else
		Entry = if p2.isLeftBumper then Enums.IconName.XboxLb else Enums.IconName.XboxRb
	end
	local JoinResult = {
		name = Entry,
		size = Enums.IconSize.Large,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Visible = IsUsePreferredInputResultMatch1
	}
	
	if p2.overrideIconProps then
		JoinResult = CryoModule.Dictionary.join(JoinResult, p2.overrideIconProps)
	end
	return if p2.squareSize then ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(p2.squareSize, p2.squareSize),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	}, { Icon = ReactModule.createElement(Icon, JoinResult) }) else ReactModule.createElement(Icon, JoinResult)
end

return BumperHint