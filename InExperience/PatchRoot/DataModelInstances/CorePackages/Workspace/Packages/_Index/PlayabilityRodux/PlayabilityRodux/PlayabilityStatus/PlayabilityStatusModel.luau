local parent = script:FindFirstAncestor("PlayabilityRodux").Parent
local playabilityStatusEnum = require(parent.DiscoveryTypes).PlayabilityStatusEnum
local fFlagLuaAppPlayableUxTreatment = require(parent.SharedFlags).FFlagLuaAppPlayableUxTreatment
local resultModule = require(parent.Result)
local t = {
	new = function()
		return {}
	end
}

function t.mock()
	-- upvalues: t (ref), playabilityStatusEnum (ref)
	local var1 = t.new()
	var1.universeId = "149757"
	var1.isPlayable = true
	var1.playabilityStatus = playabilityStatusEnum.Playable
	
	return var1
end

function t.fromJsonData(p1)
	-- upvalues: resultModule (ref), t (ref), fFlagLuaAppPlayableUxTreatment (ref)
	if type(p1.universeId) ~= "number" and type(p1.universeId) ~= "string" then
		return resultModule.error("PlayabilityStatus.fromJsonData expects universeId to be a number or a string")
	elseif type(p1.isPlayable) ~= "boolean" then
		return resultModule.error("PlayabilityStatus.fromJsonData expects isPlayable to be a boolean")
	elseif type(p1.playabilityStatus) ~= "string" then
		return resultModule.error("PlayabilityStatus.fromJsonData expects playabilityStatus to be a string")
	end
	local var1 = t.new()
	var1.universeId = tostring(p1.universeId)
	var1.isPlayable = p1.isPlayable
	var1.playabilityStatus = p1.playabilityStatus
	var1.unplayableDisplayText = p1.unplayableDisplayText
	
	if type(p1.demoModeAvailable) == "boolean" then
		var1.demoModeAvailable = p1.demoModeAvailable
	end
	if fFlagLuaAppPlayableUxTreatment then
		local playableUxTreatment = p1.playableUxTreatment
		
		if playableUxTreatment and type(playableUxTreatment) == "table" and type(playableUxTreatment.treatment) == "string" then
			var1.playableUxTreatment = {
				treatment = playableUxTreatment.treatment,
				data = playableUxTreatment.data
			}
		end
	end
	return resultModule.success(var1)
end

return t