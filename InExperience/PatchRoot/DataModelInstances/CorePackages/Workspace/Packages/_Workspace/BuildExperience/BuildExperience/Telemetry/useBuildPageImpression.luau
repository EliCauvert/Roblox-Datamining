local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)

return function(Page, p1, Enabled, p2)
	-- upvalues: ReactModule (copy), SendBuildExperienceEventModule (copy)
	local UniverseId = if p1 == nil then nil else p1.universeId
	local PlaceId = if p1 == nil then nil else p1.placeId
	local SessionId = if p1 == nil then nil else p1.sessionId
	local IsEnabled = Enabled ~= false
	ReactModule.useEffect(function()
		-- upvalues: IsEnabled (copy), Page (copy), p2 (copy), SendBuildExperienceEventModule (upval), UniverseId (copy), PlaceId (copy), SessionId (copy)
		if not IsEnabled then return end
		local config = {
			page = Page,
			isInExperience = if game.GameId == 0 then "false" else "true"
		}
		
		if p2 ~= nil then
			for i, value in p2 do
				config[i] = value
			end
		end
		SendBuildExperienceEventModule("PAGE_IMPRESSION", {
			universeId = UniverseId,
			placeId = PlaceId,
			conversationId = SessionId
		}, config)
	end, { Page, UniverseId, IsEnabled })
end