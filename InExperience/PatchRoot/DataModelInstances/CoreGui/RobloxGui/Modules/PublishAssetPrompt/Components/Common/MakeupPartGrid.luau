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

local function getItemsFromFolder(p1, p2, p3, p4)
	-- upvalues: getFFlagUploadMakeupSupportModule (ref), t (ref)
	local t_1 = {}
	
	for i, v in ipairs(p1:GetChildren()) do
		if v:IsA("Decal") or v:IsA("Accessory") then
			local var1 = nil
			local var2 = p2
			local var3 = if p3 and p3[i] then p3[i].assetType else nil
			
			if p4 then
				if getFFlagUploadMakeupSupportModule() then
					var2 = p2 .. " - " .. (if var3 and t[var3] then t[var3] else v.Name)
				else
					var1 = p2
					var2 = if var3 and t[var3] then t[var3] else v.Name
				end
			end
			table.insert(t_1, {
				asset = v,
				assetType = var3,
				bodyName = var1,
				partName = var2,
				LayoutOrder = if p3 and p3[i] and p3[i].sortOrder then p3[i].sortOrder else i
			})
		end
	end
	table.sort(t_1, function(p5, p6)
		return (p5.LayoutOrder or 0) < (p6.LayoutOrder or 0)
	end)
	
	return t_1
end

return function(p5)
	-- upvalues: reactModule (ref), getItemsFromFolder (ref), t (ref), getFFlagUploadMakeupSupportModule (ref), constantsModule (ref), avatarItemCardModule (ref), itemTile (ref), defaultMetricsGridView (ref), gridMetrics (ref), vector2 (ref)
	local var4, var5 = reactModule.useState({})
	local var6 = p5.showAssetTypeInLabel == nil or p5.showAssetTypeInLabel
	reactModule.useEffect(function()
		-- upvalues: p5 (ref), var5 (ref), getItemsFromFolder (copy), var6 (ref), t (copy)
		if p5.makeupFolder then
			var5(getItemsFromFolder(p5.makeupFolder, p5.name, p5.makeupEntries, var6))
			
			return
		elseif not p5.singleDecal then
			var5({ [1] = {}, [2] = {} })
			
			return
		end
		local name = nil
		local name_1 = p5.name
		local singleAssetType = p5.singleAssetType
		
		if var6 then
			name = p5.name
			name_1 = if singleAssetType and t[singleAssetType] then t[singleAssetType] else p5.singleDecal.Name
		end
		var5({
			{
				LayoutOrder = 1,
				asset = p5.singleDecal,
				assetType = singleAssetType,
				bodyName = name,
				partName = name_1
			}
		})
	end, { p5.makeupFolder, p5.singleDecal })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), getFFlagUploadMakeupSupportModule (copy), var6 (ref), t (copy), p5 (ref), var5 (ref)
		if var4[1] and var4[1].asset then
			local t_1 = {}
			
			for i, v in var4 do
				local bodyName = v.bodyName
				local partName = v.partName
				
				if getFFlagUploadMakeupSupportModule() then
					partName = if var6 then p5.name .. " - " .. (if v.assetType then t[v.assetType] else "") else p5.name
					bodyName = nil
				elseif var6 then
					bodyName = p5.name
				else
					partName = p5.name
				end
				t_1[i] = {
					asset = v.asset,
					assetType = v.assetType,
					bodyName = bodyName,
					partName = partName,
					LayoutOrder = v.LayoutOrder
				}
			end
			var5(t_1)
		end
	end, { p5.name })
	local var7 = if p5.screenSize.X < p5.screenSize.Y then constantsModule.ItemCardWidthPortrait else constantsModule.ItemCardWidthLandscape
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p5.LayoutOrder
	}, {
		Grid = reactModule.createElement(defaultMetricsGridView, {
			getItemHeight = function(p6)
				return p6 * 1.333333333333
			end,
			getItemMetrics = gridMetrics.makeCustomMetricsGetter({ minimumItemsPerRow = 2, minimumItemWidth = var7 }),
			renderItem = reactModule.useCallback(function(p6)
				-- upvalues: reactModule (copy), avatarItemCardModule (copy), var7 (ref), itemTile (copy)
				return if p6.asset then reactModule.createElement(avatarItemCardModule, {
					asset = p6.asset,
					assetType = p6.assetType,
					bodyName = p6.bodyName,
					partName = p6.partName,
					viewportSize = var7
				}) else reactModule.createElement(itemTile)
			end, { var7, p5.name }),
			itemPadding = vector2,
			items = var4
		})
	})
end