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
local var7 = nil
local t = {}
local t_1 = {}
local t_2 = {}
local t_3 = {}
local t_4 = {}
local t_5 = {}
local t_6 = {}
local t_7 = {}
local var16 = true
local _ = { BoundInputType = 3, TableHeader = 2, BoundAction = 1 }

local function sortInputTypeRows(p0, p1) --[[ line: 43 ]]
	-- upvalues: t_1 (ref)
	return tostring(t_1[p0]) < tostring(t_1[p1])
end

local function sortActionRows(p2, p3) --[[ line: 49 ]]
	-- upvalues: t_3 (ref), t_4 (ref)
	local var28 = t_3[p2]
	local var29 = t_3[p3]
	
	if not var28 or not var29 then
		return true
	end
	local var30 = t_4[p2]
	local var31 = t_4[p3]
	
	if var30 ~= var31 then
		return tostring(var30) < tostring(var31)
	elseif var28.isCore and not var29.isCore then
		return true
	elseif not var28.isCore and var29.isCore then
		return false
	end
	local stackOrder = var28.stackOrder
	local stackOrder_1 = var29.stackOrder
	
	return if stackOrder and stackOrder_1 then stackOrder_1 < stackOrder else true
end

local function createEmptyRow(p4, p5) --[[ line: 75 ]]
	-- upvalues: create (ref)
	local var32 = create("Frame")({
		BackgroundTransparency = 1,
		ZIndex = 6,
		Name = p4,
		Size = UDim2.new(1, 0, 0, p5 or 0)
	})
	local _ = create("UIListLayout")({
		FillDirection = Enum.FillDirection.Horizontal,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 5),
		Parent = var32
	})
	
	return var32
end

local function createButtonRow(p6, p7) --[[ line: 91 ]]
	-- upvalues: create (ref)
	local var33 = create("TextButton")({
		BackgroundTransparency = 1,
		ZIndex = 6,
		Text = "",
		Name = p6,
		Size = UDim2.new(1, 0, 0, p7 or 0)
	})
	local _ = create("UIListLayout")({
		FillDirection = Enum.FillDirection.Horizontal,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 5),
		Parent = var33
	})
	
	return var33
end

