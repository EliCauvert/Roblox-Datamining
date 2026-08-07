local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local renderWithCoreScriptsStyleProviderModule = require(robloxGui.Modules.Common.renderWithCoreScriptsStyleProvider)
local parent = script.Parent.Parent
local setScreenSizeModule = require(parent.Actions.SetScreenSize)
local reportMenuModule = require(parent.Components.ReportMenu)
local reportDialogModule = require(parent.Components.ReportDialog)
local reportCategoryDialogModule = require(parent.Components.ReportCategoryDialog)
local reportSentDialogModule = require(parent.Components.ReportSentDialog)
local toastModule = require(parent.Components.Toast)
local voiceStateContextModule = require(robloxGui.Modules.VoiceChat.VoiceStateContext)
local trustAndSafetyApp = roactModule.PureComponent:extend("TrustAndSafetyApp")
trustAndSafetyApp.validateProps = tModule.strictInterface({
	setScreenSize = tModule.callback,
	visible = tModule.boolean
})

function trustAndSafetyApp.init(_) --[[ line: 30 ]] end

function trustAndSafetyApp.render(p0) --[[ line: 32 ]]
	-- upvalues: roactModule (ref), voiceStateContextModule (ref), reportCategoryDialogModule (ref), reportMenuModule (ref), reportDialogModule (ref), reportSentDialogModule (ref), toastModule (ref), renderWithCoreScriptsStyleProviderModule (ref)
	return renderWithCoreScriptsStyleProviderModule({
		VoiceStateContextProvider = roactModule.createElement(voiceStateContextModule.Provider, {}, {
			Gui = roactModule.createElement("ScreenGui", {
				AutoLocalize = false,
				DisplayOrder = 8,
				IgnoreGuiInset = true,
				OnTopOfCoreBlur = true,
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
				[roactModule.Change.AbsoluteSize] = p0.props.setScreenSize
			}, {
				Content = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					Visible = p0.props.visible
				}, {
					ReportCategoryDialog = roactModule.createElement(reportCategoryDialogModule),
					ReportMenu = roactModule.createElement(reportMenuModule),
					ReportDialog = roactModule.createElement(reportDialogModule),
					ReportSentDialog = roactModule.createElement(reportSentDialogModule),
					Toast = roactModule.createElement(toastModule)
				})
			})
		})
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p1, _) --[[ line: 60 ]]
	return { visible = p1.displayOptions.visible }
end, function(p2) --[[ line: 64 ]]
	-- upvalues: setScreenSizeModule (ref)
	return {
		setScreenSize = function(value) --[[ line: 66 ]]
			-- upvalues: p2 (ref), setScreenSizeModule (copy)
			p2(setScreenSizeModule(value.AbsoluteSize))
		end
	}
end)(trustAndSafetyApp)