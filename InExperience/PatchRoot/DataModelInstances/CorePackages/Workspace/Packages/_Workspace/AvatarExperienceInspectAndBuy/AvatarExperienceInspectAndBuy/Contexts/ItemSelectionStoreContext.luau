local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local ReactModule = require(AvatarExperienceInspectAndBuy.Parent.React)
local CreateItemSelectionStoreModule = require(AvatarExperienceInspectAndBuy.Stores.createItemSelectionStore)
local Context = ReactModule.createContext(nil)

return {
	Provider = function(p1) --[[ Line: 20 ]]
		-- upvalues: ReactModule (copy), CreateItemSelectionStoreModule (copy), Context (copy)
		return ReactModule.createElement(Context.Provider, {
			value = ReactModule.useMemo(function() --[[ Line: 22 ]]
				-- upvalues: CreateItemSelectionStoreModule (upval)
				return CreateItemSelectionStoreModule()
			end, {})
		}, p1.children)
	end,
	useItemSelectionStore = function() --[[ Line: 29 ]]
		-- upvalues: ReactModule (copy), Context (copy)
		local UseContextResult = ReactModule.useContext(Context)
		
		if not UseContextResult then
			error("useItemSelectionStore must be used within an ItemSelectionStoreProvider")
		end
		return UseContextResult
	end
}