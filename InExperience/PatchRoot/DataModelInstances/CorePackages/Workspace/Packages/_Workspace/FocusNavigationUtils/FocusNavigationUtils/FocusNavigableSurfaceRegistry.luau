local parent = script:FindFirstAncestor("FocusNavigationUtils").Parent
local reactModule = require(parent.React)
local useFocusGuiObject = require(parent.ReactFocusNavigation).useFocusGuiObject
local t = {
	registered = function(p0, p1)
		local name = p0[p1.name] or {}
		
		for i, v in name do
			if v == p1.guiObject then
				return p0
			end
		end
		local cloned = table.clone(p0)
		local cloned_1 = table.clone(name)
		table.insert(cloned_1, p1.guiObject)
		cloned[p1.name] = cloned_1
		
		return cloned
	end,
	deRegistered = function(p2, p3)
		local name = p2[p3.name]
		
		if not name or #name == 0 then
			return p2
		end
		local t = {}
		
		for i, v in name do
			if v ~= p3.guiObject then
				table.insert(t, v)
			end
		end
		local cloned = table.clone(p2)
		
		if #t == 0 then
			cloned[p3.name] = nil
			
			return cloned
		end
		cloned[p3.name] = t
		
		return cloned
	end
}

local function registryReducer(p4, p5)
	-- upvalues: t (ref)
	local type = t[p5.type]
	
	if type then
		return type(p4, p5.payload)
	end
	error("Unknown action: " .. p5.type)
end

local var3 = reactModule.createContext(nil)

return {
	Provider = function(p6)
		-- upvalues: reactModule (ref), registryReducer (ref), var3 (ref)
		local var9, var10 = reactModule.useReducer(registryReducer, {})
		
		return reactModule.createElement(var3.Provider, { value = { state = var9, dispatch = var10 } }, p6.children)
	end,
	registryContext = var3,
	useRegisterFocusNavigableSurface = function()
		-- upvalues: reactModule (ref), var3 (ref)
		local var11 = reactModule.useContext(var3)
		local var12 = if var11 then var11.dispatch else nil
		
		return reactModule.useCallback(function(p7, p8)
			-- upvalues: var12 (ref)
			if var12 then
				var12({
					type = "registered",
					payload = { name = p7, guiObject = p8 }
				})
			end
		end, { var12 })
	end,
	useDeRegisterFocusNavigableSurface = function()
		-- upvalues: reactModule (ref), var3 (ref)
		local var13 = reactModule.useContext(var3)
		local var14 = if var13 then var13.dispatch else nil
		
		return reactModule.useCallback(function(p9, p10)
			-- upvalues: var14 (ref)
			if var14 then
				var14({
					type = "deRegistered",
					payload = { name = p9, guiObject = p10 }
				})
			end
		end, { var14 })
	end,
	useRegistryEntry = function(p11)
		-- upvalues: reactModule (ref), var3 (ref)
		local var15 = reactModule.useContext(var3)
		
		if var15 == nil then
			return nil
		end
		local _ = nil
		local var16 = var15.state[p11]
		
		return if var16 == nil or #var16 == 0 then nil else var16[#var16]
	end,
	useFocusRegistryEntry = function(p12)
		-- upvalues: useFocusGuiObject (ref), reactModule (ref), var3 (ref)
		local var19
		local var17 = useFocusGuiObject()
		local var18 = reactModule.useContext(var3)
		
		if var18 == nil then
			var19 = nil
		else
			local _ = nil
			local var20 = var18.state[p12]
			var19 = if var20 == nil or #var20 == 0 then nil else var20[#var20]
		end
		return reactModule.useCallback(function()
			-- upvalues: var19 (ref), var17 (ref)
			if var19 then
				var17(var19)
			end
		end, { var17, var19 })
	end
}