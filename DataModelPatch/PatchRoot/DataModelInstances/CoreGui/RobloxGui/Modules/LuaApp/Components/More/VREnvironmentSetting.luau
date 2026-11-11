local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local UseLocalUserIdFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useLocalUserId
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local DropdownMenu = UIBloxModule.App.Menu.DropdownMenu
local DeviceSettingsPageSettingModule = require(Modules.LuaApp.Components.More.DeviceSettings.DeviceSettingsPageSetting)
local VREnvironmentSettingUtilsModule = require(Modules.LuaApp.Components.More.VREnvironmentSettingUtils)
local VREnvironmentSettingEnum = VREnvironmentSettingUtilsModule.VREnvironmentSettingEnum

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseTokensFunction (copy), UseLocalUserIdFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), VREnvironmentSettingUtilsModule (copy), VREnvironmentSettingEnum (copy), DeviceSettingsPageSettingModule (copy), DropdownMenu (copy)
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = UseTokensFunction()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local _UDim = UDim.new(0, UseTokensResult.Size.Size_1200)
	local UseLocalizationResult = UseLocalizationFunction({
		vrEnvironmentSettingHeading = "Feature.Accessibility.Heading.VREnvironmentSetting",
		vrEnvironmentSettingDescription = "Feature.Accessibility.Description.VREnvironmentSetting",
		vrEnvironmentSettingSystem = "Feature.Accessibility.VREnvironmentSetting.System",
		vrEnvironmentSettingLight = "Feature.Accessibility.VREnvironmentSetting.Light",
		vrEnvironmentSettingDark = "Feature.Accessibility.VREnvironmentSetting.Dark"
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: VREnvironmentSettingUtilsModule (upval), UseLocalUserIdResult (copy)
		return VREnvironmentSettingUtilsModule.getCachedEnvironmentSetting(UseLocalUserIdResult)
	end)
	ReactModule.useEffect(function()
		-- upvalues: VREnvironmentSettingUtilsModule (upval), UseLocalUserIdResult (copy), UseStateResult2 (copy)
		UseStateResult2((VREnvironmentSettingUtilsModule.getCachedEnvironmentSetting(UseLocalUserIdResult)))
	end, { UseLocalUserIdResult })
	
	return ReactModule.createElement(DeviceSettingsPageSettingModule, {
		style = UseStyleResult,
		header = UseLocalizationResult.vrEnvironmentSettingHeading,
		description = UseLocalizationResult.vrEnvironmentSettingDescription,
		layoutOrder = p1.layoutOrder,
		zIndex = p1.zIndex,
		topToBottom = not p1.isWideView,
		Control = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = if p1.isWideView then UDim2.new(0, p1.contextualSliderWidth, 0, _UDim.Offset) else UDim2.new(1, 0, 0, _UDim.Offset)
		}, {
			ReactModule.createElement(DropdownMenu, {
				errorState = false,
				showDropShadow = false,
				dropdownMenuListPositionFixed = true,
				placeholder = if UseStateResult == VREnvironmentSettingEnum.System then UseLocalizationResult.vrEnvironmentSettingSystem elseif UseStateResult == VREnvironmentSettingEnum.Light then UseLocalizationResult.vrEnvironmentSettingLight elseif UseStateResult == VREnvironmentSettingEnum.Dark then UseLocalizationResult.vrEnvironmentSettingDark else "",
				onChange = ReactModule.useCallback(function(Text)
					-- upvalues: VREnvironmentSettingUtilsModule (upval), UseStateResult2 (copy), UseLocalUserIdResult (copy)
					local EnvironmentSettingFromName = VREnvironmentSettingUtilsModule.getEnvironmentSettingFromName(Text)
					
					if not EnvironmentSettingFromName then
						error("Invalid VR environment setting: " .. Text)
					end
					UseStateResult2(EnvironmentSettingFromName)
					VREnvironmentSettingUtilsModule.setCachedEnvironmentSetting(UseLocalUserIdResult, EnvironmentSettingFromName)
					VREnvironmentSettingUtilsModule.applyEnvironmentSetting(EnvironmentSettingFromName)
				end, { UseLocalUserIdResult }),
				height = _UDim,
				screenSize = p1.screenSize,
				onMenuOpenChange = p1.onMenuOpenChange,
				defaultKey = UseStateResult,
				cellDatas = {
					{
						key = VREnvironmentSettingEnum.System,
						text = UseLocalizationResult.vrEnvironmentSettingSystem
					},
					{
						key = VREnvironmentSettingEnum.Light,
						text = UseLocalizationResult.vrEnvironmentSettingLight
					},
					{
						key = VREnvironmentSettingEnum.Dark,
						text = UseLocalizationResult.vrEnvironmentSettingDark
					}
				}
			})
		})
	})
end