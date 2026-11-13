local _ = require("./types")
local _ = require("./input_types")
local OverlayPlacementModule = require("./overlay_placement")
local self = setmetatable({}, { __mode = "k" })
local v1 = require("./freeze")({
	title = true,
	titleTone = true,
	body = true,
	shortcut = true,
	edge = true,
	align = true,
	rows = true,
	cost = true,
	cooldown = true,
	flavour = true
})

local function _(Text: string, p1)
	if Text ~= nil and (type(Text) ~= "string" or string.match(Text, "^%a[%w%-]*$") == nil) then
		error(`Facet UI.Button: help.{p1} must be a tone name such as "positive"`, 0)
	end
end

local HelpModule = {
	check = function(p1, List)
		-- upvalues: v1 (copy), OverlayPlacementModule (copy)
		if type(List) ~= "table" or p1.Compose.isValue(List) then return end
		for i in List do
			if type(i) ~= "string" or not v1[i] then
				error(`Facet UI.Button: unknown help option '{tostring(i)}'`, 0)
			end
		end
		local function _(Callback)
			-- upvalues: p1 (copy)
			return type(Callback) == "string" or (type(Callback) == "function" or p1.Compose.isValue(Callback))
		end
		
		local BodyFunction = List.body
		
		if type(BodyFunction) ~= "string" and (type(BodyFunction) ~= "function" and not p1.Compose.isValue(BodyFunction)) then
			error("Facet UI.Button: help.body must be a string or a bound string", 0)
		end
		if List.title ~= nil then
			local TitleFunction = List.title
			
			if type(TitleFunction) ~= "string" and (type(TitleFunction) ~= "function" and not p1.Compose.isValue(TitleFunction)) then
				error("Facet UI.Button: help.title must be a string or a bound string", 0)
			end
		end
		for _, value1 in { "cost", "cooldown", "flavour" } do
			local IsString = true
			
			if List[value1] ~= nil then
				local Callback = List[value1]
				IsString = type(Callback) == "string" or (type(Callback) == "function" or p1.Compose.isValue(Callback))
			end
			assert(IsString, `Facet UI.Button: help.{value1} must be a string or a bound string`)
		end
		if List.rows ~= nil then
			assert(type(List.rows) == "table", "Facet UI.Button: help.rows must be a list")
			
			for _, row in List.rows do
				assert(type(row) == "table", "Facet UI.Button: help rows require label and value strings")
				local LabelFunction = row.label
				local IsString = type(LabelFunction) == "string" or (type(LabelFunction) == "function" or p1.Compose.isValue(LabelFunction))
				
				if IsString then
					local ValueFunction = row.value
					IsString = type(ValueFunction) == "string" or (type(ValueFunction) == "function" or p1.Compose.isValue(ValueFunction))
				end
				assert(IsString, "Facet UI.Button: help rows require label and value strings")
				
				for i1 in row do
					if i1 ~= "label" and (i1 ~= "value" and i1 ~= "tone") then
						error(`Facet UI.Button: unknown help row option '{tostring(i1)}'`, 0)
					end
				end
				local Tone: string = row.tone
				
				if Tone ~= nil and (type(Tone) ~= "string" or string.match(Tone, "^%a[%w%-]*$") == nil) then
					error("Facet UI.Button: help.rows.tone must be a tone name such as \"positive\"", 0)
				end
			end
		end
		if List.body == "" and (type(List.title) ~= "string" or List.title == "") then
			error("Facet UI.Button: help.body may be empty only when help.title carries the words", 0)
		end
		if List.shortcut ~= nil then
			local Shortcut = List.shortcut
			local Flag: boolean = type(Shortcut) == "table" and #Shortcut > 0
			
			if Flag then
				for _, value2 in Shortcut do
					if type(value2) ~= "table" or #value2 == 0 then
						Flag = false
						break
					end
					for _, value in value2 do
						if type(value) ~= "string" or value == "" then
							Flag = false
						end
					end
				end
			end
			if not Flag then
				error("Facet UI.Button: help.shortcut must be a list of key chords such as { { \"Ctrl\", \"K\" } }", 0)
			end
		end
		local TitleTone: string = List.titleTone
		
		if TitleTone ~= nil and (type(TitleTone) ~= "string" or string.match(TitleTone, "^%a[%w%-]*$") == nil) then
			error("Facet UI.Button: help.titleTone must be a tone name such as \"positive\"", 0)
		end
		OverlayPlacementModule.assertEdge(List.edge, "UI.Button help")
		OverlayPlacementModule.assertAlign(List.align, "UI.Button help")
	end,
	register = function(p2, ShowHelp)
		p2.showHelp = ShowHelp
	end
}

function HelpModule.attach(p2, p3, p4, p5)
	-- upvalues: HelpModule (copy)
	HelpModule.check(p2, p4)
	local ShowHelpFunction: (any, any, any) -> () = p2.showHelp
	
	if ShowHelpFunction then
		ShowHelpFunction(p3, p4, p5)
	end
end

function HelpModule.hold(Key, p2)
	-- upvalues: self (copy)
	if p2 then
		self[Key] = true
		
		return
	else
		self[Key] = nil
	end
end

function HelpModule.consume(Key): boolean
	-- upvalues: self (copy)
	self[Key] = nil
	
	return self[Key] == true
end

return HelpModule