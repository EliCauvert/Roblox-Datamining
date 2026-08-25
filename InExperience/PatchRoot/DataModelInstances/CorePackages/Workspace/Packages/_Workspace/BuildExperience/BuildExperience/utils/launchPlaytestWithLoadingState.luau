local getPlaytestLoadingStoreModule = require(script:FindFirstAncestor("BuildExperience").Stores.GetPlaytestLoadingStore)
local playtestExperienceModule = require(script.Parent.playtestExperience)
local releaseAnyFocusModule = require(script.Parent.releaseAnyFocus)

return function(p0, p1, p2, p3)
	-- upvalues: getPlaytestLoadingStoreModule (ref), releaseAnyFocusModule (ref), playtestExperienceModule (ref)
	local var3 = getPlaytestLoadingStoreModule()
	
	if var3.getIsPlaytestLoadingForPlaceId(p0)() then
		return false
	end
	var3.setPlaytestStatusForPlaceId(p0, "Loading")
	task.defer(function()
		-- upvalues: releaseAnyFocusModule (copy), playtestExperienceModule (copy), p0 (ref), p1 (ref), p2 (ref), var3 (ref), p3 (ref)
		local var4 = nil
		local var5 = "experience_launch"
		
		if not xpcall(function()
			-- upvalues: releaseAnyFocusModule (copy), var5 (write), playtestExperienceModule (copy), p0 (copy), p1 (copy), p2 (copy), var3 (copy), p3 (copy)
			releaseAnyFocusModule()
			var5 = playtestExperienceModule(p0, p1, {
				isTeamTest = p2,
				onTeleportFailed = function()
					-- upvalues: var3 (copy), p0 (copy), p3 (copy)
					var3.setPlaytestStatusForPlaceId(p0, "Idle")
					
					if p3 ~= nil then
						p3()
					end
				end
			})
		end, function(p4)
			-- upvalues: var4 (write)
			var4 = debug.traceback(tostring(p4), 2)
		end) then
			var3.setPlaytestStatusForPlaceId(p0, "Idle")
			
			if p3 ~= nil then
				p3()
			end
			error(var4 or "Failed to launch playtest", 0)
		end
		if var5 == "teleport_pending" then
			return
		end
		var3.setPlaytestStatusForPlaceId(p0, "Completed")
	end)
	
	return true
end