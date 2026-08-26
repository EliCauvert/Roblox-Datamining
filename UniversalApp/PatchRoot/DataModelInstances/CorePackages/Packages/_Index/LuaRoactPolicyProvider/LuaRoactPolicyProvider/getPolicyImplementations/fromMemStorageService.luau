local httpService = game:GetService("HttpService")
local memStorageService = game:GetService("MemStorageService")
local playersService = game:GetService("Players")
local fFlagLogFirstGuacRead = game:DefineFastFlag("FFlagLogFirstGuacRead", false)
local fFlagLogAllGuacRead = game:DefineFastFlag("FFlagLogAllGuacRead", false)
local cacheReadParsePolicy = game:DefineFastFlag("CacheReadParsePolicy", false)
local fixPolicyStalePlayerUpdates = game:DefineFastFlag("FixPolicyStalePlayerUpdates", false)
local clearPolicyOnLogout = game:DefineFastFlag("ClearPolicyOnLogout", false)
local _ = nil
local var1 = if fFlagLogFirstGuacRead then require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol).default else nil

return function(p1)
	-- upvalues: httpService (ref), memStorageService (ref), playersService (ref), cacheReadParsePolicy (ref), clearPolicyOnLogout (ref), fixPolicyStalePlayerUpdates (ref), fFlagLogAllGuacRead (ref), var1 (write), fFlagLogFirstGuacRead (ref)
	p1 = p1 or {}
	p1.HttpService = p1.HttpService or httpService
	p1.MemStorageService = p1.MemStorageService or memStorageService
	p1.PlayersService = p1.PlayersService or playersService
	assert(p1.HttpService, "expected dependencies.HttpService")
	assert(p1.MemStorageService, "expected dependencies.MemStorageService")
	assert(p1.PlayersService, "expected dependencies.PlayersService")
	p1 = p1.HttpService
	local memStorageService_1 = p1.MemStorageService
	local playersService_1 = p1.PlayersService
	local var2 = false
	
	return function(p2)
		-- upvalues: playersService_1 (ref), p1 (ref), cacheReadParsePolicy (copy), clearPolicyOnLogout (copy), memStorageService_1 (ref), fixPolicyStalePlayerUpdates (copy), fFlagLogAllGuacRead (copy), var1 (copy), fFlagLogFirstGuacRead (copy), var2 (write)
		assert(p2, "expected behavior")
		
		local function _()
			-- upvalues: playersService_1 (copy), p2 (ref)
			local var3 = -1
			local localPlayer = playersService_1.LocalPlayer
			
			if localPlayer and localPlayer.UserId > 0 then
				var3 = localPlayer.UserId
			end
			return "GUAC:" .. var21 .. ":" .. p1
		end
		
		local text = "GUAC:" .. -1 .. ":" .. p1
		local var3 = nil
		local var4 = nil
		local var5 = nil
		local var6 = nil
		local bindableEvent = Instance.new("BindableEvent")
		
		local function onPolicyUpdated(p3)
			-- upvalues: var5 (write), p1 (copy), var6 (write), bindableEvent (ref)
			if p3 ~= var5 and p3 and #p3 > 0 then
				local ok, status = pcall(function()
					-- upvalues: p1 (copy), p3 (ref)
					return p1:JSONDecode(p3)
				end)
				
				if ok then
					var5 = p3
					var6 = status
					bindableEvent:Fire(status)
				end
			end
		end
		
		if cacheReadParsePolicy then
			local var7 = nil
			
			local function invalidateForKeyChange()
				-- upvalues: clearPolicyOnLogout (copy), var3 (write), var6 (write), var5 (write), var4 (write), playersService_1 (copy), p2 (ref), text (ref), memStorageService_1 (copy), onPolicyUpdated (ref)
				local var8 = if clearPolicyOnLogout then var3 else nil
				var6 = nil
				var5 = nil
				
				if not var4 then
					var3 = nil
					
					return
				end
				var4:Disconnect()
				var4 = nil
				local var9 = -1
				local localPlayer = playersService_1.LocalPlayer
				
				if localPlayer and localPlayer.UserId > 0 then
					var9 = localPlayer.UserId
				end
				local text_1 = "GUAC:" .. var23 .. ":" .. p1
				
				if clearPolicyOnLogout and var8 and (var8 ~= text_1 and text_1 == text) then
					memStorageService_1:RemoveItem(text_1)
				end
				var3 = text_1
				var4 = memStorageService_1:BindAndFire(text_1, onPolicyUpdated)
			end
			
			local function localPlayerChanged()
				-- upvalues: var7 (write), playersService_1 (copy), fixPolicyStalePlayerUpdates (copy), invalidateForKeyChange (ref), var6 (write)
				if var7 then
					var7:Disconnect()
					var7 = nil
				end
				if playersService_1.LocalPlayer then
					var7 = playersService_1.LocalPlayer:GetPropertyChangedSignal("UserId"):Connect(function()
						-- upvalues: fixPolicyStalePlayerUpdates (copy), invalidateForKeyChange (copy), var6 (copy)
						if fixPolicyStalePlayerUpdates then
							invalidateForKeyChange()
							
							return
						end
						var6 = nil
					end)
				end
				if fixPolicyStalePlayerUpdates then
					invalidateForKeyChange()
					
					return
				end
				var6 = nil
			end
			
			playersService_1:GetPropertyChangedSignal("LocalPlayer"):Connect(localPlayerChanged)
			localPlayerChanged()
		end
		return {
			read = function()
				-- upvalues: cacheReadParsePolicy (copy), var6 (write), playersService_1 (copy), p2 (ref), memStorageService_1 (copy), p1 (copy), fFlagLogAllGuacRead (copy), var1 (copy), fFlagLogFirstGuacRead (copy), var2 (copy), var5 (write)
				if cacheReadParsePolicy and var6 then
					return var6
				end
				local var8 = -1
				local localPlayer = playersService_1.LocalPlayer
				
				if localPlayer and localPlayer.UserId > 0 then
					var8 = localPlayer.UserId
				end
				var8 = memStorageService_1:GetItem("GUAC:" .. var25 .. ":" .. p1)
				
				if var8 and #var8 > 0 then
					local ok, status = pcall(function()
						-- upvalues: p1 (copy), var8 (ref)
						return p1:JSONDecode(var8)
					end)
					
					if not ok then
						return nil
					end
					if fFlagLogAllGuacRead then
						var1:logEvent("lua_policy_read_success")
					elseif fFlagLogFirstGuacRead and not var2 then
						var1:logEvent("lua_policy_read_success")
						var2 = true
					end
					var6 = status
					var5 = var8
					
					return status
				end
			end,
			onPolicyChanged = function(p3)
				-- upvalues: playersService_1 (copy), p2 (ref), bindableEvent (ref), var4 (write), var3 (write), var6 (write), memStorageService_1 (copy), onPolicyUpdated (ref)
				local var8 = -1
				local localPlayer = playersService_1.LocalPlayer
				
				if localPlayer and localPlayer.UserId > 0 then
					var8 = localPlayer.UserId
				end
				local text = "GUAC:" .. var26 .. ":" .. p1
				local eventConnection = bindableEvent.Event:Connect(p3)
				
				if var4 and var3 == text then
					if var6 then
						p3(var6)
						
						return eventConnection
					end
				elseif var4 then
					var4:Disconnect()
				end
				var3 = text
				var4 = memStorageService_1:BindAndFire(text, onPolicyUpdated)
				return eventConnection
			end
		}
	end
end