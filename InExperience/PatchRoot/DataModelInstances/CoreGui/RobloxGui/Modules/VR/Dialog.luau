local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local corePackagesService = game:GetService("CorePackages")
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create
local panel3D = require(corePackagesService.Workspace.Packages.VrCommon).Panel3D
local _ = Color3.new(0.2, 0.2, 0.2)
local _ = Enum.FontSize.Size36
local _ = Color3.new(1, 1, 1)
local var3 = CFrame.new(0, 0, -7) * CFrame.Angles(0, 3.14159265359, 0)
local _ = create("ImageLabel")({
	Name = "EmptySelectionImage",
	Image = "",
	BackgroundTransparency = 1,
	ImageTransparency = 1
})
local dialog = panel3D.Get("Dialog")
dialog:SetType(panel3D.Type.Fixed)
dialog.localCF = var3
dialog:SetCanFade(true)
local var5 = 0
local t = {}
local var7 = false
local var8 = 0

local function _(p0) --[[ line: 46 | named "positionDialogPanel" ]]
	-- upvalues: var5 (write), userInputService (ref), dialog (ref), var3 (ref)
	var5 = p0
	dialog.localCF = CFrame.new(userInputService:GetUserCFrame(Enum.UserCFrame.Head).p) * CFrame.Angles(0, p0, 0) * var3
end

function dialog.CalculateTransparency(_) --[[ line: 53 ]]
	-- upvalues: userInputService (ref), var8 (write), var5 (write), var7 (write)
	local headUserCFrame = userInputService:GetUserCFrame(Enum.UserCFrame.Head)
	local var17 = headUserCFrame.lookVector * Vector3.new(1, 0, 1)
	local vector3 = Vector3.new(math.cos(var8 + var5 + 1.570796326795), 0, -math.sin(var8 + var5 + 1.570796326795))
	
	if math.abs(math.asin(headUserCFrame.lookVector.Y)) > 0.767944870878 then
		var7 = true
	end
	return math.min(math.max(0, (math.acos(var17:Dot(vector3)) - 0.654498469498) / 0.11344640138), 1)
end

local function updatePanelPosition() --[[ line: 69 ]]
	-- upvalues: userInputService (ref), var8 (write), var7 (write), var5 (write), dialog (ref), var3 (ref)
	local var19 = userInputService:GetUserCFrame(Enum.UserCFrame.Head).lookVector * Vector3.new(1, 0, 1)
	local var20 = (math.atan2(-var19.Z, var19.X) - 1.570796326795) % 6.28318530718
	local var21 = var8 + math.floor(var20 / 1.570796326795 + 0.5) * 1.570796326795
	
	if var7 then
		var7 = false
		var8 = var20
	end
	var5 = var21
	dialog.localCF = CFrame.new(userInputService:GetUserCFrame(Enum.UserCFrame.Head).p) * CFrame.Angles(0, var21, 0) * var3
end

function dialogPanelRenderUpdate() --[[ line: 84 ]]
	-- upvalues: dialog (ref), var7 (write), updatePanelPosition (ref), t (write)
	if dialog.transparency == 1 or var7 then
		updatePanelPosition()
	end
	local var22 = 1 - dialog.transparency
	
	for i, v in pairs(t) do
		local var23 = 1 - v * var22
		
		if i:IsA("TextLabel") or i:IsA("TextButton") then
			i.TextTransparency = var23
		elseif i:IsA("ImageLabel") or i:IsA("ImageButton") then
			i.ImageTransparency = var23
		elseif i:IsA("Frame") then
			i.BackgroundTransparency = var23
		end
	end
end

local t_1 = {}
local var11 = nil
local var12 = nil

local function updatePanel() --[[ line: 107 ]]
	-- upvalues: t_1 (ref), var12 (write), dialog (ref), t (write), var11 (write), var7 (write), updatePanelPosition (ref)
	local var24 = t_1[1]
	
	if var12 and var12.content then
		var12.content.Parent = nil
	end
	if var24 and var24.content then
		var24.content.Parent = dialog:GetGUI()
		var12 = var24
		local absoluteSize = var24.content.AbsoluteSize
		dialog:ResizePixels(absoluteSize.X, absoluteSize.Y, 100)
		var7 = true
		updatePanelPosition()
		dialog:SetVisible(true)
		t = {}
		
		local function search(p1) --[[ line: 131 ]]
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
		
		if var11 then
			var11:disconnect()
			var11 = nil
		end
		var11 = dialog:GetGUI().DescendantAdded:connect(function(p2) --[[ line: 148 ]]
			-- upvalues: search (ref)
			search(p2)
		end)
	else
		dialog:SetVisible(false)
		t = {}
		
		if var11 then
			var11:disconnect()
			var11 = nil
			
			return
		end
	end
end

local t_2 = {}
t_2.__index = t_2

function t_2.new(p3) --[[ line: 160 ]]
	-- upvalues: t_2 (ref)
	local tbl = setmetatable({}, t_2)
	tbl.content = p3
	
	return tbl
end

function t_2:SetContent(p4) --[[ line: 166 ]]
	if not p4 and self.content then
		self.content.Parent = nil
	end
	self.content = p4
end

local var15 = false

function t_2.Show(p5, p6) --[[ line: 174 ]]
	-- upvalues: var15 (write), runService (ref), t_1 (ref), updatePanel (ref)
	if not var15 then
		var15 = true
		runService:BindToRenderStep("DialogPanel", Enum.RenderPriority.First.Value, dialogPanelRenderUpdate)
	end
	if p6 then
		table.insert(t_1, 1, p5)
	else
		table.insert(t_1, p5)
	end
	updatePanel()
end

function t_2.Close(p7) --[[ line: 187 ]]
	-- upvalues: t_1 (ref), var15 (write), runService (ref), updatePanel (ref)
	for i, v in pairs(t_1) do
		if v == p7 then
			table.remove(t_1, i)
			break
		end
	end
	if var15 and #t_1 == 0 then
		var15 = false
		runService:UnbindFromRenderStep("DialogPanel")
	end
	updatePanel()
end

return t_2