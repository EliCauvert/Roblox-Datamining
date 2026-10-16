local PolicyService = game:GetService("PolicyService")
local Players = game:GetService("Players")
local Parent = script.Parent.Parent
local PromiseModule = require(Parent.Parent.Promise)
local LoggerModule = require(Parent.Logger)

return function(p1) --[[ Line: 10 ]]
	-- upvalues: PolicyService (copy), Players (copy), PromiseModule (copy), LoggerModule (copy)
	local P0 = p1 or {}
	P0.PolicyService = P0.PolicyService or PolicyService
	P0.PlayersService = P0.PlayersService or Players
	assert(P0.PolicyService, "expected dependencies.PolicyService")
	assert(P0.PlayersService, "expected dependencies.PlayersService")
	local PolicyService1 = P0.PolicyService
	local PlayersService = P0.PlayersService
	
	return function() --[[ Line: 21 ]]
		-- upvalues: PromiseModule (upval), PlayersService (copy), PolicyService1 (copy), LoggerModule (upval)
		return {
			read = function() --[[ Line: 23 ]]
				return nil
			end,
			onPolicyChanged = function(Callback) --[[ Line: 27 ]]
				-- upvalues: PromiseModule (upval), PlayersService (upval), PolicyService1 (upval), LoggerModule (upval)
				local BindableEvent = Instance.new("BindableEvent")
				local EventConnection = BindableEvent.Event:Connect(Callback)
				PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ()) --[[ Line: 33 ]]
					-- upvalues: PlayersService (upval), PolicyService1 (upval)
					local LocalPlayer = PlayersService.LocalPlayer
					
					if not LocalPlayer then
						Callback("LocalPlayer not found")
						
						return
					end
					local Success, Result = pcall(function() --[[ Line: 36 ]]
						-- upvalues: PolicyService1 (upval), LocalPlayer (copy)
						return PolicyService1:GetPolicyInfoForPlayerAsync(LocalPlayer)
					end)
					
					if not Success then
						Callback("GetPolicyInfoForPlayerAsync had an error when calling")
						
						return
					end
					if Result then
						Callback1(Result)
						
						return
					else
						Callback("GetPolicyInfoForPlayerAsync return nil value")
					end
				end):andThen(function(Result) --[[ Line: 52 ]]
					-- upvalues: BindableEvent (copy)
					BindableEvent:Fire(Result)
				end):catch(function(Err) --[[ Line: 55 ]]
					-- upvalues: LoggerModule (upval)
					LoggerModule:warning("Could not fetch from PolicyService due to error: {}", Err)
				end)
				
				return EventConnection
			end
		}
	end
end