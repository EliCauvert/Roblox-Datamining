local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local marketplaceService = game:GetService("MarketplaceService")
local playersService = game:GetService("Players")
local _ = require(currencyTransfers.Stores.createTransferStore)
local promptStateModule = require(currencyTransfers.Enums.PromptState)
local transferOriginationModule = require(currencyTransfers.Enums.TransferOrigination)
local getFFlagCurrencyTransferSignalRecipientOnCompleteModule = require(currencyTransfers.Flags.GetFFlagCurrencyTransferSignalRecipientOnComplete)

return function(p1)
	-- upvalues: transferOriginationModule (ref), playersService (ref), marketplaceService (ref), getFFlagCurrencyTransferSignalRecipientOnCompleteModule (ref), promptStateModule (ref)
	local transferOrigination = p1.getTransferOrigination(false)
	local setPromptState = p1.setPromptState
	local triggerOnClose = p1.triggerOnClose
	
	if transferOrigination == transferOriginationModule.InExperience then
		local localPlayer = playersService.LocalPlayer
		
		if localPlayer then
			pcall(function()
				-- upvalues: marketplaceService (copy), localPlayer (ref)
				marketplaceService:SignalRobuxTransferCompleted(localPlayer.UserId)
			end)
		end
		if getFFlagCurrencyTransferSignalRecipientOnCompleteModule() then
			local recipient = p1.getRecipient(false)
			
			if recipient then
				pcall(function()
					-- upvalues: marketplaceService (copy), recipient (ref)
					marketplaceService:SignalRobuxTransferCompleted(recipient.targetId)
				end)
			end
		end
	end
	setPromptState(promptStateModule.TransferComplete)
	triggerOnClose()
end