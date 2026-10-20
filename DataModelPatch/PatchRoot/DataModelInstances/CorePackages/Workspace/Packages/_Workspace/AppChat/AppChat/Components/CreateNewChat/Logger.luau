local RoactChatCreateNewChat = require(script:FindFirstAncestor("AppChat").Logger):new("RoactChat.CreateNewChat")
RoactChatCreateNewChat:setContext({ screen = "CreateNewChat" })

return RoactChatCreateNewChat