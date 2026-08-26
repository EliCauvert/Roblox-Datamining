local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local _ = robloxGui:WaitForChild("Modules")
local starterGuiService = game:GetService("StarterGui")
local _ = game:GetService("UserInputService")
local _ = game:GetService("GuiService")
local playersService = game:GetService("Players")
local chatUtilModule = require(robloxGui.Modules.ChatUtil)
local classicChat = playersService.ClassicChat
local bubbleChat = playersService.BubbleChat
local VRService = game:GetService("VRService")
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local _ = sharedFlagsModule.FFlagChromeChatGamepadSupportFix
local var1 = nil
local var2 = nil
local t = {}
local t_1 = { Visible = not VRService.VREnabled }
local t_2 = {
	ToggleVisibility = function(_)
		-- upvalues: var1 (write), t_1 (ref)
		if var1 then
			var1:ToggleVisibility()
			
			return
		end
		t_1.Visible = not t_1.Visible
	end,
	SetVisible = function(_, p1)
		-- upvalues: var1 (write), t_1 (ref)
		if var1 then
			var1:SetVisible(p1)
			
			return
		end
		t_1.Visible = p1
	end,
	FocusChatBar = function(_)
		-- upvalues: var1 (write)
		if var1 then
			var1:FocusChatBar()
		end
	end,
	FocusSelectChatBar = function(_, p1, p2)
		-- upvalues: var1 (write), fFlagEnableConsoleExpControls (ref)
		if var1 and fFlagEnableConsoleExpControls then
			var1:FocusSelectChatBar(p1, p2)
		end
	end,
	EnterWhisperState = function(_, p1)
		-- upvalues: var1 (write)
		if var1 then
			return var1:EnterWhisperState(p1)
		end
	end,
	GetVisibility = function(_)
		-- upvalues: var1 (write), t_1 (ref)
		return if var1 then var1:GetVisibility() else t_1.Visible
	end,
	GetMessageCount = function(_)
		-- upvalues: var1 (write)
		return if var1 then var1:GetMessageCount() else 0
	end,
	TopbarEnabledChanged = function(_, ...)
		-- upvalues: var1 (write)
		if var1 then
			return var1:TopbarEnabledChanged(...)
		end
	end,
	IsFocused = function(_, p1)
		-- upvalues: var1 (write)
		return if var1 then var1:IsFocused(p1) else false
	end,
	ClassicChatEnabled = function(_)
		-- upvalues: var1 (write), classicChat (ref)
		return if var1 then var1:ClassicChatEnabled() else classicChat
	end,
	IsBubbleChatOnly = function(_)
		-- upvalues: var1 (write), bubbleChat (ref), classicChat (ref)
		return if var1 then var1:IsBubbleChatOnly() else bubbleChat and not classicChat
	end,
	IsDisabled = function(_)
		-- upvalues: var1 (write), bubbleChat (ref), classicChat (ref)
		return if var1 then var1:IsDisabled() else not (bubbleChat or classicChat)
	end
}

function t_2.HideTemp(_, p1, p2)
	-- upvalues: t (ref), var2 (write), t_2 (ref)
	local function _()
		-- upvalues: t (copy)
		return next(t) == nil
	end
	
	if next(t) == nil then
		var2 = t_2:GetVisibility()
	end
	if p2 then
		t[p1] = p2
	else
		t[p1] = nil
	end
	t_2:SetVisible(var2 and next(t) == nil)
end

t_2.ChatBarFocusChanged = chatUtilModule.Signal()
t_2.ChatWindowToggled = chatUtilModule.Signal()
t_2.ChatActiveChanged = chatUtilModule.Signal()
t_2.ChatActiveChanged:connect(function(p1)
	-- upvalues: t_2 (ref)
	t_2:SetVisible(p1)
end)
t_2.VisibilityStateChanged = chatUtilModule.Signal()
t_2.MessagesChanged = chatUtilModule.Signal()
t_2.BubbleChatOnlySet = chatUtilModule.Signal()
t_2.ChatDisabled = chatUtilModule.Signal()
local var3 = false
local t_3 = {}

