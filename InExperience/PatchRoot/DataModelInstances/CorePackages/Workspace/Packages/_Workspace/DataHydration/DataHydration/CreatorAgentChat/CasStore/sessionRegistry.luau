local createChatSessionModule = require(script.Parent.Parent.createChatSession)
local _ = require(script.Parent.Parent.ChatSession.sessionDeps)
local _ = require(script.Parent.Parent.types)

return {
	createSessionRegistry = function(p0) --[[ line: 21 ]]
		-- upvalues: createChatSessionModule (ref)
		local t = {}
		local t_1 = {}
		
		local function _(p1, p2, p3) --[[ line: 32 | named "projectKey" ]]
			return if typeof(p3) == "string" and p3 ~= "" and (p1 == nil or p2 == nil) then `session:{p3}` elseif p1 == nil or p2 == nil then "anonymous" else `{p1}:{p2}`
		end
		
		return {
			getSessionForProject = function(p4, p5, p6) --[[ line: 42 ]]
				-- upvalues: t (ref), t_1 (ref), createChatSessionModule (copy), p0 (ref)
				local var3 = if typeof(p6) == "string" and p6 ~= "" and (p4 == nil or p5 == nil) then `session:{p6}` elseif p4 == nil or p5 == nil then "anonymous" else `{p4}:{p5}`
				local var4 = t[var3]
				
				if var4 == nil then
					local var5 = nil
					local var6 = createChatSessionModule({
						initialize = p0.initialize,
						sessionNew = p0.sessionNew,
						sessionLoad = p0.sessionLoad,
						sessionReadTasks = p0.sessionReadTasks,
						sessionPrompt = p0.sessionPrompt,
						ingestSessionHistory = p0.ingestSessionHistory,
						submitToolResult = p0.submitToolResult,
						getActiveTurnHandle = p0.getActiveTurnHandle,
						onCasSessionIdChanged = function(p7) --[[ line: 62 ]]
							-- upvalues: var5 (write), t_1 (copy)
							if var5 ~= nil then
								local var7 = var5
								
								if typeof(p7) == "string" then
									if p7 == "" then return end
									t_1[p7] = var7
								end
							end
						end
					}, p4, p5, p6)
					var5 = var6
					t[var3] = var6
					
					if typeof(p6) == "string" and p6 ~= "" then
						t_1[p6] = var6
					end
					return var6
				elseif typeof(p6) == "string" and p6 ~= "" then
					var4.setCasSessionId(p6)
					
					if typeof(p6) == "string" then
						if p6 == "" then
							return var4
						end
						t_1[p6] = var4
					end
				end
				return var4
			end,
			registerCasSession = function(p8, p9) --[[ line: 25 ]]
				-- upvalues: t_1 (ref)
				if typeof(p9) == "string" and p9 ~= "" then
					t_1[p9] = p8
					
					return
				end
			end,
			getSessionByCasSessionId = function(p10) --[[ line: 77 ]]
				-- upvalues: t_1 (ref)
				return t_1[p10]
			end
		}
	end
}