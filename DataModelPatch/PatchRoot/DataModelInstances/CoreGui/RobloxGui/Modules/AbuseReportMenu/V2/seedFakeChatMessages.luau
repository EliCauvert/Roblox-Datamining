local ExpChatSharedModule = require(game:GetService("CorePackages").Workspace.Packages.ExpChatShared)
local TextChatMessages = {
	{
		PrefixText = "<font color=\"#b38bf5\">test_user_ax7:</font>",
		Text = "lol you fell off the bridge again",
		TextChannel = { Name = "RBXGeneral" },
		TextSource = { UserId = 1001 }
	},
	{
		PrefixText = "<font color=\"#55ffab\">test_user_brimstone42:</font>",
		Text = "stop following me around the map",
		TextChannel = { Name = "RBXWhisper:1001_1002" },
		TextSource = { UserId = 1002 }
	},
	{
		PrefixText = "<font color=\"#55ffab\">test_user_brimstone42:</font>",
		Text = "you are the worst player on the server",
		TextChannel = { Name = "RBXGeneral" },
		TextSource = { UserId = 1002 }
	},
	{
		PrefixText = "<font color=\"#b38bf5\">test_user_ax7:</font>",
		Text = "haha you cant even beat level one",
		TextChannel = { Name = "RBXGeneral" },
		TextSource = { UserId = 1001 }
	},
	{
		PrefixText = "<font color=\"#55ffab\">test_user_brimstone42:</font>",
		Text = "nobody wants to play with you just leave",
		TextChannel = { Name = "RBXWhisper:1001_1002" },
		TextSource = { UserId = 1002 }
	},
	{
		PrefixText = "<font color=\"#619bff\">test_user_c9:</font>",
		Text = "anyone want to trade gems?",
		TextChannel = { Name = "RBXGeneral" },
		TextSource = { UserId = 1003 }
	},
	{
		PrefixText = "<font color=\"#b38bf5\">test_user_ax7:</font>",
		Text = "your outfit looks so silly",
		TextChannel = { Name = "RBXGeneral" },
		TextSource = { UserId = 1001 }
	},
	{
		PrefixText = "<font color=\"#619bff\">test_user_c9:</font>",
		Text = "hey can you stop being mean to everyone",
		TextChannel = { Name = "RBXWhisper:1003_1001" },
		TextSource = { UserId = 1003 }
	},
	{
		PrefixText = "<font color=\"#55ffab\">test_user_brimstone42:</font>",
		Text = "everyone ignore test_user_ax7 they keep being rude",
		TextChannel = { Name = "RBXGeneral" },
		TextSource = { UserId = 1002 }
	},
	{
		PrefixText = "<font color=\"#b38bf5\">test_user_ax7:</font>",
		Text = "you are so slow at this game just give up",
		TextChannel = { Name = "RBXGeneral" },
		TextSource = { UserId = 1001 }
	},
	{
		PrefixText = "<font color=\"#b38bf5\">test_user_ax7:</font>",
		Text = "why are you even playing this",
		TextChannel = { Name = "RBXWhisper:1001_1002" },
		TextSource = { UserId = 1001 }
	},
	{
		PrefixText = "<font color=\"#619bff\">test_user_c9:</font>",
		Text = "this map is really fun though",
		TextChannel = { Name = "RBXGeneral" },
		TextSource = { UserId = 1003 }
	},
	{
		PrefixText = "<font color=\"#55ffab\">test_user_brimstone42:</font>",
		Text = "good game everyone except the mean ones",
		TextChannel = { Name = "RBXGeneral" },
		TextSource = { UserId = 1002 }
	},
	{
		PrefixText = "<font color=\"#b38bf5\">test_user_ax7:</font>",
		Text = "i'm reporting you for harassment",
		TextChannel = { Name = "RBXGeneral" },
		TextSource = { UserId = 1001 }
	},
	{
		PrefixText = "<font color=\"#55ffab\">test_user_brimstone42:</font>",
		Text = "go ahead nobody cares",
		TextChannel = { Name = "RBXWhisper:1001_1002" },
		TextSource = { UserId = 1002 }
	},
	{
		PrefixText = "<font color=\"#619bff\">test_user_c9:</font>",
		Text = "can we all just play nice please",
		TextChannel = { Name = "RBXGeneral" },
		TextSource = { UserId = 1003 }
	},
	{
		PrefixText = "<font color=\"#b38bf5\">test_user_ax7:</font>",
		Text = "you're terrible at building",
		TextChannel = { Name = "RBXGeneral" },
		TextSource = { UserId = 1001 }
	},
	{
		PrefixText = "<font color=\"#55ffab\">test_user_brimstone42:</font>",
		Text = "at least i don't spam chat",
		TextChannel = { Name = "RBXGeneral" },
		TextSource = { UserId = 1002 }
	},
	{
		PrefixText = "<font color=\"#619bff\">test_user_c9:</font>",
		Text = "let's focus on the objective",
		TextChannel = { Name = "RBXGeneral" },
		TextSource = { UserId = 1003 }
	},
	{
		PrefixText = "<font color=\"#b38bf5\">test_user_ax7:</font>",
		Text = "you're just jealous of my skills",
		TextChannel = { Name = "RBXWhisper:1001_1003" },
		TextSource = { UserId = 1001 }
	},
	{
		PrefixText = "<font color=\"#55ffab\">test_user_brimstone42:</font>",
		Text = "thanks for the help earlier c9",
		TextChannel = { Name = "RBXWhisper:1002_1003" },
		TextSource = { UserId = 1002 }
	},
	{
		PrefixText = "<font color=\"#619bff\">test_user_c9:</font>",
		Text = "no problem, happy to help",
		TextChannel = { Name = "RBXWhisper:1002_1003" },
		TextSource = { UserId = 1003 }
	}
}

local function dispatchFakeMessages(Store)
	-- upvalues: TextChatMessages (copy)
	Store:dispatch({ type = "ChatPrivacySettingsReceived", canUserChat = true })
	
	for i, textChatMessage in ipairs(TextChatMessages) do
		Store:dispatch({
			type = "IncomingMessageReceived",
			isSenderLocalPlayer = false,
			canUserChat = true,
			textChatMessage = {
				PrefixText = textChatMessage.PrefixText,
				Text = textChatMessage.Text,
				TextChannel = textChatMessage.TextChannel,
				TextSource = textChatMessage.TextSource,
				MessageId = "fake-seed-" .. tostring(i),
				Status = Enum.TextChatMessageStatus.Success,
				Timestamp = DateTime.now()
			}
		})
	end
end

return function()
	-- upvalues: ExpChatSharedModule (copy), dispatchFakeMessages (copy)
	task.spawn(function()
		-- upvalues: ExpChatSharedModule (upval), dispatchFakeMessages (upval)
		local Store = nil
		for _ = 1, 10 do
			Store = ExpChatSharedModule.context.store
			
			if Store then
				dispatchFakeMessages(Store)
				
				return
			end
			task.wait(1)
		end
		warn("[seedFakeChatMessages] ExpChatShared.context.store never became available after " .. 10 .. "s")
	end)
end