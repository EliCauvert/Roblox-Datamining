local reactSceneUnderstanding = script:FindFirstAncestor("ReactSceneUnderstanding")
local reactModule = require(reactSceneUnderstanding.Parent.React)
local _ = require(reactSceneUnderstanding.Parent.SceneUnderstanding)
local useState = reactModule.useState
local var2 = reactModule.createContext(nil)

return {
	Provider = function(p0) --[[ line: 102 ]]
		-- upvalues: useState (ref), reactModule (ref), var2 (ref)
		local var3, var4 = useState({})
		local var5, var6 = useState({})
		local var7, var8 = useState({})
		local var9, var10 = useState({})
		
		return reactModule.createElement(var2.Provider, {
			value = {
				rangeQueryOptions = p0.rangeQueryOptions,
				viewportQueryOptions = p0.viewportQueryOptions,
				dataModelTraversalOptions = p0.dataModelTraversalOptions,
				sourceAssets = var3,
				setSourceAssets = var4,
				assetsInView = var5,
				setAssetsInView = var6,
				assetsInRange = var7,
				setAssetsInRange = var8,
				audibleSounds = var9,
				setAudibleSounds = var10
			}
		}, p0.children)
	end,
	use = function() --[[ line: 129 ]]
		-- upvalues: reactModule (ref), var2 (ref)
		local var11 = reactModule.useContext(var2)
		
		if var11 then
			return var11
		end
		error("attempt to use SceneAnalysisContext with no provider. Add `ReactSceneUnderstanding.SceneAnalysisProvider` to the React tree and try again")
	end
}