local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local Parent = script.Parent.Parent
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ConstantsModule = require(Parent.Constants)
local AvatarViewportModule = require(Parent.Components.AvatarViewport)
local GetHumanoidDescriptionFromCostumeIdModule = require(Parent.Thunks.GetHumanoidDescriptionFromCostumeId)
local GetFFlagDisplayCollectiblesIconModule = require(Parent.Flags.GetFFlagDisplayCollectiblesIcon)
local TryOnViewport = RoactModule.PureComponent:extend("TryOnViewport")

local function _(p1): boolean --[[ Line: 14 | Named "isPartOfBundleAndOffsale" ]]
	return p1 and p1.parentBundleId ~= nil and not p1.isForSale or false
end

local _ = function(p1, p2) --[[ Line: 18 | Named "createDefaultHumanoidDescriptionAccessoryInfo" ]]
	-- upvalues: ConstantsModule (copy)
	return {
		AssetId = tonumber(p2),
		Order = ConstantsModule.LayeredClothingOrder[p1],
		AccessoryType = ConstantsModule.AssetTypeIdToAccessoryTypeEnum[p1],
		IsLayered = ConstantsModule.LayeredAssetTypes[p1] ~= nil
	}
end

function TryOnViewport.init(p1) --[[ Line: 27 ]]
	p1.model = p1.props.localPlayerModel
	p1.model.HumanoidRootPart.Anchored = true
	p1.humanoidDescriptions = {}
	p1.humanoidDescriptionForLocalPlayer = p1.model.Humanoid.HumanoidDescription
	p1.state = { obtainedHumanoidDescriptions = {} }
end

function TryOnViewport.didMount(p1) --[[ Line: 37 ]]
	p1.isMounted = true
end

function TryOnViewport.didUpdate(p1, p2) --[[ Line: 41 ]]
	-- upvalues: CryoModule (copy)
	local AssetInfo = p1.props.assetInfo
	local Bundles = p1.props.bundles
	local TryingOnInfo = p1.props.tryingOnInfo
	
	if TryingOnInfo ~= p2.tryingOnInfo and TryingOnInfo.tryingOn and (AssetInfo and AssetInfo.parentBundleId ~= nil and not AssetInfo.isForSale or false) then
		local CostumeId = Bundles[AssetInfo.parentBundleId].costumeId
		
		if CostumeId then
			p1.props.getHumanoidDescriptionFromCostumeId(CostumeId, function(p3) --[[ Line: 53 ]]
				-- upvalues: p1 (copy), CostumeId (copy), CryoModule (upval)
				if p1 and p1.isMounted then
					p1.humanoidDescriptions[CostumeId] = p3
					p1:setState({
						obtainedHumanoidDescriptions = CryoModule.Dictionary.join(p1.state.obtainedHumanoidDescriptions, { [CostumeId] = true })
					})
				end
			end)
		end
	end
end

function TryOnViewport.tryOnBundleWithoutCostumeId(p1, ParentBundleId, Humanoid: Humanoid) --[[ Line: 72 ]]
	-- upvalues: ConstantsModule (copy)
	local t = {}
	local t1 = {}
	local Flag = false
	
	for _, assetId in pairs(p1.props.bundles[ParentBundleId].assetIds) do
		local Asset = p1.props.assets[assetId]
		local AssetTypeIdToAccessoryTypeEnumEntry = ConstantsModule.AssetTypeIdToAccessoryTypeEnum[Asset.assetTypeId]
		
		if AssetTypeIdToAccessoryTypeEnumEntry then
			t[AssetTypeIdToAccessoryTypeEnumEntry] = true
			local AssetTypeToAssetCategoryEntry = ConstantsModule.AssetTypeToAssetCategory[Asset.assetTypeId]
			
			if AssetTypeToAssetCategoryEntry then
				t1[AssetTypeToAssetCategoryEntry] = true
			end
			Flag = true
		end
	end
	local Accessories = Humanoid:GetAccessories(true)
	local List = {}
	
	if Flag then
		for _, accessory in pairs(Accessories) do
			local AssetTypeToAssetCategoryEntry = ConstantsModule.AssetTypeToAssetCategory[ConstantsModule.AccessoryTypeEnumToAssetTypeId[accessory.AccessoryType]]
			local NoAssetTypeToAssetCategoryEntry: boolean = not AssetTypeToAssetCategoryEntry or not t1[AssetTypeToAssetCategoryEntry]
			
			if not t[accessory.AccessoryType] and NoAssetTypeToAssetCategoryEntry then
				table.insert(List, accessory)
			end
		end
	end
	for _, assetId1 in pairs(p1.props.bundles[ParentBundleId].assetIds) do
		local Asset = p1.props.assets[assetId1]
		
		if ConstantsModule.AssetTypeIdToAccessoryTypeEnum[Asset.assetTypeId] then
			local AssetTypeId = Asset.assetTypeId
			table.insert(List, {
				AssetId = tonumber(assetId1),
				Order = ConstantsModule.LayeredClothingOrder[AssetTypeId],
				AccessoryType = ConstantsModule.AssetTypeIdToAccessoryTypeEnum[AssetTypeId],
				IsLayered = ConstantsModule.LayeredAssetTypes[AssetTypeId] ~= nil
			})
		else
			Humanoid[ConstantsModule.AssetTypeIdStringToHumanoidDescriptionProp[Asset.assetTypeId]] = assetId1
		end
	end
	if Flag then
		Humanoid:SetAccessories(List, true)
	end
	return Humanoid
