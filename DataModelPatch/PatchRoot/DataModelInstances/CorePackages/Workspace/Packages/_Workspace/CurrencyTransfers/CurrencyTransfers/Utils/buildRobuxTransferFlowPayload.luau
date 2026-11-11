local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Players = game:GetService("Players")
local _ = require(CurrencyTransfers.Stores.createTransferStore)
local TransferDirectionModule = require(CurrencyTransfers.Enums.TransferDirection)

return function(p1, Event_name)
	-- upvalues: Players (copy), TransferDirectionModule (copy)
	local LocalPlayer = Players.LocalPlayer
	local UserId = if LocalPlayer then LocalPlayer.UserId else 0
	local Direction = p1.getDirection(false)
	local TargetId = 0
	local TargetId1 = 0
	
	if Direction == TransferDirectionModule.Send then
		TargetId = UserId
		local Recipient = p1.getRecipient(false)
		TargetId1 = if Recipient then Recipient.targetId else p1.getRecipientUserId(false)
	elseif Direction == TransferDirectionModule.Receive then
		TargetId1 = UserId
		local Sender = p1.getSender(false)
		TargetId = if Sender then Sender.targetId else 0
	end
	local TransferRequestId = p1.getTransferRequestId(false)
	local RobuxTransfer = p1.getRobuxTransfer(false)
	local SelectedAmount = p1.getSelectedAmount(false)
	
	if SelectedAmount == nil and RobuxTransfer then
		SelectedAmount = RobuxTransfer.transferAmount
	end
	local Universe_id: number? = nil
	local GameId: number = game.GameId
	
	if GameId > 0 then
		Universe_id = GameId
	end
	local TransferOrigination = p1.getTransferOrigination(false)
	local config = {
		transfer_request_id = TransferRequestId or "",
		transfer_client_session_id = p1.getTransferClientSessionId(false),
		event_name = Event_name,
		sender_user_id = TargetId,
		recipient_user_id = TargetId1,
		transfer_amount = SelectedAmount,
		transfer_prompt_state = tostring(p1.getPromptState(false)),
		transfer_origination = if TransferOrigination then tostring(TransferOrigination) else "",
		transfer_direction = if Direction then tostring(Direction) else "",
		ingest_timestamp_milliseconds = DateTime.now().UnixTimestampMillis
	}
	
	if Direction == TransferDirectionModule.Send and p1.getBalanceReceivedFromApi(false) then
		config.user_balance = p1.getRobuxBalanceAmount(false)
	end
	if Universe_id ~= nil then
		config.universe_id = Universe_id
	end
	return config
end