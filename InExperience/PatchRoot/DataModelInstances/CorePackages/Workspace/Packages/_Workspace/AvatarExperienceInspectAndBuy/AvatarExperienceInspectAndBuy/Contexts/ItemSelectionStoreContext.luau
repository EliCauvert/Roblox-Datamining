local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local reactModule = require(avatarExperienceInspectAndBuy.Parent.React)
local createItemSelectionStoreModule = require(avatarExperienceInspectAndBuy.Stores.createItemSelectionStore)
local var3 = reactModule.createContext(nil)

return {
	Provider = function(p0)
		-- upvalues: reactModule (ref), createItemSelectionStoreModule (ref), var3 (ref)
		return reactModule.createElement(var3.Provider, {
			value = reactModule.useMemo(function()
				-- upvalues: createItemSelectionStoreModule (copy)
				return createItemSelectionStoreModule()
			end, {})
		}, p0.children)
	end,
	useItemSelectionStore = function()
		-- upvalues: reactModule (ref), var3 (ref)
		local var4 = reactModule.useContext(var3)
		
		if not var4 then
			error("useItemSelectionStore must be used within an ItemSelectionStoreProvider")
		end
		return var4
	end
}