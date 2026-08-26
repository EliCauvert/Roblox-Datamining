local contextActionService = game:GetService("ContextActionService")
local userInputService = game:GetService("UserInputService")
local playersService = game:GetService("Players")
local guiService = game:GetService("GuiService")
local fixCASGetButtonYieldedEngineFeature = game:GetEngineFeature("FixCASGetButtonYielded")
local fixCASMaxTouchButtons = game:DefineFastFlag("FixCASMaxTouchButtons", false)
local _ = userInputService.TouchEnabled
local t = {}
local t_1 = {}
local var1 = nil
local var2 = nil
local _ = {}
local t_2 = {
	[1] = UDim2.new(0, 123, 0, 70),
	[2] = UDim2.new(0, 30, 0, 60),
	[3] = UDim2.new(0, 180, 0, 160),
	[4] = UDim2.new(0, 85, 0, -25),
	[5] = UDim2.new(0, 185, 0, -25),
	[6] = UDim2.new(0, 185, 0, 260),
	[7] = UDim2.new(0, 216, 0, 65)
}
local t_2Count = #t_2
game:GetService("ContentProvider"):Preload("https://www.roblox.com/asset/?id=97166756")
game:GetService("ContentProvider"):Preload("https://www.roblox.com/asset/?id=97166444")
local _ = game:GetService("CorePackages")
local coreUtilityModule = require(game:GetService("CoreGui").RobloxGui.Modules.CoreUtility)
local localPlayer = playersService.LocalPlayer
while not localPlayer do
	playersService.ChildAdded:wait()
	localPlayer = playersService.LocalPlayer
end
local playerGui = coreUtilityModule.waitForChildOfClass(localPlayer, "PlayerGui")

function createContextActionGui()
	-- upvalues: var1 (write), var2 (write), userInputService (ref), guiService (ref)
	if not var1 then
		var1 = Instance.new("ScreenGui")
		var1.Name = "ContextActionGui"
		var1.ResetOnSpawn = false
		var2 = Instance.new("Frame")
		var2.BackgroundTransparency = 1
		var2.Size = UDim2.new(0.3, 0, 0.5, 0)
		var2.Position = UDim2.new(0.7, 0, 0.5, 0)
		var2.Name = "ContextButtonFrame"
		var2.Parent = var1
		
		local var3 = function()
			-- upvalues: var2 (copy), userInputService (copy), guiService (copy)
			var2.Visible = userInputService.PreferredInput == Enum.PreferredInput.Touch and guiService.TouchControlsEnabled
		end
		
		guiService:GetPropertyChangedSignal("TouchControlsEnabled"):Connect(var3)
		userInputService:GetPropertyChangedSignal("PreferredInput"):Connect(var3)
		var2.Visible = userInputService.PreferredInput == Enum.PreferredInput.Touch and guiService.TouchControlsEnabled
	end
end

function setButtonSizeAndPosition(value)
	local var3 = 55
	local var4 = 10
	
	if game:GetService("CoreGui").RobloxGui.AbsoluteSize.X >= 600 then
		var3 = 85
		var4 = 40
	end
	value.Size = UDim2.new(0, var3, 0, var3)
end

function contextActionButtonDown(p1, p2, p3)
	-- upvalues: contextActionService (ref)
	p1.Image = "https://www.roblox.com/asset/?id=97166756"
	contextActionService:CallFunction(p3, Enum.UserInputState.Begin, p2)
end

function contextActionButtonMoved(p1, p2, p3)
	-- upvalues: contextActionService (ref)
	p1.Image = "https://www.roblox.com/asset/?id=97166756"
	contextActionService:CallFunction(p3, Enum.UserInputState.Change, p2)
end

function contextActionButtonUp(p1, p2, p3)
	-- upvalues: contextActionService (ref)
	p1.Image = "https://www.roblox.com/asset/?id=97166444"
	contextActionService:CallFunction(p3, Enum.UserInputState.End, p2)
end

function contextActionButtonCancel(p1, p2, p3)
	-- upvalues: contextActionService (ref)
	p1.Image = "https://www.roblox.com/asset/?id=97166444"
	contextActionService:CallFunction(p3, Enum.UserInputState.Cancel, p2)
end

function isSmallScreenDevice()
	return game:GetService("GuiService"):GetScreenResolution().Y <= 320
end

