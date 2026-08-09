local coreGuiService = game:GetService("CoreGui")
local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local masterVolumePropertyChangedSignal = userGameSettingsService:GetPropertyChangedSignal("MasterVolume")
local parent = script.Parent.Parent.Parent
local externalEventConnectionModule = require(parent.Utility.ExternalEventConnection)
local sliderEntryModule = require(script.Parent.SliderEntry)
local sendAnalyticsModule = require(parent.Utility.SendAnalytics)
local constantsModule = require(parent.Resources.Constants)

if coreGuiService.RobloxGui:FindFirstChild("Sounds") == nil then
	local sounds = Instance.new("Folder")
	sounds.Name = "Sounds"
	sounds.Parent = coreGuiService.RobloxGui
end
local volumeChangeSound = Instance.new("Sound", coreGuiService.RobloxGui.Sounds)
volumeChangeSound.Name = "VolumeChangeSound"
volumeChangeSound.Volume = 1
volumeChangeSound.SoundId = "rbxasset://sounds/uuhhh.mp3"
local volumeEntry = roact.PureComponent:extend("VolumeEntry")
volumeEntry.validateProps = t.strictInterface({
	LayoutOrder = t.integer,
	canCaptureFocus = t.optional(t.boolean),
	isMenuOpen = t.optional(t.boolean),
	buttonRef = t.optional(t.table)
})

function volumeEntry.init(p0) --[[ line: 39 ]]
	-- upvalues: userGameSettingsService (ref)
	function p0.onVolumeChanged() --[[ line: 40 ]]
		-- upvalues: p0 (ref), userGameSettingsService (copy)
		p0:setState({
			volume = math.floor(userGameSettingsService.MasterVolume * 10 + 0.5)
		})
	end
	
	p0.onVolumeChanged()
end

function volumeEntry.render(p1) --[[ line: 49 ]]
	-- upvalues: roact (ref), sliderEntryModule (ref), userGameSettingsService (ref), volumeChangeSound (ref), sendAnalyticsModule (ref), constantsModule (ref), externalEventConnectionModule (ref), masterVolumePropertyChangedSignal (ref)
	return roact.createFragment({
		VolumeSlider = roact.createElement(sliderEntryModule, {
			labelKey = "CoreScripts.InGameMenu.GameSettings.Volume",
			min = 0,
			max = 10,
			stepInterval = 1,
			LayoutOrder = p1.props.LayoutOrder,
			value = p1.state.volume,
			valueChanged = function(p2) --[[ line: 58 ]]
				-- upvalues: userGameSettingsService (copy), volumeChangeSound (copy), sendAnalyticsModule (copy), constantsModule (copy)
				userGameSettingsService.MasterVolume = p2 / 10
				volumeChangeSound:Play()
				sendAnalyticsModule(constantsModule.AnalyticsSettingsChangeName, nil, {}, true)
			end,
			canCaptureFocus = p1.props.canCaptureFocus,
			isMenuOpen = p1.props.isMenuOpen,
			buttonRef = p1.props.buttonRef
		}),
		VolumeListener = roact.createElement(externalEventConnectionModule, {
			event = masterVolumePropertyChangedSignal,
			callback = p1.onVolumeChanged
		})
	})
end

return volumeEntry