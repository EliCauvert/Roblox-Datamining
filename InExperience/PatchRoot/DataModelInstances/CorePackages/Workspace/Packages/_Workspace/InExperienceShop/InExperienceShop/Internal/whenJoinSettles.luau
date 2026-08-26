local playersService = game:GetService("Players")
local fIntShopFetchOnGameJoinFallbackDelayMsModule = require(script:FindFirstAncestor("InExperienceShop").Flags.FIntShopFetchOnGameJoinFallbackDelayMs)
local scheduleFallbackModule = require(script.Parent.scheduleFallback)
local shopDebugLoggerModule = require(script.Parent.ShopDebugLogger)
local var1 = fIntShopFetchOnGameJoinFallbackDelayMsModule / 1000

return function(value)
	-- upvalues: shopDebugLoggerModule (ref), playersService (ref), var1 (ref), scheduleFallbackModule (ref)
	local var2 = false
	
	local function _(p1)
		-- upvalues: var2 (write), shopDebugLoggerModule (copy), value (ref)
		if var2 then
			return
		end
		var2 = true
		shopDebugLoggerModule.logLazy(function()
			-- upvalues: p1 (ref)
			return "whenJoinSettles: settled path=" .. p0
		end)
		value(p1)
	end
	
	task.spawn(function()
		-- upvalues: playersService (copy), var2 (write), shopDebugLoggerModule (copy), value (ref)
		xpcall(function()
			-- upvalues: playersService (copy), var2 (copy), shopDebugLoggerModule (copy), value (copy)
			while not playersService.LocalPlayer do
				playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
				
				if var2 then return end
			end
			local localPlayer = playersService.LocalPlayer
			assert(localPlayer ~= nil, "LocalPlayer must be non-nil after the wait loop")
			
			if localPlayer.Character and localPlayer:HasAppearanceLoaded() then
				if var2 then
					return
				end
				var2 = true
				local var3 = "primary"
				shopDebugLoggerModule.logLazy(function()
					-- upvalues: var3 (ref)
					return "whenJoinSettles: settled path=" .. var6
				end)
				value("primary")
				
				return
			elseif var2 then
				return
			end
			localPlayer.CharacterAppearanceLoaded:Once(function()
				-- upvalues: var2 (copy), shopDebugLoggerModule (copy), value (copy)
				if var2 then
					return
				end
				var2 = true
				local var4 = "primary"
				shopDebugLoggerModule.logLazy(function()
					-- upvalues: var4 (ref)
					return "whenJoinSettles: settled path=" .. var7
				end)
				value("primary")
			end)
		end, function(p1)
			warn("[InExperienceShop] whenJoinSettles path 1 errored: " .. tostring(p1))
		end)
	end)
	shopDebugLoggerModule.logLazy(function()
		-- upvalues: var1 (copy)
		return "whenJoinSettles: scheduled fallback delaySeconds=" .. var4
	end)
	scheduleFallbackModule(var1, function()
		-- upvalues: var2 (write), shopDebugLoggerModule (copy), value (ref)
		if var2 then
			return
		end
		var2 = true
		local var3 = "fallback"
		shopDebugLoggerModule.logLazy(function()
			-- upvalues: var3 (ref)
			return "whenJoinSettles: settled path=" .. var8
		end)
		value("fallback")
	end)
end