local _ = require("./types")
local _ = require("./collection_types")
local _ = require("../vendor/compose/core")
local DragSessionModule = require("./drag_session")
local _ = require("./drag_types")
local ActivationModule = require("./activation")
local _ = require("./collection_props")
local CollectionPolicyModule = {
	allows = function(RowDeletable, p1): boolean
		if RowDeletable == nil then
			return true
		else
			local Success, Result = pcall(RowDeletable, p1)
			
			return Success and Result == true
		end
	end,
	disabled = function(Disabled, PeekResult): boolean
		if Disabled == nil then
			return false
		else
			local Success, Result = pcall(Disabled, PeekResult)
			
			return not Success or Result == true
		end
	end,
	selectionVisible = function(Frame: Frame): boolean
		local AbsolutePosition = Frame.AbsolutePosition
		local AbsoluteSize = Frame.AbsoluteSize
		local X = AbsolutePosition.X
		local Y = AbsolutePosition.Y
		local NewX = X + AbsoluteSize.X
		local NewY = Y + AbsoluteSize.Y
		local IsYAbove: boolean = AbsoluteSize.X > 0 and AbsoluteSize.Y > 0
		local Frame1 = Frame
		while Frame1 do
			if Frame1:IsA("GuiObject") then
				if not Frame1.Visible or not Frame1.Interactable then
					return false
				end
				if IsYAbove and Frame1.ClipsDescendants then
					local AbsolutePosition1 = Frame1.AbsolutePosition
					local AbsoluteSize1 = Frame1.AbsoluteSize
					X = math.max(X, AbsolutePosition1.X)
					Y = math.max(Y, AbsolutePosition1.Y)
					NewX = math.min(NewX, AbsolutePosition1.X + AbsoluteSize1.X)
					NewY = math.min(NewY, AbsolutePosition1.Y + AbsoluteSize1.Y)
					
					if NewX <= X or NewY <= Y then
						return false
					end
				end
			elseif Frame1:IsA("LayerCollector") and not Frame1.Enabled then
				return false
			end
			Frame1 = Frame1.Parent
		end
		return true
	end
}

function CollectionPolicyModule.actions(p1, p2, p3, p4, Content, Callback, p5, p6)
	-- upvalues: ActivationModule (copy), CollectionPolicyModule (copy)
	local ReadFunction = p1.read
	local RowActionsResult = if p2.rowActions then p2.rowActions(p3, p4) else nil
	local EditsResult = ActivationModule.edits(Content)
	
	if RowActionsResult == nil and #EditsResult == 0 then
		return Content, nil
	end
	local RowActionsResult1 = RowActionsResult or {}
	local config = { content = Content }
	
	if RowActionsResult then
		for i, value in RowActionsResult do
			config[i] = value
		end
	end
	local function _(p7)
		-- upvalues: CollectionPolicyModule (upval), p2 (copy), p3 (copy), ReadFunction (copy)
		return if p7 == nil then nil else function(Callback)
			-- upvalues: CollectionPolicyModule (upval), p2 (upval), p3 (upval), ReadFunction (upval), p7 (copy)
			local AllowsResult = CollectionPolicyModule.allows(p2.rowDeletable, Callback(p3))
			local List = {}
			
			for _, value in ReadFunction(p7, Callback) do
				if AllowsResult or value.role ~= "destructive" then
					table.insert(List, value)
				end
			end
			return List
		end
	end
	
	local Leading = RowActionsResult1.leading
	local Trailing = RowActionsResult1.trailing
	config.leading = if Leading == nil then nil else function(Callback)
		-- upvalues: CollectionPolicyModule (upval), p2 (copy), p3 (copy), ReadFunction (copy), Leading (copy)
		local AllowsResult = CollectionPolicyModule.allows(p2.rowDeletable, Callback(p3))
		local List = {}
		
		for _, value in ReadFunction(Leading, Callback) do
			if AllowsResult or value.role ~= "destructive" then
				table.insert(List, value)
			end
		end
		return List
	end
	config.trailing = if Trailing == nil then nil else function(Callback)
		-- upvalues: CollectionPolicyModule (upval), p2 (copy), p3 (copy), ReadFunction (copy), Trailing (copy)
		local AllowsResult = CollectionPolicyModule.allows(p2.rowDeletable, Callback(p3))
		local List = {}
		
		for _, value in ReadFunction(Trailing, Callback) do
			if AllowsResult or value.role ~= "destructive" then
				table.insert(List, value)
			end
		end
		return List
	end
	
	if #EditsResult > 0 then
		local Trailing1 = config.trailing
		
		function config.trailing(p8)
			-- upvalues: Trailing1 (copy), ReadFunction (copy), EditsResult (copy)
			local T = if Trailing1 == nil then {} else table.clone(ReadFunction(Trailing1, p8))
			for i, value in EditsResult do
				table.insert(T, {
					id = "edit:" .. i,
					label = value.label,
					icon = value.icon,
					role = value.role,
					enabled = value.enabled,
					onActivate = value.onActivate
				})
			end
			return T
		end
	end
	function config.enabled(Callback): boolean
		-- upvalues: p1 (copy), RowActionsResult1 (copy), CollectionPolicyModule (upval), p2 (copy), p3 (copy)
		return p1.read(RowActionsResult1.enabled, Callback) ~= false and not CollectionPolicyModule.disabled(p2.disabled, Callback(p3))
	end
	
	config.actionPlacement = RowActionsResult1.actionPlacement or (if p6 then "bottom" else "trailing")
	config.content = Content
	config.coordinator = RowActionsResult1.coordinator or p5
	config.Size = p1.types.UDim2.fromScale(1, 1)
	config.reducedMotion = p2.reducedMotion
	
	function config.swipeEnabled(p8): boolean
		-- upvalues: p1 (copy), RowActionsResult1 (copy), p2 (copy)
		return p1.read(RowActionsResult1.swipeEnabled, p8) ~= false and p1.read(p2.editing, p8) ~= true
	end
	
	local CallbackResult = Callback(config)
	local CellActions = CallbackResult:FindFirstChild("CellActions")
	local CellActions1 = if p6 and config.actionPlacement == "bottom" and CellActions and CellActions:IsA("GuiObject") then CellActions else nil
	
	if CellActions1 then
		local LayoutSizeResult = p1.layoutSize(CellActions1)
		local VisibleResult = p1.observe.Visible(CellActions1)
		
		return CallbackResult, p1.Compose.formula(function(Callback)
			-- upvalues: VisibleResult (copy), LayoutSizeResult (copy)
			return if Callback(VisibleResult) then Callback(LayoutSizeResult).Y else 0
		end)
	else
		return CallbackResult, nil
	end
