local coreGuiService = game:GetService("CoreGui")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local corePackagesService = game:GetService("CorePackages")
local tModule = require(corePackagesService.Packages.t)
local roactModule = require(corePackagesService.Packages.Roact)
local foundationModule = require(corePackagesService.Packages.Foundation)
local blockingModalContainerModule = require(script.Parent.BlockingModalContainer)
local renderWithCoreScriptsStyleProviderModule = require(robloxGui.Modules.Common.renderWithCoreScriptsStyleProvider)
local focusNavigationUtilsModule = require(corePackagesService.Workspace.Packages.FocusNavigationUtils)
local focusRoot = focusNavigationUtilsModule.FocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local useOverlay = foundationModule.Hooks.useOverlay
local blockingModalScreen = roactModule.PureComponent:extend("BlockingModalScreen")
blockingModalScreen.validateProps = tModule.interface({
	closeModal = tModule.callback,
	player = tModule.interface({
		DisplayName = tModule.string,
		Name = tModule.string,
		UserId = tModule.number
	}),
	translator = tModule.optional(tModule.table),
	source = tModule.optional(tModule.string),
	onBlockingSuccess = tModule.optional(tModule.callback),
	overlay = tModule.optional(tModule.instanceIsA("GuiBase2d"))
})

function blockingModalScreen.render(p1)
	-- upvalues: roactModule (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), blockingModalContainerModule (ref), coreGuiService (ref), renderWithCoreScriptsStyleProviderModule (ref)
	local overlay = p1.props.overlay
	local var1 = roactModule.createElement(focusRoot, {
		isIsolated = true,
		isAutoFocusRoot = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
	}, {
		BlockingModalContainerWrapper = roactModule.createElement(blockingModalContainerModule, p1.props)
	})
	
	return renderWithCoreScriptsStyleProviderModule(if overlay ~= nil then {
		roactModule.createElement(roactModule.Portal, { target = coreGuiService }, {
			BlockingModalScreen = roactModule.createElement("ScreenGui", {
				IgnoreGuiInset = true,
				AutoLocalize = false,
				DisplayOrder = 6
			}, { BlockingModalContainer = var1 })
		})
	} else {
		roactModule.createElement(roactModule.Portal, { target = overlay }, { BlockingModalScreen = var1 })
	})
end

return function(p1)
	-- upvalues: useOverlay (ref), roactModule (ref), blockingModalScreen (ref)
	local cloned = table.clone(p1)
	cloned.overlay = useOverlay()
	
	return roactModule.createElement(blockingModalScreen, cloned)
end