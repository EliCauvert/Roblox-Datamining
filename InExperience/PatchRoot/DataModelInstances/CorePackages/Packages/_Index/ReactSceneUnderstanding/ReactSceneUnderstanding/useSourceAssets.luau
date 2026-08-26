local reactSceneUnderstanding = script:FindFirstAncestor("ReactSceneUnderstanding")
local reactModule = require(reactSceneUnderstanding.Parent.React)
local sceneUnderstandingModule = require(reactSceneUnderstanding.Parent.SceneUnderstanding)
local sceneAnalysisContextModule = require(reactSceneUnderstanding.SceneAnalysisContext)
local useCurrentCameraModule = require(reactSceneUnderstanding.useCurrentCamera)
local useCameraStateModule = require(reactSceneUnderstanding.useCameraState)
local enumsModule = require(reactSceneUnderstanding.enums)
local getSourceAssetsInView = sceneUnderstandingModule.getSourceAssetsInView
local getSourceAssetsInRange = sceneUnderstandingModule.getSourceAssetsInRange
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect

return function(value)
	-- upvalues: useCurrentCameraModule (ref), sceneAnalysisContextModule (ref), useCameraStateModule (ref), useCallback (ref), getSourceAssetsInView (ref), getSourceAssetsInRange (ref), useEffect (ref), sceneUnderstandingModule (ref), enumsModule (ref)
	local var1 = useCurrentCameraModule()
	local var2 = sceneAnalysisContextModule.use()
	local var3 = useCameraStateModule(var1)
	local var4 = useCallback(function(p1, p2)
		if #p2 ~= #p1 then
			return true
		end
		for i, v in p1 do
			if not table.find(p2, v) then
				return true
			end
		end
		return false
	end, {})
	local var5 = useCallback(function()
		-- upvalues: getSourceAssetsInView (copy), var1 (ref), value (ref), var2 (ref), var4 (ref), getSourceAssetsInRange (copy)
		local var6 = getSourceAssetsInView(var1, if value then value.viewportQueryOptions else nil)
		var2.setAssetsInView(function(p3)
			-- upvalues: var4 (copy), var6 (ref)
			return if var4(p3, var6) then var6 else p3
		end)
		local var7 = getSourceAssetsInRange(var1.CFrame.Position, if value then value.rangeQueryOptions else nil)
		var2.setAssetsInRange(function(p3)
			-- upvalues: var4 (copy), var7 (ref)
			return if var4(p3, var7) then var7 else p3
		end)
	end, { var1, value, var2 })
	useEffect(function()
		-- upvalues: sceneUnderstandingModule (copy), var5 (ref)
		local descendantAddedConnection = workspace.DescendantAdded:Connect(function(p3)
			-- upvalues: sceneUnderstandingModule (copy), var5 (copy)
			if sceneUnderstandingModule.isSourceAsset(p3) then
				var5()
			end
		end)
		var5()
		
		return function()
			-- upvalues: descendantAddedConnection (ref)
			descendantAddedConnection:Disconnect()
		end
	end, { var5 })
	useEffect(function()
		-- upvalues: var3 (ref), enumsModule (copy), var5 (ref)
		if var3 == enumsModule.CameraState.Idle then
			var5()
		end
	end, { var3 })
	
	return {
		assetsInRange = var2.assetsInRange,
		assetsInView = var2.assetsInView
	}
end