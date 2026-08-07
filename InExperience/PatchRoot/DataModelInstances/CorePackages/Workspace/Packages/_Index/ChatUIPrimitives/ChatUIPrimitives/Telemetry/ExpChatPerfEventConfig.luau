local fFlagExpChatScrollPerfTrackingModule = require(script:FindFirstAncestor("ChatUIPrimitives").Flags.FFlagExpChatScrollPerfTracking)
local var1 = nil
local t = {}
local t_1 = {}
local t_2 = { TTI = "TTI", Interval = "Interval" }
local t_3 = {
	ChatWindowMountTTI = "ChatWindowMountTTI",
	ChatWindowTabSwitchTTI = "ChatWindowTabSwitchTTI",
	MessageSendToWindowRenderInterval = "MessageSendToWindowRenderInterval",
	MessageReceiveToWindowRenderInterval = "MessageReceiveToWindowRenderInterval",
	ChatWindowScrollInterval = "ChatWindowScrollInterval"
}
local t_4 = {
	[t_3.ChatWindowMountTTI] = {
		baseName = "ExpChat_ChatWindowMountTTI",
		type = t_2.TTI,
		canFinish = function(_) --[[ line: 59 ]]
			return true
		end,
		onStart = function(_) --[[ line: 62 ]] end
	},
	[t_3.ChatWindowTabSwitchTTI] = {
		baseName = "ExpChat_ChatWindowTabSwitchTTI",
		type = t_2.TTI,
		canFinish = function(p0) --[[ line: 67 ]]
			-- upvalues: var1 (write)
			return (p0 and p0.tabId) == var1
		end,
		onStart = function(p1) --[[ line: 71 ]]
			-- upvalues: var1 (write)
			var1 = if p1 then p1.tabId else nil
		end
	},
	[t_3.MessageSendToWindowRenderInterval] = {
		name = "ExpChat_MessageSendToWindowRenderInterval",
		type = t_2.Interval,
		intervalMetrics = { "duration", "averageFPS", "longestFrameTime" },
		canStart = function(_) --[[ line: 79 ]]
			-- upvalues: t_1 (write)
			return if t_1.id ~= nil then (t_1.timestamp or 0) + 5 < os.clock() else true
		end,
		canFinish = function(p2) --[[ line: 83 ]]
			-- upvalues: t_1 (write)
			return p2 and p2.messageId == t_1.id
		end,
		onStart = function(p3) --[[ line: 86 ]]
			-- upvalues: t_1 (write)
			if p3 then
				t_1 = { id = p3.messageId, timestamp = os.clock() }
			end
		end,
		onFinish = function(_) --[[ line: 94 ]]
			-- upvalues: t_1 (write)
			t_1 = {}
		end
	},
	[t_3.MessageReceiveToWindowRenderInterval] = {
		name = "ExpChat_MessageReceiveToWindowRenderInterval",
		type = t_2.Interval,
		intervalMetrics = { "duration", "averageFPS", "longestFrameTime" },
		canStart = function(_) --[[ line: 102 ]]
			-- upvalues: t (write)
			return if t.id ~= nil then (t.timestamp or 0) + 5 < os.clock() else true
		end,
		canFinish = function(p4) --[[ line: 106 ]]
			-- upvalues: t (write)
			return p4 and p4.messageId == t.id
		end,
		onStart = function(p5) --[[ line: 109 ]]
			-- upvalues: t (write)
			if p5 then
				t = { id = p5.messageId, timestamp = os.clock() }
			end
		end,
		onFinish = function(_) --[[ line: 117 ]]
			-- upvalues: t (write)
			t = {}
		end
	}
}

if fFlagExpChatScrollPerfTrackingModule then
	t_4[t_3.ChatWindowScrollInterval] = {
		name = "ExpChat_ChatWindowScrollInterval",
		type = t_2.Interval,
		intervalMetrics = { "averageFPS", "longestFrameTime" },
		canStart = function() --[[ line: 128 ]]
			return true
		end,
		canFinish = function() --[[ line: 131 ]]
			return true
		end,
		onStart = function() --[[ line: 134 ]] end,
		onFinish = function() --[[ line: 135 ]] end
	}
end
return { EventTypes = t_2, Events = t_3, EventConfig = t_4 }