local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local LinkButton = UIBloxModule.App.Button.LinkButton
local OpenCentralOverlayForLeaveRobloxAlertModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local DeviceSettingsPageContentModule = require(Modules.LuaApp.Components.More.DeviceSettings.DeviceSettingsPageContent)

local function Divider(p1)
	-- upvalues: ReactModule (copy)
	local Style = p1.style
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 1),
		BackgroundColor3 = Style.Theme.Divider.Color,
		BackgroundTransparency = Style.Theme.Divider.Transparency,
		LayoutOrder = p1.layoutOrder
	})
end

return require(CorePackages.Workspace.Packages.RoactServices).RoactServices.connect({
	roactAnalytics = require(Modules.LuaApp.Services.RoactAnalytics),
	linking = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLinking
})((require(CorePackages.Packages.RoactRodux).connect(nil, function(Callback)
	-- upvalues: OpenCentralOverlayForLeaveRobloxAlertModule (copy), CloseCentralOverlayModule (copy)
	return {
		openLeaveRobloxAlertUIBlox = function(UseResult)
			-- upvalues: Callback (copy), OpenCentralOverlayForLeaveRobloxAlertModule (upval)
			Callback(OpenCentralOverlayForLeaveRobloxAlertModule(UseResult))
		end,
		closeAlert = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			Callback(CloseCentralOverlayModule())
		end
	}
end)(function(p1)
	-- upvalues: RoactModule (copy), UseStyleFunction (copy), UseLocalizationModule (copy), ReactModule (copy), LinkButton (copy), Divider (copy), DeviceSettingsPageContentModule (copy)
	local Ref = RoactModule.createRef()
	local UseStyleResult = UseStyleFunction()
	local UseLocalizationModuleResult = UseLocalizationModule({
		accountSettings = "Application.Settings.AccountSettingsTitle",
		accountSettingsSubtitle = "Application.Settings.VRAccountSettingsSubtitle",
		accountSettingsExplanation = "Application.Settings.VRAccountSettingsExplanation",
		appSettingsTitle = "Application.Settings.AppSettingsTitle",
		volumeSliderDescription = "Application.Settings.VolumeSliderDescription"
	})
	local BaseSize = UseStyleResult.Font.BaseSize
	local ScaledBaseSize = BaseSize * UseStyleResult.Font.Title.RelativeSize
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		p1.linking:openURL("https://www.roblox.com/my/account#!/info"):andThen(function(Enabled)
			-- upvalues: p1 (upval)
			if Enabled == false then
				p1.linking:openURL("https://www.roblox.com/my/account#!/info")
			end
		end)
		p1.closeAlert()
	end, { p1.linking, p1.closeAlert })
	
	return ReactModule.createElement("Frame", {
		Size = UDim2.fromScale(1, 1),
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		LayoutOrder = 0,
		[RoactModule.Ref] = Ref
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Padding = UDim.new(0, 30)
		}),
		AccountSettings = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = 0,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, 8)
			}),
			AccountSettingsTitle = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				AutomaticSize = Enum.AutomaticSize.XY,
				Text = UseLocalizationModuleResult.accountSettings,
				Font = UseStyleResult.Font.Title.Font,
				TextSize = ScaledBaseSize,
				TextColor3 = UseStyleResult.Theme.TextDefault.Color,
				TextXAlignment = Enum.TextXAlignment.Left
			}, {
				UIPadding = ReactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 10) })
			}),
			AccountSettingsSubTitle = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				Text = UseLocalizationModuleResult.accountSettingsSubtitle,
				Font = UseStyleResult.Font.Header2.Font,
				TextSize = BaseSize * UseStyleResult.Font.Header2.RelativeSize,
				TextColor3 = UseStyleResult.Theme.TextEmphasis.Color,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			AccessExplanation = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.XY,
				Text = UseLocalizationModuleResult.accountSettingsExplanation,
				Font = UseStyleResult.Font.Title.Font,
				TextSize = BaseSize * UseStyleResult.Font.Body.RelativeSize,
				TextColor3 = UseStyleResult.Theme.TextDefault.Color,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			Link = ReactModule.createElement("Frame", {
				LayoutOrder = 3,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY
			}, ReactModule.createElement(LinkButton, {
				text = "https://www.roblox.com/my/account#!/info",
				minPaddingX = 0,
				minPaddingY = 0,
				onActivated = function()
					-- upvalues: p1 (copy), UseResult (copy)
					p1.openLeaveRobloxAlertUIBlox(UseResult)
				end
			}))
		}),
		Divider1 = Divider({ layoutOrder = 2, style = UseStyleResult }),
		AppSettings = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, 8)
			}),
			AppSettingsTitle = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				AutomaticSize = Enum.AutomaticSize.XY,
				Size = UDim2.new(1, 0, 0, 0),
				Text = UseLocalizationModuleResult.appSettingsTitle,
				Font = UseStyleResult.Font.Title.Font,
				TextSize = ScaledBaseSize,
				TextColor3 = UseStyleResult.Theme.TextDefault.Color,
				TextXAlignment = Enum.TextXAlignment.Left
			}, {
				UIPadding = ReactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 10) })
			}),
			DeviceSettings = ReactModule.createElement(DeviceSettingsPageContentModule)
		})
	})
end)))