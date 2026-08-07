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

local function _(p0) --[[ line: 14 | named "isPartOfBundleAndOffsale" ]]
	local var9
	if p0 and p0.parentBundleId ~= nil then
		var9 = not p0.isForSale or false
	end
	return var9
end

local _ = function(p1, p2) --[[ line: 18 | named "createDefaultHumanoidDescriptionAccessoryInfo" ]]
	-- upvalues: constantsModule (ref)
	return {
		AssetId = tonumber(p2),
		Order = constantsModule.LayeredClothingOrder[p1],
		AccessoryType = constantsModule.AssetTypeIdToAccessoryTypeEnum[p1],
		IsLayered = constantsModule.LayeredAssetTypes[p1] ~= nil
	}
end

function tryOnViewport.init(p3) --[[ line: 27 ]]
	p3.model = p3.props.localPlayerModel
	p3.model.HumanoidRootPart.Anchored = true
	p3.humanoidDescriptions = {}
	p3.humanoidDescriptionForLocalPlayer = p3.model.Humanoid.HumanoidDescription
	p3.state = { obtainedHumanoidDescriptions = {} }
end

function tryOnViewport.didMount(p4) --[[ line: 37 ]]
	p4.isMounted = true
end

function tryOnViewport.didUpdate(p5, p6) --[[ line: 41 ]]
	-- upvalues: cryoModule (ref)
	local assetInfo = p5.props.assetInfo
	local bundles = p5.props.bundles
	local tryingOnInfo = p5.props.tryingOnInfo
	
	if tryingOnInfo ~= p6.tryingOnInfo and tryingOnInfo.tryingOn then
		local var10
		if assetInfo and assetInfo.parentBundleId ~= nil then
			var10 = not assetInfo.isForSale or false
		end
		if var10 then
			local costumeId = bundles[assetInfo.parentBundleId].costumeId
			
			if costumeId then
				p5.props.getHumanoidDescriptionFromCostumeId(costumeId, function(p7) --[[ line: 53 ]]
					-- upvalues: p5 (ref), costumeId (ref), cryoModule (copy)
					if p5 and p5.isMounted then
						p5.humanoidDescriptions[costumeId] = p7
						p5:setState({
							obtainedHumanoidDescriptions = cryoModule.Dictionary.join(p5.state.obtainedHumanoidDescriptions, { [costumeId] = true })
						})
					end
				end)
			end
		end
	end
end

function tryOnViewport.tryOnBundleWithoutCostumeId(p8, p9, p10) --[[ line: 72 ]]
	-- upvalues: constantsModule (ref)
	local t = {}
	local t_1 = {}
	local var13 = false
	
	for i, v in pairs(p8.props.bundles[p9].assetIds) do
		local var17 = p8.props.assets[v]
		local assetTypeId = constantsModule.AssetTypeIdToAccessoryTypeEnum[var17.assetTypeId]
		
		if assetTypeId then
			t[assetTypeId] = true
			local assetTypeId_1 = constantsModule.AssetTypeToAssetCategory[var17.assetTypeId]
			
			if assetTypeId_1 then
				t_1[assetTypeId_1] = true
			end
			var13 = true
		end
	end
	local var14 = p10:GetAccessories(true)
	local t_2 = {}
	
	if var13 then
		for i_1, v_1 in pairs(var14) do
			local accessoryType = constantsModule.AssetTypeToAssetCategory[constantsModule.AccessoryTypeEnumToAssetTypeId[v_1.AccessoryType]]
			
			if not t[v_1.AccessoryType] and (not accessoryType or not t_1[accessoryType]) then
				table.insert(t_2, v_1)
			end
		end
	end
	for i_1, v_1 in pairs(p8.props.bundles[p9].assetIds) do
		local var16 = p8.props.assets[v_1]
		
		if constantsModule.AssetTypeIdToAccessoryTypeEnum[var16.assetTypeId] then
			local assetTypeId = var16.assetTypeId
			table.insert(t_2, {
				AssetId = tonumber(v_1),
				Order = constantsModule.LayeredClothingOrder[assetTypeId],
				AccessoryType = constantsModule.AssetTypeIdToAccessoryTypeEnum[assetTypeId],
				IsLayered = constantsModule.LayeredAssetTypes[assetTypeId] ~= nil
			})
		else
			p10[constantsModule.AssetTypeIdStringToHumanoidDescriptionProp[var16.assetTypeId]] = v_1
		end
	end
	if var13 then
		p10:SetAccessories(t_2, true)
	end
	return p10
