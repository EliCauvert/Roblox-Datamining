local ReactSceneUnderstanding = script:FindFirstAncestor("ReactSceneUnderstanding")
local ReactModule = require(ReactSceneUnderstanding.Parent.React)
local _ = require(ReactSceneUnderstanding.Parent.SceneUnderstanding)
local UseStateFunction = ReactModule.useState
local Context = ReactModule.createContext(nil)

return {
	Provider = function(p1)
		-- upvalues: UseStateFunction (copy), ReactModule (copy), Context (copy)
		local UseStateResult, UseStateResult2 = UseStateFunction({})
		local UseStateResult1, UseStateResult2_1 = UseStateFunction({})
		local UseStateResult3, UseStateResult2_2 = UseStateFunction({})
		local UseStateResult4, UseStateResult2_3 = UseStateFunction({})
		
		return ReactModule.createElement(Context.Provider, {
			value = {
				rangeQueryOptions = p1.rangeQueryOptions,
				viewportQueryOptions = p1.viewportQueryOptions,
				dataModelTraversalOptions = p1.dataModelTraversalOptions,
				sourceAssets = UseStateResult,
				setSourceAssets = UseStateResult2,
				assetsInView = UseStateResult1,
				setAssetsInView = UseStateResult2_1,
				assetsInRange = UseStateResult3,
				setAssetsInRange = UseStateResult2_2,
				audibleSounds = UseStateResult4,
				setAudibleSounds = UseStateResult2_3
			}
		}, p1.children)
	end,
	use = function()
		-- upvalues: ReactModule (copy), Context (copy)
		local UseContextResult = ReactModule.useContext(Context)
		
		if UseContextResult then
			return UseContextResult
		else
			error("attempt to use SceneAnalysisContext with no provider. Add `ReactSceneUnderstanding.SceneAnalysisProvider` to the React tree and try again")
		end
	end
}