local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local promiseModule = require(parent.Promise)
local isStudioModule = require(parent.MomentsCommon.isStudio)
local getFFlagMomentTextGenerationDisableCacheModule = require(moments.Flags.GetFFlagMomentTextGenerationDisableCache)
local t = {}

local function log(p0, ...) --[[ line: 50 ]]
	print(`[moments-gen] {string.format(p0, ...)}`)
end

local function _() --[[ line: 54 | named "mockResult" ]]
	return {
		summary = "insane save",
		description = "no way i pulled this off \226\128\148 clutch save on the last second, everyone was screaming lol",
		error = nil
	}
end

local function captureKey(p1) --[[ line: 62 ]]
	local var8 = nil
	pcall(function() --[[ line: 64 ]]
		-- upvalues: var8 (write), p1 (ref)
		var8 = p1.LocalId
	end)
	
	return if var8 == nil then if typeof(p1) == "table" and p1.assetId ~= nil then `asset:{p1.assetId}` else `capture:{tostring(p1)}` else `local:{var8}`
end

local _ = function(p2) --[[ line: 79 | named "resultName" ]]
	if p2 == nil then
		return nil
	end
	local ok, status = pcall(function() --[[ line: 83 ]]
		-- upvalues: p2 (ref)
		return p2.Name
	end)
	
	return if ok and typeof(status) == "string" then status else nil
end

local function runGeneration(p3, p4, p5) --[[ line: 92 ]]
	-- upvalues: promiseModule (ref), log (ref), isStudioModule (ref)
	local captureService = p5.captureService or game:GetService("CaptureService")
	local pollIntervalSeconds = p5.pollIntervalSeconds or 1
	local maxPollAttempts = p5.maxPollAttempts or 30
	
	return promiseModule.new(function(p6) --[[ line: 97 ]]
		-- upvalues: captureService (ref), p3 (ref), log (copy), p4 (ref), isStudioModule (copy), maxPollAttempts (ref), pollIntervalSeconds (ref)
		task.spawn(function() --[[ line: 98 ]]
			-- upvalues: captureService (copy), p3 (copy), log (copy), p4 (copy), isStudioModule (copy), p6 (ref), maxPollAttempts (copy), pollIntervalSeconds (copy)
			local ok, status, var12 = pcall(function() --[[ line: 99 ]]
				-- upvalues: captureService (copy), p3 (copy)
				return captureService:GenerateMomentTextAsync(p3)
			end)
			
			if ok then
				local var13
				if status == nil then
					var13 = nil
				else
					local ok_1, status_1 = pcall(function() --[[ line: 83 ]]
						-- upvalues: status (ref)
						return status.Name
					end)
					var13 = if ok_1 and typeof(status_1) == "string" then status_1 else nil
				end
				if var13 == "Success" and typeof(var12) == "string" and #var12 ~= 0 then
					log("generation started for %s \226\134\146 token=%s, polling", p4, var12)
					
					for _ = 1, maxPollAttempts do
						local var16
						task.wait(pollIntervalSeconds)
						local ok_1, status_1, var14, var15 = pcall(function() --[[ line: 120 ]]
							-- upvalues: captureService (copy), var12 (ref)
							return captureService:CheckMomentTextStatusAsync(var12)
						end)
						
						if not ok_1 then
							continue
						end
						if status_1 == nil then
							var16 = nil
						else
							local ok_2, status_2 = pcall(function() --[[ line: 83 ]]
								-- upvalues: status_1 (ref)
								return status_1.Name
							end)
							var16 = if ok_2 and typeof(status_2) == "string" then status_2 else nil
						end
						if var16 ~= "Success" then
							if var16 ~= "Failed" then
								continue
							end
							log("generation failed for %s", p4)
							p6({ error = "GENERATION_FAILED" })
							
							return
						end
						log("generation complete for %s", p4)
						p6({ summary = var14, description = var15 })
						
						return
					end
					log("generation timed out for %s", p4)
					p6({ error = "TIMEOUT" })
					
					return
				else
					log("generation start failed for %s", p4)
					
					if isStudioModule() then
						log("resolving with mock result (Studio, backend unreachable)")
						p6({
							summary = "insane save",
							description = "no way i pulled this off \226\128\148 clutch save on the last second, everyone was screaming lol",
							error = nil
						})
						
						return
					end
					p6({ error = "REQUEST_FAILED" })
				end
			end
		end)
	end)
end

