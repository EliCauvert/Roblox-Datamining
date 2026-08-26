local localizationService = game:GetService("LocalizationService")
local parent = script:FindFirstAncestor("DataHydration").Parent
local _ = require(parent.Signals)
local createCurrentTimeSignal = require(parent.SignalsUtils).createCurrentTimeSignal
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local experienceEventTypesModule = require(script.Parent.ExperienceEventTypes)
local eventStatusCheckIntervalSec = game:DefineFastInt("EventStatusCheckIntervalSec", 30)

local function _(p1)
	if not p1 then
		return nil
	end
	local ok, status = pcall(DateTime.fromIsoDate, p1)
	
	return if ok and status ~= nil then status else nil
end

local function enrichWithTimestamps(p1)
	local var1, ok
	local eventStart = p1.eventStart
	
	if eventStart then
		ok, status = pcall(DateTime.fromIsoDate, eventStart)
		var1 = if ok and status ~= nil then status else nil
	else
		var1 = nil
	end
	local var2
	ok = p1.eventEnd
	
	if ok then
		local ok_1, status = pcall(DateTime.fromIsoDate, ok)
		var2 = if ok_1 and status ~= nil then status else nil
	else
		var2 = nil
	end
	p1.eventStartTimestamp = if var1 then var1.UnixTimestamp else nil
	p1.eventEndTimestamp = if var2 then var2.UnixTimestamp else nil
	
	return p1
end

local function deriveFormattedStartDate(p1, p2)
	-- upvalues: localizationService (ref)
	local var1
	local eventStart = p1.eventStart
	
	if eventStart then
		local ok, status = pcall(DateTime.fromIsoDate, eventStart)
		var1 = if ok and status ~= nil then status else nil
	else
		var1 = nil
	end
	if var1 then
		local robloxLocaleId = localizationService.RobloxLocaleId
		
		return p2:Format("Feature.VirtualEvents.Label.DateAtTime"):gsub("{date}", var1:FormatLocalTime(if var1:ToLocalTime().Year ~= DateTime.now():ToLocalTime().Year then "ddd, MMM DD" else "ll", robloxLocaleId)):gsub("{time}", var1:FormatLocalTime("LT", robloxLocaleId))
	end
	return nil
end

local eventStatus = experienceEventTypesModule.EventStatus

local function deriveFormattedRelativeTime(p1, p2, p3)
	-- upvalues: createCurrentTimeSignal (ref), eventStatusCheckIntervalSec (ref), deriveFormattedStartDate (ref)
	local eventStartTimestamp = p1.eventStartTimestamp
	local eventEndTimestamp = p1.eventEndTimestamp
	
	if not eventStartTimestamp and not eventEndTimestamp then
		return nil
	end
	local var1 = createCurrentTimeSignal(eventStatusCheckIntervalSec)(p2)
	
	if eventStartTimestamp and var1 < eventStartTimestamp then
		local var2 = eventStartTimestamp - var1
		
		if var2 >= 604800 then
			return deriveFormattedStartDate(p1, p3)
		end
		local floored = math.floor(var2 / 86400)
		
		if floored >= 2 then
			return p3:Format("Feature.VirtualEvents.Label.InDays"):gsub("{number}", tostring(floored))
		elseif floored == 1 then
			return p3:Format("Feature.VirtualEvents.Label.StartsInOneDay")
		end
		local floored_1 = math.floor(var2 / 3600)
		
		if floored_1 >= 2 then
			return p3:Format("Feature.VirtualEvents.Label.StartsInHours"):gsub("{number}", tostring(floored_1))
		elseif floored_1 == 1 then
			return p3:Format("Feature.VirtualEvents.Label.StartsInOneHour")
		end
		local floored_2 = math.floor(var2 / 60)
		
		return if floored_2 >= 2 then p3:Format("Feature.VirtualEvents.Label.StartsInMinutes"):gsub("{number}", tostring(floored_2)) elseif floored_2 == 1 then p3:Format("Feature.VirtualEvents.Label.StartsInOneMin") else p3:Format("Feature.VirtualEvents.Label.StartsNow")
	else
		return if eventEndTimestamp and eventEndTimestamp <= var1 then p3:Format("Feature.VirtualEvents.Label.Ended") else p3:Format("Feature.VirtualEvents.Label.HappeningNow")
	end
end

local function deriveEventStatus(p1, p2)
	-- upvalues: eventStatus (ref), createCurrentTimeSignal (ref), eventStatusCheckIntervalSec (ref)
	local eventStartTimestamp = p1.eventStartTimestamp
	
	if not eventStartTimestamp then
		return eventStatus.Upcoming
	end
	local eventEndTimestamp = p1.eventEndTimestamp
	local var1 = createCurrentTimeSignal(eventStatusCheckIntervalSec)(p2)
	
	return if var1 < eventStartTimestamp then if eventStartTimestamp - var1 <= 14400 then eventStatus.UpcomingImminent else eventStatus.Upcoming elseif eventEndTimestamp and eventEndTimestamp <= var1 then eventStatus.Elapsed elseif eventEndTimestamp and eventEndTimestamp - var1 <= 14400 then eventStatus.ElapsedImminent else eventStatus.Ongoing
end

local _ = function(p1, p2)
	-- upvalues: deriveEventStatus (ref), eventStatus (ref)
	local var1 = deriveEventStatus(p1, p2)
	
	return if var1 ~= eventStatus.Ongoing then var1 == eventStatus.ElapsedImminent else true
end

local function deriveShareUrl(p1)
	-- upvalues: urlBuilder (ref)
	local id = p1.id
	
	return if id then urlBuilder.virtualevents.appsflyer({ eventId = tostring(id) }) else nil
end

return {
	enrichWithTimestamps = enrichWithTimestamps,
	calculateDerivedField = function(p1, p2, p3, p4)
		-- upvalues: deriveFormattedStartDate (ref), deriveEventStatus (ref), eventStatus (ref), deriveFormattedRelativeTime (ref), deriveShareUrl (ref)
		if not p2 then
			return nil
		elseif p1 == "formattedStartDate" then
			return deriveFormattedStartDate(p2, p4)
		elseif p1 == "eventStatus" then
			return deriveEventStatus(p2, p3)
		elseif p1 == "isActive" then
			local var1 = deriveEventStatus(p2, p3)
			
			return if var1 ~= eventStatus.Ongoing then var1 == eventStatus.ElapsedImminent else true
		end
		return if p1 == "formattedRelativeTime" then deriveFormattedRelativeTime(p2, p3, p4) elseif p1 == "shareUrl" then deriveShareUrl(p2) else nil
	end
}