local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local signalsModule = require(momentsCreation.Parent.Signals)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local getFFlagMomentsCreationAccurateDirtyTrackingModule = require(momentsCreation.Flags.GetFFlagMomentsCreationAccurateDirtyTracking)
local createSignal = signalsModule.createSignal

local function draftsEqual(p1, p2)
	if p1 == p2 then
		return true
	elseif type(p1) ~= "table" or type(p2) ~= "table" then
		return false
	end
	for i, v in p1 do
		if p2[i] ~= v then
			return false
		end
	end
	for i, v in p2 do
		if p1[i] ~= v then
			return false
		end
	end
	return true
end

return function()
	-- upvalues: createSignal (ref), getFFlagMomentsCreationAccurateDirtyTrackingModule (ref), draftsEqual (ref)
	local var1, var2 = createSignal(nil)
	local var3, var4 = createSignal(false)
	local var5 = nil
	
	return {
		getDraft = var1,
		getIsDirty = var3,
		begin = function(p3)
			-- upvalues: var5 (write), var2 (ref), var4 (ref)
			var5 = p3
			var2(p3)
			var4(false)
		end,
		update = function(p3)
			-- upvalues: var2 (ref), getFFlagMomentsCreationAccurateDirtyTrackingModule (copy), var4 (ref), draftsEqual (copy), var5 (write)
			var2(p3)
			
			if getFFlagMomentsCreationAccurateDirtyTrackingModule then
				var4(not draftsEqual(p3, var5))
				
				return
			end
			var4(true)
		end,
		commit = function()
			-- upvalues: var1 (ref), var5 (write), var4 (ref)
			local var6 = var1(false)
			var5 = var6
			var4(false)
			
			return var6
		end,
		discard = function()
			-- upvalues: var2 (ref), var5 (write), var4 (ref)
			var2(var5)
			var4(false)
		end
	}
end