local whatsNew = script:FindFirstAncestor("WhatsNew")
local signalsModule = require(whatsNew.Parent.Signals)
local _ = require(whatsNew.Types)

local function _(p1)
	assert(p1 ~= "", "scope action key must be a non-empty string")
end

return {
	createScopeActions = function(p1)
		-- upvalues: signalsModule (ref)
		local t = {
			_actions = {},
			_openStateBindings = {},
			_openStateDisposers = {}
		}
		
		if p1 ~= nil then
			for i, v in p1 do
				assert(i ~= "", "scope action key must be a non-empty string")
				t._actions[i] = v
			end
		end
		local t_1 = {
			register = function(_, p2, p3)
				-- upvalues: t (ref)
				assert(p2 ~= "", "scope action key must be a non-empty string")
				assert(t._actions[p2] == nil, `scope action already registered: {p2}`)
				t._actions[p2] = p3
			end,
			has = function(_, p2)
				-- upvalues: t (ref)
				return t._actions[p2] ~= nil
			end,
			invoke = function(_, p2)
				-- upvalues: t (ref)
				local var1 = t._actions[p2]
				assert(var1 ~= nil, `unknown scope action key: {p2}`)
				var1()
			end,
			getRegisteredKeys = function(_)
				-- upvalues: t (ref)
				local t_1 = {}
				
				for i in t._actions do
					table.insert(t_1, i)
				end
				table.sort(t_1)
				
				return t_1
			end,
			toMap = function(_)
				-- upvalues: t (ref)
				return table.clone(t._actions)
			end,
			bindOpenState = function(_, p2)
				-- upvalues: t (ref)
				assert(p2.openActionKey ~= "", "scope action key must be a non-empty string")
				assert(p2.closeActionKey ~= "", "scope action key must be a non-empty string")
				assert(p2.getIsOpen ~= nil, "bindOpenState requires getIsOpen")
				assert(t._actions[p2.openActionKey] ~= nil, `bindOpenState openActionKey not registered: {p2.openActionKey}`)
				assert(t._actions[p2.closeActionKey] ~= nil, `bindOpenState closeActionKey not registered: {p2.closeActionKey}`)
				
				for i, v in t._openStateBindings do
					assert(v.openActionKey ~= p2.openActionKey, `open state already bound for openActionKey: {p2.openActionKey}`)
					assert(v.closeActionKey ~= p2.closeActionKey, `open state already bound for closeActionKey: {p2.closeActionKey}`)
				end
				table.insert(t._openStateBindings, p2)
			end,
			stopOpenStateWiring = function(_)
				-- upvalues: t (ref)
				for i, v in t._openStateDisposers do
					v()
				end
				table.clear(t._openStateDisposers)
			end
		}
		
		function t_1.startOpenStateWiring(_, p3)
			-- upvalues: t_1 (ref), t (ref), signalsModule (copy)
			t_1:stopOpenStateWiring()
			
			for i, v in t._openStateBindings do
				table.insert(t._openStateDisposers, signalsModule.createEffect(function(p4)
					-- upvalues: v (ref), p3 (ref)
					local isOpen = v.getIsOpen(p4)
					p3.getRuntimeStateSignal(p4)
					
					if isOpen then
						p3.notifyScopeOpened(v.openActionKey)
						
						return
					end
					p3.notifyScopeClosed(v.closeActionKey)
				end))
			end
		end
		
		return t_1
	end,
	collectRegistryActionKeys = function(p3)
		local t = {}
		local t_1 = {}
		
		local function _(p4)
			-- upvalues: t (ref), t_1 (ref)
			if p4 == nil or p4 == "" or t[p4] then
				return
			end
			t[p4] = true
			table.insert(t_1, p4)
		end
		
		for i, v in p3.scopeTours do
			local openActionKey = v.openActionKey
			
			if openActionKey ~= nil and openActionKey ~= "" and not t[openActionKey] then
				t[openActionKey] = true
				table.insert(t_1, openActionKey)
			end
			local closeActionKey = v.closeActionKey
			
			if closeActionKey ~= nil and closeActionKey ~= "" and not t[closeActionKey] then
				t[closeActionKey] = true
				table.insert(t_1, closeActionKey)
			end
		end
		table.sort(t_1)
		
		return t_1
	end
}