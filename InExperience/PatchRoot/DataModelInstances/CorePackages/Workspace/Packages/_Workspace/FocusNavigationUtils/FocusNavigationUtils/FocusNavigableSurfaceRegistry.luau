local parent = script:FindFirstAncestor("FocusNavigationUtils").Parent
local reactModule = require(parent.React)
local useFocusGuiObject = require(parent.ReactFocusNavigation).useFocusGuiObject
local t = {
	registered = function(p1, p2)
		local name = p1[p2.name] or {}
		
		for i, v in name do
			if v == p2.guiObject then
				return p1
			end
		end
		local cloned = table.clone(p1)
		local cloned_1 = table.clone(name)
		table.insert(cloned_1, p2.guiObject)
		cloned[p2.name] = cloned_1
		
		return cloned
	end,
	deRegistered = function(p3, p4)
		local name = p3[p4.name]
		
		if not name or #name == 0 then
			return p3
		end
		local t = {}
		
		for i, v in name do
			if v ~= p4.guiObject then
				table.insert(t, v)
			end
		end
		local cloned = table.clone(p3)
		
		if #t == 0 then
			cloned[p4.name] = nil
			
			return cloned
		end
		cloned[p4.name] = t
		
		return cloned
	end
}

local function registryReducer(p5, p6)
	-- upvalues: t (ref)
	local type = t[p6.type]
	
	if type then
		return type(p5, p6.payload)
	end
	error("Unknown action: " .. p5.type)
end

local var1 = reactModule.createContext(nil)

return {
	Provider = function(p5)
		-- upvalues: reactModule (ref), registryReducer (ref), var1 (ref)
		local var2, var3 = reactModule.useReducer(registryReducer, {})
		
		return reactModule.createElement(var1.Provider, { value = { state = var2, dispatch = var3 } }, p5.children)
	end,
	registryContext = var1,
	useRegisterFocusNavigableSurface = function()
		-- upvalues: reactModule (ref), var1 (ref)
		local var2 = reactModule.useContext(var1)
		local var3 = if var2 then var2.dispatch else nil
		
		return reactModule.useCallback(function(p5, p6)
			-- upvalues: var3 (ref)
			if var3 then
				var3({
					type = "registered",
					payload = { name = p5, guiObject = p6 }
				})
			end
		end, { var3 })
	end,
	useDeRegisterFocusNavigableSurface = function()
		-- upvalues: reactModule (ref), var1 (ref)
		local var2 = reactModule.useContext(var1)
		local var3 = if var2 then var2.dispatch else nil
		
		return reactModule.useCallback(function(p5, p6)
			-- upvalues: var3 (ref)
			if var3 then
				var3({
					type = "deRegistered",
					payload = { name = p5, guiObject = p6 }
				})
			end
		end, { var3 })
	end,
	useRegistryEntry = function(p5)
		-- upvalues: reactModule (ref), var1 (ref)
		local var2 = reactModule.useContext(var1)
		
		if var2 == nil then
			return nil
		end
		local _ = nil
		local var3 = var2.state[p5]
		
		return if var3 == nil or #var3 == 0 then nil else var3[#var3]
	end,
	useFocusRegistryEntry = function(p5)
		-- upvalues: useFocusGuiObject (ref), reactModule (ref), var1 (ref)
		local var2
		local var3 = useFocusGuiObject()
		local var4 = reactModule.useContext(var1)
		
		if var4 == nil then
			var2 = nil
		else
			local _ = nil
			local var5 = var4.state[p5]
			var2 = if var5 == nil or #var5 == 0 then nil else var5[#var5]
		end
		return reactModule.useCallback(function()
			-- upvalues: var2 (ref), var3 (ref)
			if var2 then
				var3(var2)
			end
		end, { var3, var2 })
	end
}