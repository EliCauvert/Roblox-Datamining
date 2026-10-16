local Parent = script.Parent.Parent.Parent
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local SocialLuaAnalyticsModule = require(Parent.SocialLuaAnalytics)
local AnalyticsFactory = SocialLuaAnalyticsModule.Analytics.AnalyticsFactory
local DefaultAnalyticsService = SocialLuaAnalyticsModule.Analytics.DefaultAnalyticsService
local EventStreamActionListModule = require(script.Parent.EventStreamActionList)
local DiagActionListModule = require(script.Parent.DiagActionList)
local ReactModule = require(Parent.React)
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local RoactChatAnalyticsContextModule = require(script.Parent.RoactChatAnalyticsContext)
local LoggerModule = require(script.Parent.Logger)
local ChatEntryPointNames = require(Parent.SocialCommon).Enums.ChatEntryPointNames
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p1) --[[ Line: 27 ]]
	-- upvalues: ChatEntryPointNames (copy), LoggerModule (copy), GetFFlagIsSquadEnabledFunction (copy), UseSelectorFunction (copy), RbxAnalyticsService (copy), ReactModule (copy), AnalyticsFactory (copy), EventStreamActionListModule (copy), DiagActionListModule (copy), DefaultAnalyticsService (copy), RoactChatAnalyticsContextModule (copy)
	local EntryPoint = p1.entryPoint
	
	if not EntryPoint or not ChatEntryPointNames[EntryPoint] then
		LoggerModule:warning("entryPoint=" .. tostring(EntryPoint) .. " is not a reigstered value.")
		EntryPoint = ChatEntryPointNames.Unknown
	end
	local UseSelectorResult = if GetFFlagIsSquadEnabledFunction() then UseSelectorFunction(function(p2) --[[ Line: 36 ]]
		local CurrentSquad = p2.Squad and (p2.Squad.Squad and p2.Squad.Squad.currentSquad)
		
		return if CurrentSquad and CurrentSquad.squadId then CurrentSquad.squadId else nil
	end) else nil
	local PlaySessionId = RbxAnalyticsService:GetPlaySessionId()
	
	return ReactModule.createElement(RoactChatAnalyticsContextModule.Provider, {
		value = ReactModule.useMemo(function() --[[ Line: 44 ]]
			-- upvalues: AnalyticsFactory (upval), EventStreamActionListModule (upval), DiagActionListModule (upval), DefaultAnalyticsService (upval), GetFFlagIsSquadEnabledFunction (upval), UseSelectorResult (copy), EntryPoint (ref), PlaySessionId (copy)
			return AnalyticsFactory.setUpAnalyticsFactory({
				eventLists = {
					EventStream = EventStreamActionListModule,
					Diag = DiagActionListModule
				},
				analyticsImpl = {
					EventStream = DefaultAnalyticsService.EventStream,
					Diag = DefaultAnalyticsService.Diag
				},
				staticInfoForAllEvents = {
					channelsApiEnabled = true,
					squadId = if GetFFlagIsSquadEnabledFunction() then UseSelectorResult else nil,
					entryPoint = EntryPoint,
					playSessionId = PlaySessionId
				}
			})()
		end, { UseSelectorResult, EntryPoint, PlaySessionId })
	}, p1.children)
end