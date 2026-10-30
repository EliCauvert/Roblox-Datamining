local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local NotificationsOrchestrator = script:FindFirstAncestor("NotificationsOrchestrator")
local Parent = NotificationsOrchestrator.Parent
local LocalUserIdStore = require(Parent.LocalUserIdStore).LocalUserIdStore
local SafeAppStorageService = require(Parent.AvatarExperienceCommon).Lib.SafeAppStorageService
local FIntNotificationsOrchestratorExposureTrackerVersionModule = require(NotificationsOrchestrator.Flags.FIntNotificationsOrchestratorExposureTrackerVersion)
local _ = require(NotificationsOrchestrator.Types)
local SessionScopedSignal, SessionScopedSignal2 = require(Parent.SignalsUtils).createSessionScopedSignal({})

local function _()
	-- upvalues: LocalUserIdStore (copy), Players (copy)
	local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
	
	if CurrentUserId == "" then
		local LocalPlayer = Players.LocalPlayer
		
		return if LocalPlayer == nil or LocalPlayer.UserId <= 0 then "default_userid" else tostring(LocalPlayer.UserId)
	else
		return CurrentUserId
	end
end

local function systemNow(): number
	return os.time()
end

local Callback = systemNow

local function now()
	-- upvalues: Callback (ref)
	return Callback()
end

local _ = function(): string
	-- upvalues: FIntNotificationsOrchestratorExposureTrackerVersionModule (copy)
	return (tostring(FIntNotificationsOrchestratorExposureTrackerVersionModule))
end

local _ = function()
	return { count = 0, lastShownAt = 0, shownAt = {} }
end

local function decodeShownAt(ShownAt)
	if typeof(ShownAt) ~= "table" then
		return {}
	end
	local List = {}
	
	for _, value in ShownAt do
		if typeof(value) == "number" then
			table.insert(List, value)
		end
	end
	return List
end

local function decodeRecord(Count)
	-- upvalues: decodeShownAt (copy)
	return if typeof(Count) == "number" then { lastShownAt = 0, count = Count, shownAt = {} } elseif typeof(Count) == "table" then {
		count = if typeof(Count.count) == "number" then Count.count else 0,
		lastShownAt = if typeof(Count.lastShownAt) == "number" then Count.lastShownAt else 0,
		shownAt = decodeShownAt(Count.shownAt)
	} else nil
end

local function decodeRecords(List)
	-- upvalues: decodeRecord (copy)
	local t = {}
	
	for i, value in List do
		if typeof(i) == "string" then
			local DecodeRecordResult = decodeRecord(value)
			
			if DecodeRecordResult ~= nil then
				t[i] = DecodeRecordResult
			end
		end
	end
	return t
end

local function readTracker()
	-- upvalues: SafeAppStorageService (copy), HttpService (copy)
	local NotificationsOrchestratorGlobalTrackerItem = SafeAppStorageService.getItem("NotificationsOrchestratorGlobalTracker")
	
	if NotificationsOrchestratorGlobalTrackerItem == "" then
		return {}
	end
	local Success, Result = pcall(function()
		-- upvalues: HttpService (upval), NotificationsOrchestratorGlobalTrackerItem (copy)
		return HttpService:JSONDecode(NotificationsOrchestratorGlobalTrackerItem)
	end)
	
	if not Success or typeof(Result) ~= "table" then
		return {}
	end
	local t = {}
	
	for i, value in Result do
		if typeof(i) == "string" then
			t[i] = value
		end
	end
	return t
end

local _ = function(Input)
	-- upvalues: SafeAppStorageService (copy), HttpService (copy)
	SafeAppStorageService.setItem("NotificationsOrchestratorGlobalTracker", HttpService:JSONEncode(Input))
	SafeAppStorageService.flush()
end

local _ = function(List): boolean
	-- upvalues: FIntNotificationsOrchestratorExposureTrackerVersionModule (copy)
	local Flag = false
	
	for i in List do
		local Number: number? = tonumber(i)
		
		if Number ~= nil and Number < FIntNotificationsOrchestratorExposureTrackerVersionModule then
			List[i] = nil
			Flag = true
		end
	end
	return Flag
end

