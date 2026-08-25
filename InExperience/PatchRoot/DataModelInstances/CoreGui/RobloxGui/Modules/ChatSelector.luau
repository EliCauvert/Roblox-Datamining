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
local var7 = nil
local var8 = nil
local t = {}
local t_1 = { Visible = not VRService.VREnabled }
local t_2 = {
	ToggleVisibility = function(_)
		-- upvalues: var7 (write), t_1 (ref)
		if var7 then
			var7:ToggleVisibility()
			
			return
		end
		t_1.Visible = not t_1.Visible
	end,
	SetVisible = function(_, p0)
		-- upvalues: var7 (write), t_1 (ref)
		if var7 then
			var7:SetVisible(p0)
			
			return
		end
		t_1.Visible = p0
	end,
	FocusChatBar = function(_)
		-- upvalues: var7 (write)
		if var7 then
			var7:FocusChatBar()
		end
	end,
	FocusSelectChatBar = function(_, p1, p2)
		-- upvalues: var7 (write), fFlagEnableConsoleExpControls (ref)
		if var7 and fFlagEnableConsoleExpControls then
			var7:FocusSelectChatBar(p1, p2)
		end
	end,
	EnterWhisperState = function(_, p3)
		-- upvalues: var7 (write)
		if var7 then
			return var7:EnterWhisperState(p3)
		end
	end,
	GetVisibility = function(_)
		-- upvalues: var7 (write), t_1 (ref)
		return if var7 then var7:GetVisibility() else t_1.Visible
	end,
	GetMessageCount = function(_)
		-- upvalues: var7 (write)
		return if var7 then var7:GetMessageCount() else 0
	end,
	TopbarEnabledChanged = function(_, ...)
		-- upvalues: var7 (write)
		if var7 then
			return var7:TopbarEnabledChanged(...)
		end
	end,
	IsFocused = function(_, p4)
		-- upvalues: var7 (write)
		return if var7 then var7:IsFocused(p4) else false
	end,
	ClassicChatEnabled = function(_)
		-- upvalues: var7 (write), classicChat (ref)
		return if var7 then var7:ClassicChatEnabled() else classicChat
	end,
	IsBubbleChatOnly = function(_)
		-- upvalues: var7 (write), bubbleChat (ref), classicChat (ref)
		return if var7 then var7:IsBubbleChatOnly() else bubbleChat and not classicChat
	end,
	IsDisabled = function(_)
		-- upvalues: var7 (write), bubbleChat (ref), classicChat (ref)
		return if var7 then var7:IsDisabled() else not (bubbleChat or classicChat)
	end
}

function t_2.HideTemp(_, p5, p6)
	-- upvalues: t (ref), var8 (write), t_2 (ref)
	local function _()
		-- upvalues: t (copy)
		return next(t) == nil
	end
	
	if next(t) == nil then
		var8 = t_2:GetVisibility()
	end
	if p6 then
		t[p5] = p6
	else
		t[p5] = nil
	end
	t_2:SetVisible(var8 and next(t) == nil)
end

t_2.ChatBarFocusChanged = chatUtilModule.Signal()
t_2.ChatWindowToggled = chatUtilModule.Signal()
t_2.ChatActiveChanged = chatUtilModule.Signal()
t_2.ChatActiveChanged:connect(function(p7)
	-- upvalues: t_2 (ref)
	t_2:SetVisible(p7)
end)
t_2.VisibilityStateChanged = chatUtilModule.Signal()
t_2.MessagesChanged = chatUtilModule.Signal()
t_2.BubbleChatOnlySet = chatUtilModule.Signal()
t_2.ChatDisabled = chatUtilModule.Signal()
local var12 = false
local t_3 = {}

local function NonFunc() end

starterGuiService:RegisterSetCore("ChatMakeSystemMessage", function(p8)
	-- upvalues: var12 (write), t_3 (ref)
	if var12 then
		return
	end
	table.insert(t_3, p8)
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
starterGuiService:RegisterSetCore("ChatActive", function(p9)
	-- upvalues: t_2 (ref)
	t_2.ChatActiveChanged:fire(p9)
end)

local function _(value, p10, p11)
	if value[p11] then
		value[p11]:connect(function(...)
			-- upvalues: p10 (ref), p11 (ref)
			p10[p11]:fire(...)
		end)
	end
end

coroutine.wrap(function()
	-- upvalues: var7 (write), robloxGui (ref), t_2 (ref), playersService (ref), starterGuiService (ref), t_1 (ref), var12 (write), t_3 (ref)
	var7 = require(robloxGui.Modules.NewChat)
	local var15 = var7
	
	if var15.ChatBarFocusChanged then
		local var16 = "ChatBarFocusChanged"
		var15.ChatBarFocusChanged:connect(function(...)
			-- upvalues: t_2 (ref), var16 (ref)
			t_2[var16]:fire(...)
		end)
	end
	local var17 = var7
	
	if var17.VisibilityStateChanged then
		local var18 = "VisibilityStateChanged"
		var17.VisibilityStateChanged:connect(function(...)
			-- upvalues: t_2 (ref), var18 (ref)
			t_2[var18]:fire(...)
		end)
	end
	local var19 = var7
	
	if var19.ChatWindowToggled then
		local var20 = "ChatWindowToggled"
		var19.ChatWindowToggled:connect(function(...)
			-- upvalues: t_2 (ref), var20 (ref)
			t_2[var20]:fire(...)
		end)
	end
	local var21 = var7
	
	if var21.ChatActiveChanged then
		local var22 = "ChatActiveChanged"
		var21.ChatActiveChanged:connect(function(...)
			-- upvalues: t_2 (ref), var22 (ref)
			t_2[var22]:fire(...)
		end)
	end
	local var23 = var7
	
	if var23.BubbleChatOnlySet then
		local var24 = "BubbleChatOnlySet"
		var23.BubbleChatOnlySet:connect(function(...)
			-- upvalues: t_2 (ref), var24 (ref)
			t_2[var24]:fire(...)
		end)
	end
	local var25 = var7
	
	if var25.ChatDisabled then
		local var26 = "ChatDisabled"
		var25.ChatDisabled:connect(function(...)
			-- upvalues: t_2 (ref), var26 (ref)
			t_2[var26]:fire(...)
		end)
	end
	while playersService.LocalPlayer == nil do
		playersService.ChildAdded:wait()
	end
	local _ = playersService.LocalPlayer
	local var27 = var7
	
	if var27.MessagesChanged then
		local var28 = "MessagesChanged"
		var27.MessagesChanged:connect(function(...)
			-- upvalues: t_2 (ref), var28 (ref)
			t_2[var28]:fire(...)
		end)
	end
	starterGuiService:RegisterGetCore("UseNewLuaChat", function()
		return true
	end)
	var7:SetVisible(t_1.Visible)
	starterGuiService:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Chat))
	var12 = true
	
	for i, v in pairs(t_3) do
		pcall(function()
			-- upvalues: starterGuiService (copy), v (ref)
			starterGuiService:SetCore("ChatMakeSystemMessage", v)
		end)
	end
end)()

return t_2