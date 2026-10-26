local CoreGui = game:GetService("CoreGui")
local GuiService = game:GetService("GuiService")
local Parent = script:FindFirstAncestor("FocusNavigationUtils").Parent
local ReactModule = require(Parent.React)
local FocusNavigationContext = require(Parent.ReactFocusNavigation).FocusNavigationContext

local function v5(Delay, Ancestors, UseContextResult)
	-- upvalues: GuiService (copy), CoreGui (copy)
	local Flag = #Ancestors == 0
	local Connections = {}
	local List = {}
	
	local function _()
		-- upvalues: Flag (ref), Connections (copy)
		if not Flag then
			Flag = true
			
			for _, connection in Connections do
				connection:Disconnect()
			end
		end
	end
	
	local function onFocusChange(_, _, p1)
		-- upvalues: Flag (ref), Connections (copy)
		if p1 and not Flag then
			Flag = true
			
			for _, connection in Connections do
				connection:Disconnect()
			end
		end
	end
	
	local function focus(p2)
		-- upvalues: Delay (copy), Flag (ref), GuiService (upval), Ancestors (copy), Connections (copy), CoreGui (upval), UseContextResult (copy), focus (copy), List (copy)
		table.insert(List, (task.delay(Delay, function()
			-- upvalues: Flag (upval), GuiService (upval), Ancestors (upval), Connections (upval), p2 (copy), CoreGui (upval), UseContextResult (upval), focus (upval)
			if not Flag then
				local SelectedCoreObject = GuiService.SelectedCoreObject
				
				if SelectedCoreObject then
					for _, ancestor in Ancestors do
						if SelectedCoreObject == ancestor or SelectedCoreObject:IsDescendantOf(ancestor) then
							if not Flag then
								Flag = true
								
								for _, connection in Connections do
									connection:Disconnect()
								end
							end
							return
						end
					end
				end
				local Ancestor = Ancestors[p2]
				
				if Ancestor and Ancestor:IsDescendantOf(CoreGui) then
					UseContextResult:focusGuiObject(Ancestor, false)
				end
				focus(if #Ancestors < p2 then 1 else p2 % #Ancestors + 1)
			end
		end)))
	end
	
	for _, ancestor in Ancestors do
		table.insert(Connections, ancestor.SelectionChanged:Connect(onFocusChange))
	end
	local v1 = 1
	table.insert(List, (task.delay(Delay, function()
		-- upvalues: Flag (ref), GuiService (upval), Ancestors (copy), Connections (copy), v1 (copy), CoreGui (upval), UseContextResult (copy), focus (copy)
		if not Flag then
			local SelectedCoreObject = GuiService.SelectedCoreObject
			
			if SelectedCoreObject then
				for _, ancestor in Ancestors do
					if SelectedCoreObject == ancestor or SelectedCoreObject:IsDescendantOf(ancestor) then
						if not Flag then
							Flag = true
							
							for _, connection in Connections do
								connection:Disconnect()
							end
						end
						return
					end
				end
			end
			local Ancestor = Ancestors[v1]
			
			if Ancestor and Ancestor:IsDescendantOf(CoreGui) then
				UseContextResult:focusGuiObject(Ancestor, false)
			end
			focus(if #Ancestors < v1 then 1 else v1 % #Ancestors + 1)
		end
	end)))
	
	return {
		cancel = function()
			-- upvalues: List (copy), Flag (ref), Connections (copy)
			for _, value in List do
				task.cancel(value)
			end
			table.clear(List)
			
			if not Flag then
				Flag = true
				
				for _, connection in Connections do
					connection:Disconnect()
				end
			end
		end
	}
end

return function(p3, Delay)
	-- upvalues: ReactModule (copy), FocusNavigationContext (copy), v5 (copy)
	local UseContextResult = ReactModule.useContext(FocusNavigationContext)
	
	return ReactModule.useCallback(function()
		-- upvalues: UseContextResult (copy), v5 (upval), Delay (copy), p3 (copy)
		return if UseContextResult then v5(Delay, p3, UseContextResult) else nil
	end, { UseContextResult, p3, Delay })
end