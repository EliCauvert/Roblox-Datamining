local coreGuiService = game:GetService("CoreGui")
local contextActionService = game:GetService("ContextActionService")
local tweenService = game:GetService("TweenService")
local _ = coreGuiService:WaitForChild("RobloxGui")
local create = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Create
local color3 = Color3.new(0.1, 0, 0)
local color3_1 = Color3.new(0, 0, 0)
local _ = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local _ = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true, 0)
local tweenInfo_1 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local var1 = nil
local t = {}
local t_1 = {}
local t_2 = {}
local t_3 = {}
local t_4 = {}
local t_5 = {}
local t_6 = {}
local t_7 = {}
local var2 = true
local _ = { BoundInputType = 3, TableHeader = 2, BoundAction = 1 }

local function sortInputTypeRows(p1, p2)
	-- upvalues: t_1 (ref)
	return tostring(t_1[p1]) < tostring(t_1[p2])
end

local function sortActionRows(p1, p2)
	-- upvalues: t_3 (ref), t_4 (ref)
	local var3 = t_3[p1]
	local var4 = t_3[p2]
	
	if not var3 or not var4 then
		return true
	end
	local var5 = t_4[p1]
	local var6 = t_4[p2]
	
	if var5 ~= var6 then
		return tostring(var5) < tostring(var6)
	elseif var3.isCore and not var4.isCore then
		return true
	elseif not var3.isCore and var4.isCore then
		return false
	end
	local stackOrder = var3.stackOrder
	local stackOrder_1 = var4.stackOrder
	
	return if stackOrder and stackOrder_1 then stackOrder_1 < stackOrder else true
end

local function createEmptyRow(p1, p2)
	-- upvalues: create (ref)
	local var3 = create("Frame")({
		BackgroundTransparency = 1,
		ZIndex = 6,
		Name = p1,
		Size = UDim2.new(1, 0, 0, p2 or 0)
	})
	local _ = create("UIListLayout")({
		FillDirection = Enum.FillDirection.Horizontal,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 5),
		Parent = var3
	})
	
	return var3
end

local function createButtonRow(p1, p2)
	-- upvalues: create (ref)
	local var3 = create("TextButton")({
		BackgroundTransparency = 1,
		ZIndex = 6,
		Text = "",
		Name = p1,
		Size = UDim2.new(1, 0, 0, p2 or 0)
	})
	local _ = create("UIListLayout")({
		FillDirection = Enum.FillDirection.Horizontal,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 5),
		Parent = var3
	})
	
	return var3
end

