local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local _ = require(AvatarWorkshop.Stores.AvatarStateTypes)
local HumanoidDescriptionAssetsModule = require(AvatarWorkshop.Utils.HumanoidDescriptionAssets)
local _ = require(AvatarWorkshop.Utils.getOutfitKind)
local AssetTypeToAccessoryType = require(AvatarWorkshop.Constants.AvatarAssetTypeMappings).assetTypeToAccessoryType
local EnableFacsDisableOverride2EngineFeature = game:GetEngineFeature("EnableFacsDisableOverride2")
local config = {
	[AssetTypeToAccessoryType[Enum.AvatarAssetType.EyebrowAccessory]] = true,
	[AssetTypeToAccessoryType[Enum.AvatarAssetType.EyelashAccessory]] = true
}

local function _(p1, p2): boolean
	return if p1 == nil or p2 == nil then p1 == p2 else math.abs(p1 - p2) < 0.001
end

local _ = function(Vector, Vector1): boolean
	if Vector == nil or Vector1 == nil then
		return Vector == Vector1
	end
	local X = Vector.X
	local X1 = Vector1.X
	local IsXMatch: boolean = if X == nil or X1 == nil then X == X1 else math.abs(X - X1) < 0.001
	
	if IsXMatch then
		local Y = Vector.Y
		local Y1 = Vector1.Y
		IsXMatch = if Y == nil or Y1 == nil then Y == Y1 else math.abs(Y - Y1) < 0.001
		
		if IsXMatch then
			local Z = Vector.Z
			local Z1 = Vector1.Z
			
			if Z == nil or Z1 == nil then
				return Z == Z1
			end
			IsXMatch = math.abs(Z - Z1) < 0.001
		end
	end
	return IsXMatch
end

local _ = function(p1, p2): boolean
	local Position = p1.Position
	local Position1 = p2.Position
	local IsPositionMatch = nil
	
	if Position == nil or Position1 == nil then
		IsPositionMatch = Position == Position1
	else
		local X = Position.X
		local X1 = Position1.X
		IsPositionMatch = if X == nil or X1 == nil then X == X1 else math.abs(X - X1) < 0.001
		
		if IsPositionMatch then
			local Y = Position.Y
			local Y1 = Position1.Y
			IsPositionMatch = if Y == nil or Y1 == nil then Y == Y1 else math.abs(Y - Y1) < 0.001
			
			if IsPositionMatch then
				local Z = Position.Z
				local Z1 = Position1.Z
				IsPositionMatch = if Z == nil or Z1 == nil then Z == Z1 else math.abs(Z - Z1) < 0.001
			end
		end
	end
	if IsPositionMatch then
		local Rotation = p1.Rotation
		local Rotation1 = p2.Rotation
		
		if Rotation == nil or Rotation1 == nil then
			IsPositionMatch = Rotation == Rotation1
		else
			local X = Rotation.X
			local X2 = Rotation1.X
			IsPositionMatch = if X == nil or X2 == nil then X == X2 else math.abs(X - X2) < 0.001
			
			if IsPositionMatch then
				local Y = Rotation.Y
				local Y2 = Rotation1.Y
				IsPositionMatch = if Y == nil or Y2 == nil then Y == Y2 else math.abs(Y - Y2) < 0.001
				
				if IsPositionMatch then
					local Z = Rotation.Z
					local Z2 = Rotation1.Z
					IsPositionMatch = if Z == nil or Z2 == nil then Z == Z2 else math.abs(Z - Z2) < 0.001
				end
			end
		end
		if IsPositionMatch then
			local Scale = p1.Scale
			local Scale1 = p2.Scale
			
			if Scale == nil or Scale1 == nil then
				return Scale == Scale1
			end
			local X = Scale.X
			local X3 = Scale1.X
			IsPositionMatch = if X == nil or X3 == nil then X == X3 else math.abs(X - X3) < 0.001
			
			if IsPositionMatch then
				local Y = Scale.Y
				local Y3 = Scale1.Y
				IsPositionMatch = if Y == nil or Y3 == nil then Y == Y3 else math.abs(Y - Y3) < 0.001
				
				if IsPositionMatch then
					local Z = Scale.Z
					local Z3 = Scale1.Z
					
					if Z == nil or Z3 == nil then
						return Z == Z3
					end
					IsPositionMatch = math.abs(Z - Z3) < 0.001
				end
			end
		end
	end
	return IsPositionMatch
end

local _ = function(p1)
	-- upvalues: HumanoidDescriptionAssetsModule (copy)
	local t = {}
	
	for _, value in HumanoidDescriptionAssetsModule.getEquippedAssetIds(p1.humanoidDescription) do
		t[value] = true
	end
	if p1.gearId then
		t[p1.gearId] = true
	end
	return t
end

local _ = function(p2)
	-- upvalues: HumanoidDescriptionAssetsModule (copy)
	local t = {}
	
	for _, value in HumanoidDescriptionAssetsModule.getAccessories(p2) do
		t[value.AssetId] = value
	end
	return t
end

