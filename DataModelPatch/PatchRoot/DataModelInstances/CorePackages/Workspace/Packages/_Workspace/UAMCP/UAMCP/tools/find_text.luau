local DomTestingLibraryModule = require(script:FindFirstAncestor("UAMCP").Parent.DomTestingLibrary)
local UtilsModule = require(script.Parent.Parent.utils)

local function _(p1): string
	-- upvalues: UtilsModule (copy)
	local AncestorScrollFrame = UtilsModule.findAncestorScrollFrame(p1)
	
	return if AncestorScrollFrame and not UtilsModule.isOnScreen(p1, AncestorScrollFrame) then ("\n  *** OFF-SCREEN — element is scrolled out of view in '%s'. Use scroll_to first, then re-query."):format(AncestorScrollFrame.Name) else ""
end

local function formatEntry(Frame: Frame, IsVisible): string
	-- upvalues: UtilsModule (copy)
	local AncestorScrollFrame = UtilsModule.findAncestorScrollFrame(Frame)
	
	return ("%s \"%s\" — Text=\"%s\"  Vis=%s  Pos=%s  Size=%s\n  %s"):format(Frame.ClassName, Frame.Name, Frame.Text:sub(1, 60), tostring(IsVisible), tostring(Frame.AbsolutePosition), tostring(Frame.AbsoluteSize), Frame:GetFullName()) .. (if AncestorScrollFrame and not UtilsModule.isOnScreen(Frame, AncestorScrollFrame) then ("\n  *** OFF-SCREEN — element is scrolled out of view in '%s'. Use scroll_to first, then re-query."):format(AncestorScrollFrame.Name) else "")
end

local _ = function(p1, p2, p3)
	-- upvalues: UtilsModule (copy), formatEntry (copy)
	local t = {}
	
	local function walk(Frame)
		-- upvalues: t (copy), p3 (copy), UtilsModule (upval), p2 (copy), formatEntry (upval), walk (copy)
		if p3 <= #t then return end
		if UtilsModule.TEXT_CLASSES[Frame.ClassName] then
			local Success, Result = pcall(function()
				-- upvalues: Frame (copy)
				return Frame.Text
			end)
			
			if Success and Result and Result ~= "" then
				local IsVisible = UtilsModule.isVisible(Frame)
				
				if not p2 or IsVisible then
					t[#t + 1] = formatEntry(Frame, IsVisible)
				end
			end
		end
		for _, child in ipairs(Frame:GetChildren()) do
			if p3 <= #t then break end
			walk(child)
		end
	end
	
	walk(p1)
	
	return t
end

return {
	description = "Find text elements. If query is provided, uses DomTestingLibrary queryAllByText. If query is omitted, lists all text elements under root. Defaults to visible-only results. Annotates elements scrolled outside their ancestor ScrollingFrame as *** OFF-SCREEN.",
	params = {
		{
			name = "query",
			desc = "text to search for (case-insensitive substring by default). Omit to list all text under root.",
			required = false
		},
		{
			name = "exact",
			desc = "if true, match text exactly instead of substring (default false)",
			required = false
		},
		{
			name = "root",
			desc = "root path (default \"game.CoreGui\")",
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
	call = function(p4): string
		-- upvalues: UtilsModule (copy), formatEntry (copy), DomTestingLibraryModule (copy)
		local ResolveInstanceResult = UtilsModule.resolveInstance(p4.root or "game.CoreGui")
		
		if not ResolveInstanceResult then
			return "ERROR: could not resolve root path: " .. tostring(p4.root)
		end
		local Limit = p4.limit or UtilsModule.MAX_RESULTS
		local IsVisibleOnly = p4.visible_only ~= false
		local List = nil
		
		if p4.query and p4.query ~= "" then
			List = {}
			
			for _, value in ipairs((DomTestingLibraryModule.queryAllByText(ResolveInstanceResult, p4.exact and p4.query or UtilsModule.escapePattern(p4.query), { exact = p4.exact or false }))) do
				if Limit <= #List then break end
				if UtilsModule.TEXT_CLASSES[value.ClassName] then
					local IsVisible = UtilsModule.isVisible(value)
					
					if not IsVisibleOnly or IsVisible then
						List[#List + 1] = formatEntry(value, IsVisible)
					end
				end
			end
		else
			local t = {}
			
			local function walk(Frame)
				-- upvalues: t (copy), Limit (copy), UtilsModule (upval), IsVisibleOnly (copy), formatEntry (upval), walk (copy)
				if Limit <= #t then return end
				if UtilsModule.TEXT_CLASSES[Frame.ClassName] then
					local Success, Result = pcall(function()
						-- upvalues: Frame (copy)
						return Frame.Text
					end)
					
					if Success and Result and Result ~= "" then
						local IsVisible = UtilsModule.isVisible(Frame)
						
						if not IsVisibleOnly or IsVisible then
							t[#t + 1] = formatEntry(Frame, IsVisible)
						end
					end
				end
				for _, child in ipairs(Frame:GetChildren()) do
					if Limit <= #t then break end
					walk(child)
				end
			end
			
			walk(ResolveInstanceResult)
			List = t
		end
		return if #List == 0 then (p4.query and "No text elements found matching \"" .. p4.query .. "\"" or "No text elements found") .. (if IsVisibleOnly then " (visible_only=true, try visible_only=false)" else "") else ("Found %d text element(s):\n\n"):format(#List) .. table.concat(List, "\n\n")
	end
}