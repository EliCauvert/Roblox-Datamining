local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local FFlagSignalsNavP3fGameDetails = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3fGameDetails
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local RoactModule = require(Modules.Common.Roact)
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local UseSignalState = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3fGameDetails then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local FunctionalModule = require(Modules.Common.Functional)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local AlertWindowModule = require(Modules.LuaApp.Components.AlertWindow)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local ThemeContextDEPRECATEDModule = require(Modules.LuaApp.ThemeContext_DEPRECATED)
local OpenPurchaseRobuxPageModule = require(Modules.LuaApp.Thunks.Economy.OpenPurchaseRobuxPage)
local GetFFlagLuaAppUseWithLocalizationModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization)
local PurchaseGameRobuxShortfallPrompt = RoactModule.PureComponent:extend("PurchaseGameRobuxShortfallPrompt")

function PurchaseGameRobuxShortfallPrompt.init(p1)
	function p1.buyRobux()
		-- upvalues: p1 (copy)
		p1.props.closePrompt()
		p1.props.openPurchaseRobuxPage(p1.props.networking)
	end
end

function PurchaseGameRobuxShortfallPrompt.didMount(p1)
	-- upvalues: FunctionalModule (copy)
	local PageFilter = p1.props.pageFilter
	local CurrentPage = p1.props.currentPage
	local ClosePromptFunction: () -> () = p1.props.closePrompt
	
	if PageFilter and not FunctionalModule.Find(PageFilter, CurrentPage) then
		ClosePromptFunction()
	end
end

function PurchaseGameRobuxShortfallPrompt.render(p1)
	-- upvalues: RoactModule (copy), ThemeContextDEPRECATEDModule (copy), AlertWindowModule (copy), GetFFlagLuaAppUseWithLocalizationModule (copy), WithLocalizationModule (copy)
	local Theme = p1.props.theme
	local ContainerWidth = p1.props.containerWidth
	local RobuxShortfall = p1.props.robuxShortfall
	local ClosePrompt = p1.props.closePrompt
	local Localization = p1.props.localization
	local GameName = p1.props.gameName
	
	local function v31(p2)
		-- upvalues: RoactModule (upval), ThemeContextDEPRECATEDModule (upval), Theme (copy), AlertWindowModule (upval), ContainerWidth (copy), p1 (copy), ClosePrompt (copy)
		return RoactModule.createElement(ThemeContextDEPRECATEDModule.Provider, { value = Theme }, {
			AlertWindow = RoactModule.createElement(AlertWindowModule, {
				hasCancelButton = true,
				containerWidth = ContainerWidth,
				titleText = p2.titleText,
				titleFont = Theme.GameDetails.Text.BoldFont,
				messageText = p2.messageText,
				messageFont = Theme.GameDetails.Text.Font,
				buttonFont = Theme.GameDetails.Text.Font,
				confirmButtonText = p2.confirmButtonText,
				onConfirm = p1.buyRobux,
				onCancel = ClosePrompt
			})
		})
	end
	
	return if GetFFlagLuaAppUseWithLocalizationModule() then WithLocalizationModule({
		titleText = "Feature.GameDetails.Heading.PurchaseGame",
		confirmButtonText = "Feature.GameDetails.Action.BuyRobux",
		messageText = {
			"Feature.GameDetails.Message.BuyMoreRobuxToPurchaseGameV2",
			gameName = GameName,
			shortfallPrice = RobuxShortfall
		}
	})(v31) else v31({
		titleText = Localization:Format("Feature.GameDetails.Heading.PurchaseGame"),
		messageText = Localization:Format("Feature.GameDetails.Message.BuyMoreRobuxToPurchaseGameV2", { gameName = GameName, shortfallPrice = RobuxShortfall }),
		confirmButtonText = Localization:Format("Feature.GameDetails.Action.BuyRobux")
	})
end

local v1 = if FFlagSignalsNavP3fGameDetails then function(p1)
	-- upvalues: GetLegacyNavigationStore (copy), UseSignalState (copy), RoactModule (copy), v1 (copy), CryoModule (copy)
	return RoactModule.createElement(v1, CryoModule.Dictionary.union(p1, {
		currentPage = UseSignalState(GetLegacyNavigationStore(false).getCurrentPage).name
	}))
end else RoactRoduxModule.connect(if FFlagSignalsNavP3fGameDetails then nil else function(p1, _)
	-- upvalues: FFlagUseNavigationSelectors (copy), Selectors (copy)
	local SelectCurrentLegacyRouteResult = if FFlagUseNavigationSelectors then Selectors.selectCurrentLegacyRoute(p1) else p1.Navigation.history[#p1.Navigation.history]
	
	return {
		currentPage = SelectCurrentLegacyRouteResult[#SelectCurrentLegacyRouteResult].name
	}
end, function(Callback)
	-- upvalues: CloseCentralOverlayModule (copy), OpenPurchaseRobuxPageModule (copy)
	return {
		closePrompt = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			Callback(CloseCentralOverlayModule())
		end,
		openPurchaseRobuxPage = function(p1)
			-- upvalues: Callback (copy), OpenPurchaseRobuxPageModule (upval)
			return Callback(OpenPurchaseRobuxPageModule(nil, p1))
		end
	}
end)(PurchaseGameRobuxShortfallPrompt)

return (RoactServices.connect({
	localization = RoactLocalizationModule,
	guiService = AppGuiService,
	networking = RoactNetworkingModule
})(v1))