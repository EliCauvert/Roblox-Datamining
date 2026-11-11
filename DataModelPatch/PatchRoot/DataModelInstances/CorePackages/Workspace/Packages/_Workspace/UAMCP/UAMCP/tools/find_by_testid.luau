local UtilsModule = require(script.Parent.Parent.utils)
local CollectionService = game:GetService("CollectionService")

return {
	description = "Find instances by their data-testid tag (set via React.Tag). Supports exact match or substring search across all data-testid tags. Defaults to visible-only results.",
	params = {
		{
			name = "query",
			desc = "test ID to search for (case-insensitive substring match against the tag value)",
			required = true
		},
		{
			name = "exact",
			desc = "if true, match the full tag value exactly (default false)",
			required = false
		},
		{
			name = "root",
			desc = "root path to scope results under (default: all)",
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
		-- upvalues: UtilsModule (copy), CollectionService (copy)
		if not p1.query or p1.query == "" then
			return "ERROR: 'query' is required"
		end
		local Limit = p1.limit or UtilsModule.MAX_RESULTS
		local ResolveInstanceResult = p1.root and UtilsModule.resolveInstance(p1.root) or nil
		local Lowered = p1.query:lower()
		local Exact = p1.exact
		local IsVisibleOnly = p1.visible_only ~= false
		local t = {}
		
		for _, allTag in ipairs((CollectionService:GetAllTags())) do
			if allTag:sub(1, 12) == "data-testid=" then
				local Segment: string = allTag:sub(13)
				
				if Exact then
					if Segment == p1.query then
						t[#t + 1] = allTag
					end
				elseif Segment:lower():find(Lowered, 1, true) then
					t[#t + 1] = allTag
				end
			end
		end
		if #t == 0 then
			return "No data-testid tags found matching \"" .. tostring(p1.query) .. "\""
		end
		local t1 = {}
		
		for _, Text in ipairs(t) do
			for _, Frame in ipairs((CollectionService:GetTagged(Text))) do
				if Limit <= #t1 then break end
				local Inverted: boolean = ResolveInstanceResult and not Frame:IsDescendantOf(ResolveInstanceResult)
				local NoFrame1 = nil
				
				if not Inverted then
					local Frame1 = Frame:IsA("GuiObject") and Frame or Frame.Parent
					NoFrame1 = not Frame1 or (not Frame1:IsA("GuiObject") or UtilsModule.isVisible(Frame1))
					Inverted = IsVisibleOnly and not NoFrame1
				end
				if not Inverted then
					local config = {
						testId = Text:sub(13),
						class = Frame.ClassName,
						name = Frame.Name,
						path = Frame:GetFullName(),
						visible = NoFrame1
					}
					
					if Frame:IsA("GuiObject") then
						config.pos = tostring(Frame.AbsolutePosition)
						config.size = tostring(Frame.AbsoluteSize)
						config.clickCenter = UtilsModule.btnCenter(Frame)
						
						if Frame:IsA("GuiButton") then
							local Success, Result = pcall(function()
								-- upvalues: Frame (copy)
								return Frame.Active
							end)
							
							if Success and not Result then
								config.disabled = true
							end
						end
						local AncestorScrollFrame = UtilsModule.findAncestorScrollFrame(Frame)
						
						if AncestorScrollFrame and not UtilsModule.isOnScreen(Frame, AncestorScrollFrame) then
							config.offScreen = true
							config.scrollFrameName = AncestorScrollFrame.Name
						end
					end
					t1[#t1 + 1] = config
				end
			end
		end
		if #t1 == 0 then
			return "No instances found with data-testid matching \"" .. tostring(p1.query) .. "\"" .. (ResolveInstanceResult and " under " .. ResolveInstanceResult:GetFullName() or "") .. (if IsVisibleOnly then " (visible_only=true, try visible_only=false)" else "")
		end
		local List = {
			("Found %d instance(s) with data-testid matching \"%s\":\n"):format(#t1, p1.query)
		}
		
		for _, value in ipairs(t1) do
			local Messages = {
				("%s \"%s\"  testid=\"%s\""):format(value.class, value.name, value.testId)
			}
			
			if value.pos then
				Messages[#Messages + 1] = ("  Pos=%s  Size=%s"):format(value.pos, value.size)
			end
			if value.disabled then
				Messages[#Messages + 1] = "  *** DISABLED — button Active=false, clicking will have no effect."
				Messages[#Messages + 1] = ("  Click center: (%s)  <-- coords if it becomes active"):format(value.clickCenter)
			elseif value.offScreen then
				Messages[#Messages + 1] = ("  *** OFF-SCREEN — scrolled out of view in '%s'. Use scroll_to first."):format(value.scrollFrameName)
				Messages[#Messages + 1] = ("  Click center: (%s)  <-- coords after scrolling"):format(value.clickCenter)
			elseif value.clickCenter then
				Messages[#Messages + 1] = ("  Click center: (%s)  <-- use these coords"):format(value.clickCenter)
			end
			Messages[#Messages + 1] = "  " .. value.path
			List[#List + 1] = table.concat(Messages, "\n")
		end
		return table.concat(List, "\n\n")
	end
}