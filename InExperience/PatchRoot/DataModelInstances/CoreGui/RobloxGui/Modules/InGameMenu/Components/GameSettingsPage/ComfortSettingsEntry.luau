local CorePackages = game:GetService("CorePackages")
local GameSettings = UserSettings().GameSettings
local LuauPolyfillModule = require(CorePackages.Packages.LuauPolyfill)
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local RoactModule = require(CorePackages.Packages.Roact)
local T = InGameMenuDependenciesModule.t
local SegmentedControl = InGameMenuDependenciesModule.UIBlox.App.Control.SegmentedControl
local Parent = script.Parent.Parent.Parent
local ThemedTextLabelModule = require(Parent.Components.ThemedTextLabel)
local VRComfortSettingPropertyChangedSignal = GameSettings:GetPropertyChangedSignal("VRComfortSetting")
local ExternalEventConnectionModule = require(Parent.Utility.ExternalEventConnection)
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local SendAnalyticsModule = require(Parent.Utility.SendAnalytics)
local ConstantsModule = require(Parent.Resources.Constants)
local config = {
	Description = "CoreScripts.InGameMenu.GameSettings.ComfortSettingsDescription",
	["Enum.VRComfortSetting.Comfort"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingComfort",
	["Enum.VRComfortSetting.Normal"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingNormal",
	["Enum.VRComfortSetting.Expert"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingExpert",
	["Enum.VRComfortSetting.Custom"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingCustom"
}
local EnumItems = Enum.VRComfortSetting:GetEnumItems()

local function _(p1) --[[ Line: 40 | Named "getComfortSettingIndex" ]]
	-- upvalues: LuauPolyfillModule (copy), EnumItems (copy)
	return LuauPolyfillModule.Array.indexOf(EnumItems, p1)
end

local _ = function(p1) --[[ Line: 44 | Named "setComfortSettingByIndex" ]]
	-- upvalues: EnumItems (copy), GameSettings (copy), SendAnalyticsModule (copy), ConstantsModule (copy)
	local EnumItem = EnumItems[p1]
	GameSettings.VRComfortSetting = EnumItem
	SendAnalyticsModule(ConstantsModule.AnalyticsSettingsChangeName, ConstantsModule.AnalyticsSettingsVRComfortSettingChangeName, { mode = tostring(EnumItem) })
end

local ComfortSettingsEntry = RoactModule.PureComponent:extend("ComfortSettingsEntry")
ComfortSettingsEntry.validateProps = T.strictInterface({ LayoutOrder = T.optional(T.integer) })

function ComfortSettingsEntry.init(p1) --[[ Line: 57 ]]
	-- upvalues: GameSettings (copy), LuauPolyfillModule (copy), EnumItems (copy)
	p1:setState({
		selectedMode = LuauPolyfillModule.Array.indexOf(EnumItems, GameSettings.VRComfortSetting)
	})
end

function ComfortSettingsEntry.render(p1) --[[ Line: 63 ]]
	-- upvalues: WithLocalizationModule (copy), config (copy), RoactModule (copy), ExternalEventConnectionModule (copy), VRComfortSettingPropertyChangedSignal (copy), GameSettings (copy), LuauPolyfillModule (copy), EnumItems (copy), ThemedTextLabelModule (copy), SegmentedControl (copy), SendAnalyticsModule (copy), ConstantsModule (copy)
	return WithLocalizationModule(config)(function(p2) --[[ Line: 64 ]]
		-- upvalues: RoactModule (upval), ExternalEventConnectionModule (upval), VRComfortSettingPropertyChangedSignal (upval), p1 (copy), GameSettings (upval), LuauPolyfillModule (upval), EnumItems (upval), ThemedTextLabelModule (upval), SegmentedControl (upval), SendAnalyticsModule (upval), ConstantsModule (upval)
		return RoactModule.createFragment({
			VRComfortSettingListener = RoactModule.createElement(ExternalEventConnectionModule, {
				event = VRComfortSettingPropertyChangedSignal,
				callback = function() --[[ Line: 68 ]]
					-- upvalues: p1 (upval), GameSettings (upval), LuauPolyfillModule (upval), EnumItems (upval)
					p1:setState({
						selectedMode = LuauPolyfillModule.Array.indexOf(EnumItems, GameSettings.VRComfortSetting)
					})
				end
			}),
			ComfortSettingEntrySelector = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				LayoutOrder = p1.props.LayoutOrder
			}, {
				Padding = RoactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24),
					PaddingBottom = UDim.new(0, 15),
					PaddingTop = UDim.new(0, 15)
				}),
				ListLayout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 20)
				}),
				InputDescription = RoactModule.createElement(ThemedTextLabelModule, {
					themeKey = "TextDefault",
					fontKey = "CaptionHeader",
					TextWrapped = true,
					LayoutOrder = 1,
					Text = p2.Description,
					Size = UDim2.new(0.9, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				Frame = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					SegmentedControl = RoactModule.createElement(SegmentedControl, {
						width = UDim.new(1, 0),
						selectedTabIndex = p1.state.selectedMode,
						onTabActivated = function(p3) --[[ Line: 113 ]]
							-- upvalues: EnumItems (upval), GameSettings (upval), SendAnalyticsModule (upval), ConstantsModule (upval)
							local EnumItem = EnumItems[p3]
							GameSettings.VRComfortSetting = EnumItem
							SendAnalyticsModule(ConstantsModule.AnalyticsSettingsChangeName, ConstantsModule.AnalyticsSettingsVRComfortSettingChangeName, { mode = tostring(EnumItem) })
						end,
						tabs = LuauPolyfillModule.Array.map(EnumItems, function(p3, _) --[[ Line: 116 ]]
							-- upvalues: p2 (copy)
							return { tabName = p2[tostring(p3)] }
						end)
					})
				})
			})
		})
	end)
end

return ComfortSettingsEntry