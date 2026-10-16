local ContextActionService = game:GetService("ContextActionService")
local TweenService = game:GetService("TweenService")
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local CreateFunction = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Create
local _Color3 = Color3.new(0.1, 0, 0)
local _Color3_1 = Color3.new(0, 0, 0)
local _ = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local _ = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local _TweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true, 0)
local _TweenInfo1 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local Parent = nil
local BoundInputTypes = {}
local Keys = {}
local t = {}
local t1 = {}
local Keys1 = {}
local Keys2 = {}
local TableHeaders = {}
local t2 = {}
local Flag = true

local function sortInputTypeRows(A, B): boolean --[[ Line: 43 ]]
	-- upvalues: Keys (copy)
	return tostring(Keys[A]) < tostring(Keys[B])
end

local function sortActionRows(A, B): boolean --[[ Line: 49 ]]
	-- upvalues: t1 (copy), Keys1 (copy)
	local Entry = t1[A]
	local Entry1 = t1[B]
	
	if not Entry or not Entry1 then
		return true
	end
	local Key = Keys1[A]
	local Key1 = Keys1[B]
	
	if Key ~= Key1 then
		return tostring(Key) < tostring(Key1)
	elseif Entry.isCore and not Entry1.isCore then
		return true
	elseif Entry.isCore or not Entry1.isCore then
		local StackOrder = Entry.stackOrder
		local StackOrder1 = Entry1.stackOrder
		
		return not StackOrder or not StackOrder1 or StackOrder1 < StackOrder
	else
		return false
	end
end

local function createEmptyRow(Name, p1) --[[ Line: 75 ]]
	-- upvalues: CreateFunction (copy)
	local Parent = CreateFunction("Frame")({
		BackgroundTransparency = 1,
		ZIndex = 6,
		Name = Name,
		Size = UDim2.new(1, 0, 0, p1 or 0)
	})
	local _ = CreateFunction("UIListLayout")({
		FillDirection = Enum.FillDirection.Horizontal,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 5),
		Parent = Parent
	})
	
	return Parent
end

local function createButtonRow(Name, p1) --[[ Line: 91 ]]
	-- upvalues: CreateFunction (copy)
	local Parent = CreateFunction("TextButton")({
		BackgroundTransparency = 1,
		ZIndex = 6,
		Text = "",
		Name = Name,
		Size = UDim2.new(1, 0, 0, p1 or 0)
	})
	local _ = CreateFunction("UIListLayout")({
		FillDirection = Enum.FillDirection.Horizontal,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 5),
		Parent = Parent
	})
	
	return Parent
end

