local parent = script.Parent.Parent
local reactModule = require(parent.Parent.React)
local presenceChildModule = require(script.Parent.PresenceChild)
local presenceStateModule = require(parent.Enums.PresenceState)

local function _(p0, p1) --[[ line: 55 | named "getCompositeKey" ]]
	return if typeof(p1) == "table" and p1.props and p1.props.presenceId then string.format("%s:%s", p0, tostring(p1.props.presenceId)) else p0
end

return function(p2) --[[ line: 63 | named "AnimatePresence" ]]
	-- upvalues: reactModule (ref), presenceStateModule (ref), presenceChildModule (ref)
	local children = p2.children
	local var3 = if p2.childData ~= nil then nil else p2.childData
	local var4 = if p2.onExitComplete ~= nil then nil else p2.onExitComplete
	local var5, var6 = reactModule.useState({})
	local var7 = reactModule.useRef({})
	reactModule.useEffect(function() --[[ line: 73 ]]
		-- upvalues: children (ref), presenceStateModule (copy), var5 (ref), var6 (ref), var7 (ref)
		local t = {}
		
		if children ~= nil and typeof(children) == "table" then
			for i, v in pairs(children) do
				if typeof(v) == "table" and v.type ~= nil then
					t[if typeof(v) == "table" and v.props and v.props.presenceId then string.format("%s:%s", i, tostring(v.props.presenceId)) else i] = {
						type = presenceStateModule.Entering,
						component = v,
						dictionaryKey = i
					}
				end
			end
		end
		local var11
		for i, v in pairs(var5) do
			var11 = false
			
			if children ~= nil and typeof(children) == "table" then
				for i_1, v_2 in pairs(children) do
					if typeof(v_2) == "table" and v_2.type ~= nil then
						if (if typeof(v_2) == "table" and v_2.props and v_2.props.presenceId then string.format("%s:%s", i_1, tostring(v_2.props.presenceId)) else i_1) == i then
							var11 = true
							break
						end
					end
				end
			end
			if not var11 and v.isPresent then
				t[i] = {
					type = presenceStateModule.Exiting,
					component = v.component,
					dictionaryKey = v.dictionaryKey
				}
			end
		end
		if next(t) ~= nil then
			var6(function(p3) --[[ line: 120 ]]
				-- upvalues: t (ref), presenceStateModule (copy), var7 (copy)
				local cloned = table.clone(p3)
				
				for i, v in pairs(t) do
					if v.type == presenceStateModule.Entering then
						cloned[i] = {
							isPresent = true,
							safeToRemove = false,
							component = v.component,
							dictionaryKey = v.dictionaryKey
						}
					elseif v.type == presenceStateModule.Exiting and cloned[i] and cloned[i].isPresent then
						cloned[i] = {
							isPresent = false,
							safeToRemove = false,
							component = v.component,
							dictionaryKey = v.dictionaryKey
						}
						var7.current[i] = true
					end
				end
				return cloned
			end)
		end
	end, { children })
	local var8 = reactModule.useCallback(function(p4) --[[ line: 150 ]]
		-- upvalues: var7 (ref), var6 (ref)
		if var7.current[p4] then
			var7.current[p4] = nil
			var6(function(p5) --[[ line: 154 ]]
				-- upvalues: p4 (ref)
				local cloned = table.clone(p5)
				
				if cloned[p4] then
					cloned[p4] = {
						isPresent = false,
						safeToRemove = true,
						component = cloned[p4].component,
						dictionaryKey = cloned[p4].dictionaryKey
					}
				end
				return cloned
			end)
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 170 ]]
		-- upvalues: var5 (ref), var6 (ref), var4 (ref)
		local t = {}
		local var15 = false
		
		for i, v in pairs(var5) do
			if v.safeToRemove then
				var15 = true
				t[i] = true
			end
		end
		if var15 then
			var6(function(p6) --[[ line: 182 ]]
				-- upvalues: t (ref), var4 (copy)
				local t_1 = {}
				
				for i, v in pairs(p6) do
					if not t[i] then
						t_1[i] = v
					elseif var4 then
						var4(i)
					end
				end
				return t_1
			end)
		end
	end, { var5 })
	local t = {}
	
	for i, v in pairs(var5) do
		if not v.safeToRemove then
			table.insert(t, reactModule.createElement(presenceChildModule, {
				key = i,
				presenceId = i,
				isPresent = v.isPresent,
				onExitComplete = function() --[[ line: 208 ]]
					-- upvalues: var8 (ref), i (ref)
					var8(i)
				end,
				childData = var3,
				children = v.component
			}, v.component))
		end
	end
	return reactModule.createElement(reactModule.Fragment, {}, t)
end