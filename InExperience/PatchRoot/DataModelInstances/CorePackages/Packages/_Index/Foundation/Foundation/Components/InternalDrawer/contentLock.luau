return {
	lock = function(Button, Button1, p1)
		local Actives = {}
		local List = {}
		local Flag = false
		local t = {}
		
		local function _(Key)
			-- upvalues: t (copy)
			if Key.Active then
				t[Key] = false
				Key.Active = false
				
				return
			end
		end
		
		local function suppress(Button)
			-- upvalues: Actives (copy), List (copy), t (copy), Flag (ref)
			if Actives[Button] ~= nil then return end
			Actives[Button] = Button.Active
			table.insert(List, Button:GetPropertyChangedSignal("Active"):Connect(function()
				-- upvalues: t (upval), Button (copy), Actives (upval), Flag (upval)
				if t[Button] == Button.Active then
					t[Button] = nil
					
					return
				end
				Actives[Button] = Button.Active
				
				if not Flag and Button.Active then
					if not Button.Active then return end
					t[Button] = false
					Button.Active = false
				end
			end))
			table.insert(List, Button:GetPropertyChangedSignal("Interactable"):Connect(function()
				-- upvalues: Actives (upval), Button (copy)
				Actives[Button] = Button.Interactable
			end))
			
			if Button.Active then
				t[Button] = false
				Button.Active = false
				
				return
			end
		end
		
		local Parent = if p1 == nil or p1.Parent == Button then nil else p1.Parent
		
		if Button ~= nil then
			if Button:IsA("GuiButton") then
				suppress(Button)
			end
			for _, Button2 in Button:GetDescendants() do
				if Button2:IsA("GuiButton") and Button2 ~= Parent then
					suppress(Button2)
				end
			end
			table.insert(List, Button.DescendantAdded:Connect(function(Descendant)
				-- upvalues: Parent (copy), suppress (copy)
				if Descendant:IsA("GuiButton") and Descendant ~= Parent then
					suppress(Descendant)
				end
			end))
		end
		if Button1 ~= nil and Button1:IsA("GuiButton") then
			suppress(Button1)
		end
		local ScrollingEnabled = if p1 == nil then nil else p1.ScrollingEnabled
		
		if p1 ~= nil then
			p1.ScrollingEnabled = false
		end
		return function()
			-- upvalues: Flag (ref), List (copy), Actives (copy), p1 (copy), ScrollingEnabled (copy)
			Flag = true
			
			for i, Connection in List do
				Connection:Disconnect()
			end
			for i, active in Actives do
				if i.Parent ~= nil then
					i.Active = active
				end
			end
			table.clear(Actives)
			
			if p1 ~= nil and p1.Parent ~= nil and ScrollingEnabled ~= nil then
				p1.ScrollingEnabled = ScrollingEnabled
			end
		end
	end
}