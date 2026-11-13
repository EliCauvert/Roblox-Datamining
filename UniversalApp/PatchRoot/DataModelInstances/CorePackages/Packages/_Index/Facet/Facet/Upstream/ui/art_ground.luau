local _ = require("../vendor/compose/core")
local _ = require("./types")
local PaintBoundsModule = require("./paint_bounds")
local NativeDecorationModule = require("./native_decoration")
local list = { "top", "right", "bottom", "left" }

local function declared(Image)
	if not Image:IsA("ImageLabel") then
		return nil, "Stretch", nil
	end
	local FacetPaintRectAttribute = Image:GetAttribute("FacetPaintRect")
	local FacetSourceSizeAttribute = Image:GetAttribute("FacetSourceSize")
	
	if typeof(FacetPaintRectAttribute) == "Rect" and typeof(FacetSourceSizeAttribute) == "Vector2" and FacetSourceSizeAttribute.X > 0 and FacetSourceSizeAttribute.Y > 0 then
		local SliceCenter = Image.SliceCenter
		
		return {
			x0 = FacetPaintRectAttribute.Min.X,
			y0 = FacetPaintRectAttribute.Min.Y,
			x1 = FacetPaintRectAttribute.Max.X,
			y1 = FacetPaintRectAttribute.Max.Y,
			width = FacetSourceSizeAttribute.X,
			height = FacetSourceSizeAttribute.Y
		}, Image.ScaleType.Name, {
			x0 = SliceCenter.Min.X,
			y0 = SliceCenter.Min.Y,
			x1 = SliceCenter.Max.X,
			y1 = SliceCenter.Max.Y,
			scale = Image.SliceScale
		}
	else
		return nil, "Stretch", nil
	end
end

return table.freeze({
	margins = function(p1)
		return p1.Compose.cell({ top = 0, right = 0, bottom = 0, left = 0 })
	end,
	padding = function(p1, Callback, p2, p3)
		-- upvalues: list (copy)
		local TypesUDim = p1.types.UDim
		
		return function(Callback1)
			-- upvalues: p1 (copy), p2 (copy), p3 (copy), list (upval), TypesUDim (copy), Callback (copy)
			local ReadResult = p1.read(p2, Callback1)
			local ReadResult1 = if type(ReadResult) == "table" then ReadResult else {
				top = ReadResult,
				right = ReadResult,
				bottom = ReadResult,
				left = ReadResult
			}
			local CallbackResult = Callback1(p3)
			local NewResults = {}
			
			for _, value in list do
				local ReadResultEntry = ReadResult1[value]
				NewResults[value] = if typeof(ReadResultEntry) == "UDim" then TypesUDim.new(ReadResultEntry.Scale, ReadResultEntry.Offset + CallbackResult[value]) else TypesUDim.new(0, Callback(ReadResultEntry, Callback1) + CallbackResult[value])
			end
			return NewResults
		end
	end,
	mount = function(p4, Frame: Frame, Image, p5)
		-- upvalues: NativeDecorationModule (copy), declared (copy), PaintBoundsModule (copy)
		local Compose = p4.Compose
		local Host = p4.Host
		local Runtime = p4.runtime
		local TypesUDim2 = p4.types.UDim2
		local TypesEnum = p4.types.Enum
		Image.AnchorPoint = p4.types.Vector2.zero
		Image.AutomaticSize = TypesEnum.AutomaticSize.None
		Image.Position = TypesUDim2.new(0, 0, 0, 0)
		Image.Size = TypesUDim2.fromScale(1, 1)
		Image.ZIndex = 0
		local Object = Host.Frame("Ground")({
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 0,
			Size = TypesUDim2.fromScale(1, 1),
			Image
		})
		Object:AddTag("facet-art-ground")
		Runtime.mount(function()
			-- upvalues: Host (copy), NativeDecorationModule (upval), Compose (copy), Runtime (copy), p4 (copy), Frame (copy), Object (copy)
			return Host.Folder("GroundBounds")({
				NativeDecorationModule(Compose, Runtime, p4.types, Frame, Object)
			})
		end, Frame)
		local DeclaredResult, DeclaredResult2, DeclaredResult3 = declared(Image)
		
		if DeclaredResult ~= nil then
			local XRatio = (DeclaredResult.x0 + DeclaredResult.width - DeclaredResult.x1) / DeclaredResult.width
			local YRatio = (DeclaredResult.y0 + DeclaredResult.height - DeclaredResult.y1) / DeclaredResult.height
			local LayoutSizeResult = p4.layoutSize(Frame, p4.layoutUnit(Frame, "ArtGroundUnit"))
			Compose.watch(function(Callback)
				-- upvalues: LayoutSizeResult (copy), p5 (copy), Frame (copy), DeclaredResult2 (copy), TypesEnum (copy), XRatio (copy), YRatio (copy), PaintBoundsModule (upval), DeclaredResult (copy), DeclaredResult3 (copy)
				local CallbackResult = Callback(LayoutSizeResult)
				
				if CallbackResult.X <= 0 or CallbackResult.Y <= 0 then return end
				local PeekResult = p5:peek()
				local AutomaticSize = Frame.AutomaticSize
				local X = CallbackResult.X
				local Y = CallbackResult.Y
				
				if DeclaredResult2 == "Stretch" then
					local IsAutomaticSizeMatch: boolean = AutomaticSize == TypesEnum.AutomaticSize.Y or AutomaticSize == TypesEnum.AutomaticSize.XY
					
					if (AutomaticSize == TypesEnum.AutomaticSize.X or AutomaticSize == TypesEnum.AutomaticSize.XY) and XRatio < 1 then
						X = (X - PeekResult.left - PeekResult.right) / (1 - XRatio)
					end
					if IsAutomaticSizeMatch and YRatio < 1 then
						Y = (Y - PeekResult.top - PeekResult.bottom) / (1 - YRatio)
					end
				end
				local PlaceResult = PaintBoundsModule.place({ x = 0, y = 0, width = X, height = Y }, DeclaredResult, DeclaredResult2, DeclaredResult3, 0)
				local config = {
					top = math.max(0, (math.floor(PlaceResult.y + 0.5))),
					right = math.max(0, (math.floor(X - PlaceResult.x - PlaceResult.width + 0.5))),
					bottom = math.max(0, (math.floor(Y - PlaceResult.y - PlaceResult.height + 0.5))),
					left = math.max(0, (math.floor(PlaceResult.x + 0.5)))
				}
				
				if config.top ~= PeekResult.top or config.right ~= PeekResult.right or config.bottom ~= PeekResult.bottom or config.left ~= PeekResult.left then
					p5:set(config)
				end
			end)
			
			return
		end
	end
})