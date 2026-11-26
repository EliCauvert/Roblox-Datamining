local Parent = script.Parent.Parent
local _ = require(script.Parent.captureSnapshotTree)
local CaptureTypeModule = require(Parent.Enums.CaptureType)
local GetCaptureObjectModule = require(Parent.Utils.getCaptureObject)
local StoreFaceExpressionsFunction = require(script.Parent.storeFaceExpressions).storeFaceExpressions
local TriggerSourceTypeModule = require(Parent.Enums.TriggerSourceType)
local _ = require(Parent.Types)
local CaptureServiceModule = require(Parent.Services.CaptureService)
local List = {}
local List1 = {}
local CaptureSavedInternalConnection = nil

local function _()
	-- upvalues: List (copy), CaptureSavedInternalConnection (ref)
	if #List == 0 and CaptureSavedInternalConnection ~= nil then
		CaptureSavedInternalConnection:Disconnect()
		CaptureSavedInternalConnection = nil
	end
end

local _ = function(p1, p2): boolean
	-- upvalues: CaptureTypeModule (copy)
	return if p2 == nil then p1.type == CaptureTypeModule.Screenshot else p2.CaptureType == Enum.CaptureType.Screenshot
end

local function onCaptureSaved(CaptureInfo, TriggerSource)
	-- upvalues: TriggerSourceTypeModule (copy), GetCaptureObjectModule (copy), CaptureTypeModule (copy), List (copy), List1 (copy), CaptureSavedInternalConnection (ref)
	if TriggerSource ~= TriggerSourceTypeModule.UserSave then return end
	local CaptureObjectModule = GetCaptureObjectModule(CaptureInfo)
	
	if not (if CaptureObjectModule == nil then CaptureInfo.type == CaptureTypeModule.Screenshot else CaptureObjectModule.CaptureType == Enum.CaptureType.Screenshot) then return end
	if #List == 0 then return end
	local CaptureTime = if CaptureObjectModule == nil then nil else CaptureObjectModule.CaptureTime
	local Index: number? = nil
	
	if CaptureTime == nil then
		Index = 1
	else
		local UnixTimestampMillis = CaptureTime.UnixTimestampMillis
		local ListenedAtMs = nil
		
		for i, value in List1 do
			if math.abs(UnixTimestampMillis - value) <= 1000 then
				if ListenedAtMs ~= nil then return end
				ListenedAtMs = value
			end
		end
		for i, value1 in List do
			if value1.listenedAtMs == ListenedAtMs then
				Index = i
				break
			end
		end
	end
	if Index == nil then return end
	local Removed = table.remove(List, Index)
	
	if #List == 0 and CaptureSavedInternalConnection ~= nil then
		CaptureSavedInternalConnection:Disconnect()
		CaptureSavedInternalConnection = nil
	end
	Removed.takeScreenshot(CaptureObjectModule)
end

local function waitForScreenshot(TakeScreenshot)
	-- upvalues: List1 (copy), List (copy), CaptureSavedInternalConnection (ref), CaptureServiceModule (copy), onCaptureSaved (copy)
	local UnixTimestampMillis: number = DateTime.now().UnixTimestampMillis
	local UnixTimestampMillisDelta = UnixTimestampMillis - 10000 - 2000
	
	for i = #List1, 1, -1 do
		if List1[i] < UnixTimestampMillisDelta then
			table.remove(List1, i)
		end
	end
	table.insert(List1, UnixTimestampMillis)
	table.insert(List, {
		takeScreenshot = TakeScreenshot,
		listenedAtMs = UnixTimestampMillis
	})
	
	if CaptureSavedInternalConnection == nil then
		CaptureSavedInternalConnection = CaptureServiceModule.CaptureSavedInternal:Connect(onCaptureSaved)
	end
end

