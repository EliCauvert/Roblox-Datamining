local CreateChatSessionModule = require(script.Parent.Parent.createChatSession)
local _ = require(script.Parent.Parent.ChatSession.sessionDeps)
local _ = require(script.Parent.Parent.types)

return {
	createSessionRegistry = function(p1)
		-- upvalues: CreateChatSessionModule (copy)
		local t = {}
		local t1 = {}
		
		local function _(p2, p3, p4): string
			return if typeof(p4) == "string" and p4 ~= "" and (p2 == nil or p3 == nil) then `session:{p4}` elseif p2 == nil or p3 == nil then "anonymous" else `{p2}:{p3}`
		end
		
		return {
			getSessionForProject = function(p2, p3, Key)
				-- upvalues: t (copy), t1 (copy), CreateChatSessionModule (upval), p1 (copy)
				local SessionName: string = if typeof(Key) == "string" and Key ~= "" and (p2 == nil or p3 == nil) then `session:{Key}` elseif p2 == nil or p3 == nil then "anonymous" else `{p2}:{p3}`
				local Entry = t[SessionName]
				
				if Entry == nil then
					local v1 = nil
					local ChatSessionModule = CreateChatSessionModule({
						initialize = p1.initialize,
						sessionNew = p1.sessionNew,
						sessionLoad = p1.sessionLoad,
						sessionPrompt = p1.sessionPrompt,
						ingestSessionHistory = p1.ingestSessionHistory,
						submitToolResult = p1.submitToolResult,
						getActiveTurnHandle = p1.getActiveTurnHandle,
						onCasSessionIdChanged = function(Key)
							-- upvalues: v1 (ref), t1 (upval)
							if v1 ~= nil then
								local v2 = v1
								
								if typeof(Key) == "string" then
									if Key == "" then return end
									t1[Key] = v2
								end
							end
						end
					}, p2, p3, Key)
					v1 = ChatSessionModule
					t[SessionName] = ChatSessionModule
					
					if typeof(Key) == "string" and Key ~= "" then
						t1[Key] = ChatSessionModule
					end
					return ChatSessionModule
				else
					if typeof(Key) == "string" and Key ~= "" then
						Entry.setCasSessionId(Key)
						
						if typeof(Key) == "string" then
							if Key == "" then
								return Entry
							end
							t1[Key] = Entry
						end
					end
					return Entry
				end
			end,
			registerCasSession = function(p2, Key)
				-- upvalues: t1 (copy)
				if typeof(Key) == "string" and Key ~= "" then
					t1[Key] = p2
					
					return
				end
			end,
			getSessionByCasSessionId = function(p2)
				-- upvalues: t1 (copy)
				return t1[p2]
			end
		}
	end
}