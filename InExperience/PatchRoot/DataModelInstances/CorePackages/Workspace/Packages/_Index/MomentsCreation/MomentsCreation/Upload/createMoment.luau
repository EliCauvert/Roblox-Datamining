local captureService = game:GetService("CaptureService")
local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local _ = require(parent.MomentsTypes)
local eventNames = require(parent.MomentsCommon).Analytics.EventNames
local fireAnalyticsEventModule = require(momentsCreation.Analytics.fireAnalyticsEvent)
local _game = game
local captureServiceUploadUniverseIdOverrideEngineFeature = game:GetEngineFeature("CaptureServiceUploadUniverseIdOverride")
game:DefineFastString("MomentsUploadUniverseId", "8357232245")

local function _(p0) --[[ line: 46 | named "injectUniverseIdOverride" ]]
	-- upvalues: _game (ref)
	local gameId = _game.GameId
	
	if gameId == nil or gameId <= 0 then
		local cloned = table.clone(p0)
		cloned.universeIdOverride = tonumber(game:GetFastString("MomentsUploadUniverseId"))
		
		return cloned
	end
	return p0
end

return function(p1, p2, p3) --[[ line: 56 | named "createMoment" ]]
	-- upvalues: captureServiceUploadUniverseIdOverrideEngineFeature (ref), _game (ref), captureService (ref), fireAnalyticsEventModule (ref), eventNames (ref)
	local var6
	if captureServiceUploadUniverseIdOverrideEngineFeature then
		local gameId = _game.GameId
		
		if gameId == nil or gameId <= 0 then
			local cloned = table.clone(p2)
			cloned.universeIdOverride = tonumber(game:GetFastString("MomentsUploadUniverseId"))
			var6 = cloned
		else
			var6 = p2
		end
	else
		var6 = p2
	end
	pcall(function() --[[ line: 64 ]]
		-- upvalues: captureService (copy), p1 (ref), var6 (ref), p3 (ref)
		captureService:UploadCaptureAndPostMoment(p1, var6, p3)
	end)
	fireAnalyticsEventModule(eventNames.EditingFlowMomentPublished, {
		sourcePlaceId = tostring(p1.SourcePlaceId),
		localId = tostring(p1.LocalId),
		captureType = tostring(p1.CaptureType)
	})
end