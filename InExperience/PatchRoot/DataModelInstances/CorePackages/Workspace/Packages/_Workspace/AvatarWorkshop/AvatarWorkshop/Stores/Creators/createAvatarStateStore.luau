local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local AvatarInventoryModule = require(Parent.DataHydration.AvatarInventory)
local SignalsModule = require(Parent.Signals)
local CreateComputedFunction = SignalsModule.createComputed
local CreateSignalFunction = SignalsModule.createSignal
local _ = require(AvatarWorkshop.Stores.AvatarStateTypes)
local HumanoidDescriptionAssetsModule = require(AvatarWorkshop.Utils.HumanoidDescriptionAssets)
local CreateAvatarStateFromOutfitDetailModule = require(AvatarWorkshop.Utils.createAvatarStateFromOutfitDetail)

return function()
	-- upvalues: CreateSignalFunction (copy), CreateComputedFunction (copy), AvatarInventoryModule (copy), CreateAvatarStateFromOutfitDetailModule (copy), HumanoidDescriptionAssetsModule (copy)
	local Signal, Signal2 = CreateSignalFunction(nil)
	local Computed = CreateComputedFunction(function(p1)
		-- upvalues: Signal (copy)
		local SignalResult = Signal(p1)
		
		return if SignalResult then SignalResult.humanoidDescription else nil
	end)
	
	local function load(p1)
		-- upvalues: Signal2 (copy)
		Signal2(table.freeze({
			humanoidDescription = p1.humanoidDescription:Clone(),
			rigType = p1.rigType,
			gearId = p1.gearId
		}))
	end
	
	local Flag = false
	
	return {
		getAvatarState = Signal,
		getHumanoidDescription = Computed,
		getRigType = CreateComputedFunction(function(p1)
			-- upvalues: Signal (copy)
			local SignalResult = Signal(p1)
			
			return if SignalResult then SignalResult.rigType else nil
		end),
		getGearId = CreateComputedFunction(function(p1)
			-- upvalues: Signal (copy)
			local SignalResult = Signal(p1)
			
			return if SignalResult then SignalResult.gearId else nil
		end),
		load = load,
		loadCurrentAvatar = function()
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
		end,
		setRigType = function(RigType)
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
		end,
		setGearId = function(GearId)
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
	}
end