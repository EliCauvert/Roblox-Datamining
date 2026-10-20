local Parent = script:FindFirstAncestor("SplitPane").Parent
local GuiService = game:GetService("GuiService")
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local SplitPaneStoreModule = require(script.Parent.Parent.Stores.SplitPaneStore)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local UseRegistryEntryFunction = FocusNavigationUtilsModule.FocusNavigableSurfaceRegistry.useRegistryEntry

local function getSelectionGroupRowContainer(Frame)
	local Parent = Frame.Parent
	while Parent ~= nil do
		if Parent:IsA("ScrollingFrame") then
			return Parent
		end
		if Parent:IsA("GuiObject") and Parent.SelectionGroup then
			return Parent
		end
		Parent = Parent.Parent
	end
	return nil
end

local function getRowBandContainer(Frame: Frame, Current)
	local Y = Frame.AbsolutePosition.Y
	local NewY = Y + Frame.AbsoluteSize.Y
	local Y1 = Frame.AbsoluteSize.Y
	local v1 = nil
	local Parent = Frame.Parent
	while Parent ~= nil and (Parent ~= Current and Parent:IsA("GuiObject")) do
		local Frame1 = Parent
		local Y2 = Frame1.AbsolutePosition.Y
		local NewY1 = Y2 + Frame1.AbsoluteSize.Y
		
		if Y2 < Y - Y1 or NewY + Y1 < NewY1 then break end
		v1 = Frame1
		Parent = Frame1.Parent
	end
	return v1
end

local function _(Frame, Ancestor, p1)
	-- upvalues: getSelectionGroupRowContainer (copy), getRowBandContainer (copy)
	return if Ancestor == nil or not Frame:IsDescendantOf(Ancestor) then if Frame:FindFirstAncestorWhichIsA("ScrollingFrame") == nil then getRowBandContainer(Frame, p1) else getSelectionGroupRowContainer(Frame) else Ancestor
end

local function hasSelectableToTheRight(Frame: Frame, Object): boolean
	local X: number = Frame.AbsolutePosition.X
	local Y = Frame.AbsolutePosition.Y
	local NewY = Y + Frame.AbsoluteSize.Y
	
	for _, Gui in Object:GetDescendants() do
		if Gui ~= Frame and Gui:IsA("GuiObject") and Gui.Selectable and Gui.Visible then
			local X1 = Gui.AbsolutePosition.X
			local Y1 = Gui.AbsolutePosition.Y
			
			if Y < Y1 + Gui.AbsoluteSize.Y and NewY > Y1 and X + 2 < X1 then
				return true
			end
		end
	end
	return false
end

return function(p1)
	-- upvalues: SplitPaneStoreModule (copy), SignalsReactModule (copy), UseRegistryEntryFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), ReactModule (copy), GuiService (copy), getSelectionGroupRowContainer (copy), getRowBandContainer (copy), hasSelectableToTheRight (copy)
	local Store = SplitPaneStoreModule.getStore()
	local UseSignalStateResult = SignalsReactModule.useSignalState(Store.getSupportPaneEntryTarget)
	local UseRegistryEntryResult = UseRegistryEntryFunction(FocusNavigableSurfaceIdentifierEnum.HeaderView)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), Store (copy), p1 (copy), GuiService (upval), UseSignalStateResult (copy), UseRegistryEntryResult (copy), getSelectionGroupRowContainer (upval), getRowBandContainer (upval), hasSelectableToTheRight (upval)
		local function _()
			-- upvalues: UseRefResult (upval)
			local Current = UseRefResult.current
			
			if Current ~= nil then
				if Current.object.NextSelectionRight == Current.target then
					Current.object.NextSelectionRight = nil
				end
				UseRefResult.current = nil
			end
		end
		
		local function onSelectedCoreObjectChanged()
			-- upvalues: Store (upval), p1 (upval), GuiService (upval), UseSignalStateResult (upval), UseRefResult (upval), UseRegistryEntryResult (upval), getSelectionGroupRowContainer (upval), getRowBandContainer (upval), hasSelectableToTheRight (upval)
			local Current = p1.current
			local SelectedCoreObject = GuiService.SelectedCoreObject
			
			if Store.getIsSplitEnabled(false) and SelectedCoreObject ~= nil and Current ~= nil and UseSignalStateResult ~= nil and SelectedCoreObject:IsDescendantOf(Current) then
				local RowBandContainer = if UseRegistryEntryResult == nil or not SelectedCoreObject:IsDescendantOf(UseRegistryEntryResult) then if SelectedCoreObject:FindFirstAncestorWhichIsA("ScrollingFrame") == nil then getRowBandContainer(SelectedCoreObject, Current) else getSelectionGroupRowContainer(SelectedCoreObject) else UseRegistryEntryResult
				
				if RowBandContainer ~= nil and not hasSelectableToTheRight(SelectedCoreObject, RowBandContainer) then
					local Current1 = UseRefResult.current
					
					if Current1 ~= nil and Current1.object ~= SelectedCoreObject then
						local Current2 = UseRefResult.current
						
						if Current2 ~= nil then
							if Current2.object.NextSelectionRight == Current2.target then
								Current2.object.NextSelectionRight = nil
							end
							UseRefResult.current = nil
						end
					end
					if SelectedCoreObject.NextSelectionRight == nil then
						SelectedCoreObject.NextSelectionRight = UseSignalStateResult
						UseRefResult.current = {
							object = SelectedCoreObject,
							target = UseSignalStateResult
						}
						
						return
					end
				else
					local Current3 = UseRefResult.current
					
					if Current3 ~= nil then
						if Current3.object.NextSelectionRight == Current3.target then
							Current3.object.NextSelectionRight = nil
						end
						UseRefResult.current = nil
					end
				end
				return
			else
				local Current1 = UseRefResult.current
				
				if Current1 ~= nil then
					if Current1.object.NextSelectionRight == Current1.target then
						Current1.object.NextSelectionRight = nil
					end
					UseRefResult.current = nil
				end
			end
		end
		
		onSelectedCoreObjectChanged()
		local Connection = GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(onSelectedCoreObjectChanged)
		
		return function()
			-- upvalues: Connection (copy), UseRefResult (upval)
			Connection:Disconnect()
			local Current = UseRefResult.current
			
			if Current ~= nil then
				if Current.object.NextSelectionRight == Current.target then
					Current.object.NextSelectionRight = nil
				end
				UseRefResult.current = nil
			end
		end
	end, { UseRegistryEntryResult, UseSignalStateResult, p1 })
end