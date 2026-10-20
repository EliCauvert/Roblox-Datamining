local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local TutilsModule = require(CorePackages.Packages.tutils)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local ClearCurrentSortModule = require(Modules.AvatarExperience.LayeredClothingSort.Actions.ClearCurrentSort)
local ClearRemovedItemsModule = require(Modules.AvatarExperience.LayeredClothingSort.Actions.ClearRemovedItems)
local LayeredClothingSortHandler = require(CorePackages.Packages.Roact).PureComponent:extend("LayeredClothingSortHandler")
LayeredClothingSortHandler.validateProps = TModule.strictInterface({
	avatarRoute = TModule.table,
	tryOnItems = TModule.table,
	currentSort = TModule.optional(TModule.table),
	clearCurrentSort = TModule.callback,
	clearRemovedItems = TModule.callback
})

function LayeredClothingSortHandler:render()
	return nil
end

local function _(List, p1): boolean
	-- upvalues: TutilsModule (copy)
	local Count = 0
	
	for i in List do
		Count += 1
		
		if p1[i] == nil then
			return false
		end
	end
	return Count == TutilsModule.fieldCount(p1)
end

function LayeredClothingSortHandler.didSwitchTryOn(p2, p3): boolean
	-- upvalues: TutilsModule (copy)
	local TryOnItems = p2.props.tryOnItems
	local Count = 0
	local IsFieldCountResultMatch = nil
	
	for tryOnItem in p3.tryOnItems do
		Count += 1
		
		if TryOnItems[tryOnItem] == nil then
			IsFieldCountResultMatch = false
			return not IsFieldCountResultMatch
		end
	end
	IsFieldCountResultMatch = Count == TutilsModule.fieldCount(TryOnItems)
end

function LayeredClothingSortHandler.didUpdate(p4, p5)
	-- upvalues: AvatarScreen (copy)
	local Name = p4.props.avatarRoute.opaque.name
	local Name1 = p5.avatarRoute.opaque.name
	local DidSwitchTryOnResult = p4:didSwitchTryOn(p5)
	
	if Name ~= AvatarScreen.LayeredClothingSort and DidSwitchTryOnResult and #p4.props.currentSort > 0 then
		p4.props.clearCurrentSort()
	end
	if Name ~= Name1 and Name1 == AvatarScreen.LayeredClothingSort then
		p4.props.clearRemovedItems()
	end
end

return (RoactRoduxModule.connect(function(p4, _)
	return {
		tryOnItems = p4.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems,
		currentSort = p4.AvatarExperience.LayeredClothingSort.CurrentSort.OrderedList
	}
end, function(Callback)
	-- upvalues: ClearCurrentSortModule (copy), ClearRemovedItemsModule (copy)
	return {
		clearCurrentSort = function()
			-- upvalues: Callback (copy), ClearCurrentSortModule (upval)
			Callback(ClearCurrentSortModule())
		end,
		clearRemovedItems = function()
			-- upvalues: Callback (copy), ClearRemovedItemsModule (upval)
			Callback(ClearRemovedItemsModule())
		end
	}
end)(LayeredClothingSortHandler))