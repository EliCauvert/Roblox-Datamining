local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local WithOverlayFocusHandlingModule = require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local ToggleEquipAssetModule = require(Modules.AvatarExperience.AvatarEditor.Actions.ToggleEquipAsset)
local SetCurrentSortModule = require(Modules.AvatarExperience.LayeredClothingSort.Actions.SetCurrentSort)
local AddRemovedItemModule = require(Modules.AvatarExperience.LayeredClothingSort.Actions.AddRemovedItem)
local RemoveItemPrompt = RoactModule.PureComponent:extend("RemoveItemPrompt")
RemoveItemPrompt.validateProps = TModule.strictInterface({
	screenSize = TModule.Vector2,
	equippedAssets = TModule.optional(TModule.table),
	currentSort = TModule.table,
	toggleEquipAsset = TModule.callback,
	setCurrentSort = TModule.callback,
	addRemovedItem = TModule.callback,
	asset = TModule.table,
	onUnequip = TModule.optional(TModule.callback),
	navigation = TModule.table,
	focusController = TModule.optional(TModule.table),
	defaultChildRef = TModule.optional(TModule.table),
	onOverlayClosed = TModule.optional(TModule.callback)
})

function RemoveItemPrompt.init(p1)
	-- upvalues: NavigationUtilsModule (copy)
	function p1.removeItem()
		-- upvalues: p1 (copy)
		local Id = p1.props.asset.id
		local TypeId = p1.props.asset.typeId
		
		if p1.props.equippedAssets and p1.props.equippedAssets[TypeId] and p1.props.equippedAssets[TypeId][Id] then
			p1.props.toggleEquipAsset(TypeId, Id)
		end
		local List = {}
		
		for _, value in p1.props.currentSort do
			if value.id ~= Id then
				table.insert(List, value)
			end
		end
		p1.props.setCurrentSort(List)
		p1.props.addRemovedItem(Id, TypeId)
		
		if p1.props.onUnequip then
			p1.props.onUnequip()
		end
		p1.closePrompt()
	end
	
	function p1.closePrompt()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy)
		NavigationUtilsModule.closeOverlay(p1.props.navigation)
	end
end

function RemoveItemPrompt.renderAlertLocalized(p2, p3)
	-- upvalues: RoactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	return RoactModule.createElement(InteractiveAlert, {
		title = p3.title,
		bodyText = p3.body,
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = { onActivated = p2.closePrompt, text = p3.no }
				},
				{
					buttonType = ButtonType.PrimarySystem,
					props = { onActivated = p2.removeItem, text = p3.yes }
				}
			}
		},
		screenSize = p2.props.screenSize,
		defaultChildRef = p2.props.defaultChildRef
	})
end

function RemoveItemPrompt.render(p2)
	-- upvalues: WithLocalizationFunction (copy)
	return WithLocalizationFunction({
		no = "Feature.GameDetails.Label.No",
		yes = "Feature.GameDetails.Label.Yes",
		title = "Feature.Avatar.Title.LCSortUnequip",
		body = "Feature.Avatar.Message.LCSortUnequipBody"
	})(function(p3)
		-- upvalues: p2 (copy)
		return p2:renderAlertLocalized(p3)
	end)
end

return (WithMappedNavigationParamsModule((WithOverlayFocusHandlingModule((RoactRoduxModule.connect(function(p2, _)
	return {
		screenSize = p2.ScreenSize,
		equippedAssets = p2.AvatarExperience.AvatarEditor.Character.EquippedAssets,
		currentSort = p2.AvatarExperience.LayeredClothingSort.CurrentSort.OrderedList
	}
end, function(Callback)
	-- upvalues: ToggleEquipAssetModule (copy), SetCurrentSortModule (copy), AddRemovedItemModule (copy)
	return {
		toggleEquipAsset = function(p2, p3)
			-- upvalues: Callback (copy), ToggleEquipAssetModule (upval)
			Callback(ToggleEquipAssetModule(p2, p3))
		end,
		setCurrentSort = function(p2)
			-- upvalues: Callback (copy), SetCurrentSortModule (upval)
			Callback(SetCurrentSortModule(p2))
		end,
		addRemovedItem = function(p2, p3)
			-- upvalues: Callback (copy), AddRemovedItemModule (upval)
			Callback(AddRemovedItemModule(p2, p3))
		end
	}
end)(RemoveItemPrompt))))))