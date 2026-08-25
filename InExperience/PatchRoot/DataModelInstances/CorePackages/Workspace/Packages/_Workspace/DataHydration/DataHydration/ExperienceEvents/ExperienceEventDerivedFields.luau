local localizationService = game:GetService("LocalizationService")
local parent = script:FindFirstAncestor("DataHydration").Parent
local _ = require(parent.Signals)
local createCurrentTimeSignal = require(parent.SignalsUtils).createCurrentTimeSignal
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local experienceEventTypesModule = require(script.Parent.ExperienceEventTypes)
local eventStatusCheckIntervalSec = game:DefineFastInt("EventStatusCheckIntervalSec", 30)

local function _(p0)
	if not p0 then
		return nil
	end
	local ok, status = pcall(DateTime.fromIsoDate, p0)
	
	return if ok and status ~= nil then status else nil
end

local function enrichWithTimestamps(p1)
	local var8, ok
	local eventStart = p1.eventStart
	
	if eventStart then
		ok, status = pcall(DateTime.fromIsoDate, eventStart)
		var8 = if ok and status ~= nil then status else nil
	else
		var8 = nil
	end
	local var9
	ok = p1.eventEnd
	
	if ok then
		local ok_1, status = pcall(DateTime.fromIsoDate, ok)
		var9 = if ok_1 and status ~= nil then status else nil
	else
		var9 = nil
	end
	p1.eventStartTimestamp = if var8 then var8.UnixTimestamp else nil
	p1.eventEndTimestamp = if var9 then var9.UnixTimestamp else nil
	
	return p1
end

local function deriveFormattedStartDate(p2, p3)
	-- upvalues: localizationService (ref)
	local var10
	local eventStart = p2.eventStart
	
	if eventStart then
		local ok, status = pcall(DateTime.fromIsoDate, eventStart)
		var10 = if ok and status ~= nil then status else nil
	else
		var10 = nil
	end
	if var10 then
		local robloxLocaleId = localizationService.RobloxLocaleId
		
		return p3:Format("Feature.VirtualEvents.Label.DateAtTime"):gsub("{date}", var10:FormatLocalTime(if var10:ToLocalTime().Year ~= DateTime.now():ToLocalTime().Year then "ddd, MMM DD" else "ll", robloxLocaleId)):gsub("{time}", var10:FormatLocalTime("LT", robloxLocaleId))
	end
	return nil
end

local eventStatus = experienceEventTypesModule.EventStatus

local function deriveFormattedRelativeTime(p4, p5, p6)
	-- upvalues: createCurrentTimeSignal (ref), eventStatusCheckIntervalSec (ref), deriveFormattedStartDate (ref)
	local eventStartTimestamp = p4.eventStartTimestamp
	local eventEndTimestamp = p4.eventEndTimestamp
	
	if not eventStartTimestamp and not eventEndTimestamp then
		return nil
	end
	local var11 = createCurrentTimeSignal(eventStatusCheckIntervalSec)(p5)
	
	if eventStartTimestamp and var11 < eventStartTimestamp then
		local var12 = eventStartTimestamp - var11
		
		if var12 >= 604800 then
			return deriveFormattedStartDate(p4, p6)
		end
		local floored = math.floor(var12 / 86400)
		
		if floored >= 2 then
			return p6:Format("Feature.VirtualEvents.Label.InDays"):gsub("{number}", tostring(floored))
		elseif floored == 1 then
			return p6:Format("Feature.VirtualEvents.Label.StartsInOneDay")
		end
		local floored_1 = math.floor(var12 / 3600)
		
		if floored_1 >= 2 then
			return p6:Format("Feature.VirtualEvents.Label.StartsInHours"):gsub("{number}", tostring(floored_1))
		elseif floored_1 == 1 then
			return p6:Format("Feature.VirtualEvents.Label.StartsInOneHour")
		end
		local floored_2 = math.floor(var12 / 60)
		
		return if floored_2 >= 2 then p6:Format("Feature.VirtualEvents.Label.StartsInMinutes"):gsub("{number}", tostring(floored_2)) elseif floored_2 == 1 then p6:Format("Feature.VirtualEvents.Label.StartsInOneMin") else p6:Format("Feature.VirtualEvents.Label.StartsNow")
	else
		return if eventEndTimestamp and eventEndTimestamp <= var11 then p6:Format("Feature.VirtualEvents.Label.Ended") else p6:Format("Feature.VirtualEvents.Label.HappeningNow")
	end
end

local function deriveEventStatus(p7, p8)
	-- upvalues: eventStatus (ref), createCurrentTimeSignal (ref), eventStatusCheckIntervalSec (ref)
	local eventStartTimestamp = p7.eventStartTimestamp
	
	if not eventStartTimestamp then
		return eventStatus.Upcoming
	end
	local eventEndTimestamp = p7.eventEndTimestamp
	local var16 = createCurrentTimeSignal(eventStatusCheckIntervalSec)(p8)
	
	return if var16 < eventStartTimestamp then if eventStartTimestamp - var16 <= 14400 then eventStatus.UpcomingImminent else eventStatus.Upcoming elseif eventEndTimestamp and eventEndTimestamp <= var16 then eventStatus.Elapsed elseif eventEndTimestamp and eventEndTimestamp - var16 <= 14400 then eventStatus.ElapsedImminent else eventStatus.Ongoing
end

local _ = function(p9, p10)
	-- upvalues: deriveEventStatus (ref), eventStatus (ref)
	local var17 = deriveEventStatus(p9, p10)
	
	return if var17 ~= eventStatus.Ongoing then var17 == eventStatus.ElapsedImminent else true
end

local function deriveShareUrl(p11)
	-- upvalues: urlBuilder (ref)
	local id = p11.id
	
	return if id then urlBuilder.virtualevents.appsflyer({ eventId = tostring(id) }) else nil
end

return {
	enrichWithTimestamps = enrichWithTimestamps,
	calculateDerivedField = function(p12, p13, p14, p15)
		-- upvalues: deriveFormattedStartDate (ref), deriveEventStatus (ref), eventStatus (ref), deriveFormattedRelativeTime (ref), deriveShareUrl (ref)
		if not p13 then
			return nil
		elseif p12 == "formattedStartDate" then
			return deriveFormattedStartDate(p13, p15)
		elseif p12 == "eventStatus" then
			return deriveEventStatus(p13, p14)
		elseif p12 == "isActive" then
			local var18 = deriveEventStatus(p13, p14)
			
			return if var18 ~= eventStatus.Ongoing then var18 == eventStatus.ElapsedImminent else true
		end
		return if p12 == "formattedRelativeTime" then deriveFormattedRelativeTime(p13, p14, p15) elseif p12 == "shareUrl" then deriveShareUrl(p13) else nil
	end
}