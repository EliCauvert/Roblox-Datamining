local DomTestingLibraryModule = require(script:FindFirstAncestor("UAMCP").Parent.DomTestingLibrary)
local UtilsModule = require(script.Parent.Parent.utils)

local function findClickableInDescendants(Object)
	-- upvalues: findClickableInDescendants (copy)
	local ClickableInDescendants = nil
	for _, child in ipairs(Object:GetChildren()) do
		if child:IsA("ImageButton") or child:IsA("TextButton") then
			return child
		end
		ClickableInDescendants = findClickableInDescendants(child)
		
		if ClickableInDescendants then
			return ClickableInDescendants
		end
	end
	return nil
end

local function findClickable(Button)
	-- upvalues: findClickableInDescendants (copy)
	local Parent = Button.Parent
	while Parent and Parent ~= game do
		if Parent:IsA("ImageButton") or Parent:IsA("TextButton") then
			return Parent
		end
		if not Parent:IsA("GuiObject") then break end
		Parent = Parent.Parent
	end
	local Parent1 = Button.Parent
	
	for _ = 1, 4 do
		if not Parent1 or Parent1 == game then break end
		local ClickableInDescendants = nil
		for _, child in ipairs(Parent1:GetChildren()) do
			if child:IsA("ImageButton") or child:IsA("TextButton") then
				return child
			end
			ClickableInDescendants = findClickableInDescendants(child)
			
			if ClickableInDescendants then
				return ClickableInDescendants
			end
		end
		Parent1 = Parent1.Parent
	end
	return nil
end

return {
	description = "Find text content and return the nearest clickable ancestor (ImageButton/TextButton) with center coordinates. Defaults to visible-only results.",
	params = {
		{
			name = "query",
			desc = "substring to match against Text content (case-insensitive)",
			required = true
		},
		{
			name = "root",
			desc = "root path (default \"game.CoreGui\")",
			required = false
		},
		{
			name = "exact",
			desc = "if true, match text exactly instead of substring (default false)",
			required = false
		},
		{
			name = "visible_only",
			desc = "if false, include invisible elements (default true)",
			required = false
		},
		{
			name = "limit",
			required = false,
			desc = ("max results (default %d)"):format(UtilsModule.MAX_RESULTS)
		}
	},
	call = function(p1): string
		-- upvalues: UtilsModule (copy), DomTestingLibraryModule (copy), findClickable (copy)
		local Query = p1.query
		
		if not Query or Query == "" then
			return "ERROR: 'query' is required"
		end
		local ResolveInstanceResult = UtilsModule.resolveInstance(p1.root or "game.CoreGui")
		
		if not ResolveInstanceResult then
			return "ERROR: could not resolve root path: " .. tostring(p1.root)
		end
		local Limit = p1.limit or UtilsModule.MAX_RESULTS
		local IsVisibleOnly = p1.visible_only ~= false
		local QueryAllByTextResult = DomTestingLibraryModule.queryAllByText(ResolveInstanceResult, p1.exact and Query or UtilsModule.escapePattern(Query), { exact = p1.exact or false })
		
		if #QueryAllByTextResult == 0 then
			return "No text found matching \"" .. Query .. "\""
		end
		local List = {}
		
		for _, Button in ipairs(QueryAllByTextResult) do
			if UtilsModule.TEXT_CLASSES[Button.ClassName] then
				local IsVisible = UtilsModule.isVisible(Button)
				
				if not IsVisibleOnly or IsVisible then
					local config = {
						text = Button.Text,
						textClass = Button.ClassName,
						textPath = Button:GetFullName(),
						textPos = tostring(Button.AbsolutePosition),
						textSize = tostring(Button.AbsoluteSize),
						visible = IsVisible
					}
					local Button1 = if Button:IsA("TextButton") then Button else findClickable(Button)
					
					if Button1 then
						config.clickClass = Button1.ClassName
						config.clickPath = Button1:GetFullName()
						config.clickPos = tostring(Button1.AbsolutePosition)
						config.clickSize = tostring(Button1.AbsoluteSize)
						config.clickCenter = UtilsModule.btnCenter(Button1)
						local Success, Result = pcall(function()
							-- upvalues: Button1 (copy)
							return Button1.Active
						end)
						
						if Success and not Result then
							config.disabled = true
						end
						local AncestorScrollFrame = UtilsModule.findAncestorScrollFrame(Button1)
						
						if AncestorScrollFrame and not UtilsModule.isOnScreen(Button1, AncestorScrollFrame) then
							config.offScreen = true
							config.scrollFrameName = AncestorScrollFrame.Name
						end
					end
					table.insert(List, config)
					
					if Limit <= #List then break end
				end
			end
		end
		if #List == 0 then
			return "No text found matching \"" .. Query .. "\"" .. (if IsVisibleOnly then " (visible_only=true, try visible_only=false)" else "")
		end
		local List1 = {
			("Found %d match(es) for \"%s\":\n"):format(#List, Query)
		}
		
		for _, value in ipairs(List) do
			local List2 = {
				("Text: \"%s\"  Vis=%s"):format(value.text:sub(1, 60), (tostring(value.visible))),
				("Text element: %s  Pos=%s  Size=%s"):format(value.textClass, value.textPos, value.textSize),
				"  " .. value.textPath
			}
			
			if value.clickPath then
				table.insert(List2, ("Clickable: %s  Pos=%s  Size=%s"):format(value.clickClass, value.clickPos, value.clickSize))
				
				if value.disabled then
					table.insert(List2, "  *** DISABLED — button Active=false, clicking will have no effect. The button may require a prior action (e.g. changing a selection) before it becomes active.")
					table.insert(List2, ("  Click center: (%s)  <-- coords if it becomes active"):format(value.clickCenter))
				elseif value.offScreen then
					table.insert(List2, ("  *** OFF-SCREEN — element is scrolled out of view in '%s'. Use scroll_to({ target = \"%s\" }) or scroll_to({ path = \"%s\" }) first, then re-query for updated coords."):format(value.scrollFrameName, value.text:sub(1, 40), value.clickPath))
				else
					table.insert(List2, ("  Click center: (%s)  <-- use these coords"):format(value.clickCenter))
				end
				table.insert(List2, "  " .. value.clickPath)
			else
				table.insert(List2, "Clickable ancestor: none found (may be a non-interactive label)")
			end
			table.insert(List1, table.concat(List2, "\n"))
		end
		return table.concat(List1, "\n\n")
	end
}