end

function TryOnViewport.render(p2) --[[ Line: 126 ]]
	-- upvalues: ConstantsModule (copy), RoactModule (copy), GetFFlagDisplayCollectiblesIconModule (copy), AvatarViewportModule (copy)
	local AssetInfo = p2.props.assetInfo
	local Bundles = p2.props.bundles
	local TryingOnInfo = p2.props.tryingOnInfo
	local HumanoidDescriptionForLocalPlayer = p2.humanoidDescriptionForLocalPlayer:Clone()
	local TryingOn = TryingOnInfo.tryingOn
	local SetScrollingEnabled = p2.props.setScrollingEnabled
	
	if TryingOnInfo and TryingOnInfo.tryingOn then
		if AssetInfo and AssetInfo.parentBundleId ~= nil and not AssetInfo.isForSale or false then
			local ParentBundleId = AssetInfo.parentBundleId
			local CostumeId = Bundles[ParentBundleId].costumeId
			
			if CostumeId then
				local HumanoidDescription = p2.humanoidDescriptions[CostumeId]
				TryingOn = p2.state.obtainedHumanoidDescriptions[CostumeId] == true
				
				if HumanoidDescription then
					for i, value in pairs(ConstantsModule.AssetTypeIdStringToHumanoidDescriptionProp) do
						if ConstantsModule.AssetTypeIdToAccessoryTypeEnum[i] == nil and tonumber(HumanoidDescription[value]) and tostring(HumanoidDescription[value]) ~= "0" then
							HumanoidDescriptionForLocalPlayer[value] = HumanoidDescription[value]
						end
					end
					HumanoidDescriptionForLocalPlayer:SetAccessories(HumanoidDescription:GetAccessories(true), true)
				end
			else
				HumanoidDescriptionForLocalPlayer = p2:tryOnBundleWithoutCostumeId(ParentBundleId, HumanoidDescriptionForLocalPlayer)
			end
		elseif ConstantsModule.AssetTypeIdToAccessoryTypeEnum[TryingOnInfo.assetTypeId] then
			local AssetTypeIdToAccessoryTypeEnumEntry = ConstantsModule.AssetTypeIdToAccessoryTypeEnum[TryingOnInfo.assetTypeId]
			local List = {}
			
			for _, accessory in pairs((HumanoidDescriptionForLocalPlayer:GetAccessories(true))) do
				local AssetTypeToAssetCategoryEntry = ConstantsModule.AssetTypeToAssetCategory[TryingOnInfo.assetTypeId]
				local AssetTypeToAssetCategoryEntry1 = ConstantsModule.AssetTypeToAssetCategory[ConstantsModule.AccessoryTypeEnumToAssetTypeId[accessory.AccessoryType]]
				
				if accessory.AccessoryType ~= AssetTypeIdToAccessoryTypeEnumEntry and (not AssetTypeToAssetCategoryEntry or AssetTypeToAssetCategoryEntry1 ~= AssetTypeToAssetCategoryEntry) then
					table.insert(List, accessory)
				end
			end
			local AssetTypeId = TryingOnInfo.assetTypeId
			table.insert(List, {
				AssetId = tonumber(TryingOnInfo.assetId),
				Order = ConstantsModule.LayeredClothingOrder[AssetTypeId],
				AccessoryType = ConstantsModule.AssetTypeIdToAccessoryTypeEnum[AssetTypeId],
				IsLayered = ConstantsModule.LayeredAssetTypes[AssetTypeId] ~= nil
			})
			HumanoidDescriptionForLocalPlayer:SetAccessories(List, true)
		else
			HumanoidDescriptionForLocalPlayer[ConstantsModule.AssetTypeIdStringToHumanoidDescriptionProp[TryingOnInfo.assetTypeId]] = TryingOnInfo.assetId
		end
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		Size = UDim2.new(1, 0, 0, GetFFlagDisplayCollectiblesIconModule() and ConstantsModule.DetailsThumbnailFrameHeight or 300),
		Visible = TryingOn
	}, {
		AvatarViewport = RoactModule.createElement(AvatarViewportModule, {
			visible = true,
			backgroundTransparency = 1,
			size = UDim2.new(0.75, 0, 1, 0),
			position = UDim2.new(0.5, 0, 0.5, 0),
			humanoidDescription = HumanoidDescriptionForLocalPlayer,
			model = p2.model,
			setScrollingEnabled = SetScrollingEnabled
		})
	})
end

function TryOnViewport.willUnmount(p3) --[[ Line: 214 ]]
	p3.isMounted = false
end

return RoactRoduxModule.UNSTABLE_connect2(function(p3, _) --[[ Line: 218 ]]
	return {
		assets = p3.assets,
		assetInfo = p3.assets[p3.detailsInformation.assetId],
		bundles = p3.bundles,
		tryingOnInfo = p3.tryingOnInfo
	}
end, function(Callback) --[[ Line: 227 ]]
	-- upvalues: GetHumanoidDescriptionFromCostumeIdModule (copy)
	return {
		getHumanoidDescriptionFromCostumeId = function(p3, p4) --[[ Line: 229 ]]
			-- upvalues: Callback (copy), GetHumanoidDescriptionFromCostumeIdModule (upval)
			return Callback(GetHumanoidDescriptionFromCostumeIdModule(p3, p4))
		end
	}
end)(TryOnViewport)