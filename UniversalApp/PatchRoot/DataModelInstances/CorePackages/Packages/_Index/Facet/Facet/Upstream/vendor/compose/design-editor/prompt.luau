local CoreModule = require("../core")
local DesignModule = require("../design")
local _ = require("./devices")
local _ = require("./canvas")
local DraftsModule = require("./drafts")
local _ = require("./ui")

local function snapshot(p1, Frame, DesignPath, Text: string)
	-- upvalues: DesignModule (copy)
	local CopyResult = DesignModule.document.copy(p1.document:peek())
	local PeekResult = p1.selected:peek()
	local List = {}
	local v1 = nil
	
	local function visit(Root): boolean
		-- upvalues: List (copy), PeekResult (copy), v1 (ref), visit (copy)
		table.insert(List, { id = Root.id, name = Root.name, kind = Root.kind })
		
		if Root.id == PeekResult then
			v1 = Root
			
			return true
		end
		for _, child in Root.children do
			if visit(child) then
				return true
			end
		end
		table.remove(List)
		
		return false
	end
	
	assert(visit(CopyResult.root), "Select a Design node first")
	local Props = assert(v1).props
	local List1 = {}
	
	local function _(Value)
		-- upvalues: List1 (copy)
		if not table.find(List1, Value) then
			table.insert(List1, Value)
		end
	end
	
	local function literal(Literal)
		-- upvalues: List1 (copy), literal (copy)
		if type(Literal) ~= "table" then return end
		if type(Literal.token) == "string" then
			local Token = Literal.token
			
			if not table.find(List1, Token) then
				table.insert(List1, Token)
			end
		end
		for _, value in Literal do
			literal(value)
		end
	end
	
	for _, prop in Props do
		if prop.token then
			local Token = prop.token
			
			if not table.find(List1, Token) then
				table.insert(List1, Token)
			end
		end
		if prop.literal ~= nil then
			literal(prop.literal)
		end
	end
	table.sort(List1)
	
	return {
		designPath = DesignPath,
		nodePath = List,
		props = Props,
		tokens = List1,
		frame = Frame,
		source = DesignModule.emit(CopyResult, p1.library),
		request = Text,
		count = tonumber(string.match(string.gsub(string.gsub(string.lower(Text), "%f[%a]two%f[%A]", "2"), "%f[%a]three%f[%A]", "3"), "%f[%d]([23])%s+variants?%f[%A]")) or 1
	}
end

