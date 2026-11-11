local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local ReportConfirmationContainerModule = require(script.Parent.ReportConfirmationContainer)
local RenderWithCoreScriptsStyleProviderModule = require(script.Parent.Parent.Parent.Parent.Common.renderWithCoreScriptsStyleProvider)
local ReportConfirmationScreen = RoactModule.PureComponent:extend("ReportConfirmationScreen")
ReportConfirmationScreen.validateProps = TModule.interface({
	closeMenu = TModule.callback,
	player = TModule.interface({
		DisplayName = TModule.string,
		Name = TModule.string,
		UserId = TModule.number
	})
})

function ReportConfirmationScreen.render(p1)
	-- upvalues: RenderWithCoreScriptsStyleProviderModule (copy), RoactModule (copy), ReportConfirmationContainerModule (copy)
	return RenderWithCoreScriptsStyleProviderModule({
		reportConfirmationContainer = RoactModule.createElement(ReportConfirmationContainerModule, p1.props)
	})
end

return ReportConfirmationScreen