local _ = function()
	-- upvalues: readTracker (copy), FIntNotificationsOrchestratorExposureTrackerVersionModule (copy), SafeAppStorageService (copy), HttpService (copy)
	local Tracker = readTracker()
	local Flag = false
	
	for i in Tracker do
		local Number: number? = tonumber(i)
		
		if Number ~= nil and Number < FIntNotificationsOrchestratorExposureTrackerVersionModule then
			Tracker[i] = nil
			Flag = true
		end
	end
	if Flag then
		SafeAppStorageService.setItem("NotificationsOrchestratorGlobalTracker", HttpService:JSONEncode(Tracker))
		SafeAppStorageService.flush()
	end
	return Tracker
end

local function recordsForCurrentUser(Input)
	-- upvalues: FIntNotificationsOrchestratorExposureTrackerVersionModule (copy), LocalUserIdStore (copy), Players (copy), decodeRecords (copy)
	local InputEntry = Input[tostring(FIntNotificationsOrchestratorExposureTrackerVersionModule)]
	
	if typeof(InputEntry) ~= "table" then
		return {}
	end
	local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
	local DefaultUserid = nil
	
	if CurrentUserId == "" then
		local LocalPlayer = Players.LocalPlayer
		DefaultUserid = if LocalPlayer == nil or LocalPlayer.UserId <= 0 then "default_userid" else tostring(LocalPlayer.UserId)
	else
		DefaultUserid = CurrentUserId
	end
	local InputEntry1 = InputEntry[DefaultUserid]
	
	return if typeof(InputEntry1) == "table" then decodeRecords(InputEntry1) else {}
end

local _ = function()
	-- upvalues: recordsForCurrentUser (copy), readTracker (copy), FIntNotificationsOrchestratorExposureTrackerVersionModule (copy), SafeAppStorageService (copy), HttpService (copy)
	local Tracker = readTracker()
	local Flag = false
	
	for i in Tracker do
		local Number: number? = tonumber(i)
		
		if Number ~= nil and Number < FIntNotificationsOrchestratorExposureTrackerVersionModule then
			Tracker[i] = nil
			Flag = true
		end
	end
	if Flag then
		SafeAppStorageService.setItem("NotificationsOrchestratorGlobalTracker", HttpService:JSONEncode(Tracker))
		SafeAppStorageService.flush()
	end
	return (recordsForCurrentUser(Tracker))
end

local function writePersistedRecords(p1)
	-- upvalues: readTracker (copy), FIntNotificationsOrchestratorExposureTrackerVersionModule (copy), SafeAppStorageService (copy), HttpService (copy), LocalUserIdStore (copy), Players (copy)
	local Tracker = readTracker()
	local Flag = false
	
	for i in Tracker do
		local Number: number? = tonumber(i)
		
		if Number ~= nil and Number < FIntNotificationsOrchestratorExposureTrackerVersionModule then
			Tracker[i] = nil
			Flag = true
		end
	end
	if Flag then
		SafeAppStorageService.setItem("NotificationsOrchestratorGlobalTracker", HttpService:JSONEncode(Tracker))
		SafeAppStorageService.flush()
	end
	local Text = tostring(FIntNotificationsOrchestratorExposureTrackerVersionModule)
	local t = {}
	local TrackerEntry = Tracker[Text]
	
	if typeof(TrackerEntry) == "table" then
		for i1, value in TrackerEntry do
			if typeof(i1) == "string" then
				t[i1] = value
			end
		end
	end
	local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
	local DefaultUserid = nil
	
	if CurrentUserId == "" then
		local LocalPlayer = Players.LocalPlayer
		DefaultUserid = if LocalPlayer == nil or LocalPlayer.UserId <= 0 then "default_userid" else tostring(LocalPlayer.UserId)
	else
		DefaultUserid = CurrentUserId
	end
	t[DefaultUserid] = p1
	Tracker[Text] = t
	SafeAppStorageService.setItem("NotificationsOrchestratorGlobalTracker", HttpService:JSONEncode(Tracker))
	SafeAppStorageService.flush()
end

