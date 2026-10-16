local HttpService = game:GetService("HttpService")
local MemStorageService = game:GetService("MemStorageService")
local Players = game:GetService("Players")
local FFlagLogFirstGuacRead = game:DefineFastFlag("FFlagLogFirstGuacRead", false)
local FFlagLogAllGuacRead = game:DefineFastFlag("FFlagLogAllGuacRead", false)
local CacheReadParsePolicy = game:DefineFastFlag("CacheReadParsePolicy", false)
local FixPolicyStalePlayerUpdates = game:DefineFastFlag("FixPolicyStalePlayerUpdates", false)
local ClearPolicyOnLogout = game:DefineFastFlag("ClearPolicyOnLogout", false)
local Default = if FFlagLogFirstGuacRead then require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol).default else nil

return function(p1) --[[ Line: 21 ]]
	-- upvalues: HttpService (copy), MemStorageService (copy), Players (copy), CacheReadParsePolicy (copy), ClearPolicyOnLogout (copy), FixPolicyStalePlayerUpdates (copy), FFlagLogAllGuacRead (copy), Default (ref), FFlagLogFirstGuacRead (copy)
	local P0 = p1 or {}
	P0.HttpService = P0.HttpService or HttpService
	P0.MemStorageService = P0.MemStorageService or MemStorageService
	P0.PlayersService = P0.PlayersService or Players
	assert(P0.HttpService, "expected dependencies.HttpService")
	assert(P0.MemStorageService, "expected dependencies.MemStorageService")
	assert(P0.PlayersService, "expected dependencies.PlayersService")
	local HttpService1 = P0.HttpService
	local MemStorageService1 = P0.MemStorageService
	local PlayersService = P0.PlayersService
	local Flag = false
	
	return function(Text) --[[ Line: 36 ]]
		-- upvalues: PlayersService (copy), HttpService1 (copy), CacheReadParsePolicy (upval), ClearPolicyOnLogout (upval), MemStorageService1 (copy), FixPolicyStalePlayerUpdates (upval), FFlagLogAllGuacRead (upval), Default (upval), FFlagLogFirstGuacRead (upval), Flag (ref)
		assert(Text, "expected behavior")
		
		local function _(): string --[[ Line: 39 | Named "getStoreKey" ]]
			-- upvalues: PlayersService (upval), Text (copy)
			local UserId = -1
			local LocalPlayer = PlayersService.LocalPlayer
			
			if LocalPlayer and LocalPlayer.UserId > 0 then
				UserId = LocalPlayer.UserId
			end
			return "GUAC:" .. UserId .. ":" .. Text
		end
		
		local Text1 = "GUAC:" .. -1 .. ":" .. Text
		local v1 = nil
		local BindAndFireResult = nil
		local Input = nil
		local v2 = nil
		local BindableEvent = Instance.new("BindableEvent")
		
		local function onPolicyUpdated(Input1) --[[ Line: 57 ]]
			-- upvalues: Input (ref), HttpService1 (upval), v2 (ref), BindableEvent (copy)
			if Input1 ~= Input and Input1 and #Input1 > 0 then
				local Success, Result = pcall(function() --[[ Line: 61 ]]
					-- upvalues: HttpService1 (upval), Input1 (copy)
					return HttpService1:JSONDecode(Input1)
				end)
				
				if Success then
					Input = Input1
					v2 = Result
					BindableEvent:Fire(Result)
				end
			end
		end
		
		if CacheReadParsePolicy then
			local Connection = nil
			
			local function invalidateForKeyChange() --[[ Line: 77 ]]
				-- upvalues: ClearPolicyOnLogout (upval), v1 (ref), v2 (ref), Input (ref), BindAndFireResult (ref), PlayersService (upval), Text (copy), Text1 (copy), MemStorageService1 (upval), onPolicyUpdated (copy)
				local Key = if ClearPolicyOnLogout then v1 else nil
				v2 = nil
				Input = nil
				
				if not BindAndFireResult then
					v1 = nil
					
					return
				end
				BindAndFireResult:Disconnect()
				BindAndFireResult = nil
				local UserId = -1
				local LocalPlayer = PlayersService.LocalPlayer
				
				if LocalPlayer and LocalPlayer.UserId > 0 then
					UserId = LocalPlayer.UserId
				end
				local Text2 = "GUAC:" .. UserId .. ":" .. Text
				
				if ClearPolicyOnLogout and Key and Key ~= Text2 and Text2 == Text1 then
					MemStorageService1:RemoveItem(Text2)
				end
				v1 = Text2
				BindAndFireResult = MemStorageService1:BindAndFire(Text2, onPolicyUpdated)
			end
			
			local function localPlayerChanged() --[[ Line: 104 ]]
				-- upvalues: Connection (ref), PlayersService (upval), FixPolicyStalePlayerUpdates (upval), invalidateForKeyChange (copy), v2 (ref)
				if Connection then
					Connection:Disconnect()
					Connection = nil
				end
				if PlayersService.LocalPlayer then
					Connection = PlayersService.LocalPlayer:GetPropertyChangedSignal("UserId"):Connect(function() --[[ Line: 110 ]]
						-- upvalues: FixPolicyStalePlayerUpdates (upval), invalidateForKeyChange (upval), v2 (upval)
						if FixPolicyStalePlayerUpdates then
							invalidateForKeyChange()
							
							return
						else
							v2 = nil
						end
					end)
				end
				if FixPolicyStalePlayerUpdates then
					invalidateForKeyChange()
					
					return
				else
					v2 = nil
				end
			end
			
			PlayersService:GetPropertyChangedSignal("LocalPlayer"):Connect(localPlayerChanged)
			localPlayerChanged()
		end
		return {
			read = function() --[[ Line: 129 ]]
				-- upvalues: CacheReadParsePolicy (upval), v2 (ref), PlayersService (upval), Text (copy), MemStorageService1 (upval), HttpService1 (upval), FFlagLogAllGuacRead (upval), Default (upval), FFlagLogFirstGuacRead (upval), Flag (upval), Input (ref)
				if CacheReadParsePolicy and v2 then
					return v2
				end
				local UserId = -1
				local LocalPlayer = PlayersService.LocalPlayer
				
				if LocalPlayer and LocalPlayer.UserId > 0 then
					UserId = LocalPlayer.UserId
				end
				local Item = MemStorageService1:GetItem("GUAC:" .. UserId .. ":" .. Text)
				
				if Item and #Item > 0 then
					local Success, Result = pcall(function() --[[ Line: 136 ]]
						-- upvalues: HttpService1 (upval), Item (copy)
						return HttpService1:JSONDecode(Item)
					end)
					
					if Success then
						if FFlagLogAllGuacRead then
							Default:logEvent("lua_policy_read_success")
						elseif FFlagLogFirstGuacRead and not Flag then
							Default:logEvent("lua_policy_read_success")
							Flag = true
						end
						v2 = Result
						Input = Item
						
						return Result
					end
				end
				return nil
			end,
			onPolicyChanged = function(Callback: (any) -> ()) --[[ Line: 158 ]]
				-- upvalues: PlayersService (upval), Text (copy), BindableEvent (copy), BindAndFireResult (ref), v1 (ref), v2 (ref), MemStorageService1 (upval), onPolicyUpdated (copy)
				local UserId = -1
				local LocalPlayer = PlayersService.LocalPlayer
				
				if LocalPlayer and LocalPlayer.UserId > 0 then
					UserId = LocalPlayer.UserId
				end
				local Text1 = "GUAC:" .. UserId .. ":" .. Text
				local EventConnection = BindableEvent.Event:Connect(Callback)
				
				if not BindAndFireResult or v1 ~= Text1 then
					if BindAndFireResult then
						BindAndFireResult:Disconnect()
					end
					v1 = Text1
					BindAndFireResult = MemStorageService1:BindAndFire(Text1, onPolicyUpdated)
				elseif v2 then
					Callback(v2)
					
					return EventConnection
				end
				return EventConnection
			end
		}
	end
end