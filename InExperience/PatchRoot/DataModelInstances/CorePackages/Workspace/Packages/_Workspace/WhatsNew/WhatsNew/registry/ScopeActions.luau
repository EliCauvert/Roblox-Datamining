local WhatsNew = script:FindFirstAncestor("WhatsNew")
local SignalsModule = require(WhatsNew.Parent.Signals)
local _ = require(WhatsNew.Types)

local function _(p1) --[[ Line: 39 | Named "assertValidKey" ]]
	assert(p1 ~= "", "scope action key must be a non-empty string")
end

return {
	createScopeActions = function(List) --[[ Line: 43 ]]
		-- upvalues: SignalsModule (copy)
		local config = {
			_actions = {},
			_openStateBindings = {},
			_openStateDisposers = {}
		}
		
		if List ~= nil then
			for i, value in List do
				assert(i ~= "", "scope action key must be a non-empty string")
				config._actions[i] = value
			end
		end
		local config1 = {
			register = function(_, p1, p2) --[[ Line: 59 ]]
				-- upvalues: config (copy)
				assert(p1 ~= "", "scope action key must be a non-empty string")
				assert(config._actions[p1] == nil, `scope action already registered: {p1}`)
				config._actions[p1] = p2
			end,
			has = function(_, p1): boolean --[[ Line: 65 ]]
				-- upvalues: config (copy)
				return config._actions[p1] ~= nil
			end,
			invoke = function(_, p1) --[[ Line: 69 ]]
				-- upvalues: config (copy)
				local Action: () -> () = config._actions[p1]
				assert(Action ~= nil, `unknown scope action key: {p1}`)
				Action()
			end,
			getRegisteredKeys = function(_) --[[ Line: 75 ]]
				-- upvalues: config (copy)
				local List = {}
				
				for action in config._actions do
					table.insert(List, action)
				end
				table.sort(List)
				
				return List
			end,
			toMap = function(_) --[[ Line: 84 ]]
				-- upvalues: config (copy)
				return (table.clone(config._actions))
			end,
			bindOpenState = function(_, p1) --[[ Line: 89 ]]
				-- upvalues: config (copy)
				assert(p1.openActionKey ~= "", "scope action key must be a non-empty string")
				assert(p1.closeActionKey ~= "", "scope action key must be a non-empty string")
				assert(p1.getIsOpen ~= nil, "bindOpenState requires getIsOpen")
				assert(config._actions[p1.openActionKey] ~= nil, `bindOpenState openActionKey not registered: {p1.openActionKey}`)
				assert(config._actions[p1.closeActionKey] ~= nil, `bindOpenState closeActionKey not registered: {p1.closeActionKey}`)
				
				for _, openStateBinding in config._openStateBindings do
					assert(openStateBinding.openActionKey ~= p1.openActionKey, `open state already bound for openActionKey: {p1.openActionKey}`)
					assert(openStateBinding.closeActionKey ~= p1.closeActionKey, `open state already bound for closeActionKey: {p1.closeActionKey}`)
				end
				table.insert(config._openStateBindings, p1)
			end,
			stopOpenStateWiring = function(_) --[[ Line: 116 ]]
				-- upvalues: config (copy)
				for _, openStateDisposer in config._openStateDisposers do
					openStateDisposer()
				end
				table.clear(config._openStateDisposers)
			end
		}
		
		function config1:startOpenStateWiring(p2) --[[ Line: 123 ]]
			-- upvalues: config1 (copy), config (copy), SignalsModule (upval)
			config1:stopOpenStateWiring()
			
			for _, openStateBinding in config._openStateBindings do
				table.insert(config._openStateDisposers, (SignalsModule.createEffect(function(p3) --[[ Line: 128 ]]
					-- upvalues: openStateBinding (copy), p2 (copy)
					local IsOpen = openStateBinding.getIsOpen(p3)
					p2.getRuntimeStateSignal(p3)
					
					if IsOpen then
						p2.notifyScopeOpened(openStateBinding.openActionKey)
						
						return
					else
						p2.notifyScopeClosed(openStateBinding.closeActionKey)
					end
				end)))
			end
		end
		
		return config1
	end,
	collectRegistryActionKeys = function(p2) --[[ Line: 145 ]]
		local t = {}
		local List = {}
		
		local function _(Key) --[[ Line: 149 | Named "addKey" ]]
			-- upvalues: t (copy), List (copy)
			if Key ~= nil and Key ~= "" and not t[Key] then
				t[Key] = true
				table.insert(List, Key)
				
				return
			end
		end
		
		for _, scopeTour in p2.scopeTours do
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