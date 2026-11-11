local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local TModule = require(CorePackages.Packages.t)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local ConstantsModule = require(Modules.LuaApp.Constants)
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local MorePageScrollingFrameModule = require(Modules.LuaApp.Components.More.MorePageScrollingFrame)
local DeviceSettingsPageContentModule = require(script.Parent.DeviceSettingsPageContent)
local WithMorePagePaddingsModule = require(Modules.LuaApp.Components.More.withMorePagePaddings)
local FFlagEnableDevicePreferenceLayoutUpdateModule = require(Modules.LuaApp.Flags.FFlagEnableDevicePreferenceLayoutUpdate)
local FFlagPreventNavBarOverlapOverDevicePreferencePageModule = require(Modules.LuaApp.Flags.FFlagPreventNavBarOverlapOverDevicePreferencePage)
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local DeviceSettingsPage = RoactModule.PureComponent:extend("DeviceSettingsPage")
DeviceSettingsPage.validateProps = TModule.strictInterface({
	formFactor = TModule.string,
	platform = TModule.EnumItem,
	paddings = TModule.optional(TModule.strictInterface({
		paddingHorizontal = TModule.number,
		paddingVertical = TModule.number,
		contentMaxWidth = TModule.number
	})),
	roactAnalytics = TModule.union(TModule.Instance, TModule.table)
})

local function WithHooksComponent(p1)
	-- upvalues: UseDesignTokensFunction (copy), RoactModule (copy), MorePageScrollingFrameModule (copy), FFlagEnableDevicePreferenceLayoutUpdateModule (copy), ConstantsModule (copy), DeviceSettingsPageContentModule (copy), TopBarModule (copy), FFlagPreventNavBarOverlapOverDevicePreferencePageModule (copy)
	local Paddings = p1.paddings
	local BackgroundStyle = p1.backgroundStyle
	assert(Paddings, "paddings must not be nil")
	local PaddingHorizontal = Paddings.paddingHorizontal
	local PaddingVertical = Paddings.paddingVertical
	local ContentMaxWidth = Paddings.contentMaxWidth
	local UseDesignTokensResult = UseDesignTokensFunction()
	
	return RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = BackgroundStyle.Color,
		BackgroundTransparency = BackgroundStyle.Transparency
	}, {
		TopBar = RoactModule.createElement(TopBarModule.Container, { leftItem = TopBarModule.BackButton }),
		PageContent = RoactModule.createElement(TopBarModule.PageContent, {}, {
			UIPadding = if FFlagPreventNavBarOverlapOverDevicePreferencePageModule then RoactModule.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, UseDesignTokensResult.Size.Size_1000)
			}) else nil,
			Scroller = RoactModule.createElement(MorePageScrollingFrameModule, {
				Position = UDim2.fromScale(0, 0),
				Size = UDim2.fromScale(1, 1),
				maxWidth = ContentMaxWidth
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, if FFlagEnableDevicePreferenceLayoutUpdateModule then UseDesignTokensResult.Size.Size_600 else ConstantsModule.MORE_PAGE_SECTION_PADDING)
				}),
				UIPadding = RoactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, PaddingHorizontal),
					PaddingRight = UDim.new(0, PaddingHorizontal),
					PaddingTop = UDim.new(0, PaddingVertical),
					PaddingBottom = UDim.new(0, PaddingVertical)
				}),
				Content = RoactModule.createElement(DeviceSettingsPageContentModule)
			})
		})
	})
end

function DeviceSettingsPage.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), WithHooksComponent (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), WithHooksComponent (upval), p1 (copy)
		return RoactModule.createElement(WithHooksComponent, {
			paddings = p1.props.paddings,
			backgroundStyle = p2.Theme.BackgroundDefault
		})
	end)
end

function DeviceSettingsPage:willUnmount()
	if game:GetEngineFeature("GlobalBasicSettingsSaveStateReflection") then
		task.spawn(function()
			UserSettings():SaveState()
		end)
	end
end

return WithMorePagePaddingsModule((RoactServices.connect({ roactAnalytics = RoactAnalyticsModule })((RoactRoduxModule.connect(function(p1, _)
	return { formFactor = p1.FormFactor, platform = p1.Platform }
end)(DeviceSettingsPage)))))