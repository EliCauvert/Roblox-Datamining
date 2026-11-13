local LayoutKitModule = require("./layout_kit")
local _ = require("./types")
local _ = require("./engine_types")
local _ = require("./media_types")
local _ = require("./theme_types")
local IconsModule = require("./icons")
local _ = require("../vendor/compose/core")
local ThemesModule = require("./themes")
local HelpModule = require("./help")
local TextRevealModule = require("./text_reveal")
local _ = require("./control_types")
local _ = require("./media_props")
local _ = require("./media_shared")
local TextChangesModule = require("./text_changes")
local TextMeasureModule = require("./text_measure")

return function(p1, p2, p3)
	-- upvalues: ThemesModule (copy), LayoutKitModule (copy), TextMeasureModule (copy), TextChangesModule (copy), HelpModule (copy), TextRevealModule (copy), IconsModule (copy)
	local Host = p1.Host
	local Runtime = p1.runtime
	local Compose = p1.Compose
	local ThemesModuleResult = ThemesModule(Compose)
	local OfResult = LayoutKitModule.of(p1)
	local Types = p1.types
	local ReadFunction = p1.read
	local TypesEnum = Types.Enum
	local TypesUDim2 = Types.UDim2
	local TypesUDim = Types.UDim
	local MetricFunction = p1.metric
	local BindFunction = p3.bind
	
	local function middle(Label, Text: string, p4: number): string
		local function _(Text): boolean
			-- upvalues: Label (copy), p4 (copy)
			Label.Text = Text
			
			return Label.TextBounds.X <= p4
		end
		
		if Text ~= "" and p4 > 0 then
			Label.Text = Text
			
			if p4 < Label.TextBounds.X then
				local List = {}
				
				for i, _ in utf8.codes(Text) do
					table.insert(List, i)
				end
				local CountList = #List
				
				local _ = function(p5: number): string
					-- upvalues: List (copy), Text (copy), CountList (copy)
					if p5 <= 0 then
						return "…"
					else
						local Ceiled = math.ceil(p5 / 2)
						local v1 = p5 - Ceiled
						
						return string.sub(Text, 1, if List[Ceiled + 1] == nil then #Text else List[Ceiled + 1] - 1) .. "…" .. (if v1 > 0 then string.sub(Text, List[CountList - v1 + 1]) else "")
					end
				end
				
				local v1 = 0
				local CountListDelta = CountList - 1
				local v2 = 0
				while v1 <= CountListDelta do
					local CountListDeltaRatio = (v1 + CountListDelta) // 2
					local Text1 = nil
					
					if CountListDeltaRatio <= 0 then
						Text1 = "…"
					else
						local Ceiled = math.ceil(CountListDeltaRatio / 2)
						local CountListDeltaRatioDelta = CountListDeltaRatio - Ceiled
						Text1 = string.sub(Text, 1, if List[Ceiled + 1] == nil then #Text else List[Ceiled + 1] - 1) .. "…" .. (if CountListDeltaRatioDelta > 0 then string.sub(Text, List[CountList - CountListDeltaRatioDelta + 1]) else "")
					end
					Label.Text = Text1
					
					if p4 >= Label.TextBounds.X then
						v2 = CountListDeltaRatio
						v1 = CountListDeltaRatio + 1
					else
						CountListDelta = CountListDeltaRatio - 1
					end
				end
				if v2 <= 0 then
					return "…"
				else
					local Ceiled = math.ceil(v2 / 2)
					local v3 = v2 - Ceiled
					
					return string.sub(Text, 1, if List[Ceiled + 1] == nil then #Text else List[Ceiled + 1] - 1) .. "…" .. (if v3 > 0 then string.sub(Text, List[CountList - v3 + 1]) else "")
				end
			end
		end
		return Text
	end
	
	local function fitOf(TextSize)
		-- upvalues: ThemesModuleResult (copy)
		if TextSize == nil then
			return nil
		end
		if TextSize == "fit" then
			return {}
		end
		assert(type(TextSize) == "table" and type(TextSize.fit) == "table", "Facet Text textSize must be a size, a type role, \"fit\" or { fit = { cap = size, floor = size } }")
		local Fit = TextSize.fit
		assert(type(Fit) == "table", "Facet Text textSize must be a size, a type role, \"fit\" or { fit = { cap = size, floor = size } }")
		
		for i in Fit do
			assert(i == "cap" or i == "floor", "Facet Text textSize fit takes only cap and floor")
		end
		for _, value in { Fit.cap, Fit.floor } do
			assert(value == nil or (type(value) == "number" and value > 0 or type(value) == "string" and table.find(ThemesModuleResult.TYPE_ROLES, value) ~= nil), "Facet Text textSize fit cap and floor must be a positive size or a type role")
		end
		return Fit
	end
	
	local Frozen = table.freeze({
		"text", "textRole", "role", "truncate", "textSize", "textAlign", "wrap",
		"rich", "direction", "tint", "lines", "disclose", "reveal"
	})
	local config = {
		start = TypesEnum.TextXAlignment.Left,
		center = TypesEnum.TextXAlignment.Center,
		["end"] = TypesEnum.TextXAlignment.Right
	}
	local config1 = {
		auto = TypesEnum.TextDirection.Auto,
		ltr = TypesEnum.TextDirection.LeftToRight,
		rtl = TypesEnum.TextDirection.RightToLeft
	}
	p2.Text = p1.construct("Text", function(Label)
		-- upvalues: Compose (copy), config1 (copy), ThemesModuleResult (copy), fitOf (copy), ReadFunction (copy), BindFunction (copy), TypesUDim2 (copy), TypesEnum (copy), config (copy), MetricFunction (copy), Host (copy), p1 (copy), Frozen (copy), TextMeasureModule (upval), TextChangesModule (upval), TypesUDim (copy), Runtime (copy), middle (copy), HelpModule (upval), TextRevealModule (upval)
		if Label.Text ~= nil then
			error("Facet UI.Text: set the text with text. Remove label and Text.", 0)
		end
		local TextFunction = Label.text
		
		if not Compose.isValue(TextFunction) and type(TextFunction) ~= "function" then
			assert(type(TextFunction) == "string", "Facet UI.Text requires text")
		end
		local Truncate = Label.truncate
		assert(Truncate == nil or (Truncate == "end" or Truncate == "middle"), "Facet Text truncate must be end or middle")
		local IsMiddle = Truncate == "middle"
		local IsRich: boolean = Label.rich == true or Label.RichText == true
		assert(Label.rich == nil or type(Label.rich) == "boolean", "Facet Text rich must be a boolean")
		assert(not IsMiddle or not IsRich, "Facet Text cannot cut rich text in the middle")
		assert(not IsMiddle or Label.TextWrapped ~= true and Label.wrap ~= true, "Facet Text middle truncation needs one line; remove wrap")
		assert(Label.direction == nil or config1[Label.direction] ~= nil, "Facet Text direction must be auto, ltr or rtl")
		local TextSize = Label.textSize
		local TextSize1 = if type(TextSize) == "number" then TextSize else nil
		assert(TextSize1 == nil or TextSize1 > 0 and TextSize1 < 1e999, "Facet Text textSize must be a positive size")
		local v4 = nil
		
		if type(TextSize) == "string" and TextSize ~= "fit" then
			assert(table.find(ThemesModuleResult.TYPE_ROLES, TextSize) ~= nil, `Facet Text textSize "{TextSize}" is not a type role; use one of {table.concat(ThemesModuleResult.TYPE_ROLES, ", ")}`)
			v4 = TextSize
		end
		assert(v4 == nil or Label.textRole == nil, "Facet Text: set the type role one time, with textSize or textRole")
		local FitOfResult = if TextSize1 == nil and v4 == nil then fitOf(TextSize) else nil
		local Lines: number = Label.lines
		assert(Lines == nil or type(Lines) == "number" and Lines >= 1 and Lines % 1 == 0, "Facet Text lines must be a whole number, 1 or more")
		assert(Lines == nil or not IsMiddle, "Facet Text lines cannot combine with a middle cut")
		assert(Lines == nil or FitOfResult == nil, "Facet Text lines cannot combine with a fitted text size")
		assert(Label.reveal == nil or Label.reveal == "auto", "Facet Text reveal must be auto")
		assert(Label.reveal == nil or Lines == nil and (not IsMiddle and (Label.wrap ~= true and Label.TextWrapped ~= true)), "Facet Text reveal needs one line that truncates at the end; remove wrap, lines or the middle cut")
		local Label1 = {
			Text = if IsMiddle then ReadFunction(TextFunction) or "" else BindFunction(TextFunction, ""),
			AutoLocalize = not Compose.isValue(TextFunction) and type(TextFunction) ~= "function" and nil
		}
		
		if IsRich then
			Label1.RichText = true
		end
		if TextSize1 then
			Label1.TextSize = TextSize1
		end
		if Label.wrap ~= nil then
			Label1.TextWrapped = Label.wrap
		end
		if Label.TextWrapped == true or Label.TextWrapped == nil and Label.wrap == true then
			Label1.Size = TypesUDim2.fromScale(1, 0)
			Label1.AutomaticSize = TypesEnum.AutomaticSize.Y
		end
		if Label.direction ~= nil then
			Label1.TextDirection = config1[Label.direction]
		end
		if Label.tint ~= nil then
			Label1.TextColor3 = Label.tint
		end
		if Label.textAlign ~= nil then
			function Label1.TextXAlignment(p5)
				-- upvalues: ReadFunction (upval), Label (copy), config (upval)
				return (assert(config[ReadFunction(Label.textAlign, p5) or "start"], "Facet Text textAlign must be start, center or end"))
			end
		end
		if IsMiddle then
			Label1.Size = TypesUDim2.fromScale(1, 0)
			Label1.AutomaticSize = TypesEnum.AutomaticSize.Y
			Label1.TextWrapped = false
			Label1.TextTruncate = TypesEnum.TextTruncate.None
		elseif Truncate == "end" or Label.reveal or Label.disclose == true and Label.wrap ~= true and Label.TextWrapped ~= true then
			Label1.TextTruncate = TypesEnum.TextTruncate.AtEnd
		end
		if Lines then
			Label1.Size = TypesUDim2.fromScale(1, 0)
			Label1.AutomaticSize = TypesEnum.AutomaticSize.Y
			Label1.TextWrapped = true
			Label1.TextTruncate = TypesEnum.TextTruncate.AtEnd
		end
		local V51 = v4 or Label.textRole
		
		if FitOfResult then
			local function _(Text, p5): number
				-- upvalues: MetricFunction (upval)
				return (math.round(if type(Text) == "string" then MetricFunction("typography." .. Text .. ".size", p5) else Text))
			end
			
			Label1.TextScaled = true
			Label1.Size = TypesUDim2.fromScale(1, 1)
			Label1.AutomaticSize = TypesEnum.AutomaticSize.None
			Label1[1] = Host.UITextSizeConstraint({
				MaxTextSize = function(p5): number
					-- upvalues: FitOfResult (copy), ReadFunction (upval), V51 (copy), MetricFunction (upval)
					local Cap = FitOfResult.cap or (ReadFunction(V51, p5) or "body")
					
					return (math.round(if type(Cap) == "string" then MetricFunction("typography." .. Cap .. ".size", p5) else Cap))
				end,
				MinTextSize = function(p5): number
					-- upvalues: FitOfResult (copy), MetricFunction (upval)
					local Floor = FitOfResult.floor or "caption"
					
					return (math.round(if type(Floor) == "string" then MetricFunction("typography." .. Floor .. ".size", p5) else Floor))
				end
			})
		end
		local TextSize2 = Label.TextSize
		local TextResult1 = p1.text(p1.props(Label, Frozen, Label1), true, if TextSize1 == nil and TextSize2 == nil then V51 else nil)
		
		if (TextSize1 ~= nil or TextSize2 ~= nil) and V51 ~= nil then
			p1.textRole(TextResult1, V51)
		end
		if not Lines and not IsMiddle and not FitOfResult and Label.Size == nil and Label.AutomaticSize == nil then
			local IsTextWrapped: boolean = Label.TextWrapped == true or Label.TextWrapped == nil and Label.wrap == true
			local HasPosition: boolean = Label.Position ~= nil or Label.AnchorPoint ~= nil
			local HasTextAlign: boolean = Label.textAlign ~= nil or Label.TextXAlignment ~= nil
			local Size = TextResult1.Size
			local AutomaticSize = TextResult1.AutomaticSize
			local Callback: (() -> ())? = nil
			local v5 = nil
			local v6 = nil
			
			local function BindOwnerResult() end
			
			local function hug()
				-- upvalues: TextResult1 (copy), Size (ref), AutomaticSize (ref), Callback (ref), TypesEnum (upval), IsTextWrapped (copy), HasPosition (copy), v5 (ref), Host (upval), v6 (ref), BindOwnerResult (ref), TypesUDim2 (upval), HasTextAlign (copy)
				if TextResult1.Size == Size and TextResult1.AutomaticSize == AutomaticSize then
					local Parent = TextResult1.Parent
					local IsGuiObject = Parent ~= nil and Parent:IsA("GuiObject")
					local AutomaticSize1 = if Parent and IsGuiObject then Parent.AutomaticSize else nil
					local UIListLayout = if Parent then Parent:FindFirstChildWhichIsA("UIListLayout") else nil
					local IsFillDirectionMatch: boolean = UIListLayout ~= nil and UIListLayout.FillDirection == TypesEnum.FillDirection.Horizontal
					local IsAutomaticSizeMatch = if IsTextWrapped then AutomaticSize1 == TypesEnum.AutomaticSize.X or AutomaticSize1 == TypesEnum.AutomaticSize.XY and IsFillDirectionMatch else Parent ~= nil and (not IsGuiObject or (IsFillDirectionMatch or (AutomaticSize1 == TypesEnum.AutomaticSize.X or (AutomaticSize1 == TypesEnum.AutomaticSize.XY or UIListLayout == nil and (HasPosition or TextResult1:GetAttribute("FacetPlaced") == true)))))
					local IsParentMatch: boolean = v5 ~= nil and v5.Parent == TextResult1
					local IsParentMatch1: boolean = IsTextWrapped and (IsFillDirectionMatch and (not IsAutomaticSizeMatch and (IsParentMatch or TextResult1:FindFirstChildWhichIsA("UIFlexItem") == nil)))
					
					if IsParentMatch1 and not IsParentMatch then
						local V67 = v5 or Host.UIFlexItem({ Name = "Bend", FlexMode = TypesEnum.UIFlexMode.Shrink })
						v5 = V67
						V67.Parent = TextResult1
					elseif v5 and not IsParentMatch1 and Parent ~= nil then
						v5.Parent = nil
					end
					local IsAutomaticSizeMatch1 = IsAutomaticSizeMatch or IsParentMatch1
					local IsAutomaticSizeMatch2: boolean = IsTextWrapped and (IsGuiObject and (AutomaticSize1 == TypesEnum.AutomaticSize.X or AutomaticSize1 == TypesEnum.AutomaticSize.XY))
					
					if IsAutomaticSizeMatch2 and v6 == nil then
						BindOwnerResult()
					end
					local X = if IsAutomaticSizeMatch2 and v6 then v6:peek().X else 1e999
					
					if X < 1e999 then
						Size = TypesUDim2.fromOffset(math.min(math.ceil(X) + 1, 320), 0)
						AutomaticSize = TypesEnum.AutomaticSize.Y
					else
						Size = if IsAutomaticSizeMatch1 then TypesUDim2.fromOffset(0, 0) else TypesUDim2.fromScale(1, 0)
						AutomaticSize = if IsAutomaticSizeMatch1 then TypesEnum.AutomaticSize.XY else TypesEnum.AutomaticSize.Y
					end
					TextResult1.Size = Size
					TextResult1.AutomaticSize = AutomaticSize
					
					if not IsTextWrapped and (not HasTextAlign and (UIListLayout ~= nil and not IsFillDirectionMatch)) then
						TextResult1.TextXAlignment = if UIListLayout.HorizontalAlignment == TypesEnum.HorizontalAlignment.Center then TypesEnum.TextXAlignment.Center elseif UIListLayout.HorizontalAlignment == TypesEnum.HorizontalAlignment.Right then TypesEnum.TextXAlignment.Right else TypesEnum.TextXAlignment.Left
					end
					return
				elseif Callback then
					Callback()
					Callback = nil
				end
			end
			
			BindOwnerResult = Compose.bindOwner(function()
				-- upvalues: TextMeasureModule (upval), p1 (upval), TextResult1 (copy), v6 (ref), Compose (upval), hug (copy)
				local NaturalResult = TextMeasureModule.natural(p1, TextResult1)
				local Flag = false
				v6 = NaturalResult
				Compose.watch(function(Callback: (any) -> ())
					-- upvalues: NaturalResult (copy), Flag (ref), hug (upval)
					Callback(NaturalResult)
					
					if Flag then
						hug()
					end
					Flag = true
				end)
			end)
			Callback = TextChangesModule(p1, TextResult1, function(p5)
				-- upvalues: hug (copy)
				if p5 == "Parent" then
					hug()
				end
			end)
			hug()
		end
		if Lines then
			p1.clampLines(TextResult1, Lines)
		end
		if IsMiddle then
			local LayoutSizeResult = p1.layoutSize(TextResult1)
			local CellResult = Compose.cell({ left = TypesUDim.new(0, 0), right = TypesUDim.new(0, 0) })
			local List = {}
			
			local function paddingChanged()
				-- upvalues: List (copy), TextResult1 (copy), CellResult (copy), TypesUDim (upval)
				for _, Connection in List do
					Connection:Disconnect()
				end
				table.clear(List)
				local UIPadding = TextResult1:FindFirstChildWhichIsA("UIPadding")
				
				local function refresh()
					-- upvalues: CellResult (upval), UIPadding (copy), TypesUDim (upval)
					CellResult:set(if UIPadding then {
						left = UIPadding.PaddingLeft,
						right = UIPadding.PaddingRight
					} else { left = TypesUDim.new(0, 0), right = TypesUDim.new(0, 0) })
				end
				
				if UIPadding then
					table.insert(List, UIPadding:GetPropertyChangedSignal("PaddingLeft"):Connect(refresh))
					table.insert(List, UIPadding:GetPropertyChangedSignal("PaddingRight"):Connect(refresh))
				end
				refresh()
			end
			
			Runtime.connect(TextResult1, "ChildAdded", paddingChanged)
			Runtime.connect(TextResult1, "ChildRemoved", paddingChanged)
			Compose.cleanup(function()
				-- upvalues: List (copy)
				for _, Connection in List do
					Connection:Disconnect()
				end
			end)
			paddingChanged()
			local FormulaResult = Compose.formula(function(Callback): number
				-- upvalues: LayoutSizeResult (copy), CellResult (copy)
				local X = Callback(LayoutSizeResult).X
				local CallbackResult = Callback(CellResult)
				
				return (math.max(0, X - CallbackResult.left.Scale * X - CallbackResult.left.Offset - CallbackResult.right.Scale * X - CallbackResult.right.Offset))
			end)
			local TextSizeResult = p1.observe.TextSize(TextResult1)
			local FontFaceResult = p1.observe.FontFace(TextResult1)
			local TextSizeResult1 = p1.observeStyled.TextSize(TextResult1)
			local FontFaceResult1 = p1.observeStyled.FontFace(TextResult1)
			Compose.watch(function(Callback)
				-- upvalues: ReadFunction (upval), TextFunction (copy), TextSizeResult (copy), FontFaceResult (copy), TextSizeResult1 (copy), FontFaceResult1 (copy), TextResult1 (copy), middle (upval), FormulaResult (copy)
				local ReadResult = ReadFunction(TextFunction, Callback) or ""
				Callback(TextSizeResult)
				Callback(FontFaceResult)
				Callback(TextSizeResult1)
				Callback(FontFaceResult1)
				TextResult1.Text = middle(TextResult1, ReadResult, Callback(FormulaResult))
			end)
		end
		assert(Label.disclose == nil or type(Label.disclose) == "boolean", "Facet Text disclose must be a boolean")
		
		if Label.disclose or Label.reveal then
			local TextFitsResult = p1.observe.TextFits(TextResult1)
			local TextResult = p1.observe.Text(TextResult1)
			local CellResult = Compose.cell(false)
			HelpModule.attach(p1, TextResult1, BindFunction(if type(TextFunction) == "function" then Compose.formula(TextFunction) else TextFunction, ""), {
				name = "Disclosure",
				gate = function(Callback): boolean
					-- upvalues: TextFitsResult (copy), IsMiddle (copy), TextResult (copy), ReadFunction (upval), TextFunction (copy)
					return not Callback(TextFitsResult) or IsMiddle and Callback(TextResult) ~= (ReadFunction(TextFunction, Callback) or "")
				end,
				shown = CellResult
			})
			
			if Label.reveal then
				TextRevealModule(p1, TextResult1, CellResult)
			end
		end
		if Label.role ~= nil then
			Compose.watch(function(p5)
				-- upvalues: ReadFunction (upval), Label (copy), TextResult1 (copy)
				local ReadResult = ReadFunction(Label.role, p5)
				assert(ReadResult == nil or (ReadResult == "secondary" or ReadResult == "content"), "Facet Text role must be secondary or content")
				
				if ReadResult == "secondary" then
					TextResult1:AddTag("facet-secondary")
					
					return
				end
				if TextResult1:HasTag("facet-secondary") then
					TextResult1:RemoveTag("facet-secondary")
				end
			end)
		end
		return TextResult1
	end)
	local config2 = { titleAndIcon = true, titleOnly = true, iconOnly = true }
	p2.Label = p1.construct("Label", function(p5)
		-- upvalues: ReadFunction (copy), config2 (copy), p1 (copy), ThemesModuleResult (copy), IconsModule (upval), MetricFunction (copy), TypesUDim2 (copy), p2 (copy), TypesEnum (copy), Runtime (copy), TypesUDim (copy), OfResult (copy), Compose (copy)
		local ReadResult = ReadFunction(p5.title)
		assert(type(ReadResult) == "string" and ReadResult ~= "", "Facet UI.Label: title is required and must not be empty. It is the accessible name in every presentation. Use UI.Text for plain text.")
		local Presentation = p5.presentation or "titleAndIcon"
		
		if not config2[Presentation] then
			error(`Facet UI.Label: unknown presentation '{Presentation}'. Use iconOnly | titleAndIcon | titleOnly.`, 0)
		end
		assert(p5.iconPosition == nil or (p5.iconPosition == "leading" or p5.iconPosition == "trailing"), "Facet UI.Label: iconPosition must be leading or trailing")
		local TitleOnly = if p5.icon == nil then "titleOnly" else Presentation
		local Icon: string = p5.icon
		
		if type(Icon) == "string" and not string.match(Icon, "^rbx") then
			local ReadResult1 = ReadFunction(p1.config.theme) or {}
			local ReadResult11 = ReadFunction(p1.config.icons)
			
			if ReadResult11 then
				ReadResult1 = { icons = ReadResult11, assets = ReadResult1.assets }
			end
			assert(ThemesModuleResult.resolveIcon(ReadResult1, Icon) ~= nil or IconsModule.registered(Icon), `Facet UI.Label: unknown icon '{Icon}'.`)
		end
		local List = {}
		
		if TitleOnly ~= "titleOnly" then
			local IconSize: number = p5.iconSize
			local config = { Name = "Icon" }
			
			if IconSize ~= nil then
				assert(type(IconSize) == "number" and IconSize > 0 or type(IconSize) == "string", "Facet UI.Label: iconSize must be a positive number or a theme metric name")
				
				function config.Size(p6)
					-- upvalues: IconSize (copy), MetricFunction (upval), TypesUDim2 (upval)
					local IconSize1 = if type(IconSize) == "number" then IconSize else MetricFunction(IconSize, p6)
					
					return TypesUDim2.fromOffset(IconSize1, IconSize1)
				end
			end
			table.insert(List, p1.icon(assert(Icon), config))
		end
		if TitleOnly ~= "iconOnly" then
			table.insert(List, p2.Text("Title")({ text = p5.title, textSize = p5.textSize or "body" }))
		end
		if p5.iconPosition == "trailing" then
			local List1 = {}
			
			for i = #List, 1, -1 do
				table.insert(List1, List[i])
			end
			List = List1
		end
		local RowResult = p1.row(List, p1.props(p5, {
			"title", "icon", "presentation", "iconSize", "textSize", "gap", "iconPosition"
		}, { Name = "Label" }))
		local v7 = assert(RowResult:FindFirstChildWhichIsA("UIListLayout"))
		v7.VerticalAlignment = TypesEnum.VerticalAlignment.Center
		local Gap = p5.gap
		
		if Gap ~= nil then
			Runtime.decorate(v7, {
				Padding = function(p6)
					-- upvalues: TypesUDim (upval), OfResult (upval), Gap (copy)
					return TypesUDim.new(0, OfResult.spacing(Gap, p6))
				end
			})
		end
		RowResult:SetAttribute("FacetPresentation", TitleOnly)
		Compose.watch(function(p6)
			-- upvalues: RowResult (copy), ReadFunction (upval), p5 (copy)
			RowResult:SetAttribute("AccessibleLabel", ReadFunction(p5.title, p6))
		end)
		
		return RowResult
	end)
end