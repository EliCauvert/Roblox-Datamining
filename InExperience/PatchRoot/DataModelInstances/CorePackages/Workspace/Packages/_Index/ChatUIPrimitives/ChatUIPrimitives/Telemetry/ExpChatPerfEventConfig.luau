local TabId = nil
local t = {}
local t1 = {}
local EventTypes = { TTI = "TTI", Interval = "Interval" }
local Events = {
	ChatWindowMountTTI = "ChatWindowMountTTI",
	ChatWindowTabSwitchTTI = "ChatWindowTabSwitchTTI",
	MessageSendToWindowRenderInterval = "MessageSendToWindowRenderInterval",
	MessageReceiveToWindowRenderInterval = "MessageReceiveToWindowRenderInterval",
	ChatWindowScrollInterval = "ChatWindowScrollInterval"
}

return {
	EventTypes = EventTypes,
	Events = Events,
	EventConfig = {
		[Events.ChatWindowMountTTI] = {
			baseName = "ExpChat_ChatWindowMountTTI",
			type = EventTypes.TTI,
			canFinish = function(_): boolean
				return true
			end,
			onStart = function(_) end
		},
		[Events.ChatWindowTabSwitchTTI] = {
			baseName = "ExpChat_ChatWindowTabSwitchTTI",
			type = EventTypes.TTI,
			canFinish = function(p1): boolean
				-- upvalues: TabId (ref)
				return (p1 and p1.tabId) == TabId
			end,
			onStart = function(p1)
				-- upvalues: TabId (ref)
				TabId = if p1 then p1.tabId else nil
			end
		},
		[Events.MessageSendToWindowRenderInterval] = {
			name = "ExpChat_MessageSendToWindowRenderInterval",
			type = EventTypes.Interval,
			intervalMetrics = { "duration", "averageFPS", "longestFrameTime" },
			canStart = function(_): boolean
				-- upvalues: t1 (ref)
				local Timestamp = t1.timestamp or 0
				
				return t1.id == nil or Timestamp + 5 < os.clock()
			end,
			canFinish = function(p1): boolean
				-- upvalues: t1 (ref)
				return p1 and p1.messageId == t1.id
			end,
			onStart = function(p1)
				-- upvalues: t1 (ref)
				if p1 then
					t1 = { id = p1.messageId, timestamp = os.clock() }
				end
			end,
			onFinish = function(_)
				-- upvalues: t1 (ref)
				t1 = {}
			end
		},
		[Events.MessageReceiveToWindowRenderInterval] = {
			name = "ExpChat_MessageReceiveToWindowRenderInterval",
			type = EventTypes.Interval,
			intervalMetrics = { "duration", "averageFPS", "longestFrameTime" },
			canStart = function(_): boolean
				-- upvalues: t (ref)
				local Timestamp = t.timestamp or 0
				
				return t.id == nil or Timestamp + 5 < os.clock()
			end,
			canFinish = function(p1): boolean
				-- upvalues: t (ref)
				return p1 and p1.messageId == t.id
			end,
			onStart = function(p1)
				-- upvalues: t (ref)
				if p1 then
					t = { id = p1.messageId, timestamp = os.clock() }
				end
			end,
			onFinish = function(_)
				-- upvalues: t (ref)
				t = {}
			end
		},
		[Events.ChatWindowScrollInterval] = {
			name = "ExpChat_ChatWindowScrollInterval",
			type = EventTypes.Interval,
			intervalMetrics = { "averageFPS", "longestFrameTime" },
			canStart = function(): boolean
				return true
			end,
			canFinish = function(): boolean
				return true
			end,
			onStart = function() end,
			onFinish = function() end
		}
	}
}