end

function CollectionPolicyModule.drop(p8, p9, p10, p11, p12, p13, p14)
	-- upvalues: DragSessionModule (copy), CollectionPolicyModule (copy), ActivationModule (copy)
	if not p9.rowDrop then return end
	local RowDropResult = p9.rowDrop(p10, p11)
	
	if RowDropResult == nil then return end
	local Copy = table.clone(RowDropResult)
	local DragSessionModuleResult = DragSessionModule(p8)
	Copy.collectionAxis = if p13 then "X" else "Y"
	
	function Copy.accepts(p15, p16)
		-- upvalues: CollectionPolicyModule (upval), p9 (copy), p10 (copy), RowDropResult (copy)
		if CollectionPolicyModule.disabled(p9.disabled, p10:peek()) then
			return false, "This item is unavailable"
		elseif RowDropResult.accepts then
			return RowDropResult.accepts(p15, p16)
		else
			return true, nil
		end
	end
	
	DragSessionModuleResult.register(p12, Copy)
	p8.runtime.connect(p12, "InputBegan", function(Input)
		-- upvalues: DragSessionModuleResult (copy), p8 (copy), p12 (copy), ActivationModule (upval)
		local PeekResult = DragSessionModuleResult.state:peek()
		
		if PeekResult and PeekResult.mode == "armed" and (Input.UserInputType == p8.types.Enum.UserInputType.Touch or Input.UserInputType == p8.types.Enum.UserInputType.MouseButton1) then
			local TargetOfResult = DragSessionModuleResult.targetOf(p12)
			
			if TargetOfResult then
				ActivationModule.consume(Input)
				DragSessionModuleResult.commit(TargetOfResult)
			end
		end
	end)
	
	if p14 then
		p8.Compose.cleanup(ActivationModule.intercept(p14, function(): boolean
			-- upvalues: DragSessionModuleResult (copy), p12 (copy)
			local PeekResult = DragSessionModuleResult.state:peek()
			
			if not PeekResult or PeekResult.mode ~= "armed" then
				return false
			end
			local TargetOfResult = DragSessionModuleResult.targetOf(p12)
			
			if TargetOfResult then
				DragSessionModuleResult.commit(TargetOfResult)
				
				return true
			else
				return false
			end
		end))
	end
end

return CollectionPolicyModule