local var0 = nil
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

return {
	EventTypes = t_2,
	Events = t_3,
	EventConfig = {
		[t_3.ChatWindowMountTTI] = {
			baseName = "ExpChat_ChatWindowMountTTI",
			type = t_2.TTI,
			canFinish = function(_)
				return true
			end,
			onStart = function(_) end
		},
		[t_3.ChatWindowTabSwitchTTI] = {
			baseName = "ExpChat_ChatWindowTabSwitchTTI",
			type = t_2.TTI,
			canFinish = function(p0)
				-- upvalues: var0 (write)
				return (p0 and p0.tabId) == var0
			end,
			onStart = function(p1)
				-- upvalues: var0 (write)
				var0 = if p1 then p1.tabId else nil
			end
		},
		[t_3.MessageSendToWindowRenderInterval] = {
			name = "ExpChat_MessageSendToWindowRenderInterval",
			type = t_2.Interval,
			intervalMetrics = { "duration", "averageFPS", "longestFrameTime" },
			canStart = function(_)
				-- upvalues: t_1 (write)
				return if t_1.id ~= nil then (t_1.timestamp or 0) + 5 < os.clock() else true
			end,
			canFinish = function(p2)
				-- upvalues: t_1 (write)
				return p2 and p2.messageId == t_1.id
			end,
			onStart = function(p3)
				-- upvalues: t_1 (write)
				if p3 then
					t_1 = { id = p3.messageId, timestamp = os.clock() }
				end
			end,
			onFinish = function(_)
				-- upvalues: t_1 (write)
				t_1 = {}
			end
		},
		[t_3.MessageReceiveToWindowRenderInterval] = {
			name = "ExpChat_MessageReceiveToWindowRenderInterval",
			type = t_2.Interval,
			intervalMetrics = { "duration", "averageFPS", "longestFrameTime" },
			canStart = function(_)
				-- upvalues: t (write)
				return if t.id ~= nil then (t.timestamp or 0) + 5 < os.clock() else true
			end,
			canFinish = function(p4)
				-- upvalues: t (write)
				return p4 and p4.messageId == t.id
			end,
			onStart = function(p5)
				-- upvalues: t (write)
				if p5 then
					t = { id = p5.messageId, timestamp = os.clock() }
				end
			end,
			onFinish = function(_)
				-- upvalues: t (write)
				t = {}
			end
		},
		[t_3.ChatWindowScrollInterval] = {
			name = "ExpChat_ChatWindowScrollInterval",
			type = t_2.Interval,
			intervalMetrics = { "averageFPS", "longestFrameTime" },
			canStart = function()
				return true
			end,
			canFinish = function()
				return true
			end,
			onStart = function() end,
			onFinish = function() end
		}
	}
}