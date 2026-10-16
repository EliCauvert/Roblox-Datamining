local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local TransferDirectionModule = require(CurrencyTransfers.Enums.TransferDirection)
local PromptStateModule = require(CurrencyTransfers.Enums.PromptState)

return function(p1, p2) --[[ Line: 15 | Named "applyRobuxTransferFlowIngestStubs" ]]
	-- upvalues: TransferDirectionModule (copy), PromptStateModule (copy)
	local Direction = if p2 and p2.direction ~= nil then p2.direction else TransferDirectionModule.Send
	
	local function _(Key, p3) --[[ Line: 18 | Named "stubIfNil" ]]
		-- upvalues: p1 (copy)
		if p1[Key] == nil then
			p1[Key] = p3
		end
	end
	
	local function GetDirection() --[[ Line: 24 ]]
		-- upvalues: Direction (copy)
		return Direction
	end
	
	if p1.getDirection == nil then
		p1.getDirection = GetDirection
	end
	local function GetRecipient() --[[ Line: 27 ]]
		return nil
	end
	
	if p1.getRecipient == nil then
		p1.getRecipient = GetRecipient
	end
	local function GetRecipientUserId(): number --[[ Line: 30 ]]
		return 0
	end
	
	if p1.getRecipientUserId == nil then
		p1.getRecipientUserId = GetRecipientUserId
	end
	local function GetSender() --[[ Line: 33 ]]
		return nil
	end
	
	if p1.getSender == nil then
		p1.getSender = GetSender
	end
	local function GetTransferRequestId() --[[ Line: 36 ]]
		return nil
	end
	
	if p1.getTransferRequestId == nil then
		p1.getTransferRequestId = GetTransferRequestId
	end
	local function GetSelectedAmount() --[[ Line: 39 ]]
		return nil
	end
	
	if p1.getSelectedAmount == nil then
		p1.getSelectedAmount = GetSelectedAmount
	end
	local function GetRobuxTransfer() --[[ Line: 42 ]]
		return nil
	end
	
	if p1.getRobuxTransfer == nil then
		p1.getRobuxTransfer = GetRobuxTransfer
	end
	local function GetTransferOrigination() --[[ Line: 45 ]]
		return nil
	end
	
	if p1.getTransferOrigination == nil then
		p1.getTransferOrigination = GetTransferOrigination
	end
	local function GetPromptState() --[[ Line: 48 ]]
		-- upvalues: PromptStateModule (upval)
		return PromptStateModule.Unspecified
	end
	
	if p1.getPromptState == nil then
		p1.getPromptState = GetPromptState
	end
	local function GetTransferClientSessionId(): string --[[ Line: 51 ]]
		return ""
	end
	
	if p1.getTransferClientSessionId == nil then
		p1.getTransferClientSessionId = GetTransferClientSessionId
	end
	local function GetBalanceReceivedFromApi(): boolean --[[ Line: 54 ]]
		return false
	end
	
	if p1.getBalanceReceivedFromApi == nil then
		p1.getBalanceReceivedFromApi = GetBalanceReceivedFromApi
	end
	local function GetRobuxBalanceAmount(): number --[[ Line: 57 ]]
		return 0
	end
	
	if p1.getRobuxBalanceAmount == nil then
		p1.getRobuxBalanceAmount = GetRobuxBalanceAmount
	end
	local function GetNetworkImpl() --[[ Line: 60 ]]
		return nil
	end
	
	if p1.getNetworkImpl == nil then
		p1.getNetworkImpl = GetNetworkImpl
	end
	local function TriggerOnPromptOptimisticHide() --[[ Line: 63 ]]
		return nil
	end
	
	if p1.triggerOnPromptOptimisticHide == nil then
		p1.triggerOnPromptOptimisticHide = TriggerOnPromptOptimisticHide
	end
	local function TriggerOnPromptDismissCommitted() --[[ Line: 66 ]]
		return nil
	end
	
	if p1.triggerOnPromptDismissCommitted == nil then
		p1.triggerOnPromptDismissCommitted = TriggerOnPromptDismissCommitted
	end
end