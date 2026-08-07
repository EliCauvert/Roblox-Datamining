-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:51 2026 Pacific Standard Time.

local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local parent = momentsCreationFlow.Parent
local cryoModule = require(parent.Cryo)
local _ = require(parent.MomentsCommon)

return require(parent.Rodux).createReducer({}, {
	[require(momentsCreationFlow.Actions.CreationFlowMusicInfoRetrieved).name] = function(p0, p1) --[[ line: 19 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.union(p0, p1.musicInfos)
	end
})