local UtilsModule = require(script.Parent.Parent.utils)

local function _(Frame, _)
	-- upvalues: UtilsModule (copy)
	local v1 = nil
	local v2 = nil
	
	local function scan(Frame, p1: number)
		-- upvalues: UtilsModule (upval), v1 (ref), v2 (ref), scan (copy)
		if p1 > 8 then return end
		if UtilsModule.TEXT_CLASSES[Frame.ClassName] and Frame.Visible and Frame.Text ~= "" and Frame.AbsoluteSize.X > 10 then
			local Text = Frame.Text
			
			if not Text:match("^%d+$") and #Text > 1 then
				if Frame.Name == "Title" or Frame.Name:match("Label$") or Frame.Name == "StyledTextLabel" or Frame.Name == "HeaderText" then
					if not v1 or #v1 < #Text then
						v1 = Text
					end
				elseif not v2 then
					v2 = Text
				end
			end
		end
		for _, child in ipairs(Frame:GetChildren()) do
			scan(child, p1 + 1)
		end
	end
	
	scan(Frame, 0)
	
	return v1 or v2
end

local BtnCenterFunction = UtilsModule.btnCenter

local function isItemLike(Object): boolean
	if Object:IsA("ImageButton") or Object:IsA("TextButton") then
		return true
	end
	if Object:IsA("Frame") then
		for _, descendant in ipairs(Object:GetDescendants()) do
			if descendant:IsA("ImageButton") or descendant:IsA("TextButton") then
				return true
			end
		end
	end
	return false
end

local function findClickableChild(Object)
	if Object:IsA("ImageButton") or Object:IsA("TextButton") then
		return Object
	end
	for _, child in ipairs(Object:GetChildren()) do
		if child:IsA("ImageButton") or child:IsA("TextButton") then
			return child
		end
	end
	for _, descendant in ipairs(Object:GetDescendants()) do
		if descendant:IsA("ImageButton") or descendant:IsA("TextButton") then
			return descendant
		end
	end
	return nil
end

local config = {
	hamburger = "CoreGui.TopBarApp.TopBarApp.UnibarLeftFrame.UnibarMenu.SubMenuHost",
	esc_tabs = "CoreGui.RobloxGui.SettingsClippingShield.SettingsShield.MenuContainer.Page.HubBar.TabHeaderContainer.HubBarContainer",
	system_bar = "CoreGui.LuaAppScreenGui.SystemBar.SystemBar.RealSystemBar.AnimatedFrame.MainFrame.PrimaryItems"
}

local function countItemLikeChildren(Gui): number
	-- upvalues: isItemLike (copy)
	local Count = 0
	
	for _, Gui1 in ipairs(Gui:GetChildren()) do
		if Gui1:IsA("GuiObject") and Gui1.Visible and Gui1.AbsoluteSize.Y >= 5 and Gui1.Name ~= "UIListLayout" and Gui1.Name ~= "UIPadding" and not Gui1.Name:match("Layout$") and isItemLike(Gui1) then
			Count += 1
		end
	end
	return Count
end