local function createEmptyColumn(p8, p9) --[[ line: 108 ]]
	-- upvalues: create (ref)
	return create("Frame")({
		BackgroundTransparency = 0.75,
		BorderSizePixel = 0,
		ZIndex = 6,
		ClipsDescendants = true,
		Name = p9,
		BackgroundColor3 = Color3.new(0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Parent = p8
	})
end

local function createImageColumn(p10, p11, p12, p13, p14) --[[ line: 123 ]]
	-- upvalues: createEmptyColumn (ref), create (ref)
	local var34 = createEmptyColumn(p10, p11)
	local _ = create("UIAspectRatioConstraint")({ AspectRatio = p13 or 1, Parent = var34 })
	local _ = create("ImageLabel")({
		Name = "ColumnImage",
		BackgroundTransparency = 1,
		ZIndex = 6,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(p14 or 1, 0, p14 or 1, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Image = p12,
		Parent = var34
	})
	
	return var34
end

local function createTextColumn(p15, p16, p17) --[[ line: 145 ]]
	-- upvalues: createEmptyColumn (ref), create (ref)
	local var35 = createEmptyColumn(p15, p16)
	local _ = create("TextLabel")({
		Name = "ColumnText",
		BackgroundTransparency = 1,
		ZIndex = 6,
		TextSize = 18,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(1, -10, 1, -10),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Text = p17,
		TextColor3 = Color3.new(1, 1, 1),
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = Enum.Font.SourceSans,
		Parent = var35
	})
	
	return var35
end

local function createActionColumns(p18, p19) --[[ line: 166 ]]
	-- upvalues: createEmptyColumn (ref), createTextColumn (ref)
	local var36 = 0
	local var37 = createEmptyColumn(p18, "Inset")
	var37.LayoutOrder = 0
	var37.BackgroundTransparency = 1
	var37.Size = UDim2.new(0, 30, 1, 0)
	var36 = var36 + 30 + 5
	local var38 = createTextColumn(p18, "Priority", "Priority")
	var38.LayoutOrder = 1
	var38.BackgroundColor3 = p19
	var38.Size = UDim2.new(0, 80, 1, 0)
	var36 = var36 + 80 + 5
	local var39 = createTextColumn(p18, "Security", "Security")
	var39.LayoutOrder = 2
	var39.BackgroundColor3 = p19
	var39.Size = UDim2.new(0, 80, 1, 0)
	var36 = var36 + 80 + 5
	local var40 = createTextColumn(p18, "ActionName", "Action Name")
	var40.LayoutOrder = 3
	var40.BackgroundColor3 = p19
	var40.Size = UDim2.new(0.25, 0, 1, 0)
	local var41 = createTextColumn(p18, "InputTypes", "Input Types")
	var41.LayoutOrder = 4
	var41.BackgroundColor3 = p19
	var41.Size = UDim2.new(0.75, (-var36) - 5, 1, 0)
	
	return var37, var38, var39, var40, var41
end

local function updateContainerCanvas() --[[ line: 203 ]]
	-- upvalues: var16 (write), t (ref), sortInputTypeRows (ref), t_1 (ref), t_6 (ref), t_2 (ref), sortActionRows (ref)
	debug.profilebegin("updateContainerCanvas")
	
	if var16 then
		var16 = false
		local var42 = 1
		local t_3 = {}
		
		for i, v in pairs(t) do
			table.insert(t_3, v)
		end
		table.sort(t_3, sortInputTypeRows)
		
		for i, v_1 in pairs(t_3) do
			local var44 = t_1[v_1]
			v_1.LayoutOrder = var42
			var42 += 1
			local var45 = t_6[var44]
			
			if var45 then
				var45.LayoutOrder = var42
				var42 += 1
			end
			local var46 = t_2[var44]
			
			if var46 then
				local t_4 = {}
				
				for i_2, v_2 in pairs(var46) do
					table.insert(t_4, v_2)
				end
				table.sort(t_4, sortActionRows)
				
				for i_2, v_2 in pairs(t_4) do
					v_2.LayoutOrder = var42
					var42 += 1
				end
			end
		end
	end
	debug.profileend()
end

local function scrollContainerToRow(p20) --[[ line: 245 ]]
	-- upvalues: var7 (write), tweenService (ref), tweenInfo_1 (ref)
	tweenService:Create(var7, tweenInfo_1, {
		CanvasPosition = var7.CanvasPosition + Vector2.new(0, p20.AbsolutePosition.Y - var7.AbsolutePosition.Y)
	}):Play()
end

local t_8 = {}

function t_8.initializeGui(p21) --[[ line: 253 ]]
	-- upvalues: create (ref), var7 (write), t_8 (ref), contextActionService (ref), var16 (write), updateContainerCanvas (ref)
	local var48 = create("ScrollingFrame")({
		BorderSizePixel = 0,
		ScrollBarThickness = 4,
		BackgroundTransparency = 1,
		ZIndex = 6,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(1, -10, 1, -10),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Parent = p21
	})
	var7 = var48
	local var49 = create("UIListLayout")({ Padding = UDim.new(0, 5), Parent = var48 })
	var49.SortOrder = Enum.SortOrder.LayoutOrder
	var49:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() --[[ line: 271 ]]
		-- upvalues: var7 (copy), var49 (ref)
		var7.CanvasSize = UDim2.new(0, 0, 0, var49.AbsoluteContentSize.Y)
	end)
	t_8.updateGuis()
	contextActionService.BoundActionAdded:connect(function(p22, _, p23, p24) --[[ line: 275 ]]
		-- upvalues: t_8 (copy), var16 (copy), updateContainerCanvas (copy)
		p23.isCore = p24
		t_8.updateActionRows(p22, p23)
		var16 = true
		updateContainerCanvas()
	end)
	contextActionService.BoundActionRemoved:connect(function(p25, p26, p27) --[[ line: 282 ]]
		-- upvalues: t_8 (copy), var16 (copy), updateContainerCanvas (copy)
		p26.isCore = p27
		t_8.removeActionRows(p25, p26)
		var16 = true
		updateContainerCanvas()
	end)
end

function t_8.updateBoundInputTypeRow(p28) --[[ line: 291 ]]
	-- upvalues: t (ref), createButtonRow (ref), createImageColumn (ref), createTextColumn (ref), createEmptyRow (ref), createActionColumns (ref), color3_1 (ref), t_1 (ref), t_5 (ref), t_6 (ref), var7 (write), tweenService (ref), tweenInfo (ref), t_7 (ref), t_2 (ref), updateContainerCanvas (ref), scrollContainerToRow (ref)
	if not t[p28] then
		local var50 = createButtonRow("BoundInputType", 30)
		local var51 = createImageColumn(var50, "ExpandImage", "rbxasset://textures/ui/ExpandArrowSheet.png", 1, 0.35)
		var51.ColumnImage.ImageRectSize = Vector2.new(21, 21)
		var51.ColumnImage.ImageRectOffset = Vector2.new(0, 0)
		local var52 = createTextColumn(var50, "InputType", tostring(p28))
		var52.Size = UDim2.new(1, -35, 1, 0)
		var52.ColumnText.Font = Enum.Font.SourceSansBold
		local var53 = createEmptyRow("TableHeader", 20)
		var53.Visible = false
		local _, var54, var55, var56, var57 = createActionColumns(var53, color3_1)
		var54.ColumnText.Font = Enum.Font.SourceSansBold
		var55.ColumnText.Font = Enum.Font.SourceSansBold
		var56.ColumnText.Font = Enum.Font.SourceSansBold
		var57.ColumnText.Font = Enum.Font.SourceSansBold
		t[p28] = var50
		t_1[var50] = p28
		t_5[var53] = p28
		t_6[p28] = var53
		var53.Parent = var7
		var50.Parent = var7
		tweenService:Create(var52, tweenInfo, { BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) }):Play()
		t_7[p28] = false
		var50.MouseButton1Click:connect(function() --[[ line: 323 ]]
			-- upvalues: t_7 (copy), p28 (ref), t_2 (copy), var51 (ref), var53 (ref), updateContainerCanvas (copy), tweenService (copy), var52 (ref), tweenInfo (copy), scrollContainerToRow (copy), var50 (ref)
			t_7[p28] = not t_7[p28]
			local var58 = t_2[p28]
			
			if t_7[p28] then
				var51.ColumnImage.ImageRectOffset = Vector2.new(21, 0)
				var53.Visible = true
				
				if var58 then
					for i, v in pairs(var58) do
						v.Visible = true
					end
				end
			else
				var51.ColumnImage.ImageRectOffset = Vector2.new(0, 0)
				var53.Visible = false
				
				if var58 then
					for i, v in pairs(var58) do
						v.Visible = false
					end
				end
			end
			updateContainerCanvas()
			
			if t_7[p28] then
				tweenService:Create(var52, tweenInfo, { BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) }):Play()
				scrollContainerToRow(var50)
			end
		end)
	end
