local createChatSessionModule = require(script.Parent.Parent.createChatSession)
local _ = require(script.Parent.Parent.ChatSession.sessionDeps)
local _ = require(script.Parent.Parent.types)

return {
	createSessionRegistry = function(p0)
		-- upvalues: createChatSessionModule (ref)
		local t = {}
		local t_1 = {}
		local t_2 = {}
		
		local function _(p1, p2, p3)
			return if typeof(p3) == "string" and p3 ~= "" and (p1 == nil or p2 == nil) then `session:{p3}` elseif p1 == nil or p2 == nil then "anonymous" else `{p1}:{p2}`
		end
		
		return {
			getSessionForProject = function(p4, p5, p6)
				-- upvalues: t_1 (ref), t (ref), t_2 (ref), createChatSessionModule (copy), p0 (ref)
				local var4 = if typeof(p6) == "string" and p6 ~= "" and (p4 == nil or p5 == nil) then `session:{p6}` elseif p4 == nil or p5 == nil then "anonymous" else `{p4}:{p5}`
				
				if typeof(p6) == "string" and p6 ~= "" then
					local var5 = t_1[p6]
					
					if var5 ~= nil and var5.getCasSessionId() == p6 then
						var5.universeId = p4 or var5.universeId
						var5.placeId = p5 or var5.placeId
						t[var4] = var5
						
						return var5
					end
				end
				local var6 = t[var4]
				
				if var6 == nil then
					local var9 = nil
					local var10 = createChatSessionModule({
						initialize = p0.initialize,
						sessionNew = p0.sessionNew,
						sessionLoad = p0.sessionLoad,
						sessionPrompt = p0.sessionPrompt,
						ingestSessionHistory = p0.ingestSessionHistory,
						submitToolResult = p0.submitToolResult,
						getActiveTurnHandle = p0.getActiveTurnHandle,
						onCasSessionIdChanged = function(p7)
							-- upvalues: var9 (write), t_2 (copy), t_1 (copy)
							if var9 ~= nil then
								local var13 = var9
								
								if typeof(p7) == "string" then
									if p7 == "" then return end
									local var14 = t_2[var13]
									
									if var14 ~= nil and var14 ~= p7 and t_1[var14] == var13 then
										t_1[var14] = nil
									end
									local var15 = t_1[p7]
									
									if var15 ~= nil and var15 ~= var13 then
										t_2[var15] = nil
									end
									t_1[p7] = var13
									t_2[var13] = p7
								end
							end
						end
					}, p4, p5, p6)
					var9 = var10
					t[var4] = var10
					
					if typeof(p6) == "string" and p6 ~= "" then
						local var11 = t_2[var10]
						
						if var11 ~= nil and var11 ~= p6 and t_1[var11] == var10 then
							t_1[var11] = nil
						end
						local var12 = t_1[p6]
						
						if var12 ~= nil and var12 ~= var10 then
							t_2[var12] = nil
						end
						t_1[p6] = var10
						t_2[var10] = p6
					end
					return var10
				elseif typeof(p6) ~= "string" or p6 == "" then
					return var6
				end
				var6.setCasSessionId(p6)
				
				if typeof(p6) == "string" then
					if p6 == "" then
						return var6
					end
					local var7 = t_2[var6]
					
					if var7 ~= nil and var7 ~= p6 and t_1[var7] == var6 then
						t_1[var7] = nil
					end
					local var8 = t_1[p6]
					
					if var8 ~= nil and var8 ~= var6 then
						t_2[var8] = nil
					end
					t_1[p6] = var6
					t_2[var6] = p6
				end
				return var6
			end,
			registerCasSession = function(p8, p9)
				-- upvalues: t_2 (ref), t_1 (ref)
				if typeof(p9) ~= "string" or p9 == "" then return end
				local var16 = t_2[p8]
				
				if var16 ~= nil and var16 ~= p9 and t_1[var16] == p8 then
					t_1[var16] = nil
				end
				local var17 = t_1[p9]
				
				if var17 ~= nil and var17 ~= p8 then
					t_2[var17] = nil
				end
				t_1[p9] = p8
				t_2[p8] = p9
			end,
			getSessionByCasSessionId = function(p10)
				-- upvalues: t_1 (ref)
				local var18 = t_1[p10]
				
				if var18 == nil or var18.getCasSessionId() == p10 then
					return var18
				end
				t_1[p10] = nil
				
				return nil
			end
		}
	end
}