local function NonFunc() end

starterGuiService:RegisterSetCore("ChatMakeSystemMessage", function(p1)
	-- upvalues: var3 (write), t_3 (ref)
	if var3 then
		return
	end
	table.insert(t_3, p1)
end)
starterGuiService:RegisterSetCore("ChatWindowPosition", NonFunc)
starterGuiService:RegisterGetCore("ChatWindowPosition", NonFunc)
starterGuiService:RegisterSetCore("ChatWindowSize", NonFunc)
starterGuiService:RegisterGetCore("ChatWindowSize", NonFunc)
starterGuiService:RegisterSetCore("ChatBarDisabled", NonFunc)
starterGuiService:RegisterGetCore("ChatBarDisabled", NonFunc)
starterGuiService:RegisterGetCore("ChatActive", function()
	-- upvalues: t_2 (ref)
	return t_2:GetVisibility()
end)
starterGuiService:RegisterSetCore("ChatActive", function(p1)
	-- upvalues: t_2 (ref)
	t_2.ChatActiveChanged:fire(p1)
end)

local function _(value, p1, p2)
	if value[p2] then
		value[p2]:connect(function(...)
			-- upvalues: p1 (ref), p2 (ref)
			p1[p2]:fire(...)
		end)
	end
end

coroutine.wrap(function()
	-- upvalues: var1 (write), robloxGui (ref), t_2 (ref), playersService (ref), starterGuiService (ref), t_1 (ref), var3 (write), t_3 (ref)
	var1 = require(robloxGui.Modules.NewChat)
	local var4 = var1
	
	if var4.ChatBarFocusChanged then
		local var5 = "ChatBarFocusChanged"
		var4.ChatBarFocusChanged:connect(function(...)
			-- upvalues: t_2 (ref), var5 (ref)
			t_2[var5]:fire(...)
		end)
	end
	local var6 = var1
	
	if var6.VisibilityStateChanged then
		local var7 = "VisibilityStateChanged"
		var6.VisibilityStateChanged:connect(function(...)
			-- upvalues: t_2 (ref), var7 (ref)
			t_2[var7]:fire(...)
		end)
	end
	local var8 = var1
	
	if var8.ChatWindowToggled then
		local var9 = "ChatWindowToggled"
		var8.ChatWindowToggled:connect(function(...)
			-- upvalues: t_2 (ref), var9 (ref)
			t_2[var9]:fire(...)
		end)
	end
	local var10 = var1
	
	if var10.ChatActiveChanged then
		local var11 = "ChatActiveChanged"
		var10.ChatActiveChanged:connect(function(...)
			-- upvalues: t_2 (ref), var11 (ref)
			t_2[var11]:fire(...)
		end)
	end
	local var12 = var1
	
	if var12.BubbleChatOnlySet then
		local var13 = "BubbleChatOnlySet"
		var12.BubbleChatOnlySet:connect(function(...)
			-- upvalues: t_2 (ref), var13 (ref)
			t_2[var13]:fire(...)
		end)
	end
	local var14 = var1
	
	if var14.ChatDisabled then
		local var15 = "ChatDisabled"
		var14.ChatDisabled:connect(function(...)
			-- upvalues: t_2 (ref), var15 (ref)
			t_2[var15]:fire(...)
		end)
	end
	while playersService.LocalPlayer == nil do
		playersService.ChildAdded:wait()
	end
	local _ = playersService.LocalPlayer
	local var16 = var1
	
	if var16.MessagesChanged then
		local var17 = "MessagesChanged"
		var16.MessagesChanged:connect(function(...)
			-- upvalues: t_2 (ref), var17 (ref)
			t_2[var17]:fire(...)
		end)
	end
	starterGuiService:RegisterGetCore("UseNewLuaChat", function()
		return true
	end)
	var1:SetVisible(t_1.Visible)
	starterGuiService:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Chat))
	var3 = true
	
	for i, v in pairs(t_3) do
		pcall(function()
			-- upvalues: starterGuiService (copy), v (ref)
			starterGuiService:SetCore("ChatMakeSystemMessage", v)
		end)
	end
end)()

return t_2