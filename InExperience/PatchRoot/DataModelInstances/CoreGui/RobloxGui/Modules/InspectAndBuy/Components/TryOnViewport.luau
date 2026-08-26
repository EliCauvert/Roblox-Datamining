local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local parent = script.Parent.Parent
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local constantsModule = require(parent.Constants)
local avatarViewportModule = require(parent.Components.AvatarViewport)
local getHumanoidDescriptionFromCostumeIdModule = require(parent.Thunks.GetHumanoidDescriptionFromCostumeId)
local getFFlagDisplayCollectiblesIconModule = require(parent.Flags.GetFFlagDisplayCollectiblesIcon)
local tryOnViewport = roactModule.PureComponent:extend("TryOnViewport")

local function _(p1)
	local var1
	if p1 and p1.parentBundleId ~= nil then
		var1 = not p1.isForSale or false
	end
	return var1
end

local _ = function(p1, p2)
	-- upvalues: constantsModule (ref)
	return {
		AssetId = tonumber(p2),
		Order = constantsModule.LayeredClothingOrder[p1],
		AccessoryType = constantsModule.AssetTypeIdToAccessoryTypeEnum[p1],
		IsLayered = constantsModule.LayeredAssetTypes[p1] ~= nil
	}
end

function tryOnViewport.init(p1)
	p1.model = p1.props.localPlayerModel
	p1.model.HumanoidRootPart.Anchored = true
	p1.humanoidDescriptions = {}
	p1.humanoidDescriptionForLocalPlayer = p1.model.Humanoid.HumanoidDescription
	p1.state = { obtainedHumanoidDescriptions = {} }
end

function tryOnViewport.didMount(p1)
	p1.isMounted = true
end

function tryOnViewport.didUpdate(p1, p2)
	-- upvalues: cryoModule (ref)
	local assetInfo = p1.props.assetInfo
	local bundles = p1.props.bundles
	local tryingOnInfo = p1.props.tryingOnInfo
	
	if tryingOnInfo ~= p2.tryingOnInfo and tryingOnInfo.tryingOn then
		local var1
		if assetInfo and assetInfo.parentBundleId ~= nil then
			var1 = not assetInfo.isForSale or false
		end
		if var1 then
			local costumeId = bundles[assetInfo.parentBundleId].costumeId
			
			if costumeId then
				p1.props.getHumanoidDescriptionFromCostumeId(costumeId, function(p3)
					-- upvalues: p1 (ref), costumeId (ref), cryoModule (copy)
					if p1 and p1.isMounted then
						p1.humanoidDescriptions[costumeId] = p3
						p1:setState({
							obtainedHumanoidDescriptions = cryoModule.Dictionary.join(p1.state.obtainedHumanoidDescriptions, { [costumeId] = true })
						})
					end
				end)
			end
		end
	end
end

function tryOnViewport.tryOnBundleWithoutCostumeId(p1, p2, p3)
	-- upvalues: constantsModule (ref)
	local t = {}
	local t_1 = {}
	local var1 = false
	
	for i, v in pairs(p1.props.bundles[p2].assetIds) do
		local var2 = p1.props.assets[v]
		local assetTypeId = constantsModule.AssetTypeIdToAccessoryTypeEnum[var2.assetTypeId]
		
		if assetTypeId then
			t[assetTypeId] = true
			local assetTypeId_1 = constantsModule.AssetTypeToAssetCategory[var2.assetTypeId]
			
			if assetTypeId_1 then
				t_1[assetTypeId_1] = true
			end
			var1 = true
		end
	end
	local var3 = p3:GetAccessories(true)
	local t_2 = {}
	
	if var1 then
		for i_1, v_1 in pairs(var3) do
			local accessoryType = constantsModule.AssetTypeToAssetCategory[constantsModule.AccessoryTypeEnumToAssetTypeId[v_1.AccessoryType]]
			
			if not t[v_1.AccessoryType] and (not accessoryType or not t_1[accessoryType]) then
				table.insert(t_2, v_1)
			end
		end
	end
	for i_1, v_1 in pairs(p1.props.bundles[p2].assetIds) do
		local var4 = p1.props.assets[v_1]
		
		if constantsModule.AssetTypeIdToAccessoryTypeEnum[var4.assetTypeId] then
			local assetTypeId = var4.assetTypeId
			table.insert(t_2, {
				AssetId = tonumber(v_1),
				Order = constantsModule.LayeredClothingOrder[assetTypeId],
				AccessoryType = constantsModule.AssetTypeIdToAccessoryTypeEnum[assetTypeId],
				IsLayered = constantsModule.LayeredAssetTypes[assetTypeId] ~= nil
			})
		else
			p3[constantsModule.AssetTypeIdStringToHumanoidDescriptionProp[var4.assetTypeId]] = v_1
		end
	end
	if var1 then
		p3:SetAccessories(t_2, true)
	end
	return p3
