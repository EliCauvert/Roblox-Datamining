local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local reportConfirmationContainerModule = require(script.Parent.ReportConfirmationContainer)
local renderWithCoreScriptsStyleProviderModule = require(script.Parent.Parent.Parent.Parent.Common.renderWithCoreScriptsStyleProvider)
local reportConfirmationScreen = roactModule.PureComponent:extend("ReportConfirmationScreen")
reportConfirmationScreen.validateProps = tModule.interface({
	closeMenu = tModule.callback,
	player = tModule.interface({
		DisplayName = tModule.string,
		Name = tModule.string,
		UserId = tModule.number
	})
})

function reportConfirmationScreen.render(p0) --[[ line: 21 ]]
	-- upvalues: renderWithCoreScriptsStyleProviderModule (ref), roactModule (ref), reportConfirmationContainerModule (ref)
	return renderWithCoreScriptsStyleProviderModule({
		reportConfirmationContainer = roactModule.createElement(reportConfirmationContainerModule, p0.props)
	})
end

return reportConfirmationScreen