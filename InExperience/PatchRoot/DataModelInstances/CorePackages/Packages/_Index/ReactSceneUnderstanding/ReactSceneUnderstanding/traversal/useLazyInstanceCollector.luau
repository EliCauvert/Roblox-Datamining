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

return function(p1, p2, p3)
	-- upvalues: dataModelTraversalOptions (ref), usePrevious (ref), useMemo (ref), sceneUnderstandingModule (ref), cryoModule (ref), useState (ref), useEffect (ref)
	local var1 = dataModelTraversalOptions.new(p3)
	local var2 = usePrevious(p3)
	local var3 = useMemo(function()
		-- upvalues: sceneUnderstandingModule (copy), p1 (ref), p2 (ref), p3 (ref)
		return sceneUnderstandingModule.createLazyInstanceCollector(p1, p2, p3)
	end, cryoModule.List.join(p1, { p2 }))
	local var4, var5 = useState({})
	
	if p3 and var2 and p3.instanceProcessingLimit ~= var2.instanceProcessingLimit then
		var3.setInstancesProcessedPerFrame(var1.instanceProcessingLimit)
	end
	useEffect(function()
		-- upvalues: var3 (ref), var5 (ref)
		var3.onStepped(function(p4)
			-- upvalues: var5 (copy)
			var5(table.clone(p4))
		end)
		var3.listen()
		
		return function()
			-- upvalues: var3 (copy)
			var3.destroy()
		end
	end, { var3 })
	
	return var4
end