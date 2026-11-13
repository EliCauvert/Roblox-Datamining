local _ = require("./types")
local _ = require("../vendor/compose/core")
local NativeDecorationModule = require("./native_decoration")

return function(p1, Image, p2, Frame: Frame)
	-- upvalues: NativeDecorationModule (copy)
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local Host = p1.Host
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local TypesEnum = p1.types.Enum
	local Size = Image.Size
	local AutomaticSize = Image.AutomaticSize
	local LayoutSizeResult = p1.layoutSize(Image, p1.layoutUnit(Image, "FeedbackUnit"))
	local FeedbackUnit = Image:FindFirstChild("FeedbackUnit")
	local ScaleResult = p1.observe.Scale(p2)
	local CellResult = Compose.cell(TypesVector2.zero)
	local LayoutSizeResult1 = nil
	local CellResult1 = Compose.cell(false)
	
	local function _(p3)
		-- upvalues: p1 (copy), Frame (copy), AutomaticSize (copy), TypesEnum (copy)
		local ReadResult = p1.read(Frame.AutomaticSize, p3) or AutomaticSize
		
		return ReadResult == TypesEnum.AutomaticSize.X or ReadResult == TypesEnum.AutomaticSize.XY, ReadResult == TypesEnum.AutomaticSize.Y or ReadResult == TypesEnum.AutomaticSize.XY
	end
	
	local function moving(Callback): boolean
		-- upvalues: ScaleResult (copy), CellResult (copy)
		return Callback(ScaleResult) ~= 1 and (Callback(CellResult).X > 0 and Callback(CellResult).Y > 0)
	end
	
	Compose.watch(function(Callback)
		-- upvalues: LayoutSizeResult (copy), ScaleResult (copy), CellResult (copy)
		local CallbackResult = Callback(LayoutSizeResult)
		
		if Callback(ScaleResult) == 1 then
			CellResult:set(CallbackResult)
		end
	end)
	Runtime.decorate(Image, {
		Size = function(Callback)
			-- upvalues: p1 (copy), Frame (copy), Size (copy), ScaleResult (copy), CellResult (copy), TypesUDim2 (copy), LayoutSizeResult1 (ref), CellResult1 (copy), TypesVector2 (copy), AutomaticSize (copy), TypesEnum (copy)
			local ReadResult = p1.read(Frame.Size, Callback) or Size
			
			if Callback(ScaleResult) == 1 or (Callback(CellResult).X <= 0 or Callback(CellResult).Y <= 0) then
				return ReadResult
			end
			local CallbackResult = Callback(CellResult)
			
			if Frame.reflow then
				local CallbackResult1 = if LayoutSizeResult1 and Callback(CellResult1) then Callback(LayoutSizeResult1) else CallbackResult
				local NewTypesVector = TypesVector2.new(math.max(CallbackResult1.X, CallbackResult.X), (math.max(CallbackResult1.Y, CallbackResult.Y)))
				local ReadResult1 = p1.read(Frame.AutomaticSize, Callback) or AutomaticSize
				local IsReadResultMatch: boolean = ReadResult1 == TypesEnum.AutomaticSize.X or ReadResult1 == TypesEnum.AutomaticSize.XY
				local IsReadResultMatch1: boolean = ReadResult1 == TypesEnum.AutomaticSize.Y or ReadResult1 == TypesEnum.AutomaticSize.XY
				
				return TypesUDim2.new(if IsReadResultMatch then 0 else ReadResult.X.Scale, if IsReadResultMatch then math.ceil((math.max(ReadResult.X.Offset, NewTypesVector.X))) else ReadResult.X.Offset, if IsReadResultMatch1 then 0 else ReadResult.Y.Scale, if IsReadResultMatch1 then math.ceil((math.max(ReadResult.Y.Offset, NewTypesVector.Y))) else ReadResult.Y.Offset)
			else
				return TypesUDim2.fromOffset(math.ceil(CallbackResult.X), (math.ceil(CallbackResult.Y)))
			end
		end,
		AutomaticSize = function(Callback)
			-- upvalues: ScaleResult (copy), CellResult (copy), TypesEnum (copy), p1 (copy), Frame (copy), AutomaticSize (copy)
			return if Callback(ScaleResult) ~= 1 and (Callback(CellResult).X > 0 and Callback(CellResult).Y > 0) then TypesEnum.AutomaticSize.None else p1.read(Frame.AutomaticSize, Callback) or AutomaticSize
		end
	})
	Compose.cleanup(function()
		-- upvalues: Image (copy), p1 (copy), Frame (copy), Size (copy), AutomaticSize (copy)
		Image.Size = p1.read(Frame.Size) or Size
		Image.AutomaticSize = p1.read(Frame.AutomaticSize) or AutomaticSize
	end)
	local Label = {
		Name = "FeedbackPaint",
		Size = if Frame.reflow then function(p3)
			-- upvalues: p1 (copy), Frame (copy), AutomaticSize (copy), TypesEnum (copy), TypesUDim2 (copy)
			local ReadResult = p1.read(Frame.AutomaticSize, p3) or AutomaticSize
			local IsReadResultMatch: boolean = ReadResult == TypesEnum.AutomaticSize.X or ReadResult == TypesEnum.AutomaticSize.XY
			local IsReadResultMatch1: boolean = ReadResult == TypesEnum.AutomaticSize.Y or ReadResult == TypesEnum.AutomaticSize.XY
			
			return TypesUDim2.fromScale(if IsReadResultMatch then 0 else 1, if IsReadResultMatch1 then 0 else 1)
		end else TypesUDim2.fromScale(1, 1),
		AnchorPoint = TypesVector2.new(0.5, 0.5),
		Position = TypesUDim2.fromScale(0.5, 0.5),
		AutomaticSize = if Frame.reflow then Frame.AutomaticSize or AutomaticSize else TypesEnum.AutomaticSize.None,
		Visible = false,
		Text = "",
		p2,
		BackgroundColor3 = p1.observeStyled.BackgroundColor3(Image),
		BackgroundTransparency = p1.observeStyled.BackgroundTransparency(Image),
		BorderColor3 = p1.observeStyled.BorderColor3(Image),
		BorderSizePixel = p1.observeStyled.BorderSizePixel(Image),
		ZIndex = p1.observeStyled.ZIndex(Image)
	}
	
	if Image:IsA("TextButton") or Image:IsA("TextBox") then
		Label.Text = p1.observeStyled.Text(Image)
		Label.TextColor3 = p1.observeStyled.TextColor3(Image)
		Label.TextTransparency = p1.observeStyled.TextTransparency(Image)
		Label.TextStrokeColor3 = p1.observeStyled.TextStrokeColor3(Image)
		Label.TextStrokeTransparency = p1.observeStyled.TextStrokeTransparency(Image)
		Label.FontFace = p1.observeStyled.FontFace(Image)
		Label.TextSize = p1.observeStyled.TextSize(Image)
		Label.TextXAlignment = p1.observeStyled.TextXAlignment(Image)
		Label.TextYAlignment = p1.observeStyled.TextYAlignment(Image)
		Label.TextWrapped = p1.observeStyled.TextWrapped(Image)
		Label.RichText = p1.observeStyled.RichText(Image)
		Label.TextScaled = p1.observeStyled.TextScaled(Image)
		Label.TextTruncate = p1.observeStyled.TextTruncate(Image)
		Label.LineHeight = p1.observeStyled.LineHeight(Image)
	end
	local TextLabelResult = Host.TextLabel(Label)
	
	if Image:IsA("ImageLabel") or Image:IsA("ImageButton") then
		local _ = function(p3, p4)
			-- upvalues: Runtime (copy), Image (copy)
			local ObserveResult = Runtime.observe(Image, p3)
			
			return function(Callback: (any) -> ())
				-- upvalues: ObserveResult (copy), p4 (copy)
				Callback(ObserveResult)
				
				return p4()
			end
		end
		
		Runtime.mount(function()
			-- upvalues: Host (copy), TypesUDim2 (copy), Image (copy), Runtime (copy)
			local function v36()
				-- upvalues: Image (upval)
				return Image.Image
			end
			
			local Image1 = Runtime.observe(Image, "Image")
			
			local function Image2(Callback: (any) -> ())
				-- upvalues: Image1 (copy), v36 (copy)
				Callback(Image1)
				
				return v36()
			end
			
			local function v39()
				-- upvalues: Image (upval)
				return Image.ImageColor3
			end
			
			local ImageColor3 = Runtime.observe(Image, "ImageColor3")
			
			local function ImageColor3_1(Callback: (any) -> ())
				-- upvalues: ImageColor3 (copy), v39 (copy)
				Callback(ImageColor3)
				
				return v39()
			end
			
			local function v42()
				-- upvalues: Image (upval)
				return Image.ImageTransparency
			end
			
			local ImageTransparency = Runtime.observe(Image, "ImageTransparency")
			
			local function ImageTransparency1(Callback: (any) -> ())
				-- upvalues: ImageTransparency (copy), v42 (copy)
				Callback(ImageTransparency)
				
				return v42()
			end
			
			local function v45()
				-- upvalues: Image (upval)
				return Image.ImageRectOffset
			end
			
			local ImageRectOffset = Runtime.observe(Image, "ImageRectOffset")
			
			local function ImageRectOffset1(Callback: (any) -> ())
				-- upvalues: ImageRectOffset (copy), v45 (copy)
				Callback(ImageRectOffset)
				
				return v45()
			end
			
			local function v48()
				-- upvalues: Image (upval)
				return Image.ImageRectSize
			end
			
			local ImageRectSize = Runtime.observe(Image, "ImageRectSize")
			
			local function ImageRectSize1(Callback: (any) -> ())
				-- upvalues: ImageRectSize (copy), v48 (copy)
				Callback(ImageRectSize)
				
				return v48()
			end
			
			local function v51()
				-- upvalues: Image (upval)
				return Image.ScaleType
			end
			
			local ScaleType = Runtime.observe(Image, "ScaleType")
			
			local function ScaleType1(Callback: (any) -> ())
				-- upvalues: ScaleType (copy), v51 (copy)
				Callback(ScaleType)
				
				return v51()
			end
			
			local function v54()
				-- upvalues: Image (upval)
				return Image.SliceCenter
			end
			
			local SliceCenter = Runtime.observe(Image, "SliceCenter")
			
			local function SliceCenter1(Callback: (any) -> ())
				-- upvalues: SliceCenter (copy), v54 (copy)
				Callback(SliceCenter)
				
				return v54()
			end
			
			local function v57()
				-- upvalues: Image (upval)
				return Image.SliceScale
			end
			
			local SliceScale = Runtime.observe(Image, "SliceScale")
			
			local function SliceScale1(Callback: (any) -> ())
				-- upvalues: SliceScale (copy), v57 (copy)
				Callback(SliceScale)
				
				return v57()
			end
			
			local function v60()
				-- upvalues: Image (upval)
				return Image.TileSize
			end
			
			local TileSize = Runtime.observe(Image, "TileSize")
			
			local function TileSize1(Callback: (any) -> ())
				-- upvalues: TileSize (copy), v60 (copy)
				Callback(TileSize)
				
				return v60()
			end
			
			local function v63()
				-- upvalues: Image (upval)
				return Image.ResampleMode
			end
			
			local ResampleMode = Runtime.observe(Image, "ResampleMode")
			
			return Host.ImageLabel({
				Name = "FeedbackImage",
				BackgroundTransparency = 1,
				Size = TypesUDim2.fromScale(1, 1),
				Image = Image2,
				ImageColor3 = ImageColor3_1,
				ImageTransparency = ImageTransparency1,
				ImageRectOffset = ImageRectOffset1,
				ImageRectSize = ImageRectSize1,
				ScaleType = ScaleType1,
				SliceCenter = SliceCenter1,
				SliceScale = SliceScale1,
				TileSize = TileSize1,
				ResampleMode = function(Callback: (any) -> ())
					-- upvalues: ResampleMode (copy), v63 (copy)
					Callback(ResampleMode)
					
					return v63()
				end
			})
		end, TextLabelResult)
	end
	if Frame.reflow then
		LayoutSizeResult1 = p1.layoutSize(TextLabelResult)
	end
	local NativeDecorationModuleResult = NativeDecorationModule(Compose, Runtime, p1.types, Image, TextLabelResult, { immediate = true })
	Runtime.mount(function()
		-- upvalues: Frame (copy), Host (copy), NativeDecorationModuleResult (copy)
		return if Frame.reflow then Host.Folder("FeedbackLayer")({ NativeDecorationModuleResult }) else NativeDecorationModuleResult
	end, Image)
	Runtime.mountFragment(function()
		-- upvalues: Compose (copy), moving (copy), ScaleResult (copy), Image (copy), TextLabelResult (copy), CellResult1 (copy), Runtime (copy), Host (copy), p1 (copy), NativeDecorationModuleResult (copy), FeedbackUnit (copy)
		return {
			Compose.show(moving, function()
				-- upvalues: Compose (upval), ScaleResult (upval), Image (upval), TextLabelResult (upval), CellResult1 (upval), Runtime (upval), Host (upval), p1 (upval), NativeDecorationModuleResult (upval), FeedbackUnit (upval)
				local Tags = {}
				Compose.watch(function(Callback: (any) -> ())
					-- upvalues: ScaleResult (upval), Image (upval), Tags (ref), TextLabelResult (upval)
					Callback(ScaleResult)
					local t = {}
					
					for Tag, tag in Image:GetTags() do
						t[tag] = true
						
						if not Tags[tag] then
							TextLabelResult:AddTag(tag)
						end
					end
					for Tag in Tags do
						if not t[Tag] then
							TextLabelResult:RemoveTag(Tag)
						end
					end
					Tags = t
				end)
				Compose.cleanup(function()
					-- upvalues: Tags (ref), TextLabelResult (upval)
					for tag in Tags do
						TextLabelResult:RemoveTag(tag)
					end
				end)
				local MountFragmentResult = nil
				
				local function _()
					-- upvalues: TextLabelResult (upval), CellResult1 (upval), MountFragmentResult (ref), Runtime (upval), Host (upval), p1 (upval), NativeDecorationModuleResult (upval), FeedbackUnit (upval), Image (upval), Compose (upval)
					TextLabelResult.Visible = true
					CellResult1:set(true)
					MountFragmentResult = Runtime.mountFragment(function()
						-- upvalues: Host (upval), p1 (upval), NativeDecorationModuleResult (upval), FeedbackUnit (upval), TextLabelResult (upval), Image (upval), Runtime (upval), Compose (upval)
						local v1 = Host.UIGradient("FeedbackMask")({ Transparency = p1.types.NumberSequence.new(1) })
						local List = {}
						local Flag = true
						local GetResult = if p1.config.guiService then p1.selection.get() else nil
						
						local function move(Object)
							-- upvalues: Flag (ref), NativeDecorationModuleResult (upval), FeedbackUnit (upval), v1 (copy), TextLabelResult (upval), List (copy)
							if (Object:IsA("GuiObject") or (Object:IsA("Folder") or (Object:IsA("UIGridStyleLayout") or (Object:IsA("UICorner") or (Object:IsA("UIStroke") or (Object:IsA("UIGradient") or Object:IsA("UIShadow"))))))) and Flag and Object ~= NativeDecorationModuleResult and Object ~= FeedbackUnit and Object ~= v1 and not TextLabelResult:IsDescendantOf(Object) then
								table.insert(List, Object)
								Object.Parent = TextLabelResult
							end
						end
						
						for _, child in Image:GetChildren() do
							move(child)
						end
						Runtime.connect(Image, "ChildAdded", move)
						
						if GetResult and p1.config.guiService then
							p1.selection.set(GetResult)
						end
						local UIPadding = Image:FindFirstChildWhichIsA("UIPadding")
						local ObserveStyled = p1.observeStyled
						
						if UIPadding then
							Runtime.mount(function()
								-- upvalues: Host (upval), ObserveStyled (copy), UIPadding (copy)
								return Host.UIPadding({
									PaddingLeft = ObserveStyled.PaddingLeft(UIPadding),
									PaddingRight = ObserveStyled.PaddingRight(UIPadding),
									PaddingTop = ObserveStyled.PaddingTop(UIPadding),
									PaddingBottom = ObserveStyled.PaddingBottom(UIPadding)
								})
							end, TextLabelResult)
						end
						Compose.cleanup(function()
							-- upvalues: Flag (ref), p1 (upval), List (copy), TextLabelResult (upval), Image (upval)
							Flag = false
							local GetResult = if p1.config.guiService then p1.selection.get() else nil
							for _, value in List do
								if value.Parent == TextLabelResult then
									value.Parent = Image
								end
							end
							if GetResult and p1.config.guiService then
								p1.selection.set(GetResult)
							end
						end)
						
						return { v1 }
					end, Image)
				end
				
				local RunService = p1.config.services.RunService
				local Connection = nil
				
				if RunService then
					Connection = RunService.Heartbeat:Connect(function()
						-- upvalues: Connection (ref), TextLabelResult (upval), CellResult1 (upval), MountFragmentResult (ref), Runtime (upval), Host (upval), p1 (upval), NativeDecorationModuleResult (upval), FeedbackUnit (upval), Image (upval), Compose (upval)
						if Connection then
							Connection:Disconnect()
							Connection = nil
						end
						TextLabelResult.Visible = true
						CellResult1:set(true)
						MountFragmentResult = Runtime.mountFragment(function()
							-- upvalues: Host (upval), p1 (upval), NativeDecorationModuleResult (upval), FeedbackUnit (upval), TextLabelResult (upval), Image (upval), Runtime (upval), Compose (upval)
							local v2 = Host.UIGradient("FeedbackMask")({ Transparency = p1.types.NumberSequence.new(1) })
							local List = {}
							local Flag = true
							local GetResult = if p1.config.guiService then p1.selection.get() else nil
							
							local function move(Object)
								-- upvalues: Flag (ref), NativeDecorationModuleResult (upval), FeedbackUnit (upval), v2 (copy), TextLabelResult (upval), List (copy)
								if (Object:IsA("GuiObject") or (Object:IsA("Folder") or (Object:IsA("UIGridStyleLayout") or (Object:IsA("UICorner") or (Object:IsA("UIStroke") or (Object:IsA("UIGradient") or Object:IsA("UIShadow"))))))) and Flag and Object ~= NativeDecorationModuleResult and Object ~= FeedbackUnit and Object ~= v2 and not TextLabelResult:IsDescendantOf(Object) then
									table.insert(List, Object)
									Object.Parent = TextLabelResult
								end
							end
							
							for _, child in Image:GetChildren() do
								move(child)
							end
							Runtime.connect(Image, "ChildAdded", move)
							
							if GetResult and p1.config.guiService then
								p1.selection.set(GetResult)
							end
							local UIPadding = Image:FindFirstChildWhichIsA("UIPadding")
							local ObserveStyled = p1.observeStyled
							
							if UIPadding then
								Runtime.mount(function()
									-- upvalues: Host (upval), ObserveStyled (copy), UIPadding (copy)
									return Host.UIPadding({
										PaddingLeft = ObserveStyled.PaddingLeft(UIPadding),
										PaddingRight = ObserveStyled.PaddingRight(UIPadding),
										PaddingTop = ObserveStyled.PaddingTop(UIPadding),
										PaddingBottom = ObserveStyled.PaddingBottom(UIPadding)
									})
								end, TextLabelResult)
							end
							Compose.cleanup(function()
								-- upvalues: Flag (ref), p1 (upval), List (copy), TextLabelResult (upval), Image (upval)
								Flag = false
								local GetResult = if p1.config.guiService then p1.selection.get() else nil
								for _, value in List do
									if value.Parent == TextLabelResult then
										value.Parent = Image
									end
								end
								if GetResult and p1.config.guiService then
									p1.selection.set(GetResult)
								end
							end)
							
							return { v2 }
						end, Image)
					end)
				else
					TextLabelResult.Visible = true
					CellResult1:set(true)
					MountFragmentResult = Runtime.mountFragment(function()
						-- upvalues: Host (upval), p1 (upval), NativeDecorationModuleResult (upval), FeedbackUnit (upval), TextLabelResult (upval), Image (upval), Runtime (upval), Compose (upval)
						local v3 = Host.UIGradient("FeedbackMask")({ Transparency = p1.types.NumberSequence.new(1) })
						local List = {}
						local Flag = true
						local GetResult = if p1.config.guiService then p1.selection.get() else nil
						
						local function move(Object)
							-- upvalues: Flag (ref), NativeDecorationModuleResult (upval), FeedbackUnit (upval), v3 (copy), TextLabelResult (upval), List (copy)
							if (Object:IsA("GuiObject") or (Object:IsA("Folder") or (Object:IsA("UIGridStyleLayout") or (Object:IsA("UICorner") or (Object:IsA("UIStroke") or (Object:IsA("UIGradient") or Object:IsA("UIShadow"))))))) and Flag and Object ~= NativeDecorationModuleResult and Object ~= FeedbackUnit and Object ~= v3 and not TextLabelResult:IsDescendantOf(Object) then
								table.insert(List, Object)
								Object.Parent = TextLabelResult
							end
						end
						
						for _, child in Image:GetChildren() do
							move(child)
						end
						Runtime.connect(Image, "ChildAdded", move)
						
						if GetResult and p1.config.guiService then
							p1.selection.set(GetResult)
						end
						local UIPadding = Image:FindFirstChildWhichIsA("UIPadding")
						local ObserveStyled = p1.observeStyled
						
						if UIPadding then
							Runtime.mount(function()
								-- upvalues: Host (upval), ObserveStyled (copy), UIPadding (copy)
								return Host.UIPadding({
									PaddingLeft = ObserveStyled.PaddingLeft(UIPadding),
									PaddingRight = ObserveStyled.PaddingRight(UIPadding),
									PaddingTop = ObserveStyled.PaddingTop(UIPadding),
									PaddingBottom = ObserveStyled.PaddingBottom(UIPadding)
								})
							end, TextLabelResult)
						end
						Compose.cleanup(function()
							-- upvalues: Flag (ref), p1 (upval), List (copy), TextLabelResult (upval), Image (upval)
							Flag = false
							local GetResult = if p1.config.guiService then p1.selection.get() else nil
							for _, value in List do
								if value.Parent == TextLabelResult then
									value.Parent = Image
								end
							end
							if GetResult and p1.config.guiService then
								p1.selection.set(GetResult)
							end
						end)
						
						return { v3 }
					end, Image)
				end
				Compose.cleanup(function()
					-- upvalues: Connection (ref), MountFragmentResult (ref), TextLabelResult (upval), CellResult1 (upval)
					if Connection then
						Connection:Disconnect()
					end
					if MountFragmentResult then
						MountFragmentResult()
					end
					TextLabelResult.Visible = false
					CellResult1:set(false)
				end)
				
				return Compose.fragment(function()
					return {}
				end)
			end)
		}
	end, Image)
	
	return TextLabelResult
end