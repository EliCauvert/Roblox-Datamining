local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local GridMetrics = UIBloxModule.App.Grid.GridMetrics
local DefaultMetricsGridView = UIBloxModule.App.Grid.DefaultMetricsGridView
local ItemTile = UIBloxModule.Tile.ItemTile
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local AvatarItemCardModule = require(script.Parent.Parent.PublishAvatarPrompt.AvatarParts.AvatarItemCard)
local GetFFlagUploadMakeupSupportModule = require(script.Parent.Parent.Parent.Flags.GetFFlagUploadMakeupSupport)
local _Vector2 = Vector2.new(20, 20)
local config = {
	[Enum.AvatarAssetType.FaceMakeup] = "Face Makeup",
	[Enum.AvatarAssetType.LipMakeup] = "Lip Makeup",
	[Enum.AvatarAssetType.EyeMakeup] = "Eye Makeup",
	[Enum.AvatarAssetType.EyebrowAccessory] = "Eyebrow",
	[Enum.AvatarAssetType.EyelashAccessory] = "Eyelash"
}

local function getItemsFromFolder(MakeupFolder, Name, MakeupEntries, NoShowAssetTypeInLabel) --[[ Line: 42 ]]
	-- upvalues: GetFFlagUploadMakeupSupportModule (copy), config (copy)
	local List = {}
	
	for i, child in ipairs((MakeupFolder:GetChildren())) do
		if child:IsA("Decal") or child:IsA("Accessory") then
			local BodyName = nil
			local Name1 = Name
			local AssetType = if MakeupEntries and MakeupEntries[i] then MakeupEntries[i].assetType else nil
			
			if NoShowAssetTypeInLabel then
				if GetFFlagUploadMakeupSupportModule() then
					Name1 = Name .. " - " .. (if AssetType and config[AssetType] then config[AssetType] else child.Name)
				else
					BodyName = Name
					Name1 = if AssetType and config[AssetType] then config[AssetType] else child.Name
				end
			end
			table.insert(List, {
				asset = child,
				assetType = AssetType,
				bodyName = BodyName,
				partName = Name1,
				LayoutOrder = if MakeupEntries and MakeupEntries[i] and MakeupEntries[i].sortOrder then MakeupEntries[i].sortOrder else i
			})
		end
	end
	table.sort(List, function(A, B): boolean --[[ Line: 92 ]]
		return (A.LayoutOrder or 0) < (B.LayoutOrder or 0)
	end)
	
	return List
end

return function(Frame) --[[ Line: 99 | Named "MakeupPartGrid" ]]
	-- upvalues: ReactModule (copy), getItemsFromFolder (copy), config (copy), GetFFlagUploadMakeupSupportModule (copy), ConstantsModule (copy), AvatarItemCardModule (copy), ItemTile (copy), DefaultMetricsGridView (copy), GridMetrics (copy), _Vector2 (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local NoShowAssetTypeInLabel = Frame.showAssetTypeInLabel == nil or Frame.showAssetTypeInLabel
	ReactModule.useEffect(function() --[[ Line: 104 ]]
		-- upvalues: Frame (copy), UseStateResult2 (copy), getItemsFromFolder (upval), NoShowAssetTypeInLabel (copy), config (upval)
		if Frame.makeupFolder then
			UseStateResult2((getItemsFromFolder(Frame.makeupFolder, Frame.name, Frame.makeupEntries, NoShowAssetTypeInLabel)))
			
			return
		end
		if not Frame.singleDecal then
			UseStateResult2({ [1] = {}, [2] = {} })
			
			return
		end
		local Name = nil
		local Name1 = Frame.name
		local SingleAssetType = Frame.singleAssetType
		
		if NoShowAssetTypeInLabel then
			Name = Frame.name
			Name1 = if SingleAssetType and config[SingleAssetType] then config[SingleAssetType] else Frame.singleDecal.Name
		end
		UseStateResult2({
			{
				LayoutOrder = 1,
				asset = Frame.singleDecal,
				assetType = SingleAssetType,
				bodyName = Name,
				partName = Name1
			}
		})
	end, { Frame.makeupFolder, Frame.singleDecal })
	ReactModule.useEffect(function() --[[ Line: 139 ]]
		-- upvalues: UseStateResult (copy), GetFFlagUploadMakeupSupportModule (upval), NoShowAssetTypeInLabel (copy), config (upval), Frame (copy), UseStateResult2 (copy)
		if UseStateResult[1] and UseStateResult[1].asset then
			local t = {}
			
			for i, Frame1 in UseStateResult do
				local BodyName = Frame1.bodyName
				local PartName = Frame1.partName
				
				if GetFFlagUploadMakeupSupportModule() then
					PartName = if NoShowAssetTypeInLabel then Frame.name .. " - " .. (Frame1.assetType and config[Frame1.assetType] or "") else Frame.name
					BodyName = nil
				elseif NoShowAssetTypeInLabel then
					BodyName = Frame.name
				else
					PartName = Frame.name
				end
				t[i] = {
					asset = Frame1.asset,
					assetType = Frame1.assetType,
					bodyName = BodyName,
					partName = PartName,
					LayoutOrder = Frame1.LayoutOrder
				}
			end
			UseStateResult2(t)
		end
	end, { Frame.name })
	local IsXBelow = Frame.screenSize.X < Frame.screenSize.Y
	local ItemCardWidthPortrait = if IsXBelow then ConstantsModule.ItemCardWidthPortrait else ConstantsModule.ItemCardWidthLandscape
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = Frame.LayoutOrder
	}, {
		Grid = ReactModule.createElement(DefaultMetricsGridView, {
			getItemHeight = function(p1: number): number --[[ Line: 198 ]]
				return p1 * 1.3333333333333333
			end,
			getItemMetrics = GridMetrics.makeCustomMetricsGetter({
				minimumItemsPerRow = 2,
				minimumItemWidth = ItemCardWidthPortrait
			}),
			renderItem = ReactModule.useCallback(function(p1) --[[ Line: 177 ]]
				-- upvalues: ReactModule (upval), AvatarItemCardModule (upval), ItemCardWidthPortrait (copy), ItemTile (upval)
				return if p1.asset then ReactModule.createElement(AvatarItemCardModule, {
					asset = p1.asset,
					assetType = p1.assetType,
					bodyName = p1.bodyName,
					partName = p1.partName,
					viewportSize = ItemCardWidthPortrait
				}) else ReactModule.createElement(ItemTile)
			end, { ItemCardWidthPortrait, Frame.name }),
			itemPadding = _Vector2,
			items = UseStateResult
		})
	})
end