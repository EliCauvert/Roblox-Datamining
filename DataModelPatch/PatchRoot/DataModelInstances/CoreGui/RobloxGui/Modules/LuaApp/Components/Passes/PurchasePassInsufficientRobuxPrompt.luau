local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(Modules.Common.Roact)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local AlertWindowModule = require(Modules.LuaApp.Components.AlertWindow)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local AppPageModule = require(Modules.LuaApp.AppPage)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local TModule = require(CorePackages.Packages.t)
local PurchasePassInsufficientRobux = RoactModule.PureComponent:extend("PurchasePassInsufficientRobux")
PurchasePassInsufficientRobux.validateProps = TModule.strictInterface({
	containerWidth = TModule.number,
	defaultChildRef = TModule.optional(TModule.any),
	focusController = TModule.optional(TModule.any),
	openPurchaseRobuxPage = TModule.callback,
	closePrompt = TModule.callback
})

function PurchasePassInsufficientRobux.init(p1)
	function p1.openPurchaseRobuxPage()
		-- upvalues: p1 (copy)
		p1.props.closePrompt()
		p1.props.openPurchaseRobuxPage()
	end
end

function PurchasePassInsufficientRobux.render(p1)
	-- upvalues: WithStyleFunction (copy), WithLocalizationModule (copy), RoactModule (copy), AlertWindowModule (copy)
	local ContainerWidth = p1.props.containerWidth
	local ClosePrompt = p1.props.closePrompt
	
	return WithStyleFunction(function(p2)
		-- upvalues: WithLocalizationModule (upval), RoactModule (upval), AlertWindowModule (upval), ContainerWidth (copy), p1 (copy), ClosePrompt (copy)
		return WithLocalizationModule({
			titleText = "Feature.Catalog.Heading.InsufficientFunds",
			messageText = "Feature.Catalog.Label.InsufficientFunds",
			confirmButtonText = "Feature.GameDetails.Action.BuyRobux"
		})(function(p3)
			-- upvalues: RoactModule (upval), AlertWindowModule (upval), ContainerWidth (upval), p2 (copy), p1 (upval), ClosePrompt (upval)
			return RoactModule.createElement(AlertWindowModule, {
				hasCancelButton = true,
				containerWidth = ContainerWidth,
				titleText = p3.titleText,
				titleFont = p2.Font.Header1.Font,
				messageText = p3.messageText,
				messageFont = p2.Font.Body.Font,
				buttonFont = p2.Font.Header2.Font,
				confirmButtonText = p3.confirmButtonText,
				onConfirm = p1.openPurchaseRobuxPage,
				onCancel = ClosePrompt
			})
		end)
	end)
end

return (RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: CloseCentralOverlayModule (copy), AppPageModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy)
	return {
		closePrompt = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			Callback(CloseCentralOverlayModule())
		end,
		openPurchaseRobuxPage = function()
			-- upvalues: AppPageModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			local config = { name = AppPageModule.PurchaseRobux }
			
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.down(NavigationCommands.fromLegacyPage(config)) else Callback(NavigateDownModule(config))
		end
	}
end)(PurchasePassInsufficientRobux))