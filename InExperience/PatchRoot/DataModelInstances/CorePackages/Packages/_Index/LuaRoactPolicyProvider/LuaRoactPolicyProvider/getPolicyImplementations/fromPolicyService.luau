local policyService = game:GetService("PolicyService")
local playersService = game:GetService("Players")
local parent = script.Parent.Parent
local promiseModule = require(parent.Parent.Promise)
local loggerModule = require(parent.Logger)

return function(p1)
	-- upvalues: policyService (ref), playersService (ref), promiseModule (ref), loggerModule (ref)
	p1 = p1 or {}
	p1.PolicyService = p1.PolicyService or policyService
	p1.PlayersService = p1.PlayersService or playersService
	assert(p1.PolicyService, "expected dependencies.PolicyService")
	assert(p1.PlayersService, "expected dependencies.PlayersService")
	p1 = p1.PolicyService
	local playersService_1 = p1.PlayersService
	
	return function()
		-- upvalues: promiseModule (copy), playersService_1 (ref), p1 (ref), loggerModule (copy)
		return {
			read = function()
				return nil
			end,
			onPolicyChanged = function(p2)
				-- upvalues: promiseModule (copy), playersService_1 (copy), p1 (copy), loggerModule (copy)
				local bindableEvent = Instance.new("BindableEvent")
				local eventConnection = bindableEvent.Event:Connect(p2)
				promiseModule.new(function(p3, p4)
					-- upvalues: playersService_1 (copy), p1 (copy)
					local localPlayer = playersService_1.LocalPlayer
					
					if not localPlayer then
						p4("LocalPlayer not found")
						
						return
					end
					local ok, status = pcall(function()
						-- upvalues: p1 (copy), localPlayer (ref)
						return p1:GetPolicyInfoForPlayerAsync(localPlayer)
					end)
					
					if not ok then
						p4("GetPolicyInfoForPlayerAsync had an error when calling")
						
						return
					elseif status then
						p3(status)
						
						return
					end
					p4("GetPolicyInfoForPlayerAsync return nil value")
				end):andThen(function(p3)
					-- upvalues: bindableEvent (ref)
					bindableEvent:Fire(p3)
				end):catch(function(p3)
					-- upvalues: loggerModule (copy)
					loggerModule:warning("Could not fetch from PolicyService due to error: {}", p3)
				end)
				
				return eventConnection
			end
		}
	end
end