end

function tryOnViewport.render(p4)
	-- upvalues: constantsModule (ref), roactModule (ref), getFFlagDisplayCollectiblesIconModule (ref), avatarViewportModule (ref)
	local assetInfo = p4.props.assetInfo
	local bundles = p4.props.bundles
	local tryingOnInfo = p4.props.tryingOnInfo
	local var5 = p4.humanoidDescriptionForLocalPlayer:Clone()
	local tryingOn = tryingOnInfo.tryingOn
	local setScrollingEnabled = p4.props.setScrollingEnabled
	
	if tryingOnInfo and tryingOnInfo.tryingOn then
		local var6
		if assetInfo and assetInfo.parentBundleId ~= nil then
			var6 = not assetInfo.isForSale or false
		end
		if var6 then
			var6 = assetInfo.parentBundleId
			local costumeId = bundles[var6].costumeId
			
			if costumeId then
				local var7 = p4.humanoidDescriptions[costumeId]
				tryingOn = p4.state.obtainedHumanoidDescriptions[costumeId] == true
				
				if var7 then
					for i, v in pairs(constantsModule.AssetTypeIdStringToHumanoidDescriptionProp) do
						if constantsModule.AssetTypeIdToAccessoryTypeEnum[i] == nil and tonumber(var7[v]) and tostring(var7[v]) ~= "0" then
							var5[v] = var7[v]
						end
					end
					var5:SetAccessories(var7:GetAccessories(true), true)
				end
			else
				var5 = p4:tryOnBundleWithoutCostumeId(var6, var5)
			end
		elseif constantsModule.AssetTypeIdToAccessoryTypeEnum[tryingOnInfo.assetTypeId] then
			var6 = constantsModule.AssetTypeIdToAccessoryTypeEnum[tryingOnInfo.assetTypeId]
			local t = {}
			
			for i, v in pairs(var5:GetAccessories(true)) do
				local assetTypeId = constantsModule.AssetTypeToAssetCategory[tryingOnInfo.assetTypeId]
				
				if v.AccessoryType ~= var6 and (not assetTypeId or constantsModule.AssetTypeToAssetCategory[constantsModule.AccessoryTypeEnumToAssetTypeId[v.AccessoryType]] ~= assetTypeId) then
					table.insert(t, v)
				end
			end
			local assetTypeId = tryingOnInfo.assetTypeId
			table.insert(t, {
				AssetId = tonumber(tryingOnInfo.assetId),
				Order = constantsModule.LayeredClothingOrder[assetTypeId],
				AccessoryType = constantsModule.AssetTypeIdToAccessoryTypeEnum[assetTypeId],
				IsLayered = constantsModule.LayeredAssetTypes[assetTypeId] ~= nil
			})
			var5:SetAccessories(t, true)
		else
			var5[constantsModule.AssetTypeIdStringToHumanoidDescriptionProp[tryingOnInfo.assetTypeId]] = tryingOnInfo.assetId
		end
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		Size = UDim2.new(1, 0, 0, if getFFlagDisplayCollectiblesIconModule() then constantsModule.DetailsThumbnailFrameHeight else 300),
		Visible = tryingOn
	}, {
		AvatarViewport = roactModule.createElement(avatarViewportModule, {
			visible = true,
			backgroundTransparency = 1,
			size = UDim2.new(0.75, 0, 1, 0),
			position = UDim2.new(0.5, 0, 0.5, 0),
			humanoidDescription = var5,
			model = p4.model,
			setScrollingEnabled = setScrollingEnabled
		})
	})
end

function tryOnViewport.willUnmount(p5)
	p5.isMounted = false
end

return roactRoduxModule.UNSTABLE_connect2(function(p5, _)
	return {
		assets = p5.assets,
		assetInfo = p5.assets[p5.detailsInformation.assetId],
		bundles = p5.bundles,
		tryingOnInfo = p5.tryingOnInfo
	}
end, function(p5)
	-- upvalues: getHumanoidDescriptionFromCostumeIdModule (ref)
	return {
		getHumanoidDescriptionFromCostumeId = function(p6, p7)
			-- upvalues: p5 (ref), getHumanoidDescriptionFromCostumeIdModule (copy)
			return p5(getHumanoidDescriptionFromCostumeIdModule(p6, p7))
		end
	}
end)(tryOnViewport)