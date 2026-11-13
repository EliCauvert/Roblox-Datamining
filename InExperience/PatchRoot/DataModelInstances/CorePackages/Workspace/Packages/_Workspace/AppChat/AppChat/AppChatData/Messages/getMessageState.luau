local AppChat = script:FindFirstAncestor("AppChat")
local EnumsModule = require(AppChat.MessageData.Enums)
local _ = require(AppChat.AppChatData.Types)
local MessageStatus = EnumsModule.MessageStatus
local MessageVisibility = EnumsModule.MessageVisibility

return function(p1)
	-- upvalues: MessageStatus (copy), MessageVisibility (copy)
	return if p1.status == MessageStatus.Pending then { deliveryState = "Pending", visibility = "Visible" } elseif p1.status == MessageStatus.Failed then { deliveryState = "Failed", visibility = "Visible" } elseif p1.status == MessageStatus.Moderated then { deliveryState = "Rejected", visibility = "Moderated" } elseif p1.status == MessageStatus.Hidden or p1.visibility == MessageVisibility.Hidden then { deliveryState = "Sent", visibility = "Hidden" } else { deliveryState = "Sent", visibility = "Visible" }
end