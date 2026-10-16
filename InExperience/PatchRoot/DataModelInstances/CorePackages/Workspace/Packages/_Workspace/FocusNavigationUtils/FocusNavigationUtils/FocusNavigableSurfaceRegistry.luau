local Parent = script:FindFirstAncestor("FocusNavigationUtils").Parent
local ReactModule = require(Parent.React)
local UseFocusGuiObjectFunction = require(Parent.ReactFocusNavigation).useFocusGuiObject
local config = {
	registered = function(Tbl, p1) --[[ Line: 31 ]]
		local Entry = Tbl[p1.name] or {}
		for _, value in Entry do
			if value == p1.guiObject then
				return Tbl
			end
		end
		local Copy = table.clone(Tbl)
		local Copy1 = table.clone(Entry)
		table.insert(Copy1, p1.guiObject)
		Copy[p1.name] = Copy1
		
		return Copy
	end,
	deRegistered = function(Tbl, p2) --[[ Line: 46 ]]
		local Entry = Tbl[p2.name]
		
		if not Entry or #Entry == 0 then
			return Tbl
		end
		local GuiObjects = {}
		
		for _, value in Entry do
			if value ~= p2.guiObject then
				table.insert(GuiObjects, value)
			end
		end
		local Copy = table.clone(Tbl)
		
		if #GuiObjects == 0 then
			Copy[p2.name] = nil
			
			return Copy
		else
			Copy[p2.name] = GuiObjects
			
			return Copy
		end
	end
}

local function registryReducer(p3, p4) --[[ Line: 70 ]]
	-- upvalues: config (copy)
	local Entry = config[p4.type]
	
	if Entry then
		return Entry(p3, p4.payload)
	else
		error("Unknown action: " .. p4.type)
	end
end

local Context = ReactModule.createContext(nil)

return {
	Provider = function(p3) --[[ Line: 80 ]]
		-- upvalues: ReactModule (copy), registryReducer (copy), Context (copy)
		local UseReducerResult, UseReducerResult2 = ReactModule.useReducer(registryReducer, {})
		
		return ReactModule.createElement(Context.Provider, {
			value = { state = UseReducerResult, dispatch = UseReducerResult2 }
		}, p3.children)
	end,
	registryContext = Context,
	useRegisterFocusNavigableSurface = function() --[[ Line: 115 ]]
		-- upvalues: ReactModule (copy), Context (copy)
		local UseContextResult = ReactModule.useContext(Context)
		local Dispatch = if UseContextResult then UseContextResult.dispatch else nil
		
		return ReactModule.useCallback(function(Name, GuiObject) --[[ Line: 118 ]]
			-- upvalues: Dispatch (copy)
			if Dispatch then
				Dispatch({
					type = "registered",
					payload = { name = Name, guiObject = GuiObject }
				})
			end
		end, { Dispatch })
	end,
	useDeRegisterFocusNavigableSurface = function() --[[ Line: 131 ]]
		-- upvalues: ReactModule (copy), Context (copy)
		local UseContextResult = ReactModule.useContext(Context)
		local Dispatch = if UseContextResult then UseContextResult.dispatch else nil
		
		return ReactModule.useCallback(function(Name, GuiObject) --[[ Line: 134 ]]
			-- upvalues: Dispatch (copy)
			if Dispatch then
				Dispatch({
					type = "deRegistered",
					payload = { name = Name, guiObject = GuiObject }
				})
			end
		end, { Dispatch })
	end,
	useRegistryEntry = function(p3) --[[ Line: 87 ]]
		-- upvalues: ReactModule (copy), Context (copy)
		local UseContextResult = ReactModule.useContext(Context)
		
		if UseContextResult == nil then
			return nil
		else
			local StateEntry = UseContextResult.state[p3]
			
			return if StateEntry == nil or #StateEntry == 0 then nil else StateEntry[#StateEntry]
		end
	end,
	useRegistryEntries = function(p3) --[[ Line: 105 ]]
		-- upvalues: ReactModule (copy), Context (copy)
		local UseContextResult = ReactModule.useContext(Context)
		
		return if UseContextResult == nil then nil else UseContextResult.state[p3]
	end,
	useFocusRegistryEntry = function(p3) --[[ Line: 147 ]]
		-- upvalues: UseFocusGuiObjectFunction (copy), ReactModule (copy), Context (copy)
		local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
		local UseContextResult = ReactModule.useContext(Context)
		local v1 = nil
		
		if UseContextResult == nil then
			v1 = nil
		else
			local StateEntry = UseContextResult.state[p3]
			v1 = if StateEntry == nil or #StateEntry == 0 then nil else StateEntry[#StateEntry]
		end
		return ReactModule.useCallback(function() --[[ Line: 150 ]]
			-- upvalues: v1 (copy), UseFocusGuiObjectResult (copy)
			if v1 then
				UseFocusGuiObjectResult(v1)
			end
		end, { UseFocusGuiObjectResult, v1 })
	end
}