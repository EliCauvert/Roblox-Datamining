local GetPlaytestLoadingStoreModule = require(script:FindFirstAncestor("BuildExperience").Stores.GetPlaytestLoadingStore)
local PlaytestExperienceModule = require(script.Parent.playtestExperience)
local ReleaseAnyFocusModule = require(script.Parent.releaseAnyFocus)

return function(p1, p2, IsTeamTest)
	-- upvalues: GetPlaytestLoadingStoreModule (copy), ReleaseAnyFocusModule (copy), PlaytestExperienceModule (copy)
	local PlaytestLoadingStoreModule = GetPlaytestLoadingStoreModule()
	
	if not PlaytestLoadingStoreModule.getIsPlaytestLoadingForPlaceId(p1)() then
		PlaytestLoadingStoreModule.setPlaytestStatusForPlaceId(p1, "Loading")
		task.defer(function()
			-- upvalues: ReleaseAnyFocusModule (upval), PlaytestExperienceModule (upval), p1 (copy), p2 (copy), IsTeamTest (copy), PlaytestLoadingStoreModule (copy)
			local Traceback = nil
			local v1 = "experience_launch"
			
			if not xpcall(function()
				-- upvalues: ReleaseAnyFocusModule (upval), v1 (ref), PlaytestExperienceModule (upval), p1 (upval), p2 (upval), IsTeamTest (upval), PlaytestLoadingStoreModule (upval)
				ReleaseAnyFocusModule()
				v1 = PlaytestExperienceModule(p1, p2, {
					isTeamTest = IsTeamTest,
					onTeleportFailed = function()
						-- upvalues: PlaytestLoadingStoreModule (upval), p1 (upval)
						PlaytestLoadingStoreModule.setPlaytestStatusForPlaceId(p1, "Idle")
					end
				})
			end, function(Err)
				-- upvalues: Traceback (ref)
				Traceback = debug.traceback(tostring(Err), 2)
			end) then
				PlaytestLoadingStoreModule.setPlaytestStatusForPlaceId(p1, "Idle")
				error(Traceback or "Failed to launch playtest", 0)
			end
			if v1 ~= "teleport_pending" then
				PlaytestLoadingStoreModule.setPlaytestStatusForPlaceId(p1, "Completed")
				
				return
			end
		end)
		
		return
	end
end