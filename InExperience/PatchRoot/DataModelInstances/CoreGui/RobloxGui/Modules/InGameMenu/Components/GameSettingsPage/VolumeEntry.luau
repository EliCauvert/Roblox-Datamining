local CoreGui = game:GetService("CoreGui")
local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local MasterVolumePropertyChangedSignal = UserGameSettings:GetPropertyChangedSignal("MasterVolume")
local Parent = script.Parent.Parent.Parent
local FFlagRenameVolumeToMainVolumeModule = require(CoreGui.RobloxGui.Modules.Flags.FFlagRenameVolumeToMainVolume)
local ExternalEventConnectionModule = require(Parent.Utility.ExternalEventConnection)
local SliderEntryModule = require(script.Parent.SliderEntry)
local SendAnalyticsModule = require(Parent.Utility.SendAnalytics)
local ConstantsModule = require(Parent.Resources.Constants)

if CoreGui.RobloxGui:FindFirstChild("Sounds") == nil then
	local Sounds = Instance.new("Folder")
	Sounds.Name = "Sounds"
	Sounds.Parent = CoreGui.RobloxGui
end
local VolumeChangeSound = Instance.new("Sound", CoreGui.RobloxGui.Sounds)
VolumeChangeSound.Name = "VolumeChangeSound"
VolumeChangeSound.Volume = 1
VolumeChangeSound.SoundId = "rbxasset://sounds/uuhhh.mp3"
local VolumeEntry = Roact.PureComponent:extend("VolumeEntry")
VolumeEntry.validateProps = T.strictInterface({
	LayoutOrder = T.integer,
	canCaptureFocus = T.optional(T.boolean),
	isMenuOpen = T.optional(T.boolean),
	buttonRef = T.optional(T.table)
})

function VolumeEntry.init(p1) --[[ Line: 41 ]]
	-- upvalues: UserGameSettings (copy)
	function p1.onVolumeChanged() --[[ Line: 42 ]]
		-- upvalues: p1 (copy), UserGameSettings (upval)
		p1:setState({
			volume = math.floor(UserGameSettings.MasterVolume * 10 + 0.5)
		})
	end
	
	p1.onVolumeChanged()
end

function VolumeEntry.render(p1) --[[ Line: 51 ]]
	-- upvalues: Roact (copy), SliderEntryModule (copy), FFlagRenameVolumeToMainVolumeModule (copy), UserGameSettings (copy), VolumeChangeSound (copy), SendAnalyticsModule (copy), ConstantsModule (copy), ExternalEventConnectionModule (copy), MasterVolumePropertyChangedSignal (copy)
	return Roact.createFragment({
		VolumeSlider = Roact.createElement(SliderEntryModule, {
			min = 0,
			max = 10,
			stepInterval = 1,
			labelKey = if FFlagRenameVolumeToMainVolumeModule then "CoreScripts.InGameMenu.GameSettings.MainVolume" else "CoreScripts.InGameMenu.GameSettings.Volume",
			LayoutOrder = p1.props.LayoutOrder,
			value = p1.state.volume,
			valueChanged = function(p2: number) --[[ Line: 62 ]]
				-- upvalues: UserGameSettings (upval), VolumeChangeSound (upval), SendAnalyticsModule (upval), ConstantsModule (upval)
				UserGameSettings.MasterVolume = p2 / 10
				VolumeChangeSound:Play()
				SendAnalyticsModule(ConstantsModule.AnalyticsSettingsChangeName, nil, {}, true)
			end,
			canCaptureFocus = p1.props.canCaptureFocus,
			isMenuOpen = p1.props.isMenuOpen,
			buttonRef = p1.props.buttonRef
		}),
		VolumeListener = Roact.createElement(ExternalEventConnectionModule, {
			event = MasterVolumePropertyChangedSignal,
			callback = p1.onVolumeChanged
		})
	})
end

return VolumeEntry