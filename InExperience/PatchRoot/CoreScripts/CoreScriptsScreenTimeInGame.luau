local guiService = game:GetService("GuiService")
local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui").RobloxGui
local notificationService = game:GetService("NotificationService")
local httpService = game:GetService("HttpService")
local screenTimeModule = require(corePackagesService.Workspace.Packages.ScreenTime)
local httpRequests = screenTimeModule.HttpRequests
local constants = screenTimeModule.Constants
local getFFlagScreenTimeSignalR = screenTimeModule.GetFFlagScreenTimeSignalR
local logging = require(corePackagesService.Workspace.Packages.AppCommonLib).Logging
local errorPromptModule = require(robloxGui.Modules.ErrorPrompt)

local function _()
	-- upvalues: guiService (ref)
	guiService.SelectedCoreObject = nil
	game:Shutdown()
end

local _ = { Warning = 1, Lockout = 2, OpenWebView = 3 }
local var1 = httpRequests:new(httpService)
local robloxEventReceivedConnection = nil

local _ = function()
	-- upvalues: robloxEventReceivedConnection (write), guiService (ref)
	if robloxEventReceivedConnection then
		robloxEventReceivedConnection:Disconnect()
		robloxEventReceivedConnection = nil
	end
	guiService.SelectedCoreObject = nil
	game:Shutdown()
end

local t = {
	displaying = nil,
	displayMessageCallback = nil,
	pendingResolveMessage = {},
	resolvedMessage = {},
	update = function(p1, p2)
		for i, v in pairs(p2) do
			table.insert(p1.pendingResolveMessage, {
				id = v.serialId,
				instructionName = v.instructionName,
				message = v.message,
				type = v.type
			})
		end
		p1:processNext()
	end,
	processNext = function(p3)
		if p3.displaying then return end
		local removed = table.remove(p3.pendingResolveMessage, 1)
		
		if not removed then return end
		if p3.resolvedMessage[removed.id] then
			p3:processNext()
			
			return
		end
		p3.displaying = removed
		
		if p3.displayMessageCallback then
			p3.displayMessageCallback(removed.message)
		end
	end,
	resolve = function(p3)
		-- upvalues: var1 (ref)
		p3.resolvedMessage[p3.displaying.id] = p3.displaying.message
		var1:reportExecution(p3.displaying.instructionName, p3.displaying.id)
		p3.displaying = nil
		p3:processNext()
	end
}
local default = errorPromptModule.new("Default", {
	MessageTextScaled = true,
	HideErrorCode = true,
	MenuIsOpenKey = "ScreenTimePrompt"
})
default:setParent(robloxGui)
local list = {
	{
		Text = "OK",
		LocalizationKey = "InGame.CommonUI.Button.Ok",
		LayoutOrder = 1,
		Primary = true,
		Callback = function()
			-- upvalues: default (ref), t (ref)
			default:_close()
			t:resolve()
		end
	}
}

function t.displayMessage(p3)
	-- upvalues: default (ref)
	default:_open(p3)
end

default:updateButtons(list)
default:setErrorTitle("Warning", "InGame.CommonUI.Title.Warning")
local x = robloxGui.AbsoluteSize.X
local y = robloxGui.AbsoluteSize.Y
robloxGui:GetPropertyChangedSignal("AbsoluteSize"):connect(function()
	-- upvalues: default (ref), robloxGui (ref), x (write), y (write)
	if not default then return end
	local x_1 = robloxGui.AbsoluteSize.X
	local y_1 = robloxGui.AbsoluteSize.Y
	
	if x ~= x_1 or y ~= y_1 then
		x = x_1
		y = y_1
		default:resizeWidthAndHeight(x, y)
	end
end)

if default then
	local x_1 = robloxGui.AbsoluteSize.X
	local y_1 = robloxGui.AbsoluteSize.Y
	
	if x ~= x_1 or y ~= y_1 then
		default:resizeWidthAndHeight(x_1, y_1)
	end
end
local function x_1(p3)
	-- upvalues: robloxEventReceivedConnection (write), guiService (ref), t (ref)
	local t_1 = {}
	
	for i, v in ipairs(p3) do
		if v.type == 1 then
			table.insert(t_1, v)
		elseif v.type ~= 2 then
		end
		if robloxEventReceivedConnection then
			robloxEventReceivedConnection:Disconnect()
			robloxEventReceivedConnection = nil
		end
		guiService.SelectedCoreObject = nil
		game:Shutdown()
		
		return
	end
	t:update(t_1)
end

local _ = function()
	-- upvalues: var1 (ref), x_1 (ref), logging (ref)
	var1:getInstructions(function(p4, p5, p6)
		-- upvalues: x_1 (copy), logging (copy)
		if p4 then
			x_1(p6)
			
			return
		elseif p5 then
			logging.warn("ScreenTimeInGame requestInstructions failed: unauthorized")
			
			return
		end
		logging.warn("ScreenTimeInGame requestInstructions failed: error")
	end)
end

robloxEventReceivedConnection = notificationService.RobloxEventReceived:Connect(function(p4)
	-- upvalues: getFFlagScreenTimeSignalR (ref), constants (ref), var1 (ref), x_1 (ref), logging (ref), robloxEventReceivedConnection (write), guiService (ref), httpService (ref)
	if getFFlagScreenTimeSignalR() then
		if p4.namespace == constants.SIGNALR_NAMESPACE and p4.detailType == constants.SIGNALR_TYPE_NEW_INSTRUCTION then
			var1:getInstructions(function(p5, p6, p7)
				-- upvalues: x_1 (copy), logging (copy)
				if p5 then
					x_1(p7)
					
					return
				elseif p6 then
					logging.warn("ScreenTimeInGame requestInstructions failed: unauthorized")
					
					return
				end
				logging.warn("ScreenTimeInGame requestInstructions failed: error")
			end)
			
			return
		end
	elseif p4.namespace == constants.HEARTBEAT_NOTIFICATIONS_NAMESPACE then
		if p4.detailType == constants.HEARTBEAT_CONSECUTIVE_FAILURE then
			if robloxEventReceivedConnection then
				robloxEventReceivedConnection:Disconnect()
				robloxEventReceivedConnection = nil
			end
			guiService.SelectedCoreObject = nil
			game:Shutdown()
			
			return
		else
			local ok, status = pcall(function()
				-- upvalues: httpService (copy), p4 (ref)
				return httpService:JSONDecode(p4.detail)
			end)
			
			if not ok then
				logging.warn("ScreenTimeInGame json decoding failed")
				
				return
			elseif status.notifications == nil then
				logging.warn("ScreenTimeInGame empty heartbeat notifications")
				
				return
			end
			for i, v in ipairs(status.notifications) do
				if v.type == constants.HEARTBEAT_NOTIFICATION_TYPE_NEW_INSTRUCTION then
					var1:getInstructions(function(p5, p6, p7)
						-- upvalues: x_1 (copy), logging (copy)
						if p5 then
							x_1(p7)
							
							return
						elseif p6 then
							logging.warn("ScreenTimeInGame requestInstructions failed: unauthorized")
							
							return
						end
						logging.warn("ScreenTimeInGame requestInstructions failed: error")
					end)
				end
			end
		end
	end
end)