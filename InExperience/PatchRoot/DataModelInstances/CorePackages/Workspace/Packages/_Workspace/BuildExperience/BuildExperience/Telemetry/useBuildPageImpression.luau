local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)

return function(Page, p1, Enabled)
	-- upvalues: ReactModule (copy), SendBuildExperienceEventModule (copy)
	local UniverseId = if p1 == nil then nil else p1.universeId
	local PlaceId = if p1 == nil then nil else p1.placeId
	local SessionId = if p1 == nil then nil else p1.sessionId
	local IsEnabled = Enabled ~= false
	ReactModule.useEffect(function()
		-- upvalues: IsEnabled (copy), Page (copy), SendBuildExperienceEventModule (upval), UniverseId (copy), PlaceId (copy), SessionId (copy)
		if IsEnabled then
			SendBuildExperienceEventModule("PAGE_IMPRESSION", {
				universeId = UniverseId,
				placeId = PlaceId,
				conversationId = SessionId
			}, {
				page = Page,
				surface = if game.GameId == 0 then "app" else "in_experience"
			})
			
			return
		end
	end, { Page, UniverseId, IsEnabled })
end