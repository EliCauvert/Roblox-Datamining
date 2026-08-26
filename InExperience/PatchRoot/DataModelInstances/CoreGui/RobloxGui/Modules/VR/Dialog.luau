local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local corePackagesService = game:GetService("CorePackages")
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create
local panel3D = require(corePackagesService.Workspace.Packages.VrCommon).Panel3D
local _ = Color3.new(0.2, 0.2, 0.2)
local _ = Enum.FontSize.Size36
local _ = Color3.new(1, 1, 1)
local var1 = CFrame.new(0, 0, -7) * CFrame.Angles(0, 3.14159265359, 0)
local _ = create("ImageLabel")({
	Name = "EmptySelectionImage",
	Image = "",
	BackgroundTransparency = 1,
	ImageTransparency = 1
})
local dialog = panel3D.Get("Dialog")
dialog:SetType(panel3D.Type.Fixed)
dialog.localCF = var1
dialog:SetCanFade(true)
local var2 = 0
local t = {}
local var3 = false
local var4 = 0

local function _(p1)
	-- upvalues: var2 (write), userInputService (ref), dialog (ref), var1 (ref)
	var2 = p1
	dialog.localCF = CFrame.new(userInputService:GetUserCFrame(Enum.UserCFrame.Head).p) * CFrame.Angles(0, p1, 0) * var1
end

function dialog.CalculateTransparency(_)
	-- upvalues: userInputService (ref), var4 (write), var2 (write), var3 (write)
	local headUserCFrame = userInputService:GetUserCFrame(Enum.UserCFrame.Head)
	local var5 = headUserCFrame.lookVector * Vector3.new(1, 0, 1)
	local vector3 = Vector3.new(math.cos(var4 + var2 + 1.570796326795), 0, -math.sin(var4 + var2 + 1.570796326795))
	
	if math.abs(math.asin(headUserCFrame.lookVector.Y)) > 0.767944870878 then
		var3 = true
	end
	return math.min(math.max(0, (math.acos(var5:Dot(vector3)) - 0.654498469498) / 0.11344640138), 1)
end

local function updatePanelPosition()
	-- upvalues: userInputService (ref), var4 (write), var3 (write), var2 (write), dialog (ref), var1 (ref)
	local var5 = userInputService:GetUserCFrame(Enum.UserCFrame.Head).lookVector * Vector3.new(1, 0, 1)
	local var6 = (math.atan2(-var5.Z, var5.X) - 1.570796326795) % 6.28318530718
	local var7 = var4 + math.floor(var6 / 1.570796326795 + 0.5) * 1.570796326795
	
	if var3 then
		var3 = false
		var4 = var6
	end
	var2 = var7
	dialog.localCF = CFrame.new(userInputService:GetUserCFrame(Enum.UserCFrame.Head).p) * CFrame.Angles(0, var7, 0) * var1
end

function dialogPanelRenderUpdate()
	-- upvalues: dialog (ref), var3 (write), updatePanelPosition (ref), t (write)
	if dialog.transparency == 1 or var3 then
		updatePanelPosition()
	end
	local var5 = 1 - dialog.transparency
	
	for i, v in pairs(t) do
		local var6 = 1 - v * var5
		
		if i:IsA("TextLabel") or i:IsA("TextButton") then
			i.TextTransparency = var6
		elseif i:IsA("ImageLabel") or i:IsA("ImageButton") then
			i.ImageTransparency = var6
		elseif i:IsA("Frame") then
			i.BackgroundTransparency = var6
		end
	end
end

local t_1 = {}
local var7 = nil
local var8 = nil

local function updatePanel()
	-- upvalues: t_1 (ref), var8 (write), dialog (ref), t (write), var7 (write), var3 (write), updatePanelPosition (ref)
	local var9 = t_1[1]
	
	if var8 and var8.content then
		var8.content.Parent = nil
	end
	if var9 and var9.content then
		var9.content.Parent = dialog:GetGUI()
		var8 = var9
		local absoluteSize = var9.content.AbsoluteSize
		dialog:ResizePixels(absoluteSize.X, absoluteSize.Y, 100)
		var3 = true
		updatePanelPosition()
		dialog:SetVisible(true)
		t = {}
		
		local function search(p1)
			-- upvalues: t (copy), search (ref)
			if p1:IsA("ImageLabel") or p1:IsA("ImageButton") then
				t[p1] = 1 - p1.ImageTransparency
			elseif p1:IsA("TextLabel") or p1:IsA("TextButton") then
				t[p1] = 1 - p1.TextTransparency
			elseif p1:IsA("Frame") then
				t[p1] = 1 - p1.BackgroundTransparency
			end
			for i, v in pairs(p1:GetChildren()) do
				search(v)
			end
		end
		
		search(dialog:GetGUI())
		
		if var7 then
			var7:disconnect()
			var7 = nil
		end
		var7 = dialog:GetGUI().DescendantAdded:connect(function(p2)
			-- upvalues: search (ref)
			search(p2)
		end)
	else
		dialog:SetVisible(false)
		t = {}
		
		if var7 then
			var7:disconnect()
			var7 = nil
			
			return
		end
	end
end

local t_2 = {}
t_2.__index = t_2

function t_2.new(p1)
	-- upvalues: t_2 (ref)
	local tbl = setmetatable({}, t_2)
	tbl.content = p1
	
	return tbl
end

function t_2:SetContent(p1)
	if not p1 and self.content then
		self.content.Parent = nil
	end
	self.content = p1
end

local var10 = false

function t_2.Show(p1, p2)
	-- upvalues: var10 (write), runService (ref), t_1 (ref), updatePanel (ref)
	if not var10 then
		var10 = true
		runService:BindToRenderStep("DialogPanel", Enum.RenderPriority.First.Value, dialogPanelRenderUpdate)
	end
	if p2 then
		table.insert(t_1, 1, p1)
	else
		table.insert(t_1, p1)
	end
	updatePanel()
end

function t_2.Close(p1)
	-- upvalues: t_1 (ref), var10 (write), runService (ref), updatePanel (ref)
	for i, v in pairs(t_1) do
		if v == p1 then
			table.remove(t_1, i)
			break
		end
	end
	if var10 and #t_1 == 0 then
		var10 = false
		runService:UnbindFromRenderStep("DialogPanel")
	end
	updatePanel()
end

return t_2