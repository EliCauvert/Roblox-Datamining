local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local _ = require(Parent.HttpClient)
local PromiseModule = require(Parent.Promise)
local CreateSignalFunction = require(Parent.Signals).createSignal
local SaveOutfitFailureEnumModule = require(AvatarWorkshop.Enums.SaveOutfitFailureEnum)
local _ = require(AvatarWorkshop.Stores.AvatarStateTypes)
local CreateOutfitRequestFromAvatarStateModule = require(AvatarWorkshop.Utils.createOutfitRequestFromAvatarState)
local PostCreateOutfitModule = require(AvatarWorkshop.WebApi.postCreateOutfit)

local function failed(Failure)
	return table.freeze({ success = false, failure = Failure })
end

local function _(p1)
	-- upvalues: SaveOutfitFailureEnumModule (copy)
	local StatusCode = if p1.response then p1.response.statusCode else nil
	
	return if StatusCode == 403 and p1.responseCode == 1 then SaveOutfitFailureEnumModule.OutfitLimitReached elseif StatusCode == 400 and p1.responseCode == 4 then SaveOutfitFailureEnumModule.InvalidName elseif StatusCode == 401 then SaveOutfitFailureEnumModule.PermissionDenied else SaveOutfitFailureEnumModule.Other
end

return function(p1)
	-- upvalues: CreateSignalFunction (copy), PromiseModule (copy), PostCreateOutfitModule (copy), CreateOutfitRequestFromAvatarStateModule (copy), failed (copy), SaveOutfitFailureEnumModule (copy)
	local P2 = p1 or {}
	local Signal, Signal2 = CreateSignalFunction(false)
	local Promise = nil
	local Config = nil
	local v1 = nil
	
	local function _(p2, p3): boolean
		-- upvalues: Config (ref), v1 (ref)
		local Config1 = Config
		
		return Config1 ~= nil and (p3 == v1 and (p2.humanoidDescription == Config1.humanoidDescription and p2.rigType == Config1.rigType) and p2.gearId == Config1.gearId)
	end
	
	local function createOutfit(p2, p3)
		-- upvalues: PromiseModule (upval), PostCreateOutfitModule (upval), CreateOutfitRequestFromAvatarStateModule (upval), P2 (copy), failed (upval), SaveOutfitFailureEnumModule (upval)
		return PromiseModule.try(function()
			-- upvalues: PostCreateOutfitModule (upval), CreateOutfitRequestFromAvatarStateModule (upval), p2 (copy), p3 (copy), P2 (upval)
			return PostCreateOutfitModule(CreateOutfitRequestFromAvatarStateModule(p2, p3), P2.network)
		end):andThen(function(Result)
			return table.freeze({ success = true, outfitId = Result })
		end):catch(function(Err)
			-- upvalues: failed (upval), SaveOutfitFailureEnumModule (upval)
			if typeof(Err) ~= "table" then
				warn("AvatarWorkshop: couldn't save the avatar as an outfit:", Err)
				
				return failed(SaveOutfitFailureEnumModule.Other)
			end
			local StatusCode = if Err.response then Err.response.statusCode else nil
			local OutfitLimitReached = if StatusCode == 403 and Err.responseCode == 1 then SaveOutfitFailureEnumModule.OutfitLimitReached elseif StatusCode == 400 and Err.responseCode == 4 then SaveOutfitFailureEnumModule.InvalidName elseif StatusCode == 401 then SaveOutfitFailureEnumModule.PermissionDenied else SaveOutfitFailureEnumModule.Other
			
			if OutfitLimitReached == SaveOutfitFailureEnumModule.Other then
				warn("AvatarWorkshop: couldn't save the avatar as an outfit:", Err.errorMessage or tostring(Err))
			end
			return failed(OutfitLimitReached)
		end)
	end
	
	local function handleFor(Promise)
		return Promise:andThen(function(Result)
			return Result
		end)
	end
	
	return {
		getIsSaving = Signal,
		saveAvatarAsOutfit = function(p2, p3)
			-- upvalues: Promise (ref), Config (ref), v1 (ref), handleFor (copy), PromiseModule (upval), failed (upval), SaveOutfitFailureEnumModule (upval), Signal2 (copy), createOutfit (copy), P2 (copy)
			if Promise then
				local Config1 = Config
				local IsGearIdMatch: boolean = Config1 ~= nil and (p3 == v1 and (p2.humanoidDescription == Config1.humanoidDescription and p2.rigType == Config1.rigType) and p2.gearId == Config1.gearId)
				
				return if IsGearIdMatch then handleFor(Promise) else PromiseModule.resolve(failed(SaveOutfitFailureEnumModule.SaveInProgress))
			end
			Signal2(true)
			local Flag = false
			
			local function finish()
				-- upvalues: Flag (ref), Promise (upval), Config (upval), v1 (upval), Signal2 (upval)
				if not Flag then
					Flag = true
					Promise = nil
					Config = nil
					v1 = nil
					Signal2(false)
					
					return
				end
			end
			
			local Promise1 = createOutfit(p2, p3):andThen(function(Result)
				-- upvalues: Flag (ref), Promise (upval), Config (upval), v1 (upval), Signal2 (upval), P2 (upval)
				if not Flag then
					Flag = true
					Promise = nil
					Config = nil
					v1 = nil
					Signal2(false)
				end
				if Result.success and P2.onOutfitCreated then
					xpcall(P2.onOutfitCreated, function(Err)
						warn("AvatarWorkshop: saved the avatar as an outfit, but onOutfitCreated failed:", Err)
					end, Result.outfitId)
				end
				return Result
			end)
			
			if not Flag then
				Promise = Promise1
				Config = {
					humanoidDescription = p2.humanoidDescription,
					rigType = p2.rigType,
					gearId = p2.gearId
				}
				v1 = p3
			end
			Promise1:finally(finish)
			
			return handleFor(Promise1)
		end
	}
end