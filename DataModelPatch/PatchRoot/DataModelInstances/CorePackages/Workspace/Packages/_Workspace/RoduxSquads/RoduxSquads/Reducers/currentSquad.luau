local RoduxSquads = script:FindFirstAncestor("RoduxSquads")
local Parent = RoduxSquads.Parent
local CryoModule = require(Parent.Cryo)
local RoduxModule = require(Parent.Rodux)
local CurrentSquadUpdated = require(RoduxSquads.Actions).CurrentSquadUpdated
local SelfPermissionUpdated = require(RoduxSquads.Actions).SelfPermissionUpdated
local SquadModel = require(RoduxSquads.Models).SquadModel
local PersistStorageModule = require(RoduxSquads.Persists.PersistStorage)
local CreatePersistReducerFunction = require(RoduxSquads.Persists.PersistReducer).createPersistReducer
local _ = require(script.Parent.Parent.RoduxSquadsTypes)
local FFlagEnableSquadRegroupExperimentation = require(Parent.SharedFlags).FFlagEnableSquadRegroupExperimentation

return function(p1)
	-- upvalues: CryoModule (copy), FFlagEnableSquadRegroupExperimentation (copy), CreatePersistReducerFunction (copy), PersistStorageModule (copy), RoduxModule (copy), SquadModel (copy), CurrentSquadUpdated (copy), SelfPermissionUpdated (copy)
	local NetworkingSquads = p1.NetworkingSquads
	
	local function v11(p2, FormatResult)
		-- upvalues: CryoModule (upval), FFlagEnableSquadRegroupExperimentation (upval)
		if p2 ~= nil and p2.squadId == FormatResult.squadId then
			if FormatResult.deletedAtTime and FormatResult.deletedAtTime ~= "" then
				return nil
			end
			if p2.updatedAtTime < FormatResult.updatedAtTime then
				return FormatResult
			end
			if p2.updatedAtTime == FormatResult.updatedAtTime then
				if p2.parentChannelId ~= FormatResult.parentChannelId then
					return FormatResult
				end
				local SortResult = CryoModule.List.sort(CryoModule.List.map(p2.invitees, function(p3): string
					return tostring(p3.userId) .. tostring(p3.invitedAtTimestampMs)
				end))
				local SortResult1 = CryoModule.List.sort(CryoModule.List.map(FormatResult.invitees, function(p3): string
					return tostring(p3.userId) .. tostring(p3.invitedAtTimestampMs)
				end))
				
				if not CryoModule.List.equals(CryoModule.List.sort(CryoModule.List.map(p2.members, function(p3)
					return p3.userId
				end)), (CryoModule.List.sort(CryoModule.List.map(FormatResult.members, function(p3)
					return p3.userId
				end)))) or not CryoModule.List.equals(SortResult, SortResult1) then
					return FormatResult
				end
				if FFlagEnableSquadRegroupExperimentation then
					local SelfPermissions = p2.selfPermissions
					local SelfPermissions1 = FormatResult.selfPermissions
					
					if SelfPermissions == nil ~= (SelfPermissions1 == nil) then
						return FormatResult
					elseif SelfPermissions and SelfPermissions1 and not CryoModule.Dictionary.equals(SelfPermissions, SelfPermissions1) then
						return FormatResult
					end
				end
			end
		elseif FormatResult.deletedAtTime and FormatResult.deletedAtTime ~= "" then
			return p2
		elseif not p2 or p2.parentChannelId ~= FormatResult.parentChannelId then
			return FormatResult
		elseif p2.createdAtTime < FormatResult.createdAtTime then
			return FormatResult
		end
		return p2
	end
	
	return CreatePersistReducerFunction(CryoModule.Dictionary.join({ storage = PersistStorageModule.new("currentSquadStore") }, p1.currentSquad or {}), RoduxModule.createReducer(nil, {
		[NetworkingSquads.CreateOrJoinSquad.Succeeded.name] = function(p2, p3)
			-- upvalues: v11 (copy), SquadModel (upval)
			return (v11(p2, SquadModel.format(p3.responseBody.groupUp)))
		end,
		[NetworkingSquads.GetSquadActive.Succeeded.name] = function(p2, p3)
			-- upvalues: v11 (copy), SquadModel (upval)
			local GroupUp = p3.responseBody.groupUp
			
			return if GroupUp then v11(p2, SquadModel.format(GroupUp)) else nil
		end,
		[NetworkingSquads.GetSquadFromSquadId.Succeeded.name] = function(p2, p3)
			-- upvalues: v11 (copy), SquadModel (upval)
			local GroupUp = p3.responseBody.groupUp
			local SquadId = p2 and p2.squadId
			
			return if GroupUp and GroupUp.groupUpId == SquadId then v11(p2, SquadModel.format(GroupUp)) else p2
		end,
		[NetworkingSquads.JoinSquad.Succeeded.name] = function(p2, p3)
			-- upvalues: v11 (copy), SquadModel (upval)
			return (v11(p2, SquadModel.format(p3.responseBody.groupUp)))
		end,
		[NetworkingSquads.LeaveSquad.Succeeded.name] = function(p2, p3)
			local GroupUpId = p3.postBody.groupUpId
			
			return if p2 and p2.squadId == GroupUpId then nil else p2
		end,
		[NetworkingSquads.ActOnPartyNudge.Succeeded.name] = function(p2, p3)
			-- upvalues: v11 (copy), SquadModel (upval)
			local GroupUp = p3.responseBody.groupUp
			
			return if GroupUp then v11(p2, SquadModel.format(GroupUp)) else p2
		end,
		[CurrentSquadUpdated.name] = function(p2, p3)
			-- upvalues: v11 (copy), SquadModel (upval)
			local Squad = p3.payload.squad
			
			return if Squad then v11(p2, SquadModel.format(Squad)) else nil
		end,
		[SelfPermissionUpdated.name] = function(p2, p3)
			-- upvalues: FFlagEnableSquadRegroupExperimentation (upval), CryoModule (upval)
			if not FFlagEnableSquadRegroupExperimentation then
				return p2
			elseif p2 == nil then
				return p2
			else
				local SelfPermissions = p3.payload and p3.payload.selfPermissions
				
				return if SelfPermissions == nil then p2 else CryoModule.Dictionary.join(p2, {
					selfPermissions = CryoModule.Dictionary.join(p2.selfPermissions or {}, SelfPermissions)
				})
			end
		end
	}))
end