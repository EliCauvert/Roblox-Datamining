local contextActionService = game:GetService("ContextActionService")
local userInputService = game:GetService("UserInputService")
local playersService = game:GetService("Players")
local guiService = game:GetService("GuiService")
local fixCASGetButtonYieldedEngineFeature = game:GetEngineFeature("FixCASGetButtonYielded")
local fixCASMaxTouchButtons = game:DefineFastFlag("FixCASMaxTouchButtons", false)
local _ = userInputService.TouchEnabled
local t = {}
local t_1 = {}
local var8 = nil
local var9 = nil
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

function createContextActionGui() --[[ line: 61 ]]
	-- upvalues: var8 (write), var9 (write), userInputService (ref), guiService (ref)
	if not var8 then
		var8 = Instance.new("ScreenGui")
		var8.Name = "ContextActionGui"
		var8.ResetOnSpawn = false
		var9 = Instance.new("Frame")
		var9.BackgroundTransparency = 1
		var9.Size = UDim2.new(0.3, 0, 0.5, 0)
		var9.Position = UDim2.new(0.7, 0, 0.5, 0)
		var9.Name = "ContextButtonFrame"
		var9.Parent = var8
		
		local var14 = function() --[[ line: 73 ]]
			-- upvalues: var9 (copy), userInputService (copy), guiService (copy)
			var9.Visible = userInputService.PreferredInput == Enum.PreferredInput.Touch and guiService.TouchControlsEnabled
		end
		
		guiService:GetPropertyChangedSignal("TouchControlsEnabled"):Connect(var14)
		userInputService:GetPropertyChangedSignal("PreferredInput"):Connect(var14)
		var9.Visible = userInputService.PreferredInput == Enum.PreferredInput.Touch and guiService.TouchControlsEnabled
	end
end

function setButtonSizeAndPosition(value) --[[ line: 84 ]]
	local var15 = 55
	local var16 = 10
	
	if game:GetService("CoreGui").RobloxGui.AbsoluteSize.X >= 600 then
		var15 = 85
		var16 = 40
	end
	value.Size = UDim2.new(0, var15, 0, var15)
end

function contextActionButtonDown(p0, p1, p2) --[[ line: 99 ]]
	-- upvalues: contextActionService (ref)
	p0.Image = "https://www.roblox.com/asset/?id=97166756"
	contextActionService:CallFunction(p2, Enum.UserInputState.Begin, p1)
end

function contextActionButtonMoved(p3, p4, p5) --[[ line: 104 ]]
	-- upvalues: contextActionService (ref)
	p3.Image = "https://www.roblox.com/asset/?id=97166756"
	contextActionService:CallFunction(p5, Enum.UserInputState.Change, p4)
end

function contextActionButtonUp(p6, p7, p8) --[[ line: 109 ]]
	-- upvalues: contextActionService (ref)
	p6.Image = "https://www.roblox.com/asset/?id=97166444"
	contextActionService:CallFunction(p8, Enum.UserInputState.End, p7)
end

function contextActionButtonCancel(p9, p10, p11) --[[ line: 114 ]]
	-- upvalues: contextActionService (ref)
	p9.Image = "https://www.roblox.com/asset/?id=97166444"
	contextActionService:CallFunction(p11, Enum.UserInputState.Cancel, p10)
end

function isSmallScreenDevice() --[[ line: 119 ]]
	return game:GetService("GuiService"):GetScreenResolution().Y <= 320
end

