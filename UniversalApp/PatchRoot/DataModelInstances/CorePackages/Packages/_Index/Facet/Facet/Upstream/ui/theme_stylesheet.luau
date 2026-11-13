local AmbientModule = require("./ambient")
local _ = require("../vendor/compose/core")
local _ = require("./theme_types")
local _ = require("./engine_types")
local AdaptiveModule = require("./adaptive")
local MotionModule = require("./motion")
local PreferredInputModule = require("./preferred_input")
local ThemeSupportModule = require("./theme_support")
local _ = require("./theme_rule_kit")
local ReadFunction = ThemeSupportModule.read
local TypesForFunction = ThemeSupportModule.typesFor
local SamePropertiesFunction = ThemeSupportModule.sameProperties
local t = {}
ThemeSupportModule.weakKeys(t)

local function tokenChanges(Tokens, Tokens1)
	-- upvalues: t (copy), ThemeSupportModule (copy)
	local Entry = t[Tokens]
	
	if Entry == nil then
		local t1 = {}
		ThemeSupportModule.weakKeys(t1)
		Entry = t1
		t[Tokens] = t1
	end
	local Entry1 = Entry[Tokens1]
	
	if Entry1 == nil then
		local List = {}
		
		for i, value in Tokens1 do
			if Tokens[i] ~= value then
				table.insert(List, i)
			end
		end
		Entry[Tokens1] = List
		Entry1 = List
	end
	return Entry1
end

local t1 = {}
ThemeSupportModule.weakKeys(t1)
local t2 = {}
ThemeSupportModule.weakKeys(t2)

local function _(Key)
	-- upvalues: t2 (copy), ThemeSupportModule (copy)
	local Entry = t2[Key]
	
	if Entry == nil then
		local t = {}
		ThemeSupportModule.weakKeys(t)
		Entry = t
		t2[Key] = t
	end
	return Entry
end

local function changesBetween(Key, Rules)
	-- upvalues: t2 (copy), ThemeSupportModule (copy)
	local Entry = t2[Key]
	
	if Entry == nil then
		local t = {}
		ThemeSupportModule.weakKeys(t)
		Entry = t
		t2[Key] = t
	end
	local Entry1 = Entry[Rules]
	
	if Entry1 ~= nil or #Key ~= #Rules then
		return Entry1
	end
	local List = {}
	
	for i, rule in Rules do
		local KeyEntry = Key[i]
		
		if KeyEntry.id ~= rule.id or KeyEntry.selector ~= rule.selector then
			return nil
		elseif KeyEntry.priority ~= rule.priority or KeyEntry.properties ~= rule.properties then
			table.insert(List, i)
		end
	end
	Entry[Rules] = List
	local Entry2 = t2[Rules]
	
	if Entry2 == nil then
		local t = {}
		ThemeSupportModule.weakKeys(t)
		Entry2 = t
		t2[Rules] = t
	end
	Entry2[Key] = List
	
	return List
end

local _ = function(Key)
	-- upvalues: t1 (copy)
	local Entry = t1[Key]
	
	if Entry == nil then
		local t = {}
		
		for _, value in Key do
			t[value.id] = value
		end
		t1[Key] = t
		Entry = t
	end
	return Entry
end

local t3 = {}
ThemeSupportModule.weakKeys(t3)
local config = {
	Quad = "Quad",
	Cubic = "Cubic",
	Quart = "Quart",
	Quint = "Quint",
	Sine = "Sine",
	Expo = "Exponential",
	Circ = "Circular",
	Back = "Back",
	Elastic = "Elastic",
	Bounce = "Bounce"
}

local _ = function(Text: string)
	-- upvalues: config (copy)
	if Text == "linear" then
		return "Linear", "Out"
	end
	local v1 = "Out"
	local Segment: string = Text
	
	if string.sub(Text, 1, 5) == "inOut" then
		v1 = "InOut"
		Segment = string.sub(Text, 6)
	elseif string.sub(Text, 1, 3) == "out" then
		v1 = "Out"
		Segment = string.sub(Text, 4)
	elseif string.sub(Text, 1, 2) == "in" then
		v1 = "In"
		Segment = string.sub(Text, 3)
	end
	return config[Segment] or "Quad", v1
end

