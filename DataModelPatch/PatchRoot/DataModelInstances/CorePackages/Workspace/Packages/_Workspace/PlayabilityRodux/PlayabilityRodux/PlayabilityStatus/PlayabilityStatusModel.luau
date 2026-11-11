local Parent = script:FindFirstAncestor("PlayabilityRodux").Parent
local PlayabilityStatusEnum = require(Parent.DiscoveryTypes).PlayabilityStatusEnum
local FFlagLuaAppPlayableUxTreatment = require(Parent.SharedFlags).FFlagLuaAppPlayableUxTreatment
local ResultModule = require(Parent.Result)
local PlayabilityStatusModelModule = {
	new = function()
		return {}
	end
}

function PlayabilityStatusModelModule.mock()
	-- upvalues: PlayabilityStatusModelModule (copy), PlayabilityStatusEnum (copy)
	local NewPlayabilityStatusModel = PlayabilityStatusModelModule.new()
	NewPlayabilityStatusModel.universeId = "149757"
	NewPlayabilityStatusModel.isPlayable = true
	NewPlayabilityStatusModel.playabilityStatus = PlayabilityStatusEnum.Playable
	
	return NewPlayabilityStatusModel
end

function PlayabilityStatusModelModule.fromJsonData(p1)
	-- upvalues: ResultModule (copy), PlayabilityStatusModelModule (copy), FFlagLuaAppPlayableUxTreatment (copy)
	if type(p1.universeId) ~= "number" and type(p1.universeId) ~= "string" then
		return ResultModule.error("PlayabilityStatus.fromJsonData expects universeId to be a number or a string")
	end
	if type(p1.isPlayable) ~= "boolean" then
		return ResultModule.error("PlayabilityStatus.fromJsonData expects isPlayable to be a boolean")
	end
	if type(p1.playabilityStatus) ~= "string" then
		return ResultModule.error("PlayabilityStatus.fromJsonData expects playabilityStatus to be a string")
	end
	local NewPlayabilityStatusModel = PlayabilityStatusModelModule.new()
	NewPlayabilityStatusModel.universeId = tostring(p1.universeId)
	NewPlayabilityStatusModel.isPlayable = p1.isPlayable
	NewPlayabilityStatusModel.playabilityStatus = p1.playabilityStatus
	NewPlayabilityStatusModel.unplayableDisplayText = p1.unplayableDisplayText
	
	if FFlagLuaAppPlayableUxTreatment then
		local PlayableUxTreatment = p1.playableUxTreatment
		
		if PlayableUxTreatment and type(PlayableUxTreatment) == "table" and type(PlayableUxTreatment.treatment) == "string" then
			NewPlayabilityStatusModel.playableUxTreatment = {
				treatment = PlayableUxTreatment.treatment,
				data = PlayableUxTreatment.data
			}
		end
	end
	return ResultModule.success(NewPlayabilityStatusModel)
end

return PlayabilityStatusModelModule