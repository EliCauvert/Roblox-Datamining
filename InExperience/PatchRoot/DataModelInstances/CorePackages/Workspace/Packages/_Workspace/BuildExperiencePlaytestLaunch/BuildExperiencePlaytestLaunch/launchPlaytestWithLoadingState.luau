local GetPlaytestLoadingStoreModule = require(script:FindFirstAncestor("BuildExperiencePlaytestLaunch").GetPlaytestLoadingStore)
local PlaytestExperienceModule = require(script.Parent.playtestExperience)
local ReleaseAnyFocusModule = require(script.Parent.releaseAnyFocus)

return function(p1, p2, IsTeamTest, Callback, IsEarlyTesting): boolean
	-- upvalues: GetPlaytestLoadingStoreModule (copy), ReleaseAnyFocusModule (copy), PlaytestExperienceModule (copy)
	local PlaytestLoadingStoreModule = GetPlaytestLoadingStoreModule()
	
	if PlaytestLoadingStoreModule.getIsPlaytestLoadingForPlaceId(p1)() then
		return false
	else
		PlaytestLoadingStoreModule.setPlaytestStatusForPlaceId(p1, "Loading")
		task.defer(function()
			-- upvalues: ReleaseAnyFocusModule (upval), PlaytestExperienceModule (upval), p1 (copy), p2 (copy), IsTeamTest (copy), IsEarlyTesting (copy), PlaytestLoadingStoreModule (copy), Callback (copy)
			local Traceback = nil
			local v1 = "experience_launch"
			
			if not xpcall(function()
				-- upvalues: ReleaseAnyFocusModule (upval), v1 (ref), PlaytestExperienceModule (upval), p1 (upval), p2 (upval), IsTeamTest (upval), IsEarlyTesting (upval), PlaytestLoadingStoreModule (upval), Callback (upval)
				ReleaseAnyFocusModule()
				v1 = PlaytestExperienceModule(p1, p2, {
					isTeamTest = IsTeamTest,
					isEarlyTesting = IsEarlyTesting,
					onTeleportFailed = function()
						-- upvalues: PlaytestLoadingStoreModule (upval), p1 (upval), Callback (upval)
						PlaytestLoadingStoreModule.setPlaytestStatusForPlaceId(p1, "Idle")
						
						if Callback ~= nil then
							Callback()
						end
					end
				})
			end, function(Err)
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