end

function tryOnViewport.render(p11) --[[ line: 126 ]]
	-- upvalues: constantsModule (ref), roactModule (ref), getFFlagDisplayCollectiblesIconModule (ref), avatarViewportModule (ref)
	local assetInfo = p11.props.assetInfo
	local bundles = p11.props.bundles
	local tryingOnInfo = p11.props.tryingOnInfo
	local var18 = p11.humanoidDescriptionForLocalPlayer:Clone()
	local tryingOn = tryingOnInfo.tryingOn
	local setScrollingEnabled = p11.props.setScrollingEnabled
	
	if tryingOnInfo and tryingOnInfo.tryingOn then
		local var19
		if assetInfo and assetInfo.parentBundleId ~= nil then
			var19 = not assetInfo.isForSale or false
		end
		if var19 then
			var19 = assetInfo.parentBundleId
			local costumeId = bundles[var19].costumeId
			
			if costumeId then
				local var20 = p11.humanoidDescriptions[costumeId]
				tryingOn = p11.state.obtainedHumanoidDescriptions[costumeId] == true
				
				if var20 then
					for i, v in pairs(constantsModule.AssetTypeIdStringToHumanoidDescriptionProp) do
						if constantsModule.AssetTypeIdToAccessoryTypeEnum[i] == nil and tonumber(var20[v]) and tostring(var20[v]) ~= "0" then
							var18[v] = var20[v]
						end
					end
					var18:SetAccessories(var20:GetAccessories(true), true)
				end
			else
				var18 = p11:tryOnBundleWithoutCostumeId(var19, var18)
			end
		elseif constantsModule.AssetTypeIdToAccessoryTypeEnum[tryingOnInfo.assetTypeId] then
			var19 = constantsModule.AssetTypeIdToAccessoryTypeEnum[tryingOnInfo.assetTypeId]
			local t = {}
			
			for i, v in pairs(var18:GetAccessories(true)) do
				local assetTypeId = constantsModule.AssetTypeToAssetCategory[tryingOnInfo.assetTypeId]
				
				if v.AccessoryType ~= var19 and (not assetTypeId or constantsModule.AssetTypeToAssetCategory[constantsModule.AccessoryTypeEnumToAssetTypeId[v.AccessoryType]] ~= assetTypeId) then
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
			var18:SetAccessories(t, true)
		else
			var18[constantsModule.AssetTypeIdStringToHumanoidDescriptionProp[tryingOnInfo.assetTypeId]] = tryingOnInfo.assetId
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
			humanoidDescription = var18,
			model = p11.model,
			setScrollingEnabled = setScrollingEnabled
		})
	})
end

function tryOnViewport.willUnmount(p12) --[[ line: 214 ]]
	p12.isMounted = false
end

return roactRoduxModule.UNSTABLE_connect2(function(p13, _) --[[ line: 218 ]]
	return {
		assets = p13.assets,
		assetInfo = p13.assets[p13.detailsInformation.assetId],
		bundles = p13.bundles,
		tryingOnInfo = p13.tryingOnInfo
	}
end, function(p14) --[[ line: 227 ]]
	-- upvalues: getHumanoidDescriptionFromCostumeIdModule (ref)
	return {
		getHumanoidDescriptionFromCostumeId = function(p15, p16) --[[ line: 229 ]]
			-- upvalues: p14 (ref), getHumanoidDescriptionFromCostumeIdModule (copy)
			return p14(getHumanoidDescriptionFromCostumeIdModule(p15, p16))
		end
	}
end)(tryOnViewport)