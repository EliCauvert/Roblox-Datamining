local _ = require("./control_types")
local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("../vendor/compose/core")
local _ = require("./navigation_props")
local _ = require("./nav_surface_parts")

return function(p1, p2, p3, p4)
	local Host = p1.Host
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local BodyFunction = p4.body
	p2.DisclosureGroup = p1.construct("DisclosureGroup", function(p5)
		-- upvalues: p3 (copy), p2 (copy), TypesUDim2 (copy), TypesEnum (copy), Runtime (copy), Host (copy), p4 (copy), p1 (copy), Compose (copy), BodyFunction (copy)
		assert(type(p5.expanded) == "table" and p5.expanded.set, "DisclosureGroup.expanded requires a writable Compose cell")
		local GuiService = p3.service("GuiService")
		local ChevronPosition = p5.chevronPosition or "leading"
		assert(ChevronPosition == "leading" or ChevronPosition == "trailing", "Invalid DisclosureGroup.chevronPosition")
		assert(p5.appearance == nil or table.find({ "plain", "contained", "divided", "outline" }, p5.appearance), "Invalid DisclosureGroup.appearance")
		local Indent: number = p5.indent
		assert(Indent == nil or (type(Indent) == "number" and Indent >= 0 and Indent < 1e999 or type(Indent) == "string" and table.find({
			"xs",
			"s",
			"m",
			"l",
			"xl"
		}, Indent) ~= nil), "DisclosureGroup.indent must be a spacing step or a number of pixels")
		
		local function chevron(Callback): string
			-- upvalues: p5 (copy)
			return if Callback(p5.expanded) then "chevron.down" else "chevron.trailing"
		end
		
		local Object = p2.Button("Header")({
			label = p5.label,
			icon = if ChevronPosition == "leading" then chevron else p5.icon,
			trailingIcon = if ChevronPosition == "trailing" then chevron else p5.icon,
			subtitle = p5.description,
			enabled = p5.enabled,
			textSize = p5.textSize,
			Size = TypesUDim2.new(1, 0, 0, 44),
			selected = if p5.appearance == "outline" then nil else p5.expanded,
			appearance = if p5.appearance == "outline" then "utility" else nil,
			TextXAlignment = if p5.appearance == "outline" then TypesEnum.TextXAlignment.Left else nil,
			onActivate = function()
				-- upvalues: p5 (copy)
				local Inverted = not p5.expanded:peek()
				p5.expanded:set(Inverted)
				
				if p5.onToggle then
					p5.onToggle(Inverted)
				end
			end
		})
		local Content = Object:FindFirstChild("Content")
		local UIListLayout = Content and Content:FindFirstChildWhichIsA("UIListLayout")
		
		if Content and UIListLayout then
			UIListLayout.HorizontalAlignment = TypesEnum.HorizontalAlignment.Left
			local Captions = Content:FindFirstChild("Captions")
			local Captions1 = Captions or Content:FindFirstChild("Title")
			
			if Captions1 and (ChevronPosition == "trailing" or Captions) then
				Runtime.mount(function()
					-- upvalues: Host (upval), TypesEnum (upval)
					return Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Fill })
				end, Captions1)
			end
			local Description = Captions and Captions:FindFirstChild("Description")
			
			if Description and Description:IsA("TextLabel") then
				Description.TextWrapped = true
			end
		end
		local RevealMotionResult, RevealMotionResult2, RevealMotionResult3 = p4.revealMotion(p5.expanded)
		local Child = Object:FindFirstChild(if ChevronPosition == "leading" then "LeadingIcon" else "TrailingIcon", true)
		
		if Child and Child:IsA("GuiObject") then
			Runtime.decorate(Child, {
				Rotation = function(Callback): number
					-- upvalues: RevealMotionResult (copy), p5 (copy)
					local RevealMotionResultResult: number = RevealMotionResult(Callback)
					
					return if Callback(p5.expanded) then -90 * (1 - RevealMotionResultResult) else 90 * RevealMotionResultResult
				end
			})
		end
		local ColumnResult = p1.column({
			Object,
			Compose.presence(p5.expanded, function(p6)
				-- upvalues: BodyFunction (upval), p5 (copy), p1 (upval), Host (upval), TypesUDim2 (upval), Indent (copy), TypesEnum (upval), RevealMotionResult3 (copy), p3 (upval), p4 (upval), RevealMotionResult (copy), GuiService (copy), Object (copy), Compose (upval)
				local BodyResult = BodyFunction(p5.content)
				
				if p5.appearance == "divided" then
					BodyResult = p1.column({
						p1.styled(Host.Frame("Divider")({ BorderSizePixel = 0, Size = TypesUDim2.new(1, 0, 0, 1) }), "divider"),
						BodyResult
					})
				end
				local IsOutline = p5.appearance == "outline"
				
				local function _(p7)
					-- upvalues: IsOutline (copy), p1 (upval)
					return if IsOutline then 0 else p1.controlSize(nil, "paddingX", p7)
				end
				
				local RevealFade = p1.fade({
					Name = "RevealFade",
					BackgroundTransparency = 1,
					Size = TypesUDim2.new(1, 0, 0, 0),
					AutomaticSize = TypesEnum.AutomaticSize.Y,
					GroupTransparency = RevealMotionResult3,
					BodyResult
				}, nil, false)
				p3.attach(RevealFade, {
					(Host.UIPadding({
						PaddingTop = p1.types.UDim.new(0, 8),
						PaddingBottom = p1.types.UDim.new(0, 8),
						PaddingRight = function(p7)
							-- upvalues: p1 (upval), IsOutline (copy)
							return p1.types.UDim.new(0, if IsOutline then 0 else p1.controlSize(nil, "paddingX", p7))
						end,
						PaddingLeft = function(p7)
							-- upvalues: Indent (upval), p1 (upval), IsOutline (copy)
							return p1.types.UDim.new(0, if type(Indent) == "number" then Indent elseif Indent then p1.metric("space." .. Indent, p7) elseif IsOutline then 0 else p1.controlSize(nil, "paddingX", p7))
						end
					}))
				})
				local UnrollResult, UnrollResult2 = p4.unroll(RevealMotionResult, p1.observe.AbsoluteSize(RevealFade))
				local v1 = Host.Frame("Reveal")({
					BackgroundTransparency = 1,
					ClipsDescendants = true,
					LayoutOrder = 2,
					Interactable = function(Callback): boolean
						-- upvalues: p6 (copy)
						return not Callback(p6.exiting)
					end,
					AutomaticSize = UnrollResult,
					Size = function(p7)
						-- upvalues: TypesUDim2 (upval), UnrollResult2 (copy)
						return TypesUDim2.new(1, 0, 0, UnrollResult2(p7) or 0)
					end,
					RevealFade
				})
				
				local function handBack()
					-- upvalues: GuiService (upval), p3 (upval), p1 (upval), v1 (copy), Object (upval)
					if GuiService and p3.within(p1.selection.get(), v1) and Object.Parent then
						p1.selection.set(Object)
					end
				end
				
				Compose.watch(function(Callback)
					-- upvalues: p6 (copy), GuiService (upval), p3 (upval), p1 (upval), v1 (copy), Object (upval)
					if Callback(p6.exiting) and GuiService and p3.within(p1.selection.get(), v1) and Object.Parent then
						p1.selection.set(Object)
					end
				end)
				Compose.cleanup(handBack)
				p3.keep(p5.content)
				
				return v1
			end, {
				exit = function()
					-- upvalues: RevealMotionResult2 (copy)
					return { completed = RevealMotionResult2 }
				end
			})
		}, p1.props(p5, {
			"label", "expanded", "content", "enabled", "onToggle", "description", "icon",
			"chevronPosition", "appearance", "controlSize", "textSize", "indent"
		}, {
			Name = "DisclosureGroup",
			Size = TypesUDim2.new(1, 0, 0, 0),
			AutomaticSize = TypesEnum.AutomaticSize.Y
		}))
		local UIListLayout1 = ColumnResult:FindFirstChildWhichIsA("UIListLayout")
		
		if UIListLayout1 then
			Runtime.decorate(UIListLayout1, { Padding = p1.types.UDim.new(0, 0) })
		end
		p1.styled(ColumnResult, "disclosure-group")
		
		if p5.appearance == "contained" then
			p1.styled(ColumnResult, "panel")
			Runtime.decorate(ColumnResult, { BackgroundTransparency = 0 })
			p3.skin(ColumnResult, "panel")
		end
		if p5.appearance then
			p1.styled(ColumnResult, "disclosure-" .. p5.appearance)
		end
		return ColumnResult
	end)
end