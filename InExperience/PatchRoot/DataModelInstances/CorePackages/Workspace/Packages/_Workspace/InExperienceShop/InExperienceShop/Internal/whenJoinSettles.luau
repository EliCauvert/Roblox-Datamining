local playersService = game:GetService("Players")
local fIntShopFetchOnGameJoinFallbackDelayMsModule = require(script:FindFirstAncestor("InExperienceShop").Flags.FIntShopFetchOnGameJoinFallbackDelayMs)
local scheduleFallbackModule = require(script.Parent.scheduleFallback)
local shopDebugLoggerModule = require(script.Parent.ShopDebugLogger)
local var4 = fIntShopFetchOnGameJoinFallbackDelayMsModule / 1000

return function(value) --[[ line: 20 | named "whenJoinSettles" ]]
	-- upvalues: shopDebugLoggerModule (ref), playersService (ref), var4 (ref), scheduleFallbackModule (ref)
	local var5 = false
	
	local function _(p0) --[[ line: 22 | named "fire" ]]
		-- upvalues: var5 (write), shopDebugLoggerModule (copy), value (ref)
		if var5 then
			return
		end
		var5 = true
		shopDebugLoggerModule.logLazy(function() --[[ line: 27 ]]
			-- upvalues: p0 (ref)
			return "whenJoinSettles: settled path=" .. p0
		end)
		value(p0)
	end
	
	task.spawn(function() --[[ line: 33 ]]
		-- upvalues: playersService (copy), var5 (write), shopDebugLoggerModule (copy), value (ref)
		xpcall(function() --[[ line: 36 ]]
			-- upvalues: playersService (copy), var5 (copy), shopDebugLoggerModule (copy), value (copy)
			while not playersService.LocalPlayer do
				playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
				
				if var5 then return end
			end
			local localPlayer = playersService.LocalPlayer
			assert(localPlayer ~= nil, "LocalPlayer must be non-nil after the wait loop")
			
			if localPlayer.Character and localPlayer:HasAppearanceLoaded() then
				if var5 then
					return
				end
				var5 = true
				local var6 = "primary"
				shopDebugLoggerModule.logLazy(function() --[[ line: 27 ]]
					-- upvalues: var6 (ref)
					return "whenJoinSettles: settled path=" .. var6
				end)
				value("primary")
				
				return
			elseif var5 then
				return
			end
			localPlayer.CharacterAppearanceLoaded:Once(function() --[[ line: 60 ]]
				-- upvalues: var5 (copy), shopDebugLoggerModule (copy), value (copy)
				if var5 then
					return
				end
				var5 = true
				local var7 = "primary"
				shopDebugLoggerModule.logLazy(function() --[[ line: 27 ]]
					-- upvalues: var7 (ref)
					return "whenJoinSettles: settled path=" .. var7
				end)
				value("primary")
			end)
		end, function(p1) --[[ line: 63 ]]
			warn("[InExperienceShop] whenJoinSettles path 1 errored: " .. tostring(p1))
		end)
	end)
	shopDebugLoggerModule.logLazy(function() --[[ line: 70 ]]
		-- upvalues: var4 (copy)
		return "whenJoinSettles: scheduled fallback delaySeconds=" .. var4
	end)
	scheduleFallbackModule(var4, function() --[[ line: 73 ]]
		-- upvalues: var5 (write), shopDebugLoggerModule (copy), value (ref)
		if var5 then
			return
		end
		var5 = true
		local var8 = "fallback"
		shopDebugLoggerModule.logLazy(function() --[[ line: 27 ]]
			-- upvalues: var8 (ref)
			return "whenJoinSettles: settled path=" .. var8
		end)
		value("fallback")
	end)
end