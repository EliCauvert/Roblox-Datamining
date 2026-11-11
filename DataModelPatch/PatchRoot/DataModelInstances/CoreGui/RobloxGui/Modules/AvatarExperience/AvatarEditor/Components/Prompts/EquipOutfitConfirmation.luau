local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local TModule = require(CorePackages.Packages.t)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local WithOverlayFocusHandlingModule = require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local EquipOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.EquipOutfit)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local EquipOutfitConfirmation = RoactModule.PureComponent:extend("EquipOutfitConfirmation")
local GetFFlagFixAvatarCostumeChangeModule = require(Modules.AvatarExperience.Flags.GetFFlagFixAvatarCostumeChange)
EquipOutfitConfirmation.validateProps = TModule.strictInterface({
	outfitInfo = TModule.table,
	onOverlayClosed = TModule.optional(TModule.callback),
	onEquip = TModule.optional(TModule.callback),
	screenSize = TModule.Vector2,
	equipOutfit = TModule.callback,
	defaultChildRef = TModule.optional(TModule.table),
	focusController = TModule.optional(TModule.table),
	analytics = TModule.optional(TModule.table),
	navigation = TModule.table
})

function EquipOutfitConfirmation.init(p1)
	-- upvalues: GetFFlagFixAvatarCostumeChangeModule (copy), NavigationUtilsModule (copy)
	function p1.equipCostume()
		-- upvalues: p1 (copy), GetFFlagFixAvatarCostumeChangeModule (upval)
		local OutfitInfo = p1.props.outfitInfo
		local Analytics = p1.props.analytics
		local Navigation = p1.props.navigation
		
		if GetFFlagFixAvatarCostumeChangeModule() then
			p1.closePrompt()
			local EquipOutfitResult = p1.props.equipOutfit(OutfitInfo, Analytics, Navigation, nil)
			
			if p1.props.onEquip then
				p1.props.onEquip(EquipOutfitResult)
				
				return
			end
		else
			local EquipOutfitResult1 = p1.props.equipOutfit(OutfitInfo, Analytics, Navigation, nil)
			
			if p1.props.onEquip then
				p1.props.onEquip(EquipOutfitResult1)
			end
			p1.closePrompt()
		end
	end
	
	function p1.closePrompt()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy)
		NavigationUtilsModule.closeOverlay(p1.props.navigation)
	end
end

function EquipOutfitConfirmation.renderLocalized(p1, p2)
	-- upvalues: RoactModule (copy), InteractiveAlert (copy), ButtonType (copy)
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
					props = {
						onActivated = p1.equipCostume,
						text = p2.confirmButtonText
					}
				}
			}
		},
		screenSize = p1.props.screenSize,
		defaultChildRef = p1.props.defaultChildRef
	})
end

function EquipOutfitConfirmation.render(p1)
	-- upvalues: WithLocalizationFunction (copy)
	return WithLocalizationFunction({
		titleText = "Feature.Avatar.Action.Switch",
		messageText = "Feature.Avatar.Message.EquipCostumeConfirmation",
		confirmButtonText = "Feature.Avatar.Action.Switch",
		cancelButtonText = "Feature.Catalog.Action.Cancel"
	})(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderLocalized(p2)
	end)
end

return (RoactServices.connect({ analytics = AnalyticsModule })((WithMappedNavigationParamsModule((WithOverlayFocusHandlingModule((RoactRoduxModule.connect(function(p1, _)
	return { screenSize = p1.ScreenSize }
end, function(Callback)
	-- upvalues: EquipOutfitModule (copy)
	return {
		equipOutfit = function(OutfitInfo, Analytics, Navigation, IsSelected)
			-- upvalues: Callback (copy), EquipOutfitModule (upval)
			return Callback(EquipOutfitModule({
				outfitInfo = OutfitInfo,
				analytics = Analytics,
				navigation = Navigation,
				isSelected = IsSelected
			}))
		end
	}
end)(EquipOutfitConfirmation))))))))