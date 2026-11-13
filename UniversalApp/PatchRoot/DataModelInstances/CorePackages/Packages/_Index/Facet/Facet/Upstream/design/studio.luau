local DesignModule = require("../vendor/compose/design")
local DesignEditorModule = require("../vendor/compose/design-editor")
local _ = require("./types")
local CoreModule = require("../vendor/compose/core")
local _ = require("../ui/control_types")
local _ = require("../ui/theme_types")

return function(Callback, p1, p2)
	-- upvalues: DesignModule (copy), CoreModule (copy), DesignEditorModule (copy)
	local Theme = if p1 and p1.theme then p1.theme else p2
	local t = {}
	
	for _, theme in Theme.style.themes do
		assert(theme.name ~= "" and not t[theme.name], "Theme names must be nonempty and unique")
		t[theme.name] = true
	end
	local Themes = {}
	
	if p1 and p1.themes then
		Themes = p1.themes
	elseif p1 and p1.theme then
		for _, theme1 in Theme.style.themes do
			table.insert(Themes, theme1.name)
		end
	else
		Themes = { "Light", "Dark" }
	end
	assert(#Themes > 0, "Workspace requires at least one theme")
	local List = {}
	local t1 = {}
	
	for _, theme2 in Themes do
		local Name = if type(theme2) == "string" then theme2 else theme2.name
		assert(Name ~= "" and not t1[Name], "Theme names must be nonempty and unique")
		t1[Name] = true
		
		if type(theme2) == "string" then
			assert(t[theme2], "Unknown workspace theme: " .. theme2)
			table.insert(List, { name = Name, theme = Theme, palette = theme2 })
		else
			table.insert(List, {
				name = Name,
				theme = theme2.theme,
				palette = theme2.theme.style.defaultTheme
			})
		end
	end
	local t2 = {}
	local Choices = {}
	local Samples = if p1 then p1.samples else {}
	for _, sample in Samples do
		assert(p1 and p1.registry[sample.design], "Unknown sample Design: " .. sample.design)
		assert(sample.name ~= "", "Sample requires a name")
		local Text = sample.design .. "/" .. sample.name
		assert(not t2[Text], "Duplicate Design sample: " .. Text)
		t2[Text] = sample
		table.insert(Choices, Text)
	end
	if p1 then
		if p1.resolution then
			assert(not p1.stages, "Use resolution or stages")
			
			for _, value2 in { p1.resolution.X, p1.resolution.Y } do
				assert(value2 > 0 and value2 < 1e999, "Resolution must be finite and positive")
			end
		end
		local TextSizes = p1.textSizes or { "Medium", "Large", "Larger", "Largest" }
		for _, value in TextSizes do
			assert(table.find({ "Medium", "Large", "Larger", "Largest" }, value), "Unknown workspace text size: " .. value)
		end
		if p1.stages then
			assert(#p1.stages > 0, "Workspace requires at least one stage")
			local t3 = {}
			
			for _, stage in p1.stages do
				assert(stage.id ~= "" and not t3[stage.id], "Stage ids must be nonempty and unique")
				t3[stage.id] = true
			end
		end
		for i in p1.registry do
			local v1 = false
			
			for _, value1 in t2 do
				v1 = v1 or value1.design == i
			end
			assert(v1, "Design requires a sample: " .. i)
		end
		assert(#Choices > 0, "Design workspace requires a registry and samples")
	end
	return {
		name = "Facet",
		edit = function(p3, Design, Link)
			-- upvalues: p1 (copy), Choices (copy), t2 (copy), Callback (copy), List (copy), DesignModule (upval), CoreModule (upval), DesignEditorModule (upval)
			assert(type(p3) == "table" or type(p3) == "userdata", "Design editor requires a host parent")
			local Initial = nil
			
			if p1 then
				for _, choice in Choices do
					if t2[choice].design == Design then
						Initial = choice
						break
					end
				end
				assert(Initial, "Unknown workspace Design: " .. Design)
			end
			local CallbackResult = Callback(List)
			local Callback1 = nil
			local Flag = false
			
			local function release()
				-- upvalues: Flag (ref), Callback1 (ref), CallbackResult (copy)
				if Flag then return end
				Flag = true
				local Success, Result = pcall(function()
					-- upvalues: Callback1 (upval)
					if Callback1 then
						Callback1()
					end
				end)
				
				if CallbackResult.dispose then
					CallbackResult.dispose()
				end
				if not Success then
					error(Result, 0)
				end
			end
			
			local Success, Result = pcall(function()
				-- upvalues: t2 (upval), DesignModule (upval), CallbackResult (copy), p1 (upval), Initial (ref), Design (copy), Choices (upval), Link (copy), CoreModule (upval), DesignEditorModule (upval), p3 (copy), release (copy)
				local function document(Initial)
					-- upvalues: t2 (upval), DesignModule (upval), CallbackResult (upval), p1 (upval)
					local Entry = t2[Initial]
					local NewResult = DesignModule.document.new(Entry.design, CallbackResult.library, Entry.design)
					NewResult.contract = assert(p1).registry[Entry.design].contract
					
					for _, input in NewResult.contract.inputs do
						NewResult.root.props[input.id] = { input = input.id }
					end
					return DesignModule.document.validate(NewResult, CallbackResult.library)
				end
				
				local function validate(p4)
					-- upvalues: t2 (upval), document (copy), DesignModule (upval), CallbackResult (upval)
					local Entry = t2[p4]
					local DocumentResult = document(p4)
					
					for i, prop in Entry.props do
						DocumentResult.root.props[i] = { literal = prop }
					end
					DesignModule.document.validate(DocumentResult, CallbackResult.library)
				end
				
				local DocumentResult = if Initial then document(Initial) else DesignModule.document.new(Design, CallbackResult.library, CallbackResult.root)
				for _, choice in Choices do
					validate(choice)
				end
				if Link then
					local ReadResult: string = Link.read()
					
					if string.match(ReadResult, "^%s*$") then
						Link.write(ReadResult, DesignModule.emit(DocumentResult, CallbackResult.library))
					end
				end
				local Copy = table.clone(CallbackResult.previews or {})
				local CellResult = CoreModule.cell(Initial or "")
				
				if Initial then
					table.insert(Copy, {
						name = "Sample",
						choices = Choices,
						initial = Initial,
						select = function(p5)
							-- upvalues: CellResult (copy)
							CellResult:set(p5)
						end
					})
				end
				return DesignEditorModule.create(CallbackResult.library, DocumentResult, p3, {
					frame = function(p5)
						-- upvalues: Initial (upval), CellResult (copy), t2 (upval), document (copy), CallbackResult (upval), DesignModule (upval)
						return {
							renderPreview = if Initial then function(p6, _, Callback)
								-- upvalues: CellResult (upval), t2 (upval), document (upval), CallbackResult (upval), p5 (copy), DesignModule (upval)
								local CallbackResult1 = Callback(CellResult)
								local Entry = t2[CallbackResult1]
								local DocumentResult = if Entry.design == p6.root.kind then p6 else document(CallbackResult1)
								local t4 = {}
								
								for i, prop in Entry.props do
									t4[i] = { literal = prop }
								end
								if Entry.bindings then
									for i1, value in Entry.bindings(CallbackResult.UI, p5) do
										assert(DesignModule.document.input(DocumentResult, i1), "Unknown sample binding: " .. i1)
										t4[i1] = value
									end
								end
								return DocumentResult, t4
							end else nil
						}
					end,
					runtime = CallbackResult.runtime,
					environment = CallbackResult.environment,
					devices = CallbackResult.devices or DesignEditorModule.devices.all,
					previews = Copy,
					capture = if p1 then p1.capture else nil,
					link = Link,
					onClose = release
				})
			end)
			
			if not Success then
				release()
				error(Result, 0)
			end
			Callback1 = Result.dispose
			Result.dispose = release
			
			return Result
		end
	}
end