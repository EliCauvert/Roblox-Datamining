local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local CryoModule = require(CorePackages.Packages.Cryo)
local TModule = require(CorePackages.Packages.t)
local UseSignalState = require(CorePackages.Packages.SignalsReact).useSignalState
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local FFlagSignalsNavP3gAvatarExperience = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3gAvatarExperience
local ItemDetailsCloser = RoactModule.PureComponent:extend("ItemDetailsCloser")
ItemDetailsCloser.validateProps = TModule.strictInterface({
	navigation = TModule.table,
	isAvatarExperienceRoute = TModule.boolean
})

function ItemDetailsCloser:render()
	return nil
end

function ItemDetailsCloser.didUpdate(p1, p2)
	-- upvalues: NavigationUtilsModule (copy)
	local IsAvatarExperienceRoute = p1.props.isAvatarExperienceRoute
	
	if p2.isAvatarExperienceRoute and not IsAvatarExperienceRoute then
		NavigationUtilsModule.closeFiltersAndItemDetails(p1.props.navigation)
	end
end

if FFlagSignalsNavP3gAvatarExperience then
	return function(p1)
		-- upvalues: UseSignalState (copy), UtilsModule (copy), RoactModule (copy), ItemDetailsCloser (copy), CryoModule (copy)
		return RoactModule.createElement(ItemDetailsCloser, CryoModule.Dictionary.join(p1, {
			isAvatarExperienceRoute = UseSignalState(UtilsModule.getIsAvatarExperienceRoute())
		}))
	end
else
	ItemDetailsCloser = RoactRoduxModule.connect(function(p1, _)
		-- upvalues: UtilsModule (copy)
		return {
			isAvatarExperienceRoute = UtilsModule.isAvatarExperienceRoute(p1)
		}
	end, nil)(ItemDetailsCloser)
	
	return ItemDetailsCloser
end