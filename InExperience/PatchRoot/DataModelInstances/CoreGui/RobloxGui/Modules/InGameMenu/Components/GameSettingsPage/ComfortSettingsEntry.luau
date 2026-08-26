local corePackagesService = game:GetService("CorePackages")
local gameSettings = UserSettings().GameSettings
local luauPolyfillModule = require(corePackagesService.Packages.LuauPolyfill)
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roactModule = require(corePackagesService.Packages.Roact)
local t = inGameMenuDependenciesModule.t
local segmentedControl = inGameMenuDependenciesModule.UIBlox.App.Control.SegmentedControl
local parent = script.Parent.Parent.Parent
local themedTextLabelModule = require(parent.Components.ThemedTextLabel)
local VRComfortSettingPropertyChangedSignal = gameSettings:GetPropertyChangedSignal("VRComfortSetting")
local externalEventConnectionModule = require(parent.Utility.ExternalEventConnection)
local withLocalizationModule = require(parent.Localization.withLocalization)
local sendAnalyticsModule = require(parent.Utility.SendAnalytics)
local constantsModule = require(parent.Resources.Constants)
local t_1 = {
	Description = "CoreScripts.InGameMenu.GameSettings.ComfortSettingsDescription",
	["Enum.VRComfortSetting.Comfort"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingComfort",
	["Enum.VRComfortSetting.Normal"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingNormal",
	["Enum.VRComfortSetting.Expert"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingExpert",
	["Enum.VRComfortSetting.Custom"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingCustom"
}
local enumItems = Enum.VRComfortSetting:GetEnumItems()

local function _(value)
	-- upvalues: luauPolyfillModule (ref), enumItems (ref)
	return luauPolyfillModule.Array.indexOf(enumItems, value)
end

local _ = function(value)
	-- upvalues: enumItems (ref), gameSettings (ref), sendAnalyticsModule (ref), constantsModule (ref)
	local var1 = enumItems[value]
	gameSettings.VRComfortSetting = var1
	sendAnalyticsModule(constantsModule.AnalyticsSettingsChangeName, constantsModule.AnalyticsSettingsVRComfortSettingChangeName, { mode = tostring(var1) })
end

local comfortSettingsEntry = roactModule.PureComponent:extend("ComfortSettingsEntry")
comfortSettingsEntry.validateProps = t.strictInterface({ LayoutOrder = t.optional(t.integer) })

function comfortSettingsEntry.init(p1)
	-- upvalues: gameSettings (ref), luauPolyfillModule (ref), enumItems (ref)
	p1:setState({
		selectedMode = luauPolyfillModule.Array.indexOf(enumItems, gameSettings.VRComfortSetting)
	})
end

function comfortSettingsEntry.render(p1)
	-- upvalues: withLocalizationModule (ref), t_1 (ref), roactModule (ref), externalEventConnectionModule (ref), VRComfortSettingPropertyChangedSignal (ref), gameSettings (ref), luauPolyfillModule (ref), enumItems (ref), themedTextLabelModule (ref), segmentedControl (ref), sendAnalyticsModule (ref), constantsModule (ref)
	return withLocalizationModule(t_1)(function(p2)
		-- upvalues: roactModule (copy), externalEventConnectionModule (copy), VRComfortSettingPropertyChangedSignal (copy), p1 (ref), gameSettings (copy), luauPolyfillModule (copy), enumItems (copy), themedTextLabelModule (copy), segmentedControl (copy), sendAnalyticsModule (copy), constantsModule (copy)
		return roactModule.createFragment({
			VRComfortSettingListener = roactModule.createElement(externalEventConnectionModule, {
				event = VRComfortSettingPropertyChangedSignal,
				callback = function()
					-- upvalues: p1 (copy), gameSettings (copy), luauPolyfillModule (copy), enumItems (copy)
					p1:setState({
						selectedMode = luauPolyfillModule.Array.indexOf(enumItems, gameSettings.VRComfortSetting)
					})
				end
			}),
			ComfortSettingEntrySelector = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				LayoutOrder = p1.props.LayoutOrder
			}, {
				Padding = roactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24),
					PaddingBottom = UDim.new(0, 15),
					PaddingTop = UDim.new(0, 15)
				}),
				ListLayout = roactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 20)
				}),
				InputDescription = roactModule.createElement(themedTextLabelModule, {
					themeKey = "TextDefault",
					fontKey = "CaptionHeader",
					TextWrapped = true,
					LayoutOrder = 1,
					Text = p2.Description,
					Size = UDim2.new(0.9, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				Frame = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					SegmentedControl = roactModule.createElement(segmentedControl, {
						width = UDim.new(1, 0),
						selectedTabIndex = p1.state.selectedMode,
						onTabActivated = function(p3)
							-- upvalues: enumItems (copy), gameSettings (copy), sendAnalyticsModule (copy), constantsModule (copy)
							local var1 = enumItems[p3]
							gameSettings.VRComfortSetting = var1
							sendAnalyticsModule(constantsModule.AnalyticsSettingsChangeName, constantsModule.AnalyticsSettingsVRComfortSettingChangeName, { mode = tostring(var1) })
						end,
						tabs = luauPolyfillModule.Array.map(enumItems, function(p3, _)
							-- upvalues: p2 (ref)
							return { tabName = p2[tostring(p3)] }
						end)
					})
				})
			})
		})
	end)
end

return comfortSettingsEntry