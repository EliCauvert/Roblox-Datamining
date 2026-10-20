local Parent = script.Parent
local Parent1 = Parent.Parent.Parent.Parent
local RoactModule = require(Parent1.Roact)
local _ = require(Parent1.React)
local BuilderIconsModule = require(Parent1.BuilderIcons)
local MigrationSizeExceptionsModule = require(Parent.migrationSizeExceptions)
local config = { ImageLabel = "TextLabel", ImageButton = "TextButton" }
local config1 = {
	["icons/common/goldrobux"] = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.new(0.97, 0.93, 0.72)),
		ColorSequenceKeypoint.new(0.6, Color3.new(0.67, 0.58, 0.36)),
		ColorSequenceKeypoint.new(1, Color3.new(0.99, 0.88, 0.64))
	}),
	["icons/common/goldrobux_small"] = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.new(0.78, 0.71, 0.43)),
		ColorSequenceKeypoint.new(0.5, Color3.new(0.65, 0.55, 0.32)),
		ColorSequenceKeypoint.new(1, Color3.new(0.83, 0.71, 0.44))
	})
}

local function _(Vector): boolean
	return not Vector or (if Vector.X.Offset == 0 then Vector.Y.Offset ~= 0 and Vector.X.Scale ~= 0 else Vector.Y.Scale ~= 0 or Vector.Y.Offset ~= 0 and Vector.X.Scale ~= 0)
end

local function v9(Vector: UDim2): UDim2
	if not Vector or (if Vector.X.Offset == 0 then Vector.Y.Offset ~= 0 and Vector.X.Scale ~= 0 else Vector.Y.Scale ~= 0 or Vector.Y.Offset ~= 0 and Vector.X.Scale ~= 0) or Vector.X.Offset == Vector.Y.Offset and Vector.X.Scale == Vector.Y.Scale or Vector.X.Offset == 0 then
		return Vector
	else
		local Smallest = math.min(Vector.X.Offset, Vector.Y.Offset)
		Vector = UDim2.fromOffset(Smallest, Smallest)
		
		return Vector
	end
end

local function v10(Vector): boolean
	local NoVector: boolean = not Vector or (if Vector.X.Offset == 0 then Vector.Y.Offset ~= 0 and Vector.X.Scale ~= 0 else Vector.Y.Scale ~= 0 or Vector.Y.Offset ~= 0 and Vector.X.Scale ~= 0)
	
	if not NoVector and Vector.X.Offset == 0 then
		NoVector = true
	end
	return NoVector
end

local _ = function(p1, p2, p3, p4, p5: number)
	-- upvalues: MigrationSizeExceptionsModule (copy)
	local Offset = p1.Y.Offset
	
	if Offset ~= 0 and not p2 and not MigrationSizeExceptionsModule[p4.name] then
		local Size100 = p3.Size.Size_100
		local Size600 = p3.Size.Size_600
		
		if Size600 <= Offset and Offset <= p5 * 38 then
			Offset = Size600
			
			return Offset
		end
		Offset = math.round(Offset / Size100) * Size100
	end
	return Offset
end

return function(Tbl, Text, p1, p2, p3, p4: number, p5)
	-- upvalues: v9 (copy), v10 (copy), MigrationSizeExceptionsModule (copy), BuilderIconsModule (copy), config (copy), RoactModule (copy), config1 (copy)
	assert(Tbl.ImageRectOffset == nil and Tbl.ImageRectSize == nil, "ImageRect props not supported for migration icons")
	assert(Tbl.SliceCenter == nil and Tbl.SliceScale == nil, "Image slices not supported for migration icons")
	local Copy = table.clone(Tbl)
	
	if typeof(Copy.Size) == "table" then
		local Size = Copy.Size
		Copy.Size = Size:map(v9)
		Copy.TextScaled = Size:map(v10)
		Copy.TextSize = Size:map(function(Vector)
			-- upvalues: p3 (copy), p1 (copy), p5 (copy), MigrationSizeExceptionsModule (upval)
			local NoVector: boolean = not Vector or (if Vector.X.Offset == 0 then Vector.Y.Offset ~= 0 and Vector.X.Scale ~= 0 else Vector.Y.Scale ~= 0 or Vector.Y.Offset ~= 0 and Vector.X.Scale ~= 0)
			
			if not NoVector and Vector.X.Offset == 0 then
				NoVector = true
			end
			local P13 = p5 or 1
			local Offset = Vector.Y.Offset
			
			if Offset ~= 0 and not NoVector and not MigrationSizeExceptionsModule[p1.name] then
				local Size100 = p3.Size.Size_100
				local Size600 = p3.Size.Size_600
				
				if Size600 <= Offset and Offset <= P13 * 38 then
					Offset = Size600
				else
					Offset = math.round(Offset / Size100) * Size100
				end
			end
			return Offset
		end)
	else
		local Size = Copy.Size
		Copy.Size = v9(Size)
		local NoSize: boolean = not Size or (if Size.X.Offset == 0 then Size.Y.Offset ~= 0 and Size.X.Scale ~= 0 else Size.Y.Scale ~= 0 or Size.Y.Offset ~= 0 and Size.X.Scale ~= 0)
		
		if not NoSize and Size.X.Offset == 0 then
			NoSize = true
		end
		Copy.TextScaled = NoSize
		local P13 = p5 or 1
		local Offset = Size.Y.Offset
		
		if Offset ~= 0 and not NoSize and not MigrationSizeExceptionsModule[p1.name] then
			local Size100 = p3.Size.Size_100
			local Size600 = p3.Size.Size_600
			
			if Size600 <= Offset and Offset <= P13 * 38 then
				Offset = Size600
			else
				Offset = math.round(Offset / Size100) * Size100
			end
		end
		Copy.TextSize = Offset
	end
	Copy.Text = p1.name
	Copy.FontFace = BuilderIconsModule.Font[p1.variant]
	Copy.TextColor3 = Copy.ImageColor3 or p3.Color.Content.Emphasis.Color3
	Copy.TextTransparency = Copy.ImageTransparency or p3.Color.Content.Emphasis.Transparency
	Copy.ImageColor3 = nil
	Copy.ImageTransparency = nil
	Copy.ResampleMode = nil
	Copy.ScaleType = nil
	Copy.TileSize = nil
	Copy.Image = nil
	local Entry = config[Text]
	
	if Entry == nil then
		error("Unsupported inner component for image set icon migration: " .. Text)
	end
	local T = nil
	
	if p4 > 0 then
		if T == nil then
			T = {}
		end
		T.UITextSizeConstraint = RoactModule.createElement("UITextSizeConstraint", { MaxTextSize = Copy.TextSize })
	end
	local Entry1 = config1[p2]
	
	if Entry1 then
		if T == nil then
			T = {}
		end
		Copy.TextColor3 = Color3.new(1, 1, 1)
		T.UIGradient = RoactModule.createElement("UIGradient", { Rotation = 90, Color = Entry1 })
	end
	if T == nil then
		return RoactModule.createElement(Entry, Copy)
	else
		T.Children = RoactModule.createFragment(Tbl[RoactModule.Children])
		
		return RoactModule.createElement(Entry, Copy, T)
	end
end