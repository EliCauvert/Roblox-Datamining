local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local reactModule = require(avatarExperienceInspectAndBuy.Parent.React)
local createItemSelectionStoreModule = require(avatarExperienceInspectAndBuy.Stores.createItemSelectionStore)
local var1 = reactModule.createContext(nil)

return {
	Provider = function(p1)
		-- upvalues: reactModule (ref), createItemSelectionStoreModule (ref), var1 (ref)
		return reactModule.createElement(var1.Provider, {
			value = reactModule.useMemo(function()
				-- upvalues: createItemSelectionStoreModule (copy)
				return createItemSelectionStoreModule()
			end, {})
		}, p1.children)
	end,
	useItemSelectionStore = function()
		-- upvalues: reactModule (ref), var1 (ref)
		local var2 = reactModule.useContext(var1)
		
		if not var2 then
			error("useItemSelectionStore must be used within an ItemSelectionStoreProvider")
		end
		return var2
	end
}