local function stopWaitingForScreenshot(SettleScreenshot): boolean
	-- upvalues: List (copy), CaptureSavedInternalConnection (ref)
	for i, value in List do
		if value.takeScreenshot == SettleScreenshot then
			table.remove(List, i)
			
			if #List == 0 and CaptureSavedInternalConnection ~= nil then
				CaptureSavedInternalConnection:Disconnect()
				CaptureSavedInternalConnection = nil
			end
			return true
		end
	end
	return false
end

local _ = function(p1)
	for _, root in p1:GetRoots() do
		root:Destroy()
	end
end

local function attachToScreenshot(p2, p3)
	-- upvalues: StoreFaceExpressionsFunction (copy), CaptureServiceModule (copy)
	local Success, Result = pcall(function()
		-- upvalues: p2 (copy), StoreFaceExpressionsFunction (upval), CaptureServiceModule (upval), p3 (copy)
		for _, root in p2:GetRoots() do
			StoreFaceExpressionsFunction(root)
		end
		CaptureServiceModule:AttachSnapshotAsync(p3, p2, {})
	end)
	
	if not Success then
		warn("AttachSnapshotAsync failed with error:", Result)
	end
	for _, root in p2:GetRoots() do
		root:Destroy()
	end
end

return {
	SCREENSHOT_SAVE_TIMEOUT_SECONDS = 10,
	listen = function()
		-- upvalues: attachToScreenshot (copy), waitForScreenshot (copy), stopWaitingForScreenshot (copy)
		local Flag = false
		local v1 = nil
		local Flag1 = false
		local v2 = nil
		
		local function _()
			-- upvalues: v2 (ref), Flag (ref), Flag1 (ref), v1 (ref), attachToScreenshot (upval)
			local v3 = v2
			
			if not Flag or not Flag1 or v3 == nil then return end
			v2 = nil
			local v4 = v1
			
			if v4 ~= nil then
				task.spawn(attachToScreenshot, v3, v4)
				
				return
			end
			for _, root in v3:GetRoots() do
				root:Destroy()
			end
		end
		
		local function settleScreenshot(p4)
			-- upvalues: Flag (ref), v1 (ref), v2 (ref), Flag1 (ref), attachToScreenshot (upval)
			if Flag then return end
			Flag = true
			v1 = p4
			local v5 = v2
			
			if Flag and Flag1 then
				if v5 == nil then return end
				v2 = nil
				local v6 = v1
				
				if v6 == nil then
					for _, root in v5:GetRoots() do
						root:Destroy()
					end
					return
				else
					task.spawn(attachToScreenshot, v5, v6)
				end
			end
		end
		
		waitForScreenshot(settleScreenshot)
		task.delay(10, function()
			-- upvalues: stopWaitingForScreenshot (upval), settleScreenshot (copy), Flag1 (ref), v2 (ref), Flag (ref), v1 (ref), attachToScreenshot (upval)
			if stopWaitingForScreenshot(settleScreenshot) then
				if not Flag1 or v2 ~= nil then
					warn(`Screenshot was not saved within {10}s; dropping its 3D snapshot`)
				end
				if Flag then return end
				Flag = true
				v1 = nil
				local v7 = v2
				
				if Flag and Flag1 then
					if v7 == nil then return end
					v2 = nil
					local v8 = v1
					
					if v8 == nil then
						for _, root in v7:GetRoots() do
							root:Destroy()
						end
						return
					else
						task.spawn(attachToScreenshot, v7, v8)
					end
				end
			end
		end)
		
		return {
			attach = function(p5)
				-- upvalues: Flag1 (ref), v2 (ref), Flag (ref), v1 (ref), attachToScreenshot (upval)
				if Flag1 then return end
				Flag1 = true
				v2 = p5
				local v9 = v2
				
				if Flag and Flag1 then
					if v9 == nil then return end
					v2 = nil
					local v10 = v1
					
					if v10 == nil then
						for _, root in v9:GetRoots() do
							root:Destroy()
						end
						return
					else
						task.spawn(attachToScreenshot, v9, v10)
					end
				end
			end
		}
	end
}