local GuiService = game:GetService("GuiService")
local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui").RobloxGui
local NotificationService = game:GetService("NotificationService")
local HttpService = game:GetService("HttpService")
local ScreenTimeModule = require(CorePackages.Workspace.Packages.ScreenTime)
local Constants = ScreenTimeModule.Constants
local GetFFlagScreenTimeSignalRFunction = ScreenTimeModule.GetFFlagScreenTimeSignalR
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging

local function _() --[[ Line: 16 | Named "leaveGame" ]]
	-- upvalues: GuiService (copy)
	GuiService.SelectedCoreObject = nil
	game:Shutdown()
end

local NewResult = ScreenTimeModule.HttpRequests:new(HttpService)
local Connection = nil

local _ = function() --[[ Line: 32 | Named "disconnectAndLeaveGame" ]]
	-- upvalues: Connection (ref), GuiService (copy)
	if Connection then
		Connection:Disconnect()
		Connection = nil
	end
	GuiService.SelectedCoreObject = nil
	game:Shutdown()
end

local config = {
	displaying = nil,
	displayMessageCallback = nil,
	pendingResolveMessage = {},
	resolvedMessage = {},
	update = function(p1, List) --[[ Line: 53 ]]
		for _, value in pairs(List) do
			table.insert(p1.pendingResolveMessage, {
				id = value.serialId,
				instructionName = value.instructionName,
				message = value.message,
				type = value.type
			})
		end
		p1:processNext()
	end,
	processNext = function(p2) --[[ Line: 66 ]]
		if p2.displaying then return end
		local Removed = table.remove(p2.pendingResolveMessage, 1)
		
		if not Removed then return end
		if p2.resolvedMessage[Removed.id] then
			p2:processNext()
			
			return
		end
		p2.displaying = Removed
		
		if p2.displayMessageCallback then
			p2.displayMessageCallback(Removed.message)
		end
	end,
	resolve = function(p2) --[[ Line: 88 ]]
		-- upvalues: NewResult (copy)
		p2.resolvedMessage[p2.displaying.id] = p2.displaying.message
		NewResult:reportExecution(p2.displaying.instructionName, p2.displaying.id)
		p2.displaying = nil
		p2:processNext()
	end
}
local Default = require(RobloxGui.Modules.ErrorPrompt).new("Default", {
	MessageTextScaled = true,
	HideErrorCode = true,
	MenuIsOpenKey = "ScreenTimePrompt"
})
Default:setParent(RobloxGui)
local list = {
	{
		Text = "OK",
		LocalizationKey = "InGame.CommonUI.Button.Ok",
		LayoutOrder = 1,
		Primary = true,
		Callback = function() --[[ Line: 112 ]]
			-- upvalues: Default (copy), config (copy)
			Default:_close()
			config:resolve()
		end
	}
}

function config.displayMessageCallback(Message) --[[ Line: 108 ]]
	-- upvalues: Default (copy)
	Default:_open(Message)
end

Default:updateButtons(list)
Default:setErrorTitle("Warning", "InGame.CommonUI.Title.Warning")
local X = RobloxGui.AbsoluteSize.X
local Y = RobloxGui.AbsoluteSize.Y
RobloxGui:GetPropertyChangedSignal("AbsoluteSize"):connect(function() --[[ Line: 135 | Named "onScreenSizeChanged" ]]
	-- upvalues: Default (copy), RobloxGui (copy), X (ref), Y (ref)
	if not Default then return end
	local X1 = RobloxGui.AbsoluteSize.X
	local Y1 = RobloxGui.AbsoluteSize.Y
	
	if X ~= X1 or Y ~= Y1 then
		X = X1
		Y = Y1
		Default:resizeWidthAndHeight(X, Y)
	end
end)

if Default then
	local X1 = RobloxGui.AbsoluteSize.X
	local Y1 = RobloxGui.AbsoluteSize.Y
	
	if X ~= X1 or Y ~= Y1 then
		X = X1
		Y = Y1
		Default:resizeWidthAndHeight(X, Y)
	end
end
local function screenTimeStatesUpdated(List) --[[ Line: 151 ]]
	-- upvalues: Connection (ref), GuiService (copy), config (copy)
	local List1 = {}
	
	for _, value in ipairs(List) do
		if value.type == 1 then
			table.insert(List1, value)
		elseif value.type == 2 then
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
			GuiService.SelectedCoreObject = nil
			game:Shutdown()
			
			return
		else
			local _ = value.type
		end
	end
	config:update(List1)
end

local _ = function() --[[ Line: 170 | Named "requestInstructions" ]]
	-- upvalues: NewResult (copy), screenTimeStatesUpdated (copy), Logging (copy)
	NewResult:getInstructions(function(p2, p3, p4) --[[ Line: 171 ]]
		-- upvalues: screenTimeStatesUpdated (upval), Logging (upval)
		if p2 then
			screenTimeStatesUpdated(p4)
			
			return
		end
		if p3 then
			Logging.warn("ScreenTimeInGame requestInstructions failed: unauthorized")
			
			return
		else
			Logging.warn("ScreenTimeInGame requestInstructions failed: error")
		end
	end)
end

Connection = NotificationService.RobloxEventReceived:Connect(function(EventData) --[[ Line: 183 ]]
	-- upvalues: GetFFlagScreenTimeSignalRFunction (copy), Constants (copy), NewResult (copy), screenTimeStatesUpdated (copy), Logging (copy), Connection (ref), GuiService (copy), HttpService (copy)
	if not GetFFlagScreenTimeSignalRFunction() then
		if EventData.namespace == Constants.HEARTBEAT_NOTIFICATIONS_NAMESPACE then
			if EventData.detailType == Constants.HEARTBEAT_CONSECUTIVE_FAILURE then
				if Connection then
					Connection:Disconnect()
					Connection = nil
				end
				GuiService.SelectedCoreObject = nil
				game:Shutdown()
				
				return
			else
				local Success, Result = pcall(function() --[[ Line: 198 ]]
					-- upvalues: HttpService (upval), EventData (copy)
					return HttpService:JSONDecode(EventData.detail)
				end)
				
				if not Success then
					Logging.warn("ScreenTimeInGame json decoding failed")
					
					return
				end
				if Result.notifications == nil then
					Logging.warn("ScreenTimeInGame empty heartbeat notifications")
					
					return
				end
				for _, notification in ipairs(Result.notifications) do
					if notification.type == Constants.HEARTBEAT_NOTIFICATION_TYPE_NEW_INSTRUCTION then
						NewResult:getInstructions(function(p2, p3, p4) --[[ Line: 171 ]]
							-- upvalues: screenTimeStatesUpdated (upval), Logging (upval)
							if p2 then
								screenTimeStatesUpdated(p4)
								
								return
							end
							if p3 then
								Logging.warn("ScreenTimeInGame requestInstructions failed: unauthorized")
								
								return
							else
								Logging.warn("ScreenTimeInGame requestInstructions failed: error")
							end
						end)
					end
				end
			end
		end
	elseif EventData.namespace == Constants.SIGNALR_NAMESPACE and EventData.detailType == Constants.SIGNALR_TYPE_NEW_INSTRUCTION then
		NewResult:getInstructions(function(p2, p3, p4) --[[ Line: 171 ]]
			-- upvalues: screenTimeStatesUpdated (upval), Logging (upval)
			if p2 then
				screenTimeStatesUpdated(p4)
				
				return
			end
			if p3 then
				Logging.warn("ScreenTimeInGame requestInstructions failed: unauthorized")
				
				return
			else
				Logging.warn("ScreenTimeInGame requestInstructions failed: error")
			end
		end)
		
		return
	end
end)