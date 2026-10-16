local v1 = nil
local v2 = nil
local Flag = false
local Config = nil

local function defaultClock(): number --[[ Line: 17 ]]
	return os.clock()
end

local WebViewStateTrackerModule = {
	_setClockForTesting = function(p1) --[[ Line: 24 ]]
		-- upvalues: defaultClock (ref)
		defaultClock = p1
	end,
	markClosed = function() --[[ Line: 31 ]]
		-- upvalues: Flag (ref), v1 (ref), defaultClock (ref), Config (ref)
		if Flag or v1 == nil then
			v1 = defaultClock()
		end
		Flag = false
		Config = nil
	end,
	updateMetadata = function(Url, Title, IsVisible, HasBackButton) --[[ Line: 46 ]]
		-- upvalues: Config (ref)
		Config = {
			url = Url,
			title = Title,
			isVisible = IsVisible,
			hasBackButton = HasBackButton
		}
	end
}

function WebViewStateTrackerModule.markOpen(Url, Title, IsVisible, HasBackButton) --[[ Line: 67 ]]
	-- upvalues: Flag (ref), v2 (ref), defaultClock (ref), WebViewStateTrackerModule (copy)
	if not Flag or v2 == nil then
		v2 = defaultClock()
	end
	Flag = true
	WebViewStateTrackerModule.updateMetadata(Url, Title, IsVisible, HasBackButton)
end

function WebViewStateTrackerModule.isOpen() --[[ Line: 79 ]]
	-- upvalues: Flag (ref)
	return Flag
end

function WebViewStateTrackerModule.wasLastClosed() --[[ Line: 87 ]]
	-- upvalues: v1 (ref), defaultClock (ref)
	return if v1 == nil then -1 else defaultClock() - v1
end

function WebViewStateTrackerModule.getOpenDuration() --[[ Line: 99 ]]
	-- upvalues: v2 (ref), defaultClock (ref)
	return if v2 == nil then -1 else defaultClock() - v2
end

function WebViewStateTrackerModule.wasClosedWithin(p1): boolean --[[ Line: 112 ]]
	-- upvalues: v1 (ref), defaultClock (ref)
	return v1 ~= nil and defaultClock() - v1 <= p1
end

function WebViewStateTrackerModule.isOpenNoLongerThan(p1, p2) --[[ Line: 127 ]]
	-- upvalues: Flag (ref), v2 (ref), defaultClock (ref)
	return (not p1 or v2 ~= nil and (not Flag or p2 > defaultClock() - v2)) and Flag
end

function WebViewStateTrackerModule.getWebViewMetadata() --[[ Line: 143 ]]
	-- upvalues: Config (ref)
	return Config
end

return WebViewStateTrackerModule