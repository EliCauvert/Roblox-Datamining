local parent = script.Parent.Parent
local reactModule = require(parent.React)
local _ = require(parent.Signals)
local _ = require(script.Parent.ChatApp)
local var1 = reactModule.createContext(nil)

return {
	Context = var1,
	Provider = function(p0) --[[ line: 20 ]]
		-- upvalues: reactModule (ref), var1 (ref)
		return reactModule.createElement(var1.Provider, {
			value = reactModule.useMemo(function() --[[ line: 22 ]]
				-- upvalues: p0 (ref)
				return {
					write = function(p1) --[[ line: 24 ]]
						-- upvalues: p0 (copy)
						p0.setMessages(function(p2) --[[ line: 25 ]]
							-- upvalues: p1 (ref)
							for i, v in p2 do
								if v.messageId == p1.messageId then
									local cloned = table.clone(p2)
									cloned[i] = p1
									
									return cloned
								end
							end
							local cloned = table.clone(p2)
							table.insert(cloned, p1)
							
							return cloned
						end)
					end,
					remove = function(p3) --[[ line: 38 ]]
						-- upvalues: p0 (copy)
						p0.setMessages(function(p4) --[[ line: 39 ]]
							-- upvalues: p3 (ref)
							local t = {}
							
							for i, v in p4 do
								if v.messageId ~= p3 then
									table.insert(t, v)
								end
							end
							return t
						end)
					end
				}
			end, { p0.setMessages })
		}, p0.children)
	end,
	useMessageWriter = function() --[[ line: 55 ]]
		-- upvalues: reactModule (ref), var1 (ref)
		return reactModule.useContext(var1)
	end
}