return function(p7, p8) --[[ line: 146 | named "generateMomentText" ]]
	-- upvalues: log (ref), isStudioModule (ref), promiseModule (ref), captureKey (ref), getFFlagMomentTextGenerationDisableCacheModule (ref), runGeneration (ref), t (ref)
	p8 = p8 or {}
	
	if (p8.isEngineEnabled or function() --[[ line: 149 ]]
		return game:GetEngineFeature("CaptureServiceGenerateMomentText")
	end)() then
		local var18 = captureKey(p7)
		
		if getFFlagMomentTextGenerationDisableCacheModule() then
			return runGeneration(p7, var18, p8)
		elseif t[var18] == nil then
			local captureService = p8.captureService or game:GetService("CaptureService")
			local pollIntervalSeconds = p8.pollIntervalSeconds or 1
			local maxPollAttempts = p8.maxPollAttempts or 30
			local var22 = promiseModule.new(function(p9) --[[ line: 97 ]]
				-- upvalues: captureService (ref), p7 (ref), log (copy), var18 (ref), isStudioModule (copy), maxPollAttempts (ref), pollIntervalSeconds (ref)
				task.spawn(function() --[[ line: 98 ]]
					-- upvalues: captureService (copy), p7 (copy), log (copy), var18 (copy), isStudioModule (copy), p9 (ref), maxPollAttempts (copy), pollIntervalSeconds (copy)
					local ok, status, var23 = pcall(function() --[[ line: 99 ]]
						-- upvalues: captureService (copy), p7 (copy)
						return captureService:GenerateMomentTextAsync(p7)
					end)
					
					if ok then
						local var13
						if status == nil then
							var13 = nil
						else
							local ok_1, status_1 = pcall(function() --[[ line: 83 ]]
								-- upvalues: status (ref)
								return status.Name
							end)
							var13 = if ok_1 and typeof(status_1) == "string" then status_1 else nil
						end
						if var13 == "Success" and typeof(var23) == "string" and #var23 ~= 0 then
							log("generation started for %s \226\134\146 token=%s, polling", var18, var23)
							
							for _ = 1, maxPollAttempts do
								local var16
								task.wait(pollIntervalSeconds)
								local ok_1, status_1, var24, var25 = pcall(function() --[[ line: 120 ]]
									-- upvalues: captureService (copy), var23 (ref)
									return captureService:CheckMomentTextStatusAsync(var23)
								end)
								
								if not ok_1 then
									continue
									continue
								end
								if status_1 == nil then
									var16 = nil
								else
									local ok_2, status_2 = pcall(function() --[[ line: 83 ]]
										-- upvalues: status_1 (ref)
										return status_1.Name
									end)
									var16 = if ok_2 and typeof(status_2) == "string" then status_2 else nil
								end
								if var16 ~= "Success" then
									if var16 ~= "Failed" then
										continue
										continue
									end
									log("generation failed for %s", var18)
									p9({ error = "GENERATION_FAILED" })
									
									return
								end
								log("generation complete for %s", var18)
								p9({ summary = var24, description = var25 })
								
								return
							end
							log("generation timed out for %s", var18)
							p9({ error = "TIMEOUT" })
							
							return
						else
							log("generation start failed for %s", var18)
							
							if isStudioModule() then
								log("resolving with mock result (Studio, backend unreachable)")
								p9({
									summary = "insane save",
									description = "no way i pulled this off \226\128\148 clutch save on the last second, everyone was screaming lol",
									error = nil
								})
								
								return
							end
							p9({ error = "REQUEST_FAILED" })
						end
					end
				end)
			end)
			t[var18] = var22
			var22:andThen(function(p10) --[[ line: 179 ]]
				-- upvalues: t (copy), var18 (ref)
				if p10 == nil or p10.error ~= nil then
					t[var18] = nil
				end
			end, function() --[[ line: 183 ]]
				-- upvalues: t (copy), var18 (ref)
				t[var18] = nil
			end)
			
			return var22
		end
		log("reusing cached generation for %s (no re-send)", var18)
		
		return t[var18]
	else
		log("engine feature %s unavailable", "CaptureServiceGenerateMomentText")
		
		return if isStudioModule() then promiseModule.resolve({
			summary = "insane save",
			description = "no way i pulled this off \226\128\148 clutch save on the last second, everyone was screaming lol",
			error = nil
		}) else promiseModule.resolve({ error = "ENGINE_UNSUPPORTED" })
	end
end