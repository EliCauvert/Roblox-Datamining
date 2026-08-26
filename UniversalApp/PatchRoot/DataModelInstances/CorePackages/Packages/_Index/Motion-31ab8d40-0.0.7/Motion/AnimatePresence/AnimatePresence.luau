local parent = script.Parent.Parent
local reactModule = require(parent.Parent.React)
local presenceChildModule = require(script.Parent.PresenceChild)
local presenceStateModule = require(parent.Enums.PresenceState)

local function _(p1, p2)
	return if typeof(p2) == "table" and p2.props and p2.props.presenceId then string.format("%s:%s", p1, tostring(p2.props.presenceId)) else p1
end

return function(p1)
	-- upvalues: reactModule (ref), presenceStateModule (ref), presenceChildModule (ref)
	local children = p1.children
	local var1 = if p1.childData ~= nil then nil else p1.childData
	local var2 = if p1.onExitComplete ~= nil then nil else p1.onExitComplete
	local var3, var4 = reactModule.useState({})
	local var5 = reactModule.useRef({})
	reactModule.useEffect(function()
		-- upvalues: children (ref), presenceStateModule (copy), var3 (ref), var4 (ref), var5 (ref)
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
		local var6
		for i, v in pairs(var3) do
			var6 = false
			
			if children ~= nil and typeof(children) == "table" then
				for i_1, v_2 in pairs(children) do
					if typeof(v_2) == "table" and v_2.type ~= nil then
						if (if typeof(v_2) == "table" and v_2.props and v_2.props.presenceId then string.format("%s:%s", i_1, tostring(v_2.props.presenceId)) else i_1) == i then
							var6 = true
							break
						end
					end
				end
			end
			if not var6 and v.isPresent then
				t[i] = {
					type = presenceStateModule.Exiting,
					component = v.component,
					dictionaryKey = v.dictionaryKey
				}
			end
		end
		if next(t) ~= nil then
			var4(function(p2)
				-- upvalues: t (ref), presenceStateModule (copy), var5 (copy)
				local cloned = table.clone(p2)
				
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
						var5.current[i] = true
					end
				end
				return cloned
			end)
		end
	end, { children })
	local var7 = reactModule.useCallback(function(p2)
		-- upvalues: var5 (ref), var4 (ref)
		if var5.current[p2] then
			var5.current[p2] = nil
			var4(function(p3)
				-- upvalues: p2 (ref)
				local cloned = table.clone(p3)
				
				if cloned[p2] then
					cloned[p2] = {
						isPresent = false,
						safeToRemove = true,
						component = cloned[p2].component,
						dictionaryKey = cloned[p2].dictionaryKey
					}
				end
				return cloned
			end)
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var4 (ref), var2 (ref)
		local t = {}
		local var8 = false
		
		for i, v in pairs(var3) do
			if v.safeToRemove then
				var8 = true
				t[i] = true
			end
		end
		if var8 then
			var4(function(p2)
				-- upvalues: t (ref), var2 (copy)
				local t_1 = {}
				
				for i, v in pairs(p2) do
					if not t[i] then
						t_1[i] = v
					elseif var2 then
						var2(i)
					end
				end
				return t_1
			end)
		end
	end, { var3 })
	local t = {}
	
	for i, v in pairs(var3) do
		if not v.safeToRemove then
			table.insert(t, reactModule.createElement(presenceChildModule, {
				key = i,
				presenceId = i,
				isPresent = v.isPresent,
				onExitComplete = function()
					-- upvalues: var7 (ref), i (ref)
					var7(i)
				end,
				childData = var1,
				children = v.component
			}, v.component))
		end
	end
	return reactModule.createElement(reactModule.Fragment, {}, t)
end