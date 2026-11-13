local _ = require("./types")
local _ = require("./engine_types")
local _ = require("../vendor/compose/core")
local MediaReadinessModule = require("./media_readiness")
local _ = require("./control_types")
local _ = require("./media_props")
local _ = require("./media_shared")

return function(p1, p2, p3)
	-- upvalues: MediaReadinessModule (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local Types = p1.types
	local ReadFunction = p1.read
	local BindFunction = p3.bind
	local TypesEnum = Types.Enum
	local TypesUDim2 = Types.UDim2
	local ControlSizeFunction = p1.controlSize
	p2.Image = p1.construct("Image", function(Image)
		-- upvalues: ReadFunction (copy), Compose (copy), TypesEnum (copy), BindFunction (copy), ControlSizeFunction (copy), ReadFunction (copy), TypesUDim2 (copy), Types (copy), Host (copy), p1 (copy), MediaReadinessModule (upval)
		local list = {
			"image", "tint", "scaleMode", "tileSize", "sliceCenter", "sliceScale",
			"paintRect", "resample", "shape", "width", "height", "aspectRatio"
		}
		local ReadResult = ReadFunction(Image.scaleMode)
		local IsValue = Compose.isValue(Image.scaleMode) or type(Image.scaleMode) == "function"
		assert(not IsValue or Image.tileSize == nil and Image.sliceCenter == nil, "Facet UI.Image: tile and slice are static; author scaleMode as a word with its geometry")
		
		if ReadResult == "tile" then
			local TileSize = Image.tileSize
			assert(type(TileSize) == "table" and (type(TileSize.width) == "number" and (type(TileSize.height) == "number" and (TileSize.width > 0 and (TileSize.height > 0 and TileSize.width % 1 == 0)))) and TileSize.height % 1 == 0, "Facet UI.Image: scaleMode tile requires tileSize = { width, height } in whole pixels above zero")
		else
			assert(Image.tileSize == nil, "Facet UI.Image: tileSize requires scaleMode tile")
		end
		if ReadResult == "slice" then
			local SliceCenter = Image.sliceCenter
			assert(type(SliceCenter) == "table" and (type(SliceCenter.x0) == "number" and (type(SliceCenter.y0) == "number" and (type(SliceCenter.x1) == "number" and (type(SliceCenter.y1) == "number" and SliceCenter.x0 < SliceCenter.x1)))) and SliceCenter.y0 < SliceCenter.y1, "Facet UI.Image: scaleMode slice requires sliceCenter = { x0, y0, x1, y1 } in source pixels")
			assert(Image.sliceScale == nil or type(Image.sliceScale) == "number" and Image.sliceScale > 0, "Facet UI.Image: sliceScale must be above zero")
		else
			assert(Image.sliceCenter == nil, "Facet UI.Image: sliceCenter requires scaleMode slice")
			assert(Image.sliceScale == nil, "Facet UI.Image: sliceScale requires scaleMode slice")
		end
		local PaintRect = Image.paintRect
		
		if PaintRect ~= nil then
			assert(type(PaintRect) == "table" and (type(PaintRect.x0) == "number" and (type(PaintRect.y0) == "number" and (type(PaintRect.x1) == "number" and (type(PaintRect.y1) == "number" and (type(PaintRect.width) == "number" and (type(PaintRect.height) == "number" and (PaintRect.x0 >= 0 and (PaintRect.y0 >= 0 and (PaintRect.x0 < PaintRect.x1 and (PaintRect.y0 < PaintRect.y1 and PaintRect.x1 <= PaintRect.width)))))))))) and PaintRect.y1 <= PaintRect.height, "Facet UI.Image: paintRect = { x0, y0, x1, y1, width, height } is the rectangle of the paint, inside an image of width by height source pixels")
			assert(not Compose.isValue(Image.image) and type(Image.image) ~= "function", "Facet UI.Image: paintRect belongs to one image; author image as a static string with it")
		end
		assert(Image.shape == nil or (Image.shape == "rect" or Image.shape == "circle"), "Facet UI.Image: shape must be rect or circle")
		assert(Image.shape ~= "circle" or ReadResult ~= "slice", "Facet UI.Image: a circle cannot slice; use fit, fill, crop, stretch or tile")
		local AspectRatio: number = Image.aspectRatio
		assert(AspectRatio == nil or type(AspectRatio) == "number" and AspectRatio > 0 and AspectRatio < 1e999, "Facet UI.Image: aspectRatio must be a number above zero")
		assert(AspectRatio == nil or Image.shape ~= "circle", "Facet UI.Image: a circle has its own aspect ratio")
		
		local function _(p4: number, p5)
			if p4 == nil then
				return 0, p5
			elseif p4 == "fill" then
				return 1, 0
			else
				assert(type(p4) == "number" and p4 == p4 and p4 >= 0, "Facet UI.Image: width and height must be fill or a number of pixels, 0 or more")
				
				return 0, p4
			end
		end
		
		local config = {
			fit = TypesEnum.ScaleType.Fit,
			fill = TypesEnum.ScaleType.Crop,
			crop = TypesEnum.ScaleType.Crop,
			stretch = TypesEnum.ScaleType.Stretch,
			tile = TypesEnum.ScaleType.Tile,
			slice = TypesEnum.ScaleType.Slice
		}
		local UIAspectRatioConstraintResults = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Image = BindFunction(Image.image, ""),
			Size = function(p4)
				-- upvalues: ControlSizeFunction (upval), ReadFunction (upval), Image (copy), AspectRatio (copy), TypesUDim2 (upval)
				local Height = ControlSizeFunction(nil, "height", p4)
				local ReadResult = ReadFunction(Image.width, p4)
				local ReadResult1 = ReadFunction(Image.height, p4)
				
				if AspectRatio ~= nil then
					if ReadResult == nil and ReadResult1 == nil then
						ReadResult = Height * AspectRatio
						ReadResult1 = Height
					elseif ReadResult1 == nil then
						ReadResult1 = if type(ReadResult) == "number" then ReadResult / AspectRatio else "fill"
					elseif ReadResult == nil then
						ReadResult = if type(ReadResult1) == "number" then ReadResult1 * AspectRatio else "fill"
					end
				end
				local Height1 = nil
				local v1 = nil
				if ReadResult == nil then
					v1 = 0
					Height1 = Height
				elseif ReadResult == "fill" then
					v1 = 1
					Height1 = 0
				else
					assert(type(ReadResult) == "number" and ReadResult == ReadResult and ReadResult >= 0, "Facet UI.Image: width and height must be fill or a number of pixels, 0 or more")
					v1 = 0
					Height1 = ReadResult
				end
				local Height2 = nil
				local v2 = nil
				if ReadResult1 == nil then
					v2 = 0
					Height2 = Height
				elseif ReadResult1 == "fill" then
					v2 = 1
					Height2 = 0
				else
					assert(type(ReadResult1) == "number" and ReadResult1 == ReadResult1 and ReadResult1 >= 0, "Facet UI.Image: width and height must be fill or a number of pixels, 0 or more")
					v2 = 0
					Height2 = ReadResult1
				end
				return TypesUDim2.new(v1, Height1, v2, Height2)
			end
		}
		
		if Image.tint ~= nil then
			UIAspectRatioConstraintResults.ImageColor3 = Image.tint
		end
		if Image.scaleMode ~= nil then
			function UIAspectRatioConstraintResults.ScaleType(p4)
				-- upvalues: ReadFunction (upval), Image (copy), IsValue (copy), config (copy)
				local ReadResult = ReadFunction(Image.scaleMode, p4)
				assert(not IsValue or ReadResult ~= "tile" and ReadResult ~= "slice", "Facet UI.Image: a bound scaleMode cannot be tile or slice, which need static geometry")
				
				return (assert(config[ReadResult or "stretch"], "Facet UI.Image: scaleMode must be fit, fill, crop, stretch, tile or slice"))
			end
		end
		if Image.tileSize ~= nil then
			UIAspectRatioConstraintResults.TileSize = TypesUDim2.fromOffset(Image.tileSize.width, Image.tileSize.height)
		end
		if Image.sliceCenter ~= nil then
			local SliceCenter = Image.sliceCenter
			UIAspectRatioConstraintResults.SliceCenter = Types.Rect.new(SliceCenter.x0, SliceCenter.y0, SliceCenter.x1, SliceCenter.y1)
			UIAspectRatioConstraintResults.SliceScale = Image.sliceScale or 1
		end
		if Image.resample ~= nil then
			function UIAspectRatioConstraintResults.ResampleMode(p4)
				-- upvalues: ReadFunction (upval), Image (copy), TypesEnum (upval)
				local ReadResult = ReadFunction(Image.resample, p4) or "default"
				assert(ReadResult == "default" or ReadResult == "pixelated", "Facet UI.Image: resample must be default or pixelated")
				
				return if ReadResult == "pixelated" then TypesEnum.ResamplerMode.Pixelated else TypesEnum.ResamplerMode.Default
			end
		end
		if Image.shape == "circle" then
			UIAspectRatioConstraintResults[#UIAspectRatioConstraintResults + 1] = Host.UICorner({ CornerRadius = p1.round })
			UIAspectRatioConstraintResults[#UIAspectRatioConstraintResults + 1] = Host.UIAspectRatioConstraint({ AspectRatio = 1 })
		end
		if AspectRatio ~= nil then
			UIAspectRatioConstraintResults[#UIAspectRatioConstraintResults + 1] = Host.UIAspectRatioConstraint({
				AspectRatio = AspectRatio,
				DominantAxis = if Image.width == nil and Image.height ~= nil then TypesEnum.DominantAxis.Height else TypesEnum.DominantAxis.Width,
				AspectType = function(p4)
					-- upvalues: ReadFunction (upval), Image (copy), TypesEnum (upval)
					local ReadResult = ReadFunction(Image.width, p4)
					local ReadResult1 = ReadFunction(Image.height, p4)
					local NoReadResult: boolean = ReadResult == "fill" and ReadResult1 == nil or ReadResult1 == "fill" and ReadResult == nil
					
					return if NoReadResult then TypesEnum.AspectType.ScaleWithParentSize else TypesEnum.AspectType.FitWithinMaxSize
				end
			})
		end
		local ImageLabelResult = Host.ImageLabel(p1.props(Image, list, UIAspectRatioConstraintResults))
		
		if PaintRect ~= nil then
			ImageLabelResult:SetAttribute("FacetPaintRect", Types.Rect.new(PaintRect.x0, PaintRect.y0, PaintRect.x1, PaintRect.y1))
			ImageLabelResult:SetAttribute("FacetSourceSize", Types.Vector2.new(PaintRect.width, PaintRect.height))
		end
		MediaReadinessModule(p1, ImageLabelResult, Image.ImageTransparency)
		
		return ImageLabelResult
	end)
end