local function createEmptyColumn(p1, p2)
	-- upvalues: create (ref)
	return create("Frame")({
		BackgroundTransparency = 0.75,
		BorderSizePixel = 0,
		ZIndex = 6,
		ClipsDescendants = true,
		Name = p2,
		BackgroundColor3 = Color3.new(0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Parent = p1
	})
end

local function createImageColumn(p1, p2, p3, p4, p5)
	-- upvalues: createEmptyColumn (ref), create (ref)
	local var3 = createEmptyColumn(p1, p2)
	local _ = create("UIAspectRatioConstraint")({ AspectRatio = p4 or 1, Parent = var3 })
	local _ = create("ImageLabel")({
		Name = "ColumnImage",
		BackgroundTransparency = 1,
		ZIndex = 6,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(p5 or 1, 0, p5 or 1, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Image = p3,
		Parent = var3
	})
	
	return var3
end

local function createTextColumn(p1, p2, p3)
	-- upvalues: createEmptyColumn (ref), create (ref)
	local var3 = createEmptyColumn(p1, p2)
	local _ = create("TextLabel")({
		Name = "ColumnText",
		BackgroundTransparency = 1,
		ZIndex = 6,
		TextSize = 18,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(1, -10, 1, -10),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Text = p3,
		TextColor3 = Color3.new(1, 1, 1),
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = Enum.Font.SourceSans,
		Parent = var3
	})
	
	return var3
end

local function createActionColumns(p1, p2)
	-- upvalues: createEmptyColumn (ref), createTextColumn (ref)
	local var3 = 0
	local var4 = createEmptyColumn(p1, "Inset")
	var4.LayoutOrder = 0
	var4.BackgroundTransparency = 1
	var4.Size = UDim2.new(0, 30, 1, 0)
	var3 = var3 + 30 + 5
	local var5 = createTextColumn(p1, "Priority", "Priority")
	var5.LayoutOrder = 1
	var5.BackgroundColor3 = p2
	var5.Size = UDim2.new(0, 80, 1, 0)
	var3 = var3 + 80 + 5
	local var6 = createTextColumn(p1, "Security", "Security")
	var6.LayoutOrder = 2
	var6.BackgroundColor3 = p2
	var6.Size = UDim2.new(0, 80, 1, 0)
	var3 = var3 + 80 + 5
	local var7 = createTextColumn(p1, "ActionName", "Action Name")
	var7.LayoutOrder = 3
	var7.BackgroundColor3 = p2
	var7.Size = UDim2.new(0.25, 0, 1, 0)
	local var8 = createTextColumn(p1, "InputTypes", "Input Types")
	var8.LayoutOrder = 4
	var8.BackgroundColor3 = p2
	var8.Size = UDim2.new(0.75, (-var3) - 5, 1, 0)
	
	return var4, var5, var6, var7, var8
end

local function updateContainerCanvas()
	-- upvalues: var2 (write), t (ref), sortInputTypeRows (ref), t_1 (ref), t_6 (ref), t_2 (ref), sortActionRows (ref)
	debug.profilebegin("updateContainerCanvas")
	
	if var2 then
		var2 = false
		local var3 = 1
		local t_3 = {}
		
		for i, v in pairs(t) do
			table.insert(t_3, v)
		end
		table.sort(t_3, sortInputTypeRows)
		
		for i, v_1 in pairs(t_3) do
			local var4 = t_1[v_1]
			v_1.LayoutOrder = var3
			var3 += 1
			local var5 = t_6[var4]
			
			if var5 then
				var5.LayoutOrder = var3
				var3 += 1
			end
			local var6 = t_2[var4]
			
			if var6 then
				local t_4 = {}
				
				for i_2, v_2 in pairs(var6) do
					table.insert(t_4, v_2)
				end
				table.sort(t_4, sortActionRows)
				
				for i_2, v_2 in pairs(t_4) do
					v_2.LayoutOrder = var3
					var3 += 1
				end
			end
		end
	end
	debug.profileend()
end

local function scrollContainerToRow(p1)
	-- upvalues: var1 (write), tweenService (ref), tweenInfo_1 (ref)
	tweenService:Create(var1, tweenInfo_1, {
		CanvasPosition = var1.CanvasPosition + Vector2.new(0, p1.AbsolutePosition.Y - var1.AbsolutePosition.Y)
	}):Play()
end

local t_8 = {}

function t_8.initializeGui(p1)
	-- upvalues: create (ref), var1 (write), t_8 (ref), contextActionService (ref), var2 (write), updateContainerCanvas (ref)
	local var7 = create("ScrollingFrame")({
		BorderSizePixel = 0,
		ScrollBarThickness = 4,
		BackgroundTransparency = 1,
		ZIndex = 6,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(1, -10, 1, -10),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Parent = p1
	})
	var1 = var7
	local var8 = create("UIListLayout")({ Padding = UDim.new(0, 5), Parent = var7 })
	var8.SortOrder = Enum.SortOrder.LayoutOrder
	var8:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		-- upvalues: var1 (copy), var8 (ref)
		var1.CanvasSize = UDim2.new(0, 0, 0, var8.AbsoluteContentSize.Y)
	end)
	t_8.updateGuis()
	contextActionService.BoundActionAdded:connect(function(p2, _, p3, p4)
		-- upvalues: t_8 (copy), var2 (copy), updateContainerCanvas (copy)
		p3.isCore = p4
		t_8.updateActionRows(p2, p3)
		var2 = true
		updateContainerCanvas()
	end)
	contextActionService.BoundActionRemoved:connect(function(p2, p3, p4)
		-- upvalues: t_8 (copy), var2 (copy), updateContainerCanvas (copy)
		p3.isCore = p4
		t_8.removeActionRows(p2, p3)
		var2 = true
		updateContainerCanvas()
	end)
end

function t_8.updateBoundInputTypeRow(p1)
	-- upvalues: t (ref), createButtonRow (ref), createImageColumn (ref), createTextColumn (ref), createEmptyRow (ref), createActionColumns (ref), color3_1 (ref), t_1 (ref), t_5 (ref), t_6 (ref), var1 (write), tweenService (ref), tweenInfo (ref), t_7 (ref), t_2 (ref), updateContainerCanvas (ref), scrollContainerToRow (ref)
	if not t[p1] then
		local var7 = createButtonRow("BoundInputType", 30)
		local var8 = createImageColumn(var7, "ExpandImage", "rbxasset://textures/ui/ExpandArrowSheet.png", 1, 0.35)
		var8.ColumnImage.ImageRectSize = Vector2.new(21, 21)
		var8.ColumnImage.ImageRectOffset = Vector2.new(0, 0)
		local var9 = createTextColumn(var7, "InputType", tostring(p1))
		var9.Size = UDim2.new(1, -35, 1, 0)
		var9.ColumnText.Font = Enum.Font.SourceSansBold
		local var10 = createEmptyRow("TableHeader", 20)
		var10.Visible = false
		local _, var11, var12, var13, var14 = createActionColumns(var10, color3_1)
		var11.ColumnText.Font = Enum.Font.SourceSansBold
		var12.ColumnText.Font = Enum.Font.SourceSansBold
		var13.ColumnText.Font = Enum.Font.SourceSansBold
		var14.ColumnText.Font = Enum.Font.SourceSansBold
		t[p1] = var7
		t_1[var7] = p1
		t_5[var10] = p1
		t_6[p1] = var10
		var10.Parent = var1
		var7.Parent = var1
		tweenService:Create(var9, tweenInfo, { BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) }):Play()
		t_7[p1] = false
		var7.MouseButton1Click:connect(function()
			-- upvalues: t_7 (copy), p1 (ref), t_2 (copy), var8 (ref), var10 (ref), updateContainerCanvas (copy), tweenService (copy), var9 (ref), tweenInfo (copy), scrollContainerToRow (copy), var7 (ref)
			t_7[p1] = not t_7[p1]
			local var15 = t_2[p1]
			
			if t_7[p1] then
				var8.ColumnImage.ImageRectOffset = Vector2.new(21, 0)
				var10.Visible = true
				
				if var15 then
					for i, v in pairs(var15) do
						v.Visible = true
					end
				end
			else
				var8.ColumnImage.ImageRectOffset = Vector2.new(0, 0)
				var10.Visible = false
				
				if var15 then
					for i, v in pairs(var15) do
						v.Visible = false
					end
				end
			end
			updateContainerCanvas()
			
			if t_7[p1] then
				tweenService:Create(var9, tweenInfo, { BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) }):Play()
				scrollContainerToRow(var7)
			end
		end)
	end
