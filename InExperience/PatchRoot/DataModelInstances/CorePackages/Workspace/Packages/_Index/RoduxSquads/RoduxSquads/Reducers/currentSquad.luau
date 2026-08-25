local roduxSquads = script:FindFirstAncestor("RoduxSquads")
local parent = roduxSquads.Parent
local cryoModule = require(parent.Cryo)
local roduxModule = require(parent.Rodux)
local currentSquadUpdated = require(roduxSquads.Actions).CurrentSquadUpdated
local selfPermissionUpdated = require(roduxSquads.Actions).SelfPermissionUpdated
local squadModel = require(roduxSquads.Models).SquadModel
local persistStorageModule = require(roduxSquads.Persists.PersistStorage)
local createPersistReducer = require(roduxSquads.Persists.PersistReducer).createPersistReducer
local _ = require(script.Parent.Parent.RoduxSquadsTypes)
local fFlagEnableSquadRegroupExperimentation = require(parent.SharedFlags).FFlagEnableSquadRegroupExperimentation

return function(p0)
	-- upvalues: cryoModule (ref), fFlagEnableSquadRegroupExperimentation (ref), createPersistReducer (ref), persistStorageModule (ref), roduxModule (ref), squadModel (ref), currentSquadUpdated (ref), selfPermissionUpdated (ref)
	local networkingSquads = p0.NetworkingSquads
	
	local var4 = function(p1, p2)
		-- upvalues: cryoModule (copy), fFlagEnableSquadRegroupExperimentation (copy)
		if p1 == nil or p1.squadId ~= p2.squadId then
			if p2.deletedAtTime and p2.deletedAtTime ~= "" then
				return p1
			elseif p1 and p1.parentChannelId == p2.parentChannelId then
				if p1.createdAtTime < p2.createdAtTime then
					return p2
				end
			else
				return p2
			end
		elseif p2.deletedAtTime and p2.deletedAtTime ~= "" then
			return nil
		elseif p1.updatedAtTime < p2.updatedAtTime then
			return p2
		elseif p1.updatedAtTime == p2.updatedAtTime then
			if p1.parentChannelId ~= p2.parentChannelId then
				return p2
			elseif not cryoModule.List.equals(cryoModule.List.sort(cryoModule.List.map(p1.members, function(p3)
				return p3.userId
			end)), cryoModule.List.sort(cryoModule.List.map(p2.members, function(p4)
				return p4.userId
			end))) or not cryoModule.List.equals(cryoModule.List.sort(cryoModule.List.map(p1.invitees, function(p5)
				return tostring(p5.userId) .. tostring(p5.invitedAtTimestampMs)
			end)), cryoModule.List.sort(cryoModule.List.map(p2.invitees, function(p6)
				return tostring(p6.userId) .. tostring(p6.invitedAtTimestampMs)
			end))) then
				return p2
			elseif fFlagEnableSquadRegroupExperimentation then
				local selfPermissions = p1.selfPermissions
				local selfPermissions_1 = p2.selfPermissions
				
				return if selfPermissions == nil == (selfPermissions_1 == nil) then if selfPermissions and selfPermissions_1 and not cryoModule.Dictionary.equals(selfPermissions, selfPermissions_1) then p2 else p1 else p2
			end
		end
	end
	
	return createPersistReducer(cryoModule.Dictionary.join({ storage = persistStorageModule.new("currentSquadStore") }, p0.currentSquad or {}), roduxModule.createReducer(nil, {
		[networkingSquads.CreateOrJoinSquad.Succeeded.name] = function(p7, p8)
			-- upvalues: var4 (ref), squadModel (copy)
			return var4(p7, squadModel.format(p8.responseBody.groupUp))
		end,
		[networkingSquads.GetSquadActive.Succeeded.name] = function(p9, p10)
			-- upvalues: var4 (ref), squadModel (copy)
			local groupUp = p10.responseBody.groupUp
			
			return if groupUp then var4(p9, squadModel.format(groupUp)) else nil
		end,
		[networkingSquads.GetSquadFromSquadId.Succeeded.name] = function(p11, p12)
			-- upvalues: var4 (ref), squadModel (copy)
			local groupUp = p12.responseBody.groupUp
			
			return if groupUp and groupUp.groupUpId == (p11 and p11.squadId) then var4(p11, squadModel.format(groupUp)) else p11
		end,
		[networkingSquads.JoinSquad.Succeeded.name] = function(p13, p14)
			-- upvalues: var4 (ref), squadModel (copy)
			return var4(p13, squadModel.format(p14.responseBody.groupUp))
		end,
		[networkingSquads.LeaveSquad.Succeeded.name] = function(p15, p16)
			return if p15 and p15.squadId == p16.postBody.groupUpId then nil else p15
		end,
		[networkingSquads.ActOnPartyNudge.Succeeded.name] = function(p17, p18)
			-- upvalues: var4 (ref), squadModel (copy)
			local groupUp = p18.responseBody.groupUp
			
			return if groupUp then var4(p17, squadModel.format(groupUp)) else p17
		end,
		[currentSquadUpdated.name] = function(p19, p20)
			-- upvalues: var4 (ref), squadModel (copy)
			local squad = p20.payload.squad
			
			return if squad then var4(p19, squadModel.format(squad)) else nil
		end,
		[selfPermissionUpdated.name] = function(p21, p22)
			-- upvalues: fFlagEnableSquadRegroupExperimentation (copy), cryoModule (copy)
			if not fFlagEnableSquadRegroupExperimentation then
				return p21
			elseif p21 == nil then
				return p21
			end
			local selfPermissions = p22.payload and p22.payload.selfPermissions
			
			return if selfPermissions == nil then p21 else cryoModule.Dictionary.join(p21, {
				selfPermissions = cryoModule.Dictionary.join(p21.selfPermissions or {}, selfPermissions)
			})
		end
	}))
end