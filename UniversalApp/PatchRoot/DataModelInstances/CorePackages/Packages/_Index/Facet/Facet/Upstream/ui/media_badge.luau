local _ = require("./theme_types")
local LayoutKitModule = require("./layout_kit")
local _ = require("./types")
local _ = require("./engine_types")
local _ = require("./media_types")
local _ = require("../vendor/compose/core")
local NativeDecorationModule = require("./native_decoration")
local _ = require("./control_types")
local _ = require("./media_props")
local _ = require("./media_shared")

return function(p1, p2, p3)
	-- upvalues: LayoutKitModule (copy), NativeDecorationModule (copy)
	local Host = p1.Host
	local Runtime = p1.runtime
	local Compose = p1.Compose
	local OfResult = LayoutKitModule.of(p1)
	local Types = p1.types
	local ReadFunction = p1.read
	local TypesEnum = Types.Enum
	local TypesUDim2 = Types.UDim2
	local TypesUDim = Types.UDim
	local TypesVector2 = Types.Vector2
	local MetricFunction = p1.metric
	local ControlSizeFunction = p1.controlSize
	local SkinFunction = p3.skin
	
	local function _(Callback)
		-- upvalues: Compose (copy)
		return Compose.isValue(Callback) or type(Callback) == "function"
	end
	
	local _ = function(Object, Callback)
		-- upvalues: ReadFunction (copy), Compose (copy)
		local Tag = nil
		
		local function apply(p4)
			-- upvalues: ReadFunction (upval), Callback (copy), Tag (ref), Object (copy)
			local v1 = ReadFunction(Callback, p4)
			local Neutral = if v1 == nil then "neutral" else v1
			assert(({
				neutral = true,
				info = true,
				success = true,
				warning = true,
				error = true,
				accent = true,
				voice = true,
				contrast = true
			})[Neutral], "Facet: invalid status")
			
			if Tag then
				Object:RemoveTag(Tag)
			end
			local Text = "facet-status-" .. Neutral
			Tag = Text
			Object:AddTag(Text)
		end
		
		if Compose.isValue(Callback) or type(Callback) == "function" then
			Compose.watch(apply)
		else
			apply()
		end
	end
	
	p2.Badge = p1.construct("Badge", function(p4)
		-- upvalues: ReadFunction (copy), TypesUDim2 (copy), ControlSizeFunction (copy), p1 (copy), Compose (copy), TypesEnum (copy), Host (copy), OfResult (copy), ReadFunction (copy), ReadFunction (copy), Runtime (copy), p2 (copy), TypesVector2 (copy), MetricFunction (copy), TypesUDim (copy), SkinFunction (copy), NativeDecorationModule (upval), Types (copy)
		assert(p4.iconPosition == nil or (p4.iconPosition == "leading" or p4.iconPosition == "trailing"), "Facet Badge invalid iconPosition")
		local IsNotNameMatch: boolean = p4.icon ~= nil and (type(p4.name) == "string" and p4.name ~= "")
		
		local function _(p5)
			-- upvalues: ReadFunction (upval), p4 (copy)
			local ReadResult = ReadFunction(p4.label, p5)
			assert(ReadResult == nil or type(ReadResult) == "string", "Facet Badge label must be a string")
			
			return ReadResult or ""
		end
		
		local function height(p5)
			-- upvalues: TypesUDim2 (upval), ControlSizeFunction (upval), p4 (copy)
			return TypesUDim2.fromOffset(0, ControlSizeFunction(p4.controlSize, "iconSize", p5) + 4)
		end
		
		local ReadResult = ReadFunction(p4.label, nil)
		assert(ReadResult == nil or type(ReadResult) == "string", "Facet Badge label must be a string")
		local ReadResult1 = ReadResult or ""
		local ThemeFunction = p1.config.theme
		local Size = nil
		repeat
			if not Compose.isValue(ThemeFunction) and type(ThemeFunction) ~= "function" then
				local ControlSizeFunction1 = p4.controlSize
				
				if not Compose.isValue(ControlSizeFunction1) and type(ControlSizeFunction1) ~= "function" then
					Size = TypesUDim2.fromOffset(0, ControlSizeFunction(p4.controlSize, "iconSize", nil) + 4)
					continue
				end
			end
			Size = height
			break
		until true
		local IsValue = IsNotNameMatch
		
		if not IsValue then
			IsValue = true
			
			if type(p4.label) ~= "function" then
				IsValue = Compose.isValue(p4.label)
				
				if not IsValue then
					local ReadResult2 = ReadFunction(p4.label, nil)
					assert(ReadResult2 == nil or type(ReadResult2) == "string", "Facet Badge label must be a string")
					IsValue = (ReadResult2 or "") ~= ""
				end
			end
		end
		assert(IsValue, "Facet Badge requires meaningful text or a named icon")
		local LabelFunction = p4.label
		local Label = p1.styled(Host.TextLabel((p1.props(p4, {
			"label", "status", "icon", "iconPosition", "name", "appearance", "corners",
			"controlSize", "Visible"
		}, {
			Text = ReadResult1,
			Attributes = { AccessibleLabel = p4.name or ReadResult1 },
			AutoLocalize = not (Compose.isValue(LabelFunction) or type(LabelFunction) == "function") and nil,
			AutomaticSize = TypesEnum.AutomaticSize.XY,
			Size = Size
		}))), "text")
		p1.textRole(Label, "caption")
		
		if p4.icon == nil then
			Host.UIPadding({}).Parent = Label
		end
		p1.textLayout(Label, true, true, true)
		local Object = Label
		
		if p4.icon then
			Label.Name = "Label"
			Label.BackgroundTransparency = 1
			Label.Size = TypesUDim2.fromOffset(0, 0)
			local IconResult = p1.icon(p4.icon, {
				Size = function(p5)
					-- upvalues: ControlSizeFunction (upval), p4 (copy), TypesUDim2 (upval)
					local Floored = math.floor(ControlSizeFunction(p4.controlSize, "iconSize", p5) * 0.7 + 0.5)
					
					return TypesUDim2.fromOffset(Floored, Floored)
				end
			})
			local IsNotTrailing = p4.iconPosition ~= "trailing"
			IconResult.LayoutOrder = if IsNotTrailing then 1 else 2
			Label.LayoutOrder = if IsNotTrailing then 2 else 1
			Object = Host.Frame({
				Name = p4.Name or "Badge",
				AutomaticSize = TypesEnum.AutomaticSize.XY,
				Size = Size,
				OfResult.list({ gap = 4, align = "center" }, false),
				IconResult,
				Label
			})
		end
		local Visible = nil
		
		local function update(p5)
			-- upvalues: ReadFunction (upval), p4 (copy), ReadResult1 (ref), Label (copy), ReadFunction (upval), IsNotNameMatch (copy), Visible (ref), Object (ref)
			local ReadResult = ReadFunction(p4.label, p5)
			assert(ReadResult == nil or type(ReadResult) == "string", "Facet Badge label must be a string")
			local ReadResult2 = ReadResult or ""
			
			if ReadResult2 ~= ReadResult1 then
				ReadResult1 = ReadResult2
				
				if p4.Text == nil then
					Label.Text = ReadResult2
				end
				if p4.name == nil and p4.Attributes == nil then
					Label:SetAttribute("AccessibleLabel", ReadResult2)
				end
			end
			local IsNotNameMatch1 = ReadFunction(p4.Visible, p5) ~= false and (IsNotNameMatch or ReadResult2 ~= "")
			
			if IsNotNameMatch1 ~= Visible then
				Visible = IsNotNameMatch1
				Object.Visible = IsNotNameMatch1
			end
		end
		
		local VisibleFunction = p4.Visible
		repeat
			if not Compose.isValue(VisibleFunction) and type(VisibleFunction) ~= "function" then
				local LabelFunction1 = p4.label
				
				if not Compose.isValue(LabelFunction1) and type(LabelFunction1) ~= "function" then
					update()
					continue
				end
			end
			Compose.watch(update)
			break
		until true
		p1.styled(Object, "badge")
		
		if p4.status ~= nil then
			local Object1 = Object
			local StatusFunction = p4.status
			local Tag = nil
			
			local function apply(p5)
				-- upvalues: ReadFunction (upval), StatusFunction (copy), Tag (ref), Object1 (copy)
				local v1 = ReadFunction(StatusFunction, p5)
				local Neutral = if v1 == nil then "neutral" else v1
				assert(({
					neutral = true,
					info = true,
					success = true,
					warning = true,
					error = true,
					accent = true,
					voice = true,
					contrast = true
				})[Neutral], "Facet: invalid status")
				
				if Tag then
					Object1:RemoveTag(Tag)
				end
				local Text = "facet-status-" .. Neutral
				Tag = Text
				Object1:AddTag(Text)
			end
			
			if Compose.isValue(StatusFunction) or type(StatusFunction) == "function" then
				Compose.watch(apply)
			else
				apply()
			end
		end
		local Tag1 = nil
		
		local function appearanceTag(p5)
			-- upvalues: ReadFunction (upval), p4 (copy), Tag1 (ref), Object (ref)
			local ReadResult = ReadFunction(p4.appearance, p5) or "standard"
			assert(ReadResult == "standard" or (ReadResult == "status" or ReadResult == "utility"), "Facet Badge invalid appearance")
			
			if Tag1 then
				Object:RemoveTag(Tag1)
			end
			local Text = "facet-badge-" .. ReadResult
			Tag1 = Text
			Object:AddTag(Text)
		end
		
		local AppearanceFunction = p4.appearance
		
		if Compose.isValue(AppearanceFunction) or type(AppearanceFunction) == "function" then
			Compose.watch(appearanceTag)
		else
			local ReadResult3 = ReadFunction(p4.appearance, nil) or "standard"
			assert(ReadResult3 == "standard" or (ReadResult3 == "status" or ReadResult3 == "utility"), "Facet Badge invalid appearance")
			
			if Tag1 then
				Object:RemoveTag(Tag1)
			end
			local Text = "facet-badge-" .. ReadResult3
			Tag1 = Text
			Object:AddTag(Text)
		end
		if p4.appearance then
			Runtime.mountFragment(function()
				-- upvalues: Compose (upval), ReadFunction (upval), p4 (copy), p2 (upval), TypesUDim2 (upval), TypesVector2 (upval)
				return {
					Compose.show(function(p5): boolean
						-- upvalues: ReadFunction (upval), p4 (upval)
						return ReadFunction(p4.appearance, p5) == "status"
					end, function()
						-- upvalues: p2 (upval), p4 (upval), TypesUDim2 (upval), TypesVector2 (upval)
						return p2.StatusIndicator("Status")({
							diameter = 8,
							LayoutOrder = -1,
							status = p4.status,
							Position = TypesUDim2.new(0, -14, 0.5, 0),
							AnchorPoint = TypesVector2.new(0, 0.5)
						})
					end)
				}
			end, Object)
		end
		if p4.corners then
			Runtime.mount(function()
				-- upvalues: Host (upval), ReadFunction (upval), p4 (copy), MetricFunction (upval), TypesUDim (upval)
				return Host.UICorner({
					CornerRadius = function(p5)
						-- upvalues: ReadFunction (upval), p4 (upval), MetricFunction (upval), TypesUDim (upval)
						local ReadResult = ReadFunction(p4.corners, p5)
						
						if type(ReadResult) == "string" then
							ReadResult = ({
								square = 0,
								rounded = MetricFunction("radii.control", p5),
								capsule = MetricFunction("radii.pill", p5)
							})[ReadResult]
						end
						assert(type(ReadResult) == "number", "Facet Badge invalid corners")
						
						return TypesUDim.new(0, ReadResult)
					end
				})
			end, Object)
		end
		SkinFunction(Object, "badge")
		
		if Object == Label and p1.config.theme ~= nil then
			local _ = function(p5): boolean
				-- upvalues: ReadFunction (upval), p1 (upval)
				local ReadResult = ReadFunction(p1.config.theme, p5)
				local Badge = ReadResult and (ReadResult.chrome and ReadResult.chrome.badge)
				
				return Badge ~= nil and (Badge.kind ~= "native" and Badge.kind ~= "none")
			end
			
			local function lifted()
				-- upvalues: Compose (upval), Label (copy), p1 (upval), TypesUDim2 (upval), TypesEnum (upval), NativeDecorationModule (upval), Runtime (upval), Types (upval), ReadFunction (upval)
				Compose.cleanup(function()
					-- upvalues: Label (upval)
					Label:RemoveTag("facet-badge-captioned")
				end)
				local NativeDecorationModuleResult = NativeDecorationModule(Compose, Runtime, Types, Label, p1.styled(p1.text({
					Name = "Label",
					ZIndex = 1,
					Size = TypesUDim2.fromScale(1, 1),
					AutomaticSize = TypesEnum.AutomaticSize.None,
					Text = p1.observe.Text(Label),
					TextColor3 = p1.observeStyled.TextColor3(Label),
					FontFace = p1.observeStyled.FontFace(Label),
					TextXAlignment = p1.observeStyled.TextXAlignment(Label),
					TextYAlignment = p1.observeStyled.TextYAlignment(Label)
				}, nil, "caption"), "badge-caption"), { inset = true })
				Compose.watch(function(p5)
					-- upvalues: ReadFunction (upval), p1 (upval), NativeDecorationModuleResult (copy), Label (upval)
					local ReadResult = ReadFunction(p1.config.theme, p5)
					local Badge = ReadResult and (ReadResult.chrome and ReadResult.chrome.badge)
					local IsNotNone: boolean = Badge ~= nil and (Badge.kind ~= "native" and Badge.kind ~= "none")
					NativeDecorationModuleResult.Visible = IsNotNone
					
					if IsNotNone then
						Label:AddTag("facet-badge-captioned")
						
						return
					else
						Label:RemoveTag("facet-badge-captioned")
					end
				end)
				
				return NativeDecorationModuleResult
			end
			
			if Compose.isValue(p1.config.theme) or type(p1.config.theme) == "function" then
				local v1 = false
				Runtime.mountFragment(function()
					-- upvalues: Compose (upval), v1 (ref), ReadFunction (upval), p1 (upval), lifted (copy)
					return {
						Compose.show(function(p5): boolean
							-- upvalues: v1 (upval), ReadFunction (upval), p1 (upval)
							local IsNotNone: boolean = v1
							
							if not IsNotNone then
								local ReadResult = ReadFunction(p1.config.theme, p5)
								local Badge = ReadResult and (ReadResult.chrome and ReadResult.chrome.badge)
								IsNotNone = Badge ~= nil and (Badge.kind ~= "native" and Badge.kind ~= "none")
							end
							v1 = IsNotNone
							
							return v1
						end, lifted)
					}
				end, Label)
			else
				local ReadResult4 = ReadFunction(p1.config.theme, nil)
				local Badge = ReadResult4 and (ReadResult4.chrome and ReadResult4.chrome.badge)
				
				if Badge ~= nil and (Badge.kind ~= "native" and Badge.kind ~= "none") then
					Runtime.mount(lifted, Label)
				end
			end
		end
		return Object
	end)
	p2.StatusIndicator = p1.construct("StatusIndicator", function(p4)
		-- upvalues: ReadFunction (copy), ControlSizeFunction (copy), ReadFunction (copy), TypesUDim2 (copy), TypesEnum (copy), Host (copy), TypesUDim (copy), p1 (copy), Compose (copy), TypesVector2 (copy), ReadFunction (copy)
		local function _(p5)
			-- upvalues: ReadFunction (upval), p4 (copy), ControlSizeFunction (upval)
			local ReadResult = ReadFunction(p4.diameter, p5)
			
			if not ReadResult then
				if p4.controlSize then
					return (ControlSizeFunction(p4.controlSize, "iconSize", p5))
				end
				if p4.count ~= nil then
					return 24
				end
				ReadResult = 12
			end
			return ReadResult
		end
		
		local _ = function(p5)
			-- upvalues: ReadFunction (upval), p4 (copy)
			local ReadResult = ReadFunction(p4.form, p5) or "dot"
			assert(ReadResult == "dot" or (ReadResult == "ring" or (ReadResult == "square" or ReadResult == "dash")), "Facet StatusIndicator invalid form")
			
			return ReadResult
		end
		
		local PropsResult = p1.props(p4, {
			"status", "form", "count", "max", "name", "diameter", "controlSize", "cutout"
		}, {
			Attributes = if p4.name == nil then nil else { AccessibleLabel = p4.name },
			Size = function(p5)
				-- upvalues: TypesUDim2 (upval), p4 (copy), ReadFunction (upval), ControlSizeFunction (upval), ReadFunction (upval)
				local FromOffsetFunction = TypesUDim2.fromOffset
				local ReadResult = if p4.count == nil then ReadFunction(p4.diameter, p5) or (if p4.controlSize then ControlSizeFunction(p4.controlSize, "iconSize", p5) elseif p4.count == nil then 12 else 24) else 0
				local ReadResult1 = ReadFunction(p4.form, p5) or "dot"
				assert(ReadResult1 == "dot" or (ReadResult1 == "ring" or (ReadResult1 == "square" or ReadResult1 == "dash")), "Facet StatusIndicator invalid form")
				
				return FromOffsetFunction(ReadResult, if ReadResult1 == "dash" then math.max(3, (ReadFunction(p4.diameter, p5) or (if p4.controlSize then ControlSizeFunction(p4.controlSize, "iconSize", p5) elseif p4.count == nil then 12 else 24)) / 3) else ReadFunction(p4.diameter, p5) or (if p4.controlSize then ControlSizeFunction(p4.controlSize, "iconSize", p5) elseif p4.count == nil then 12 else 24))
			end,
			AutomaticSize = if p4.count == nil then nil elseif p4.Size == nil then TypesEnum.AutomaticSize.XY else TypesEnum.AutomaticSize.X,
			Text = function(p5): string
				-- upvalues: ReadFunction (upval), p4 (copy), ReadFunction (upval)
				local ReadResult: number = ReadFunction(p4.count, p5)
				
				if ReadResult == nil then
					return ""
				end
				assert(type(ReadResult) == "number" and (ReadResult >= 0 and ReadResult < 1e999) and ReadResult % 1 == 0, "Facet StatusIndicator count must be a nonnegative integer")
				local IsSquare = true
				local ReadResult1 = ReadFunction(p4.form, p5) or "dot"
				assert(ReadResult1 == "dot" or (ReadResult1 == "ring" or (ReadResult1 == "square" or ReadResult1 == "dash")), "Facet StatusIndicator invalid form")
				
				if ReadResult1 ~= "dot" then
					local ReadResult2 = ReadFunction(p4.form, p5) or "dot"
					assert(ReadResult2 == "dot" or (ReadResult2 == "ring" or (ReadResult2 == "square" or ReadResult2 == "dash")), "Facet StatusIndicator invalid form")
					IsSquare = ReadResult2 == "square"
				end
				assert(IsSquare, "Facet StatusIndicator count requires dot or square")
				assert(p4.max == nil or type(p4.max) == "number" and (p4.max >= 0 and p4.max < 1e999) and p4.max % 1 == 0, "Facet StatusIndicator max must be a nonnegative integer")
				
				return if (p4.max or 99) < ReadResult then tostring(p4.max or 99) .. "+" else tostring(ReadResult)
			end,
			TextXAlignment = TypesEnum.TextXAlignment.Center,
			Host.UICorner({
				CornerRadius = function(p5)
					-- upvalues: ReadFunction (upval), p4 (copy), TypesUDim (upval), p1 (upval)
					local ReadResult = ReadFunction(p4.form, p5) or "dot"
					assert(ReadResult == "dot" or (ReadResult == "ring" or (ReadResult == "square" or ReadResult == "dash")), "Facet StatusIndicator invalid form")
					
					return if ReadResult == "square" then TypesUDim.new(0, 0) else p1.round(p5)
				end
			}),
			Compose.show(function(p5): boolean
				-- upvalues: ReadFunction (upval), p4 (copy)
				local ReadResult = ReadFunction(p4.form, p5) or "dot"
				assert(ReadResult == "dot" or (ReadResult == "ring" or (ReadResult == "square" or ReadResult == "dash")), "Facet StatusIndicator invalid form")
				
				return ReadResult == "ring"
			end, function()
				-- upvalues: p1 (upval), Host (upval), TypesEnum (upval), ReadFunction (upval), p4 (copy), ControlSizeFunction (upval)
				return p1.styled(Host.UIStroke("Ring")({
					ApplyStrokeMode = TypesEnum.ApplyStrokeMode.Border,
					BorderStrokePosition = TypesEnum.BorderStrokePosition.Inner,
					Thickness = function(p5): number
						-- upvalues: ReadFunction (upval), p4 (upval), ControlSizeFunction (upval)
						return (math.max(2, (math.floor((ReadFunction(p4.diameter, p5) or (if p4.controlSize then ControlSizeFunction(p4.controlSize, "iconSize", p5) elseif p4.count == nil then 12 else 24)) / 6 + 0.5))))
					end
				}), "status-ring")
			end)
		})
		
		if p4.count == nil or p4.Size ~= nil then
			if p4.count == nil then
				PropsResult[#PropsResult + 1] = Host.UIAspectRatioConstraint({
					AspectRatio = function(p5): number
						-- upvalues: ReadFunction (upval), p4 (copy)
						local ReadResult = ReadFunction(p4.form, p5) or "dot"
						assert(ReadResult == "dot" or (ReadResult == "ring" or (ReadResult == "square" or ReadResult == "dash")), "Facet StatusIndicator invalid form")
						
						return if ReadResult == "dash" then 3 else 1
					end,
					AspectType = TypesEnum.AspectType.FitWithinMaxSize
				})
			end
		else
			PropsResult[#PropsResult + 1] = Host.UISizeConstraint({
				MinSize = function(p5)
					-- upvalues: TypesVector2 (upval), ReadFunction (upval), p4 (copy), ControlSizeFunction (upval)
					return TypesVector2.new(ReadFunction(p4.diameter, p5) or (if p4.controlSize then ControlSizeFunction(p4.controlSize, "iconSize", p5) elseif p4.count == nil then 12 else 24), ReadFunction(p4.diameter, p5) or (if p4.controlSize then ControlSizeFunction(p4.controlSize, "iconSize", p5) elseif p4.count == nil then 12 else 24))
				end
			})
		end
		if p4.cutout then
			PropsResult[#PropsResult + 1] = p1.styled(Host.UIStroke("Cutout")({
				Thickness = 1,
				ApplyStrokeMode = TypesEnum.ApplyStrokeMode.Border,
				BorderStrokePosition = TypesEnum.BorderStrokePosition.Inner
			}), "cutout")
		end
		if p4.count ~= nil and p4.Size ~= nil then
			PropsResult[#PropsResult + 1] = Host.Frame("CountWidthFloor")({
				BackgroundTransparency = 1,
				Size = function(p5)
					-- upvalues: ReadFunction (upval), p1 (upval), TypesUDim2 (upval)
					local ReadResult = ReadFunction(p1.config.theme, p5)
					local Badge = if ReadResult and ReadResult.chrome then ReadResult.chrome.badge else nil
					local ContentInsets = if Badge then Badge.contentInsets else nil
					
					return TypesUDim2.new(0, 100000, 1, math.max(3, ContentInsets and ContentInsets.top or 0) + math.max(3, ContentInsets and ContentInsets.bottom or 0) - (math.max(8, ContentInsets and ContentInsets.left or 0) + math.max(8, ContentInsets and ContentInsets.right or 0)))
				end,
				Host.UIAspectRatioConstraint({
					AspectRatio = 1,
					AspectType = TypesEnum.AspectType.FitWithinMaxSize,
					DominantAxis = TypesEnum.DominantAxis.Height
				})
			})
			PropsResult[#PropsResult + 1] = Host.UIListLayout({
				HorizontalAlignment = TypesEnum.HorizontalAlignment.Center
			})
		end
		local Text = p1.styled(Host.TextLabel(PropsResult), "text")
		p1.textRole(Text, "body")
		p1.styled(Text, "badge")
		local StatusFunction = p4.status
		local Tag = nil
		
		local function apply(p5)
			-- upvalues: ReadFunction (upval), StatusFunction (copy), Tag (ref), Text (copy)
			local v1 = ReadFunction(StatusFunction, p5)
			local Neutral = if v1 == nil then "neutral" else v1
			assert(({
				neutral = true,
				info = true,
				success = true,
				warning = true,
				error = true,
				accent = true,
				voice = true,
				contrast = true
			})[Neutral], "Facet: invalid status")
			
			if Tag then
				Text:RemoveTag(Tag)
			end
			local Text = "facet-status-" .. Neutral
			Tag = Text
			Text:AddTag(Text)
		end
		
		if Compose.isValue(StatusFunction) or type(StatusFunction) == "function" then
			Compose.watch(apply)
		else
			apply()
		end
		Compose.watch(function(p5)
			-- upvalues: ReadFunction (upval), p4 (copy), Text (copy)
			local ReadResult = ReadFunction(p4.form, p5) or "dot"
			assert(ReadResult == "dot" or (ReadResult == "ring" or (ReadResult == "square" or ReadResult == "dash")), "Facet StatusIndicator invalid form")
			
			if ReadResult == "ring" then
				Text:AddTag("facet-status-hollow")
				
				return
			end
			if Text:HasTag("facet-status-hollow") then
				Text:RemoveTag("facet-status-hollow")
			end
		end)
		
		return Text
	end)
end