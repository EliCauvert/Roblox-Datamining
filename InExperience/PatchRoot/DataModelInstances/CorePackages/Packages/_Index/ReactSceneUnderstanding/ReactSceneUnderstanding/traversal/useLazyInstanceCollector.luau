local ReactSceneUnderstanding = script:FindFirstAncestor("ReactSceneUnderstanding")
local CryoModule = require(ReactSceneUnderstanding.Parent.Cryo)
local ReactModule = require(ReactSceneUnderstanding.Parent.React)
local SceneUnderstandingModule = require(ReactSceneUnderstanding.Parent.SceneUnderstanding)
local DataModelTraversalOptions = SceneUnderstandingModule.DataModelTraversalOptions
local UseEffectFunction = ReactModule.useEffect
local UseMemoFunction = ReactModule.useMemo
local UseStateFunction = ReactModule.useState
local UsePreviousFunction = require(ReactSceneUnderstanding.Parent.ReactUtils).usePrevious

return function(p1, p2, p3) --[[ Line: 17 | Named "useLazyInstanceCollector" ]]
	-- upvalues: DataModelTraversalOptions (copy), UsePreviousFunction (copy), UseMemoFunction (copy), SceneUnderstandingModule (copy), CryoModule (copy), UseStateFunction (copy), UseEffectFunction (copy)
	local NewDataModelTraversalOptions = DataModelTraversalOptions.new(p3)
	local UsePreviousResult = UsePreviousFunction(p3)
	local UseMemoResult = UseMemoFunction(function() --[[ Line: 26 ]]
		-- upvalues: SceneUnderstandingModule (upval), p1 (copy), p2 (copy), p3 (copy)
		return SceneUnderstandingModule.createLazyInstanceCollector(p1, p2, p3)
	end, CryoModule.List.join(p1, { p2 }))
	local UseStateResult, UseStateResult2 = UseStateFunction({})
	
	if p3 and UsePreviousResult and p3.instanceProcessingLimit ~= UsePreviousResult.instanceProcessingLimit then
		UseMemoResult.setInstancesProcessedPerFrame(NewDataModelTraversalOptions.instanceProcessingLimit)
	end
	UseEffectFunction(function() --[[ Line: 38 ]]
		-- upvalues: UseMemoResult (copy), UseStateResult2 (copy)
		UseMemoResult.onStepped(function(Tbl) --[[ Line: 39 ]]
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(table.clone(Tbl))
		end)
		UseMemoResult.listen()
		
		return function() --[[ Line: 47 ]]
			-- upvalues: UseMemoResult (upval)
			UseMemoResult.destroy()
		end
	end, { UseMemoResult })
	
	return UseStateResult
end