local function findBestItemContainer(Inst, p1)
	-- upvalues: countItemLikeChildren (copy)
	local P8 = p1 or 12
	local Inst1 = Inst
	local CountItemLikeChildrenResult = countItemLikeChildren(Inst)
	local list = { { depth = 0, inst = Inst } }
	local Count = 1
	while Count <= #list do
		local Entry = list[Count]
		Count += 1
		
		if P8 <= Entry.depth then continue end
		for _, Gui in ipairs(Entry.inst:GetChildren()) do
			if Gui:IsA("GuiObject") and Gui.Visible then
				local CountItemLikeChildrenResult1 = countItemLikeChildren(Gui)
				
				if CountItemLikeChildrenResult < CountItemLikeChildrenResult1 then
					CountItemLikeChildrenResult = CountItemLikeChildrenResult1
					Inst1 = Gui
				end
				list[#list + 1] = { inst = Gui, depth = Entry.depth + 1 }
			end
		end
	end
	return Inst1
end

local function findFirstScrollingFrameChild(Object)
	for _, ScrollingFrame in ipairs(Object:GetChildren()) do
		if ScrollingFrame:IsA("ScrollingFrame") then
			return ScrollingFrame
		end
		for _, ScrollingFrame1 in ipairs(ScrollingFrame:GetChildren()) do
			if ScrollingFrame1:IsA("ScrollingFrame") then
				return ScrollingFrame1
			end
		end
	end
	return nil
end

local function findItemContainer(Frame)
	-- upvalues: findFirstScrollingFrameChild (copy), isItemLike (copy)
	local FirstScrollingFrameChild = findFirstScrollingFrameChild(Frame)
	
	if not FirstScrollingFrameChild then
		return Frame
	end
	local Flag = nil
	for _, child in ipairs(FirstScrollingFrameChild:GetChildren()) do
		if child:IsA("Frame") or child:IsA("ScrollingFrame") then
			Flag = false
			
			for _, child1 in ipairs(child:GetChildren()) do
				if isItemLike(child1) then
					Flag = true
					break
				end
			end
			if Flag then
				return child
			end
		end
	end
	return FirstScrollingFrameChild
end

return {
	description = "List all clickable items in a menu or container. Auto-discovers item labels and click coordinates. Works for hamburger menus, tab bars, dropdown lists, or any container with clickable children. Supports named shortcuts: 'hamburger', 'esc_tabs', and 'system_bar' (UA left-side nav). When a custom path's immediate children don't look like menu items, auto-recurses to find the best container.",
	params = {
		{
			name = "path",
			desc = "DataModel path to the menu container, or a shortcut name: \"hamburger\" (nine-dot dropdown), \"esc_tabs\" (ESC menu tab bar), \"system_bar\" (UA left-side nav)",
			required = false
		}
	},
	call = function(p2): string
		-- upvalues: UtilsModule (copy), config (copy), findItemContainer (copy), findBestItemContainer (copy), findClickableChild (copy), BtnCenterFunction (copy)
		local Path = p2.path
		
		if not Path then
			local CoreGuiTopBarAppTopBarAppUnibarLeftFrameUnibarMenuSubMenuHost = UtilsModule.resolveInstance("CoreGui.TopBarApp.TopBarApp.UnibarLeftFrame.UnibarMenu.SubMenuHost")
			
			if CoreGuiTopBarAppTopBarAppUnibarLeftFrameUnibarMenuSubMenuHost then
				for _, Gui in ipairs(CoreGuiTopBarAppTopBarAppUnibarLeftFrameUnibarMenuSubMenuHost:GetChildren()) do
					if Gui:IsA("GuiObject") and Gui.Visible and Gui.AbsoluteSize.Y > 0 then
						Path = "hamburger"
						break
					end
				end
			end
			if not Path then
				local CoreGuiRobloxGuiSettingsClippingShieldSettingsShield = UtilsModule.resolveInstance("CoreGui.RobloxGui.SettingsClippingShield.SettingsShield")
				
				if CoreGuiRobloxGuiSettingsClippingShieldSettingsShield and CoreGuiRobloxGuiSettingsClippingShieldSettingsShield:IsA("GuiObject") and CoreGuiRobloxGuiSettingsClippingShieldSettingsShield.Visible then
					Path = "esc_tabs"
				end
			end
			if not Path then
				return "ERROR: no path provided and no open menu detected. Open a menu first or provide a 'path' parameter."
			end
		end
		local Entry = config[Path] or Path
		local ResolveInstanceResult = UtilsModule.resolveInstance(Entry)
		
		if not ResolveInstanceResult then
			return "ERROR: could not resolve path \"" .. tostring(Entry) .. "\""
		end
		local Object = ResolveInstanceResult
		
		if Path == "hamburger" then
			for _, Gui1 in ipairs(ResolveInstanceResult:GetChildren()) do
				if Gui1:IsA("GuiObject") and Gui1.Visible and Gui1.AbsoluteSize.Y > 0 then
					Object = findItemContainer(Gui1)
					break
				end
			end
		elseif not config[Path] then
			Object = findBestItemContainer(ResolveInstanceResult)
		end
		local List = {}
		
		for _, Frame in ipairs((UtilsModule.sortChildrenByLayoutOrder(Object:GetChildren()))) do
			if Frame:IsA("GuiObject") and Frame.Visible and Frame.AbsoluteSize.Y >= 5 and Frame.Name ~= "UIListLayout" and Frame.Name ~= "UIPadding" and not Frame.Name:match("Layout$") then
				local v3 = nil
				local v4 = nil
				
				local function scan(Frame, p3: number)
					-- upvalues: UtilsModule (upval), v3 (ref), v4 (ref), scan (copy)
					if p3 > 8 then return end
					if UtilsModule.TEXT_CLASSES[Frame.ClassName] and Frame.Visible and Frame.Text ~= "" and Frame.AbsoluteSize.X > 10 then
						local Text = Frame.Text
						
						if not Text:match("^%d+$") and #Text > 1 then
							if Frame.Name == "Title" or Frame.Name:match("Label$") or Frame.Name == "StyledTextLabel" or Frame.Name == "HeaderText" then
								if not v3 or #v3 < #Text then
									v3 = Text
								end
							elseif not v4 then
								v4 = Text
							end
						end
					end
					for _, child in ipairs(Frame:GetChildren()) do
						scan(child, p3 + 1)
					end
				end
				
				scan(Frame, 0)
				local V30 = v3 or v4
				
				if V30 then
					local ClickableChild = findClickableChild(Frame)
					local BtnCenterResult = ClickableChild and BtnCenterFunction(ClickableChild) or nil
					local Active = true
					
					if ClickableChild then
						local Success, Result = pcall(function()
							-- upvalues: ClickableChild (copy)
							return ClickableChild.Active
						end)
						
						if Success and not Result then
							Active = false
						end
					end
					local IsSelected = false
					local Underline = Frame:FindFirstChild("Underline") or (Frame:FindFirstChild("TabSelection") or Frame:FindFirstChild("SelectedIndicator"))
					
					if Underline and Underline:IsA("GuiObject") and Underline.Visible then
						IsSelected = true
					end
					table.insert(List, {
						name = V30,
						id = Frame.Name,
						center = BtnCenterResult,
						active = Active,
						isSelected = IsSelected
					})
				end
			end
		end
		if #List == 0 then
			return "No menu items found in " .. Object:GetFullName()
		end
		local List2 = {
			("Found %d item(s) in %s:\n"):format(#List, Object:GetFullName())
		}
		
		for i, value in ipairs(List) do
			local List1 = { ("%d. \"%s\""):format(i, value.name) }
			
			if value.isSelected then
				table.insert(List1, "  [ACTIVE]")
			end
			if value.center then
				if value.active then
					table.insert(List1, ("  click → (%s)"):format(value.center))
				else
					table.insert(List1, "  *** DISABLED")
				end
			end
			table.insert(List1, ("  id: %s"):format(value.id))
			table.insert(List2, table.concat(List1, "\n"))
		end
		return table.concat(List2, "\n\n")
	end
}