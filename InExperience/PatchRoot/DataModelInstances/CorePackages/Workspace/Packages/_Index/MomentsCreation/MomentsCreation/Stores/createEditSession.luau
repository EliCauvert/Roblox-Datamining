local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local signalsModule = require(momentsCreation.Parent.Signals)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local getFFlagMomentsCreationAccurateDirtyTrackingModule = require(momentsCreation.Flags.GetFFlagMomentsCreationAccurateDirtyTracking)
local createSignal = signalsModule.createSignal

local function draftsEqual(p0, p1)
	if p0 == p1 then
		return true
	elseif type(p0) ~= "table" or type(p1) ~= "table" then
		return false
	end
	for i, v in p0 do
		if p1[i] ~= v then
			return false
		end
	end
	for i, v in p1 do
		if p0[i] ~= v then
			return false
		end
	end
	return true
end

return function()
	-- upvalues: createSignal (ref), getFFlagMomentsCreationAccurateDirtyTrackingModule (ref), draftsEqual (ref)
	local var4, var5 = createSignal(nil)
	local var6, var7 = createSignal(false)
	local var8 = nil
	
	return {
		getDraft = var4,
		getIsDirty = var6,
		begin = function(p2)
			-- upvalues: var8 (write), var5 (ref), var7 (ref)
			var8 = p2
			var5(p2)
			var7(false)
		end,
		update = function(p3)
			-- upvalues: var5 (ref), getFFlagMomentsCreationAccurateDirtyTrackingModule (copy), var7 (ref), draftsEqual (copy), var8 (write)
			var5(p3)
			
			if getFFlagMomentsCreationAccurateDirtyTrackingModule then
				var7(not draftsEqual(p3, var8))
				
				return
			end
			var7(true)
		end,
		commit = function()
			-- upvalues: var4 (ref), var8 (write), var7 (ref)
			local var9 = var4(false)
			var8 = var9
			var7(false)
			
			return var9
		end,
		discard = function()
			-- upvalues: var5 (ref), var8 (write), var7 (ref)
			var5(var8)
			var7(false)
		end
	}
end