local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local RenderWithCoreScriptsStyleProviderModule = require(RobloxGui.Modules.Common.renderWithCoreScriptsStyleProvider)
local Parent = script.Parent.Parent
local SetScreenSizeModule = require(Parent.Actions.SetScreenSize)
local ReportMenuModule = require(Parent.Components.ReportMenu)
local ReportDialogModule = require(Parent.Components.ReportDialog)
local ReportCategoryDialogModule = require(Parent.Components.ReportCategoryDialog)
local ReportSentDialogModule = require(Parent.Components.ReportSentDialog)
local ToastModule = require(Parent.Components.Toast)
local VoiceStateContextModule = require(RobloxGui.Modules.VoiceChat.VoiceStateContext)
local TrustAndSafetyApp = RoactModule.PureComponent:extend("TrustAndSafetyApp")
TrustAndSafetyApp.validateProps = TModule.strictInterface({ setScreenSize = TModule.callback })

function TrustAndSafetyApp:init() end

function TrustAndSafetyApp.render(p1)
	-- upvalues: RoactModule (copy), VoiceStateContextModule (copy), ReportCategoryDialogModule (copy), ReportMenuModule (copy), ReportDialogModule (copy), ReportSentDialogModule (copy), ToastModule (copy), RenderWithCoreScriptsStyleProviderModule (copy)
	return RenderWithCoreScriptsStyleProviderModule({
		VoiceStateContextProvider = RoactModule.createElement(VoiceStateContextModule.Provider, {}, {
			Gui = RoactModule.createElement("ScreenGui", {
				AutoLocalize = false,
				DisplayOrder = 8,
				IgnoreGuiInset = true,
				OnTopOfCoreBlur = true,
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
				[RoactModule.Change.AbsoluteSize] = p1.props.setScreenSize
			}, {
				Content = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
					ReportCategoryDialog = RoactModule.createElement(ReportCategoryDialogModule),
					ReportMenu = RoactModule.createElement(ReportMenuModule),
					ReportDialog = RoactModule.createElement(ReportDialogModule),
					ReportSentDialog = RoactModule.createElement(ReportSentDialogModule),
					Toast = RoactModule.createElement(ToastModule)
				})
			})
		})
	})
end

return RoactRoduxModule.UNSTABLE_connect2(nil, function(Callback)
	-- upvalues: SetScreenSizeModule (copy)
	return {
		setScreenSize = function(Frame)
			-- upvalues: Callback (copy), SetScreenSizeModule (upval)
			Callback(SetScreenSizeModule(Frame.AbsoluteSize))
		end
	}
end)(TrustAndSafetyApp)