local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local robloxGui = coreGuiService.RobloxGui
local shell = robloxGui:FindFirstChild("Modules"):FindFirstChild("Shell")
local analyticsModule = require(script.Parent.Analytics)
local appStateModule = require(script.Parent.AppState)
local globalSettingsModule = require(script.Parent.GlobalSettings)
local screenItemModule = require(script.Parent.Models.ScreenItem)
local pageHeartbeatTimerModule = require(script.Parent.PageHeartbeatTimer)
local insertScreenModule = require(script.Parent.Actions.InsertScreen)
local removeScreenModule = require(script.Parent.Actions.RemoveScreen)
local contentHistoryModule = require(shell.XboxPrimaryNav:FindFirstChild("contentHistory"))
local getFIntXboxPrimaryNavABLoggingModule = require(shell.Flags.GetFIntXboxPrimaryNavABLogging)
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create
local t = {}
local t_1 = {}
local t_2 = { [1] = robloxGui }

local function _(p1)
	-- upvalues: globalSettingsModule (ref)
	return if p1.GetPriority ~= nil then p1:GetPriority() else globalSettingsModule.DefaultPriority
end

local function setRBXEventStream_Screen(value, p1)
	-- upvalues: analyticsModule (ref)
	if value and type(value.GetAnalyticsInfo) == "function" then
		local analyticsInfo = value:GetAnalyticsInfo()
		
		if type(analyticsInfo) == "table" and analyticsInfo[analyticsModule.WidgetNames("WidgetId")] then
			analyticsInfo.Status = p1
			analyticsModule.SetRBXEventStream("Widget", analyticsInfo)
		end
	end
end

function t.GetScreenGuiByPriority(_, p1)
	-- upvalues: t_2 (ref), create (ref), coreGuiService (ref)
	local maxValue = math.max(1, p1)
	
	if not t_2[maxValue] then
		for i = 1, maxValue do
			if not t_2[i] then
				t_2[i] = create("ScreenGui")({
					Name = "AppShell" .. tostring(i),
					Parent = coreGuiService
				})
			end
		end
	end
	return t_2[maxValue]
end

function t.OpenScreen(_, p2, p3)
	-- upvalues: t_1 (ref), screenItemModule (ref), globalSettingsModule (ref), getFIntXboxPrimaryNavABLoggingModule (ref), t (ref), contentHistoryModule (ref), appStateModule (ref), insertScreenModule (ref)
	if p3 == nil then
		p3 = true
	end
	local t_2 = { hidePrevious = p3 }
	local var1 = tostring(p2)
	t_1[var1] = { isShown = false, screen = p2 }
	local new = screenItemModule.new
	new = new(var1, if p2.GetPriority ~= nil then p2:GetPriority() else globalSettingsModule.DefaultPriority, t_2)
	
	if getFIntXboxPrimaryNavABLoggingModule() > 0 then
		local topScreen = t:GetTopScreen()
		
		if topScreen then
			contentHistoryModule:setLastSelectedContent(topScreen)
		end
	end
	appStateModule.store:dispatch(insertScreenModule(new))
end

function t.CloseCurrent(_, p2)
	-- upvalues: appStateModule (ref), t_1 (ref), removeScreenModule (ref)
	local screenList = appStateModule.store:getState().ScreenList
	local var1 = #screenList > 0 and screenList[1]
	
	if not var1 or not t_1[var1.id] then return end
	if p2 and var1.id ~= tostring(p2) then
		return
	end
	appStateModule.store:dispatch(removeScreenModule(var1))
end

local function handleScreensRemoved(p2)
	-- upvalues: t_1 (ref), setRBXEventStream_Screen (ref)
	local t = {}
	
	for i, v in ipairs(p2) do
		t[v.id] = true
	end
	local t_2 = {}
	
	for i_1, v_1 in pairs(t_1) do
		if not t[i_1] then
			table.insert(t_2, i_1)
		end
	end
	for i_2, v_2 in ipairs(t_2) do
		local var1 = t_1[v_2]
		
		if var1 then
			local screen = var1.screen
			screen:RemoveFocus()
			screen:Hide()
			
			if screen.ScreenRemoved then
				screen:ScreenRemoved()
			end
			setRBXEventStream_Screen(screen, "Close")
		end
		t_1[v_2] = nil
	end
end

local function handleScreensAdded(p3)
	-- upvalues: t_1 (ref), setRBXEventStream_Screen (ref), pageHeartbeatTimerModule (ref), analyticsModule (ref)
	for i = #p3, 1, -1 do
		local id = t_1[p3[i].id]
		
		if not id then
			continue
		end
		local screen = id.screen
		
		if i > 1 then
			local hidePrevious = true
			local var2 = p3[i - 1]
			
			if var2 and var2.data then
				hidePrevious = var2.data.hidePrevious
			end
			screen:RemoveFocus()
			
			if hidePrevious then
				screen:Hide()
				id.isShown = false
			end
			if not id.isShown and not hidePrevious then
				screen:Show()
				id.isShown = true
			end
		elseif not id.isShown then
			screen:Show()
			id.isShown = true
			setRBXEventStream_Screen(screen, "Show")
		end
		screen:Focus()
		setRBXEventStream_Screen(screen, "Focus")
		local var3 = id.screen.GetAnalyticsInfo and id.screen.GetAnalyticsInfo()
		
		if var3 then
			pageHeartbeatTimerModule.onPageChanged(var3[analyticsModule.WidgetNames("WidgetId")])
		end
	end
	analyticsModule.reportPageChanged()
end

local _ = function(p4)
	-- upvalues: handleScreensRemoved (ref), handleScreensAdded (ref)
	handleScreensRemoved(p4)
	handleScreensAdded(p4)
end

appStateModule.store.changed:connect(function(p4, p5)
	-- upvalues: handleScreensRemoved (ref), handleScreensAdded (ref)
	local screenList = p4.ScreenList
	
	if screenList == p5.ScreenList then
		return
	end
	handleScreensRemoved(screenList)
	handleScreensAdded(screenList)
end)

function t.GetTopScreen(_)
	-- upvalues: appStateModule (ref), t_1 (ref)
	local screenList = appStateModule.store:getState().ScreenList
	
	return if screenList and #screenList > 0 then t_1[screenList[1].id].screen else nil
end

return t