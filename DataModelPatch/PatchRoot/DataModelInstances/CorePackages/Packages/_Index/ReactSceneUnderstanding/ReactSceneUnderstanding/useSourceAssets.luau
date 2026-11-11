local ReactSceneUnderstanding = script:FindFirstAncestor("ReactSceneUnderstanding")
local ReactModule = require(ReactSceneUnderstanding.Parent.React)
local SceneUnderstandingModule = require(ReactSceneUnderstanding.Parent.SceneUnderstanding)
local SceneAnalysisContextModule = require(ReactSceneUnderstanding.SceneAnalysisContext)
local UseCurrentCameraModule = require(ReactSceneUnderstanding.useCurrentCamera)
local UseCameraStateModule = require(ReactSceneUnderstanding.useCameraState)
local EnumsModule = require(ReactSceneUnderstanding.enums)
local GetSourceAssetsInViewFunction = SceneUnderstandingModule.getSourceAssetsInView
local GetSourceAssetsInRangeFunction = SceneUnderstandingModule.getSourceAssetsInRange
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect

return function(p1)
	-- upvalues: UseCurrentCameraModule (copy), SceneAnalysisContextModule (copy), UseCameraStateModule (copy), UseCallbackFunction (copy), GetSourceAssetsInViewFunction (copy), GetSourceAssetsInRangeFunction (copy), UseEffectFunction (copy), SceneUnderstandingModule (copy), EnumsModule (copy)
	local UseCurrentCameraModuleResult = UseCurrentCameraModule()
	local UseResult = SceneAnalysisContextModule.use()
	local UseCameraStateModuleResult = UseCameraStateModule(UseCurrentCameraModuleResult)
	local UseCallbackResult = UseCallbackFunction(function(List1, List): boolean
		if #List ~= #List1 then
			return true
		end
		for _, value in List1 do
			if not table.find(List, value) then
				return true
			end
		end
		return false
	end, {})
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: GetSourceAssetsInViewFunction (upval), UseCurrentCameraModuleResult (copy), p1 (copy), UseResult (copy), UseCallbackResult (copy), GetSourceAssetsInRangeFunction (upval)
		local SourceAssetsInView = GetSourceAssetsInViewFunction(UseCurrentCameraModuleResult, if p1 then p1.viewportQueryOptions else nil)
		UseResult.setAssetsInView(function(p2)
			-- upvalues: UseCallbackResult (upval), SourceAssetsInView (copy)
			return if UseCallbackResult(p2, SourceAssetsInView) then SourceAssetsInView else p2
		end)
		local SourceAssetsInRange = GetSourceAssetsInRangeFunction(UseCurrentCameraModuleResult.CFrame.Position, if p1 then p1.rangeQueryOptions else nil)
		UseResult.setAssetsInRange(function(p2)
			-- upvalues: UseCallbackResult (upval), SourceAssetsInRange (copy)
			return if UseCallbackResult(p2, SourceAssetsInRange) then SourceAssetsInRange else p2
		end)
	end, { UseCurrentCameraModuleResult, p1, UseResult })
	UseEffectFunction(function()
		-- upvalues: SceneUnderstandingModule (upval), UseCallbackResult1 (copy)
		local DescendantAddedConnection = workspace.DescendantAdded:Connect(function(Descendant)
			-- upvalues: SceneUnderstandingModule (upval), UseCallbackResult1 (upval)
			if SceneUnderstandingModule.isSourceAsset(Descendant) then
				UseCallbackResult1()
			end
		end)
		UseCallbackResult1()
		
		return function()
			-- upvalues: DescendantAddedConnection (copy)
			DescendantAddedConnection:Disconnect()
		end
	end, { UseCallbackResult1 })
	UseEffectFunction(function()
		-- upvalues: UseCameraStateModuleResult (copy), EnumsModule (upval), UseCallbackResult1 (copy)
		if UseCameraStateModuleResult == EnumsModule.CameraState.Idle then
			UseCallbackResult1()
		end
	end, { UseCameraStateModuleResult })
	
	return {
		assetsInRange = UseResult.assetsInRange,
		assetsInView = UseResult.assetsInView
	}
end