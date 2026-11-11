local ContextActionService = game:GetService("ContextActionService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")
local FixCASGetButtonYieldedEngineFeature = game:GetEngineFeature("FixCASGetButtonYielded")
local FixCASMaxTouchButtons = game:DefineFastFlag("FixCASMaxTouchButtons", false)
local _ = UserInputService.TouchEnabled
local t = {}
local NewButtons = {}
local ScreenGui = nil
local Frame = nil
local config = {
	[1] = UDim2.new(0, 123, 0, 70),
	[2] = UDim2.new(0, 30, 0, 60),
	[3] = UDim2.new(0, 180, 0, 160),
	[4] = UDim2.new(0, 85, 0, -25),
	[5] = UDim2.new(0, 185, 0, -25),
	[6] = UDim2.new(0, 185, 0, 260),
	[7] = UDim2.new(0, 216, 0, 65)
}
local CountConfig = #config
game:GetService("ContentProvider"):Preload("https://www.roblox.com/asset/?id=97166756")
game:GetService("ContentProvider"):Preload("https://www.roblox.com/asset/?id=97166444")
local _ = game:GetService("CorePackages")
local CoreUtilityModule = require(game:GetService("CoreGui").RobloxGui.Modules.CoreUtility)
local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
	Players.ChildAdded:wait()
	LocalPlayer = Players.LocalPlayer
end
local PlayerGui = CoreUtilityModule.waitForChildOfClass(LocalPlayer, "PlayerGui")

function createContextActionGui()
	-- upvalues: ScreenGui (ref), Frame (ref), UserInputService (copy), GuiService (copy)
	if not ScreenGui then
		ScreenGui = Instance.new("ScreenGui")
		ScreenGui.Name = "ContextActionGui"
		ScreenGui.ResetOnSpawn = false
		Frame = Instance.new("Frame")
		Frame.BackgroundTransparency = 1
		Frame.Size = UDim2.new(0.3, 0, 0.5, 0)
		Frame.Position = UDim2.new(0.7, 0, 0.5, 0)
		Frame.Name = "ContextButtonFrame"
		Frame.Parent = ScreenGui
		
		local function Callback()
			-- upvalues: Frame (upval), UserInputService (upval), GuiService (upval)
			Frame.Visible = UserInputService.PreferredInput == Enum.PreferredInput.Touch and GuiService.TouchControlsEnabled
		end
		
		GuiService:GetPropertyChangedSignal("TouchControlsEnabled"):Connect(Callback)
		UserInputService:GetPropertyChangedSignal("PreferredInput"):Connect(Callback)
		Frame.Visible = UserInputService.PreferredInput == Enum.PreferredInput.Touch and GuiService.TouchControlsEnabled
	end
end

function setButtonSizeAndPosition(p1)
	local XOffset: number = if game:GetService("CoreGui").RobloxGui.AbsoluteSize.X < 600 then 55 else 85
	p1.Size = UDim2.new(0, XOffset, 0, XOffset)
end

function contextActionButtonDown(p1, InputObject, ActionName)
	-- upvalues: ContextActionService (copy)
	p1.Image = "https://www.roblox.com/asset/?id=97166756"
	ContextActionService:CallFunction(ActionName, Enum.UserInputState.Begin, InputObject)
end

function contextActionButtonMoved(p1, InputObject, ActionName)
	-- upvalues: ContextActionService (copy)
	p1.Image = "https://www.roblox.com/asset/?id=97166756"
	ContextActionService:CallFunction(ActionName, Enum.UserInputState.Change, InputObject)
end

function contextActionButtonUp(p1, InputObject, ActionName)
	-- upvalues: ContextActionService (copy)
	p1.Image = "https://www.roblox.com/asset/?id=97166444"
	ContextActionService:CallFunction(ActionName, Enum.UserInputState.End, InputObject)
end

