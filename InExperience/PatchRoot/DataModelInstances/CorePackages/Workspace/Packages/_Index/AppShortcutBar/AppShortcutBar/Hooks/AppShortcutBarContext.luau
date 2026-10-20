local AppShortcutBar = script:FindFirstAncestor("AppShortcutBar")
local Parent = AppShortcutBar.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.FocusNavigationUtils)
local v1 = require(AppShortcutBar.Stores.GetButtonHoldStore)(false)
local AppShortcutBarStateActionEnum = {
	ButtonHoldStarted = "ButtonHoldStarted",
	ButtonHoldEnded = "ButtonHoldEnded"
}
local config = {
	[AppShortcutBarStateActionEnum.ButtonHoldStarted] = function(Tbl, p1)
		local Copy = table.clone(Tbl)
		Copy.heldProgress[p1.eventName] = p1.progress
		
		return Copy
	end,
	[AppShortcutBarStateActionEnum.ButtonHoldEnded] = function(Tbl, p1)
		local Copy = table.clone(Tbl)
		Copy.heldProgress[p1.eventName] = nil
		
		return Copy
	end
}

local function registryReducer(p1, p2)
	-- upvalues: config (copy)
	local Entry = config[p2.type]
	
	if Entry then
		return Entry(p1, p2.payload)
	else
		error("Unknown action: " .. p2.type)
	end
end

local Context = ReactModule.createContext(nil)

return {
	Context = Context,
	Provider = function(p1)
		-- upvalues: ReactModule (copy), registryReducer (copy), Context (copy)
		local UseReducerResult, UseReducerResult2 = ReactModule.useReducer(registryReducer, { heldProgress = {} })
		
		return ReactModule.createElement(Context.Provider, {
			value = { state = UseReducerResult, dispatch = UseReducerResult2 }
		}, p1.children)
	end,
	useDispatchButtonHoldStarted = v1.useDispatchButtonHoldStarted,
	useDispatchButtonHoldEnded = v1.useDispatchButtonHoldEnded,
	useHeldProgressByEvent = v1.useHeldProgressByEvent,
	AppShortcutBarStateActionEnum = AppShortcutBarStateActionEnum
}