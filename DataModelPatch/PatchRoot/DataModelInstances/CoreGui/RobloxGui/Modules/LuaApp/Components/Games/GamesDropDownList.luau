local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TopicInfosReducer = require(CorePackages.Workspace.Packages.TopicInfosRodux).TopicInfosReducer
local MemoizeFunction = require(CorePackages.Workspace.Packages.AppCommonLib).memoize
local OmniFeedTypes = require(CorePackages.Workspace.Packages.DiscoveryTypes).OmniFeedTypes
local DropDownListModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.DropDownList)
local IsSduiGameOmniFeedItemFunction = require(CorePackages.Workspace.Packages.ServerDrivenUi).isSduiGameOmniFeedItem
local GamesDropDownList = RoactModule.PureComponent:extend("GamesDropDownList")

function GamesDropDownList.init(p1)
	p1.state = {}
	
	function p1.dropDownSelectedCallback(p2, p3)
		-- upvalues: p1 (copy)
		if p1.props.onSelected then
			local Items = p1.props.items
			local DropdownPositionToStoreIndex = p1.props.dropdownPositionToStoreIndex
			assert(DropdownPositionToStoreIndex)
			
			if p3 <= #Items then
				local DropdownPositionToStoreIndexEntry = DropdownPositionToStoreIndex[p3]
				
				if DropdownPositionToStoreIndexEntry then
					return p1.props.onSelected(p2, DropdownPositionToStoreIndexEntry, p3)
				end
			end
		end
	end
end

function GamesDropDownList.render(p1)
	-- upvalues: RoactModule (copy), DropDownListModule (copy)
	return RoactModule.createElement(DropDownListModule, {
		position = p1.props.position,
		size = p1.props.size,
		items = p1.props.items,
		itemSelected = p1.props.itemSelected,
		onSelected = p1.dropDownSelectedCallback
	})
end

local MemoizeResult = MemoizeFunction(function(p1, p2, List, List1)
	-- upvalues: OmniFeedTypes (copy), IsSduiGameOmniFeedItemFunction (copy)
	local List2 = {}
	local t = {}
	
	local function _(p3, p4)
		-- upvalues: List2 (copy), t (copy)
		table.insert(List2, p3)
		t[#List2] = p4
	end
	
	for _, value in pairs(List1) do
		if value.isOmni then
			for i, value1 in ipairs(List) do
				local v1 = p1[value1.topicId]
				
				if v1.treatmentType == OmniFeedTypes.Carousel or IsSduiGameOmniFeedItemFunction(v1.treatmentType, v1.topicId) then
					table.insert(List2, v1)
					t[#List2] = i
				end
			end
		else
			for i1, sort in ipairs(p2[value.sortType].sorts) do
				table.insert(List2, p1[sort])
				t[#List2] = i1
			end
		end
	end
	return List2, t
end)

return RoactRoduxModule.connect(function(p3, p4)
	-- upvalues: TopicInfosReducer (copy), MemoizeResult (copy)
	local PersonalizationEntry = p3.Personalization[TopicInfosReducer.key][p4.selectedSortName]
	local Sorts = {}
	
	if p4.isOmni then
		local SortType = p4.sortCategories.OMNI_HOME.sortType
		
		if p3.OmniRecommendations and p3.OmniRecommendations[SortType] then
			Sorts = p3.OmniRecommendations[SortType].sorts or {}
		end
	end
	local MemoizeResultResult, MemoizeResultResult2 = MemoizeResult(p3.Personalization[TopicInfosReducer.key], p3.GameSortGroups, Sorts, p4.sortCategories)
	
	return {
		items = MemoizeResultResult or {},
		itemSelected = PersonalizationEntry or {},
		dropdownPositionToStoreIndex = MemoizeResultResult2
	}
end)(GamesDropDownList)