local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetSideSheetConfigStoreModule = require(InExperienceSideSheet.Stores.GetSideSheetConfigStore)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens

local function getBackgroundTransparency(p1)
	-- upvalues: GetSideSheetConfigStoreModule (copy)
	return GetSideSheetConfigStoreModule(p1).getBackgroundTransparency(p1)
end

return function()
	-- upvalues: UseTokensFunction (copy), SignalsReactModule (copy), getBackgroundTransparency (copy), ReactModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding(getBackgroundTransparency)
	
	return (ReactModule.useMemo(function()
		-- upvalues: UseSignalBindingResult (copy), UseTokensResult (copy)
		return UseSignalBindingResult:map(function(Transparency)
			-- upvalues: UseTokensResult (upval)
			return {
				Color3 = UseTokensResult.Color.OverMedia.OverMedia_0.Color3,
				Transparency = Transparency
			}
		end)
	end, { UseTokensResult.Color.OverMedia.OverMedia_0.Color3 }))
end