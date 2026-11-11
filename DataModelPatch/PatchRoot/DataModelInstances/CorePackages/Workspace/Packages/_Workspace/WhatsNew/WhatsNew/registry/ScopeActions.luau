local _ = require(script:FindFirstAncestor("WhatsNew").Types)

local function _(p1)
	assert(p1 ~= "", "scope action key must be a non-empty string")
end

return {
	createScopeActions = function(List)
		local config = { _actions = {} }
		
		if List ~= nil then
			for i, value in List do
				assert(i ~= "", "scope action key must be a non-empty string")
				config._actions[i] = value
			end
		end
		return {
			register = function(_, p1, p2)
				-- upvalues: config (copy)
				assert(p1 ~= "", "scope action key must be a non-empty string")
				assert(config._actions[p1] == nil, `scope action already registered: {p1}`)
				config._actions[p1] = p2
			end,
			has = function(_, p1): boolean
				-- upvalues: config (copy)
				return config._actions[p1] ~= nil
			end,
			invoke = function(_, p1)
				-- upvalues: config (copy)
				local Action: () -> () = config._actions[p1]
				assert(Action ~= nil, `unknown scope action key: {p1}`)
				Action()
			end,
			getRegisteredKeys = function(_)
				-- upvalues: config (copy)
				local List = {}
				
				for action in config._actions do
					table.insert(List, action)
				end
				table.sort(List)
				
				return List
			end,
			toMap = function(_)
				-- upvalues: config (copy)
				return (table.clone(config._actions))
			end
		}
	end,
	collectRegistryActionKeys = function(p1)
		local t = {}
		local List = {}
		
		local function _(Key)
			-- upvalues: t (copy), List (copy)
			if Key ~= nil and Key ~= "" and not t[Key] then
				t[Key] = true
				table.insert(List, Key)
				
				return
			end
		end
		
		for _, scopeTour in p1.scopeTours do
			local OpenActionKey = scopeTour.openActionKey
			
			if OpenActionKey ~= nil and OpenActionKey ~= "" and not t[OpenActionKey] then
				t[OpenActionKey] = true
				table.insert(List, OpenActionKey)
			end
			local CloseActionKey = scopeTour.closeActionKey
			
			if CloseActionKey ~= nil and CloseActionKey ~= "" and not t[CloseActionKey] then
				t[CloseActionKey] = true
				table.insert(List, CloseActionKey)
			end
		end
		table.sort(List)
		
		return List
	end
}