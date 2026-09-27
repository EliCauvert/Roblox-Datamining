local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local parent = avatarExperienceCommon.Parent
local _ = require(parent.Signals)
local createSessionScopedSignal = require(parent.SignalsUtils).createSessionScopedSignal
local getCurrentlyWearingSavedOutfitIdModule = require(avatarExperienceCommon.Requests.getCurrentlyWearingSavedOutfitId)

return function()
	-- upvalues: createSessionScopedSignal (ref), getCurrentlyWearingSavedOutfitIdModule (ref)
	local var1, var2 = createSessionScopedSignal(nil)
	local var3 = 0
	
	local function _(p1)
		-- upvalues: var1 (ref), var2 (ref)
		if var1(false) == nil then
			var2(p1 or "")
		end
	end
	
	local _ = function(p1, p2)
		-- upvalues: var3 (write), var1 (ref), var2 (ref)
		if p1 == var3 and var1(false) == nil then
			var2(p2 or "")
		end
	end
	
	return {
		getLastEquippedAvatarOutfitId = var1,
		setLastEquippedAvatarOutfitId = var2,
		fetchCurrentlyWearingSavedOutfitId = function()
			-- upvalues: var1 (ref), var3 (write), getCurrentlyWearingSavedOutfitIdModule (copy), var2 (ref)
			if var1(false) == nil then
				var3 += 1
				local var4 = var3
				getCurrentlyWearingSavedOutfitIdModule():andThen(function(p1)
					-- upvalues: var4 (ref), var3 (copy), var1 (copy), var2 (copy)
					if var4 == var3 and var1(false) == nil then
						var2(p1 or "")
					end
				end, function()
					-- upvalues: var4 (ref), var3 (copy), var1 (copy), var2 (copy)
					if var4 == var3 and var1(false) == nil then
						var2("")
					end
				end)
				
				return
			end
		end
	}
end