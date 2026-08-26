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

return function(p1)
	-- upvalues: cryoModule (ref), fFlagEnableSquadRegroupExperimentation (ref), createPersistReducer (ref), persistStorageModule (ref), roduxModule (ref), squadModel (ref), currentSquadUpdated (ref), selfPermissionUpdated (ref)
	local networkingSquads = p1.NetworkingSquads
	
	local var1 = function(p2, p3)
		-- upvalues: cryoModule (copy), fFlagEnableSquadRegroupExperimentation (copy)
		if p2 == nil or p2.squadId ~= p3.squadId then
			if p3.deletedAtTime and p3.deletedAtTime ~= "" then
				return p2
			elseif p2 and p2.parentChannelId == p3.parentChannelId then
				if p2.createdAtTime < p3.createdAtTime then
					return p3
				end
			else
				return p3
			end
		elseif p3.deletedAtTime and p3.deletedAtTime ~= "" then
			return nil
		elseif p2.updatedAtTime < p3.updatedAtTime then
			return p3
		elseif p2.updatedAtTime == p3.updatedAtTime then
			if p2.parentChannelId ~= p3.parentChannelId then
				return p3
			elseif not cryoModule.List.equals(cryoModule.List.sort(cryoModule.List.map(p2.members, function(p4)
				return p4.userId
			end)), cryoModule.List.sort(cryoModule.List.map(p3.members, function(p4)
				return p4.userId
			end))) or not cryoModule.List.equals(cryoModule.List.sort(cryoModule.List.map(p2.invitees, function(p4)
				return tostring(p4.userId) .. tostring(p4.invitedAtTimestampMs)
			end)), cryoModule.List.sort(cryoModule.List.map(p3.invitees, function(p4)
				return tostring(p4.userId) .. tostring(p4.invitedAtTimestampMs)
			end))) then
				return p3
			elseif fFlagEnableSquadRegroupExperimentation then
				local selfPermissions = p2.selfPermissions
				local selfPermissions_1 = p3.selfPermissions
				
				return if selfPermissions == nil == (selfPermissions_1 == nil) then if selfPermissions and selfPermissions_1 and not cryoModule.Dictionary.equals(selfPermissions, selfPermissions_1) then p3 else p2 else p3
			end
		end
	end
	
	return createPersistReducer(cryoModule.Dictionary.join({ storage = persistStorageModule.new("currentSquadStore") }, p1.currentSquad or {}), roduxModule.createReducer(nil, {
		[networkingSquads.CreateOrJoinSquad.Succeeded.name] = function(p2, p3)
			-- upvalues: var1 (ref), squadModel (copy)
			return var1(p2, squadModel.format(p3.responseBody.groupUp))
		end,
		[networkingSquads.GetSquadActive.Succeeded.name] = function(p2, p3)
			-- upvalues: var1 (ref), squadModel (copy)
			local groupUp = p3.responseBody.groupUp
			
			return if groupUp then var1(p2, squadModel.format(groupUp)) else nil
		end,
		[networkingSquads.GetSquadFromSquadId.Succeeded.name] = function(p2, p3)
			-- upvalues: var1 (ref), squadModel (copy)
			local groupUp = p3.responseBody.groupUp
			
			return if groupUp and groupUp.groupUpId == (p2 and p2.squadId) then var1(p2, squadModel.format(groupUp)) else p2
		end,
		[networkingSquads.JoinSquad.Succeeded.name] = function(p2, p3)
			-- upvalues: var1 (ref), squadModel (copy)
			return var1(p2, squadModel.format(p3.responseBody.groupUp))
		end,
		[networkingSquads.LeaveSquad.Succeeded.name] = function(p2, p3)
			return if p2 and p2.squadId == p3.postBody.groupUpId then nil else p2
		end,
		[networkingSquads.ActOnPartyNudge.Succeeded.name] = function(p2, p3)
			-- upvalues: var1 (ref), squadModel (copy)
			local groupUp = p3.responseBody.groupUp
			
			return if groupUp then var1(p2, squadModel.format(groupUp)) else p2
		end,
		[currentSquadUpdated.name] = function(p2, p3)
			-- upvalues: var1 (ref), squadModel (copy)
			local squad = p3.payload.squad
			
			return if squad then var1(p2, squadModel.format(squad)) else nil
		end,
		[selfPermissionUpdated.name] = function(p2, p3)
			-- upvalues: fFlagEnableSquadRegroupExperimentation (copy), cryoModule (copy)
			if not fFlagEnableSquadRegroupExperimentation then
				return p2
			elseif p2 == nil then
				return p2
			end
			local selfPermissions = p3.payload and p3.payload.selfPermissions
			
			return if selfPermissions == nil then p2 else cryoModule.Dictionary.join(p2, {
				selfPermissions = cryoModule.Dictionary.join(p2.selfPermissions or {}, selfPermissions)
			})
		end
	}))
end