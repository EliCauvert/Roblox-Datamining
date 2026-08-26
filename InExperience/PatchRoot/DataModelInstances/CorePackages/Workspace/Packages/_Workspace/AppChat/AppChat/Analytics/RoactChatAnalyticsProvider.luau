local parent = script.Parent.Parent.Parent
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local analyticsFactory = socialLuaAnalyticsModule.Analytics.AnalyticsFactory
local defaultAnalyticsService = socialLuaAnalyticsModule.Analytics.DefaultAnalyticsService
local eventStreamActionListModule = require(script.Parent.EventStreamActionList)
local diagActionListModule = require(script.Parent.DiagActionList)
local reactModule = require(parent.React)
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local roactChatAnalyticsContextModule = require(script.Parent.RoactChatAnalyticsContext)
local loggerModule = require(script.Parent.Logger)
local chatEntryPointNames = require(parent.SocialCommon).Enums.ChatEntryPointNames
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p1)
	-- upvalues: chatEntryPointNames (ref), loggerModule (ref), getFFlagIsSquadEnabled (ref), useSelector (ref), rbxAnalyticsService (ref), reactModule (ref), analyticsFactory (ref), eventStreamActionListModule (ref), diagActionListModule (ref), defaultAnalyticsService (ref), roactChatAnalyticsContextModule (ref)
	local entryPoint = p1.entryPoint
	
	if not entryPoint or not chatEntryPointNames[entryPoint] then
		loggerModule:warning("entryPoint=" .. tostring(entryPoint) .. " is not a reigstered value.")
		entryPoint = chatEntryPointNames.Unknown
	end
	local var1 = if getFFlagIsSquadEnabled() then useSelector(function(p2)
		local currentSquad = p2.Squad and (p2.Squad.Squad and p2.Squad.Squad.currentSquad)
		
		return if currentSquad and currentSquad.squadId then currentSquad.squadId else nil
	end) else nil
	local playSessionId = rbxAnalyticsService:GetPlaySessionId()
	
	return reactModule.createElement(roactChatAnalyticsContextModule.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: analyticsFactory (copy), eventStreamActionListModule (copy), diagActionListModule (copy), defaultAnalyticsService (copy), getFFlagIsSquadEnabled (copy), var1 (ref), entryPoint (write), playSessionId (ref)
			return analyticsFactory.setUpAnalyticsFactory({
				eventLists = {
					EventStream = eventStreamActionListModule,
					Diag = diagActionListModule
				},
				analyticsImpl = {
					EventStream = defaultAnalyticsService.EventStream,
					Diag = defaultAnalyticsService.Diag
				},
				staticInfoForAllEvents = {
					channelsApiEnabled = true,
					squadId = if getFFlagIsSquadEnabled() then var1 else nil,
					entryPoint = entryPoint,
					playSessionId = playSessionId
				}
			})()
		end, { var1, entryPoint, playSessionId })
	}, p1.children)
end