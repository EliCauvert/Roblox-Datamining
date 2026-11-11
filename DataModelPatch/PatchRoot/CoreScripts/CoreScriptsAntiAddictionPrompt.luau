local _ = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local RobloxGui = game:GetService("CoreGui").RobloxGui
local NotificationService = game:GetService("NotificationService")
local HttpService = game:GetService("HttpService")
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local Url = require(game:GetService("CorePackages").Workspace.Packages.CoreScriptsCommon).Url

local function _()
	-- upvalues: GuiService (copy)
	GuiService.SelectedCoreObject = nil
	game:Shutdown()
end

local config = { Warning = 1, Lockout = 2 }

local _ = function(p1)
	return {
		State = p1.response.state.type,
		Messages = p1.response.state.messages
	}
end

local _ = function(Text)
	-- upvalues: Url (copy), HttpRbxApiService (copy)
	local _, _ = pcall(HttpRbxApiService.GetAsyncFullUrl, HttpRbxApiService, Url.RCS_URL .. "screen-time-api/v1/messages/mark-read" .. "?" .. ("mesasgeId=" .. Text))
end

local config1 = {
	displaying = nil,
	displayMessageCallback = nil,
	pendingResolveMessage = {},
	resolvedMessage = {},
	update = function(p1, Messages)
		for _, message in pairs(Messages) do
			table.insert(p1.pendingResolveMessage, { id = message.id, message = message.text })
		end
		p1:processNext()
	end,
	processNext = function(p2)
		-- upvalues: Url (copy), HttpRbxApiService (copy)
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
		spawn(function()
			-- upvalues: Removed (copy), Url (upval), HttpRbxApiService (upval)
			local _, _ = pcall(HttpRbxApiService.GetAsyncFullUrl, HttpRbxApiService, Url.RCS_URL .. "screen-time-api/v1/messages/mark-read" .. "?" .. ("mesasgeId=" .. Removed.id))
		end)
	end,
	resolve = function(p2)
		p2.resolvedMessage[p2.displaying.id] = p2.displaying.message
		p2.displaying = nil
		p2:processNext()
	end
}
local Default = require(RobloxGui.Modules.ErrorPrompt).new("Default", {
	MessageTextScaled = true,
	HideErrorCode = true,
	MenuIsOpenKey = "AnitAddictionPrompt"
})
Default:setParent(RobloxGui)
local list = {
	{
		Text = "OK",
		LocalizationKey = "InGame.CommonUI.Button.Ok",
		LayoutOrder = 1,
		Primary = true,
		Callback = function()
			-- upvalues: Default (copy), config1 (copy)
			Default:_close()
			config1:resolve()
		end
	}
}

function config1.displayMessageCallback(Message)
	-- upvalues: Default (copy)
	Default:_open(Message)
end

Default:updateButtons(list)
Default:setErrorTitle("Warning", "InGame.CommonUI.Title.Warning")
local X = RobloxGui.AbsoluteSize.X
local Y = RobloxGui.AbsoluteSize.Y
RobloxGui:GetPropertyChangedSignal("AbsoluteSize"):connect(function()
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
local Connection = nil

local _ = function(p2)
	-- upvalues: Connection (ref), GuiService (copy), config1 (copy)
	local config = {
		State = p2.response.state.type,
		Messages = p2.response.state.messages
	}
	
	if config.State == 2 then
		if Connection then
			Connection:Disconnect()
		end
		GuiService.SelectedCoreObject = nil
		game:Shutdown()
	end
	config1:update(config.Messages)
end

Connection = NotificationService.RobloxEventReceived:Connect(function(EventData)
	-- upvalues: HttpService (copy), config (copy), Connection (ref), GuiService (copy), config1 (copy)
	if EventData.namespace == "AntiAddictionNotifications" then
		local Data = HttpService:JSONDecode(EventData.detail)
		local config2 = {
			State = Data.response.state.type,
			Messages = Data.response.state.messages
		}
		
		if config2.State == config.Lockout then
			if Connection then
				Connection:Disconnect()
			end
			GuiService.SelectedCoreObject = nil
			game:Shutdown()
		end
		config1:update(config2.Messages)
	end
end)