function createNewButton(p12, p13) --[[ line: 124 ]]
	-- upvalues: var9 (write), userInputService (ref)
	local contextActionButton = Instance.new("ImageButton")
	contextActionButton.Name = "ContextActionButton"
	contextActionButton.BackgroundTransparency = 1
	contextActionButton.Size = UDim2.new(0, 45, 0, 45)
	contextActionButton.Active = true
	
	if isSmallScreenDevice() then
		contextActionButton.Size = UDim2.new(0, 35, 0, 35)
	end
	contextActionButton.Image = "https://www.roblox.com/asset/?id=97166444"
	contextActionButton.Parent = var9
	local var18 = nil
	local var19 = false
	userInputService.InputEnded:connect(function(p14) --[[ line: 151 ]]
		-- upvalues: var18 (write), var19 (write), contextActionButton (ref), p12 (ref)
		if p14.UserInputType ~= Enum.UserInputType.Touch then return end
		if var18 ~= p14 then return end
		if p14.UserInputState == Enum.UserInputState.End and var19 then
			contextActionButtonCancel(contextActionButton, p14, p12)
		end
		var18 = nil
		var19 = false
	end)
	contextActionButton.InputBegan:connect(function(p15) --[[ line: 167 ]]
		-- upvalues: var18 (write), var19 (write), contextActionButton (ref), p12 (ref)
		if p15.UserInputType ~= Enum.UserInputType.Touch then return end
		if p15.UserInputState == Enum.UserInputState.Begin then
			var18 = p15
			var19 = false
			contextActionButtonDown(contextActionButton, p15, p12)
			
			return
		elseif p15.UserInputState == Enum.UserInputState.Change then
			if var18 ~= p15 then return end
			var19 = false
		end
	end)
	contextActionButton.InputEnded:connect(function(p16) --[[ line: 186 ]]
		-- upvalues: var18 (write), var19 (write), contextActionButton (ref), p12 (ref)
		if p16.UserInputType ~= Enum.UserInputType.Touch then return end
		if var18 ~= p16 then return end
		if p16.UserInputState == Enum.UserInputState.End then
			var18 = nil
			var19 = false
			contextActionButtonUp(contextActionButton, p16, p12)
			
			return
		elseif p16.UserInputState == Enum.UserInputState.Change then
			var19 = true
		end
	end)
	contextActionButton.InputChanged:connect(function(p17) --[[ line: 205 ]]
		-- upvalues: var18 (write), contextActionButton (ref), p12 (ref)
		if p17.UserInputType ~= Enum.UserInputType.Touch then return end
		if var18 == p17 then
			contextActionButtonMoved(contextActionButton, p17, p12)
			
			return
		end
	end)
	local actionIcon = Instance.new("ImageLabel")
	actionIcon.Name = "ActionIcon"
	actionIcon.Position = UDim2.new(0.175, 0, 0.175, 0)
	actionIcon.Size = UDim2.new(0.65, 0, 0.65, 0)
	actionIcon.BackgroundTransparency = 1
	
	if p13.image and type(p13.image) == "string" then
		actionIcon.Image = p13.image
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
	
	if p13.title and type(p13.title) == "string" then
		actionTitle.Text = p13.title
	end
	actionTitle.Parent = contextActionButton
	
	return contextActionButton
end

function createButton(p18, p19) --[[ line: 243 ]]
	-- upvalues: fixCASMaxTouchButtons (ref), t_1 (ref), t_2Count (ref), t (ref), t_2 (ref), var9 (write), var8 (write), playerGui (ref)
	local var22 = if not fixCASMaxTouchButtons then createNewButton(p18, p19) else nil
	local var23 = nil
	
	for i = 1, #t_1 do
		if t_1[i] ~= "empty" then
			continue
		end
		var23 = i
		break
	end
	var23 = var23 or #t_1 + 1
	
	if t_2Count < var23 then
		if fixCASMaxTouchButtons then
			warn("Maximum of 7 allowed touch buttons, new touch button not created for " .. p18 .. ".")
		end
		return
	elseif fixCASMaxTouchButtons then
		var22 = createNewButton(p18, p19)
	end
	t_1[var23] = var22
	t[p18].button = var22
	var22.Position = t_2[var23]
	var22.Parent = var9
	
	if var8 and var8.Parent == nil then
		var8.Parent = playerGui
		
		if not var9.Parent then
			var9.Parent = var8
		end
	end
end

function removeAction(p20) --[[ line: 286 ]]
	-- upvalues: t (ref), t_1 (ref)
	if not t[p20] then return end
	local button = t[p20].button
	
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
	t[p20] = nil
end

function addAction(p21, p22, p23) --[[ line: 307 ]]
	-- upvalues: t (ref)
	if t[p21] then
		removeAction(p21)
	end
	t[p21] = { p23 }
	
	if p22 then
		createContextActionGui()
		createButton(p21, p23)
	end
end

contextActionService.BoundActionChanged:connect(function(p24, p25, p26) --[[ line: 319 ]]
	-- upvalues: t (ref)
	if t[p24] and p26 then
		local button = t[p24].button
		local var24 = p26[p25]
		
		if not var24 and (p25 == "image" or p25 == "title" or p25 == "description") then
			var24 = ""
		end
		if button then
			if p25 == "image" then
				button.ActionIcon.Image = var24
				
				return
			elseif p25 == "title" then
				button.ActionTitle.Text = var24
				
				return
			elseif p25 == "description" then return end
			if p25 == "position" then
				button.Position = var24
			end
		end
	end
end)
contextActionService.BoundActionAdded:connect(function(p27, p28, p29) --[[ line: 341 ]]
	addAction(p27, p28, p29)
end)
contextActionService.BoundActionRemoved:connect(function(p30, _) --[[ line: 345 ]]
	removeAction(p30)
end)
contextActionService.GetActionButtonEvent:connect(function(p31) --[[ line: 349 ]]
	-- upvalues: t (ref), contextActionService (ref)
	if t[p31] then
		contextActionService:FireActionButtonFoundSignal(p31, t[p31].button)
	end
end)

for i, v in pairs(contextActionService:GetAllBoundActionInfo()) do
	addAction(i, v.createTouchButton, v)
	
	if fixCASGetButtonYieldedEngineFeature and t[i] and t[i].button then
		contextActionService:FireActionButtonFoundSignal(i, t[i].button)
	end
end