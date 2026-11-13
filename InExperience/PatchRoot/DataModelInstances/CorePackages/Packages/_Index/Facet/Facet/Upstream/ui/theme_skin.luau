local AmbientModule = require("./ambient")
local _ = require("../vendor/compose/core")
local _ = require("./theme_types")
local _ = require("./engine_types")
local NativeDecorationModule = require("./native_decoration")
local ThemeSupportModule = require("./theme_support")
local ReadFunction = ThemeSupportModule.read
local TypesForFunction = ThemeSupportModule.typesFor
local DeeplyFrozenFunction = ThemeSupportModule.deeplyFrozen
local ShadowPresets = ThemeSupportModule.shadowPresets

local function variantAsset(p1, State, p2)
	if type(p1) == "string" then
		return p1, {}
	elseif type(p1) ~= "table" then
		return nil, {}
	else
		local Asset = p1.asset
		
		if Asset ~= nil then
			return Asset, p1
		end
		local Hover = (if State == "hover" then p1.hover elseif State == "pressed" then p1.pressed elseif State == "selected" then p1.selected elseif State == "disabled" then p1.disabled else nil) or ((if p2 then p1.selected else nil) or p1.default)
		
		if type(Hover) == "table" then
			return Hover.asset, Hover
		else
			return Hover, {}
		end
	end
end

local function grown(p1, p2, Vector)
	local Size = p2.Size
	
	if p2.text and Vector.X > 0 then
		local TextInsets = p2.textInsets or {}
		
		return p1.UDim2.new(Size.X.Scale, math.max(Size.X.Offset, math.ceil(Vector.X) + (TextInsets.left or 0) + (TextInsets.right or 0)), Size.Y.Scale, (math.max(Size.Y.Offset, math.ceil(Vector.Y) + (TextInsets.top or 0) + (TextInsets.bottom or 0))))
	else
		return Size
	end
end

