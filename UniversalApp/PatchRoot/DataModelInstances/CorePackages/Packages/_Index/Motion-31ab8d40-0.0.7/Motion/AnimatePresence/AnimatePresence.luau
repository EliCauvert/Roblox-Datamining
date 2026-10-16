local Parent = script.Parent.Parent
local ReactModule = require(Parent.Parent.React)
local PresenceChildModule = require(script.Parent.PresenceChild)
local PresenceStateModule = require(Parent.Enums.PresenceState)

local function _(p1, p2) --[[ Line: 55 | Named "getCompositeKey" ]]
	return if typeof(p2) == "table" and p2.props and p2.props.presenceId then string.format("%s:%s", p1, (tostring(p2.props.presenceId))) else p1
end

return function(p1) --[[ Line: 63 | Named "AnimatePresence" ]]
	-- upvalues: ReactModule (copy), PresenceStateModule (copy), PresenceChildModule (copy)
	local Children = p1.children
	local ChildData = if p1.childData == nil then nil else p1.childData
	local OnExitComplete = if p1.onExitComplete == nil then nil else p1.onExitComplete
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseRefResult = ReactModule.useRef({})
	ReactModule.useEffect(function() --[[ Line: 73 ]]
		-- upvalues: Children (copy), PresenceStateModule (upval), UseStateResult (copy), UseStateResult2 (copy), UseRefResult (copy)
		local t = {}
		
		if Children ~= nil and typeof(Children) == "table" then
			for DictionaryKey, child in pairs(Children) do
				if typeof(child) == "table" and child.type ~= nil then
					t[if typeof(child) == "table" and child.props and child.props.presenceId then string.format("%s:%s", DictionaryKey, (tostring(child.props.presenceId))) else DictionaryKey] = {
						type = PresenceStateModule.Entering,
						component = child,
						dictionaryKey = DictionaryKey
					}
				end
			end
		end
		local Flag = nil
		for i, value in pairs(UseStateResult) do
			Flag = false
			
			if Children ~= nil and typeof(Children) == "table" then
				for i1, child1 in pairs(Children) do
					if typeof(child1) == "table" and child1.type ~= nil and (if typeof(child1) == "table" and child1.props and child1.props.presenceId then string.format("%s:%s", i1, (tostring(child1.props.presenceId))) else i1) == i then
						Flag = true
						break
					end
				end
			end
			if not Flag and value.isPresent then
				t[i] = {
					type = PresenceStateModule.Exiting,
					component = value.component,
					dictionaryKey = value.dictionaryKey
				}
			end
		end
		if next(t) ~= nil then
			UseStateResult2(function(Tbl) --[[ Line: 120 ]]
				-- upvalues: t (copy), PresenceStateModule (upval), UseRefResult (upval)
				local Copy = table.clone(Tbl)
				
				for i, value in pairs(t) do
					if value.type == PresenceStateModule.Entering then
						Copy[i] = {
							isPresent = true,
							safeToRemove = false,
							component = value.component,
							dictionaryKey = value.dictionaryKey
						}
					elseif value.type == PresenceStateModule.Exiting and Copy[i] and Copy[i].isPresent then
						Copy[i] = {
							isPresent = false,
							safeToRemove = false,
							component = value.component,
							dictionaryKey = value.dictionaryKey
						}
						UseRefResult.current[i] = true
					end
				end
				return Copy
			end)
		end
	end, { Children })
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 150 ]]
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
		if UseRefResult.current[p2] then
			UseRefResult.current[p2] = nil
			UseStateResult2(function(Tbl) --[[ Line: 154 ]]
				-- upvalues: p2 (copy)
				local Copy = table.clone(Tbl)
				
				if Copy[p2] then
					Copy[p2] = {
						isPresent = false,
						safeToRemove = true,
						component = Copy[p2].component,
						dictionaryKey = Copy[p2].dictionaryKey
					}
				end
				return Copy
			end)
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 170 ]]
		-- upvalues: UseStateResult (copy), UseStateResult2 (copy), OnExitComplete (copy)
		local t = {}
		local Flag = false
		
		for i, value in pairs(UseStateResult) do
			if value.safeToRemove then
				Flag = true
				t[i] = true
			end
		end
		if Flag then
			UseStateResult2(function(List) --[[ Line: 182 ]]
				-- upvalues: t (copy), OnExitComplete (upval)
				local t1 = {}
				
				for i, value in pairs(List) do
					if not t[i] then
						t1[i] = value
					elseif OnExitComplete then
						OnExitComplete(i)
					end
				end
				return t1
			end)
		end
	end, { UseStateResult })
	local Elements = {}
	
	for Key, value in pairs(UseStateResult) do
		if not value.safeToRemove then
			table.insert(Elements, ReactModule.createElement(PresenceChildModule, {
				key = Key,
				presenceId = Key,
				isPresent = value.isPresent,
				onExitComplete = function() --[[ Line: 208 ]]
					-- upvalues: UseResult (copy), Key (copy)
					UseResult(Key)
				end,
				childData = ChildData,
				children = value.component
			}, value.component))
		end
	end
	return ReactModule.createElement(ReactModule.Fragment, {}, Elements)
end