end

function t_8.updateActionRowForInputType(p29, p30, p31) --[[ line: 354 ]]
	-- upvalues: t_2 (ref), createEmptyRow (ref), t_7 (ref), createActionColumns (ref), color3 (ref), color3_1 (ref), t_4 (ref), t_3 (ref), var7 (write), tweenService (ref), tweenInfo (ref), t (ref)
	local var59 = t_2[p31]
	
	if not var59 then
		var59 = {}
		t_2[p31] = var59
	end
	if not var59[p29] then
		local var60 = createEmptyRow("BoundAction", 20)
		var60.Visible = t_7[p31]
		local t_1 = {}
		
		for i, v in pairs(p30.inputTypes) do
			t_1[i] = tostring(v)
		end
		local _, var62, var63, var64, var65 = createActionColumns(var60, if p30.isCore then color3 else color3_1)
		var62.ColumnText.Text = p30.priorityLevel or "Default"
		var63.ColumnText.Text = if p30.isCore then "Core" else "Developer"
		var64.ColumnText.Text = p29
		var65.ColumnText.Text = table.concat(t_1, ", ")
		
		if p30.isCore then
			var62.ColumnText.Font = Enum.Font.SourceSansItalic
			var63.ColumnText.Font = Enum.Font.SourceSansItalic
			var64.ColumnText.Font = Enum.Font.SourceSansItalic
			var65.ColumnText.Font = Enum.Font.SourceSansItalic
		end
		var59[p29] = var60
		t_4[var60] = p31
		t_3[var60] = p30
		var60.Parent = var7
		
		if var60.Visible then
			tweenService:Create(var64, tweenInfo, { BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) }):Play()
		else
			local var66 = t[p31]
			
			if var66 then
				tweenService:Create(var66.InputType, tweenInfo, { BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) }):Play()
			end
		end
		local _ = var60
	end
end

function t_8.updateActionRows(p32, p33) --[[ line: 402 ]]
	-- upvalues: t_8 (ref)
	for i, v in pairs(p33.inputTypes) do
		t_8.updateBoundInputTypeRow(v)
		t_8.updateActionRowForInputType(p32, p33, v)
	end
end

function t_8.removeActionRows(p34, p35) --[[ line: 409 ]]
	-- upvalues: t_2 (ref), t (ref), t_6 (ref), updateContainerCanvas (ref), var7 (write)
	local var68
	for i, v in pairs(p35.inputTypes) do
		local var67 = t_2[v]
		
		if var67 then
			var67[p34]:Destroy()
			var67[p34] = nil
			var68 = true
			
			for i_1, v_1 in pairs(var67) do
				var68 = false
				break
			end
			if var68 then
				local var69 = t[v]
				
				if var69 then
					var69:Destroy()
					t[v] = nil
				end
				local var70 = t_6[v]
				
				if var70 then
					t_6[var70] = nil
					var70:Destroy()
					t_6[v] = nil
				end
			end
		end
	end
	updateContainerCanvas()
	var7.UIListLayout:ApplyLayout()
end

function t_8.updateGuis() --[[ line: 446 ]]
	-- upvalues: contextActionService (ref), t_8 (ref), var16 (write), updateContainerCanvas (ref)
	for i, v in pairs(contextActionService:GetAllBoundCoreActionInfo()) do
		v.isCore = true
		t_8.updateActionRows(i, v)
	end
	for i_1, v_1 in pairs(contextActionService:GetAllBoundActionInfo()) do
		v_1.isCore = false
		t_8.updateActionRows(i_1, v_1)
	end
	var16 = true
	updateContainerCanvas()
end

return t_8