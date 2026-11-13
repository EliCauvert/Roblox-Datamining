local GuiService = game:GetService("GuiService")
local TelemetryService = game:GetService("TelemetryService")
local Home = script:FindFirstAncestor("Home")
local Parent = Home.Parent
local ReactModule = require(Parent.React)
local GetSduiApiStoreFunction = require(Parent.SduiSharedUtilities).getSduiApiStore
local HomeConstantsModule = require(Home.HomeConstants)
local Delays = { 3, 10 }
local config = {
	eventName = "sduiHomeStartupSnapshot",
	description = "SDUI Home feed, mount and selection state shortly after Home mounts",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("SduiHomeStartupSnapshotHundredthsPercent", 10000),
	lastUpdated = { 26, 11, 12 }
}

local function _(Ancestor): string
	-- upvalues: GuiService (copy)
	local SelectedCoreObject = GuiService.SelectedCoreObject or GuiService.SelectedObject
	
	return if SelectedCoreObject == nil then "none" elseif Ancestor and SelectedCoreObject:IsDescendantOf(Ancestor) then "home" else "outside"
end

local function getSelectableBucket(Ancestor): string
	if Ancestor == nil then
		return "noFrame"
	end
	local Count = 0
	
	for _, Gui in Ancestor:GetDescendants() do
		if Gui:IsA("GuiObject") and Gui.Selectable and Gui.Visible then
			Count += 1
			
			if Count >= 6 then
				return "6+"
			end
		end
	end
	return if Count == 0 then "0" else "1-5"
end

local function logSnapshot(Stage, Ancestor, p1)
	-- upvalues: GetSduiApiStoreFunction (copy), HomeConstantsModule (copy), TelemetryService (copy), config (copy), GuiService (copy), getSelectableBucket (copy)
	local SduiApiStore = GetSduiApiStoreFunction()
	local ConfigKey = HomeConstantsModule.ConfigKey
	local StatusResult = SduiApiStore.getData(ConfigKey).status(false)
	local SelectedCoreObject = GuiService.SelectedCoreObject or GuiService.SelectedObject
	TelemetryService:LogEvent(config, {
		customFields = {
			stage = Stage,
			status = if StatusResult == "Ready" or StatusResult == "NotReady" or StatusResult == "Failed" then StatusResult else "unknown",
			hasRoot = tostring(SduiApiStore.getRootConfig(ConfigKey, false, HomeConstantsModule.FeedEntryCacheKey) ~= nil),
			inFlight = tostring(SduiApiStore.isInFlight(ConfigKey)),
			navFocused = if p1 then tostring(p1.isFocused()) else "unknown",
			selection = if SelectedCoreObject == nil then "none" elseif Ancestor and SelectedCoreObject:IsDescendantOf(Ancestor) then "home" else "outside",
			selectables = getSelectableBucket(Ancestor)
		},
		standardizedFields = { "addSessionInfo", "addOSInfo" }
	})
end

return function(Current, Current1)
	-- upvalues: ReactModule (copy), Delays (copy), logSnapshot (copy)
	local UseRefResult = ReactModule.useRef(Current)
	UseRefResult.current = Current
	local UseRefResult1 = ReactModule.useRef(Current1)
	UseRefResult1.current = Current1
	ReactModule.useEffect(function()
		-- upvalues: Delays (upval), logSnapshot (upval), UseRefResult (copy), UseRefResult1 (copy)
		local DelayedThreads = {}
		
		for i, delay in Delays do
			DelayedThreads[i] = task.delay(delay, function()
				-- upvalues: DelayedThreads (copy), i (copy), logSnapshot (upval), delay (copy), UseRefResult (upval), UseRefResult1 (upval)
				DelayedThreads[i] = nil
				pcall(logSnapshot, `{delay}s`, UseRefResult.current, UseRefResult1.current)
			end)
		end
		return function()
			-- upvalues: DelayedThreads (copy)
			for _, delayedThread in DelayedThreads do
				task.cancel(delayedThread)
			end
		end
	end, {})
end