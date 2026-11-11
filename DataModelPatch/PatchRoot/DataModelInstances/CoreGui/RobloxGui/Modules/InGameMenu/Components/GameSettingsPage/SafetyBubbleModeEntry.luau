local CorePackages = game:GetService("CorePackages")
local GameSettings = UserSettings().GameSettings
local LuauPolyfillModule = require(CorePackages.Packages.LuauPolyfill)
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local RoactModule = require(CorePackages.Packages.Roact)
local T = InGameMenuDependenciesModule.t
local Parent = script.Parent.Parent.Parent
local ThemedTextLabelModule = require(Parent.Components.ThemedTextLabel)
local VRSafetyBubbleModePropertyChangedSignal = GameSettings:GetPropertyChangedSignal("VRSafetyBubbleMode")
local ExternalEventConnectionModule = require(Parent.Utility.ExternalEventConnection)
local InputLabelModule = require(script.Parent.InputLabel)
local RadioButtonList = InGameMenuDependenciesModule.UIBlox.App.InputButton.RadioButtonList
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local SendAnalyticsModule = require(Parent.Utility.SendAnalytics)
local ConstantsModule = require(Parent.Resources.Constants)
local v1 = require(Parent.Flags.FFlagFixSafetyBubbleWidth)()
local config = {
	Title = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeTitle",
	Description = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeDescription",
	["Enum.VRSafetyBubbleMode.NoOne"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeNoOne",
	["Enum.VRSafetyBubbleMode.OnlyFriends"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeOnlyFriends",
	["Enum.VRSafetyBubbleMode.Anyone"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeAnyone"
}
local EnumItems = Enum.VRSafetyBubbleMode:GetEnumItems()

local function _(p1)
	-- upvalues: LuauPolyfillModule (copy), EnumItems (copy)
	return LuauPolyfillModule.Array.indexOf(EnumItems, p1)
end

local _ = function(p1)
	-- upvalues: EnumItems (copy), GameSettings (copy), SendAnalyticsModule (copy), ConstantsModule (copy)
	local EnumItem = EnumItems[p1]
	GameSettings.VRSafetyBubbleMode = EnumItem
	SendAnalyticsModule(ConstantsModule.AnalyticsSettingsChangeName, ConstantsModule.AnalyticsSettingsSafetyBubbleModeChangeName, { mode = tostring(EnumItem) })
end

local SafetyBubbleModeEntry = RoactModule.PureComponent:extend("SafetyBubbleModeEntry")
SafetyBubbleModeEntry.validateProps = T.strictInterface({ LayoutOrder = T.optional(T.integer) })

function SafetyBubbleModeEntry.init(p1)
	-- upvalues: GameSettings (copy), LuauPolyfillModule (copy), EnumItems (copy)
	p1:setState({
		selectedMode = LuauPolyfillModule.Array.indexOf(EnumItems, GameSettings.VRSafetyBubbleMode)
	})
end

function SafetyBubbleModeEntry.render(p1)
	-- upvalues: WithLocalizationModule (copy), config (copy), RoactModule (copy), ExternalEventConnectionModule (copy), VRSafetyBubbleModePropertyChangedSignal (copy), GameSettings (copy), LuauPolyfillModule (copy), EnumItems (copy), InputLabelModule (copy), ThemedTextLabelModule (copy), RadioButtonList (copy), SendAnalyticsModule (copy), ConstantsModule (copy), v1 (copy)
	return WithLocalizationModule(config)(function(p2)
		-- upvalues: RoactModule (upval), ExternalEventConnectionModule (upval), VRSafetyBubbleModePropertyChangedSignal (upval), p1 (copy), GameSettings (upval), LuauPolyfillModule (upval), EnumItems (upval), InputLabelModule (upval), config (upval), ThemedTextLabelModule (upval), RadioButtonList (upval), SendAnalyticsModule (upval), ConstantsModule (upval), v1 (upval)
		return RoactModule.createFragment({
			VRSafetyBubbleModeListener = RoactModule.createElement(ExternalEventConnectionModule, {
				event = VRSafetyBubbleModePropertyChangedSignal,
				callback = function()
					-- upvalues: p1 (upval), GameSettings (upval), LuauPolyfillModule (upval), EnumItems (upval)
					p1:setState({
						selectedMode = LuauPolyfillModule.Array.indexOf(EnumItems, GameSettings.VRSafetyBubbleMode)
					})
				end
			}),
			SafetyBubbleModeEntrySelector = RoactModule.createElement("Frame", {
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
				InputLabel = RoactModule.createElement(InputLabelModule, {
					LayoutOrder = 1,
					localizationKey = config.Title,
					Size = UDim2.new(1, 0, 0, 0),
					Position = UDim2.new(0, 0, 0, 0),
					AnchorPoint = Vector2.new(0, 0)
				}),
				InputDescription = RoactModule.createElement(ThemedTextLabelModule, {
					themeKey = "TextDefault",
					fontKey = "CaptionHeader",
					TextWrapped = true,
					LayoutOrder = 2,
					Text = p2.Description,
					Size = UDim2.new(0.9, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				RadioList = RoactModule.createElement(RadioButtonList, {
					layoutOrder = 3,
					automaticSize = true,
					radioButtons = LuauPolyfillModule.Array.map(EnumItems, function(p3, _)
						-- upvalues: p2 (copy)
						return { label = p2[tostring(p3)] }
					end),
					onActivated = function(p3)
						-- upvalues: EnumItems (upval), GameSettings (upval), SendAnalyticsModule (upval), ConstantsModule (upval)
						local EnumItem = EnumItems[p3]
						GameSettings.VRSafetyBubbleMode = EnumItem
						SendAnalyticsModule(ConstantsModule.AnalyticsSettingsChangeName, ConstantsModule.AnalyticsSettingsSafetyBubbleModeChangeName, { mode = tostring(EnumItem) })
					end,
					currentValue = p1.state.selectedMode,
					padding = UDim.new(0, 20),
					elementSize = if v1 then UDim2.new(1, 0, 0, 20) else UDim2.new(0, 0, 0, 20)
				})
			})
		})
	end)
end

return SafetyBubbleModeEntry