local function getLayeredClothingOrders(List)
	local Orders = {}
	
	for i, value in List do
		if value.IsLayered and value.Order then
			Orders[i] = value.Order
		end
	end
	return Orders
end

local function getMakeupOrders(HumanoidDescription)
	local Orders = {}
	
	for _, MakeupDescription in HumanoidDescription:GetChildren() do
		if MakeupDescription:IsA("MakeupDescription") then
			Orders[MakeupDescription.AssetId] = MakeupDescription.Order
		end
	end
	return Orders
end

local function getMakeupIds(HumanoidDescription, List)
	-- upvalues: getMakeupOrders (copy), config (copy)
	local List1 = {}
	
	for i in getMakeupOrders(HumanoidDescription) do
		table.insert(List1, i)
	end
	for i1, value in List do
		if config[value.AccessoryType] then
			table.insert(List1, i1)
		end
	end
	return List1
end

local _ = function(p3)
	-- upvalues: HumanoidDescriptionAssetsModule (copy)
	local HeadPartDescription = HumanoidDescriptionAssetsModule.getHeadPartDescription(p3)
	
	return if HeadPartDescription then HeadPartDescription.HeadShape else nil
end

local function keepsOrder(List, p3): boolean
	for i, value in List do
		local v1 = p3[i]
		
		if v1 ~= nil then
			for i1, value1 in List do
				local v2 = p3[i1]
				
				if v2 ~= nil and value < value1 and v2 < v1 then
					return false
				end
			end
		end
	end
	return true
end

