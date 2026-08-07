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

return function(p0) --[[ line: 27 ]]
	-- upvalues: chatEntryPointNames (ref), loggerModule (ref), getFFlagIsSquadEnabled (ref), useSelector (ref), rbxAnalyticsService (ref), reactModule (ref), analyticsFactory (ref), eventStreamActionListModule (ref), diagActionListModule (ref), defaultAnalyticsService (ref), roactChatAnalyticsContextModule (ref)
	local entryPoint = p0.entryPoint
	
	if not entryPoint or not chatEntryPointNames[entryPoint] then
		loggerModule:warning("entryPoint=" .. tostring(entryPoint) .. " is not a reigstered value.")
		entryPoint = chatEntryPointNames.Unknown
	end
	local var7 = if getFFlagIsSquadEnabled() then useSelector(function(p1) --[[ line: 36 ]]
		local currentSquad = p1.Squad and (p1.Squad.Squad and p1.Squad.Squad.currentSquad)
		
		return if currentSquad and currentSquad.squadId then currentSquad.squadId else nil
	end) else nil
	local playSessionId = rbxAnalyticsService:GetPlaySessionId()
	
	return reactModule.createElement(roactChatAnalyticsContextModule.Provider, {
		value = reactModule.useMemo(function() --[[ line: 44 ]]
			-- upvalues: analyticsFactory (copy), eventStreamActionListModule (copy), diagActionListModule (copy), defaultAnalyticsService (copy), getFFlagIsSquadEnabled (copy), var7 (ref), entryPoint (write), playSessionId (ref)
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
					squadId = if getFFlagIsSquadEnabled() then var7 else nil,
					entryPoint = entryPoint,
					playSessionId = playSessionId
				}
			})()
		end, { var7, entryPoint, playSessionId })
	}, p0.children)
end