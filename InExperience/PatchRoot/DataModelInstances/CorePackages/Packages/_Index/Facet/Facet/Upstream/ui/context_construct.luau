local _ = require("./types")
local TagModule = require("./tag")

return function(p1)
	-- upvalues: TagModule (copy)
	local Compose = p1.Compose
	local v1 = nil
	local Callback1 = nil
	local Callback = getmetatable
	local FormulaResult = Compose.formula(function()
		return nil
	end)
	local config = {
		[Callback(Compose.cell(nil))] = true,
		[Callback(Compose.sharedCell(nil))] = true,
		[Callback(FormulaResult)] = true
	}
	FormulaResult:dispose()
	
	local function _(p2)
		-- upvalues: v1 (ref)
		error(`Facet UI.{v1 or "control"}:{if p2 then ` option '{p1}'` else " a value"} is a readable from another Compose instance. ` .. "Facet cannot track it. Bind Facet to that Compose with Facet.bind(Compose, Roblox).", 0)
	end
	
	local function distance(Text: string, Text1: string)
		local t = {}
		
		for i = 0, #Text1 do
			t[i] = i
		end
		for i1 = 1, #Text do
			local config = { [0] = i1 }
			
			for i2 = 1, #Text1 do
				config[i2] = math.min(t[i2] + 1, config[i2 - 1] + 1, t[i2 - 1] + (if string.byte(Text, i1) == string.byte(Text1, i2) then 0 else 1))
			end
			t = config
		end
		return t[#Text1]
	end
	
	local function unknownOption(p3, List): string
		-- upvalues: v1 (ref), distance (copy)
		if p3 == "width" or p3 == "height" then
			return `Facet UI.{v1 or "control"}: unknown option '{p2}'. ` .. "Use native Size and AutomaticSize on this control, or size its layout container. " .. "Read Layout-options for leaf sizing."
		end
		local v2 = nil
		local v3 = 3
		
		for i in List do
			if i ~= "ref" then
				local DistanceResult = distance(p3, i)
				
				if DistanceResult < v3 or DistanceResult == v3 and v2 ~= nil and i < v2 then
					v2 = i
					v3 = DistanceResult
				end
			end
		end
		return `Facet UI.{v1 or "control"}: unknown option '{p2}'.{if v2 then ` Did you mean '{v15}'?` else ""}`
	end
	
	local self = setmetatable({}, { __mode = "k" })
	
	local function consumedFor(Key)
		-- upvalues: self (copy)
		local IsfrozenResult = Key ~= nil and table.isfrozen(Key)
		local SelfEntry = if IsfrozenResult then self[Key] else nil
		
		if SelfEntry then
			return SelfEntry
		end
		local config = { ref = true }
		local Key1 = Key or {}
		for i, value in Key1 do
			if type(i) == "number" then
				assert(type(value) == "string")
				config[value] = true
			elseif type(i) == "string" then
				config[i] = true
			end
		end
		if IsfrozenResult then
			self[Key] = config
		end
		return config
	end
	
	function p1.props(List2, p4, Tbl)
		-- upvalues: consumedFor (copy), unknownOption (copy)
		local Copy = if type(Tbl) == "table" then table.clone(Tbl) else {}
		local ConsumedForResult = consumedFor(p4)
		local List1 = nil
		
		for i, value in List2 do
			if type(i) == "number" then
				Copy[#Copy + 1] = value
			elseif type(i) ~= "string" or not ConsumedForResult[i] then
				if type(i) == "string" and string.match(i, "^[a-z]") then
					local List = List1 or {}
					List1 = List
					table.insert(List, i)
				end
				Copy[i] = value
			end
		end
		if List1 then
			table.sort(List1)
			local List3 = {}
			
			for _, value1 in List1 do
				table.insert(List3, (unknownOption(value1, ConsumedForResult)))
			end
			error(table.concat(List3, "\n"), 0)
		end
		return Copy
	end
	
	local _ = function()
		-- upvalues: p1 (copy)
		local BuildMode = p1.config.buildMode
		
		return if BuildMode then BuildMode.strict else p1.config.strictBuild ~= false
	end
	
	local function failedControl(p5, p6)
		-- upvalues: p1 (copy), TagModule (upval)
		local Segment = string.sub(string.gsub(tostring(p6), "^[%w%._]+:%d+: ", ""), 1, 400)
		
		if p1.config.onError then
			p1.config.onError(p6)
		elseif task and task.spawn then
			task.spawn(error, `Facet UI.{p5} failed to build and shows a placeholder: {Segment}`, 0)
		end
		local Types = p1.types
		local TextLabelResult = p1.Host.TextLabel({
			TextWrapped = true,
			BackgroundTransparency = 0,
			Name = `FacetFailed{p5}`,
			Text = `Facet UI.{p5} failed: {Segment}`,
			TextXAlignment = Types.Enum.TextXAlignment.Left,
			Size = Types.UDim2.new(1, 0, 0, 0),
			AutomaticSize = Types.Enum.AutomaticSize.Y
		})
		TagModule(TextLabelResult, "type-caption")
		TagModule(TextLabelResult, "role-destructive")
		TextLabelResult:SetAttribute("FacetError", Segment)
		
		return TextLabelResult
	end
	
	function p1.build(p5, p6, p7, Name)
		-- upvalues: v1 (ref), Compose (copy), config (copy), Callback (copy), p1 (copy), failedControl (copy), Callback1 (ref)
		if p7 ~= nil and type(p7) ~= "table" then
			error(`Facet UI.{p5}: expected a property table, got {typeof(p7)}`, 0)
		end
		local Tbl = p7 or {}
		
		if Name then
			Tbl = table.clone(Tbl)
			assert(Tbl.Name == nil, "Facet: supply either a constructor name or Name")
			Tbl.Name = Name
		end
		local v4 = v1
		v1 = p5
		
		if Compose.currentOwner() == nil then
			v1 = v4
			error(`Facet UI.{p5}: no owner from Facet's Compose is active. Build controls inside app.mount or runtime.mount. ` .. "If the runtime comes from another Compose instance, " .. "bind Facet to that instance with Facet.bind(Compose, Roblox).", 0)
		end
		for i, value in Tbl do
			if type(i) == "string" then
				if not Compose.isValue(value) then
					if type(value) == "table" and Callback(value) == nil then
						for _, value1 in value do
							if type(value1) ~= "table" or Compose.isValue(value1) then
								if Compose.isValue(value1) and not config[Callback(value1)] then
									error(`Facet UI.{v1 or "control"}:{if i then ` option '{i}'` else " a value"} is a readable from another Compose instance. ` .. "Facet cannot track it. Bind Facet to that Compose with Facet.bind(Compose, Roblox).", 0)
									continue
								end
								continue
							end
							for i1, value2 in value1 do
								if Compose.isValue(value2) and not config[Callback(value2)] then
									local Text: string = `{i}.{tostring(i1)}`
									error(`Facet UI.{v1 or "control"}:{if Text then ` option '{Text}'` else " a value"} is a readable from another Compose instance. ` .. "Facet cannot track it. Bind Facet to that Compose with Facet.bind(Compose, Roblox).", 0)
								end
							end
						end
					end
				elseif not config[Callback(value)] then
					error(`Facet UI.{v1 or "control"}:{if i then ` option '{i}'` else " a value"} is a readable from another Compose instance. ` .. "Facet cannot track it. Bind Facet to that Compose with Facet.bind(Compose, Roblox).", 0)
				end
			end
		end
		local Success, Result = pcall(p6, Tbl)
		v1 = v4
		
		if not Success then
			local BuildMode = p1.config.buildMode
			
			if if BuildMode then BuildMode.strict else p1.config.strictBuild ~= false then
				error(Result, 0)
			end
			Result = failedControl(p5, Result)
		end
		if Callback1 and (type(Result) == "userdata" or type(Result) == "table") then
			Callback1(Result)
		end
		if Tbl.ref then
			assert(type(Tbl.ref) == "function")
			Tbl.ref(Result)
		end
		return Result
	end
	
	function p1.construct(p8, p9)
		-- upvalues: p1 (copy)
		return function(Name, Name1)
			-- upvalues: p1 (upval), p8 (copy), p9 (copy)
			return if type(Name) == "string" then function(p10)
				-- upvalues: p1 (upval), p8 (upval), p9 (upval), Name (copy)
				return p1.build(p8, p9, p10, Name)
			end else p1.build(p8, p9, Name, Name1)
		end
	end
	
	p1.styled = TagModule
	
	return function(p8)
		-- upvalues: Callback1 (ref)
		Callback1 = p8
	end
end