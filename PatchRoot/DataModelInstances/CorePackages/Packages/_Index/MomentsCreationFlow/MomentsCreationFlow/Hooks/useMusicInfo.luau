-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:51 2026 Pacific Standard Time.

local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local parent = momentsCreationFlow.Parent
local assetService = game:GetService("AssetService")
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local creationFlowMusicInfoRetrievedModule = require(momentsCreationFlow.Actions.CreationFlowMusicInfoRetrieved)
local useDispatch = momentsCommonModule.Hooks.useDispatch
local useSelector = momentsCommonModule.Hooks.useSelector
local constantsModule = require(momentsCreationFlow.Constants)

return function(p0) --[[ line: 18 ]]
	-- upvalues: useDispatch (ref), useSelector (ref), constantsModule (ref), reactModule (ref), assetService (ref), creationFlowMusicInfoRetrievedModule (ref)
	local var6 = useDispatch()
	local var7 = useSelector(function(p1) --[[ line: 21 ]]
		-- upvalues: constantsModule (copy), p0 (ref)
		return p1[constantsModule.RoduxKey].Music[p0]
	end)
	reactModule.useEffect(function() --[[ line: 25 ]]
		-- upvalues: var7 (ref), p0 (ref), assetService (copy), var6 (ref), creationFlowMusicInfoRetrievedModule (copy)
		if not var7 and p0 then
			task.spawn(function() --[[ line: 27 ]]
				-- upvalues: assetService (copy), p0 (copy), var6 (copy), creationFlowMusicInfoRetrievedModule (copy)
				var6(creationFlowMusicInfoRetrievedModule({ [p0] = assetService:GetAudioMetadataAsync({ p0 })[1] }))
			end)
		end
	end, { p0, var7, var6 })
	
	return var7
end