local function createEmptyColumn(Parent, Name) --[[ Line: 108 ]]
	-- upvalues: CreateFunction (copy)
	return (CreateFunction("Frame")({
		BackgroundTransparency = 0.75,
		BorderSizePixel = 0,
		ZIndex = 6,
		ClipsDescendants = true,
		Name = Name,
		BackgroundColor3 = Color3.new(0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Parent = Parent
	}))
end

local function createImageColumn(BoundInputType, Name, Image, p1, p2) --[[ Line: 123 ]]
	-- upvalues: createEmptyColumn (copy), CreateFunction (copy)
	local EmptyColumn = createEmptyColumn(BoundInputType, Name)
	local _ = CreateFunction("UIAspectRatioConstraint")({ AspectRatio = p1 or 1, Parent = EmptyColumn })
	local _ = CreateFunction("ImageLabel")({
		Name = "ColumnImage",
		BackgroundTransparency = 1,
		ZIndex = 6,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(p2 or 1, 0, p2 or 1, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Image = Image,
		Parent = EmptyColumn
	})
	
	return EmptyColumn
end

local function createTextColumn(Parent, Name, Text) --[[ Line: 145 ]]
	-- upvalues: createEmptyColumn (copy), CreateFunction (copy)
	local EmptyColumn = createEmptyColumn(Parent, Name)
	local _ = CreateFunction("TextLabel")({
		Name = "ColumnText",
		BackgroundTransparency = 1,
		ZIndex = 6,
		TextSize = 18,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(1, -10, 1, -10),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Text = Text,
		TextColor3 = Color3.new(1, 1, 1),
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = Enum.Font.SourceSans,
		Parent = EmptyColumn
	})
	
	return EmptyColumn
end

local function createActionColumns(BoundAction, BackgroundColor3) --[[ Line: 166 ]]
	-- upvalues: createEmptyColumn (copy), createTextColumn (copy)
	local Inset = createEmptyColumn(BoundAction, "Inset")
	Inset.LayoutOrder = 0
	Inset.BackgroundTransparency = 1
	Inset.Size = UDim2.new(0, 30, 1, 0)
	local v1 = 0 + 30 + 5
	local Priority = createTextColumn(BoundAction, "Priority", "Priority")
	Priority.LayoutOrder = 1
	Priority.BackgroundColor3 = BackgroundColor3
	Priority.Size = UDim2.new(0, 80, 1, 0)
	local v2 = v1 + 80 + 5
	local Security = createTextColumn(BoundAction, "Security", "Security")
	Security.LayoutOrder = 2
	Security.BackgroundColor3 = BackgroundColor3
	Security.Size = UDim2.new(0, 80, 1, 0)
	local v3 = v2 + 80 + 5
	local ActionName = createTextColumn(BoundAction, "ActionName", "Action Name")
	ActionName.LayoutOrder = 3
	ActionName.BackgroundColor3 = BackgroundColor3
	ActionName.Size = UDim2.new(0.25, 0, 1, 0)
	local InputTypes = createTextColumn(BoundAction, "InputTypes", "Input Types")
	InputTypes.LayoutOrder = 4
	InputTypes.BackgroundColor3 = BackgroundColor3
	InputTypes.Size = UDim2.new(0.75, -v3 - 5, 1, 0)
	
	return Inset, Priority, Security, ActionName, InputTypes
end

local function updateContainerCanvas() --[[ Line: 203 ]]
	-- upvalues: Flag (ref), BoundInputTypes (copy), sortInputTypeRows (copy), Keys (copy), TableHeaders (copy), t (copy), sortActionRows (copy)
	debug.profilebegin("updateContainerCanvas")
	
	if Flag then
		Flag = false
		local LayoutOrder = 1
		local List = {}
		
		for _, boundInputType in pairs(BoundInputTypes) do
			table.insert(List, boundInputType)
		end
		table.sort(List, sortInputTypeRows)
		
		for _, value in pairs(List) do
			local Key = Keys[value]
			value.LayoutOrder = LayoutOrder
			LayoutOrder += 1
			local TableHeader = TableHeaders[Key]
			
			if TableHeader then
				TableHeader.LayoutOrder = LayoutOrder
				LayoutOrder += 1
			end
			local Entry = t[Key]
			
			if Entry then
				local List1 = {}
				
				for _, value1 in pairs(Entry) do
					table.insert(List1, value1)
				end
				table.sort(List1, sortActionRows)
				
				for _, value2 in pairs(List1) do
					value2.LayoutOrder = LayoutOrder
					LayoutOrder += 1
				end
			end
		end
	end
	debug.profileend()
end

local function scrollContainerToRow(Frame) --[[ Line: 245 ]]
	-- upvalues: Parent (ref), TweenService (copy), _TweenInfo1 (copy)
	TweenService:Create(Parent, _TweenInfo1, {
		CanvasPosition = Parent.CanvasPosition + Vector2.new(0, Frame.AbsolutePosition.Y - Parent.AbsolutePosition.Y)
	}):Play()
end

local ActionBindingsTabModule = {}

function ActionBindingsTabModule.initializeGui(Parent1) --[[ Line: 253 ]]
	-- upvalues: CreateFunction (copy), Parent (ref), ActionBindingsTabModule (copy), ContextActionService (copy), Flag (ref), updateContainerCanvas (copy)
	local Parent2 = CreateFunction("ScrollingFrame")({
		BorderSizePixel = 0,
		ScrollBarThickness = 4,
		BackgroundTransparency = 1,
		ZIndex = 6,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(1, -10, 1, -10),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Parent = Parent1
	})
	Parent = Parent2
	local Object = CreateFunction("UIListLayout")({ Padding = UDim.new(0, 5), Parent = Parent2 })
	Object.SortOrder = Enum.SortOrder.LayoutOrder
	Object:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() --[[ Line: 271 ]]
		-- upvalues: Parent (upval), Object (copy)
		Parent.CanvasSize = UDim2.new(0, 0, 0, Object.AbsoluteContentSize.Y)
	end)
	ActionBindingsTabModule.updateGuis()
	ContextActionService.BoundActionAdded:connect(function(ActionAdded, _, FunctionInfoTable, IsCore) --[[ Line: 275 ]]
		-- upvalues: ActionBindingsTabModule (upval), Flag (upval), updateContainerCanvas (upval)
		FunctionInfoTable.isCore = IsCore
		ActionBindingsTabModule.updateActionRows(ActionAdded, FunctionInfoTable)
		Flag = true
		updateContainerCanvas()
	end)
	ContextActionService.BoundActionRemoved:connect(function(ActionRemoved, FunctionInfoTable, IsCore) --[[ Line: 282 ]]
		-- upvalues: ActionBindingsTabModule (upval), Flag (upval), updateContainerCanvas (upval)
		FunctionInfoTable.isCore = IsCore
		ActionBindingsTabModule.removeActionRows(ActionRemoved, FunctionInfoTable)
		Flag = true
		updateContainerCanvas()
	end)
end

function ActionBindingsTabModule.updateBoundInputTypeRow(Key) --[[ Line: 291 ]]
	-- upvalues: BoundInputTypes (copy), createButtonRow (copy), createImageColumn (copy), createTextColumn (copy), createEmptyRow (copy), createActionColumns (copy), _Color3_1 (copy), Keys (copy), Keys2 (copy), TableHeaders (copy), Parent (ref), TweenService (copy), _TweenInfo (copy), t2 (copy), t (copy), updateContainerCanvas (copy), scrollContainerToRow (copy)
	if not BoundInputTypes[Key] then
		local BoundInputType = createButtonRow("BoundInputType", 30)
		local ExpandImage = createImageColumn(BoundInputType, "ExpandImage", "rbxasset://textures/ui/ExpandArrowSheet.png", 1, 0.35)
		ExpandImage.ColumnImage.ImageRectSize = Vector2.new(21, 21)
		ExpandImage.ColumnImage.ImageRectOffset = Vector2.new(0, 0)
		local InputType = createTextColumn(BoundInputType, "InputType", (tostring(Key)))
		InputType.Size = UDim2.new(1, -35, 1, 0)
		InputType.ColumnText.Font = Enum.Font.SourceSansBold
		local TableHeader = createEmptyRow("TableHeader", 20)
		TableHeader.Visible = false
		local _, ActionColumns2, ActionColumns3, ActionColumns4, ActionColumns5 = createActionColumns(TableHeader, _Color3_1)
		ActionColumns2.ColumnText.Font = Enum.Font.SourceSansBold
		ActionColumns3.ColumnText.Font = Enum.Font.SourceSansBold
		ActionColumns4.ColumnText.Font = Enum.Font.SourceSansBold
		ActionColumns5.ColumnText.Font = Enum.Font.SourceSansBold
		BoundInputTypes[Key] = BoundInputType
		Keys[BoundInputType] = Key
		Keys2[TableHeader] = Key
		TableHeaders[Key] = TableHeader
		TableHeader.Parent = Parent
		BoundInputType.Parent = Parent
		TweenService:Create(InputType, _TweenInfo, { BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) }):Play()
		t2[Key] = false
		BoundInputType.MouseButton1Click:connect(function() --[[ Line: 323 ]]
			-- upvalues: t2 (upval), Key (copy), t (upval), ExpandImage (copy), TableHeader (copy), updateContainerCanvas (upval), TweenService (upval), InputType (copy), _TweenInfo (upval), scrollContainerToRow (upval), BoundInputType (copy)
			t2[Key] = not t2[Key]
			local Entry = t[Key]
			
			if t2[Key] then
				ExpandImage.ColumnImage.ImageRectOffset = Vector2.new(21, 0)
				TableHeader.Visible = true
				
				if Entry then
					for _, value1 in pairs(Entry) do
						value1.Visible = true
					end
				end
			else
				ExpandImage.ColumnImage.ImageRectOffset = Vector2.new(0, 0)
				TableHeader.Visible = false
				
				if Entry then
					for _, value in pairs(Entry) do
						value.Visible = false
					end
				end
			end
			updateContainerCanvas()
			
			if t2[Key] then
				TweenService:Create(InputType, _TweenInfo, { BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) }):Play()
				scrollContainerToRow(BoundInputType)
			end
		end)
	end