function contextActionButtonCancel(p1, InputObject, ActionName)
	-- upvalues: ContextActionService (copy)
	p1.Image = "https://www.roblox.com/asset/?id=97166444"
	ContextActionService:CallFunction(ActionName, Enum.UserInputState.Cancel, InputObject)
end

function isSmallScreenDevice(): boolean
	return game:GetService("GuiService"):GetScreenResolution().Y <= 320
end

function createNewButton(p1, p2)
	-- upvalues: Frame (ref), UserInputService (copy)
	local ContextActionButton = Instance.new("ImageButton")
	ContextActionButton.Name = "ContextActionButton"
	ContextActionButton.BackgroundTransparency = 1
	ContextActionButton.Size = UDim2.new(0, 45, 0, 45)
	ContextActionButton.Active = true
	
	if isSmallScreenDevice() then
		ContextActionButton.Size = UDim2.new(0, 35, 0, 35)
	end
	ContextActionButton.Image = "https://www.roblox.com/asset/?id=97166444"
	ContextActionButton.Parent = Frame
	local Input = nil
	local Flag = false
	UserInputService.InputEnded:connect(function(Input1)
		-- upvalues: Input (ref), Flag (ref), ContextActionButton (copy), p1 (copy)
		if Input1.UserInputType ~= Enum.UserInputType.Touch then return end
		if Input ~= Input1 then return end
		if Input1.UserInputState == Enum.UserInputState.End and Flag then
			contextActionButtonCancel(ContextActionButton, Input1, p1)
		end
		Input = nil
		Flag = false
	end)
	ContextActionButton.InputBegan:connect(function(Input1)
		-- upvalues: Input (ref), Flag (ref), ContextActionButton (copy), p1 (copy)
		if Input1.UserInputType ~= Enum.UserInputType.Touch then return end
		if Input1.UserInputState == Enum.UserInputState.Begin then
			Input = Input1
			Flag = false
			contextActionButtonDown(ContextActionButton, Input1, p1)
			
			return
		end
		if Input1.UserInputState == Enum.UserInputState.Change then
			if Input ~= Input1 then return end
			Flag = false
		end
	end)
	ContextActionButton.InputEnded:connect(function(Input1)
		-- upvalues: Input (ref), Flag (ref), ContextActionButton (copy), p1 (copy)
		if Input1.UserInputType ~= Enum.UserInputType.Touch then return end
		if Input ~= Input1 then return end
		if Input1.UserInputState == Enum.UserInputState.End then
			Input = nil
			Flag = false
			contextActionButtonUp(ContextActionButton, Input1, p1)
			
			return
		elseif Input1.UserInputState == Enum.UserInputState.Change then
			Flag = true
		end
	end)
	ContextActionButton.InputChanged:connect(function(Input1)
		-- upvalues: Input (ref), ContextActionButton (copy), p1 (copy)
		if Input1.UserInputType ~= Enum.UserInputType.Touch then return end
		if Input == Input1 then
			contextActionButtonMoved(ContextActionButton, Input1, p1)
			
			return
		end
	end)
	local ActionIcon = Instance.new("ImageLabel")
	ActionIcon.Name = "ActionIcon"
	ActionIcon.Position = UDim2.new(0.175, 0, 0.175, 0)
	ActionIcon.Size = UDim2.new(0.65, 0, 0.65, 0)
	ActionIcon.BackgroundTransparency = 1
	
	if p2.image and type(p2.image) == "string" then
		ActionIcon.Image = p2.image
	end
	ActionIcon.Parent = ContextActionButton
	local ActionTitle = Instance.new("TextLabel")
	ActionTitle.Name = "ActionTitle"
	ActionTitle.Size = UDim2.new(1, 0, 1, 0)
	ActionTitle.BackgroundTransparency = 1
	ActionTitle.Font = Enum.Font.SourceSansBold
	ActionTitle.TextColor3 = Color3.new(1, 1, 1)
	ActionTitle.TextStrokeTransparency = 0
	ActionTitle.FontSize = Enum.FontSize.Size18
	ActionTitle.TextWrapped = true
	ActionTitle.Text = ""
	
	if p2.title and type(p2.title) == "string" then
		ActionTitle.Text = p2.title
	end
	ActionTitle.Parent = ContextActionButton
	
	return ContextActionButton
