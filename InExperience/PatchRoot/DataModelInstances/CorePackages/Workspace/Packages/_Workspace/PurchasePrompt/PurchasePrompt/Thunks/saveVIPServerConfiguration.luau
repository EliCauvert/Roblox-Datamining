local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local NetworkModule = require(PurchasePrompt.Services.Network)
local VIPServerRenamedModule = require(PurchasePrompt.Actions.VIPServerRenamed)
local ThunkModule = require(PurchasePrompt.Thunk)
local _ = require(PurchasePrompt.types)
local UpdateVIPServerConfigurationModule = require(PurchasePrompt.Network.updateVIPServerConfiguration)
local list = { NetworkModule }

return function(p1)
	-- upvalues: ThunkModule (copy), list (copy), UpdateVIPServerConfigurationModule (copy), NetworkModule (copy), VIPServerRenamedModule (copy)
	return ThunkModule.new(script.Name, list, function(p2, p3)
		-- upvalues: UpdateVIPServerConfigurationModule (upval), NetworkModule (upval), p1 (copy), VIPServerRenamedModule (upval)
		return UpdateVIPServerConfigurationModule(p3[NetworkModule], p2:getState().promptRequest.vipServerId, p1):andThen(function(Result)
			-- upvalues: p2 (copy), VIPServerRenamedModule (upval)
			if Result ~= nil then
				p2:dispatch(VIPServerRenamedModule(Result))
			end
		end)
	end)
end