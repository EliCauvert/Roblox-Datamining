local createChatSessionModule = require(script.Parent.Parent.createChatSession)
local _ = require(script.Parent.Parent.ChatSession.sessionDeps)
local _ = require(script.Parent.Parent.types)

return {
	createSessionRegistry = function(p1)
		-- upvalues: createChatSessionModule (ref)
		local t = {}
		local t_1 = {}
		local t_2 = {}
		
		local function _(p2, p3, p4)
			return if typeof(p4) == "string" and p4 ~= "" and (p2 == nil or p3 == nil) then `session:{p4}` elseif p2 == nil or p3 == nil then "anonymous" else `{p2}:{p3}`
		end
		
		return {
			getSessionForProject = function(p2, p3, p4)
				-- upvalues: t_1 (ref), t (ref), t_2 (ref), createChatSessionModule (copy), p1 (ref)
				local var1 = if typeof(p4) == "string" and p4 ~= "" and (p2 == nil or p3 == nil) then `session:{p4}` elseif p2 == nil or p3 == nil then "anonymous" else `{p2}:{p3}`
				
				if typeof(p4) == "string" and p4 ~= "" then
					local var2 = t_1[p4]
					
					if var2 ~= nil and var2.getCasSessionId() == p4 then
						var2.universeId = p2 or var2.universeId
						var2.placeId = p3 or var2.placeId
						t[var1] = var2
						
						return var2
					end
				end
				local var3 = t[var1]
				
				if var3 == nil then
					local var4 = nil
					local var5 = createChatSessionModule({
						initialize = p1.initialize,
						sessionNew = p1.sessionNew,
						sessionLoad = p1.sessionLoad,
						sessionPrompt = p1.sessionPrompt,
						ingestSessionHistory = p1.ingestSessionHistory,
						submitToolResult = p1.submitToolResult,
						getActiveTurnHandle = p1.getActiveTurnHandle,
						onCasSessionIdChanged = function(p5)
							-- upvalues: var4 (write), t_2 (copy), t_1 (copy)
							if var4 ~= nil then
								local var6 = var4
								
								if typeof(p5) == "string" then
									if p5 == "" then return end
									local var7 = t_2[var6]
									
									if var7 ~= nil and var7 ~= p5 and t_1[var7] == var6 then
										t_1[var7] = nil
									end
									local var8 = t_1[p5]
									
									if var8 ~= nil and var8 ~= var6 then
										t_2[var8] = nil
									end
									t_1[p5] = var6
									t_2[var6] = p5
								end
							end
						end
					}, p2, p3, p4)
					var4 = var5
					t[var1] = var5
					
					if typeof(p4) == "string" and p4 ~= "" then
						local var6 = t_2[var5]
						
						if var6 ~= nil and var6 ~= p4 and t_1[var6] == var5 then
							t_1[var6] = nil
						end
						local var7 = t_1[p4]
						
						if var7 ~= nil and var7 ~= var5 then
							t_2[var7] = nil
						end
						t_1[p4] = var5
						t_2[var5] = p4
					end
					return var5
				elseif typeof(p4) ~= "string" or p4 == "" then
					return var3
				end
				var3.setCasSessionId(p4)
				
				if typeof(p4) == "string" then
					if p4 == "" then
						return var3
					end
					local var8 = t_2[var3]
					
					if var8 ~= nil and var8 ~= p4 and t_1[var8] == var3 then
						t_1[var8] = nil
					end
					local var9 = t_1[p4]
					
					if var9 ~= nil and var9 ~= var3 then
						t_2[var9] = nil
					end
					t_1[p4] = var3
					t_2[var3] = p4
				end
				return var3
			end,
			registerCasSession = function(p2, p3)
				-- upvalues: t_2 (ref), t_1 (ref)
				if typeof(p3) ~= "string" or p3 == "" then return end
				local var1 = t_2[p2]
				
				if var1 ~= nil and var1 ~= p3 and t_1[var1] == p2 then
					t_1[var1] = nil
				end
				local var2 = t_1[p3]
				
				if var2 ~= nil and var2 ~= p2 then
					t_2[var2] = nil
				end
				t_1[p3] = p2
				t_2[p2] = p3
			end,
			getSessionByCasSessionId = function(p2)
				-- upvalues: t_1 (ref)
				local var1 = t_1[p2]
				
				if var1 == nil or var1.getCasSessionId() == p2 then
					return var1
				end
				t_1[p2] = nil
				
				return nil
			end
		}
	end
}