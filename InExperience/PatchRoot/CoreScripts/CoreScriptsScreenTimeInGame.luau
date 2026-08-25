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
local var6 = httpRequests:new(httpService)
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
	update = function(p0, p1)
		for i, v in pairs(p1) do
			table.insert(p0.pendingResolveMessage, {
				id = v.serialId,
				instructionName = v.instructionName,
				message = v.message,
				type = v.type
			})
		end
		p0:processNext()
	end,
	processNext = function(p2)
		if p2.displaying then return end
		local removed = table.remove(p2.pendingResolveMessage, 1)
		
		if not removed then return end
		if p2.resolvedMessage[removed.id] then
			p2:processNext()
			
			return
		end
		p2.displaying = removed
		
		if p2.displayMessageCallback then
			p2.displayMessageCallback(removed.message)
		end
	end,
	resolve = function(p3)
		-- upvalues: var6 (ref)
		p3.resolvedMessage[p3.displaying.id] = p3.displaying.message
		var6:reportExecution(p3.displaying.instructionName, p3.displaying.id)
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

function t.displayMessage(p4)
	-- upvalues: default (ref)
	default:_open(p4)
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
local function x_1(p5)
	-- upvalues: robloxEventReceivedConnection (write), guiService (ref), t (ref)
	local t_1 = {}
	
	for i, v in ipairs(p5) do
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
	-- upvalues: var6 (ref), x_1 (ref), logging (ref)
	var6:getInstructions(function(p6, p7, p8)
		-- upvalues: x_1 (copy), logging (copy)
		if p6 then
			x_1(p8)
			
			return
		elseif p7 then
			logging.warn("ScreenTimeInGame requestInstructions failed: unauthorized")
			
			return
		end
		logging.warn("ScreenTimeInGame requestInstructions failed: error")
	end)
end

robloxEventReceivedConnection = notificationService.RobloxEventReceived:Connect(function(p9)
	-- upvalues: getFFlagScreenTimeSignalR (ref), constants (ref), var6 (ref), x_1 (ref), logging (ref), robloxEventReceivedConnection (write), guiService (ref), httpService (ref)
	if getFFlagScreenTimeSignalR() then
		if p9.namespace == constants.SIGNALR_NAMESPACE and p9.detailType == constants.SIGNALR_TYPE_NEW_INSTRUCTION then
			var6:getInstructions(function(p10, p11, p12)
				-- upvalues: x_1 (copy), logging (copy)
				if p10 then
					x_1(p12)
					
					return
				elseif p11 then
					logging.warn("ScreenTimeInGame requestInstructions failed: unauthorized")
					
					return
				end
				logging.warn("ScreenTimeInGame requestInstructions failed: error")
			end)
			
			return
		end
	elseif p9.namespace == constants.HEARTBEAT_NOTIFICATIONS_NAMESPACE then
		if p9.detailType == constants.HEARTBEAT_CONSECUTIVE_FAILURE then
			if robloxEventReceivedConnection then
				robloxEventReceivedConnection:Disconnect()
				robloxEventReceivedConnection = nil
			end
			guiService.SelectedCoreObject = nil
			game:Shutdown()
			
			return
		else
			local ok, status = pcall(function()
				-- upvalues: httpService (copy), p9 (ref)
				return httpService:JSONDecode(p9.detail)
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
					var6:getInstructions(function(p13, p14, p15)
						-- upvalues: x_1 (copy), logging (copy)
						if p13 then
							x_1(p15)
							
							return
						elseif p14 then
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