local reactSceneUnderstanding = script:FindFirstAncestor("ReactSceneUnderstanding")
local cryoModule = require(reactSceneUnderstanding.Parent.Cryo)
local reactModule = require(reactSceneUnderstanding.Parent.React)
local reactUtilsModule = require(reactSceneUnderstanding.Parent.ReactUtils)
local sceneUnderstandingModule = require(reactSceneUnderstanding.Parent.SceneUnderstanding)
local dataModelTraversalOptions = sceneUnderstandingModule.DataModelTraversalOptions
local useEffect = reactModule.useEffect
local useMemo = reactModule.useMemo
local useState = reactModule.useState
local usePrevious = reactUtilsModule.usePrevious

return function(p0, p1, p2) --[[ line: 17 | named "useLazyInstanceCollector" ]]
	-- upvalues: dataModelTraversalOptions (ref), usePrevious (ref), useMemo (ref), sceneUnderstandingModule (ref), cryoModule (ref), useState (ref), useEffect (ref)
	local var5 = dataModelTraversalOptions.new(p2)
	local var6 = usePrevious(p2)
	local var7 = useMemo(function() --[[ line: 26 ]]
		-- upvalues: sceneUnderstandingModule (copy), p0 (ref), p1 (ref), p2 (ref)
		return sceneUnderstandingModule.createLazyInstanceCollector(p0, p1, p2)
	end, cryoModule.List.join(p0, { p1 }))
	local var8, var9 = useState({})
	
	if p2 and var6 and p2.instanceProcessingLimit ~= var6.instanceProcessingLimit then
		var7.setInstancesProcessedPerFrame(var5.instanceProcessingLimit)
	end
	useEffect(function() --[[ line: 38 ]]
		-- upvalues: var7 (ref), var9 (ref)
		var7.onStepped(function(p3) --[[ line: 39 ]]
			-- upvalues: var9 (copy)
			var9(table.clone(p3))
		end)
		var7.listen()
		
		return function() --[[ line: 47 ]]
			-- upvalues: var7 (copy)
			var7.destroy()
		end
	end, { var7 })
	
	return var8
end