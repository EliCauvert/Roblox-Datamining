local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local Parent = AvatarExperienceCommon.Parent
local _ = require(Parent.Signals)
local CreateSessionScopedSignalFunction = require(Parent.SignalsUtils).createSessionScopedSignal
local GetCurrentlyWearingSavedOutfitIdModule = require(AvatarExperienceCommon.Requests.getCurrentlyWearingSavedOutfitId)

return function()
	-- upvalues: CreateSessionScopedSignalFunction (copy), GetCurrentlyWearingSavedOutfitIdModule (copy)
	local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignalFunction(nil)
	local Count = 0
	
	local function _(p1)
		-- upvalues: SessionScopedSignal (copy), SessionScopedSignal2 (copy)
		if SessionScopedSignal(false) == nil then
			SessionScopedSignal2(p1 or "")
		end
	end
	
	local _ = function(Count1, p1)
		-- upvalues: Count (ref), SessionScopedSignal (copy), SessionScopedSignal2 (copy)
		if Count1 == Count and SessionScopedSignal(false) == nil then
			SessionScopedSignal2(p1 or "")
		end
	end
	
	return {
		getLastEquippedAvatarOutfitId = SessionScopedSignal,
		setLastEquippedAvatarOutfitId = SessionScopedSignal2,
		fetchCurrentlyWearingSavedOutfitId = function()
			-- upvalues: SessionScopedSignal (copy), Count (ref), GetCurrentlyWearingSavedOutfitIdModule (upval), SessionScopedSignal2 (copy)
			if SessionScopedSignal(false) == nil then
				Count += 1
				local Count1: number = Count
				GetCurrentlyWearingSavedOutfitIdModule():andThen(function(Result)
					-- upvalues: Count1 (copy), Count (upval), SessionScopedSignal (upval), SessionScopedSignal2 (upval)
					if Count1 == Count and SessionScopedSignal(false) == nil then
						SessionScopedSignal2(Result or "")
					end
				end, function()
					-- upvalues: Count1 (copy), Count (upval), SessionScopedSignal (upval), SessionScopedSignal2 (upval)
					if Count1 == Count and SessionScopedSignal(false) == nil then
						SessionScopedSignal2("")
					end
				end)
				
				return
			end
		end
	}
end