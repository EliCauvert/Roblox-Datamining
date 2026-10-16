local CreateChatSessionModule = require(script.Parent.Parent.createChatSession)
local _ = require(script.Parent.Parent.ChatSession.sessionDeps)
local _ = require(script.Parent.Parent.types)

return {
	createSessionRegistry = function(p1) --[[ Line: 20 ]]
		-- upvalues: CreateChatSessionModule (copy)
		local t = {}
		local Keys = {}
		local Keys1 = {}
		
		local function _(p2, p3, p4): string --[[ Line: 45 | Named "projectKey" ]]
			return if typeof(p4) == "string" and p4 ~= "" and (p2 == nil or p3 == nil) then `session:{p4}` elseif p2 == nil or p3 == nil then "anonymous" else `{p2}:{p3}`
		end
		
		return {
			getSessionForProject = function(p2, p3, Key) --[[ Line: 55 ]]
				-- upvalues: Keys (copy), t (copy), Keys1 (copy), CreateChatSessionModule (upval), p1 (copy)
				local SessionName: string = if typeof(Key) == "string" and Key ~= "" and (p2 == nil or p3 == nil) then `session:{Key}` elseif p2 == nil or p3 == nil then "anonymous" else `{p2}:{p3}`
				
				if typeof(Key) == "string" and Key ~= "" then
					local Key1 = Keys[Key]
					
					if Key1 ~= nil and Key1.getCasSessionId() == Key then
						Key1.universeId = p2 or Key1.universeId
						Key1.placeId = p3 or Key1.placeId
						t[SessionName] = Key1
						
						return Key1
					end
				end
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
						onCasSessionIdChanged = function(Key) --[[ Line: 85 ]]
							-- upvalues: v1 (ref), Keys1 (upval), Keys (upval)
							if v1 ~= nil then
								local v2 = v1
								
								if typeof(Key) == "string" then
									if Key == "" then return end
									local Key1 = Keys1[v2]
									
									if Key1 ~= nil and Key1 ~= Key and Keys[Key1] == v2 then
										Keys[Key1] = nil
									end
									local Key2 = Keys[Key]
									
									if Key2 ~= nil and Key2 ~= v2 then
										Keys1[Key2] = nil
									end
									Keys[Key] = v2
									Keys1[v2] = Key
								end
							end
						end
					}, p2, p3, Key)
					v1 = ChatSessionModule
					t[SessionName] = ChatSessionModule
					
					if typeof(Key) == "string" and Key ~= "" then
						local Key4 = Keys1[ChatSessionModule]
						
						if Key4 ~= nil and Key4 ~= Key and Keys[Key4] == ChatSessionModule then
							Keys[Key4] = nil
						end
						local Key5 = Keys[Key]
						
						if Key5 ~= nil and Key5 ~= ChatSessionModule then
							Keys1[Key5] = nil
						end
						Keys[Key] = ChatSessionModule
						Keys1[ChatSessionModule] = Key
					end
					return ChatSessionModule
				else
					if typeof(Key) ~= "string" or Key == "" then
						return Entry
					end
					Entry.setCasSessionId(Key)
					
					if typeof(Key) == "string" then
						if Key == "" then
							return Entry
						end
						local Key2 = Keys1[Entry]
						
						if Key2 ~= nil and Key2 ~= Key and Keys[Key2] == Entry then
							Keys[Key2] = nil
						end
						local Key3 = Keys[Key]
						
						if Key3 ~= nil and Key3 ~= Entry then
							Keys1[Key3] = nil
						end
						Keys[Key] = Entry
						Keys1[Entry] = Key
					end
					return Entry
				end
			end,
			registerCasSession = function(Key, Key1) --[[ Line: 25 ]]
				-- upvalues: Keys1 (copy), Keys (copy)
				if typeof(Key1) ~= "string" or Key1 == "" then return end
				local Key2 = Keys1[Key]
				
				if Key2 ~= nil and Key2 ~= Key1 and Keys[Key2] == Key then
					Keys[Key2] = nil
				end
				local Key3 = Keys[Key1]
				
				if Key3 ~= nil and Key3 ~= Key then
					Keys1[Key3] = nil
				end
				Keys[Key1] = Key
				Keys1[Key] = Key1
			end,
			getSessionByCasSessionId = function(CasSessionId) --[[ Line: 100 ]]
				-- upvalues: Keys (copy)
				local Key = Keys[CasSessionId]
				
				if Key == nil or Key.getCasSessionId() == CasSessionId then
					return Key
				else
					Keys[CasSessionId] = nil
					
					return nil
				end
			end
		}
	end
}