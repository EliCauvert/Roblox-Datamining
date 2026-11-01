local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local NetworkModule = require(PurchasePrompt.Services.Network)
local ThunkModule = require(PurchasePrompt.Thunk)
local GenerateVIPServerLinkModule = require(PurchasePrompt.Network.generateVIPServerLink)
local list = { NetworkModule }

return function()
	-- upvalues: ThunkModule (copy), list (copy), GenerateVIPServerLinkModule (copy), NetworkModule (copy)
	return ThunkModule.new(script.Name, list, function(p1, p2)
		-- upvalues: GenerateVIPServerLinkModule (upval), NetworkModule (upval)
		return GenerateVIPServerLinkModule(p2[NetworkModule], p1:getState().promptRequest.vipServerId)
	end)
end