local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CorePackages = game:GetService("CorePackages")
local Panel3D = require(CorePackages.Workspace.Packages.VrCommon).Panel3D
local _ = Color3.new(0.2, 0.2, 0.2)
local _ = Enum.FontSize.Size36
local _ = Color3.new(1, 1, 1)
local LocalCF = CFrame.new(0, 0, -7) * CFrame.Angles(0, 3.141592653589793, 0)
local _ = require(CorePackages.Workspace.Packages.AppCommonLib).Create("ImageLabel")({
	Name = "EmptySelectionImage",
	Image = "",
	BackgroundTransparency = 1,
	ImageTransparency = 1
})
local Dialog = Panel3D.Get("Dialog")
Dialog:SetType(Panel3D.Type.Fixed)
Dialog.localCF = LocalCF
Dialog:SetCanFade(true)
local v1 = 0
local T = {}
local Flag = false
local v2 = 0

local function _(p1) --[[ Line: 46 | Named "positionDialogPanel" ]]
	-- upvalues: v1 (ref), UserInputService (copy), Dialog (copy), LocalCF (copy)
	v1 = p1
	Dialog.localCF = CFrame.new(UserInputService:GetUserCFrame(Enum.UserCFrame.Head).p) * CFrame.Angles(0, p1, 0) * LocalCF
end

function Dialog:CalculateTransparency(): number --[[ Line: 53 ]]
	-- upvalues: UserInputService (copy), v2 (ref), v1 (ref), Flag (ref)
	local UserCFrame = UserInputService:GetUserCFrame(Enum.UserCFrame.Head)
	local ScaledLookVector = UserCFrame.lookVector * vector.create(1, 0, 1)
	local _Vector3 = Vector3.new(math.cos(v2 + v1 + 1.5707963267948966), 0, -math.sin(v2 + v1 + 1.5707963267948966))
	
	if math.abs((math.asin(UserCFrame.lookVector.Y))) > 0.767944870877505 then
		Flag = true
	end
	return (math.min(math.max(0, (math.acos((ScaledLookVector:Dot(_Vector3))) - 0.6544984694978736) / 0.11344640137963136), 1))
end

local function updatePanelPosition() --[[ Line: 69 ]]
	-- upvalues: UserInputService (copy), v2 (ref), Flag (ref), v1 (ref), Dialog (copy), LocalCF (copy)
	local ScaledLookVector = UserInputService:GetUserCFrame(Enum.UserCFrame.Head).lookVector * vector.create(1, 0, 1)
	local AngleRemainder = (math.atan2(-ScaledLookVector.Z, ScaledLookVector.X) - 1.5707963267948966) % 6.283185307179586
	local NewFloored = v2 + math.floor(AngleRemainder / 1.5707963267948966 + 0.5) * 1.5707963267948966
	
	if Flag then
		Flag = false
		v2 = AngleRemainder
	end
	v1 = NewFloored
	Dialog.localCF = CFrame.new(UserInputService:GetUserCFrame(Enum.UserCFrame.Head).p) * CFrame.Angles(0, NewFloored, 0) * LocalCF
end

function dialogPanelRenderUpdate() --[[ Line: 84 ]]
	-- upvalues: Dialog (copy), Flag (ref), updatePanelPosition (copy), T (ref)
	if Dialog.transparency == 1 or Flag then
		updatePanelPosition()
	end
	local v3 = 1 - Dialog.transparency
	
	for Object, value in pairs(T) do
		local BackgroundTransparency = 1 - value * v3
		
		if Object:IsA("TextLabel") or Object:IsA("TextButton") then
			Object.TextTransparency = BackgroundTransparency
		elseif Object:IsA("ImageLabel") or Object:IsA("ImageButton") then
			Object.ImageTransparency = BackgroundTransparency
		elseif Object:IsA("Frame") then
			Object.BackgroundTransparency = BackgroundTransparency
		end
	end
end

local List = {}
local DescendantAddedConnection = nil
local v4 = nil

local function updatePanel() --[[ Line: 107 ]]
	-- upvalues: List (copy), v4 (ref), Dialog (copy), T (ref), DescendantAddedConnection (ref), Flag (ref), updatePanelPosition (copy)
	local Entry = List[1]
	
	if v4 and v4.content then
		v4.content.Parent = nil
	end
	if Entry and Entry.content then
		Entry.content.Parent = Dialog:GetGUI()
		v4 = Entry
		local AbsoluteSize = Entry.content.AbsoluteSize
		Dialog:ResizePixels(AbsoluteSize.X, AbsoluteSize.Y, 100)
		Flag = true
		updatePanelPosition()
		Dialog:SetVisible(true)
		T = {}
		
		local function search(Object) --[[ Line: 131 ]]
			-- upvalues: T (upval), search (copy)
			if Object:IsA("ImageLabel") or Object:IsA("ImageButton") then
				T[Object] = 1 - Object.ImageTransparency
			elseif Object:IsA("TextLabel") or Object:IsA("TextButton") then
				T[Object] = 1 - Object.TextTransparency
			elseif Object:IsA("Frame") then
				T[Object] = 1 - Object.BackgroundTransparency
			end
			for _, child in pairs(Object:GetChildren()) do
				search(child)
			end
		end
		
		search(Dialog:GetGUI())
		
		if DescendantAddedConnection then
			DescendantAddedConnection:disconnect()
			DescendantAddedConnection = nil
		end
		DescendantAddedConnection = Dialog:GetGUI().DescendantAdded:connect(function(Descendant) --[[ Line: 148 ]]
			-- upvalues: search (copy)
			search(Descendant)
		end)
	else
		Dialog:SetVisible(false)
		T = {}
		
		if DescendantAddedConnection then
			DescendantAddedConnection:disconnect()
			DescendantAddedConnection = nil
			
			return
		end
	end
end

local DialogModule = {}
DialogModule.__index = DialogModule

function DialogModule.new(Content) --[[ Line: 160 ]]
	-- upvalues: DialogModule (copy)
	local self = setmetatable({}, DialogModule)
	self.content = Content
	
	return self
end

function DialogModule:SetContent(Content) --[[ Line: 166 ]]
	if not Content and self.content then
		self.content.Parent = nil
	end
	self.content = Content
end

local Flag1 = false

function DialogModule.Show(p1, p2) --[[ Line: 174 ]]
	-- upvalues: Flag1 (ref), RunService (copy), List (copy), updatePanel (copy)
	if not Flag1 then
		Flag1 = true
		RunService:BindToRenderStep("DialogPanel", Enum.RenderPriority.First.Value, dialogPanelRenderUpdate)
	end
	if p2 then
		table.insert(List, 1, p1)
	else
		table.insert(List, p1)
	end
	updatePanel()
end

function DialogModule.Close(p1) --[[ Line: 187 ]]
	-- upvalues: List (copy), Flag1 (ref), RunService (copy), updatePanel (copy)
	for i, value in pairs(List) do
		if value == p1 then
			table.remove(List, i)
			break
		end
	end
	if Flag1 and #List == 0 then
		Flag1 = false
		RunService:UnbindFromRenderStep("DialogPanel")
	end
	updatePanel()
end

return DialogModule