end

function t_8.updateActionRowForInputType(p2, p3, p4)
	-- upvalues: t_2 (ref), createEmptyRow (ref), t_7 (ref), createActionColumns (ref), color3 (ref), color3_1 (ref), t_4 (ref), t_3 (ref), var1 (write), tweenService (ref), tweenInfo (ref), t (ref)
	local var15 = t_2[p4]
	
	if not var15 then
		var15 = {}
		t_2[p4] = var15
	end
	if not var15[p2] then
		local var16 = createEmptyRow("BoundAction", 20)
		var16.Visible = t_7[p4]
		local t_1 = {}
		
		for i, v in pairs(p3.inputTypes) do
			t_1[i] = tostring(v)
		end
		local _, var17, var18, var19, var20 = createActionColumns(var16, if p3.isCore then color3 else color3_1)
		var17.ColumnText.Text = p3.priorityLevel or "Default"
		var18.ColumnText.Text = if p3.isCore then "Core" else "Developer"
		var19.ColumnText.Text = p2
		var20.ColumnText.Text = table.concat(t_1, ", ")
		
		if p3.isCore then
			var17.ColumnText.Font = Enum.Font.SourceSansItalic
			var18.ColumnText.Font = Enum.Font.SourceSansItalic
			var19.ColumnText.Font = Enum.Font.SourceSansItalic
			var20.ColumnText.Font = Enum.Font.SourceSansItalic
		end
		var15[p2] = var16
		t_4[var16] = p4
		t_3[var16] = p3
		var16.Parent = var1
		
		if var16.Visible then
			tweenService:Create(var19, tweenInfo, { BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) }):Play()
		else
			local var21 = t[p4]
			
			if var21 then
				tweenService:Create(var21.InputType, tweenInfo, { BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) }):Play()
			end
		end
		local _ = var16
	end
end

function t_8.updateActionRows(p5, p6)
	-- upvalues: t_8 (ref)
	for i, v in pairs(p6.inputTypes) do
		t_8.updateBoundInputTypeRow(v)
		t_8.updateActionRowForInputType(p5, p6, v)
	end
end

function t_8.removeActionRows(p7, p8)
	-- upvalues: t_2 (ref), t (ref), t_6 (ref), updateContainerCanvas (ref), var1 (write)
	local var22
	for i, v in pairs(p8.inputTypes) do
		local var23 = t_2[v]
		
		if var23 then
			var23[p7]:Destroy()
			var23[p7] = nil
			var22 = true
			
			for i_1, v_1 in pairs(var23) do
				var22 = false
				break
			end
			if var22 then
				local var24 = t[v]
				
				if var24 then
					var24:Destroy()
					t[v] = nil
				end
				local var25 = t_6[v]
				
				if var25 then
					t_6[var25] = nil
					var25:Destroy()
					t_6[v] = nil
				end
			end
		end
	end
	updateContainerCanvas()
	var1.UIListLayout:ApplyLayout()
end

function t_8.updateGuis()
	-- upvalues: contextActionService (ref), t_8 (ref), var2 (write), updateContainerCanvas (ref)
	for i, v in pairs(contextActionService:GetAllBoundCoreActionInfo()) do
		v.isCore = true
		t_8.updateActionRows(i, v)
	end
	for i_1, v_1 in pairs(contextActionService:GetAllBoundActionInfo()) do
		v_1.isCore = false
		t_8.updateActionRows(i_1, v_1)
	end
	var2 = true
	updateContainerCanvas()
end

return t_8