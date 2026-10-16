local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local _ = require(CurrencyTransfers.Stores.createTransferStore)
local PromptStateModule = require(CurrencyTransfers.Enums.PromptState)
local TransferOriginationModule = require(CurrencyTransfers.Enums.TransferOrigination)
local GetFFlagCurrencyTransferSignalRecipientOnCompleteModule = require(CurrencyTransfers.Flags.GetFFlagCurrencyTransferSignalRecipientOnComplete)

return function(p1) --[[ Line: 13 | Named "handleTransferComplete" ]]
	-- upvalues: TransferOriginationModule (copy), Players (copy), MarketplaceService (copy), GetFFlagCurrencyTransferSignalRecipientOnCompleteModule (copy), PromptStateModule (copy)
	local SetPromptStateFunction: (any) -> () = p1.setPromptState
	local TriggerOnCloseFunction: () -> () = p1.triggerOnClose
	
	if p1.getTransferOrigination(false) == TransferOriginationModule.InExperience then
		local LocalPlayer = Players.LocalPlayer
		
		if LocalPlayer then
			pcall(function() --[[ Line: 21 ]]
				-- upvalues: MarketplaceService (upval), LocalPlayer (copy)
				MarketplaceService:SignalRobuxTransferCompleted(LocalPlayer.UserId)
			end)
		end
		if GetFFlagCurrencyTransferSignalRecipientOnCompleteModule() then
			local Recipient = p1.getRecipient(false)
			
			if Recipient then
				pcall(function() --[[ Line: 29 ]]
					-- upvalues: MarketplaceService (upval), Recipient (copy)
					MarketplaceService:SignalRobuxTransferCompleted(Recipient.targetId)
				end)
			end
		end
	end
	SetPromptStateFunction(PromptStateModule.TransferComplete)
	TriggerOnCloseFunction()
end