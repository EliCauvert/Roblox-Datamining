local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local GetFFlagMomentsCreationAccurateDirtyTrackingModule = require(MomentsCreation.Flags.GetFFlagMomentsCreationAccurateDirtyTracking)
local CreateSignalFunction = require(MomentsCreation.Parent.Signals).createSignal

local function draftsEqual(List, List1): boolean
	if List == List1 then
		return true
	end
	if type(List) ~= "table" or type(List1) ~= "table" then
		return false
	end
	for i, value in List do
		if List1[i] ~= value then
			return false
		end
	end
	for i1, value1 in List1 do
		if List[i1] ~= value1 then
			return false
		end
	end
	return true
end

return function()
	-- upvalues: CreateSignalFunction (copy), GetFFlagMomentsCreationAccurateDirtyTrackingModule (copy), draftsEqual (copy)
	local Signal, Signal2 = CreateSignalFunction(nil)
	local Signal1, Signal2_1 = CreateSignalFunction(false)
	local v1 = nil
	
	return {
		getDraft = Signal,
		getIsDirty = Signal1,
		begin = function(p1)
			-- upvalues: v1 (ref), Signal2 (copy), Signal2_1 (copy)
			v1 = p1
			Signal2(p1)
			Signal2_1(false)
		end,
		update = function(p1)
			-- upvalues: Signal2 (copy), GetFFlagMomentsCreationAccurateDirtyTrackingModule (upval), Signal2_1 (copy), draftsEqual (upval), v1 (ref)
			Signal2(p1)
			
			if GetFFlagMomentsCreationAccurateDirtyTrackingModule then
				Signal2_1(not draftsEqual(p1, v1))
				
				return
			else
				Signal2_1(true)
			end
		end,
		commit = function()
			-- upvalues: Signal (copy), v1 (ref), Signal2_1 (copy)
			local SignalResult = Signal(false)
			v1 = SignalResult
			Signal2_1(false)
			
			return SignalResult
		end,
		discard = function()
			-- upvalues: Signal2 (copy), v1 (ref), Signal2_1 (copy)
			Signal2(v1)
			Signal2_1(false)
		end
	}
end