return function(p1, p2, p3, p4, Callback, p5, p6)
	-- upvalues: ReadFunction (copy), TypesForFunction (copy), ShadowPresets (copy), DeeplyFrozenFunction (copy), variantAsset (copy), ThemeSupportModule (copy), AmbientModule (copy), grown (copy), NativeDecorationModule (copy)
	local ColorFunction = p2.color
	local WhiteFunction = p2.white
	local P11 = p6 or {}
	
	local function _(p7: number, p8): number
		-- upvalues: ReadFunction (upval), P11 (copy)
		local ClampedValue = math.clamp(ReadFunction(P11.shadowTransparency, p8) or 0, 0, 1)
		
		return if ClampedValue == 0 then p7 else 1 - (1 - p7) * (1 - ClampedValue)
	end
	
	local TypesForResult = TypesForFunction(P11)
	local Constructors = p4.constructors
	local TypesForResultUDim2 = TypesForResult.UDim2
	local TypesForResultVector2 = TypesForResult.Vector2
	
	local function axis(BlurRadius)
		local BlurRadius1 = BlurRadius or {}
		
		return BlurRadius1.scale or 0, BlurRadius1.offset or 0
	end
	
	local function pair(Offset)
		-- upvalues: TypesForResultUDim2 (copy)
		local Offset1 = Offset or {}
		local X = Offset1.x or {}
		local Y = Offset1.y or {}
		
		return TypesForResultUDim2.new(X.scale or 0, X.offset or 0, Y.scale or 0, Y.offset or 0)
	end
	
	if not p3.isValue(Callback) and type(Callback) ~= "function" then
		local ReadResult = ReadFunction(Callback) or p1
		local Chrome = ReadResult.chrome
		local ChromeEntry = if Chrome then Chrome[p5] else nil
		
		if ChromeEntry == nil or ChromeEntry.kind == "native" or ChromeEntry.kind == "none" then
			local ShowResults = Constructors.Frame("Skin")({
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = P11.Size or TypesForResultUDim2.fromScale(1, 1),
				AnchorPoint = P11.AnchorPoint or TypesForResultVector2.new(0, 0),
				Position = P11.Position or TypesForResultUDim2.fromScale(0, 0),
				ZIndex = P11.ZIndex or 0
			})
			local Shadow = ChromeEntry and ChromeEntry.shadow
			local Shadow1 = if type(Shadow) == "string" then (ReadResult.style.shadows or {})[Shadow] or ShadowPresets[Shadow] else Shadow
			
			if type(Shadow) == "string" then
				assert(Shadow1 ~= nil, "Facet theme unknown shadow preset")
			end
			if Shadow1 then
				p4.mount(function()
					-- upvalues: Constructors (copy), ColorFunction (copy), TypesForResult (copy), Shadow1 (copy), P11 (copy), ReadFunction (upval), axis (copy), TypesForResultUDim2 (copy)
					local Offset = Shadow1.offset or {}
					local X = Offset.x or {}
					local Scale = X.scale or 0
					local Offset1 = X.offset or 0
					local Y = Offset.y or {}
					local Spread = Shadow1.spread or {}
					local X1 = Spread.x or {}
					local Y1 = Spread.y or {}
					
					return Constructors.UIShadow("ChromeShadow")({
						Color = ColorFunction(TypesForResult, Shadow1.color or { r = 0, g = 0, b = 0 }),
						Transparency = if P11.shadowTransparency == nil then Shadow1.transparency or 0.5 else function(p7)
							-- upvalues: Shadow1 (upval), ReadFunction (upval), P11 (upval)
							local Transparency = Shadow1.transparency or 0.5
							local ClampedValue = math.clamp(ReadFunction(P11.shadowTransparency, p7) or 0, 0, 1)
							
							return if ClampedValue == 0 then Transparency else 1 - (1 - Transparency) * (1 - ClampedValue)
						end,
						ZIndex = Shadow1.zIndex or -1,
						Enabled = Shadow1.enabled ~= false,
						BlurRadius = TypesForResult.UDim.new(axis(Shadow1.blurRadius)),
						Offset = TypesForResultUDim2.new(Scale, Offset1, Y.scale or 0, Y.offset or 0),
						Spread = TypesForResultUDim2.new(X1.scale or 0, X1.offset or 0, Y1.scale or 0, Y1.offset or 0)
					})
				end, P11.target or ShowResults)
			end
			if P11.target == nil then
				return ShowResults
			else
				ShowResults.Size = TypesForResultUDim2.fromOffset(0, 0)
				ShowResults.Visible = false
				
				return ShowResults
			end
		end
	end
	local List = {}
	local IsTextBox = P11.target ~= nil and P11.target:IsA("TextBox")
	
	local function buildLayers(p7)
		-- upvalues: ReadFunction (upval), Callback (copy), p1 (copy), p5 (copy), IsTextBox (copy), P11 (copy), List (copy), DeeplyFrozenFunction (upval), variantAsset (upval), TypesForResultUDim2 (copy), TypesForResultVector2 (copy), TypesForResult (copy), ColorFunction (copy), WhiteFunction (copy), ThemeSupportModule (upval), p2 (copy)
		local ReadResult = ReadFunction(Callback, p7) or p1
		local Chrome = ReadResult.chrome
		local ChromeEntry = if Chrome then Chrome[p5] else nil
		
		if ChromeEntry == nil or ChromeEntry.kind == "native" or ChromeEntry.kind == "none" or IsTextBox then
			return {}
		end
		local ReadResult1 = ReadFunction(P11.state, p7) or "default"
		local ReadResult2 = if p5 == "control" then ReadFunction(P11.emphasisTheme, p7) else nil
		local IsReadResult = ReadFunction(P11.selected, p7) == true
		local ReadResult3 = if p5 == "barCap" then ReadFunction(P11.direction, p7) or "ltr" else nil
		local ReadResult4 = ReadFunction(P11.fit, p7)
		
		for _, value in List do
			if value.package == ReadResult and value.emphasis == ReadResult2 and value.state == ReadResult1 and value.selected == IsReadResult and value.direction == ReadResult3 and value.fit == ReadResult4 then
				return value.layers
			end
		end
		local Layers = {}
		
		local function finish()
			-- upvalues: DeeplyFrozenFunction (upval), ReadResult (copy), ReadResult2 (copy), ReadResult1 (copy), IsReadResult (copy), ReadResult3 (copy), ReadResult4 (copy), Layers (copy), List (upval)
			if DeeplyFrozenFunction(ReadResult, {}) then
				table.insert(List, 1, {
					package = ReadResult,
					emphasis = ReadResult2,
					state = ReadResult1,
					selected = IsReadResult,
					direction = ReadResult3,
					fit = ReadResult4,
					layers = Layers
				})
				
				if #List > 2 then
					table.remove(List)
				end
			end
			return Layers
		end
		
		local function image(p8, Id, FromOffsetResult, FromScaleResult, NewResult, StartAsset, Enabled)
			-- upvalues: variantAsset (upval), ReadResult1 (copy), IsReadResult (copy), ReadResult (copy), TypesForResultUDim2 (upval), TypesForResultVector2 (upval), P11 (upval), TypesForResult (upval), ColorFunction (upval), WhiteFunction (upval), Layers (copy)
			local VariantAssetResult, VariantAssetResult2 = variantAsset(StartAsset or p8.asset, ReadResult1, IsReadResult or Enabled == true)
			local Assets = ReadResult.assets
			local Asset = if VariantAssetResult and Assets then Assets[VariantAssetResult] else nil
			
			if not Asset then return end
			local config = {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				SliceScale = 1,
				id = Id,
				text = p8.text,
				textInsets = p8.textInsets,
				Image = Asset.content or (Asset.contentId or ""),
				Size = FromOffsetResult or TypesForResultUDim2.fromScale(1, 1),
				Position = FromScaleResult or TypesForResultUDim2.fromOffset(0, 0),
				AnchorPoint = NewResult or TypesForResultVector2.new(0, 0),
				ZIndex = P11.ZIndex or 0,
				ScaleType = TypesForResult.Enum.ScaleType.Stretch,
				TileSize = TypesForResultUDim2.fromScale(1, 1),
				SliceCenter = TypesForResult.Rect.new(0, 0, 0, 0),
				ResampleMode = TypesForResult.Enum.ResamplerMode.Default,
				Rotation = VariantAssetResult2.rotation or 0,
				ImageColor3 = ColorFunction(TypesForResult, VariantAssetResult2.tint) or WhiteFunction(TypesForResult)
			}
			local SliceCenter = Asset.sliceCenter
			
			if p8.kind == "tile" or p8.tile then
				local TileSize = p8.tileSize or { w = p8.tile or 32, h = p8.tile or 32 }
				config.ScaleType = TypesForResult.Enum.ScaleType.Tile
				config.TileSize = TypesForResultUDim2.fromOffset(TileSize.w, TileSize.h)
			elseif SliceCenter and p8.sliced ~= false then
				config.ScaleType = TypesForResult.Enum.ScaleType.Slice
				config.SliceCenter = TypesForResult.Rect.new(SliceCenter.x0, SliceCenter.y0, SliceCenter.x1, SliceCenter.y1)
				config.SliceScale = Asset.sliceScale or 1
			end
			if Asset.resample == "pixelated" or ReadResult.identity.rendering == "pixel" then
				config.ResampleMode = TypesForResult.Enum.ResamplerMode.Pixelated
			end
			table.insert(Layers, config)
		end
		
		if p5 == "barCap" or p5 == "barCenter" then
			local Size = if type(ChromeEntry.size) == "table" then ChromeEntry.size else { w = 16, h = 16 }
			local IsTtb: boolean = ReadResult3 == "ttb" or ReadResult3 == "btt"
			local ReadResult4_1 = ReadResult4 or 1
			
			if ReadResult4_1 <= 0 then
				return (finish())
			end
			local FromOffsetResult = TypesForResultUDim2.fromOffset(math.round(Size.w * ReadResult4_1), (math.round(Size.h * ReadResult4_1)))
			
			if p5 == "barCenter" then
				image(ChromeEntry, "barCenter", FromOffsetResult, TypesForResultUDim2.fromScale(0.5, 0.5), TypesForResultVector2.new(0.5, 0.5))
			else
				local IsRtl: boolean = ReadResult3 == "rtl" or ReadResult3 == "btt"
				for _, value1 in { "start", "end" } do
					local IsEnd = value1 == "end"
					local v1: number = if IsEnd == IsRtl then 0 else 1
					local NewTypesForResultVector = TypesForResultVector2.new(if IsTtb then 0.5 else v1, if IsTtb then v1 else 0.5)
					image(ChromeEntry, "barCap-" .. value1, FromOffsetResult, TypesForResultUDim2.fromScale(NewTypesForResultVector.X, NewTypesForResultVector.Y), NewTypesForResultVector, (if value1 == "start" then ChromeEntry.startAsset else ChromeEntry.endAsset) or ChromeEntry.asset)
				end
			end
			return (finish())
		else
			local Layers1 = if ChromeEntry.kind == "layered" then ChromeEntry.layers or {} else { ChromeEntry }
			local v2 = nil
			
			if ReadResult2 then
				local _, ControlSelectedArtworkResult2, ControlSelectedArtworkResult3 = ThemeSupportModule.controlSelectedArtwork(ReadResult2, p1, TypesForResult, p2)
				
				if ControlSelectedArtworkResult3 then
					v2 = ControlSelectedArtworkResult2
				end
			end
			for i, value2 in Layers1 do
				local Text = p5 .. tostring(i)
				local v3 = i == v2
				
				if value2.kind == "corners" then
					local Size = if type(value2.size) == "number" then value2.size else 16
					for i1, value3 in {
						topLeft = TypesForResultVector2.new(0, 0),
						topRight = TypesForResultVector2.new(1, 0),
						bottomLeft = TypesForResultVector2.new(0, 1),
						bottomRight = TypesForResultVector2.new(1, 1)
					} do
						local Entry = ({
							topLeft = value2.topLeft,
							topRight = value2.topRight,
							bottomLeft = value2.bottomLeft,
							bottomRight = value2.bottomRight
						})[i1]
						
						if Entry or value2.asset then
							image(value2, Text .. i1, TypesForResultUDim2.fromOffset(Size, Size), TypesForResultUDim2.fromScale(value3.X, value3.Y), value3, Entry, v3 and Entry == nil)
						end
					end
				else
					if value2.kind == "edges" then
						local Thickness = value2.thickness or 8
						local Margin = value2.margin or 0
						local Sides = value2.sides or { "top", "right", "bottom", "left" }
						for _, side in Sides do
							local IsTop: boolean = side == "top" or side == "bottom"
							local IsBottom: boolean = side == "bottom" or side == "right"
							image(value2, Text .. side, if IsTop then TypesForResultUDim2.new(1, -Margin * 2, 0, Thickness) else TypesForResultUDim2.new(0, Thickness, 1, -Margin * 2), if IsTop then TypesForResultUDim2.new(0, Margin, if IsBottom then 1 else 0, 0) else TypesForResultUDim2.new(if IsBottom then 1 else 0, 0, 0, Margin), if IsTop then TypesForResultVector2.new(0, if IsBottom then 1 else 0) else TypesForResultVector2.new(if IsBottom then 1 else 0, 0), nil, v3)
						end
					elseif value2.kind == "plaque" then
						local Size = if type(value2.size) == "table" then value2.size else { w = 120, h = 30 }
						local Edge = value2.edge or "top"
						local IsTop: boolean = Edge == "top" or Edge == "bottom"
						local IsBottom: boolean = Edge == "bottom" or Edge == "right"
						local v4 = (if IsTop then Size.h else Size.w) / 2 - (value2.overhang or 0)
						local Negated = if IsBottom then -v4 else v4
						image(value2, Text, TypesForResultUDim2.fromOffset(Size.w, Size.h), if IsTop then TypesForResultUDim2.new(0.5, 0, if IsBottom then 1 else 0, Negated) else TypesForResultUDim2.new(if IsBottom then 1 else 0, Negated, 0.5, 0), TypesForResultVector2.new(0.5, 0.5), nil, v3)
					else
						image(value2, Text, nil, nil, nil, nil, v3)
					end
				end
			end
			return (finish())
		end
	end
	
	local Target = P11.target
	
	local _ = function(p8): boolean
		-- upvalues: P11 (copy), ReadFunction (upval)
		local Label = P11.label
		
		return Label ~= nil and (ReadFunction(Label, p8) or "") ~= ""
	end
	
	local function createImage(Image)
		-- upvalues: P11 (copy), ReadFunction (upval), p3 (copy), TypesForResultVector2 (copy), TypesForResult (copy), Constructors (copy), TypesForResultUDim2 (copy), p4 (copy), AmbientModule (upval), p5 (copy), grown (upval)
		local NoText = not Image.text
		
		if not NoText then
			local Label = P11.label
			NoText = Label ~= nil and (ReadFunction(Label, nil) or "") ~= ""
		end
		local config = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Name = Image.id,
			Visible = NoText,
			Image = Image.Image,
			Size = Image.Size,
			Position = Image.Position,
			AnchorPoint = Image.AnchorPoint,
			ZIndex = P11.ZIndex or 0,
			ScaleType = Image.ScaleType,
			TileSize = Image.TileSize,
			SliceCenter = Image.SliceCenter,
			SliceScale = Image.SliceScale,
			ResampleMode = Image.ResampleMode,
			Rotation = Image.Rotation,
			ImageColor3 = Image.ImageColor3
		}
		local Caption = nil
		local CellResult = p3.cell(TypesForResultVector2.new(0, 0))
		
		if P11.label then
			local CellResult1 = p3.cell(Image)
			Caption = CellResult1
			config[#config + 1] = p3.show(function(Callback): boolean
				-- upvalues: CellResult1 (copy), P11 (upval), ReadFunction (upval)
				local v5 = false
				
				if Callback(CellResult1).text == true then
					local Label = P11.label
					v5 = Label ~= nil and (ReadFunction(Label, Callback) or "") ~= ""
				end
				return v5
			end, function()
				-- upvalues: CellResult1 (copy), TypesForResult (upval), Constructors (upval), P11 (upval), TypesForResultUDim2 (upval), p4 (upval), AmbientModule (upval), p3 (upval), CellResult (copy), TypesForResultVector2 (upval)
				local Object = Constructors.TextLabel("PlaqueCaption")({
					Text = P11.label,
					Size = TypesForResultUDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
					ZIndex = 1,
					TextXAlignment = TypesForResult.Enum.TextXAlignment.Center,
					Constructors.UIPadding({
						PaddingLeft = function(Callback)
							-- upvalues: CellResult1 (upval), TypesForResult (upval)
							return TypesForResult.UDim.new(0, (Callback(CellResult1).textInsets or {}).left or 0)
						end,
						PaddingRight = function(Callback)
							-- upvalues: CellResult1 (upval), TypesForResult (upval)
							return TypesForResult.UDim.new(0, (Callback(CellResult1).textInsets or {}).right or 0)
						end,
						PaddingTop = function(Callback)
							-- upvalues: CellResult1 (upval), TypesForResult (upval)
							return TypesForResult.UDim.new(0, (Callback(CellResult1).textInsets or {}).top or 0)
						end,
						PaddingBottom = function(Callback)
							-- upvalues: CellResult1 (upval), TypesForResult (upval)
							return TypesForResult.UDim.new(0, (Callback(CellResult1).textInsets or {}).bottom or 0)
						end
					})
				})
				Object:AddTag("facet-skin-caption-text")
				local TextBounds = p4.observe(Object, "TextBounds", if AmbientModule() then { frame = true, poll = true } else nil)
				p3.watch(function(Callback)
					-- upvalues: CellResult (upval), TextBounds (copy)
					CellResult:set((Callback(TextBounds)))
				end)
				p3.cleanup(function()
					-- upvalues: CellResult (upval), TypesForResultVector2 (upval)
					CellResult:set(TypesForResultVector2.new(0, 0))
				end)
				
				return Object
			end)
		end
		local ImageLabelResult = Constructors.ImageLabel(config)
		ImageLabelResult:AddTag("facet-skin-art")
		ImageLabelResult:AddTag("facet-skin-art-" .. p5)
		
		if Caption then
			p3.watch(function(Callback)
				-- upvalues: grown (upval), TypesForResult (upval), Caption (copy), CellResult (copy), ImageLabelResult (copy)
				local GrownResult = grown(TypesForResult, Callback(Caption), Callback(CellResult))
				
				if ImageLabelResult.Size ~= GrownResult then
					ImageLabelResult.Size = GrownResult
				end
			end)
		end
		return {
			node = ImageLabelResult,
			properties = Image,
			caption = Caption,
			visible = NoText
		}
	end
	
	local function applyImage(Image, Image1, Visible)
		local Node = Image.node
		local Properties = Image.properties
		
		if Image.visible ~= Visible then
			Node.Visible = Visible
			Image.visible = Visible
		end
		if Image1 then
			if Image1.id ~= Properties.id then
				Node.Name = Image1.id
			end
			if Image1.Image ~= Properties.Image then
				Node.Image = Image1.Image
			end
			if Image1.Size ~= Properties.Size then
				Node.Size = Image1.Size
			end
			if Image1.Position ~= Properties.Position then
				Node.Position = Image1.Position
			end
			if Image1.AnchorPoint ~= Properties.AnchorPoint then
				Node.AnchorPoint = Image1.AnchorPoint
			end
			if Image1.ScaleType ~= Properties.ScaleType then
				Node.ScaleType = Image1.ScaleType
			end
			if Image1.TileSize ~= Properties.TileSize then
				Node.TileSize = Image1.TileSize
			end
			if Image1.SliceCenter ~= Properties.SliceCenter then
				Node.SliceCenter = Image1.SliceCenter
			end
			if Image1.SliceScale ~= Properties.SliceScale then
				Node.SliceScale = Image1.SliceScale
			end
			if Image1.ResampleMode ~= Properties.ResampleMode then
				Node.ResampleMode = Image1.ResampleMode
			end
			if Image1.Rotation ~= Properties.Rotation then
				Node.Rotation = Image1.Rotation
			end
			if Image1.ImageColor3 ~= Properties.ImageColor3 then
				Node.ImageColor3 = Image1.ImageColor3
			end
			local Caption = Image.caption
			
			if Caption and Image1 ~= Properties then
				Caption:set(Image1)
			end
			Image.properties = Image1
		end
	end
	
	local t = {}
	local v5 = nil
	local CellResult = p3.cell({})
	local t1 = {}
	local KeyedResult = p3.keyed({
		from = CellResult,
		render = function(p8)
			-- upvalues: createImage (copy), t (ref), t1 (copy), p3 (copy)
			local PeekResult = p8:peek()
			local Image = createImage(t[PeekResult])
			t1[PeekResult] = Image
			p3.cleanup(function()
				-- upvalues: t1 (upval), PeekResult (copy)
				t1[PeekResult] = nil
			end)
			
			return Image.node
		end
	})
	local ArtTransparency = P11.artTransparency
	local v6 = Constructors.Frame("Skin")({
		Size = P11.Size or TypesForResultUDim2.fromScale(1, 1),
		AnchorPoint = P11.AnchorPoint or TypesForResultVector2.new(0, 0),
		Position = P11.Position or TypesForResultUDim2.fromScale(0, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = P11.ZIndex or 0,
		if ArtTransparency then p3.show(function(Callback): boolean
			-- upvalues: CellResult (copy)
			return #Callback(CellResult) > 0
		end, function()
			-- upvalues: Constructors (copy), TypesForResultUDim2 (copy), ArtTransparency (copy), KeyedResult (copy)
			return Constructors.CanvasGroup("ArtFade")({
				Size = TypesForResultUDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				GroupTransparency = ArtTransparency,
				KeyedResult
			})
		end) else KeyedResult
	})
	p3.watch(function(p8)
		-- upvalues: buildLayers (copy), t (ref), v5 (ref), CellResult (copy), P11 (copy), ReadFunction (upval), t1 (copy), applyImage (copy), Target (copy)
		local Layers = buildLayers(p8)
		t = Layers
		
		if v5 and v5.Visible ~= (#Layers > 0) then
			v5.Visible = #Layers > 0
		end
		local PeekResult = CellResult:peek()
		local Largest = math.max(#Layers, (math.min(#PeekResult, 16)))
		
		if Largest ~= #PeekResult then
			local t2 = {}
			
			for i = 1, Largest do
				t2[i] = i
			end
			CellResult:set(t2)
		end
		local Label = P11.label
		local v7: boolean = Label ~= nil and (ReadFunction(Label, p8) or "") ~= ""
		for i1, value in t1 do
			local Layer = Layers[i1]
			applyImage(value, Layer, Layer ~= nil and (not Layer.text or v7))
		end
		local Flag = false
		
		for _, layer in Layers do
			if layer.text and v7 then
				Flag = true
			end
		end
		if P11.onCaption then
			P11.onCaption(Flag)
		end
		if Target then
			if #Layers > 0 then
				Target:AddTag("facet-skinned")
			else
				Target:RemoveTag("facet-skinned")
			end
			if Flag then
				Target:AddTag("facet-skin-caption")
				
				return
			end
			Target:RemoveTag("facet-skin-caption")
		end
	end)
	local FormulaResult = p3.formula(function(p9)
		-- upvalues: ReadFunction (upval), Callback (copy), p1 (copy), p5 (copy), ShadowPresets (upval)
		local ReadResult = ReadFunction(Callback, p9) or p1
		local Chrome = ReadResult.chrome
		local ChromeEntry = if Chrome then Chrome[p5] else nil
		local Shadow = if ChromeEntry then ChromeEntry.shadow else nil
		
		if type(Shadow) == "string" then
			Shadow = (ReadResult.style.shadows or {})[Shadow] or ShadowPresets[Shadow]
			assert(Shadow ~= nil, "Facet theme unknown shadow preset")
		end
		return Shadow
	end)
	local v8 = nil
	local FormulaResult1 = p3.formula(function(Callback)
		-- upvalues: FormulaResult (copy), v8 (ref)
		local CallbackResult = Callback(FormulaResult)
		
		if CallbackResult then
			v8 = CallbackResult
		end
		return v8
	end)
	p4.mountFragment(function()
		-- upvalues: p3 (copy), FormulaResult1 (copy), ColorFunction (copy), TypesForResult (copy), ReadFunction (upval), P11 (copy), FormulaResult (copy), axis (copy), pair (copy), Constructors (copy)
		return {
			p3.show(FormulaResult1, function()
				-- upvalues: ColorFunction (upval), TypesForResult (upval), FormulaResult1 (upval), ReadFunction (upval), P11 (upval), FormulaResult (upval), axis (upval), pair (upval), Constructors (upval)
				return Constructors.UIShadow({
					Name = "ChromeShadow",
					Color = function(Callback)
						-- upvalues: ColorFunction (upval), TypesForResult (upval), FormulaResult1 (upval)
						return (ColorFunction(TypesForResult, Callback(FormulaResult1).color or { r = 0, g = 0, b = 0 }))
					end,
					Transparency = function(Callback)
						-- upvalues: FormulaResult1 (upval), ReadFunction (upval), P11 (upval)
						local Transparency = Callback(FormulaResult1).transparency or 0.5
						local ClampedValue = math.clamp(ReadFunction(P11.shadowTransparency, Callback) or 0, 0, 1)
						
						return if ClampedValue == 0 then Transparency else 1 - (1 - Transparency) * (1 - ClampedValue)
					end,
					ZIndex = function(Callback)
						-- upvalues: FormulaResult1 (upval)
						return Callback(FormulaResult1).zIndex or -1
					end,
					Enabled = function(Callback): boolean
						-- upvalues: FormulaResult (upval)
						local CallbackResult = Callback(FormulaResult)
						
						return CallbackResult ~= nil and CallbackResult.enabled ~= false
					end,
					BlurRadius = function(Callback)
						-- upvalues: TypesForResult (upval), axis (upval), FormulaResult1 (upval)
						return TypesForResult.UDim.new(axis(Callback(FormulaResult1).blurRadius))
					end,
					Offset = function(Callback)
						-- upvalues: pair (upval), FormulaResult1 (upval)
						return pair(Callback(FormulaResult1).offset)
					end,
					Spread = function(Callback)
						-- upvalues: pair (upval), FormulaResult1 (upval)
						return pair(Callback(FormulaResult1).spread)
					end
				})
			end)
		}
	end, P11.target or v6)
	local NativeDecorationModuleResult = NativeDecorationModule(p3, p4, TypesForResult, P11.target, v6)
	local Target1 = P11.target
	
	if Target1 ~= nil and Target1.AutomaticSize ~= TypesForResult.Enum.AutomaticSize.None then
		v5 = NativeDecorationModuleResult
		
		if #t == 0 then
			NativeDecorationModuleResult.Visible = false
		end
	end
	return NativeDecorationModuleResult
end