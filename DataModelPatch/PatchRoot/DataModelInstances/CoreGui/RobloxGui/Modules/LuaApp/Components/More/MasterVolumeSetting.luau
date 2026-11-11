local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local FoundationModule = require(CorePackages.Packages.Foundation)
local ReactModule = require(CorePackages.Packages.React)
local SoundManager = require(CorePackages.Workspace.Packages.SoundManager).SoundManager
local Sounds = require(CorePackages.Workspace.Packages.SoundManager).Sounds
local SoundGroups = require(CorePackages.Workspace.Packages.SoundManager).SoundGroups
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local ConstantsModule = require(Modules.LuaApp.Constants)
local DeviceSettingsPageSettingModule = require(Modules.LuaApp.Components.More.DeviceSettings.DeviceSettingsPageSetting)
local Slider = FoundationModule.Slider
local GetFFlagEnableVolumeSliderQOLFixFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableVolumeSliderQOLFix

return (require(CorePackages.Packages.RoactRodux).connect(function(p1, _)
	return { formFactor = p1.FormFactor }
end)(function(p1)
	-- upvalues: ReactModule (copy), UserGameSettings (copy), UseStyleFunction (copy), UseLocalizationFunction (copy), FormFactor (copy), GetFFlagEnableVolumeSliderQOLFixFunction (copy), SoundManager (copy), Sounds (copy), SoundGroups (copy), DeviceSettingsPageSettingModule (copy), ConstantsModule (copy), Slider (copy), FoundationModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(UserGameSettings.MasterVolume)
	local UseStyleResult = UseStyleFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		volumeSliderDescription = "Application.Settings.VolumeSliderDescription",
		volumeHeader = "CoreScripts.InGameMenu.GameSettings.Volume"
	})
	local IsFormFactorMatch = p1.formFactor == FormFactor.WIDE
	local ScaledBaseSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.CaptionBody.RelativeSize
	local CaptionBodyFont = UseStyleResult.Font.CaptionBody.Font
	local ScaledStandard = UseStyleResult.Tokens.Stroke.Standard * 310
	local UseResult = ReactModule.useCallback(function(p2: number)
		-- upvalues: UserGameSettings (upval)
		UserGameSettings.MasterVolume = p2 / 10
	end, {})
	local UseResult1 = if GetFFlagEnableVolumeSliderQOLFixFunction then ReactModule.useCallback(function()
		-- upvalues: SoundManager (upval), Sounds (upval), SoundGroups (upval)
		SoundManager:PlaySound(Sounds.Select.Name, {}, SoundGroups.AppBackground)
	end, {}) else nil
	ReactModule.useEffect(function()
		-- upvalues: UserGameSettings (upval), UseStateResult2 (copy), GetFFlagEnableVolumeSliderQOLFixFunction (upval), SoundManager (upval), Sounds (upval), SoundGroups (upval)
		local Connection = UserGameSettings:GetPropertyChangedSignal("MasterVolume"):Connect(function()
			-- upvalues: UserGameSettings (upval), UseStateResult2 (upval), GetFFlagEnableVolumeSliderQOLFixFunction (upval), SoundManager (upval), Sounds (upval), SoundGroups (upval)
			UseStateResult2(UserGameSettings.MasterVolume)
			
			if not GetFFlagEnableVolumeSliderQOLFixFunction() then
				SoundManager:PlaySound(Sounds.VolumeTest.Name, {}, SoundGroups.AppBackground)
			end
		end)
		
		return function()
			-- upvalues: Connection (copy)
			if Connection then
				Connection:Disconnect()
			end
		end
	end)
	
	return ReactModule.createElement(DeviceSettingsPageSettingModule, {
		style = UseStyleResult,
		header = UseLocalizationResult.volumeHeader,
		description = UseLocalizationResult.volumeSliderDescription,
		layoutOrder = p1.layoutOrder,
		topToBottom = not IsFormFactorMatch,
		Control = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = if IsFormFactorMatch then UDim2.new(0, ScaledStandard, 0, 0) else UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.Name,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, ConstantsModule.MORE_PAGE_SECTION_PADDING)
			}),
			ContextualVolumeSlider = ReactModule.createElement(Slider, {
				step = 1,
				width = UDim.new(1, 0),
				range = NumberRange.new(0, 10),
				value = math.clamp(UseStateResult * 10, 0, 10),
				size = FoundationModule.Enums.InputSize.Large,
				knobVisibility = FoundationModule.Enums.ScrollBarVisibility.Always,
				variant = FoundationModule.Enums.SliderVariant.Emphasis,
				onValueChanged = UseResult,
				onDragEnded = UseResult1
			}),
			Frame = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				UIPadding = ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, -10) }),
				LeftText = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					Size = UDim2.fromScale(1, 0),
					Text = tostring(0),
					Font = CaptionBodyFont,
					TextSize = ScaledBaseSize,
					TextColor3 = UseStyleResult.Theme.TextMuted.Color,
					TextTransparency = UseStyleResult.Theme.TextMuted.Transparency,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				RightText = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 2,
					Size = UDim2.fromScale(1, 0),
					Text = tostring(10),
					Font = CaptionBodyFont,
					TextSize = ScaledBaseSize,
					TextColor3 = UseStyleResult.Theme.TextMuted.Color,
					TextTransparency = UseStyleResult.Theme.TextMuted.Transparency,
					TextXAlignment = Enum.TextXAlignment.Right
				})
			})
		})
	})
end))