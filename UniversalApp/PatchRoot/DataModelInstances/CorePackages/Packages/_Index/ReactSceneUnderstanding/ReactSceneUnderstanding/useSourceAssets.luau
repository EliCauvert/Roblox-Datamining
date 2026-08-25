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
	local var7 = useCurrentCameraModule()
	local var8 = sceneAnalysisContextModule.use()
	local var9 = useCameraStateModule(var7)
	local var10 = useCallback(function(p0, p1)
		if #p1 ~= #p0 then
			return true
		end
		for i, v in p0 do
			if not table.find(p1, v) then
				return true
			end
		end
		return false
	end, {})
	local var11 = useCallback(function()
		-- upvalues: getSourceAssetsInView (copy), var7 (ref), value (ref), var8 (ref), var10 (ref), getSourceAssetsInRange (copy)
		local var12 = getSourceAssetsInView(var7, if value then value.viewportQueryOptions else nil)
		var8.setAssetsInView(function(p2)
			-- upvalues: var10 (copy), var12 (ref)
			return if var10(p2, var12) then var12 else p2
		end)
		local var13 = getSourceAssetsInRange(var7.CFrame.Position, if value then value.rangeQueryOptions else nil)
		var8.setAssetsInRange(function(p3)
			-- upvalues: var10 (copy), var13 (ref)
			return if var10(p3, var13) then var13 else p3
		end)
	end, { var7, value, var8 })
	useEffect(function()
		-- upvalues: sceneUnderstandingModule (copy), var11 (ref)
		local descendantAddedConnection = workspace.DescendantAdded:Connect(function(p4)
			-- upvalues: sceneUnderstandingModule (copy), var11 (copy)
			if sceneUnderstandingModule.isSourceAsset(p4) then
				var11()
			end
		end)
		var11()
		
		return function()
			-- upvalues: descendantAddedConnection (ref)
			descendantAddedConnection:Disconnect()
		end
	end, { var11 })
	useEffect(function()
		-- upvalues: var9 (ref), enumsModule (copy), var11 (ref)
		if var9 == enumsModule.CameraState.Idle then
			var11()
		end
	end, { var9 })
	
	return {
		assetsInRange = var8.assetsInRange,
		assetsInView = var8.assetsInView
	}
end