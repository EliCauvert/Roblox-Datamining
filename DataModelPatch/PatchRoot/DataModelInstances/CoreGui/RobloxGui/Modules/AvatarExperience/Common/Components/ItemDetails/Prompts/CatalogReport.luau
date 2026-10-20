local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local TModule = require(CorePackages.Packages.t)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local WithOverlayFocusHandlingModule = require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local CatalogReport = RoactModule.PureComponent:extend("CatalogReport")
CatalogReport.validateProps = TModule.strictInterface({
	userId = TModule.string,
	itemId = TModule.string,
	itemCreatorId = TModule.string,
	itemName = TModule.string,
	itemDescription = TModule.string,
	screenSize = TModule.Vector2,
	defaultChildRef = TModule.optional(TModule.table),
	focusController = TModule.optional(TModule.table),
	navigation = TModule.table,
	onOverlayClosed = TModule.optional(TModule.callback)
})

function CatalogReport.init(p1)
	-- upvalues: WebApiModule (copy), NavigationUtilsModule (copy)
	function p1.sendReport()
		-- upvalues: p1 (copy), WebApiModule (upval)
		WebApiModule.ReportItemV2(p1.props.userId, p1.props.itemId, p1.props.itemCreatorId, p1.props.itemName, p1.props.itemDescription, "xbox-app", "xbox-catalog", "7", "Item reported from the Xbox App.")
		p1.closePrompt()
	end
	
	function p1.closePrompt()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy)
		NavigationUtilsModule.closeOverlay(p1.props.navigation)
	end
end

function CatalogReport.render(p1)
	-- upvalues: WithLocalizationFunction (copy), RoactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	return WithLocalizationFunction({
		titleText = "Feature.Catalog.Label.ReportItem",
		messageText = "Feature.Catalog.Message.ReportCatalogItemPhrase",
		submitText = "Feature.Catalog.Action.Submit",
		cancelButtonText = "Feature.Catalog.Action.Cancel"
	})(function(p2)
		-- upvalues: RoactModule (upval), InteractiveAlert (upval), p1 (copy), ButtonType (upval)
		return RoactModule.createElement(InteractiveAlert, {
			title = p2.titleText,
			bodyText = p2.messageText,
			buttonStackInfo = {
				buttons = {
					{
						isDefaultChild = true,
						props = { onActivated = p1.closePrompt, text = p2.cancelButtonText }
					},
					{
						buttonType = ButtonType.PrimarySystem,
						props = { onActivated = p1.sendReport, text = p2.submitText }
					}
				}
			},
			screenSize = p1.props.screenSize,
			defaultChildRef = p1.props.defaultChildRef
		})
	end)
end

return (WithMappedNavigationParamsModule((WithOverlayFocusHandlingModule((RoactRoduxModule.connect(function(p1, _)
	return { screenSize = p1.ScreenSize }
end)(CatalogReport))))))