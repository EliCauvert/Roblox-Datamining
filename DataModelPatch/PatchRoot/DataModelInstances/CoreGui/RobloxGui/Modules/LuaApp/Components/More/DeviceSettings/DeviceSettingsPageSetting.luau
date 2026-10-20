local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local FoundationModule = require(CorePackages.Packages.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local TModule = require(CorePackages.Packages.t)
local DeviceSettingsPageSetting = RoactModule.PureComponent:extend("DeviceSettingsPageSetting")
local FFlagEnableDevicePreferenceLayoutUpdateModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Flags.FFlagEnableDevicePreferenceLayoutUpdate)
local FFlagMacMenuBarContentUpdates = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagMacMenuBarContentUpdates()
local FFlagEnableRobloxPlusThemeSetting = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableRobloxPlusThemeSetting
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
DeviceSettingsPageSetting.defaultProps = { topToBottom = false }
DeviceSettingsPageSetting.validateProps = TModule.strictInterface({
	topToBottom = TModule.optional(TModule.boolean),
	style = TModule.table,
	layoutOrder = TModule.number,
	header = TModule.string,
	headerBadge = TModule.optional(TModule.table),
	description = if FFlagMacMenuBarContentUpdates then TModule.optional(TModule.string) else TModule.string,
	Control = TModule.table,
	zIndex = TModule.optional(TModule.number)
})

local function WithHooksComponent(p1)
	-- upvalues: UseDesignTokensFunction (copy), RoactModule (copy), FFlagMacMenuBarContentUpdates (copy), FFlagEnableDevicePreferenceLayoutUpdateModule (copy), FFlagEnableRobloxPlusThemeSetting (copy), View (copy), Text (copy)
	local Style = p1.style
	local BaseSize = Style.Font.BaseSize
	local ScaledBaseSize = BaseSize * Style.Font.Header2.RelativeSize
	local ScaledBaseSize1 = BaseSize * Style.Font.CaptionBody.RelativeSize
	local HeaderFont = Style.Font.Header2.Font
	local CaptionBodyFont = Style.Font.CaptionBody.Font
	local UseDesignTokensResult = UseDesignTokensFunction()
	
	return RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.layoutOrder,
		ZIndex = p1.zIndex
	}, {
		Layout = if p1.topToBottom then RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}) else nil,
		SettingInfoFrame = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = if FFlagMacMenuBarContentUpdates and p1.description == nil then UDim2.fromScale(1, 1) else UDim2.fromScale(1, 0),
			AutomaticSize = if FFlagMacMenuBarContentUpdates and p1.description == nil then Enum.AutomaticSize.None else Enum.AutomaticSize.Y
		}, {
			Layout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, if FFlagEnableDevicePreferenceLayoutUpdateModule then UseDesignTokensResult.Size.Size_100 else 6)
			}),
			SettingHeaderText = if p1.headerBadge == nil then RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				TextWrapped = true,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, ScaledBaseSize),
				Text = p1.header,
				Font = HeaderFont,
				TextSize = ScaledBaseSize,
				AutomaticSize = Enum.AutomaticSize.Y,
				TextColor3 = Style.Theme.TextDefault.Color,
				TextTransparency = Style.Theme.TextDefault.Transparency,
				TextXAlignment = Enum.TextXAlignment.Left
			}) else nil,
			SettingHeaderRow = if FFlagEnableRobloxPlusThemeSetting and p1.headerBadge ~= nil then RoactModule.createElement(View, {
				tag = "row align-x-left align-y-center gap-small size-full-0 auto-y",
				LayoutOrder = 1
			}, {
				HeaderText = RoactModule.createElement(Text, {
					tag = "auto-xy text-align-x-left",
					LayoutOrder = 1,
					Text = p1.header,
					fontStyle = { Font = HeaderFont, FontSize = ScaledBaseSize },
					textStyle = {
						Color3 = Style.Theme.TextDefault.Color,
						Transparency = Style.Theme.TextDefault.Transparency
					}
				}),
				Badge = RoactModule.createElement(View, { tag = "auto-xy", LayoutOrder = 2 }, { Content = p1.headerBadge })
			}) else nil,
			SettingDescriptionText = if FFlagMacMenuBarContentUpdates and p1.description == nil then nil else RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				TextWrapped = true,
				LayoutOrder = 2,
				Size = if p1.topToBottom then UDim2.new(1, 0, 0, 0) else UDim2.fromScale(0.65, 0),
				Text = p1.description,
				Font = CaptionBodyFont,
				TextSize = ScaledBaseSize1,
				TextColor3 = Style.Theme.TextMuted.Color,
				TextTransparency = Style.Theme.TextMuted.Transparency,
				TextXAlignment = Enum.TextXAlignment.Left,
				AutomaticSize = Enum.AutomaticSize.Y
			})
		}),
		SettingControlFrame = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Layout = RoactModule.createElement("UIListLayout", {
				HorizontalAlignment = if p1.topToBottom then Enum.HorizontalAlignment.Center else Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			UIPadding = if p1.topToBottom then RoactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, if FFlagEnableDevicePreferenceLayoutUpdateModule then UseDesignTokensResult.Size.Size_300 else 10),
				PaddingBottom = UDim.new(0, if FFlagEnableDevicePreferenceLayoutUpdateModule then UseDesignTokensResult.Size.Size_100 else 10)
			}) else nil,
			Control = p1.Control
		})
	})
end

function DeviceSettingsPageSetting.render(p1)
	-- upvalues: RoactModule (copy), WithHooksComponent (copy)
	return RoactModule.createElement(WithHooksComponent, p1.props)
end

return DeviceSettingsPageSetting