local _ = function(p1): string
	return "FacetTextSize_" .. string.gsub(tostring(p1), "%.", "_")
end

local function sized(Rules)
	local Sizes = {}
	
	for _, rule in Rules do
		local TextSize = rule.properties.TextSize
		
		if type(TextSize) == "number" then
			local Text = "FacetTextSize_" .. string.gsub(tostring(TextSize), "%.", "_")
			Sizes[Text] = TextSize
			rule.properties.TextSize = "$" .. Text
		end
	end
	return { rules = Rules, sizes = Sizes }
end

local self = setmetatable({}, { __mode = "k" })
local self1 = setmetatable({}, { __mode = "k" })
local self2 = setmetatable({}, { __mode = "k" })
local self3 = setmetatable({}, { __mode = "k" })
local self4 = setmetatable({}, { __mode = "k" })

return function(p1, Callback1, Callback2, p2, p3, p4, p5)
	-- upvalues: TypesForFunction (copy), MotionModule (copy), ReadFunction (copy), AmbientModule (copy), PreferredInputModule (copy), AdaptiveModule (copy), self4 (copy), config (copy), ThemeSupportModule (copy), sized (copy), self2 (copy), self3 (copy), SamePropertiesFunction (copy), t1 (copy), t3 (copy), changesBetween (copy), tokenChanges (copy), self (copy), self1 (copy)
	local P12 = p5 or {}
	local TypesForResult = TypesForFunction(P12)
	local Constructors = p3.constructors
	assert(P12.reducedMotion == nil, "Facet createStyleSheet: the reducedMotion option is gone; set motionLevel = \"normal\", \"limited\" or \"none\"")
	
	local function snaps(p6): boolean
		-- upvalues: P12 (copy), MotionModule (upval), p3 (copy), ReadFunction (upval)
		local PublishedResult = if P12.motionLevel == nil then MotionModule.published(p3) else { P12.motionLevel }
		for _, value in PublishedResult do
			local ReadResult = ReadFunction(value, p6)
			
			if ReadResult ~= nil and MotionModule.resolve(ReadResult, false) == "none" then
				return true
			end
		end
		return false
	end
	
	local FacetTextPreference = p3.FacetTextPreference
	local v1 = nil
	
	if FacetTextPreference ~= nil then
		local AmbientModuleResult = AmbientModule()
		local GuiService = AmbientModuleResult and AmbientModuleResult:GetService("GuiService")
		
		if GuiService then
			local CellResult = p2.cell(GuiService.PreferredTextSize)
			v1 = CellResult
			local Connection = GuiService:GetPropertyChangedSignal("PreferredTextSize"):Connect(function()
				-- upvalues: CellResult (copy), GuiService (copy)
				CellResult:set(GuiService.PreferredTextSize)
			end)
			p2.cleanup(function()
				-- upvalues: Connection (copy)
				Connection:Disconnect()
			end)
		end
	end
	local function _(p7)
		return ({ Medium = 0, Large = 1, Larger = 2, Largest = 3 })[if typeof(p7) == "EnumItem" then p7.Name else p7] or 0
	end
	
	local PreferredTransparency = P12.preferredTransparency
	
	if PreferredTransparency == nil then
		local AmbientModuleResult = AmbientModule()
		local GuiService1 = AmbientModuleResult and AmbientModuleResult:GetService("GuiService")
		
		if GuiService1 then
			local CellResult1 = p2.cell(GuiService1.PreferredTransparency)
			PreferredTransparency = CellResult1
			local Connection1 = GuiService1:GetPropertyChangedSignal("PreferredTransparency"):Connect(function()
				-- upvalues: CellResult1 (copy), GuiService1 (copy)
				CellResult1:set(GuiService1.PreferredTransparency)
			end)
			p2.cleanup(function()
				-- upvalues: Connection1 (copy)
				Connection1:Disconnect()
			end)
		end
	end
	local v2 = nil
	local AmbientModuleResult = AmbientModule()
	local UserInputService = AmbientModuleResult and AmbientModuleResult:GetService("UserInputService")
	
	if UserInputService then
		local PreferredInput = UserInputService.PreferredInput
		local Callback: (() -> ())? = nil
		local Callback3 = nil
		
		local function pointing(): boolean
			-- upvalues: UserInputService (copy), PreferredInputModule (upval), TypesForResult (copy), Callback (ref), Callback3 (ref), PreferredInput (ref)
			local PreferredInput1 = UserInputService.PreferredInput
			
			if PreferredInputModule.withheld(UserInputService, PreferredInput1, TypesForResult.Enum.PreferredInput.KeyboardAndMouse) then
				Callback = Callback or PreferredInputModule.nudges(UserInputService, TypesForResult.Enum, Callback3)
			else
				PreferredInput = PreferredInput1
				
				if Callback then
					Callback()
					Callback = nil
				end
			end
			return PreferredInput ~= TypesForResult.Enum.PreferredInput.Touch
		end
		
		local CellResult2 = p2.cell(false)
		v2 = CellResult2
		
		Callback3 = function()
			-- upvalues: CellResult2 (copy), pointing (copy)
			CellResult2:set((pointing()))
		end
		
		Callback3()
		local Connection2 = UserInputService:GetPropertyChangedSignal("PreferredInput"):Connect(Callback3)
		p2.cleanup(function()
			-- upvalues: Connection2 (copy), Callback (ref)
			Connection2:Disconnect()
			
			if Callback then
				Callback()
			end
		end)
	end
	local TenFoot = P12.tenFoot
	
	if TenFoot == nil then
		local AmbientModuleResult1 = AmbientModule()
		local GuiService2 = AmbientModuleResult1 and AmbientModuleResult1:GetService("GuiService")
		local UserInputService1 = AmbientModuleResult1 and AmbientModuleResult1:GetService("UserInputService")
		
		if GuiService2 and UserInputService1 then
			local IsTenFootInterface = false
			pcall(function()
				-- upvalues: IsTenFootInterface (ref), GuiService2 (copy)
				IsTenFootInterface = GuiService2:IsTenFootInterface()
			end)
			
			local function sample()
				-- upvalues: AdaptiveModule (upval), IsTenFootInterface (ref), GuiService2 (copy), UserInputService1 (copy)
				return AdaptiveModule.isTenFoot({
					tenFootInterface = IsTenFootInterface,
					displaySize = if typeof(GuiService2.ViewportDisplaySize) == "EnumItem" then GuiService2.ViewportDisplaySize.Name else nil,
					mouse = UserInputService1.MouseEnabled,
					touch = UserInputService1.TouchEnabled
				})
			end
			
			local CellResult3 = p2.cell(sample())
			TenFoot = CellResult3
			local Connections = {
				GuiService2:GetPropertyChangedSignal("ViewportDisplaySize"):Connect(function()
					-- upvalues: CellResult3 (copy), sample (copy)
					CellResult3:set(sample())
				end),
				UserInputService1:GetPropertyChangedSignal("MouseEnabled"):Connect(function()
					-- upvalues: CellResult3 (copy), sample (copy)
					CellResult3:set(sample())
				end),
				UserInputService1:GetPropertyChangedSignal("TouchEnabled"):Connect(function()
					-- upvalues: CellResult3 (copy), sample (copy)
					CellResult3:set(sample())
				end)
			}
			p2.cleanup(function()
				-- upvalues: Connections (copy)
				for _, connection in Connections do
					connection:Disconnect()
				end
			end)
		end
	end
	local self5 = setmetatable({}, { __mode = "k" })
	
	local function withoutHover(Rules)
		-- upvalues: self5 (copy)
		local SelfEntry = self5[Rules]
		
		if SelfEntry then
			return SelfEntry
		end
		local List = {}
		
		for _, rule in Rules do
			if not string.find(rule.selector, ":Hover", 1, true) then
				table.insert(List, rule)
			end
		end
		self5[Rules] = List
		
		return List
	end
	
	local _ = function(p8): number
		-- upvalues: ReadFunction (upval), PreferredTransparency (ref)
		local ReadResult: number = ReadFunction(PreferredTransparency, p8)
		
		return if type(ReadResult) == "number" and ReadResult == ReadResult then math.clamp(ReadResult, 0, 1) else 1
	end
	
	local SelfEntry = self4[TypesForResult]
	
	if SelfEntry == nil then
		SelfEntry = {
			defaults = {},
			packages = setmetatable({}, { __mode = "k" })
		}
		self4[TypesForResult] = SelfEntry
	end
	local Defaults = SelfEntry.defaults
	
	local function timingFor(Package, p8, Enabled, p9)
		-- upvalues: p1 (copy), config (upval), Defaults (copy), TypesForResult (copy)
		local Motion = Package.metrics.motion
		local Normal = if Motion and Motion.normal then Motion.normal else p1.metrics.motion.normal
		local Paint = Motion and Motion.styles and Motion.styles.paint or assert(p1.metrics.motion.styles).paint
		local v3 = "Out"
		local RegionPop = nil
		
		if p8 == "instant" or p9 or Enabled == false then
			RegionPop = 0
		elseif p8 == "pop" then
			RegionPop = (Motion and Motion.durations or {}).regionPop or assert(p1.metrics.motion.durations).regionPop
			local Present = (Motion and Motion.easing or {}).present or assert(p1.metrics.motion.easing).present
			local v4 = nil
			local v5 = nil
			
			if Present == "linear" then
				v4 = "Linear"
				v5 = "Out"
			else
				local v6 = "Out"
				local Segment: string = Present
				
				if string.sub(Present, 1, 5) == "inOut" then
					v6 = "InOut"
					Segment = string.sub(Present, 6)
				elseif string.sub(Present, 1, 3) == "out" then
					v6 = "Out"
					Segment = string.sub(Present, 4)
				elseif string.sub(Present, 1, 2) == "in" then
					v6 = "In"
					Segment = string.sub(Present, 3)
				end
				v4 = config[Segment] or "Quad"
				v5 = v6
			end
			Paint = v4
			v3 = v5
		else
			if Enabled ~= nil then
				return Enabled
			end
			if p8 == "normal" then
				RegionPop = Normal
			else
				local Press = if p8 == "press" then p1.metrics.motion.press else p1.metrics.motion.hover
				RegionPop = math.min(assert((if Motion then if p8 == "press" then Motion.press else Motion.hover else nil) or Press), Normal)
			end
		end
		local Text: string = `{RegionPop}|{Paint}|{v3}`
		local Default = Defaults[Text]
		
		if Default then
			return Default
		else
			local NewResult = TypesForResult.TweenInfo.new(RegionPop, assert(TypesForResult.Enum.EasingStyle:FromName(Paint)), assert(TypesForResult.Enum.EasingDirection:FromName(v3)))
			Defaults[Text] = NewResult
			
			return NewResult
		end
	end
	
	local function stateOf(Text: string): string
		return if string.find(Text, ".facet-region-pop#Rest", 1, true) then "instant" elseif string.find(Text, ".facet-region-pop", 1, true) then "pop" elseif string.find(Text, ":Press", 1, true) then "press" elseif string.find(Text, ":Hover", 1, true) then "hover" else "normal"
	end
	
	local CollectionService = P12.collectionService
	
	if CollectionService == nil then
		local AmbientModuleResult2 = AmbientModule()
		CollectionService = AmbientModuleResult2 and AmbientModuleResult2:GetService("CollectionService")
	end
	local t = {}
	local Tbl = {}
	local CellResult4 = p2.cell(0)
	local t4 = {}
	
	local function classesIn(Text: string)
		-- upvalues: t4 (copy)
		local Entry = t4[Text]
		
		if Entry then
			return Entry
		end
		local List = {}
		
		for _, value in string.split(Text, ",") do
			local List1 = {}
			
			for i in string.gmatch(value, "%.([%w_%-]+)") do
				table.insert(List1, i)
			end
			table.insert(List, List1)
		end
		t4[Text] = List
		
		return List
	end
	
	local function inUse(CollectionService: CollectionService, Tag): boolean
		-- upvalues: t (copy), Tbl (copy), CellResult4 (copy)
		if t[Tag] then
			return true
		end
		if not Tbl[Tag] then
			if #CollectionService:GetTagged(Tag) > 0 then
				t[Tag] = true
				
				return true
			end
			Tbl[Tag] = CollectionService:GetInstanceAddedSignal(Tag):Connect(function()
				-- upvalues: Tbl (upval), Tag (copy), t (upval), CellResult4 (upval)
				local Entry = Tbl[Tag]
				
				if Entry and not t[Tag] then
					t[Tag] = true
					Entry:Disconnect()
					CellResult4:set(CellResult4:peek() + 1)
				end
			end)
		end
		return false
	end
	
	local function wanted(Selector): boolean
		-- upvalues: CollectionService (ref), classesIn (copy), inUse (copy)
		local CollectionService1 = CollectionService
		
		if CollectionService1 == nil then
			return true
		end
		local Flag = nil
		for _, value in classesIn(Selector) do
			Flag = true
			
			for _, value1 in value do
				if not inUse(CollectionService1, value1) then
					Flag = false
					break
				end
			end
			if Flag then
				return true
			end
		end
		return false
	end
	
	p2.cleanup(function()
		-- upvalues: Tbl (copy)
		for _, Connection in Tbl do
			Connection:Disconnect()
		end
		table.clear(Tbl)
	end)
	local t5 = {}
	
	local function compiledRules(TenFoot, p8)
		-- upvalues: ThemeSupportModule (upval), sized (upval), Callback1 (copy), TypesForResult (copy), self2 (upval), self3 (upval), SamePropertiesFunction (upval), t1 (upval), t3 (upval), changesBetween (upval), tokenChanges (upval)
		if not ThemeSupportModule.sealed(TenFoot) then
			return (sized(Callback1(TenFoot, p8, TypesForResult)))
		end
		local SelfEntry = self2[TypesForResult]
		
		if SelfEntry == nil then
			local t = {}
			ThemeSupportModule.weakKeys(t)
			SelfEntry = t
			self2[TypesForResult] = SelfEntry
		end
		local SelfEntry1 = SelfEntry[TenFoot]
		
		if SelfEntry1 == nil then
			SelfEntry1 = {}
			SelfEntry[TenFoot] = SelfEntry1
		end
		local P24 = p8 or ""
		local SelfEntry2 = SelfEntry1[P24]
		
		if SelfEntry2 then
			return SelfEntry2
		end
		local SizedResult = sized(Callback1(TenFoot, p8, TypesForResult))
		local Rules = SizedResult.rules
		local SelfEntry3 = self3[TypesForResult]
		
		if SelfEntry3 == nil then
			SelfEntry3 = {}
			self3[TypesForResult] = SelfEntry3
		end
		for _, rule in Rules do
			local SelfEntry21 = SelfEntry3[rule.id]
			
			if SelfEntry21 and SamePropertiesFunction(SelfEntry21, rule.properties) then
				rule.properties = SelfEntry21
			else
				SelfEntry3[rule.id] = rule.properties
			end
		end
		SelfEntry1[P24] = SizedResult
		
		if t1[Rules] == nil then
			local t = {}
			
			for _, rule1 in Rules do
				t[rule1.id] = rule1
			end
			t1[Rules] = t
		end
		local Entry = t3[TypesForResult]
		
		if Entry ~= nil then
			changesBetween(Entry, Rules)
			local Tokens = Entry[1] and Entry[1].tokens
			local Tokens1 = Rules[1] and Rules[1].tokens
			
			if Tokens and Tokens1 then
				tokenChanges(Tokens, Tokens1)
				tokenChanges(Tokens1, Tokens)
			end
		end
		t3[TypesForResult] = Rules
		
		return SizedResult
	end
	
	local self6 = setmetatable({}, { __mode = "k" })
	
	local function withPreference(Key, Preference: number)
		-- upvalues: self6 (copy)
		local BackgroundTransparency: number = Key.properties.BackgroundTransparency
		
		if Preference >= 1 or Key.selector ~= ".facet-scrim" and Key.selector ~= ".facet-scrim.facet-radial-scrim" or (type(BackgroundTransparency) ~= "number" or BackgroundTransparency <= 0 or BackgroundTransparency >= 1) then
			return Key
		end
		local SelfEntry = self6[Key]
		
		if SelfEntry == nil or SelfEntry.preference ~= Preference then
			local Copy = table.clone(Key.properties)
			Copy.BackgroundTransparency = BackgroundTransparency * Preference
			SelfEntry = { preference = Preference, properties = Copy }
			self6[Key] = SelfEntry
		end
		return {
			id = Key.id,
			selector = Key.selector,
			priority = Key.priority,
			properties = SelfEntry.properties
		}
	end
	
	local CellResult5 = p2.cell({})
	local config1 = {
		normal = "FacetMotionNormal",
		press = "FacetMotionPress",
		hover = "FacetMotionHover",
		pop = "FacetMotionRegionPop",
		instant = "FacetMotionInstant"
	}
	local t6 = {}
	
	local function transitionsFor(Properties, Timing)
		-- upvalues: self (upval)
		local SelfEntry = self[Properties]
		
		if SelfEntry == nil then
			local self1 = setmetatable({}, { __mode = "k" })
			SelfEntry = self1
			self[Properties] = self1
		end
		local SelfEntry1 = SelfEntry[Timing]
		
		if SelfEntry1 == nil then
			local t = {}
			local IsFacetMotionRegionPop: boolean = Timing == "FacetMotionRegionPop" or Timing == "FacetMotionInstant"
			for i, property in Properties do
				if typeof(property) == "Color3" or type(property) == "string" and string.sub(property, 1, 12) == "$FacetColor_" or (string.find(i, "Transparency$") or IsFacetMotionRegionPop and i == "Scale") then
					t[i] = "$" .. Timing
				end
			end
			SelfEntry[Timing] = t
			SelfEntry1 = t
		end
		return SelfEntry1
	end
	
	local function sameRuleProperties(Properties, Properties1)
		-- upvalues: self1 (upval), SamePropertiesFunction (upval)
		local SelfEntry = self1[Properties]
		
		if SelfEntry == nil then
			SelfEntry = setmetatable({}, { __mode = "k" })
			self1[Properties] = SelfEntry
		end
		local SelfEntry1 = SelfEntry[Properties1]
		
		if SelfEntry1 == nil then
			SelfEntry1 = SamePropertiesFunction(Properties, Properties1)
			SelfEntry[Properties1] = SelfEntry1
		end
		return SelfEntry1
	end
	
	local function apply(p9, p10)
		-- upvalues: sameRuleProperties (copy), transitionsFor (copy), SamePropertiesFunction (upval)
		if p9.priority ~= p10.priority then
			p9.node.Priority = p10.priority
			p9.priority = p10.priority
		end
		local Properties = p10.properties
		
		if p9.properties and (p9.properties == Properties or sameRuleProperties(p9.properties, Properties)) then return end
		local TransitionsForResult = transitionsFor(Properties, p9.timing)
		local Transitions = p9.transitions
		
		if Transitions ~= TransitionsForResult and (Transitions == nil or not SamePropertiesFunction(Transitions, TransitionsForResult)) then
			p9.node:SetPropertyTransitions(TransitionsForResult)
			p9.transitions = TransitionsForResult
		end
		p9.node:SetProperties(Properties)
		p9.properties = Properties
	end
	
	local t7 = {}
	local v3 = nil
	local Largests = {}
	local t8 = {}
	ThemeSupportModule.weakKeys(t8)
	local Packages = SelfEntry.packages
	local Key = nil
	local v4 = 0
	local v5 = nil
	local self7 = setmetatable({}, { __mode = "k" })
	local Object = Constructors.StyleSheet(P12.name or "FacetTheme")({
		p2.keyed({
			from = CellResult5,
			render = function(p9)
				-- upvalues: t5 (ref), Constructors (copy), config1 (copy), stateOf (copy), t6 (copy), v5 (ref), apply (copy), p2 (copy)
				local PeekResult = p9:peek()
				local Entry = t5[PeekResult]
				local StyleRuleResult = Constructors.StyleRule({
					Name = Entry.id,
					Selector = Entry.selector,
					Priority = Entry.priority
				})
				local config = {
					node = StyleRuleResult,
					priority = Entry.priority,
					timing = config1[stateOf(Entry.selector)]
				}
				t6[PeekResult] = config
				local v6 = v5
				
				if v6 == nil or v6[PeekResult] or not task then
					apply(config, Entry)
				else
					StyleRuleResult:SetProperties(Entry.properties)
					task.defer(function()
						-- upvalues: t6 (upval), PeekResult (copy), config (copy), apply (upval), t5 (upval), Entry (copy)
						if t6[PeekResult] == config then
							apply(config, t5[PeekResult] or Entry)
						end
					end)
				end
				p2.cleanup(function()
					-- upvalues: t6 (upval), PeekResult (copy), config (copy)
					if t6[PeekResult] == config then
						t6[PeekResult] = nil
					end
				end)
				
				return StyleRuleResult
			end
		})
	})
	local FormulaResult = p2.formula(function(p9)
		-- upvalues: ReadFunction (upval), p4 (copy), p1 (copy), TenFoot (ref), Callback2 (copy), compiledRules (copy), P12 (copy), v2 (ref), withoutHover (copy)
		local ReadResult = ReadFunction(p4, p9) or p1
		local TenFoot1 = if ReadFunction(TenFoot, p9) == true then Callback2(ReadResult, "ten-foot") else ReadResult
		local CompiledRulesResult = compiledRules(TenFoot1, ReadFunction(P12.theme, p9))
		local Rules = CompiledRulesResult.rules
		local Tokens = Rules[1].tokens or {}
		local ReadResult1 = ReadFunction(P12.hover, p9)
		
		if ReadResult1 == nil then
			ReadResult1 = ReadFunction(v2, p9)
		end
		return {
			package = TenFoot1,
			rules = if ReadResult1 == false then withoutHover(Rules) else Rules,
			tokens = Tokens,
			sizes = CompiledRulesResult.sizes
		}
	end)
	p2.watch(function(Callback)
		-- upvalues: ReadFunction (upval), p4 (copy), self7 (copy), P12 (copy), AmbientModule (upval), FormulaResult (copy), snaps (copy), ThemeSupportModule (upval), Packages (copy), t8 (copy), config1 (copy), timingFor (copy), t7 (copy), Object (copy), v3 (ref), tokenChanges (upval), PreferredTransparency (ref), p1 (copy), FacetTextPreference (copy), v1 (ref), Largests (copy), CellResult4 (copy), Key (ref), v4 (ref), changesBetween (upval), t6 (copy), apply (copy), t5 (ref), t1 (upval), CellResult5 (copy), withPreference (copy), wanted (copy), v5 (ref)
		local ReadResult = ReadFunction(p4, Callback)
		
		if ReadResult and not self7[ReadResult] then
			self7[ReadResult] = true
			local Contents = {}
			local Iterator = pairs
			local Assets = ReadResult.assets or {}
			for _, value in Iterator(Assets) do
				local Content = value.content or value.contentId
				
				if type(Content) == "string" and Content ~= "" and value.preload ~= "lazy" then
					table.insert(Contents, Content)
				end
			end
			local ContentProvider = P12.contentProvider
			
			if ContentProvider == nil and #Contents > 0 then
				local AmbientModuleResult = AmbientModule()
				
				if AmbientModuleResult then
					ContentProvider = AmbientModuleResult:GetService("ContentProvider")
				end
			end
			if ContentProvider and #Contents > 0 then
				local ContentProvider1 = ContentProvider
				
				if task then
					task.spawn(ContentProvider1.PreloadAsync, ContentProvider1, Contents)
				else
					ContentProvider1:PreloadAsync(Contents)
				end
			end
		end
		local CallbackResult = Callback(FormulaResult)
		local Package = CallbackResult.package
		local Rules = CallbackResult.rules
		local Tokens = CallbackResult.tokens
		local Sizes = CallbackResult.sizes
		local ReadResult1 = ReadFunction(P12.transition, Callback)
		local SnapsResult = snaps(Callback)
		local Packages1 = if ThemeSupportModule.sealed(Package) then Packages else t8
		local Package1 = if ReadResult1 == nil then Packages1[Package] else nil
		local PackageEntry = if Package1 then Package1[SnapsResult] else nil
		
		if PackageEntry == nil then
			local t = {}
			
			for i, value1 in config1 do
				t[value1] = timingFor(Package, i, ReadResult1, SnapsResult)
			end
			PackageEntry = t
			
			if ReadResult1 == nil then
				local Package1_1 = Package1 or {}
				Package1_1[SnapsResult] = t
				Packages1[Package] = Package1_1
			end
		end
		for AttributeName, value2 in assert(PackageEntry) do
			if not rawequal(t7[AttributeName], value2) and t7[AttributeName] ~= value2 then
				t7[AttributeName] = value2
				Object:SetAttribute(AttributeName, value2)
			end
		end
		local Tokens1 = v3
		
		if Tokens1 == nil then
			for AttributeName1, token in Tokens do
				Object:SetAttribute(AttributeName1, token)
			end
		elseif Tokens1 ~= Tokens then
			for _, AttributeName2 in tokenChanges(Tokens1, Tokens) do
				Object:SetAttribute(AttributeName2, Tokens[AttributeName2])
			end
		end
		v3 = Tokens
		local ReadResult2: number = ReadFunction(PreferredTransparency, Callback)
		local ClampedValue: number = if type(ReadResult2) == "number" and ReadResult2 == ReadResult2 then math.clamp(ReadResult2, 0, 1) else 1
		local Typography = Package.metrics.controls.typography or p1.metrics.controls.typography
		local ReadResult3 = ReadFunction(FacetTextPreference, Callback)
		local ScaledPreferredSizeStep = nil
		
		if ReadResult3 == nil then
			ScaledPreferredSizeStep = 0
		else
			local ReadResult21 = ReadFunction(v1, Callback)
			ScaledPreferredSizeStep = ((({ Medium = 0, Large = 1, Larger = 2, Largest = 3 })[if typeof(ReadResult3) == "EnumItem" then ReadResult3.Name else ReadResult3] or 0) - (({ Medium = 0, Large = 1, Larger = 2, Largest = 3 })[if typeof(ReadResult21) == "EnumItem" then ReadResult21.Name else ReadResult21] or 0)) * Typography.preferredSizeStep
		end
		for AttributeName3, size in Sizes do
			local Largest = math.max(1, size + ScaledPreferredSizeStep)
			
			if Largests[AttributeName3] ~= Largest then
				Largests[AttributeName3] = Largest
				Object:SetAttribute(AttributeName3, Largest)
			end
		end
		local CallbackResult1 = Callback(CellResult4)
		local IsClampedValueAbove = ClampedValue >= 1
		
		if IsClampedValueAbove and Key == Rules and CallbackResult1 == v4 then return end
		local ChangesBetweenResult = if IsClampedValueAbove and Key ~= nil and CallbackResult1 == v4 then changesBetween(Key, Rules) else nil
		
		if ChangesBetweenResult then
			for _, value3 in ChangesBetweenResult do
				local Rule = Rules[value3]
				local Entry = t6[Rule.id]
				
				if Entry then
					apply(Entry, Rule)
				end
			end
			local Entry = t1[Rules]
			
			if Entry == nil then
				local t = {}
				
				for _, rule in Rules do
					t[rule.id] = rule
				end
				t1[Rules] = t
				Entry = t
			end
			t5 = Entry
			Key = Rules
			
			return
		else
			local PeekResult = CellResult5:peek()
			local Ids = {}
			t5 = {}
			
			for _, rule1 in Rules do
				local v6 = rule1
				
				if ClampedValue < 1 then
					v6 = withPreference(v6, ClampedValue)
				end
				t5[v6.id] = v6
				
				if wanted(v6.selector) then
					table.insert(Ids, v6.id)
					local Entry = t6[v6.id]
					
					if Entry then
						apply(Entry, v6)
					end
				end
			end
			local Flag = #PeekResult ~= #Ids
			
			if not Flag then
				for i1, id in Ids do
					if PeekResult[i1] ~= id then
						Flag = true
						break
					end
				end
			end
			if v5 == nil then
				local t = {}
				
				for _, id1 in Ids do
					t[id1] = true
				end
				v5 = t
			end
			if Flag then
				CellResult5:set(Ids)
			end
			Key = if IsClampedValueAbove then Rules else nil
			v4 = CallbackResult1
			
			if IsClampedValueAbove then
				t1[Rules] = t5
			end
		end
	end)
	
	for _, AttributeName in config1 do
		local Connection3 = Object:GetAttributeChangedSignal(AttributeName):Connect(function()
			-- upvalues: t7 (copy), AttributeName (copy), Object (copy)
			local Entry = t7[AttributeName]
			
			if Entry ~= nil and Object:GetAttribute(AttributeName) ~= Entry then
				Object:SetAttribute(AttributeName, Entry)
			end
		end)
		p2.cleanup(function()
			-- upvalues: Connection3 (copy)
			Connection3:Disconnect()
		end)
	end
	return Object
end