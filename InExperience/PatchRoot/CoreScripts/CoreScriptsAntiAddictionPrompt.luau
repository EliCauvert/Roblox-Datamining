local x_1
local _ = game:GetService("RunService")
local guiService = game:GetService("GuiService")
local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui").RobloxGui
local notificationService = game:GetService("NotificationService")
local httpService = game:GetService("HttpService")
local httpRbxApiService = game:GetService("HttpRbxApiService")
local errorPromptModule = require(robloxGui.Modules.ErrorPrompt)
local url = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).Url

local function _()
	-- upvalues: guiService (ref)
	guiService.SelectedCoreObject = nil
	game:Shutdown()
end

local t = { Warning = 1, Lockout = 2 }

local _ = function(p1)
	return {
		State = p1.response.state.type,
		Messages = p1.response.state.messages
	}
end

local _ = function(p1)
	-- upvalues: url (ref), httpRbxApiService (ref)
	local _, _ = pcall(httpRbxApiService.GetAsyncFullUrl, httpRbxApiService, url.RCS_URL .. "screen-time-api/v1/messages/mark-read" .. "?" .. ("mesasgeId=" .. p1))
end

local t_1 = {
	displaying = nil,
	displayMessageCallback = nil,
	pendingResolveMessage = {},
	resolvedMessage = {},
	update = function(p1, p2)
		for i, v in pairs(p2) do
			table.insert(p1.pendingResolveMessage, { id = v.id, message = v.text })
		end
		p1:processNext()
	end,
	processNext = function(p3)
		-- upvalues: url (ref), httpRbxApiService (ref)
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
		spawn(function()
			-- upvalues: removed (ref), url (copy), httpRbxApiService (copy)
			local _, _ = pcall(httpRbxApiService.GetAsyncFullUrl, httpRbxApiService, url.RCS_URL .. "screen-time-api/v1/messages/mark-read" .. "?" .. ("mesasgeId=" .. removed.id))
		end)
	end,
	resolve = function(p3)
		p3.resolvedMessage[p3.displaying.id] = p3.displaying.message
		p3.displaying = nil
		p3:processNext()
	end
}
local default = errorPromptModule.new("Default", {
	MessageTextScaled = true,
	HideErrorCode = true,
	MenuIsOpenKey = "AnitAddictionPrompt"
})
default:setParent(robloxGui)
local list = {
	{
		Text = "OK",
		LocalizationKey = "InGame.CommonUI.Button.Ok",
		LayoutOrder = 1,
		Primary = true,
		Callback = function()
			-- upvalues: default (ref), t_1 (ref)
			default:_close()
			t_1:resolve()
		end
	}
}

function t_1.displayMessage(p3)
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
	x_1 = robloxGui.AbsoluteSize.X
	local y_1 = robloxGui.AbsoluteSize.Y
	
	if x ~= x_1 or y ~= y_1 then
		default:resizeWidthAndHeight(x_1, y_1)
	end
end
x_1 = nil

local _ = function(p3)
	-- upvalues: x_1 (write), guiService (ref), t_1 (ref)
	local t = {
		State = p3.response.state.type,
		Messages = p3.response.state.messages
	}
	
	if t.State == 2 then
		if x_1 then
			x_1:Disconnect()
		end
		guiService.SelectedCoreObject = nil
		game:Shutdown()
	end
	t_1:update(t.Messages)
end

x_1 = notificationService.RobloxEventReceived:Connect(function(p3)
	-- upvalues: httpService (ref), t (ref), x_1 (write), guiService (ref), t_1 (ref)
	if p3.namespace == "AntiAddictionNotifications" then
		local detail = httpService:JSONDecode(p3.detail)
		local t_2 = {
			State = detail.response.state.type,
			Messages = detail.response.state.messages
		}
		
		if t_2.State == t.Lockout then
			if x_1 then
				x_1:Disconnect()
			end
			guiService.SelectedCoreObject = nil
			game:Shutdown()
		end
		t_1:update(t_2.Messages)
	end
end)