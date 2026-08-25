local playersService = game:GetService("Players")
local fIntShopFetchOnGameJoinFallbackDelayMsModule = require(script:FindFirstAncestor("InExperienceShop").Flags.FIntShopFetchOnGameJoinFallbackDelayMs)
local scheduleFallbackModule = require(script.Parent.scheduleFallback)
local shopDebugLoggerModule = require(script.Parent.ShopDebugLogger)
local var4 = fIntShopFetchOnGameJoinFallbackDelayMsModule / 1000

return function(value)
	-- upvalues: shopDebugLoggerModule (ref), playersService (ref), var4 (ref), scheduleFallbackModule (ref)
	local var5 = false
	
	local function _(p0)
		-- upvalues: var5 (write), shopDebugLoggerModule (copy), value (ref)
		if var5 then
			return
		end
		var5 = true
		shopDebugLoggerModule.logLazy(function()
			-- upvalues: p0 (ref)
			return "whenJoinSettles: settled path=" .. p0
		end)
		value(p0)
	end
	
	task.spawn(function()
		-- upvalues: playersService (copy), var5 (write), shopDebugLoggerModule (copy), value (ref)
		xpcall(function()
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
				shopDebugLoggerModule.logLazy(function()
					-- upvalues: var6 (ref)
					return "whenJoinSettles: settled path=" .. var6
				end)
				value("primary")
				
				return
			elseif var5 then
				return
			end
			localPlayer.CharacterAppearanceLoaded:Once(function()
				-- upvalues: var5 (copy), shopDebugLoggerModule (copy), value (copy)
				if var5 then
					return
				end
				var5 = true
				local var7 = "primary"
				shopDebugLoggerModule.logLazy(function()
					-- upvalues: var7 (ref)
					return "whenJoinSettles: settled path=" .. var7
				end)
				value("primary")
			end)
		end, function(p1)
			warn("[InExperienceShop] whenJoinSettles path 1 errored: " .. tostring(p1))
		end)
	end)
	shopDebugLoggerModule.logLazy(function()
		-- upvalues: var4 (copy)
		return "whenJoinSettles: scheduled fallback delaySeconds=" .. var4
	end)
	scheduleFallbackModule(var4, function()
		-- upvalues: var5 (write), shopDebugLoggerModule (copy), value (ref)
		if var5 then
			return
		end
		var5 = true
		local var8 = "fallback"
		shopDebugLoggerModule.logLazy(function()
			-- upvalues: var8 (ref)
			return "whenJoinSettles: settled path=" .. var8
		end)
		value("fallback")
	end)
end