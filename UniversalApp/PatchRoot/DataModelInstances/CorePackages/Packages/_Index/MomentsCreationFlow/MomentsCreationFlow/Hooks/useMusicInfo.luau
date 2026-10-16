local MomentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local Parent = MomentsCreationFlow.Parent
local AssetService = game:GetService("AssetService")
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local CreationFlowMusicInfoRetrievedModule = require(MomentsCreationFlow.Actions.CreationFlowMusicInfoRetrieved)
local UseDispatchFunction = MomentsCommonModule.Hooks.useDispatch
local UseSelectorFunction = MomentsCommonModule.Hooks.useSelector
local ConstantsModule = require(MomentsCreationFlow.Constants)

return function(p1) --[[ Line: 18 ]]
	-- upvalues: UseDispatchFunction (copy), UseSelectorFunction (copy), ConstantsModule (copy), ReactModule (copy), AssetService (copy), CreationFlowMusicInfoRetrievedModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 21 ]]
		-- upvalues: ConstantsModule (upval), p1 (copy)
		return p2[ConstantsModule.RoduxKey].Music[p1]
	end)
	ReactModule.useEffect(function() --[[ Line: 25 ]]
		-- upvalues: UseSelectorResult (copy), p1 (copy), AssetService (upval), UseDispatchResult (copy), CreationFlowMusicInfoRetrievedModule (upval)
		if not UseSelectorResult and p1 then
			task.spawn(function() --[[ Line: 27 ]]
				-- upvalues: AssetService (upval), p1 (upval), UseDispatchResult (upval), CreationFlowMusicInfoRetrievedModule (upval)
				UseDispatchResult(CreationFlowMusicInfoRetrievedModule({ [p1] = AssetService:GetAudioMetadataAsync({ p1 })[1] }))
			end)
		end
	end, { p1, UseSelectorResult, UseDispatchResult })
	
	return UseSelectorResult
end