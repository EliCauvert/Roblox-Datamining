-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:42 2026 Pacific Standard Time.

local httpService = game:GetService("HttpService")
local memStorageService = game:GetService("MemStorageService")
local playersService = game:GetService("Players")
local fFlagLogFirstGuacRead = game:DefineFastFlag("FFlagLogFirstGuacRead", false)
local fFlagLogAllGuacRead = game:DefineFastFlag("FFlagLogAllGuacRead", false)
local cacheReadParsePolicy = game:DefineFastFlag("CacheReadParsePolicy", false)
local fixPolicyStalePlayerUpdates = game:DefineFastFlag("FixPolicyStalePlayerUpdates", false)
local clearPolicyOnLogout = game:DefineFastFlag("ClearPolicyOnLogout", false)
local _ = nil
local var8 = if fFlagLogFirstGuacRead then require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol).default else nil

return function(p0) --[[ line: 21 ]]
	-- upvalues: httpService (ref), memStorageService (ref), playersService (ref), cacheReadParsePolicy (ref), clearPolicyOnLogout (ref), fixPolicyStalePlayerUpdates (ref), fFlagLogAllGuacRead (ref), var8 (write), fFlagLogFirstGuacRead (ref)
	p0 = p0 or {}
	p0.HttpService = p0.HttpService or httpService
	p0.MemStorageService = p0.MemStorageService or memStorageService
	p0.PlayersService = p0.PlayersService or playersService
	assert(p0.HttpService, "expected dependencies.HttpService")
	assert(p0.MemStorageService, "expected dependencies.MemStorageService")
	assert(p0.PlayersService, "expected dependencies.PlayersService")
	p0 = p0.HttpService
	local memStorageService_1 = p0.MemStorageService
	local playersService_1 = p0.PlayersService
	local var10 = false
	
	return function(p1) --[[ line: 36 ]]
		-- upvalues: playersService_1 (ref), p0 (ref), cacheReadParsePolicy (copy), clearPolicyOnLogout (copy), memStorageService_1 (ref), fixPolicyStalePlayerUpdates (copy), fFlagLogAllGuacRead (copy), var8 (copy), fFlagLogFirstGuacRead (copy), var10 (write)
		assert(p1, "expected behavior")
		
		local function _() --[[ line: 39 | named "getStoreKey" ]]
			-- upvalues: playersService_1 (copy), p1 (ref)
			local var21 = -1
			local localPlayer = playersService_1.LocalPlayer
			
			if localPlayer and localPlayer.UserId > 0 then
				var21 = localPlayer.UserId
			end
			return "GUAC:" .. var21 .. ":" .. p1
		end
		
		local text = "GUAC:" .. -1 .. ":" .. p1
		local var12 = nil
		local var13 = nil
		local var14 = nil
		local var15 = nil
		local bindableEvent = Instance.new("BindableEvent")
		
		local function onPolicyUpdated(p2) --[[ line: 57 ]]
			-- upvalues: var14 (write), p0 (copy), var15 (write), bindableEvent (ref)
			if p2 ~= var14 and p2 and #p2 > 0 then
				local ok, status = pcall(function() --[[ line: 61 ]]
					-- upvalues: p0 (copy), p2 (ref)
					return p0:JSONDecode(p2)
				end)
				
				if ok then
					var14 = p2
					var15 = status
					bindableEvent:Fire(status)
				end
			end
		end
		
		if cacheReadParsePolicy then
			local var18 = nil
			
			local function invalidateForKeyChange() --[[ line: 77 ]]
				-- upvalues: clearPolicyOnLogout (copy), var12 (write), var15 (write), var14 (write), var13 (write), playersService_1 (copy), p1 (ref), text (ref), memStorageService_1 (copy), onPolicyUpdated (ref)
				local var22 = if clearPolicyOnLogout then var12 else nil
				var15 = nil
				var14 = nil
				
				if not var13 then
					var12 = nil
					
					return
				end
				var13:Disconnect()
				var13 = nil
				local var23 = -1
				local localPlayer = playersService_1.LocalPlayer
				
				if localPlayer and localPlayer.UserId > 0 then
					var23 = localPlayer.UserId
				end
				local text_1 = "GUAC:" .. var23 .. ":" .. p1
				
				if clearPolicyOnLogout and var22 and (var22 ~= text_1 and text_1 == text) then
					memStorageService_1:RemoveItem(text_1)
				end
				var12 = text_1
				var13 = memStorageService_1:BindAndFire(text_1, onPolicyUpdated)
			end
			
			local function localPlayerChanged() --[[ line: 104 ]]
				-- upvalues: var18 (write), playersService_1 (copy), fixPolicyStalePlayerUpdates (copy), invalidateForKeyChange (ref), var15 (write)
				if var18 then
					var18:Disconnect()
					var18 = nil
				end
				if playersService_1.LocalPlayer then
					var18 = playersService_1.LocalPlayer:GetPropertyChangedSignal("UserId"):Connect(function() --[[ line: 110 ]]
						-- upvalues: fixPolicyStalePlayerUpdates (copy), invalidateForKeyChange (copy), var15 (copy)
						if fixPolicyStalePlayerUpdates then
							invalidateForKeyChange()
							
							return
						end
						var15 = nil
					end)
				end
				if fixPolicyStalePlayerUpdates then
					invalidateForKeyChange()
					
					return
				end
				var15 = nil
			end
			
			playersService_1:GetPropertyChangedSignal("LocalPlayer"):Connect(localPlayerChanged)
			localPlayerChanged()
		end
		return {
			read = function() --[[ line: 129 ]]
				-- upvalues: cacheReadParsePolicy (copy), var15 (write), playersService_1 (copy), p1 (ref), memStorageService_1 (copy), p0 (copy), fFlagLogAllGuacRead (copy), var8 (copy), fFlagLogFirstGuacRead (copy), var10 (copy), var14 (write)
				if cacheReadParsePolicy and var15 then
					return var15
				end
				local var25 = -1
				local localPlayer = playersService_1.LocalPlayer
				
				if localPlayer and localPlayer.UserId > 0 then
					var25 = localPlayer.UserId
				end
				var25 = memStorageService_1:GetItem("GUAC:" .. var25 .. ":" .. p1)
				
				if var25 and #var25 > 0 then
					local ok, status = pcall(function() --[[ line: 136 ]]
						-- upvalues: p0 (copy), var25 (ref)
						return p0:JSONDecode(var25)
					end)
					
					if not ok then
						return nil
					end
					if fFlagLogAllGuacRead then
						var8:logEvent("lua_policy_read_success")
					elseif fFlagLogFirstGuacRead and not var10 then
						var8:logEvent("lua_policy_read_success")
						var10 = true
					end
					var15 = status
					var14 = var25
					
					return status
				end
			end,
			onPolicyChanged = function(p3) --[[ line: 158 ]]
				-- upvalues: playersService_1 (copy), p1 (ref), bindableEvent (ref), var13 (write), var12 (write), var15 (write), memStorageService_1 (copy), onPolicyUpdated (ref)
				local var26 = -1
				local localPlayer = playersService_1.LocalPlayer
				
				if localPlayer and localPlayer.UserId > 0 then
					var26 = localPlayer.UserId
				end
				local text = "GUAC:" .. var26 .. ":" .. p1
				local eventConnection = bindableEvent.Event:Connect(p3)
				
				if var13 and var12 == text then
					if var15 then
						p3(var15)
						
						return eventConnection
					end
				elseif var13 then
					var13:Disconnect()
				end
				var12 = text
				var13 = memStorageService_1:BindAndFire(text, onPolicyUpdated)
				return eventConnection
			end
		}
	end
end