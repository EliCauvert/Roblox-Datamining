local RoactChatChatConversation = require(script:FindFirstAncestor("AppChat").Logger):new("RoactChat.ChatConversation")
RoactChatChatConversation:setContext({ screen = "ChatConversation" })

return RoactChatChatConversation