end

function ActionBindingsTabModule.updateActionRowForInputType(Text, p1, Key) --[[ Line: 354 ]]
	-- upvalues: t (copy), createEmptyRow (copy), t2 (copy), createActionColumns (copy), _Color3 (copy), _Color3_1 (copy), Keys1 (copy), t1 (copy), Parent (ref), TweenService (copy), _TweenInfo (copy), BoundInputTypes (copy)
	local Entry = t[Key]
	
	if not Entry then
		Entry = {}
		t[Key] = Entry
	end
	if not Entry[Text] then
		local BoundAction = createEmptyRow("BoundAction", 20)
		BoundAction.Visible = t2[Key]
		local List = {}
		
		for i, inputType in pairs(p1.inputTypes) do
			List[i] = tostring(inputType)
		end
		local _, ActionColumns2, ActionColumns3, ActionColumns4, ActionColumns5 = createActionColumns(BoundAction, p1.isCore and _Color3 or _Color3_1)
		ActionColumns2.ColumnText.Text = p1.priorityLevel or "Default"
		ActionColumns3.ColumnText.Text = if p1.isCore then "Core" else "Developer"
		ActionColumns4.ColumnText.Text = Text
		ActionColumns5.ColumnText.Text = table.concat(List, ", ")
		
		if p1.isCore then
			ActionColumns2.ColumnText.Font = Enum.Font.SourceSansItalic
			ActionColumns3.ColumnText.Font = Enum.Font.SourceSansItalic
			ActionColumns4.ColumnText.Font = Enum.Font.SourceSansItalic
			ActionColumns5.ColumnText.Font = Enum.Font.SourceSansItalic
		end
		Entry[Text] = BoundAction
		Keys1[BoundAction] = Key
		t1[BoundAction] = p1
		BoundAction.Parent = Parent
		
		if BoundAction.Visible then
			TweenService:Create(ActionColumns4, _TweenInfo, { BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) }):Play()
		else
			local BoundInputType = BoundInputTypes[Key]
			
			if BoundInputType then
				TweenService:Create(BoundInputType.InputType, _TweenInfo, { BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) }):Play()
			end
		end
	end
