local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local playersService = game:GetService("Players")
local _ = require(currencyTransfers.Stores.createTransferStore)
local transferDirectionModule = require(currencyTransfers.Enums.TransferDirection)

return function(p0, p1)
	-- upvalues: playersService (ref), transferDirectionModule (ref)
	local localPlayer = playersService.LocalPlayer
	local var3 = if localPlayer then localPlayer.UserId else 0
	local direction = p0.getDirection(false)
	local var5 = 0
	local var6 = 0
	
	if direction == transferDirectionModule.Send then
		var5 = var3
		local recipient = p0.getRecipient(false)
		var6 = if recipient then recipient.targetId else p0.getRecipientUserId(false)
	elseif direction == transferDirectionModule.Receive then
		var6 = var3
		local sender = p0.getSender(false)
		var5 = if sender then sender.targetId else 0
	end
	local transferRequestId = p0.getTransferRequestId(false)
	local robuxTransfer = p0.getRobuxTransfer(false)
	local selectedAmount = p0.getSelectedAmount(false)
	
	if selectedAmount == nil and robuxTransfer then
		selectedAmount = robuxTransfer.transferAmount
	end
	local var12 = nil
	local gameId = game.GameId
	
	if gameId > 0 then
		var12 = gameId
	end
	local transferOrigination = p0.getTransferOrigination(false)
	local t = {
		transfer_request_id = transferRequestId or "",
		transfer_client_session_id = p0.getTransferClientSessionId(false),
		event_name = p1,
		sender_user_id = var5,
		recipient_user_id = var6,
		transfer_amount = selectedAmount,
		transfer_prompt_state = tostring(p0.getPromptState(false)),
		transfer_origination = if transferOrigination then tostring(transferOrigination) else "",
		transfer_direction = if direction then tostring(direction) else "",
		ingest_timestamp_milliseconds = DateTime.now().UnixTimestampMillis
	}
	
	if direction == transferDirectionModule.Send and p0.getBalanceReceivedFromApi(false) then
		t.user_balance = p0.getRobuxBalanceAmount(false)
	end
	if var12 ~= nil then
		t.universe_id = var12
	end
	return t
end