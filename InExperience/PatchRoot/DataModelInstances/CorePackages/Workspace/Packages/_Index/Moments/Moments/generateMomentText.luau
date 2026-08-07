local parent = script:FindFirstAncestor("Moments").Parent
local promiseModule = require(parent.Promise)
local isStudioModule = require(parent.MomentsCommon.isStudio)
local t = {}

local function log(p0, ...) --[[ line: 48 ]]
	print(`[moments-gen] {string.format(p0, ...)}`)
end

local function _() --[[ line: 52 | named "mockResult" ]]
	return {
		summary = "insane save",
		description = "no way i pulled this off \226\128\148 clutch save on the last second, everyone was screaming lol",
		error = nil
	}
end

local function captureKey(p1) --[[ line: 60 ]]
	local var5 = nil
	pcall(function() --[[ line: 62 ]]
		-- upvalues: var5 (write), p1 (ref)
		var5 = p1.LocalId
	end)
	
	return if var5 == nil then if typeof(p1) == "table" and p1.assetId ~= nil then `asset:{p1.assetId}` else `capture:{tostring(p1)}` else `local:{var5}`
end

local _ = function(p2) --[[ line: 77 | named "resultName" ]]
	if p2 == nil then
		return nil
	end
	local ok, status = pcall(function() --[[ line: 81 ]]
		-- upvalues: p2 (ref)
		return p2.Name
	end)
	
	return if ok and typeof(status) == "string" then status else nil
end

