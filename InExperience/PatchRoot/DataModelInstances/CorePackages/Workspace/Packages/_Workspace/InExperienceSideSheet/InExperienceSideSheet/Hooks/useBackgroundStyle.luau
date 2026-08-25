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
	local var6 = useTokens()
	local var7 = signalsReactModule.useSignalBinding(getBackgroundTransparency)
	
	return reactModule.useMemo(function()
		-- upvalues: var7 (ref), var6 (ref)
		return var7:map(function(p0)
			-- upvalues: var6 (copy)
			return {
				Color3 = var6.Color.OverMedia.OverMedia_0.Color3,
				Transparency = p0
			}
		end)
	end, { var6.Color.OverMedia.OverMedia_0.Color3 })
end