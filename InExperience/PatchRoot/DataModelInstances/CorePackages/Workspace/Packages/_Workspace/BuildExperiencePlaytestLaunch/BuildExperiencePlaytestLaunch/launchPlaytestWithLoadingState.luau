local GetPlaytestLoadingStoreModule = require(script:FindFirstAncestor("BuildExperiencePlaytestLaunch").GetPlaytestLoadingStore)
local PlaytestExperienceModule = require(script.Parent.playtestExperience)
local ReleaseAnyFocusModule = require(script.Parent.releaseAnyFocus)

return function(p1, p2, IsTeamTest, Callback): boolean --[[ Line: 7 | Named "launchPlaytestWithLoadingState" ]]
	-- upvalues: GetPlaytestLoadingStoreModule (copy), ReleaseAnyFocusModule (copy), PlaytestExperienceModule (copy)
	local PlaytestLoadingStoreModule = GetPlaytestLoadingStoreModule()
	
	if PlaytestLoadingStoreModule.getIsPlaytestLoadingForPlaceId(p1)() then
		return false
	else
		PlaytestLoadingStoreModule.setPlaytestStatusForPlaceId(p1, "Loading")
		task.defer(function() --[[ Line: 21 ]]
			-- upvalues: ReleaseAnyFocusModule (upval), PlaytestExperienceModule (upval), p1 (copy), p2 (copy), IsTeamTest (copy), PlaytestLoadingStoreModule (copy), Callback (copy)
			local Traceback = nil
			local v1 = "experience_launch"
			
			if not xpcall(function() --[[ Line: 24 ]]
				-- upvalues: ReleaseAnyFocusModule (upval), v1 (ref), PlaytestExperienceModule (upval), p1 (upval), p2 (upval), IsTeamTest (upval), PlaytestLoadingStoreModule (upval), Callback (upval)
				ReleaseAnyFocusModule()
				v1 = PlaytestExperienceModule(p1, p2, {
					isTeamTest = IsTeamTest,
					onTeleportFailed = function() --[[ Line: 28 ]]
						-- upvalues: PlaytestLoadingStoreModule (upval), p1 (upval), Callback (upval)
						PlaytestLoadingStoreModule.setPlaytestStatusForPlaceId(p1, "Idle")
						
						if Callback ~= nil then
							Callback()
						end
					end
				})
			end, function(Err) --[[ Line: 35 ]]
				-- upvalues: Traceback (ref)
				Traceback = debug.traceback(tostring(Err), 2)
			end) then
				PlaytestLoadingStoreModule.setPlaytestStatusForPlaceId(p1, "Idle")
				
				if Callback ~= nil then
					Callback()
				end
				error(Traceback or "Failed to launch playtest", 0)
			end
			if v1 ~= "teleport_pending" then
				PlaytestLoadingStoreModule.setPlaytestStatusForPlaceId(p1, "Completed")
				
				return
			end
		end)
		
		return true
	end
end