function createNewButton(p1, p2)
	-- upvalues: var2 (write), userInputService (ref)
	local contextActionButton = Instance.new("ImageButton")
	contextActionButton.Name = "ContextActionButton"
	contextActionButton.BackgroundTransparency = 1
	contextActionButton.Size = UDim2.new(0, 45, 0, 45)
	contextActionButton.Active = true
	
	if isSmallScreenDevice() then
		contextActionButton.Size = UDim2.new(0, 35, 0, 35)
	end
	contextActionButton.Image = "https://www.roblox.com/asset/?id=97166444"
	contextActionButton.Parent = var2
	local var3 = nil
	local var4 = false
	userInputService.InputEnded:connect(function(p3)
		-- upvalues: var3 (write), var4 (write), contextActionButton (ref), p1 (ref)
		if p3.UserInputType ~= Enum.UserInputType.Touch then return end
		if var3 ~= p3 then return end
		if p3.UserInputState == Enum.UserInputState.End and var4 then
			contextActionButtonCancel(contextActionButton, p3, p1)
		end
		var3 = nil
		var4 = false
	end)
	contextActionButton.InputBegan:connect(function(p3)
		-- upvalues: var3 (write), var4 (write), contextActionButton (ref), p1 (ref)
		if p3.UserInputType ~= Enum.UserInputType.Touch then return end
		if p3.UserInputState == Enum.UserInputState.Begin then
			var3 = p3
			var4 = false
			contextActionButtonDown(contextActionButton, p3, p1)
			
			return
		elseif p3.UserInputState == Enum.UserInputState.Change then
			if var3 ~= p3 then return end
			var4 = false
		end
	end)
	contextActionButton.InputEnded:connect(function(p3)
		-- upvalues: var3 (write), var4 (write), contextActionButton (ref), p1 (ref)
		if p3.UserInputType ~= Enum.UserInputType.Touch then return end
		if var3 ~= p3 then return end
		if p3.UserInputState == Enum.UserInputState.End then
			var3 = nil
			var4 = false
			contextActionButtonUp(contextActionButton, p3, p1)
			
			return
		elseif p3.UserInputState == Enum.UserInputState.Change then
			var4 = true
		end
	end)
	contextActionButton.InputChanged:connect(function(p3)
		-- upvalues: var3 (write), contextActionButton (ref), p1 (ref)
		if p3.UserInputType ~= Enum.UserInputType.Touch then return end
		if var3 == p3 then
			contextActionButtonMoved(contextActionButton, p3, p1)
			
			return
		end
	end)
	local actionIcon = Instance.new("ImageLabel")
	actionIcon.Name = "ActionIcon"
	actionIcon.Position = UDim2.new(0.175, 0, 0.175, 0)
	actionIcon.Size = UDim2.new(0.65, 0, 0.65, 0)
	actionIcon.BackgroundTransparency = 1
	
	if p2.image and type(p2.image) == "string" then
		actionIcon.Image = p2.image
	end
	actionIcon.Parent = contextActionButton
	local actionTitle = Instance.new("TextLabel")
	actionTitle.Name = "ActionTitle"
	actionTitle.Size = UDim2.new(1, 0, 1, 0)
	actionTitle.BackgroundTransparency = 1
	actionTitle.Font = Enum.Font.SourceSansBold
	actionTitle.TextColor3 = Color3.new(1, 1, 1)
	actionTitle.TextStrokeTransparency = 0
	actionTitle.FontSize = Enum.FontSize.Size18
	actionTitle.TextWrapped = true
	actionTitle.Text = ""
	
	if p2.title and type(p2.title) == "string" then
		actionTitle.Text = p2.title
	end
	actionTitle.Parent = contextActionButton
	
	return contextActionButton
end

function createButton(p1, p2)
	-- upvalues: fixCASMaxTouchButtons (ref), t_1 (ref), t_2Count (ref), t (ref), t_2 (ref), var2 (write), var1 (write), playerGui (ref)
	local var3 = if not fixCASMaxTouchButtons then createNewButton(p1, p2) else nil
	local var4 = nil
	
	for i = 1, #t_1 do
		if t_1[i] ~= "empty" then
			continue
		end
		var4 = i
		break
	end
	var4 = var4 or #t_1 + 1
	
	if t_2Count < var4 then
		if fixCASMaxTouchButtons then
			warn("Maximum of 7 allowed touch buttons, new touch button not created for " .. p18 .. ".")
		end
		return
	elseif fixCASMaxTouchButtons then
		var3 = createNewButton(p1, p2)
	end
	t_1[var4] = var3
	t[p1].button = var3
	var3.Position = t_2[var4]
	var3.Parent = var2
	
	if var1 and var1.Parent == nil then
		var1.Parent = playerGui
		
		if not var2.Parent then
			var2.Parent = var1
		end
	end
end

function removeAction(p3)
	-- upvalues: t (ref), t_1 (ref)
	if not t[p3] then return end
	local button = t[p3].button
	
	if button then
		button.Parent = nil
		
		for i = 1, #t_1 do
			if t_1[i] ~= button then
				continue
			end
			t_1[i] = "empty"
			break
		end
		button:Destroy()
	end
	t[p3] = nil
end

function addAction(p4, p5, p6)
	-- upvalues: t (ref)
	if t[p4] then
		removeAction(p4)
	end
	t[p4] = { p6 }
	
	if p5 then
		createContextActionGui()
		createButton(p4, p6)
	end
end

contextActionService.BoundActionChanged:connect(function(p4, p5, p6)
	-- upvalues: t (ref)
	if t[p4] and p6 then
		local button = t[p4].button
		local var5 = p6[p5]
		
		if not var5 and (p5 == "image" or p5 == "title" or p5 == "description") then
			var5 = ""
		end
		if button then
			if p5 == "image" then
				button.ActionIcon.Image = var5
				
				return
			elseif p5 == "title" then
				button.ActionTitle.Text = var5
				
				return
			elseif p5 == "description" then return end
			if p5 == "position" then
				button.Position = var5
			end
		end
	end
end)
contextActionService.BoundActionAdded:connect(function(p4, p5, p6)
	addAction(p4, p5, p6)
end)
contextActionService.BoundActionRemoved:connect(function(p4, _)
	removeAction(p4)
end)
contextActionService.GetActionButtonEvent:connect(function(p4)
	-- upvalues: t (ref), contextActionService (ref)
	if t[p4] then
		contextActionService:FireActionButtonFoundSignal(p4, t[p4].button)
	end
end)

for i, v in pairs(contextActionService:GetAllBoundActionInfo()) do
	addAction(i, v.createTouchButton, v)
	
	if fixCASGetButtonYieldedEngineFeature and t[i] and t[i].button then
		contextActionService:FireActionButtonFoundSignal(i, t[i].button)
	end
end