local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local CreateSignalFunction = require(AvatarWorkshop.Parent.Signals).createSignal
local _ = require(AvatarWorkshop.Stores.AvatarStateTypes)
local SaveAvatarFlowStepEnumModule = require(AvatarWorkshop.Enums.SaveAvatarFlowStepEnum)
local SaveOutfitFailureEnumModule = require(AvatarWorkshop.Enums.SaveOutfitFailureEnum)
local _ = require(AvatarWorkshop.Stores.Creators.createWornOutfitStore)
local _ = require(AvatarWorkshop.Stores.Creators.createOutfitSaverStore)

return function(p1)
	-- upvalues: CreateSignalFunction (copy), SaveOutfitFailureEnumModule (copy), SaveAvatarFlowStepEnumModule (copy)
	local Signal, Signal2 = CreateSignalFunction(nil)
	local Signal1, Signal2_1 = CreateSignalFunction(nil)
	local Signal3, Signal2_2 = CreateSignalFunction(nil)
	local Signal4, Signal2_3 = CreateSignalFunction(nil)
	local Signal5, Signal2_4 = CreateSignalFunction(false)
	local v1 = nil
	local v2 = ""
	local Flag = true
	local OnSaved = nil
	local Flag1 = false
	local Count = 0
	
	local function _()
		-- upvalues: Count (ref), v1 (ref), v2 (ref), Flag (ref), OnSaved (ref), Flag1 (ref), Signal2 (copy), Signal2_1 (copy), Signal2_2 (copy), Signal2_3 (copy), Signal2_4 (copy)
		Count += 1
		v1 = nil
		v2 = ""
		Flag = true
		OnSaved = nil
		Flag1 = false
		Signal2(nil)
		Signal2_1(nil)
		Signal2_2(nil)
		Signal2_3(nil)
		Signal2_4(false)
	end
	
	local _ = function(InvalidName)
		-- upvalues: SaveOutfitFailureEnumModule (upval), Flag (ref)
		return if InvalidName == SaveOutfitFailureEnumModule.InvalidName then Flag else InvalidName == SaveOutfitFailureEnumModule.SaveInProgress
	end
	
	local _ = function(): boolean
		-- upvalues: Flag1 (ref), p1 (copy), Signal2_1 (copy), Signal2 (copy), SaveAvatarFlowStepEnumModule (upval)
		if Flag1 then
			return false
		end
		local WornOutfit = p1.wornOutfitStore.getWornOutfit(false)
		
		if WornOutfit == nil then
			return false
		else
			Signal2_1(WornOutfit.itemName or "")
			Signal2(SaveAvatarFlowStepEnumModule.DuplicateNotice)
			
			return true
		end
	end
	
	local function save()
		-- upvalues: v1 (ref), Count (ref), Signal2_3 (copy), Signal2_4 (copy), Signal2 (copy), SaveAvatarFlowStepEnumModule (upval), p1 (copy), v2 (ref), OnSaved (ref), Flag (ref), Flag1 (ref), Signal2_1 (copy), Signal2_2 (copy), SaveOutfitFailureEnumModule (upval)
		local v3 = v1
		
		if v3 ~= nil then
			local Count1 = Count
			Signal2_3(nil)
			Signal2_4(false)
			Signal2(SaveAvatarFlowStepEnumModule.Saving)
			p1.outfitSaverStore.saveAvatarAsOutfit(v3, v2):andThen(function(Result)
				-- upvalues: Count (upval), Count1 (copy), OnSaved (upval), v1 (upval), v2 (upval), Flag (upval), Flag1 (upval), Signal2 (upval), Signal2_1 (upval), Signal2_2 (upval), Signal2_3 (upval), Signal2_4 (upval), SaveOutfitFailureEnumModule (upval), SaveAvatarFlowStepEnumModule (upval)
				if Count ~= Count1 then return end
				if Result.success then
					local Callback: () -> () = OnSaved
					Count += 1
					v1 = nil
					v2 = ""
					Flag = true
					OnSaved = nil
					Flag1 = false
					Signal2(nil)
					Signal2_1(nil)
					Signal2_2(nil)
					Signal2_3(nil)
					Signal2_4(false)
					
					if Callback then
						Callback()
						
						return
					end
				else
					local Failure = Result.failure or SaveOutfitFailureEnumModule.Other
					Signal2_3(Failure)
					Signal2_4(if Failure == SaveOutfitFailureEnumModule.InvalidName then Flag else Failure == SaveOutfitFailureEnumModule.SaveInProgress)
					Signal2(SaveAvatarFlowStepEnumModule.SaveFailed)
				end
			end):catch(function(Err)
				-- upvalues: Count (upval), Count1 (copy), Signal2_3 (upval), SaveOutfitFailureEnumModule (upval), Signal2_4 (upval), Signal2 (upval), SaveAvatarFlowStepEnumModule (upval)
				if Count == Count1 then
					warn("createSaveAvatarFlowStore: saving the avatar failed:", Err)
					Signal2_3(SaveOutfitFailureEnumModule.Other)
					Signal2_4(false)
					Signal2(SaveAvatarFlowStepEnumModule.SaveFailed)
					
					return
				end
			end)
			
			return
		end
	end
	
	return {
		getStep = Signal,
		getDuplicateOutfitName = Signal1,
		getDefaultName = Signal3,
		getSaveFailure = Signal4,
		getCanRetry = Signal5,
		start = function(p2)
			-- upvalues: Signal (copy), SaveAvatarFlowStepEnumModule (upval), Count (ref), v1 (ref), v2 (ref), Flag (ref), OnSaved (ref), Flag1 (ref), Signal2 (copy), Signal2_1 (copy), Signal2_2 (copy), Signal2_3 (copy), Signal2_4 (copy), p1 (copy)
			local SignalResult = Signal(false)
			
			if SignalResult ~= nil and SignalResult ~= SaveAvatarFlowStepEnumModule.SaveFailed then return end
			Count += 1
			v1 = nil
			v2 = ""
			Flag = true
			OnSaved = nil
			Flag1 = false
			Signal2(nil)
			Signal2_1(nil)
			Signal2_2(nil)
			Signal2_3(nil)
			Signal2_4(false)
			OnSaved = if p2 then p2.onSaved else nil
			local Flag2 = nil
			
			if Flag1 then
				Flag2 = false
			else
				local WornOutfit = p1.wornOutfitStore.getWornOutfit(false)
				
				if WornOutfit == nil then
					Flag2 = false
				else
					Signal2_1(WornOutfit.itemName or "")
					Signal2(SaveAvatarFlowStepEnumModule.DuplicateNotice)
					Flag2 = true
				end
			end
			if not Flag2 then
				Signal2(SaveAvatarFlowStepEnumModule.AddAvatar)
			end
		end,
		confirmDuplicate = function()
			-- upvalues: Signal (copy), SaveAvatarFlowStepEnumModule (upval), Flag1 (ref), Signal2 (copy)
			if Signal(false) == SaveAvatarFlowStepEnumModule.DuplicateNotice then
				Flag1 = true
				Signal2(SaveAvatarFlowStepEnumModule.AddAvatar)
			end
		end,
		confirmAvatar = function(p2, p3)
			-- upvalues: Signal (copy), SaveAvatarFlowStepEnumModule (upval), Flag1 (ref), p1 (copy), Signal2_1 (copy), Signal2 (copy), v1 (ref), Flag (ref), v2 (ref), save (copy)
			if Signal(false) ~= SaveAvatarFlowStepEnumModule.AddAvatar then return end
			local Flag2 = nil
			if Flag1 then
				Flag2 = false
			else
				local WornOutfit = p1.wornOutfitStore.getWornOutfit(false)
				
				if WornOutfit == nil then
					Flag2 = false
				else
					Signal2_1(WornOutfit.itemName or "")
					Signal2(SaveAvatarFlowStepEnumModule.DuplicateNotice)
					Flag2 = true
				end
			end
			if Flag2 then return end
			v1 = p2
			Flag = p3
			
			if Flag then
				Signal2(SaveAvatarFlowStepEnumModule.NameAvatar)
				
				return
			else
				v2 = ""
				save()
			end
		end,
		confirmName = function(p2)
			-- upvalues: Signal (copy), SaveAvatarFlowStepEnumModule (upval), v2 (ref), save (copy)
			if Signal(false) == SaveAvatarFlowStepEnumModule.NameAvatar then
				v2 = p2
				save()
				
				return
			end
		end,
		retry = function()
			-- upvalues: Signal (copy), SaveAvatarFlowStepEnumModule (upval), Signal5 (copy), Signal4 (copy), SaveOutfitFailureEnumModule (upval), Signal2_3 (copy), Signal2_4 (copy), Signal2_2 (copy), v2 (ref), Signal2 (copy), save (copy)
			if Signal(false) ~= SaveAvatarFlowStepEnumModule.SaveFailed or not Signal5(false) then return end
			if Signal4(false) == SaveOutfitFailureEnumModule.InvalidName then
				Signal2_3(nil)
				Signal2_4(false)
				Signal2_2(v2)
				Signal2(SaveAvatarFlowStepEnumModule.NameAvatar)
				
				return
			else
				save()
			end
		end,
		cancel = function()
			-- upvalues: Signal (copy), Count (ref), v1 (ref), v2 (ref), Flag (ref), OnSaved (ref), Flag1 (ref), Signal2 (copy), Signal2_1 (copy), Signal2_2 (copy), Signal2_3 (copy), Signal2_4 (copy)
			if Signal(false) ~= nil then
				Count += 1
				v1 = nil
				v2 = ""
				Flag = true
				OnSaved = nil
				Flag1 = false
				Signal2(nil)
				Signal2_1(nil)
				Signal2_2(nil)
				Signal2_3(nil)
				Signal2_4(false)
			end
		end,
		dismissFailure = function()
			-- upvalues: Signal (copy), SaveAvatarFlowStepEnumModule (upval), Count (ref), v1 (ref), v2 (ref), Flag (ref), OnSaved (ref), Flag1 (ref), Signal2 (copy), Signal2_1 (copy), Signal2_2 (copy), Signal2_3 (copy), Signal2_4 (copy)
			if Signal(false) == SaveAvatarFlowStepEnumModule.SaveFailed then
				Count += 1
				v1 = nil
				v2 = ""
				Flag = true
				OnSaved = nil
				Flag1 = false
				Signal2(nil)
				Signal2_1(nil)
				Signal2_2(nil)
				Signal2_3(nil)
				Signal2_4(false)
			end
		end
	}
end