local function initialize()
	-- upvalues: readTracker (copy), FIntNotificationsOrchestratorExposureTrackerVersionModule (copy), SafeAppStorageService (copy), HttpService (copy)
	local Tracker = readTracker()
	local Flag = false
	
	for i in Tracker do
		local Number: number? = tonumber(i)
		
		if Number ~= nil and Number < FIntNotificationsOrchestratorExposureTrackerVersionModule then
			Tracker[i] = nil
			Flag = true
		end
	end
	if Flag then
		SafeAppStorageService.setItem("NotificationsOrchestratorGlobalTracker", HttpService:JSONEncode(Tracker))
		SafeAppStorageService.flush()
	end
end

local _ = function(p2)
	return if p2 == nil then { count = 0, lastShownAt = 0, shownAt = {} } else {
		count = p2.count,
		lastShownAt = p2.lastShownAt,
		shownAt = table.clone(p2.shownAt)
	}
end

local _ = function(List, p2, p3)
	local v1 = p2 - p3
	local List1 = {}
	
	for _, value in List do
		if v1 <= value then
			table.insert(List1, value)
		end
	end
	return List1
end

local function record(Key, p4)
	-- upvalues: Callback (ref), SessionScopedSignal (copy), SessionScopedSignal2 (copy), recordsForCurrentUser (copy), readTracker (copy), FIntNotificationsOrchestratorExposureTrackerVersionModule (copy), SafeAppStorageService (copy), HttpService (copy), writePersistedRecords (copy)
	local CallbackResult = Callback()
	
	if p4 == "session" then
		local Copy = table.clone(SessionScopedSignal(false))
		local Entry = Copy[Key]
		Copy[Key] = {
			count = (if Entry == nil then 0 else Entry.count) + 1,
			lastShownAt = CallbackResult,
			shownAt = {}
		}
		SessionScopedSignal2(Copy)
		
		return
	end
	local Tracker = readTracker()
	local Flag = false
	
	for i in Tracker do
		local Number: number? = tonumber(i)
		
		if Number ~= nil and Number < FIntNotificationsOrchestratorExposureTrackerVersionModule then
			Tracker[i] = nil
			Flag = true
		end
	end
	if Flag then
		SafeAppStorageService.setItem("NotificationsOrchestratorGlobalTracker", HttpService:JSONEncode(Tracker))
		SafeAppStorageService.flush()
	end
	local RecordsForCurrentUserResult = recordsForCurrentUser(Tracker)
	local RecordsForCurrentUserResultEntry = RecordsForCurrentUserResult[Key]
	local Config = if RecordsForCurrentUserResultEntry == nil then { count = 0, lastShownAt = 0, shownAt = {} } elseif RecordsForCurrentUserResultEntry == nil then { count = 0, lastShownAt = 0, shownAt = {} } else {
		count = RecordsForCurrentUserResultEntry.count,
		lastShownAt = RecordsForCurrentUserResultEntry.lastShownAt,
		shownAt = table.clone(RecordsForCurrentUserResultEntry.shownAt)
	}
	Config.count += 1
	Config.lastShownAt = CallbackResult
	
	if typeof(p4) == "table" and p4.kind == "rolling" then
		table.insert(Config.shownAt, CallbackResult)
		local CallbackResultDelta = CallbackResult - p4.seconds
		local ShownAt = {}
		
		for _, value in Config.shownAt do
			if CallbackResultDelta <= value then
				table.insert(ShownAt, value)
			end
		end
		Config.shownAt = ShownAt
	end
	RecordsForCurrentUserResult[Key] = Config
	writePersistedRecords(RecordsForCurrentUserResult)
end

