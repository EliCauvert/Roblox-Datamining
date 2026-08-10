local parent = script:FindFirstAncestor("PlayabilityRodux").Parent
local playabilityStatusEnum = require(parent.DiscoveryTypes).PlayabilityStatusEnum
local fFlagLuaAppPlayableUxTreatment = require(parent.SharedFlags).FFlagLuaAppPlayableUxTreatment
local fFlagLuaAppDemoModePlayButton = require(parent.SharedFlags).FFlagLuaAppDemoModePlayButton
local resultModule = require(parent.Result)
local t = {
	new = function() --[[ line: 48 ]]
		return {}
	end
}

function t.mock() --[[ line: 54 ]]
	-- upvalues: t (ref), playabilityStatusEnum (ref)
	local var2 = t.new()
	var2.universeId = "149757"
	var2.isPlayable = true
	var2.playabilityStatus = playabilityStatusEnum.Playable
	
	return var2
end

function t.fromJsonData(p0) --[[ line: 63 ]]
	-- upvalues: resultModule (ref), t (ref), fFlagLuaAppDemoModePlayButton (ref), fFlagLuaAppPlayableUxTreatment (ref)
	if type(p0.universeId) ~= "number" and type(p0.universeId) ~= "string" then
		return resultModule.error("PlayabilityStatus.fromJsonData expects universeId to be a number or a string")
	elseif type(p0.isPlayable) ~= "boolean" then
		return resultModule.error("PlayabilityStatus.fromJsonData expects isPlayable to be a boolean")
	elseif type(p0.playabilityStatus) ~= "string" then
		return resultModule.error("PlayabilityStatus.fromJsonData expects playabilityStatus to be a string")
	end
	local var3 = t.new()
	var3.universeId = tostring(p0.universeId)
	var3.isPlayable = p0.isPlayable
	var3.playabilityStatus = p0.playabilityStatus
	var3.unplayableDisplayText = p0.unplayableDisplayText
	
	if fFlagLuaAppDemoModePlayButton and type(p0.demoModeAvailable) == "boolean" then
		var3.demoModeAvailable = p0.demoModeAvailable
	end
	if fFlagLuaAppPlayableUxTreatment then
		local playableUxTreatment = p0.playableUxTreatment
		
		if playableUxTreatment and type(playableUxTreatment) == "table" and type(playableUxTreatment.treatment) == "string" then
			var3.playableUxTreatment = {
				treatment = playableUxTreatment.treatment,
				data = playableUxTreatment.data
			}
		end
	end
	return resultModule.success(var3)
end

return t