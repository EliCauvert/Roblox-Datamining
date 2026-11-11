local Players = game:GetService("Players")
local ScheduleFallbackModule = require(script.Parent.scheduleFallback)
local ShopDebugLoggerModule = require(script.Parent.ShopDebugLogger)
local FIntShopFetchOnGameJoinFallbackDelayMsModuleRatio = require(script:FindFirstAncestor("InExperienceShop").Flags.FIntShopFetchOnGameJoinFallbackDelayMs) / 1000

return function(Callback)
	-- upvalues: ShopDebugLoggerModule (copy), Players (copy), FIntShopFetchOnGameJoinFallbackDelayMsModuleRatio (copy), ScheduleFallbackModule (copy)
	local Flag = false
	
	local function _(p1)
		-- upvalues: Flag (ref), ShopDebugLoggerModule (upval), Callback (copy)
		if not Flag then
			Flag = true
			ShopDebugLoggerModule.logLazy(function(): string
				-- upvalues: p1 (copy)
				return "whenJoinSettles: settled path=" .. p1
			end)
			Callback(p1)
			
			return
		end
	end
	
	task.spawn(function()
		-- upvalues: Players (upval), Flag (ref), ShopDebugLoggerModule (upval), Callback (copy)
		xpcall(function()
			-- upvalues: Players (upval), Flag (upval), ShopDebugLoggerModule (upval), Callback (upval)
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
					ShopDebugLoggerModule.logLazy(function(): string
						-- upvalues: v1 (copy)
						return "whenJoinSettles: settled path=" .. v1
					end)
					Callback("primary")
					
					return
				end
				return
			elseif not Flag then
				LocalPlayer.CharacterAppearanceLoaded:Once(function()
					-- upvalues: Flag (upval), ShopDebugLoggerModule (upval), Callback (upval)
					if not Flag then
						Flag = true
						local v2 = "primary"
						ShopDebugLoggerModule.logLazy(function(): string
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
		end, function(Err)
			warn("[InExperienceShop] whenJoinSettles path 1 errored: " .. tostring(Err))
		end)
	end)
	ShopDebugLoggerModule.logLazy(function(): string
		-- upvalues: FIntShopFetchOnGameJoinFallbackDelayMsModuleRatio (upval)
		return "whenJoinSettles: scheduled fallback delaySeconds=" .. FIntShopFetchOnGameJoinFallbackDelayMsModuleRatio
	end)
	ScheduleFallbackModule(FIntShopFetchOnGameJoinFallbackDelayMsModuleRatio, function()
		-- upvalues: Flag (ref), ShopDebugLoggerModule (upval), Callback (copy)
		if not Flag then
			Flag = true
			local v1 = "fallback"
			ShopDebugLoggerModule.logLazy(function(): string
				-- upvalues: v1 (copy)
				return "whenJoinSettles: settled path=" .. v1
			end)
			Callback("fallback")
			
			return
		end
	end)
end