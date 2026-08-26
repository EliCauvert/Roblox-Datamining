local corePackagesService = game:GetService("CorePackages")
local gameSettings = UserSettings().GameSettings
local luauPolyfillModule = require(corePackagesService.Packages.LuauPolyfill)
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roactModule = require(corePackagesService.Packages.Roact)
local t = inGameMenuDependenciesModule.t
local UIBlox = inGameMenuDependenciesModule.UIBlox
local parent = script.Parent.Parent.Parent
local themedTextLabelModule = require(parent.Components.ThemedTextLabel)
local VRSafetyBubbleModePropertyChangedSignal = gameSettings:GetPropertyChangedSignal("VRSafetyBubbleMode")
local externalEventConnectionModule = require(parent.Utility.ExternalEventConnection)
local inputLabelModule = require(script.Parent.InputLabel)
local radioButtonList = UIBlox.App.InputButton.RadioButtonList
local withLocalizationModule = require(parent.Localization.withLocalization)
local sendAnalyticsModule = require(parent.Utility.SendAnalytics)
local constantsModule = require(parent.Resources.Constants)
local var1 = require(parent.Flags.FFlagFixSafetyBubbleWidth)()
local t_1 = {
	Title = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeTitle",
	Description = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeDescription",
	["Enum.VRSafetyBubbleMode.NoOne"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeNoOne",
	["Enum.VRSafetyBubbleMode.OnlyFriends"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeOnlyFriends",
	["Enum.VRSafetyBubbleMode.Anyone"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeAnyone"
}
local enumItems = Enum.VRSafetyBubbleMode:GetEnumItems()

local function _(p1)
	-- upvalues: luauPolyfillModule (ref), enumItems (ref)
	return luauPolyfillModule.Array.indexOf(enumItems, p1)
end

local _ = function(value)
	-- upvalues: enumItems (ref), gameSettings (ref), sendAnalyticsModule (ref), constantsModule (ref)
	local var2 = enumItems[value]
	gameSettings.VRSafetyBubbleMode = var2
	sendAnalyticsModule(constantsModule.AnalyticsSettingsChangeName, constantsModule.AnalyticsSettingsSafetyBubbleModeChangeName, { mode = tostring(var2) })
end

local safetyBubbleModeEntry = roactModule.PureComponent:extend("SafetyBubbleModeEntry")
safetyBubbleModeEntry.validateProps = t.strictInterface({ LayoutOrder = t.optional(t.integer) })

function safetyBubbleModeEntry.init(p1)
	-- upvalues: gameSettings (ref), luauPolyfillModule (ref), enumItems (ref)
	p1:setState({
		selectedMode = luauPolyfillModule.Array.indexOf(enumItems, gameSettings.VRSafetyBubbleMode)
	})
end

function safetyBubbleModeEntry.render(p1)
	-- upvalues: withLocalizationModule (ref), t_1 (ref), roactModule (ref), externalEventConnectionModule (ref), VRSafetyBubbleModePropertyChangedSignal (ref), gameSettings (ref), luauPolyfillModule (ref), enumItems (ref), inputLabelModule (ref), themedTextLabelModule (ref), radioButtonList (ref), sendAnalyticsModule (ref), constantsModule (ref), var1 (ref)
	return withLocalizationModule(t_1)(function(p2)
		-- upvalues: roactModule (copy), externalEventConnectionModule (copy), VRSafetyBubbleModePropertyChangedSignal (copy), p1 (ref), gameSettings (copy), luauPolyfillModule (copy), enumItems (copy), inputLabelModule (copy), t_1 (copy), themedTextLabelModule (copy), radioButtonList (copy), sendAnalyticsModule (copy), constantsModule (copy), var1 (copy)
		return roactModule.createFragment({
			VRSafetyBubbleModeListener = roactModule.createElement(externalEventConnectionModule, {
				event = VRSafetyBubbleModePropertyChangedSignal,
				callback = function()
					-- upvalues: p1 (copy), gameSettings (copy), luauPolyfillModule (copy), enumItems (copy)
					p1:setState({
						selectedMode = luauPolyfillModule.Array.indexOf(enumItems, gameSettings.VRSafetyBubbleMode)
					})
				end
			}),
			SafetyBubbleModeEntrySelector = roactModule.createElement("Frame", {
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
				InputLabel = roactModule.createElement(inputLabelModule, {
					LayoutOrder = 1,
					localizationKey = t_1.Title,
					Size = UDim2.new(1, 0, 0, 0),
					Position = UDim2.new(0, 0, 0, 0),
					AnchorPoint = Vector2.new(0, 0)
				}),
				InputDescription = roactModule.createElement(themedTextLabelModule, {
					themeKey = "TextDefault",
					fontKey = "CaptionHeader",
					TextWrapped = true,
					LayoutOrder = 2,
					Text = p2.Description,
					Size = UDim2.new(0.9, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				RadioList = roactModule.createElement(radioButtonList, {
					layoutOrder = 3,
					automaticSize = true,
					radioButtons = luauPolyfillModule.Array.map(enumItems, function(p3, _)
						-- upvalues: p2 (ref)
						return { label = p2[tostring(p3)] }
					end),
					onActivated = function(p3)
						-- upvalues: enumItems (copy), gameSettings (copy), sendAnalyticsModule (copy), constantsModule (copy)
						local var2 = enumItems[p3]
						gameSettings.VRSafetyBubbleMode = var2
						sendAnalyticsModule(constantsModule.AnalyticsSettingsChangeName, constantsModule.AnalyticsSettingsSafetyBubbleModeChangeName, { mode = tostring(var2) })
					end,
					currentValue = p1.state.selectedMode,
					padding = UDim.new(0, 20),
					elementSize = if var1 then UDim2.new(1, 0, 0, 20) else UDim2.new(0, 0, 0, 20)
				})
			})
		})
	end)
end

return safetyBubbleModeEntry