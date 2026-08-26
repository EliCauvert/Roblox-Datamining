local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local playersService = game:GetService("Players")
local _ = require(currencyTransfers.Stores.createTransferStore)
local transferDirectionModule = require(currencyTransfers.Enums.TransferDirection)

return function(p1, p2)
	-- upvalues: playersService (ref), transferDirectionModule (ref)
	local localPlayer = playersService.LocalPlayer
	local var1 = if localPlayer then localPlayer.UserId else 0
	local direction = p1.getDirection(false)
	local var2 = 0
	local var3 = 0
	
	if direction == transferDirectionModule.Send then
		var2 = var1
		local recipient = p1.getRecipient(false)
		var3 = if recipient then recipient.targetId else p1.getRecipientUserId(false)
	elseif direction == transferDirectionModule.Receive then
		var3 = var1
		local sender = p1.getSender(false)
		var2 = if sender then sender.targetId else 0
	end
	local transferRequestId = p1.getTransferRequestId(false)
	local robuxTransfer = p1.getRobuxTransfer(false)
	local selectedAmount = p1.getSelectedAmount(false)
	
	if selectedAmount == nil and robuxTransfer then
		selectedAmount = robuxTransfer.transferAmount
	end
	local var4 = nil
	local gameId = game.GameId
	
	if gameId > 0 then
		var4 = gameId
	end
	local transferOrigination = p1.getTransferOrigination(false)
	local t = {
		transfer_request_id = transferRequestId or "",
		transfer_client_session_id = p1.getTransferClientSessionId(false),
		event_name = p2,
		sender_user_id = var2,
		recipient_user_id = var3,
		transfer_amount = selectedAmount,
		transfer_prompt_state = tostring(p1.getPromptState(false)),
		transfer_origination = if transferOrigination then tostring(transferOrigination) else "",
		transfer_direction = if direction then tostring(direction) else "",
		ingest_timestamp_milliseconds = DateTime.now().UnixTimestampMillis
	}
	
	if direction == transferDirectionModule.Send and p1.getBalanceReceivedFromApi(false) then
		t.user_balance = p1.getRobuxBalanceAmount(false)
	end
	if var4 ~= nil then
		t.universe_id = var4
	end
	return t
end