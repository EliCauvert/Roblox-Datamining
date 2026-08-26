local reactSceneUnderstanding = script:FindFirstAncestor("ReactSceneUnderstanding")
local reactModule = require(reactSceneUnderstanding.Parent.React)
local _ = require(reactSceneUnderstanding.Parent.SceneUnderstanding)
local useState = reactModule.useState
local var1 = reactModule.createContext(nil)

return {
	Provider = function(p1)
		-- upvalues: useState (ref), reactModule (ref), var1 (ref)
		local var2, var3 = useState({})
		local var4, var5 = useState({})
		local var6, var7 = useState({})
		local var8, var9 = useState({})
		
		return reactModule.createElement(var1.Provider, {
			value = {
				rangeQueryOptions = p1.rangeQueryOptions,
				viewportQueryOptions = p1.viewportQueryOptions,
				dataModelTraversalOptions = p1.dataModelTraversalOptions,
				sourceAssets = var2,
				setSourceAssets = var3,
				assetsInView = var4,
				setAssetsInView = var5,
				assetsInRange = var6,
				setAssetsInRange = var7,
				audibleSounds = var8,
				setAudibleSounds = var9
			}
		}, p1.children)
	end,
	use = function()
		-- upvalues: reactModule (ref), var1 (ref)
		local var2 = reactModule.useContext(var1)
		
		if var2 then
			return var2
		end
		error("attempt to use SceneAnalysisContext with no provider. Add `ReactSceneUnderstanding.SceneAnalysisProvider` to the React tree and try again")
	end
}