end

function createButton(Text, p1)
	-- upvalues: FixCASMaxTouchButtons (copy), NewButtons (copy), CountConfig (copy), t (copy), config (copy), Frame (ref), ScreenGui (ref), PlayerGui (copy)
	local NewButton = if FixCASMaxTouchButtons then nil else createNewButton(Text, p1)
	local v1: number? = nil
	
	for i = 1, #NewButtons do
		if NewButtons[i] ~= "empty" then
			continue
		end
		v1 = i
		break
	end
	if not v1 then
		v1 = #NewButtons + 1
	end
	if CountConfig >= v1 then
		if FixCASMaxTouchButtons then
			NewButton = createNewButton(Text, p1)
		end
		NewButtons[v1] = NewButton
		t[Text].button = NewButton
		NewButton.Position = config[v1]
		NewButton.Parent = Frame
		
		if ScreenGui and ScreenGui.Parent == nil then
			ScreenGui.Parent = PlayerGui
			
			if not Frame.Parent then
				Frame.Parent = ScreenGui
			end
		end
		return
	elseif FixCASMaxTouchButtons then
		warn("Maximum of 7 allowed touch buttons, new touch button not created for " .. Text .. ".")
	end
end

function removeAction(Key)
	-- upvalues: t (copy), NewButtons (copy)
	if not t[Key] then return end
	local Button = t[Key].button
	
	if Button then
		Button.Parent = nil
		
		for i = 1, #NewButtons do
			if NewButtons[i] ~= Button then
				continue
			end
			NewButtons[i] = "empty"
			break
		end
		Button:Destroy()
	end
	t[Key] = nil
end

function addAction(Key, p2, p3)
	-- upvalues: t (copy)
	if t[Key] then
		removeAction(Key)
	end
	t[Key] = { p3 }
	
	if p2 then
		createContextActionGui()
		createButton(Key, p3)
	end
end

ContextActionService.BoundActionChanged:connect(function(ActionChanged, ChangeName, ChangeTable)
	-- upvalues: t (copy)
	if t[ActionChanged] and ChangeTable then
		local Button = t[ActionChanged].button
		local Change = ChangeTable[ChangeName]
		
		if not Change and (ChangeName == "image" or ChangeName == "title" or ChangeName == "description") then
			Change = ""
		end
		if Button then
			if ChangeName == "image" then
				Button.ActionIcon.Image = Change
				
				return
			end
			if ChangeName == "title" then
				Button.ActionTitle.Text = Change
				
				return
			end
			if ChangeName == "description" then return end
			if ChangeName == "position" then
				Button.Position = Change
			end
		end
	end
end)
ContextActionService.BoundActionAdded:connect(function(ActionAdded, CreateTouchButton, FunctionInfoTable)
	addAction(ActionAdded, CreateTouchButton, FunctionInfoTable)
end)
ContextActionService.BoundActionRemoved:connect(function(ActionRemoved, _)
	removeAction(ActionRemoved)
end)
ContextActionService.GetActionButtonEvent:connect(function(ActionName)
	-- upvalues: t (copy), ContextActionService (copy)
	if t[ActionName] then
		ContextActionService:FireActionButtonFoundSignal(ActionName, t[ActionName].button)
	end
end)

for i, value in pairs((ContextActionService:GetAllBoundActionInfo())) do
	addAction(i, value.createTouchButton, value)
	
	if FixCASGetButtonYieldedEngineFeature and t[i] and t[i].button then
		ContextActionService:FireActionButtonFoundSignal(i, t[i].button)
	end
end