local function getExposure(p5, p6)
	-- upvalues: SessionScopedSignal (copy), recordsForCurrentUser (copy), readTracker (copy), FIntNotificationsOrchestratorExposureTrackerVersionModule (copy), SafeAppStorageService (copy), HttpService (copy)
	if p6 == "session" then
		local SessionScopedSignalResultEntry = SessionScopedSignal(false)[p5]
		
		return if SessionScopedSignalResultEntry == nil then { count = 0, lastShownAt = 0, shownAt = {} } else {
			count = SessionScopedSignalResultEntry.count,
			lastShownAt = SessionScopedSignalResultEntry.lastShownAt,
			shownAt = table.clone(SessionScopedSignalResultEntry.shownAt)
		}
	end
	local Tracker = readTracker()
	local Flag = false
	
	for i in Tracker do
		local Number: number? = tonumber(i)
		
		if Number ~= nil and Number < FIntNotificationsOrchestratorExposureTrackerVersionModule then
			Tracker[i] = nil
			Flag = true
		end
	end
	if Flag then
		SafeAppStorageService.setItem("NotificationsOrchestratorGlobalTracker", HttpService:JSONEncode(Tracker))
		SafeAppStorageService.flush()
	end
	local RecordsForCurrentUserResultEntry = recordsForCurrentUser(Tracker)[p5]
	
	return if RecordsForCurrentUserResultEntry == nil then { count = 0, lastShownAt = 0, shownAt = {} } else {
		count = RecordsForCurrentUserResultEntry.count,
		lastShownAt = RecordsForCurrentUserResultEntry.lastShownAt,
		shownAt = table.clone(RecordsForCurrentUserResultEntry.shownAt)
	}
end

local function getCount(p7, p8)
	-- upvalues: SessionScopedSignal (copy), recordsForCurrentUser (copy), readTracker (copy), FIntNotificationsOrchestratorExposureTrackerVersionModule (copy), SafeAppStorageService (copy), HttpService (copy), Callback (ref)
	local Config = nil
	if p8 == "session" then
		local SessionScopedSignalResultEntry = SessionScopedSignal(false)[p7]
		Config = if SessionScopedSignalResultEntry == nil then { count = 0, lastShownAt = 0, shownAt = {} } else {
			count = SessionScopedSignalResultEntry.count,
			lastShownAt = SessionScopedSignalResultEntry.lastShownAt,
			shownAt = table.clone(SessionScopedSignalResultEntry.shownAt)
		}
	else
		local Tracker = readTracker()
		local Flag = false
		
		for i in Tracker do
			local Number: number? = tonumber(i)
			
			if Number ~= nil and Number < FIntNotificationsOrchestratorExposureTrackerVersionModule then
				Tracker[i] = nil
				Flag = true
			end
		end
		if Flag then
			SafeAppStorageService.setItem("NotificationsOrchestratorGlobalTracker", HttpService:JSONEncode(Tracker))
			SafeAppStorageService.flush()
		end
		local RecordsForCurrentUserResultEntry = recordsForCurrentUser(Tracker)[p7]
		Config = if RecordsForCurrentUserResultEntry == nil then { count = 0, lastShownAt = 0, shownAt = {} } else {
			count = RecordsForCurrentUserResultEntry.count,
			lastShownAt = RecordsForCurrentUserResultEntry.lastShownAt,
			shownAt = table.clone(RecordsForCurrentUserResultEntry.shownAt)
		}
	end
	if typeof(p8) ~= "table" or p8.kind ~= "rolling" then
		return Config.count
	end
	local ShownAt = Config.shownAt
	local CallbackResultDelta = Callback() - p8.seconds
	local List = {}
	
	for _, value in ShownAt do
		if CallbackResultDelta <= value then
			table.insert(List, value)
		end
	end
	return #List
end

local function setNowForTesting(p9)
	-- upvalues: Callback (ref), systemNow (copy)
	Callback = p9 or systemNow
end

local function resetForTesting()
	-- upvalues: SessionScopedSignal2 (copy), Callback (ref), systemNow (copy)
	SessionScopedSignal2({})
	Callback = systemNow
end

local Tracker = readTracker()
local Flag = false

for i in Tracker do
	local Number: number? = tonumber(i)
	
	if Number ~= nil and Number < FIntNotificationsOrchestratorExposureTrackerVersionModule then
		Tracker[i] = nil
		Flag = true
	end
end
if Flag then
	SafeAppStorageService.setItem("NotificationsOrchestratorGlobalTracker", HttpService:JSONEncode(Tracker))
	SafeAppStorageService.flush()
end
return {
	STORAGE_KEY = "NotificationsOrchestratorGlobalTracker",
	record = record,
	getExposure = getExposure,
	getCount = getCount,
	now = now,
	initialize = initialize,
	setNowForTesting = setNowForTesting,
	resetForTesting = resetForTesting
}