local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getSideSheetConfigStoreModule = require(inExperienceSideSheet.Stores.GetSideSheetConfigStore)
local useTokens = foundationModule.Hooks.useTokens

local function getBackgroundTransparency(value)
	-- upvalues: getSideSheetConfigStoreModule (ref)
	return getSideSheetConfigStoreModule(value).getBackgroundTransparency(value)
end

return function()
	-- upvalues: useTokens (ref), signalsReactModule (ref), getBackgroundTransparency (ref), reactModule (ref)
	local var1 = useTokens()
	local var2 = signalsReactModule.useSignalBinding(getBackgroundTransparency)
	
	return reactModule.useMemo(function()
		-- upvalues: var2 (ref), var1 (ref)
		return var2:map(function(p1)
			-- upvalues: var1 (copy)
			return {
				Color3 = var1.Color.OverMedia.OverMedia_0.Color3,
				Transparency = p1
			}
		end)
	end, { var1.Color.OverMedia.OverMedia_0.Color3 })
end