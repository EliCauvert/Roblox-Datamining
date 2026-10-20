local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local ConstantsModule = require(Modules.LuaApp.Constants)
local DeviceSettingsPageSettingModule = require(Modules.LuaApp.Components.More.DeviceSettings.DeviceSettingsPageSetting)
local ContextualSlider = UIBloxModule.App.Slider.ContextualSlider

return (require(CorePackages.Packages.RoactRodux).connect(function(p1, _)
	return { formFactor = p1.FormFactor }
end)(function(p1)
	-- upvalues: UseStyleFunction (copy), UseLocalizationFunction (copy), FormFactor (copy), ReactModule (copy), DeviceSettingsPageSettingModule (copy), ConstantsModule (copy), ContextualSlider (copy)
	local UseStyleResult = UseStyleFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		volumeSliderDescription = p1.volumeSliderDescriptionKey,
		volumeHeader = p1.volumeHeaderKey
	})
	local IsFormFactorMatch = p1.formFactor == FormFactor.WIDE
	local ScaledBaseSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.CaptionBody.RelativeSize
	local CaptionBodyFont = UseStyleResult.Font.CaptionBody.Font
	local ScaledStandard = UseStyleResult.Tokens.Stroke.Standard * 310
	
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
			ContextualSlider = if p1.value == nil then nil else ReactModule.createElement(ContextualSlider, {
				stepInterval = 1,
				min = 0,
				max = 10,
				width = UDim.new(1, 0),
				containerRef = p1.sliderGuiObjectRef,
				value = math.clamp(p1.value * 10, 0, 10),
				onValueChanged = p1.onValueChanged
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