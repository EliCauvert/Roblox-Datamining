local LocalizationService = game:GetService("LocalizationService")
local Parent = script:FindFirstAncestor("DataHydration").Parent
local _ = require(Parent.Signals)
local CreateCurrentTimeSignalFunction = require(Parent.SignalsUtils).createCurrentTimeSignal
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local EventStatusCheckIntervalSec = game:DefineFastInt("EventStatusCheckIntervalSec", 30)

local function _(p1)
	if p1 then
		local Success, Result = pcall(DateTime.fromIsoDate, p1)
		
		return if Success and Result ~= nil then Result else nil
	else
		return nil
	end
end

local function deriveFormattedStartDate(p1, p2)
	-- upvalues: LocalizationService (copy)
	local EventStart = p1.eventStart
	local v1 = nil
	
	if EventStart then
		local Success, Result = pcall(DateTime.fromIsoDate, EventStart)
		v1 = if Success and Result ~= nil then Result else nil
	else
		v1 = nil
	end
	if v1 then
		local RobloxLocaleId = LocalizationService.RobloxLocaleId
		
		return p2:Format("Feature.VirtualEvents.Label.DateAtTime"):gsub("{date}", (v1:FormatLocalTime(if v1:ToLocalTime().Year == DateTime.now():ToLocalTime().Year then "ddd, MMM DD" else "ll", RobloxLocaleId))):gsub("{time}", (v1:FormatLocalTime("LT", RobloxLocaleId)))
	else
		return nil
	end
end

local EventStatus = require(script.Parent.ExperienceEventTypes).EventStatus

local function deriveFormattedRelativeTime(p1, p2, p3)
	-- upvalues: CreateCurrentTimeSignalFunction (copy), EventStatusCheckIntervalSec (copy), deriveFormattedStartDate (copy)
	local EventStartTimestamp = p1.eventStartTimestamp
	local EventEndTimestamp = p1.eventEndTimestamp
	
	if not EventStartTimestamp and not EventEndTimestamp then
		return nil
	end
	local v1 = CreateCurrentTimeSignalFunction(EventStatusCheckIntervalSec)(p2)
	
	if not EventStartTimestamp or v1 >= EventStartTimestamp then
		return if EventEndTimestamp and EventEndTimestamp <= v1 then p3:Format("Feature.VirtualEvents.Label.Ended") else p3:Format("Feature.VirtualEvents.Label.HappeningNow")
	end
	local EventStartTimestampDelta = EventStartTimestamp - v1
	
	if EventStartTimestampDelta >= 604800 then
		return deriveFormattedStartDate(p1, p3)
	end
	local Floored = math.floor(EventStartTimestampDelta / 86400)
	
	if Floored >= 2 then
		return p3:Format("Feature.VirtualEvents.Label.InDays"):gsub("{number}", (tostring(Floored)))
	elseif Floored == 1 then
		return p3:Format("Feature.VirtualEvents.Label.StartsInOneDay")
	else
		local Floored1 = math.floor(EventStartTimestampDelta / 3600)
		
		if Floored1 >= 2 then
			return p3:Format("Feature.VirtualEvents.Label.StartsInHours"):gsub("{number}", (tostring(Floored1)))
		elseif Floored1 == 1 then
			return p3:Format("Feature.VirtualEvents.Label.StartsInOneHour")
		else
			local Floored2 = math.floor(EventStartTimestampDelta / 60)
			
			return if Floored2 >= 2 then p3:Format("Feature.VirtualEvents.Label.StartsInMinutes"):gsub("{number}", (tostring(Floored2))) elseif Floored2 == 1 then p3:Format("Feature.VirtualEvents.Label.StartsInOneMin") else p3:Format("Feature.VirtualEvents.Label.StartsNow")
		end
	end
end

local function deriveEventStatus(p1, p2)
	-- upvalues: EventStatus (copy), CreateCurrentTimeSignalFunction (copy), EventStatusCheckIntervalSec (copy)
	local EventStartTimestamp = p1.eventStartTimestamp
	
	if EventStartTimestamp then
		local EventEndTimestamp = p1.eventEndTimestamp
		local v1 = CreateCurrentTimeSignalFunction(EventStatusCheckIntervalSec)(p2)
		
		return if v1 < EventStartTimestamp then if EventStartTimestamp - v1 <= 14400 then EventStatus.UpcomingImminent else EventStatus.Upcoming elseif EventEndTimestamp and EventEndTimestamp <= v1 then EventStatus.Elapsed elseif EventEndTimestamp and EventEndTimestamp - v1 <= 14400 then EventStatus.ElapsedImminent else EventStatus.Ongoing
	else
		return EventStatus.Upcoming
	end
end

local _ = function(p1, p2): boolean
	-- upvalues: deriveEventStatus (copy), EventStatus (copy)
	local DeriveEventStatusResult = deriveEventStatus(p1, p2)
	
	return DeriveEventStatusResult == EventStatus.Ongoing or DeriveEventStatusResult == EventStatus.ElapsedImminent
end

local function deriveShareUrl(p1)
	-- upvalues: UrlBuilder (copy)
	local Id = p1.id
	
	return if Id then UrlBuilder.virtualevents.appsflyer({ eventId = tostring(Id) }) else nil
end

return {
	enrichWithTimestamps = function(p1)
		local EventStart = p1.eventStart
		local v1 = nil
		
		if EventStart then
			local Success, Result = pcall(DateTime.fromIsoDate, EventStart)
			v1 = if Success and Result ~= nil then Result else nil
		else
			v1 = nil
		end
		local EventEnd = p1.eventEnd
		local v2 = nil
		
		if EventEnd then
			local Success1, Result1 = pcall(DateTime.fromIsoDate, EventEnd)
			v2 = if Success1 and Result1 ~= nil then Result1 else nil
		else
			v2 = nil
		end
		p1.eventStartTimestamp = if v1 then v1.UnixTimestamp else nil
		p1.eventEndTimestamp = if v2 then v2.UnixTimestamp else nil
		
		return p1
	end,
	calculateDerivedField = function(p1, p2, p3, p4)
		-- upvalues: deriveFormattedStartDate (copy), deriveEventStatus (copy), EventStatus (copy), deriveFormattedRelativeTime (copy), deriveShareUrl (copy)
		if not p2 then
			return nil
		elseif p1 == "formattedStartDate" then
			return deriveFormattedStartDate(p2, p4)
		elseif p1 == "eventStatus" then
			return (deriveEventStatus(p2, p3))
		elseif p1 == "isActive" then
			local DeriveEventStatusResult = deriveEventStatus(p2, p3)
			
			return DeriveEventStatusResult == EventStatus.Ongoing or DeriveEventStatusResult == EventStatus.ElapsedImminent
		else
			return if p1 == "formattedRelativeTime" then deriveFormattedRelativeTime(p2, p3, p4) elseif p1 == "shareUrl" then deriveShareUrl(p2) else nil
		end
	end
}