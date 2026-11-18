local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local AvatarInventoryModule = require(Parent.DataHydration.AvatarInventory)
local SignalsModule = require(Parent.Signals)
local CreateComputedFunction = SignalsModule.createComputed
local CreateSignalFunction = SignalsModule.createSignal
local _ = require(AvatarWorkshop.Stores.AvatarStateTypes)
local HumanoidDescriptionAssetsModule = require(AvatarWorkshop.Utils.HumanoidDescriptionAssets)
local CreateAvatarStateFromOutfitDetailModule = require(AvatarWorkshop.Utils.createAvatarStateFromOutfitDetail)
local EquipOutfitModule = require(AvatarWorkshop.Utils.equipOutfit)
local _ = require(AvatarWorkshop.Utils.getOutfitKind)
local IsWearingOutfitModule = require(AvatarWorkshop.Utils.isWearingOutfit)
local AssetTypeFromId = require(AvatarWorkshop.Constants.AvatarAssetTypeMappings).assetTypeFromId

return function()
	-- upvalues: CreateSignalFunction (copy), CreateComputedFunction (copy), AvatarInventoryModule (copy), CreateAvatarStateFromOutfitDetailModule (copy), HumanoidDescriptionAssetsModule (copy), AssetTypeFromId (copy), IsWearingOutfitModule (copy), EquipOutfitModule (copy)
	local Signal, Signal2 = CreateSignalFunction(nil)
	local Computed = CreateComputedFunction(function(p1)
		-- upvalues: Signal (copy)
		local SignalResult = Signal(p1)
		
		return if SignalResult then SignalResult.humanoidDescription else nil
	end)
	
	local function editDescription(Callback)
		-- upvalues: Signal (copy), Signal2 (copy)
		local SignalResult = Signal(false)
		
		if SignalResult == nil then return end
		local HumanoidDescription = SignalResult.humanoidDescription:Clone()
		
		if Callback(HumanoidDescription) then
			Signal2(table.freeze({
				humanoidDescription = HumanoidDescription,
				rigType = SignalResult.rigType,
				gearId = SignalResult.gearId
			}))
			
			return
		end
	end
	
	local function load(p1)
		-- upvalues: Signal2 (copy)
		Signal2(table.freeze({
			humanoidDescription = p1.humanoidDescription:Clone(),
			rigType = p1.rigType,
			gearId = p1.gearId
		}))
	end
	
	local Flag = false
	
	local function loadCurrentAvatar()
		-- upvalues: Flag (ref), Signal (copy), AvatarInventoryModule (upval), CreateAvatarStateFromOutfitDetailModule (upval), HumanoidDescriptionAssetsModule (upval), load (copy)
		if not Flag and Signal(false) == nil then
			Flag = true
			AvatarInventoryModule.fetchCurrentAvatar():andThen(function(Result)
				-- upvalues: Flag (upval), Signal (upval), CreateAvatarStateFromOutfitDetailModule (upval), HumanoidDescriptionAssetsModule (upval), load (upval)
				Flag = false
				
				if Signal(false) == nil then
					local AvatarStateFromOutfitDetailModule = CreateAvatarStateFromOutfitDetailModule(Result)
					HumanoidDescriptionAssetsModule.setEquippedEmotes(AvatarStateFromOutfitDetailModule.humanoidDescription, Result.emotes)
					load(AvatarStateFromOutfitDetailModule)
					
					return
				end
			end, function(p1)
				-- upvalues: Flag (upval)
				Flag = false
				
				if typeof(p1) == "table" then
					warn("AvatarWorkshop: couldn't load the current avatar:", p1.responseCode, p1.errorMessage)
					
					return
				else
					warn("AvatarWorkshop: couldn't load the current avatar:", p1)
				end
			end)
			
			return
		end
	end
	
	local Computed1 = CreateComputedFunction(function(p1)
		-- upvalues: Signal (copy)
		local SignalResult = Signal(p1)
		
		return if SignalResult then SignalResult.rigType else nil
	end)
	
	local function setRigType(RigType)
		-- upvalues: Signal (copy), Signal2 (copy)
		local SignalResult = Signal(false)
		
		if SignalResult ~= nil and SignalResult.rigType ~= RigType then
			Signal2(table.freeze({
				humanoidDescription = SignalResult.humanoidDescription,
				rigType = RigType,
				gearId = SignalResult.gearId
			}))
			
			return
		end
	end
	
	local Computed2 = CreateComputedFunction(function(p1)
		-- upvalues: Signal (copy)
		local SignalResult = Signal(p1)
		
		return if SignalResult then SignalResult.gearId else nil
	end)
	
	local function setGearId(GearId)
		-- upvalues: Signal (copy), Signal2 (copy)
		local SignalResult = Signal(false)
		
		if SignalResult ~= nil and SignalResult.gearId ~= GearId then
			Signal2(table.freeze({
				humanoidDescription = SignalResult.humanoidDescription,
				rigType = SignalResult.rigType,
				gearId = GearId
			}))
			
			return
		end
	end
	
	local Computed3 = CreateComputedFunction(function(p1)
		-- upvalues: Signal (copy), HumanoidDescriptionAssetsModule (upval)
		local t = {}
		local SignalResult = Signal(p1)
		
		if SignalResult then
			for _, value in HumanoidDescriptionAssetsModule.getEquippedAssetIds(SignalResult.humanoidDescription) do
				t[value] = true
			end
			if SignalResult.gearId then
				t[SignalResult.gearId] = true
			end
		end
		return t
	end)
	
	local function takeOffOutfit(p2)
		-- upvalues: editDescription (copy), AssetTypeFromId (upval), HumanoidDescriptionAssetsModule (upval), Computed2 (copy), setGearId (copy)
		editDescription(function(p3): boolean
			-- upvalues: p2 (copy), AssetTypeFromId (upval), HumanoidDescriptionAssetsModule (upval)
			local Flag = false
			
			for _, asset in p2.assets do
				local AssetTypeFromIdEntry = AssetTypeFromId[asset.assetType.id]
				
				if AssetTypeFromIdEntry and HumanoidDescriptionAssetsModule.unequipAsset(p3, asset.id, AssetTypeFromIdEntry) then
					Flag = true
				end
			end
			return Flag
		end)
		
		for _, asset in p2.assets do
			if asset.assetType.id == Enum.AvatarAssetType.Gear.Value and Computed2(false) == asset.id then
				setGearId(nil)
			end
		end
	end
	
	return {
		getAvatarState = Signal,
		getHumanoidDescription = Computed,
		getRigType = Computed1,
		getGearId = Computed2,
		getEquippedAssetIds = Computed3,
		load = load,
		toggleOutfit = function(p4, p5)
			-- upvalues: Signal (copy), loadCurrentAvatar (copy), IsWearingOutfitModule (upval), CreateAvatarStateFromOutfitDetailModule (upval), takeOffOutfit (copy), Signal2 (copy), EquipOutfitModule (upval)
			local SignalResult = Signal(false)
			
			if SignalResult == nil then
				loadCurrentAvatar()
				
				return
			end
			if (p5 == "DynamicHead" or (p5 == "Shoes" or p5 == "Animations")) and IsWearingOutfitModule(CreateAvatarStateFromOutfitDetailModule(p4), p5, SignalResult) then
				takeOffOutfit(p4)
				
				return
			else
				Signal2(table.freeze(EquipOutfitModule(SignalResult, p4, p5)))
			end
		end,
		loadCurrentAvatar = loadCurrentAvatar,
		setRigType = setRigType,
		setGearId = setGearId,
		toggleAsset = function(p4, AvatarAssetType)
			-- upvalues: Computed3 (copy), setGearId (copy), editDescription (copy), HumanoidDescriptionAssetsModule (upval)
			local IsComputedResultEntry = Computed3(false)[p4] == true
			
			if AvatarAssetType == Enum.AvatarAssetType.Gear then
				setGearId(if IsComputedResultEntry then nil else p4)
				
				return
			end
			if IsComputedResultEntry then
				editDescription(function(p5)
					-- upvalues: HumanoidDescriptionAssetsModule (upval), p4 (copy), AvatarAssetType (copy)
					return HumanoidDescriptionAssetsModule.unequipAsset(p5, p4, AvatarAssetType)
				end)
				
				return
			else
				editDescription(function(p5)
					-- upvalues: HumanoidDescriptionAssetsModule (upval), p4 (copy), AvatarAssetType (copy)
					return HumanoidDescriptionAssetsModule.equipAsset(p5, p4, AvatarAssetType)
				end)
			end
		end
	}
end