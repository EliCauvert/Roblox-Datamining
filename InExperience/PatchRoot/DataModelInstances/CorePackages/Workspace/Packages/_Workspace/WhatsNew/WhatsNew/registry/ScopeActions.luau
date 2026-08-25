local whatsNew = script:FindFirstAncestor("WhatsNew")
local signalsModule = require(whatsNew.Parent.Signals)
local _ = require(whatsNew.Types)

local function _(p0)
	assert(p0 ~= "", "scope action key must be a non-empty string")
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
			has = function(_, p4)
				-- upvalues: t (ref)
				return t._actions[p4] ~= nil
			end,
			invoke = function(_, p5)
				-- upvalues: t (ref)
				local var4 = t._actions[p5]
				assert(var4 ~= nil, `unknown scope action key: {p5}`)
				var4()
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
			bindOpenState = function(_, p6)
				-- upvalues: t (ref)
				assert(p6.openActionKey ~= "", "scope action key must be a non-empty string")
				assert(p6.closeActionKey ~= "", "scope action key must be a non-empty string")
				assert(p6.getIsOpen ~= nil, "bindOpenState requires getIsOpen")
				assert(t._actions[p6.openActionKey] ~= nil, `bindOpenState openActionKey not registered: {p6.openActionKey}`)
				assert(t._actions[p6.closeActionKey] ~= nil, `bindOpenState closeActionKey not registered: {p6.closeActionKey}`)
				
				for i, v in t._openStateBindings do
					assert(v.openActionKey ~= p6.openActionKey, `open state already bound for openActionKey: {p6.openActionKey}`)
					assert(v.closeActionKey ~= p6.closeActionKey, `open state already bound for closeActionKey: {p6.closeActionKey}`)
				end
				table.insert(t._openStateBindings, p6)
			end,
			stopOpenStateWiring = function(_)
				-- upvalues: t (ref)
				for i, v in t._openStateDisposers do
					v()
				end
				table.clear(t._openStateDisposers)
			end
		}
		
		function t_1.startOpenStateWiring(_, p7)
			-- upvalues: t_1 (ref), t (ref), signalsModule (copy)
			t_1:stopOpenStateWiring()
			
			for i, v in t._openStateBindings do
				table.insert(t._openStateDisposers, signalsModule.createEffect(function(p8)
					-- upvalues: v (ref), p7 (ref)
					local isOpen = v.getIsOpen(p8)
					p7.getRuntimeStateSignal(p8)
					
					if isOpen then
						p7.notifyScopeOpened(v.openActionKey)
						
						return
					end
					p7.notifyScopeClosed(v.closeActionKey)
				end))
			end
		end
		
		return t_1
	end,
	collectRegistryActionKeys = function(p9)
		local t = {}
		local t_1 = {}
		
		local function _(p10)
			-- upvalues: t (ref), t_1 (ref)
			if p10 == nil or p10 == "" or t[p10] then
				return
			end
			t[p10] = true
			table.insert(t_1, p10)
		end
		
		for i, v in p9.scopeTours do
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