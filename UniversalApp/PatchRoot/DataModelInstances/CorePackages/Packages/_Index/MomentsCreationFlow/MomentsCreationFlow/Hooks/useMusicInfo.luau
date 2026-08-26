local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local parent = momentsCreationFlow.Parent
local assetService = game:GetService("AssetService")
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local creationFlowMusicInfoRetrievedModule = require(momentsCreationFlow.Actions.CreationFlowMusicInfoRetrieved)
local useDispatch = momentsCommonModule.Hooks.useDispatch
local useSelector = momentsCommonModule.Hooks.useSelector
local constantsModule = require(momentsCreationFlow.Constants)

return function(p1)
	-- upvalues: useDispatch (ref), useSelector (ref), constantsModule (ref), reactModule (ref), assetService (ref), creationFlowMusicInfoRetrievedModule (ref)
	local var1 = useDispatch()
	local var2 = useSelector(function(p2)
		-- upvalues: constantsModule (copy), p1 (ref)
		return p2[constantsModule.RoduxKey].Music[p1]
	end)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), p1 (ref), assetService (copy), var1 (ref), creationFlowMusicInfoRetrievedModule (copy)
		if not var2 and p1 then
			task.spawn(function()
				-- upvalues: assetService (copy), p1 (copy), var1 (copy), creationFlowMusicInfoRetrievedModule (copy)
				var1(creationFlowMusicInfoRetrievedModule({ [p1] = assetService:GetAudioMetadataAsync({ p1 })[1] }))
			end)
		end
	end, { p1, var2, var1 })
	
	return var2
end