return function(p4, p5, p6): boolean
	-- upvalues: HumanoidDescriptionAssetsModule (copy), EnableFacsDisableOverride2EngineFeature (copy), keepsOrder (copy), getLayeredClothingOrders (copy), getMakeupOrders (copy), getMakeupIds (copy)
	local HumanoidDescription = p4.humanoidDescription
	local HumanoidDescription1 = p6.humanoidDescription
	local t = {}
	
	for _, value in HumanoidDescriptionAssetsModule.getEquippedAssetIds(p4.humanoidDescription) do
		t[value] = true
	end
	if p4.gearId then
		t[p4.gearId] = true
	end
	local AssetIds = {}
	
	for _, value1 in HumanoidDescriptionAssetsModule.getEquippedAssetIds(p6.humanoidDescription) do
		AssetIds[value1] = true
	end
	if p6.gearId then
		AssetIds[p6.gearId] = true
	end
	for i in t do
		if not AssetIds[i] then
			return false
		end
	end
	if p5 == "DynamicHead" then
		return HumanoidDescription.Head ~= 0
	end
	local t1 = {}
	
	for _, value2 in HumanoidDescriptionAssetsModule.getAccessories(HumanoidDescription) do
		t1[value2.AssetId] = value2
	end
	local t2 = {}
	
	for _, value3 in HumanoidDescriptionAssetsModule.getAccessories(HumanoidDescription1) do
		t2[value3.AssetId] = value3
	end
	for i1, value4 in t1 do
		local Entry = t2[i1]
		
		if Entry ~= nil then
			local Position = value4.Position
			local Position1 = Entry.Position
			local IsPositionMatch = nil
			
			if Position == nil or Position1 == nil then
				IsPositionMatch = Position == Position1
			else
				local X = Position.X
				local X1 = Position1.X
				IsPositionMatch = if X == nil or X1 == nil then X == X1 else math.abs(X - X1) < 0.001
				
				if IsPositionMatch then
					local Y = Position.Y
					local Y1 = Position1.Y
					IsPositionMatch = if Y == nil or Y1 == nil then Y == Y1 else math.abs(Y - Y1) < 0.001
					
					if IsPositionMatch then
						local Z = Position.Z
						local Z1 = Position1.Z
						IsPositionMatch = if Z == nil or Z1 == nil then Z == Z1 else math.abs(Z - Z1) < 0.001
					end
				end
			end
			if IsPositionMatch then
				local Rotation = value4.Rotation
				local Rotation1 = Entry.Rotation
				
				if Rotation == nil or Rotation1 == nil then
					IsPositionMatch = Rotation == Rotation1
				else
					local X = Rotation.X
					local X2 = Rotation1.X
					IsPositionMatch = if X == nil or X2 == nil then X == X2 else math.abs(X - X2) < 0.001
					
					if IsPositionMatch then
						local Y = Rotation.Y
						local Y2 = Rotation1.Y
						IsPositionMatch = if Y == nil or Y2 == nil then Y == Y2 else math.abs(Y - Y2) < 0.001
						
						if IsPositionMatch then
							local Z = Rotation.Z
							local Z2 = Rotation1.Z
							IsPositionMatch = if Z == nil or Z2 == nil then Z == Z2 else math.abs(Z - Z2) < 0.001
						end
					end
				end
				if IsPositionMatch then
					local Scale = value4.Scale
					local Scale1 = Entry.Scale
					
					if Scale == nil or Scale1 == nil then
						IsPositionMatch = Scale == Scale1
					else
						local X = Scale.X
						local X3 = Scale1.X
						IsPositionMatch = if X == nil or X3 == nil then X == X3 else math.abs(X - X3) < 0.001
						
						if IsPositionMatch then
							local Y = Scale.Y
							local Y3 = Scale1.Y
							IsPositionMatch = if Y == nil or Y3 == nil then Y == Y3 else math.abs(Y - Y3) < 0.001
							
							if IsPositionMatch then
								local Z = Scale.Z
								local Z3 = Scale1.Z
								IsPositionMatch = if Z == nil or Z3 == nil then Z == Z3 else math.abs(Z - Z3) < 0.001
							end
						end
					end
				end
			end
			if IsPositionMatch then
				continue
			end
		end
		return false
	end
	if HumanoidDescription.Head ~= 0 then
		local HeadPartDescription = HumanoidDescriptionAssetsModule.getHeadPartDescription(HumanoidDescription)
		local HeadPartDescription1 = HumanoidDescriptionAssetsModule.getHeadPartDescription(HumanoidDescription1)
		
		if (if HeadPartDescription then HeadPartDescription.HeadShape else nil) ~= (if HeadPartDescription1 then HeadPartDescription1.HeadShape else nil) or EnableFacsDisableOverride2EngineFeature and HumanoidDescription.StaticFacialAnimation ~= HumanoidDescription1.StaticFacialAnimation then
			return false
		end
	end
	if not keepsOrder(getLayeredClothingOrders(t1), (getLayeredClothingOrders(t2))) or not keepsOrder(getMakeupOrders(HumanoidDescription), (getMakeupOrders(HumanoidDescription1))) then
		return false
	end
	repeat
		if p5 == "EditableAvatar" or p5 == "FullyQualifiedOutfit" then
			if p6.rigType == p4.rigType then
				local HeightScale = HumanoidDescription1.HeightScale
				local HeightScale1 = HumanoidDescription.HeightScale
				
				if if HeightScale == nil or HeightScale1 == nil then HeightScale == HeightScale1 else math.abs(HeightScale - HeightScale1) < 0.001 then
					local WidthScale = HumanoidDescription1.WidthScale
					local WidthScale1 = HumanoidDescription.WidthScale
					
					if if WidthScale == nil or WidthScale1 == nil then WidthScale == WidthScale1 else math.abs(WidthScale - WidthScale1) < 0.001 then
						local HeadScale = HumanoidDescription1.HeadScale
						local HeadScale1 = HumanoidDescription.HeadScale
						
						if if HeadScale == nil or HeadScale1 == nil then HeadScale == HeadScale1 else math.abs(HeadScale - HeadScale1) < 0.001 then
							local DepthScale = HumanoidDescription1.DepthScale
							local DepthScale1 = HumanoidDescription.DepthScale
							
							if if DepthScale == nil or DepthScale1 == nil then DepthScale == DepthScale1 else math.abs(DepthScale - DepthScale1) < 0.001 then
								local ProportionScale = HumanoidDescription1.ProportionScale
								local ProportionScale1 = HumanoidDescription.ProportionScale
								
								if if ProportionScale == nil or ProportionScale1 == nil then ProportionScale == ProportionScale1 else math.abs(ProportionScale - ProportionScale1) < 0.001 then
									local BodyTypeScale = HumanoidDescription1.BodyTypeScale
									local BodyTypeScale1 = HumanoidDescription.BodyTypeScale
									
									if if BodyTypeScale == nil or BodyTypeScale1 == nil then BodyTypeScale == BodyTypeScale1 else math.abs(BodyTypeScale - BodyTypeScale1) < 0.001 then
										if p5 == "EditableAvatar" and (HumanoidDescription1.HeadColor:ToHex() ~= HumanoidDescription.HeadColor:ToHex() or (HumanoidDescription1.TorsoColor:ToHex() ~= HumanoidDescription.TorsoColor:ToHex() or HumanoidDescription1.LeftArmColor:ToHex() ~= HumanoidDescription.LeftArmColor:ToHex() or (HumanoidDescription1.RightArmColor:ToHex() ~= HumanoidDescription.RightArmColor:ToHex() or HumanoidDescription1.LeftLegColor:ToHex() ~= HumanoidDescription.LeftLegColor:ToHex() or HumanoidDescription1.RightLegColor:ToHex() ~= HumanoidDescription.RightLegColor:ToHex()))) then
											return false
										end
										local SpawnEffect = if HumanoidDescriptionAssetsModule.getSpawnEffect(HumanoidDescription) then nil else HumanoidDescriptionAssetsModule.getSpawnEffect(HumanoidDescription1)
										for assetId in AssetIds do
											if not t[assetId] and (not SpawnEffect or assetId ~= SpawnEffect.AssetId) then
												return false
											end
										end
										break
									end
								end
							end
						end
					end
				end
			end
			return false
		elseif p5 ~= "Makeup" then
			continue
		else
			for _, value5 in getMakeupIds(HumanoidDescription1, t2) do
				if not t[value5] then
					return false
				end
			end
			break
		end
	until true
	return true
end