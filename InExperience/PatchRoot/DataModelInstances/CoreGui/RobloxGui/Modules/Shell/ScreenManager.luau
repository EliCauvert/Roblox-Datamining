local CoreGui = game:GetService("CoreGui")
local RobloxGui = CoreGui.RobloxGui
local Shell = RobloxGui:FindFirstChild("Modules"):FindFirstChild("Shell")
local AnalyticsModule = require(script.Parent.Analytics)
local AppStateModule = require(script.Parent.AppState)
local GlobalSettingsModule = require(script.Parent.GlobalSettings)
local ScreenItemModule = require(script.Parent.Models.ScreenItem)
local PageHeartbeatTimerModule = require(script.Parent.PageHeartbeatTimer)
local InsertScreenModule = require(script.Parent.Actions.InsertScreen)
local RemoveScreenModule = require(script.Parent.Actions.RemoveScreen)
local ContentHistoryModule = require(Shell.XboxPrimaryNav:FindFirstChild("contentHistory"))
local GetFIntXboxPrimaryNavABLoggingModule = require(Shell.Flags.GetFIntXboxPrimaryNavABLogging)
local CreateFunction = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Create
local t = {}
local config = { [1] = RobloxGui }

local function _(p1) --[[ Line: 25 | Named "getScreenPriority" ]]
	-- upvalues: GlobalSettingsModule (copy)
	return if p1.GetPriority == nil then GlobalSettingsModule.DefaultPriority else p1:GetPriority()
end

local function setRBXEventStream_Screen(Screen, Status) --[[ Line: 33 ]]
	-- upvalues: AnalyticsModule (copy)
	if Screen and type(Screen.GetAnalyticsInfo) == "function" then
		local AnalyticsInfo = Screen:GetAnalyticsInfo()
		
		if type(AnalyticsInfo) == "table" and AnalyticsInfo[AnalyticsModule.WidgetNames("WidgetId")] then
			AnalyticsInfo.Status = Status
			AnalyticsModule.SetRBXEventStream("Widget", AnalyticsInfo)
		end
	end
end

local ScreenManager = {
	GetScreenGuiByPriority = function(_, p1: number) --[[ Line: 43 ]]
		-- upvalues: config (copy), CreateFunction (copy), CoreGui (copy)
		local Largest = math.max(1, p1)
		
		if not config[Largest] then
			for i = 1, Largest do
				if not config[i] then
					config[i] = CreateFunction("ScreenGui")({ Name = "AppShell" .. tostring(i), Parent = CoreGui })
				end
			end
		end
		return config[Largest]
	end
}

function ScreenManager:OpenScreen(Screen, HidePrevious: boolean) --[[ Line: 60 ]]
	-- upvalues: t (copy), ScreenItemModule (copy), GlobalSettingsModule (copy), GetFIntXboxPrimaryNavABLoggingModule (copy), ScreenManager (copy), ContentHistoryModule (copy), AppStateModule (copy), InsertScreenModule (copy)
	if HidePrevious == nil then
		HidePrevious = true
	end
	local config = { hidePrevious = HidePrevious }
	local Text = tostring(Screen)
	t[Text] = { isShown = false, screen = Screen }
	local NewScreenItem = ScreenItemModule.new(Text, if Screen.GetPriority == nil then GlobalSettingsModule.DefaultPriority else Screen:GetPriority(), config)
	
	if GetFIntXboxPrimaryNavABLoggingModule() > 0 then
		local TopScreen = ScreenManager:GetTopScreen()
		
		if TopScreen then
			ContentHistoryModule:setLastSelectedContent(TopScreen)
		end
	end
	AppStateModule.store:dispatch(InsertScreenModule(NewScreenItem))
end

function ScreenManager:CloseCurrent(p2) --[[ Line: 87 ]]
	-- upvalues: AppStateModule (copy), t (copy), RemoveScreenModule (copy)
	local ScreenList = AppStateModule.store:getState().ScreenList
	local Screen = #ScreenList > 0 and ScreenList[1]
	
	if not Screen or not t[Screen.id] then return end
	if not p2 or Screen.id == tostring(p2) then
		AppStateModule.store:dispatch(RemoveScreenModule(Screen))
		
		return
	end
end

local function handleScreensRemoved(ScreenList) --[[ Line: 104 ]]
	-- upvalues: t (copy), setRBXEventStream_Screen (copy)
	local t1 = {}
	
	for _, value in ipairs(ScreenList) do
		t1[value.id] = true
	end
	local List = {}
	
	for i, _ in pairs(t) do
		if not t1[i] then
			table.insert(List, i)
		end
	end
	for _, value1 in ipairs(List) do
		local Entry = t[value1]
		
		if Entry then
			local Screen = Entry.screen
			Screen:RemoveFocus()
			Screen:Hide()
			
			if Screen.ScreenRemoved then
				Screen:ScreenRemoved()
			end
			setRBXEventStream_Screen(Screen, "Close")
		end
		t[value1] = nil
	end
end

local function handleScreensAdded(ScreenList) --[[ Line: 136 ]]
	-- upvalues: t (copy), setRBXEventStream_Screen (copy), PageHeartbeatTimerModule (copy), AnalyticsModule (copy)
	for i = #ScreenList, 1, -1 do
		local Entry = t[ScreenList[i].id]
		
		if Entry then
			local Screen = Entry.screen
			
			if i > 1 then
				local HidePrevious = true
				local Screen1 = ScreenList[i - 1]
				
				if Screen1 and Screen1.data then
					HidePrevious = Screen1.data.hidePrevious
				end
				Screen:RemoveFocus()
				
				if HidePrevious then
					Screen:Hide()
					Entry.isShown = false
				end
				if not Entry.isShown and not HidePrevious then
					Screen:Show()
					Entry.isShown = true
				end
			else
				if not Entry.isShown then
					Screen:Show()
					Entry.isShown = true
					setRBXEventStream_Screen(Screen, "Show")
				end
				Screen:Focus()
				setRBXEventStream_Screen(Screen, "Focus")
				local AnalyticsInfo = Entry.screen.GetAnalyticsInfo and Entry.screen.GetAnalyticsInfo()
				
				if AnalyticsInfo then
					PageHeartbeatTimerModule.onPageChanged(AnalyticsInfo[AnalyticsModule.WidgetNames("WidgetId")])
				end
			end
		end
	end
	AnalyticsModule.reportPageChanged()
end

local _ = function(p2) --[[ Line: 181 | Named "update" ]]
	-- upvalues: handleScreensRemoved (copy), handleScreensAdded (copy)
	handleScreensRemoved(p2)
	handleScreensAdded(p2)
end

AppStateModule.store.changed:connect(function(Value, p2) --[[ Line: 186 ]]
	-- upvalues: handleScreensRemoved (copy), handleScreensAdded (copy)
	local ScreenList = Value.ScreenList
	
	if ScreenList ~= p2.ScreenList then
		handleScreensRemoved(ScreenList)
		handleScreensAdded(ScreenList)
		
		return
	end
end)

function ScreenManager:GetTopScreen() --[[ Line: 197 ]]
	-- upvalues: AppStateModule (copy), t (copy)
	local ScreenList = AppStateModule.store:getState().ScreenList
	
	return if ScreenList and #ScreenList > 0 then t[ScreenList[1].id].screen else nil
end

return ScreenManager