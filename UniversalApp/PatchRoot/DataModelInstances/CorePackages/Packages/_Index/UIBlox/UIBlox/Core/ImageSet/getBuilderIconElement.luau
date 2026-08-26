local parent = script.Parent
local parent_1 = parent.Parent.Parent.Parent
local roactModule = require(parent_1.Roact)
local _ = require(parent_1.React)
local builderIconsModule = require(parent_1.BuilderIcons)
local migrationSizeExceptionsModule = require(parent.migrationSizeExceptions)
local t = { ImageLabel = "TextLabel", ImageButton = "TextButton" }
local t_1 = {
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

local _ = function(p1)
	local var1
	if not p1 then
		return true
	elseif p1.X.Offset ~= 0 then
		var1 = true
		
		if p1.Y.Scale == 0 then
			var1 = p1.Y.Offset ~= 0 and p1.X.Scale ~= 0
		end
		return var1
	end
end

local var1 = function(p1)
	local var2
	local var3 = p1
	
	if var3 then
		if var3.X.Offset ~= 0 then
			var2 = true
			
			if var3.Y.Scale == 0 then
				var2 = var3.Y.Offset ~= 0 and var3.X.Scale ~= 0
			end
		end
	else
		var2 = true
	end
	if not var2 and (p1.X.Offset ~= p1.Y.Offset or p1.X.Scale ~= p1.Y.Scale) then
		if p1.X.Offset == 0 then
			var2 = true
		else
			var3 = math.min(p1.X.Offset, p1.Y.Offset)
			p1 = UDim2.fromOffset(var3, var3)
			
			return p1
		end
	end
	return p1
end

local var2 = function(p1)
	local var3
	if p1 then
		if p1.X.Offset ~= 0 then
			var3 = true
			
			if p1.Y.Scale == 0 then
				var3 = p1.Y.Offset ~= 0 and p1.X.Scale ~= 0
			end
		end
	else
		var3 = true
	end
	if not var3 and p1.X.Offset == 0 then
		var3 = true
	end
	return var3
end

local _ = function(p1, p2, p3, p4, p5)
	-- upvalues: migrationSizeExceptionsModule (ref)
	local offset = p1.Y.Offset
	
	if offset ~= 0 and not p2 and not migrationSizeExceptionsModule[p4.name] then
		local size100 = p3.Size.Size_100
		local size600 = p3.Size.Size_600
		
		if size600 <= offset and offset <= p5 * 38 then
			offset = size600
			
			return offset
		end
		offset = math.round(offset / size100) * size100
	end
	return offset
end

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: var1 (ref), var2 (ref), migrationSizeExceptionsModule (ref), builderIconsModule (ref), t (ref), roactModule (ref), t_1 (ref)
	local size
	assert(p1.ImageRectOffset == nil and p1.ImageRectSize == nil, "ImageRect props not supported for migration icons")
	assert(p1.SliceCenter == nil and p1.SliceScale == nil, "Image slices not supported for migration icons")
	local cloned = table.clone(p1)
	
	if typeof(cloned.Size) == "table" then
		local size = cloned.Size
		cloned.Size = size:map(var1)
		cloned.TextScaled = size:map(var2)
		cloned.TextSize = size:map(function(p8)
			-- upvalues: p5 (ref), p3 (ref), p7 (ref), migrationSizeExceptionsModule (copy)
			local var3
			if p8 then
				if p8.X.Offset ~= 0 then
					var3 = true
					
					if p8.Y.Scale == 0 then
						var3 = p8.Y.Offset ~= 0 and p8.X.Scale ~= 0
					end
				end
			else
				var3 = true
			end
			if not var3 and p8.X.Offset == 0 then
				var3 = true
			end
			local p9 = p7 or 1
			local offset = p8.Y.Offset
			
			if offset ~= 0 and not var3 and not migrationSizeExceptionsModule[p3.name] then
				local size100 = p5.Size.Size_100
				local size600 = p5.Size.Size_600
				offset = if size600 <= offset and offset <= p9 * 38 then size600 else math.round(offset / size100) * size100
			end
			return offset
		end)
	else
		local var3
		size = cloned.Size
		cloned.Size = var1(size)
		
		if size then
			if size.X.Offset ~= 0 then
				var3 = true
				
				if size.Y.Scale == 0 then
					var3 = size.Y.Offset ~= 0 and size.X.Scale ~= 0
				end
			end
		else
			var3 = true
		end
		if not var3 and size.X.Offset == 0 then
			var3 = true
		end
		local var4 = var3
		cloned.TextScaled = var4
		p7 = p7 or 1
		local offset = size.Y.Offset
		
		if offset ~= 0 and not var4 and not migrationSizeExceptionsModule[p3.name] then
			local size100 = p5.Size.Size_100
			local size600 = p5.Size.Size_600
			offset = if size600 <= offset and offset <= p7 * 38 then size600 else math.round(offset / size100) * size100
		end
		cloned.TextSize = offset
	end
	cloned.Text = p3.name
	cloned.FontFace = builderIconsModule.Font[p3.variant]
	cloned.TextColor3 = cloned.ImageColor3 or p5.Color.Content.Emphasis.Color3
	cloned.TextTransparency = cloned.ImageTransparency or p5.Color.Content.Emphasis.Transparency
	cloned.ImageColor3 = nil
	cloned.ImageTransparency = nil
	cloned.ResampleMode = nil
	cloned.ScaleType = nil
	cloned.TileSize = nil
	cloned.Image = nil
	size = t[p2]
	
	if size == nil then
		error("Unsupported inner component for image set icon migration: " .. p9)
	end
	local t_2 = nil
	
	if p6 > 0 then
		if t_2 == nil then
			t_2 = {}
		end
		t_2.UITextSizeConstraint = roactModule.createElement("UITextSizeConstraint", { MaxTextSize = cloned.TextSize })
	end
	local var5 = t_1[p4]
	
	if var5 then
		if t_2 == nil then
			t_2 = {}
		end
		cloned.TextColor3 = Color3.new(1, 1, 1)
		t_2.UIGradient = roactModule.createElement("UIGradient", { Rotation = 90, Color = var5 })
	end
	if t_2 == nil then
		return roactModule.createElement(size, cloned)
	end
	t_2.Children = roactModule.createFragment(p1[roactModule.Children])
	
	return roactModule.createElement(size, cloned, t_2)
end