end

function ActionBindingsTabModule.updateActionRows(p2, p3) --[[ Line: 402 ]]
	-- upvalues: ActionBindingsTabModule (copy)
	for _, inputType in pairs(p3.inputTypes) do
		ActionBindingsTabModule.updateBoundInputTypeRow(inputType)
		ActionBindingsTabModule.updateActionRowForInputType(p2, p3, inputType)
	end
end

function ActionBindingsTabModule.removeActionRows(Key, p4) --[[ Line: 409 ]]
	-- upvalues: t (copy), BoundInputTypes (copy), TableHeaders (copy), updateContainerCanvas (copy), Parent (ref)
	local Flag = nil
	for _, inputType in pairs(p4.inputTypes) do
		local Entry = t[inputType]
		
		if Entry then
			Entry[Key]:Destroy()
			Entry[Key] = nil
			Flag = true
			
			for _, _ in pairs(Entry) do
				Flag = false
				break
			end
			if Flag then
				local BoundInputType = BoundInputTypes[inputType]
				
				if BoundInputType then
					BoundInputType:Destroy()
					BoundInputTypes[inputType] = nil
				end
				local TableHeader = TableHeaders[inputType]
				
				if TableHeader then
					TableHeaders[TableHeader] = nil
					TableHeader:Destroy()
					TableHeaders[inputType] = nil
				end
			end
		end
	end
	updateContainerCanvas()
	Parent.UIListLayout:ApplyLayout()
end

function ActionBindingsTabModule.updateGuis() --[[ Line: 446 ]]
	-- upvalues: ContextActionService (copy), ActionBindingsTabModule (copy), Flag (ref), updateContainerCanvas (copy)
	for i, value in pairs((ContextActionService:GetAllBoundCoreActionInfo())) do
		value.isCore = true
		ActionBindingsTabModule.updateActionRows(i, value)
	end
	for i1, value1 in pairs((ContextActionService:GetAllBoundActionInfo())) do
		value1.isCore = false
		ActionBindingsTabModule.updateActionRows(i1, value1)
	end
	Flag = true
	updateContainerCanvas()
end

return ActionBindingsTabModule