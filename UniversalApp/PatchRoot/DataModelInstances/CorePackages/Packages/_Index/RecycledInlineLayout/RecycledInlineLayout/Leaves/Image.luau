local RecycledInlineLayout = script:FindFirstAncestor("RecycledInlineLayout")
local ReactModule = require(RecycledInlineLayout.Parent.React)
local ToolkitModule = require(RecycledInlineLayout.Toolkit)

local function _(p1, p2)
	return p1:map(function(p3)
		-- upvalues: p2 (copy)
		return if p3 == nil then p2 else p3
	end)
end

local Image, Image2 = ToolkitModule.defineLeaf({
	name = "Image",
	view = ReactModule.memo(function(Image)
		-- upvalues: ReactModule (copy), ToolkitModule (copy)
		local UseRefResult = ReactModule.useRef(nil)
		ToolkitModule.Utils.useTestId(Image.testId, { UseRefResult })
		local _Color3 = Color3.new(1, 1, 1)
		local MapResult = Image.ImageColor3:map(function(p1)
			-- upvalues: _Color3 (copy)
			return if p1 == nil then _Color3 else p1
		end)
		local v1 = 0
		local MapResult1 = Image.ImageTransparency:map(function(p1)
			-- upvalues: v1 (copy)
			return if p1 == nil then v1 else p1
		end)
		local _Color3_1 = Color3.new(1, 1, 1)
		local MapResult2 = Image.BackgroundColor3:map(function(p1)
			-- upvalues: _Color3_1 (copy)
			return if p1 == nil then _Color3_1 else p1
		end)
		local v2 = 1
		local Stretch = Enum.ScaleType.Stretch
		local MapResult3 = Image.ScaleType:map(function(p1)
			-- upvalues: Stretch (copy)
			return if p1 == nil then Stretch else p1
		end)
		local Default = Enum.ResamplerMode.Default
		
		return ReactModule.createElement("ImageLabel", {
			BorderSizePixel = 0,
			ref = UseRefResult,
			Size = UDim2.fromScale(1, 1),
			Image = Image.Image,
			ImageColor3 = MapResult,
			ImageTransparency = MapResult1,
			BackgroundColor3 = MapResult2,
			BackgroundTransparency = Image.BackgroundTransparency:map(function(p1)
				-- upvalues: v2 (copy)
				return if p1 == nil then v2 else p1
			end),
			ScaleType = MapResult3,
			ResampleMode = Image.ResampleMode:map(function(p1)
				-- upvalues: Default (copy)
				return if p1 == nil then Default else p1
			end)
		})
	end),
	props = {
		Width = { layout = "measure", delivery = "binding" },
		Height = { layout = "measure", delivery = "binding" },
		Image = { layout = "none", delivery = "binding" },
		ImageColor3 = { layout = "none", delivery = "binding" },
		ImageTransparency = { layout = "none", delivery = "binding" },
		BackgroundColor3 = { layout = "none", delivery = "binding" },
		BackgroundTransparency = { layout = "none", delivery = "binding" },
		ScaleType = { layout = "none", delivery = "binding" },
		ResampleMode = { layout = "none", delivery = "binding" }
	},
	measure = function(p1): Vector2
		return Vector2.new(p1.Width or 0, p1.Height or 0)
	end
})

return { Image = Image, definition = Image2 }