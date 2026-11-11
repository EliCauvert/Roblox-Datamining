local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local UseLocalUserIdFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useLocalUserId
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local Logger = require(CorePackages.Workspace.Packages.Loggers).Logger
local DropdownMenu = UIBloxModule.App.Menu.DropdownMenu
local DeviceSettingsPageSettingModule = require(Modules.LuaApp.Components.More.DeviceSettings.DeviceSettingsPageSetting)
local SkyStyleUtilsModule = require(Modules.LuaApp.Components.More.SkyStyleUtils)
local SkyStyleEnum = SkyStyleUtilsModule.SkyStyleEnum

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseTokensFunction (copy), UseLocalUserIdFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), SkyStyleUtilsModule (copy), SkyStyleEnum (copy), Logger (copy), DeviceSettingsPageSettingModule (copy), DropdownMenu (copy)
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = UseTokensFunction()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local _UDim = UDim.new(0, UseTokensResult.Size.Size_1200)
	local UseLocalizationResult = UseLocalizationFunction({
		skyStyleHeading = "Feature.Accessibility.Heading.SkyStyle",
		skyStyleDescription = "Feature.Accessibility.Description.SkyStyle",
		skyStyleDay = "Feature.Accessibility.SkyStyle.Day",
		skyStyleNight = "Feature.Accessibility.SkyStyle.Night"
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: SkyStyleUtilsModule (upval), UseLocalUserIdResult (copy)
		return SkyStyleUtilsModule.getCachedSkyStyle(UseLocalUserIdResult)
	end)
	ReactModule.useEffect(function()
		-- upvalues: SkyStyleUtilsModule (upval), UseLocalUserIdResult (copy), UseStateResult2 (copy)
		UseStateResult2((SkyStyleUtilsModule.getCachedSkyStyle(UseLocalUserIdResult)))
	end, { UseLocalUserIdResult })
	
	return ReactModule.createElement(DeviceSettingsPageSettingModule, {
		style = UseStyleResult,
		header = UseLocalizationResult.skyStyleHeading,
		description = UseLocalizationResult.skyStyleDescription,
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
				placeholder = if UseStateResult == SkyStyleEnum.Day then UseLocalizationResult.skyStyleDay elseif UseStateResult == SkyStyleEnum.Night then UseLocalizationResult.skyStyleNight else "",
				onChange = ReactModule.useCallback(function(Text)
					-- upvalues: SkyStyleUtilsModule (upval), Logger (upval), UseStateResult2 (copy), UseLocalUserIdResult (copy)
					local SkyStyleFromName = SkyStyleUtilsModule.getSkyStyleFromName(Text)
					
					if SkyStyleFromName then
						Logger:info("[SkyStyleSetting] The user selected sky style: " .. SkyStyleFromName)
						UseStateResult2(SkyStyleFromName)
						SkyStyleUtilsModule.setCachedSkyStyle(UseLocalUserIdResult, SkyStyleFromName)
						SkyStyleUtilsModule.applySkyStyle(SkyStyleFromName)
						
						return
					else
						Logger:warning("[SkyStyleSetting] Invalid sky style: " .. Text)
					end
				end, { UseLocalUserIdResult }),
				height = _UDim,
				screenSize = p1.screenSize,
				onMenuOpenChange = p1.onMenuOpenChange,
				defaultKey = UseStateResult,
				cellDatas = {
					{
						key = SkyStyleEnum.Day,
						text = UseLocalizationResult.skyStyleDay
					},
					{
						key = SkyStyleEnum.Night,
						text = UseLocalizationResult.skyStyleNight
					}
				}
			})
		})
	})
end