local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local TModule = require(CorePackages.Packages.t)
local RoactModule = require(CorePackages.Packages.Roact)
local BlockingModalContainerModule = require(script.Parent.BlockingModalContainer)
local RenderWithCoreScriptsStyleProviderModule = require(CoreGui:WaitForChild("RobloxGui").Modules.Common.renderWithCoreScriptsStyleProvider)
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local UseOverlayFunction = require(CorePackages.Packages.Foundation).Hooks.useOverlay
local BlockingModalScreen = RoactModule.PureComponent:extend("BlockingModalScreen")
BlockingModalScreen.validateProps = TModule.interface({
	closeModal = TModule.callback,
	player = TModule.interface({
		DisplayName = TModule.string,
		Name = TModule.string,
		UserId = TModule.number
	}),
	translator = TModule.optional(TModule.table),
	source = TModule.optional(TModule.string),
	onBlockingSuccess = TModule.optional(TModule.callback),
	overlay = TModule.optional(TModule.instanceIsA("GuiBase2d"))
})

function BlockingModalScreen.render(p1) --[[ Line: 33 ]]
	-- upvalues: RoactModule (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), BlockingModalContainerModule (copy), CoreGui (copy), RenderWithCoreScriptsStyleProviderModule (copy)
	local Overlay = p1.props.overlay
	local Element = RoactModule.createElement(FocusRoot, {
		isIsolated = true,
		isAutoFocusRoot = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay
	}, {
		BlockingModalContainerWrapper = RoactModule.createElement(BlockingModalContainerModule, p1.props)
	})
	
	return RenderWithCoreScriptsStyleProviderModule(if Overlay == nil then {
		RoactModule.createElement(RoactModule.Portal, { target = CoreGui }, {
			BlockingModalScreen = RoactModule.createElement("ScreenGui", {
				IgnoreGuiInset = true,
				AutoLocalize = false,
				DisplayOrder = 6
			}, { BlockingModalContainer = Element })
		})
	} else {
		RoactModule.createElement(RoactModule.Portal, { target = Overlay }, { BlockingModalScreen = Element })
	})
end

return function(Tbl) --[[ Line: 72 | Named "BlockingModalScreenWithFoundationOverlay" ]]
	-- upvalues: UseOverlayFunction (copy), RoactModule (copy), BlockingModalScreen (copy)
	local Copy = table.clone(Tbl)
	Copy.overlay = UseOverlayFunction()
	
	return RoactModule.createElement(BlockingModalScreen, Copy)
end