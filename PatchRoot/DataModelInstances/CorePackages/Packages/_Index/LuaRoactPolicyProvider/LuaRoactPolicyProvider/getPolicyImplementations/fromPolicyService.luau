-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:43 2026 Pacific Standard Time.

local policyService = game:GetService("PolicyService")
local playersService = game:GetService("Players")
local parent = script.Parent.Parent
local promiseModule = require(parent.Parent.Promise)
local loggerModule = require(parent.Logger)

return function(p0) --[[ line: 10 ]]
	-- upvalues: policyService (ref), playersService (ref), promiseModule (ref), loggerModule (ref)
	p0 = p0 or {}
	p0.PolicyService = p0.PolicyService or policyService
	p0.PlayersService = p0.PlayersService or playersService
	assert(p0.PolicyService, "expected dependencies.PolicyService")
	assert(p0.PlayersService, "expected dependencies.PlayersService")
	p0 = p0.PolicyService
	local playersService_1 = p0.PlayersService
	
	return function() --[[ line: 21 ]]
		-- upvalues: promiseModule (copy), playersService_1 (ref), p0 (ref), loggerModule (copy)
		return {
			read = function() --[[ line: 23 ]]
				return nil
			end,
			onPolicyChanged = function(p1) --[[ line: 27 ]]
				-- upvalues: promiseModule (copy), playersService_1 (copy), p0 (copy), loggerModule (copy)
				local bindableEvent = Instance.new("BindableEvent")
				local eventConnection = bindableEvent.Event:Connect(p1)
				promiseModule.new(function(p4, p5) --[[ line: 33 ]]
					-- upvalues: playersService_1 (copy), p0 (copy)
					local localPlayer = playersService_1.LocalPlayer
					
					if not localPlayer then
						p5("LocalPlayer not found")
						
						return
					end
					local ok, status = pcall(function() --[[ line: 36 ]]
						-- upvalues: p0 (copy), localPlayer (ref)
						return p0:GetPolicyInfoForPlayerAsync(localPlayer)
					end)
					
					if not ok then
						p5("GetPolicyInfoForPlayerAsync had an error when calling")
						
						return
					elseif status then
						p4(status)
						
						return
					end
					p5("GetPolicyInfoForPlayerAsync return nil value")
				end):andThen(function(p3) --[[ line: 52 ]]
					-- upvalues: bindableEvent (ref)
					bindableEvent:Fire(p3)
				end):catch(function(p2) --[[ line: 55 ]]
					-- upvalues: loggerModule (copy)
					loggerModule:warning("Could not fetch from PolicyService due to error: {}", p2)
				end)
				
				return eventConnection
			end
		}
	end
end