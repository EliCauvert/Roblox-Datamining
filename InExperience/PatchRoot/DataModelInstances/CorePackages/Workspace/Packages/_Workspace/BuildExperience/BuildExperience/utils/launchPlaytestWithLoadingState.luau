local getPlaytestLoadingStoreModule = require(script:FindFirstAncestor("BuildExperience").Stores.GetPlaytestLoadingStore)
local playtestExperienceModule = require(script.Parent.playtestExperience)
local releaseAnyFocusModule = require(script.Parent.releaseAnyFocus)

return function(p1, p2, p3, p4)
	-- upvalues: getPlaytestLoadingStoreModule (ref), releaseAnyFocusModule (ref), playtestExperienceModule (ref)
	local var1 = getPlaytestLoadingStoreModule()
	
	if var1.getIsPlaytestLoadingForPlaceId(p1)() then
		return false
	end
	var1.setPlaytestStatusForPlaceId(p1, "Loading")
	task.defer(function()
		-- upvalues: releaseAnyFocusModule (copy), playtestExperienceModule (copy), p1 (ref), p2 (ref), p3 (ref), var1 (ref), p4 (ref)
		local var2 = nil
		local var3 = "experience_launch"
		
		if not xpcall(function()
			-- upvalues: releaseAnyFocusModule (copy), var3 (write), playtestExperienceModule (copy), p1 (copy), p2 (copy), p3 (copy), var1 (copy), p4 (copy)
			releaseAnyFocusModule()
			var3 = playtestExperienceModule(p1, p2, {
				isTeamTest = p3,
				onTeleportFailed = function()
					-- upvalues: var1 (copy), p1 (copy), p4 (copy)
					var1.setPlaytestStatusForPlaceId(p1, "Idle")
					
					if p4 ~= nil then
						p4()
					end
				end
			})
		end, function(p5)
			-- upvalues: var2 (write)
			var2 = debug.traceback(tostring(p5), 2)
		end) then
			var1.setPlaytestStatusForPlaceId(p1, "Idle")
			
			if p4 ~= nil then
				p4()
			end
			error(var2 or "Failed to launch playtest", 0)
		end
		if var3 == "teleport_pending" then
			return
		end
		var1.setPlaytestStatusForPlaceId(p1, "Completed")
	end)
	
	return true
end