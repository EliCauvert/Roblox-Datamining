local Players = game:GetService("Players")
local InExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local ScheduleFallbackModule = require(script.Parent.scheduleFallback)
local OffersDebugLoggerModule = require(InExperienceOffers.Internal.OffersDebugLogger)
local FIntOffersPrefetchOnGameJoinFallbackDelayMsModuleRatio = require(InExperienceOffers.Flags.FIntOffersPrefetchOnGameJoinFallbackDelayMs) / 1000

return function(Callback) --[[ Line: 15 | Named "whenJoinSettles" ]]
	-- upvalues: OffersDebugLoggerModule (copy), Players (copy), FIntOffersPrefetchOnGameJoinFallbackDelayMsModuleRatio (copy), ScheduleFallbackModule (copy)
	local Flag = false
	
	local function _(p1) --[[ Line: 17 | Named "fire" ]]
		-- upvalues: Flag (ref), OffersDebugLoggerModule (upval), Callback (copy)
		if not Flag then
			Flag = true
			OffersDebugLoggerModule.logLazy(function(): string --[[ Line: 22 ]]
				-- upvalues: p1 (copy)
				return "whenJoinSettles: settled path=" .. p1
			end)
			Callback(p1)
			
			return
		end
	end
	
	task.spawn(function() --[[ Line: 28 ]]
		-- upvalues: Players (upval), Flag (ref), OffersDebugLoggerModule (upval), Callback (copy)
		xpcall(function() --[[ Line: 30 ]]
			-- upvalues: Players (upval), Flag (upval), OffersDebugLoggerModule (upval), Callback (upval)
			while not Players.LocalPlayer do
				Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
				
				if Flag then return end
			end
			local LocalPlayer = Players.LocalPlayer
			assert(LocalPlayer ~= nil, "LocalPlayer must be non-nil after the wait loop")
			
			if LocalPlayer.Character and LocalPlayer:HasAppearanceLoaded() then
				if not Flag then
					Flag = true
					local v1 = "primary"
					OffersDebugLoggerModule.logLazy(function(): string --[[ Line: 22 ]]
						-- upvalues: v1 (copy)
						return "whenJoinSettles: settled path=" .. v1
					end)
					Callback("primary")
					
					return
				end
				return
			elseif not Flag then
				LocalPlayer.CharacterAppearanceLoaded:Once(function() --[[ Line: 51 ]]
					-- upvalues: Flag (upval), OffersDebugLoggerModule (upval), Callback (upval)
					if not Flag then
						Flag = true
						local v2 = "primary"
						OffersDebugLoggerModule.logLazy(function(): string --[[ Line: 22 ]]
							-- upvalues: v2 (copy)
							return "whenJoinSettles: settled path=" .. v2
						end)
						Callback("primary")
						
						return
					end
				end)
				
				return
			else
			end
		end, function(Err) --[[ Line: 54 ]]
			warn("[InExperienceOffers] whenJoinSettles path 1 errored: " .. tostring(Err))
		end)
	end)
	OffersDebugLoggerModule.logLazy(function(): string --[[ Line: 60 ]]
		-- upvalues: FIntOffersPrefetchOnGameJoinFallbackDelayMsModuleRatio (upval)
		return "whenJoinSettles: scheduled fallback delaySeconds=" .. FIntOffersPrefetchOnGameJoinFallbackDelayMsModuleRatio
	end)
	ScheduleFallbackModule(FIntOffersPrefetchOnGameJoinFallbackDelayMsModuleRatio, function() --[[ Line: 63 ]]
		-- upvalues: Flag (ref), OffersDebugLoggerModule (upval), Callback (copy)
		if not Flag then
			Flag = true
			local v1 = "fallback"
			OffersDebugLoggerModule.logLazy(function(): string --[[ Line: 22 ]]
				-- upvalues: v1 (copy)
				return "whenJoinSettles: settled path=" .. v1
			end)
			Callback("fallback")
			
			return
		end
	end)
end