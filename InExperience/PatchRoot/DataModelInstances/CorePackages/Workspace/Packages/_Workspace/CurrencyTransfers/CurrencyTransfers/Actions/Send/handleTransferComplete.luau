local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local marketplaceService = game:GetService("MarketplaceService")
local playersService = game:GetService("Players")
local _ = require(currencyTransfers.Stores.createTransferStore)
local promptStateModule = require(currencyTransfers.Enums.PromptState)
local transferOriginationModule = require(currencyTransfers.Enums.TransferOrigination)
local getFFlagCurrencyTransferSignalRecipientOnCompleteModule = require(currencyTransfers.Flags.GetFFlagCurrencyTransferSignalRecipientOnComplete)

return function(p0) --[[ line: 13 | named "handleTransferComplete" ]]
	-- upvalues: transferOriginationModule (ref), playersService (ref), marketplaceService (ref), getFFlagCurrencyTransferSignalRecipientOnCompleteModule (ref), promptStateModule (ref)
	local transferOrigination = p0.getTransferOrigination(false)
	local setPromptState = p0.setPromptState
	local triggerOnClose = p0.triggerOnClose
	
	if transferOrigination == transferOriginationModule.InExperience then
		local localPlayer = playersService.LocalPlayer
		
		if localPlayer then
			pcall(function() --[[ line: 21 ]]
				-- upvalues: marketplaceService (copy), localPlayer (ref)
				marketplaceService:SignalRobuxTransferCompleted(localPlayer.UserId)
			end)
		end
		if getFFlagCurrencyTransferSignalRecipientOnCompleteModule() then
			local recipient = p0.getRecipient(false)
			
			if recipient then
				pcall(function() --[[ line: 29 ]]
					-- upvalues: marketplaceService (copy), recipient (ref)
					marketplaceService:SignalRobuxTransferCompleted(recipient.targetId)
				end)
			end
		end
	end
	setPromptState(promptStateModule.TransferComplete)
	triggerOnClose()
end