local _ = function(p3, p4, p5) --[[ line: 90 | named "runGeneration" ]]
	-- upvalues: promiseModule (ref), log (ref), isStudioModule (ref)
	local captureService = p5.captureService or game:GetService("CaptureService")
	local pollIntervalSeconds = p5.pollIntervalSeconds or 1
	local maxPollAttempts = p5.maxPollAttempts or 30
	
	return promiseModule.new(function(p6) --[[ line: 95 ]]
		-- upvalues: captureService (ref), p3 (ref), log (copy), p4 (ref), isStudioModule (copy), maxPollAttempts (ref), pollIntervalSeconds (ref)
		task.spawn(function() --[[ line: 96 ]]
			-- upvalues: captureService (copy), p3 (copy), log (copy), p4 (copy), isStudioModule (copy), p6 (ref), maxPollAttempts (copy), pollIntervalSeconds (copy)
			local ok, status, var9 = pcall(function() --[[ line: 97 ]]
				-- upvalues: captureService (copy), p3 (copy)
				return captureService:GenerateMomentTextAsync(p3)
			end)
			
			if ok then
				local var10
				if status == nil then
					var10 = nil
				else
					local ok_1, status_1 = pcall(function() --[[ line: 81 ]]
						-- upvalues: status (ref)
						return status.Name
					end)
					var10 = if ok_1 and typeof(status_1) == "string" then status_1 else nil
				end
				if var10 == "Success" and typeof(var9) == "string" and #var9 ~= 0 then
					log("generation started for %s \226\134\146 token=%s, polling", p4, var9)
					
					for _ = 1, maxPollAttempts do
						local var13
						task.wait(pollIntervalSeconds)
						local ok_1, status_1, var11, var12 = pcall(function() --[[ line: 118 ]]
							-- upvalues: captureService (copy), var9 (ref)
							return captureService:CheckMomentTextStatusAsync(var9)
						end)
						
						if not ok_1 then
							continue
						end
						if status_1 == nil then
							var13 = nil
						else
							local ok_2, status_2 = pcall(function() --[[ line: 81 ]]
								-- upvalues: status_1 (ref)
								return status_1.Name
							end)
							var13 = if ok_2 and typeof(status_2) == "string" then status_2 else nil
						end
						if var13 ~= "Success" then
							if var13 ~= "Failed" then
								continue
							end
							log("generation failed for %s", p4)
							p6({ error = "GENERATION_FAILED" })
							
							return
						end
						log("generation complete for %s", p4)
						p6({ summary = var11, description = var12 })
						
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

return function(p7, p8) --[[ line: 144 | named "generateMomentText" ]]
	-- upvalues: log (ref), isStudioModule (ref), promiseModule (ref), captureKey (ref), t (ref)
	p8 = p8 or {}
	
	if (p8.isEngineEnabled or function() --[[ line: 147 ]]
		return game:GetEngineFeature("CaptureServiceGenerateMomentText")
	end)() then
		local var15 = captureKey(p7)
		
		if t[var15] == nil then
			local captureService = p8.captureService or game:GetService("CaptureService")
			local pollIntervalSeconds = p8.pollIntervalSeconds or 1
			local maxPollAttempts = p8.maxPollAttempts or 30
			local var19 = promiseModule.new(function(p9) --[[ line: 95 ]]
				-- upvalues: captureService (ref), p7 (ref), log (copy), var15 (ref), isStudioModule (copy), maxPollAttempts (ref), pollIntervalSeconds (ref)
				task.spawn(function() --[[ line: 96 ]]
					-- upvalues: captureService (copy), p7 (copy), log (copy), var15 (copy), isStudioModule (copy), p9 (ref), maxPollAttempts (copy), pollIntervalSeconds (copy)
					local ok, status, var20 = pcall(function() --[[ line: 97 ]]
						-- upvalues: captureService (copy), p7 (copy)
						return captureService:GenerateMomentTextAsync(p7)
					end)
					
					if ok then
						local var10
						if status == nil then
							var10 = nil
						else
							local ok_1, status_1 = pcall(function() --[[ line: 81 ]]
								-- upvalues: status (ref)
								return status.Name
							end)
							var10 = if ok_1 and typeof(status_1) == "string" then status_1 else nil
						end
						if var10 == "Success" and typeof(var20) == "string" and #var20 ~= 0 then
							log("generation started for %s \226\134\146 token=%s, polling", var15, var20)
							
							for _ = 1, maxPollAttempts do
								local var13
								task.wait(pollIntervalSeconds)
								local ok_1, status_1, var21, var22 = pcall(function() --[[ line: 118 ]]
									-- upvalues: captureService (copy), var20 (ref)
									return captureService:CheckMomentTextStatusAsync(var20)
								end)
								
								if not ok_1 then
									continue
									continue
								end
								if status_1 == nil then
									var13 = nil
								else
									local ok_2, status_2 = pcall(function() --[[ line: 81 ]]
										-- upvalues: status_1 (ref)
										return status_1.Name
									end)
									var13 = if ok_2 and typeof(status_2) == "string" then status_2 else nil
								end
								if var13 ~= "Success" then
									if var13 ~= "Failed" then
										continue
										continue
									end
									log("generation failed for %s", var15)
									p9({ error = "GENERATION_FAILED" })
									
									return
								end
								log("generation complete for %s", var15)
								p9({ summary = var21, description = var22 })
								
								return
							end
							log("generation timed out for %s", var15)
							p9({ error = "TIMEOUT" })
							
							return
						else
							log("generation start failed for %s", var15)
							
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
			t[var15] = var19
			var19:andThen(function(p10) --[[ line: 171 ]]
				-- upvalues: t (copy), var15 (ref)
				if p10 == nil or p10.error ~= nil then
					t[var15] = nil
				end
			end, function() --[[ line: 175 ]]
				-- upvalues: t (copy), var15 (ref)
				t[var15] = nil
			end)
			
			return var19
		end
		log("reusing cached generation for %s (no re-send)", var15)
		
		return t[var15]
	else
		log("engine feature %s unavailable", "CaptureServiceGenerateMomentText")
		
		return if isStudioModule() then promiseModule.resolve({
			summary = "insane save",
			description = "no way i pulled this off \226\128\148 clutch save on the last second, everyone was screaming lol",
			error = nil
		}) else promiseModule.resolve({ error = "ENGINE_UNSUPPORTED" })
	end
end