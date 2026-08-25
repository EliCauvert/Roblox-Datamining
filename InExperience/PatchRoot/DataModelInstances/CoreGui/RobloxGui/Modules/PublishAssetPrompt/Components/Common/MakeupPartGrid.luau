local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local gridMetrics = UIBloxModule.App.Grid.GridMetrics
local defaultMetricsGridView = UIBloxModule.App.Grid.DefaultMetricsGridView
local itemTile = UIBloxModule.Tile.ItemTile
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local avatarItemCardModule = require(script.Parent.Parent.PublishAvatarPrompt.AvatarParts.AvatarItemCard)
local getFFlagUploadMakeupSupportModule = require(script.Parent.Parent.Parent.Flags.GetFFlagUploadMakeupSupport)
local vector2 = Vector2.new(20, 20)
local t = {
	[Enum.AvatarAssetType.FaceMakeup] = "Face Makeup",
	[Enum.AvatarAssetType.LipMakeup] = "Lip Makeup",
	[Enum.AvatarAssetType.EyeMakeup] = "Eye Makeup",
	[Enum.AvatarAssetType.EyebrowAccessory] = "Eyebrow",
	[Enum.AvatarAssetType.EyelashAccessory] = "Eyelash"
}

local function getItemsFromFolder(p0, p1, p2, p3)
	-- upvalues: getFFlagUploadMakeupSupportModule (ref), t (ref)
	local t_1 = {}
	
	for i, v in ipairs(p0:GetChildren()) do
		if v:IsA("Decal") or v:IsA("Accessory") then
			local var10 = nil
			local var11 = p1
			local var12 = if p2 and p2[i] then p2[i].assetType else nil
			
			if p3 then
				if getFFlagUploadMakeupSupportModule() then
					var11 = p1 .. " - " .. (if var12 and t[var12] then t[var12] else v.Name)
				else
					var10 = p1
					var11 = if var12 and t[var12] then t[var12] else v.Name
				end
			end
			table.insert(t_1, {
				asset = v,
				assetType = var12,
				bodyName = var10,
				partName = var11,
				LayoutOrder = if p2 and p2[i] and p2[i].sortOrder then p2[i].sortOrder else i
			})
		end
	end
	table.sort(t_1, function(p4, p5)
		return (p4.LayoutOrder or 0) < (p5.LayoutOrder or 0)
	end)
	
	return t_1
end

return function(p6)
	-- upvalues: reactModule (ref), getItemsFromFolder (ref), t (ref), getFFlagUploadMakeupSupportModule (ref), constantsModule (ref), avatarItemCardModule (ref), itemTile (ref), defaultMetricsGridView (ref), gridMetrics (ref), vector2 (ref)
	local var13, var14 = reactModule.useState({})
	local var15 = p6.showAssetTypeInLabel == nil or p6.showAssetTypeInLabel
	reactModule.useEffect(function()
		-- upvalues: p6 (ref), var14 (ref), getItemsFromFolder (copy), var15 (ref), t (copy)
		if p6.makeupFolder then
			var14(getItemsFromFolder(p6.makeupFolder, p6.name, p6.makeupEntries, var15))
			
			return
		elseif not p6.singleDecal then
			var14({ [1] = {}, [2] = {} })
			
			return
		end
		local name = nil
		local name_1 = p6.name
		local singleAssetType = p6.singleAssetType
		
		if var15 then
			name = p6.name
			name_1 = if singleAssetType and t[singleAssetType] then t[singleAssetType] else p6.singleDecal.Name
		end
		var14({
			{
				LayoutOrder = 1,
				asset = p6.singleDecal,
				assetType = singleAssetType,
				bodyName = name,
				partName = name_1
			}
		})
	end, { p6.makeupFolder, p6.singleDecal })
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), getFFlagUploadMakeupSupportModule (copy), var15 (ref), t (copy), p6 (ref), var14 (ref)
		if var13[1] and var13[1].asset then
			local t_1 = {}
			
			for i, v in var13 do
				local bodyName = v.bodyName
				local partName = v.partName
				
				if getFFlagUploadMakeupSupportModule() then
					partName = if var15 then p6.name .. " - " .. (if v.assetType then t[v.assetType] else "") else p6.name
					bodyName = nil
				elseif var15 then
					bodyName = p6.name
				else
					partName = p6.name
				end
				t_1[i] = {
					asset = v.asset,
					assetType = v.assetType,
					bodyName = bodyName,
					partName = partName,
					LayoutOrder = v.LayoutOrder
				}
			end
			var14(t_1)
		end
	end, { p6.name })
	local var16 = if p6.screenSize.X < p6.screenSize.Y then constantsModule.ItemCardWidthPortrait else constantsModule.ItemCardWidthLandscape
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p6.LayoutOrder
	}, {
		Grid = reactModule.createElement(defaultMetricsGridView, {
			getItemHeight = function(p7)
				return p7 * 1.333333333333
			end,
			getItemMetrics = gridMetrics.makeCustomMetricsGetter({ minimumItemsPerRow = 2, minimumItemWidth = var16 }),
			renderItem = reactModule.useCallback(function(p8)
				-- upvalues: reactModule (copy), avatarItemCardModule (copy), var16 (ref), itemTile (copy)
				return if p8.asset then reactModule.createElement(avatarItemCardModule, {
					asset = p8.asset,
					assetType = p8.assetType,
					bodyName = p8.bodyName,
					partName = p8.partName,
					viewportSize = var16
				}) else reactModule.createElement(itemTile)
			end, { var16, p6.name }),
			itemPadding = vector2,
			items = var13
		})
	})
end