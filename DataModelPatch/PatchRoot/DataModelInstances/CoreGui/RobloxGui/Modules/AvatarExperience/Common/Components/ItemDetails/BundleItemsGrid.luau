local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local BaseItemCardModule = require(Modules.AvatarExperience.Catalog.Components.ItemsList.BaseItemCard)
local LoadableGridViewModule = require(Modules.AvatarExperience.Common.Components.LoadableGridView)
local FetchBundleAssetsDetailsModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchBundleAssetsDetails)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithTextSizeOffsetFunction = UIBloxModule.Core.Style.withTextSizeOffset
local BundlesItemsGrid = RoactModule.PureComponent:extend("BundlesItemsGrid")

function BundlesItemsGrid.init(p1)
	-- upvalues: RoactModule (copy), BaseItemCardModule (copy)
	function p1.renderItemTile(p2)
		-- upvalues: RoactModule (upval), BaseItemCardModule (upval)
		return RoactModule.createElement(BaseItemCardModule, {
			itemId = p2.id,
			itemType = p2.type,
			gridInformation = p2.gridInformation,
			onActivated = function() end
		})
	end
end

function BundlesItemsGrid.willUpdate(p1, p2)
	if p1.props.bundleItemsList ~= p2.bundleItemsList then
		local List = {}
		local BundleItemsList = p2.bundleItemsList
		
		if BundleItemsList then
			for _, value in BundleItemsList do
				table.insert(List, (tonumber(value.id)))
			end
		end
		p1.props.fetchBundleAssetsDetails(p1.props.networking, p1.props.bundleId or p2.bundleId, List)
	end
end

function BundlesItemsGrid.render(p3)
	-- upvalues: ConstantsModule (copy), WithTextSizeOffsetFunction (copy), WithStyleFunction (copy), UtilsModule (copy), RoactModule (copy), LoadableGridViewModule (copy), CatalogConstantsModule (copy)
	local BundleItemsList = p3.props.bundleItemsList
	local LayoutOrder = p3.props.LayoutOrder
	local List = nil
	
	if BundleItemsList then
		List = {}
		
		for _, value in BundleItemsList do
			if value.type == ConstantsModule.ItemType.Asset then
				table.insert(List, value)
			end
		end
	end
	return WithTextSizeOffsetFunction(function(p4)
		-- upvalues: WithStyleFunction (upval), ConstantsModule (upval), UtilsModule (upval), RoactModule (upval), LoadableGridViewModule (upval), p3 (copy), List (ref), LayoutOrder (copy), CatalogConstantsModule (upval)
		return WithStyleFunction(function(p5)
			-- upvalues: p4 (copy), ConstantsModule (upval), UtilsModule (upval), RoactModule (upval), LoadableGridViewModule (upval), p3 (upval), List (upval), LayoutOrder (upval), CatalogConstantsModule (upval)
			local _Font = p5.Font
			
			return RoactModule.createElement(LoadableGridViewModule, {
				renderItem = p3.renderItemTile,
				getItemHeight = UtilsModule.GridItemHeightGetter(ConstantsModule.ItemTileType.BundleItemTile, _Font.BaseSize * _Font.Header2.RelativeSize + p4),
				items = List,
				LayoutOrder = LayoutOrder,
				totalNumItems = CatalogConstantsModule.bundleIncludedItemsCount
			})
		end)
	end)
end

return (RoactServices.connect({ networking = RoactNetworkingModule })((RoactRoduxModule.connect(function(p4, p5)
	local Text = tostring(p5.itemId)
	local BundleInfo = p4.AvatarExperience.Common.BundleInfos[Text]
	
	return {
		bundleId = Text,
		bundleItemsList = BundleInfo and BundleInfo.items
	}
end, function(Callback)
	-- upvalues: FetchBundleAssetsDetailsModule (copy)
	return {
		fetchBundleAssetsDetails = function(p4, p5, p6)
			-- upvalues: Callback (copy), FetchBundleAssetsDetailsModule (upval)
			Callback(FetchBundleAssetsDetailsModule(p4, p5, p6))
		end
	}
end)(BundlesItemsGrid))))