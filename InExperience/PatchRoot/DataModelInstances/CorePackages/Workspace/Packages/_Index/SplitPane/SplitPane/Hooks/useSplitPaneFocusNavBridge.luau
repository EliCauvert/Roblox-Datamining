local parent = script:FindFirstAncestor("SplitPane").Parent
local guiService = game:GetService("GuiService")
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local splitPaneStoreModule = require(script.Parent.Parent.Stores.SplitPaneStore)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local useRegistryEntry = focusNavigationUtilsModule.FocusNavigableSurfaceRegistry.useRegistryEntry

local function getSelectionGroupRowContainer(p1)
	local parent = p1.Parent
	while parent ~= nil do
		if not parent:IsA("ScrollingFrame") then
			if not parent:IsA("GuiObject") or not parent.SelectionGroup then
				parent = parent.Parent
				continue
			end
			return parent
		end
		return parent
	end
	return nil
end

local function getRowBandContainer(p2, p3)
	local y = p2.AbsolutePosition.Y
	local var1 = y + p2.AbsoluteSize.Y
	local y_1 = p2.AbsoluteSize.Y
	local var2 = nil
	local parent = p2.Parent
	while parent ~= nil and (parent ~= p3 and parent:IsA("GuiObject")) do
		local var3 = parent
		local y_2 = var3.AbsolutePosition.Y
		
		if y_2 < y - y_1 or var1 + y_1 < y_2 + var3.AbsoluteSize.Y then break end
		var2 = var3
		parent = var3.Parent
	end
	return var2
end

local function _(p4, p5, p6)
	-- upvalues: getSelectionGroupRowContainer (ref), getRowBandContainer (ref)
	return if not (p5 ~= nil and p4:IsDescendantOf(p5)) then if p4:FindFirstAncestorWhichIsA("ScrollingFrame") == nil then getRowBandContainer(p4, p6) else getSelectionGroupRowContainer(p4) else p5
end

local function hasSelectableToTheRight(p4, p5)
	local x = p4.AbsolutePosition.X
	local y = p4.AbsolutePosition.Y
	local var4 = y + p4.AbsoluteSize.Y
	
	for i, v in p5:GetDescendants() do
		if v ~= p4 and v:IsA("GuiObject") and (v.Selectable and v.Visible) then
			local y_1 = v.AbsolutePosition.Y
			
			if (y < y_1 + v.AbsoluteSize.Y and y_1 < var4) and x + 2 < v.AbsolutePosition.X then
				return true
			end
		end
	end
	return false
end

return function(p6)
	-- upvalues: splitPaneStoreModule (ref), signalsReactModule (ref), useRegistryEntry (ref), focusNavigableSurfaceIdentifierEnum (ref), reactModule (ref), guiService (ref), getSelectionGroupRowContainer (ref), getRowBandContainer (ref), hasSelectableToTheRight (ref)
	local store = splitPaneStoreModule.getStore()
	local var5 = signalsReactModule.useSignalState(store.getSupportPaneEntryTarget)
	local var6 = useRegistryEntry(focusNavigableSurfaceIdentifierEnum.HeaderView)
	local var7 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), store (ref), p6 (ref), guiService (copy), var5 (ref), var6 (ref), getSelectionGroupRowContainer (copy), getRowBandContainer (copy), hasSelectableToTheRight (copy)
		local function _()
			-- upvalues: var7 (copy)
			local current = var7.current
			
			if current ~= nil then
				if current.object.NextSelectionRight == current.target then
					current.object.NextSelectionRight = nil
				end
				var7.current = nil
			end
		end
		
		local function onSelectedCoreObjectChanged()
			-- upvalues: store (copy), p6 (copy), guiService (copy), var5 (copy), var7 (copy), var6 (copy), getSelectionGroupRowContainer (copy), getRowBandContainer (copy), hasSelectableToTheRight (copy)
			local isSplitEnabled = store.getIsSplitEnabled(false)
			local current = p6.current
			local selectedCoreObject = guiService.SelectedCoreObject
			
			if isSplitEnabled and selectedCoreObject ~= nil and (current ~= nil and var5 ~= nil) and selectedCoreObject:IsDescendantOf(current) then
				local var8 = if var6 == nil or not selectedCoreObject:IsDescendantOf(var6) then if selectedCoreObject:FindFirstAncestorWhichIsA("ScrollingFrame") ~= nil then getRowBandContainer(selectedCoreObject, current) else getSelectionGroupRowContainer(selectedCoreObject) else var6
				
				if var8 ~= nil and not hasSelectableToTheRight(selectedCoreObject, var8) then
					local current_1 = var7.current
					
					if current_1 ~= nil and current_1.object ~= selectedCoreObject then
						local current_2 = var7.current
						
						if current_2 ~= nil then
							if current_2.object.NextSelectionRight == current_2.target then
								current_2.object.NextSelectionRight = nil
							end
							var7.current = nil
						end
					end
					if selectedCoreObject.NextSelectionRight == nil then
						selectedCoreObject.NextSelectionRight = var5
						var7.current = { object = selectedCoreObject, target = var5 }
						
						return
					end
				else
					local current_1 = var7.current
					
					if current_1 ~= nil then
						if current_1.object.NextSelectionRight == current_1.target then
							current_1.object.NextSelectionRight = nil
						end
						var7.current = nil
					end
				end
				return
			else
				local current_1 = var7.current
				
				if current_1 ~= nil then
					if current_1.object.NextSelectionRight == current_1.target then
						current_1.object.NextSelectionRight = nil
					end
					var7.current = nil
				end
			end
		end
		
		onSelectedCoreObjectChanged()
		local var8 = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(onSelectedCoreObjectChanged)
		
		return function()
			-- upvalues: var8 (ref), var7 (copy)
			var8:Disconnect()
			local current = var7.current
			
			if current ~= nil then
				if current.object.NextSelectionRight == current.target then
					current.object.NextSelectionRight = nil
				end
				var7.current = nil
			end
		end
	end, { var6, var5, p6 })
end