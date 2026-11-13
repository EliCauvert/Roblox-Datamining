local _ = require("./input_kit")
local _ = require("./input_types")
local _ = require("./types")
local _ = require("./theme_types")
local _ = require("./input_props")
local _ = require("../vendor/compose/core")

return function(p1, p2, Frame: Frame, UIFlexItemResults, p3, p4, Callback, p5)
	local Runtime = p1.runtime
	local Host = p1.Host
	local ReadFunction = p1.read
	local TypesUDim = p1.types.UDim
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local TypesEnum = p1.types.Enum
	local DynamicFunction = p2.dynamic
	local HasTextFunction = p2.hasText
	local ReadFunction1 = p1.read
	local DynamicResult = p4 and DynamicFunction(Frame.AutomaticSize)
	local DynamicResult1 = DynamicResult or p4 and (Frame.AutomaticSize == nil and DynamicFunction(Frame.Size))
	
	local function _(p6, p7)
		-- upvalues: DynamicResult (copy), ReadFunction (copy), Frame (copy), TypesEnum (copy), DynamicResult1 (copy), p4 (copy)
		return if DynamicResult then function(p8)
			-- upvalues: ReadFunction (upval), Frame (upval), TypesEnum (upval), p6 (copy), p7 (copy)
			local None = ReadFunction(Frame.AutomaticSize, p8)
			
			return if None == TypesEnum.AutomaticSize.None or None == TypesEnum.AutomaticSize.Y then p6 else p7
		end elseif DynamicResult1 then function(p8)
			-- upvalues: ReadFunction (upval), Frame (upval), p6 (copy), p7 (copy)
			local Vector = ReadFunction(Frame.Size, p8)
			
			return if Vector.X.Scale > 0 or Vector.X.Offset > 0 then p6 else p7
		end elseif p4 then p6 else p7
	end
	
	local IconFunction = p1.icon
	local Flag = false
	local v1 = nil
	
	local function listRow(p6, Count: number, Captions, Described)
		-- upvalues: p1 (copy), Frame (copy), UIFlexItemResults (copy), TypesEnum (copy), v1 (ref)
		local ListRowResult, ListRowResult2, ListRowResult3 = p1.listRow({
			leading = table.move(p6, 1, Count, 1, {}),
			captions = Captions,
			trailing = table.move(p6, Count + 1, #p6, 1, {}),
			described = Described,
			controlSize = Frame.controlSize
		})
		
		if Frame.Size == nil then
			UIFlexItemResults.Size = ListRowResult2
			UIFlexItemResults.AutomaticSize = Frame.AutomaticSize or TypesEnum.AutomaticSize.Y
		end
		v1 = ListRowResult3
		
		return ListRowResult
	end
	
	local List = {}
	local HasImage = Frame.image ~= nil
	local IsAutomaticSizeMatch = false
	local Size = nil
	
	if Frame.controlSize ~= nil then
		local function iconSide(p6)
			-- upvalues: p1 (copy), Frame (copy), TypesUDim2 (copy)
			local IconSize = p1.controlSize(Frame.controlSize, "iconSize", p6)
			
			return TypesUDim2.fromOffset(IconSize, IconSize)
		end
		
		if DynamicFunction(p1.config.theme) or DynamicFunction(Frame.controlSize) then
			Size = iconSide
		else
			local IconSize = p1.controlSize(Frame.controlSize, "iconSize", nil)
			Size = TypesUDim2.fromOffset(IconSize, IconSize)
		end
	end
	if HasImage then
		assert(type(Frame.imageAspectRatio or 1.7777777777777777) == "number" and (Frame.imageAspectRatio or 1.7777777777777777) > 0, "Facet.Button: imageAspectRatio must be positive")
		local Size1 = Frame.Size
		local DynamicResult2 = DynamicFunction(Size1) or Size1 ~= nil and (Size1.Y.Scale ~= 0 or Size1.Y.Offset ~= 0)
		UIFlexItemResults.Size = Size1 or TypesUDim2.fromOffset(240, 0)
		UIFlexItemResults.AutomaticSize = Frame.AutomaticSize or (if DynamicResult2 then TypesEnum.AutomaticSize.None else TypesEnum.AutomaticSize.Y)
		IsAutomaticSizeMatch = Frame.AutomaticSize == TypesEnum.AutomaticSize.Y or (Frame.AutomaticSize == TypesEnum.AutomaticSize.XY or Frame.AutomaticSize == nil and not DynamicResult2)
		
		local _ = function(p6)
			-- upvalues: ReadFunction (copy), Frame (copy), p1 (copy)
			return if ReadFunction(Frame.corners, p6) == "square" then 0 else p1.metric("radii.control", p6)
		end
		
		local DynamicResult3 = DynamicFunction(p1.config.theme) or DynamicFunction(Frame.corners)
		table.insert(List, Host.Frame("Media")({
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			Size = TypesUDim2.fromScale(1, 0),
			Host.ImageLabel("Image")({
				Image = Frame.image,
				BackgroundTransparency = 1,
				AnchorPoint = if IsAutomaticSizeMatch then nil else TypesVector2.new(0.5, 0.5),
				Position = if IsAutomaticSizeMatch then nil else TypesUDim2.fromScale(0.5, 0.5),
				Size = if IsAutomaticSizeMatch then if DynamicResult3 then function(p6)
					-- upvalues: TypesUDim2 (copy), ReadFunction (copy), Frame (copy), p1 (copy)
					return TypesUDim2.new(1, 0, 1, if ReadFunction(Frame.corners, p6) == "square" then 0 else p1.metric("radii.control", p6))
				end else TypesUDim2.new(1, 0, 1, if ReadFunction(Frame.corners, nil) == "square" then 0 else p1.metric("radii.control", nil)) else TypesUDim2.fromScale(1, 1),
				ScaleType = if Frame.imageFraming == "fit" then TypesEnum.ScaleType.Fit else TypesEnum.ScaleType.Crop,
				Host.UICorner({
					CornerRadius = if DynamicResult3 then function(p6)
						-- upvalues: TypesUDim (copy), ReadFunction (copy), Frame (copy), p1 (copy)
						return TypesUDim.new(0, if ReadFunction(Frame.corners, p6) == "square" then 0 else p1.metric("radii.control", p6))
					end else TypesUDim.new(0, if ReadFunction(Frame.corners, nil) == "square" then 0 else p1.metric("radii.control", nil))
				}),
				if IsAutomaticSizeMatch then nil else Host.UIAspectRatioConstraint({
					AspectRatio = Frame.imageAspectRatio or 1.7777777777777777,
					AspectType = TypesEnum.AspectType.FitWithinMaxSize
				})
			}),
			if IsAutomaticSizeMatch then nil else Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Fill })
		}))
		
		if IsAutomaticSizeMatch then
			local Entry = List[1]
			local LayoutSizeResult = p1.layoutSize(Entry)
			Runtime.decorate(Entry, {
				Size = function(Callback)
					-- upvalues: TypesUDim2 (copy), LayoutSizeResult (copy), Frame (copy)
					return TypesUDim2.new(1, 0, 0, Callback(LayoutSizeResult).X / (Frame.imageAspectRatio or 1.7777777777777777))
				end
			})
		end
	end
	local Row = Frame.row or {}
	local Icon = Frame.icon or Row.icon
	assert(not (Icon and Frame.glyph), "Facet.Button chooses icon or glyph")
	
	if Icon then
		table.insert(List, IconFunction(Icon, {
			Name = "LeadingIcon",
			Size = Size,
			Visible = if DynamicFunction(Icon) then function(p6): boolean
				-- upvalues: ReadFunction (copy), Icon (copy)
				return ReadFunction(Icon, p6) ~= ""
			end else nil
		}, p3))
	end
	if Frame.glyph then
		local GlyphResult = Frame.glyph()
		assert(GlyphResult:IsA("GuiObject"), "Facet.Button glyph must return a GuiObject")
		Runtime.decorate(GlyphResult, {
			AnchorPoint = TypesVector2.zero,
			Position = TypesUDim2.fromScale(0, 0),
			Size = TypesUDim2.fromScale(1, 1),
			AutomaticSize = TypesEnum.AutomaticSize.None
		})
		local Object = Host.Frame("LeadingGlyph")({
			BackgroundTransparency = 1,
			Size = function(p6)
				-- upvalues: p1 (copy), Frame (copy), TypesUDim2 (copy)
				local IconSize = p1.controlSize(Frame.controlSize, "iconSize", p6)
				
				return TypesUDim2.fromOffset(IconSize, IconSize)
			end,
			GlyphResult
		})
		Object:AddTag("facet-button-glyph")
		table.insert(List, Object)
	end
	local HasIcon: boolean = Icon ~= nil or Frame.glyph ~= nil
	local Title = Row.title or (Frame.label or ((if HasIcon then nil else Frame.name) or ""))
	local Description = Row.description or (Frame.subtitle or Frame.hint)
	local NoHasImage: boolean = p4 and (Description ~= nil and (not Frame.row and not HasImage))
	local CountList = #List
	local List1 = {}
	local IsTitleMatch: boolean = HasIcon and (Description == nil and (not DynamicFunction(Title) and Title == ""))
	
	if (Frame.shape ~= "circle" or not Frame.icon and not Frame.glyph) and not IsTitleMatch then
		local function caption(Name, Title)
			-- upvalues: DynamicFunction (copy), ReadFunction1 (copy), ReadFunction (copy), p1 (copy), HasImage (copy), TypesUDim2 (copy), NoHasImage (copy), DynamicResult (copy), Frame (copy), TypesEnum (copy), DynamicResult1 (copy), p4 (copy), Callback (copy), Runtime (copy), Host (copy)
			local DynamicResult2 = DynamicFunction(Title)
			
			local function words(p6)
				-- upvalues: ReadFunction1 (upval), Title (copy)
				return ReadFunction1(Title, p6) or ""
			end
			
			local function shown(p6): boolean
				-- upvalues: ReadFunction (upval), Title (copy)
				local ReadResult = ReadFunction(Title, p6)
				
				return ReadResult ~= nil and ReadResult ~= ""
			end
			
			local TextFunction = p1.text
			local Label = {
				Name = Name,
				Text = if DynamicResult2 then words else ReadFunction1(Title, nil) or ""
			}
			local Visible = nil
			
			if DynamicResult2 then
				Visible = shown
			else
				local ReadResult = ReadFunction(Title, nil)
				Visible = ReadResult ~= nil and ReadResult ~= ""
			end
			Label.Visible = Visible
			local FromScaleResult = nil
			
			if HasImage then
				FromScaleResult = TypesUDim2.fromScale(1, 0)
			elseif NoHasImage then
				local FromScaleResult1 = TypesUDim2.fromScale(1, 0)
				local NewTypesUDim = TypesUDim2.new()
				FromScaleResult = if DynamicResult then function(p6)
					-- upvalues: ReadFunction (upval), Frame (upval), TypesEnum (upval), FromScaleResult1 (copy), NewTypesUDim (copy)
					local None = ReadFunction(Frame.AutomaticSize, p6)
					
					return if None == TypesEnum.AutomaticSize.None or None == TypesEnum.AutomaticSize.Y then FromScaleResult1 else NewTypesUDim
				end elseif DynamicResult1 then function(p6)
					-- upvalues: ReadFunction (upval), Frame (upval), FromScaleResult1 (copy), NewTypesUDim (copy)
					local Vector = ReadFunction(Frame.Size, p6)
					
					return if Vector.X.Scale > 0 or Vector.X.Offset > 0 then FromScaleResult1 else NewTypesUDim
				end elseif p4 then FromScaleResult1 else NewTypesUDim
			else
				FromScaleResult = TypesUDim2.new()
			end
			Label.Size = FromScaleResult
			local Y = nil
			
			if HasImage then
				Y = TypesEnum.AutomaticSize.Y
			elseif NoHasImage then
				local Y1 = TypesEnum.AutomaticSize.Y
				local XY = TypesEnum.AutomaticSize.XY
				Y = if DynamicResult then function(p6)
					-- upvalues: ReadFunction (upval), Frame (upval), TypesEnum (upval), Y1 (copy), XY (copy)
					local None = ReadFunction(Frame.AutomaticSize, p6)
					
					return if None == TypesEnum.AutomaticSize.None or None == TypesEnum.AutomaticSize.Y then Y1 else XY
				end elseif DynamicResult1 then function(p6)
					-- upvalues: ReadFunction (upval), Frame (upval), Y1 (copy), XY (copy)
					local Vector = ReadFunction(Frame.Size, p6)
					
					return if Vector.X.Scale > 0 or Vector.X.Offset > 0 then Y1 else XY
				end elseif p4 then Y1 else XY
			else
				Y = TypesEnum.AutomaticSize.XY
			end
			Label.AutomaticSize = Y
			
			if NoHasImage then
				if DynamicResult then
					local v2 = true
					local v3 = false
					
					local function TextWrapped(p6)
						-- upvalues: ReadFunction (upval), Frame (upval), TypesEnum (upval), v2 (copy), v3 (copy)
						local None = ReadFunction(Frame.AutomaticSize, p6)
						
						return if None == TypesEnum.AutomaticSize.None or None == TypesEnum.AutomaticSize.Y then v2 else v3
					end
				elseif DynamicResult1 then
					local v4 = true
					local v5 = false
					
					local function TextWrapped(p6)
						-- upvalues: ReadFunction (upval), Frame (upval), v4 (copy), v5 (copy)
						local Vector = ReadFunction(Frame.Size, p6)
						
						return if Vector.X.Scale > 0 or Vector.X.Offset > 0 then v4 else v5
					end
				else
					local TextWrapped: (any) -> any = if p4 then true else false
				end
			else
				local TextWrapped: (any) -> any = HasImage
			end
			Label.TextWrapped = TextWrapped
			local TextResult = TextFunction(Label, nil, if Name == "Title" and not NoHasImage and not HasImage then "control" else nil)
			
			if Name == "Title" then
				Callback(TextResult, Frame.textSize)
				
				if p4 then
					local AtEnd = TypesEnum.TextTruncate.AtEnd
					local None = TypesEnum.TextTruncate.None
					Runtime.decorate(TextResult, {
						TextTruncate = if DynamicResult then function(p6)
							-- upvalues: ReadFunction (upval), Frame (upval), TypesEnum (upval), AtEnd (copy), None (copy)
							local None = ReadFunction(Frame.AutomaticSize, p6)
							
							return if None == TypesEnum.AutomaticSize.None or None == TypesEnum.AutomaticSize.Y then AtEnd else None
						end elseif DynamicResult1 then function(p6)
							-- upvalues: ReadFunction (upval), Frame (upval), AtEnd (copy), None (copy)
							local Vector = ReadFunction(Frame.Size, p6)
							
							return if Vector.X.Scale > 0 or Vector.X.Offset > 0 then AtEnd else None
						end elseif p4 then AtEnd else None
					})
					Runtime.mount(function()
						-- upvalues: Host (upval), TypesEnum (upval), DynamicResult (upval), ReadFunction (upval), Frame (upval), DynamicResult1 (upval), p4 (upval)
						local Shrink = TypesEnum.UIFlexMode.Shrink
						local None = TypesEnum.UIFlexMode.None
						
						return Host.UIFlexItem({
							FlexMode = if DynamicResult then function(p6)
								-- upvalues: ReadFunction (upval), Frame (upval), TypesEnum (upval), Shrink (copy), None (copy)
								local None = ReadFunction(Frame.AutomaticSize, p6)
								
								return if None == TypesEnum.AutomaticSize.None or None == TypesEnum.AutomaticSize.Y then Shrink else None
							end elseif DynamicResult1 then function(p6)
								-- upvalues: ReadFunction (upval), Frame (upval), Shrink (copy), None (copy)
								local Vector = ReadFunction(Frame.Size, p6)
								
								return if Vector.X.Scale > 0 or Vector.X.Offset > 0 then Shrink else None
							end elseif p4 then Shrink else None
						})
					end, TextResult)
				end
			end
			return TextResult
		end
		
		if Frame.row then
			table.insert(List1, (caption("Title", Title)))
			
			if Description then
				table.insert(List1, (caption("Description", Description)))
			end
		else
			local function secondary()
				-- upvalues: Description (copy), DynamicFunction (copy), HasTextFunction (copy), caption (copy), p1 (copy)
				local v2 = assert(Description)
				
				if DynamicFunction(v2) then
					local v3 = false
					
					return p1.Compose.show(function(p6)
						-- upvalues: v3 (ref), HasTextFunction (upval), v2 (copy)
						v3 = v3 or HasTextFunction(v2, p6)
						
						return v3
					end, function()
						-- upvalues: caption (upval), v2 (copy)
						return (caption("Description", v2))
					end)
				else
					return if HasTextFunction(v2) then caption("Description", v2) else nil
				end
			end
			local Title1 = nil
			
			if Description then
				local ColumnFunction = p1.column
				local list = { caption("Title", Title), secondary() }
				local config = {
					Name = "Captions",
					Size = if HasImage then TypesUDim2.new(1, 0, 0, 0) else TypesUDim2.fromOffset(0, 0)
				}
				local Y2 = nil
				
				if HasImage then
					Y2 = TypesEnum.AutomaticSize.Y
				elseif NoHasImage then
					local Y3 = TypesEnum.AutomaticSize.Y
					local XY2 = TypesEnum.AutomaticSize.XY
					Y2 = if DynamicResult then function(p6)
						-- upvalues: ReadFunction (copy), Frame (copy), TypesEnum (copy), Y3 (copy), XY2 (copy)
						local None = ReadFunction(Frame.AutomaticSize, p6)
						
						return if None == TypesEnum.AutomaticSize.None or None == TypesEnum.AutomaticSize.Y then Y3 else XY2
					end elseif DynamicResult1 then function(p6)
						-- upvalues: ReadFunction (copy), Frame (copy), Y3 (copy), XY2 (copy)
						local Vector = ReadFunction(Frame.Size, p6)
						
						return if Vector.X.Scale > 0 or Vector.X.Offset > 0 then Y3 else XY2
					end elseif p4 then Y3 else XY2
				else
					Y2 = TypesEnum.AutomaticSize.XY
				end
				config.AutomaticSize = Y2
				local UIFlexItemResult = nil
				
				if NoHasImage then
					local Fill = TypesEnum.UIFlexMode.Fill
					local None2 = TypesEnum.UIFlexMode.None
					UIFlexItemResult = Host.UIFlexItem({
						FlexMode = if DynamicResult then function(p6)
							-- upvalues: ReadFunction (copy), Frame (copy), TypesEnum (copy), Fill (copy), None2 (copy)
							local None = ReadFunction(Frame.AutomaticSize, p6)
							
							return if None == TypesEnum.AutomaticSize.None or None == TypesEnum.AutomaticSize.Y then Fill else None2
						end elseif DynamicResult1 then function(p6)
							-- upvalues: ReadFunction (copy), Frame (copy), Fill (copy), None2 (copy)
							local Vector = ReadFunction(Frame.Size, p6)
							
							return if Vector.X.Scale > 0 or Vector.X.Offset > 0 then Fill else None2
						end elseif p4 then Fill else None2
					})
				else
					UIFlexItemResult = nil
				end
				config[1] = UIFlexItemResult
				Title1 = ColumnFunction(list, config)
			else
				Title1 = caption("Title", Title)
			end
			if HasImage then
				Title1:AddTag("facet-button-media-body")
			end
			table.insert(List, Title1)
		end
		if Row.value ~= nil then
			local Value = caption("Value", Row.value)
			Value:AddTag("facet-secondary")
			table.insert(List, Value)
		end
	end
	if Frame.row and (Frame.onActivate and not Frame.trailingIcon) then
		table.insert(List, IconFunction("chevron.trailing", { Name = "Disclosure" }, p3))
	end
	if Frame.trailingIcon then
		table.insert(List, IconFunction(Frame.trailingIcon, { Name = "TrailingIcon", Size = Size }, p3))
	end
	if p5 then
		table.insert(List, p5)
	end
	local ColumnResult = nil
	if HasImage then
		ColumnResult = p1.column(List, {
			Name = "Content",
			ZIndex = 1,
			ClipsDescendants = true,
			Size = if IsAutomaticSizeMatch then TypesUDim2.fromScale(1, 0) else TypesUDim2.fromScale(1, 1),
			AutomaticSize = if IsAutomaticSizeMatch then TypesEnum.AutomaticSize.Y else TypesEnum.AutomaticSize.None
		})
	elseif Frame.row then
		ColumnResult = listRow(List, CountList, List1, Description ~= nil)
	elseif Description then
		local RowFunction = p1.row
		local config = {
			Name = "Content",
			ZIndex = 1,
			AnchorPoint = function(p6)
				-- upvalues: HasTextFunction (copy), Description (copy), TypesVector2 (copy)
				return if HasTextFunction(Description, p6) then TypesVector2.zero else TypesVector2.new(0, 0.5)
			end,
			Position = function(p6)
				-- upvalues: HasTextFunction (copy), Description (copy), TypesUDim2 (copy)
				return if HasTextFunction(Description, p6) then TypesUDim2.fromScale(0, 0) else TypesUDim2.fromScale(0, 0.5)
			end
		}
		local FromScaleResult1 = nil
		
		if NoHasImage then
			local FromScaleResult = TypesUDim2.fromScale(1, 0)
			local NewTypesUDim = TypesUDim2.new()
			FromScaleResult1 = if DynamicResult then function(p6)
				-- upvalues: ReadFunction (copy), Frame (copy), TypesEnum (copy), FromScaleResult (copy), NewTypesUDim (copy)
				local None = ReadFunction(Frame.AutomaticSize, p6)
				
				return if None == TypesEnum.AutomaticSize.None or None == TypesEnum.AutomaticSize.Y then FromScaleResult else NewTypesUDim
			end elseif DynamicResult1 then function(p6)
				-- upvalues: ReadFunction (copy), Frame (copy), FromScaleResult (copy), NewTypesUDim (copy)
				local Vector = ReadFunction(Frame.Size, p6)
				
				return if Vector.X.Scale > 0 or Vector.X.Offset > 0 then FromScaleResult else NewTypesUDim
			end elseif p4 then FromScaleResult else NewTypesUDim
		else
			FromScaleResult1 = if Frame.TextXAlignment == nil then nil else function(p6)
				-- upvalues: HasTextFunction (copy), Description (copy), TypesUDim2 (copy)
				return if HasTextFunction(Description, p6) then TypesUDim2.fromOffset(0, 0) else TypesUDim2.fromScale(1, 0)
			end
		end
		config.Size = FromScaleResult1
		local Y1 = nil
		
		if NoHasImage then
			local Y = TypesEnum.AutomaticSize.Y
			local XY = TypesEnum.AutomaticSize.XY
			Y1 = if DynamicResult then function(p6)
				-- upvalues: ReadFunction (copy), Frame (copy), TypesEnum (copy), Y (copy), XY (copy)
				local None = ReadFunction(Frame.AutomaticSize, p6)
				
				return if None == TypesEnum.AutomaticSize.None or None == TypesEnum.AutomaticSize.Y then Y else XY
			end elseif DynamicResult1 then function(p6)
				-- upvalues: ReadFunction (copy), Frame (copy), Y (copy), XY (copy)
				local Vector = ReadFunction(Frame.Size, p6)
				
				return if Vector.X.Scale > 0 or Vector.X.Offset > 0 then Y else XY
			end elseif p4 then Y else XY
		else
			Y1 = nil
		end
		config.AutomaticSize = Y1
		ColumnResult = RowFunction(List, config)
	else
		local RowFunction1 = p1.row
		local config1 = { Name = "Content", ZIndex = 1 }
		local FromScaleResult = nil
		
		if DynamicResult1 then
			local FromScaleResult2 = TypesUDim2.fromScale(1, 1)
			local NewTypesUDim1 = TypesUDim2.new()
			FromScaleResult = if DynamicResult then function(p6)
				-- upvalues: ReadFunction (copy), Frame (copy), TypesEnum (copy), FromScaleResult2 (copy), NewTypesUDim1 (copy)
				local None = ReadFunction(Frame.AutomaticSize, p6)
				
				return if None == TypesEnum.AutomaticSize.None or None == TypesEnum.AutomaticSize.Y then FromScaleResult2 else NewTypesUDim1
			end elseif DynamicResult1 then function(p6)
				-- upvalues: ReadFunction (copy), Frame (copy), FromScaleResult2 (copy), NewTypesUDim1 (copy)
				local Vector = ReadFunction(Frame.Size, p6)
				
				return if Vector.X.Scale > 0 or Vector.X.Offset > 0 then FromScaleResult2 else NewTypesUDim1
			end elseif p4 then FromScaleResult2 else NewTypesUDim1
		else
			FromScaleResult = TypesUDim2.fromScale(1, 1)
		end
		config1.Size = FromScaleResult
		local None1 = nil
		
		if p4 then
			local None = TypesEnum.AutomaticSize.None
			local XY1 = TypesEnum.AutomaticSize.XY
			None1 = if DynamicResult then function(p6)
				-- upvalues: ReadFunction (copy), Frame (copy), TypesEnum (copy), None (copy), XY1 (copy)
				local None = ReadFunction(Frame.AutomaticSize, p6)
				
				return if None == TypesEnum.AutomaticSize.None or None == TypesEnum.AutomaticSize.Y then None else XY1
			end elseif DynamicResult1 then function(p6)
				-- upvalues: ReadFunction (copy), Frame (copy), None (copy), XY1 (copy)
				local Vector = ReadFunction(Frame.Size, p6)
				
				return if Vector.X.Scale > 0 or Vector.X.Offset > 0 then None else XY1
			end elseif p4 then None else XY1
		else
			None1 = nil
		end
		config1.AutomaticSize = None1
		ColumnResult = RowFunction1(List, config1)
	end
	if not HasImage then
		local v2 = assert(ColumnResult:FindFirstChildWhichIsA("UIListLayout"))
		v2.VerticalAlignment = TypesEnum.VerticalAlignment.Center
		
		if not Frame.row and (not Description or Frame.TextXAlignment ~= nil) then
			local TextXAlignment = Frame.TextXAlignment
			
			if TextXAlignment == nil then
				v2.HorizontalAlignment = TypesEnum.HorizontalAlignment.Center
			else
				Runtime.decorate(v2, {
					HorizontalAlignment = function(p6)
						-- upvalues: ReadFunction (copy), TextXAlignment (copy), TypesEnum (copy)
						local ReadResult = ReadFunction(TextXAlignment, p6)
						
						return if ReadResult == TypesEnum.TextXAlignment.Left then TypesEnum.HorizontalAlignment.Left elseif ReadResult == TypesEnum.TextXAlignment.Right then TypesEnum.HorizontalAlignment.Right else TypesEnum.HorizontalAlignment.Center
					end
				})
			end
		end
	end
	local LeadingIcon = if Icon and (not HasImage and not Frame.row and not Description) then ColumnResult:FindFirstChild("LeadingIcon") else nil
	
	if LeadingIcon and Frame.AutomaticSize == TypesEnum.AutomaticSize.None and Title == "" then
		Flag = true
		ColumnResult.AutomaticSize = TypesEnum.AutomaticSize.None
		UIFlexItemResults[#UIFlexItemResults + 1] = Host.UISizeConstraint("ContentFloor")({
			MinSize = function(p6)
				-- upvalues: ReadFunction (copy), p1 (copy), Frame (copy), TypesVector2 (copy)
				local ReadResult = ReadFunction(p1.config.theme, p6)
				local Control = ReadResult and (ReadResult.chrome and ReadResult.chrome.control)
				local T = if ReadFunction(Frame.appearance, p6) == "utility" then {} elseif Control then Control.contentInsets or {} else {}
				
				return TypesVector2.new(1 + (T.left or 0) + (T.right or 0), 1 + (T.top or 0) + (T.bottom or 0))
			end
		})
		Runtime.mount(function()
			-- upvalues: Host (copy), TypesEnum (copy)
			return Host.UIAspectRatioConstraint({
				AspectRatio = 1,
				AspectType = TypesEnum.AspectType.ScaleWithParentSize
			})
		end, LeadingIcon)
		Runtime.mount(function()
			-- upvalues: Host (copy), TypesVector2 (copy)
			return Host.UISizeConstraint({ MinSize = TypesVector2.new(1, 1) })
		end, LeadingIcon)
	end
	UIFlexItemResults[#UIFlexItemResults + 1] = ColumnResult
	
	return Flag, v1
end