return {
	snapshot = snapshot,
	create = function(p2, p3, p4, p5, p6, p7)
		-- upvalues: snapshot (copy), DraftsModule (copy), CoreModule (copy), DesignModule (copy)
		local v2 = require("./theme")(p2)
		local DesignPrompt = v2.frame("DesignPrompt", v2.color.panel)
		p2.set(DesignPrompt, "AnchorPoint", p2.values.vector2(0, 1))
		v2.place(DesignPrompt, p5, p2.values.udim2(1, 0, 0, 140), p2.values.udim2(0, 0, 1, 0))
		p2.set(p4.root, "Size", p2.values.udim2(1, 0, 1, -140))
		local LabelResult = v2.label("", v2.color.secondary, v2.size.small)
		p2.set(LabelResult, "Name", "PromptTarget")
		v2.place(LabelResult, DesignPrompt, p2.values.udim2(1, -24, 0, 24), p2.values.udim2(0, 12, 0, 4))
		local FieldResult = v2.field("")
		p2.set(FieldResult, "Name", "PromptRequest")
		p2.set(FieldResult, "PlaceholderText", "Describe a change to the selected node")
		p2.set(FieldResult, "MultiLine", true)
		p2.set(FieldResult, "TextWrapped", true)
		p2.set(FieldResult, "TextYAlignment", p2.values.enum("TextYAlignment", "Top"))
		v2.place(FieldResult, DesignPrompt, p2.values.udim2(1, -24, 0, 56), p2.values.udim2(0, 12, 0, 32))
		local SendPrompt = v2.button("SendPrompt", "Apply prompt", v2.color.white)
		p2.set(SendPrompt, "BackgroundTransparency", 0)
		p2.set(SendPrompt, "BackgroundColor3", v2.color.accent)
		v2.place(SendPrompt, DesignPrompt, p2.values.udim2(0, 140, 0, 32), p2.values.udim2(1, -152, 0, 100))
		v2.corner(SendPrompt, 6)
		local LabelResult1 = v2.label("", v2.color.secondary, v2.size.small)
		p2.set(LabelResult1, "Name", "PromptStatus")
		v2.place(LabelResult1, DesignPrompt, p2.values.udim2(1, -176, 0, 32), p2.values.udim2(0, 12, 0, 100))
		local Flag = false
		local Busy = false
		local v3 = nil
		
		local function clear()
			-- upvalues: v3 (ref), p2 (copy), p4 (copy)
			if v3 then
				v3.dispose()
				v3 = nil
			end
			p2.set(p4.root, "Visible", true)
		end
		
		local v4 = 1
		local PromptVariants = v2.button("PromptVariants", "1 variant")
		p2.set(PromptVariants, "Position", p2.values.udim2(1, if p6.theme then -360 else -256, 0, 100))
		v2.place(PromptVariants, DesignPrompt, p2.values.udim2(0, 96, 0, 32))
		p2.set(LabelResult1, "Size", p2.values.udim2(1, if p6.theme then -384 else -280, 0, 32))
		local Activated = p2.connect(PromptVariants, "Activated", function()
			-- upvalues: Busy (ref), v4 (ref), p2 (copy), PromptVariants (copy)
			if not Busy then
				v4 = v4 % 3 + 1
				p2.set(PromptVariants, "Text", if v4 == 1 then "1 variant" else `{v4} variants`)
			end
		end)
		local Inverted = false
		local Connection = nil
		
		if p6.theme then
			local PromptScope = v2.button("PromptScope", "Design")
			v2.place(PromptScope, DesignPrompt, p2.values.udim2(0, 96, 0, 32), p2.values.udim2(1, -256, 0, 100))
			Connection = p2.connect(PromptScope, "Activated", function()
				-- upvalues: Busy (ref), Inverted (ref), p2 (copy), PromptScope (copy), SendPrompt (copy), PromptVariants (copy), LabelResult1 (copy)
				if not Busy then
					Inverted = not Inverted
					p2.set(PromptScope, "Text", if Inverted then "Theme" else "Design")
					p2.set(SendPrompt, "Text", if Inverted then "Apply theme" else "Apply prompt")
					p2.set(PromptVariants, "Visible", not Inverted)
					p2.set(LabelResult1, "Size", p2.values.udim2(1, if Inverted then -280 else -384, 0, 32))
				end
			end)
		end
		local function submit(Text: string, p8, p9)
			-- upvalues: Flag (ref), Busy (ref), snapshot (upval), p3 (copy), p4 (copy), p6 (copy), Inverted (ref), v3 (ref), p2 (copy), v4 (ref), SendPrompt (copy), LabelResult1 (copy), DraftsModule (upval), p5 (copy), p7 (copy), clear (copy)
			assert(not Flag and not Busy, "Prompt is busy or closed")
			assert(string.find(Text, "%S") and #Text <= 8000, "Enter a request of up to 8000 characters")
			assert(p8 == nil or (p8 == 1 or (p8 == 2 or p8 == 3)), "Choose one, two or three variants")
			local SnapshotResult = snapshot(p3, p4.current().device, p6.designPath, Text)
			local Inverted1 = if p9 == nil then Inverted else p9
			local ThemePromptRequiresAProvider = if Inverted1 then assert(p6.theme, "Theme prompt requires a provider") else p6.submit
			Busy = true
			
			if v3 then
				v3.dispose()
				v3 = nil
			end
			p2.set(p4.root, "Visible", true)
			SnapshotResult.count = if Inverted1 then 1 elseif p8 then p8 elseif SnapshotResult.count > 1 then SnapshotResult.count else v4
			p2.set(SendPrompt, "Text", "Working...")
			p2.set(LabelResult1, "Text", "Capturing the selected frame")
			p2.runtime.scheduler(p2.owner).after(0, function()
				-- upvalues: Flag (upval), ThemePromptRequiresAProvider (copy), SnapshotResult (copy), Busy (upval), p2 (upval), SendPrompt (upval), Inverted (upval), DraftsModule (upval), p5 (upval), p7 (upval), clear (upval), v3 (upval), p4 (upval), LabelResult1 (upval)
				if Flag then return end
				local Success, Result = pcall(ThemePromptRequiresAProvider, SnapshotResult)
				
				if Flag then return end
				Busy = false
				p2.set(SendPrompt, "Text", if Inverted then "Apply theme" else "Apply prompt")
				
				if not Success or type(Result) ~= "table" then
					p2.set(LabelResult1, "Text", if Success then Result else "Prompt failed; source preserved")
					
					return
				end
				local Success1, Result1 = pcall(DraftsModule, p2, p5, SnapshotResult.frame, Result, p7, clear)
				
				if Success1 then
					v3 = Result1
					p2.set(p4.root, "Visible", false)
				end
				p2.set(LabelResult1, "Text", if Success1 then Result.message else "Draft preview failed; source unchanged")
			end)
		end
		
		local Activated1 = p2.connect(SendPrompt, "Activated", function()
			-- upvalues: Busy (ref), submit (copy), p2 (copy), FieldResult (copy), LabelResult1 (copy)
			if Busy then return end
			local Success, Result = pcall(submit, p2.text(FieldResult, "Text"), nil, nil)
			
			if not Success then
				p2.set(LabelResult1, "Text", (tostring(Result)))
			end
		end)
		local OwnResult = CoreModule.owner.own(p2.owner, CoreModule.createRootOwner(function()
			-- upvalues: CoreModule (upval), p3 (copy), DesignModule (upval), p2 (copy), LabelResult (copy)
			CoreModule.watch(function(Callback)
				-- upvalues: p3 (upval), DesignModule (upval), p2 (upval), LabelResult (upval)
				local FindResult = DesignModule.document.find(Callback(p3.document).root, (Callback(p3.selected)))
				p2.set(LabelResult, "Text", if FindResult then `Selected: {FindResult.name} · {FindResult.kind}` else "Select a node on the canvas")
			end)
		end, p2.runtime.reactor).dispose)
		
		return {
			submit = submit,
			choose = function(p8)
				-- upvalues: v3 (ref)
				assert(v3, "No draft comparison is open").choose(p8)
			end,
			discard = clear,
			read = function()
				-- upvalues: Busy (ref), v3 (ref), p2 (copy), LabelResult1 (copy)
				return {
					busy = Busy,
					drafts = v3 ~= nil,
					status = p2.text(LabelResult1, "Text")
				}
			end,
			dispose = function()
				-- upvalues: Flag (ref), v3 (ref), p2 (copy), p4 (copy), Activated1 (copy), Activated (copy), Connection (ref), OwnResult (copy), DesignPrompt (copy)
				Flag = true
				
				if v3 then
					v3.dispose()
					v3 = nil
				end
				p2.set(p4.root, "Visible", true)
				Activated1:Disconnect()
				Activated:Disconnect()
				
				if Connection then
					Connection:Disconnect()
				end
				OwnResult()
				p2.destroy(DesignPrompt)
			end
		}
	end
}