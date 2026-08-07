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

local _ = function(p0) --[[ line: 28 ]]
	local var7
	if not p0 then
		return true
	elseif p0.X.Offset ~= 0 then
		var7 = true
		
		if p0.Y.Scale == 0 then
			var7 = p0.Y.Offset ~= 0 and p0.X.Scale ~= 0
		end
		return var7
	end
end

local var5 = function(p1) --[[ line: 35 ]]
	local var9
	local var8 = p1
	
	if var8 then
		if var8.X.Offset ~= 0 then
			var9 = true
			
			if var8.Y.Scale == 0 then
				var9 = var8.Y.Offset ~= 0 and var8.X.Scale ~= 0
			end
		end
	else
		var9 = true
	end
	if not var9 and (p1.X.Offset ~= p1.Y.Offset or p1.X.Scale ~= p1.Y.Scale) then
		if p1.X.Offset == 0 then
			var9 = true
		else
			var8 = math.min(p1.X.Offset, p1.Y.Offset)
			p1 = UDim2.fromOffset(var8, var8)
			
			return p1
		end
	end
	return p1
end

local var6 = function(p2) --[[ line: 48 ]]
	local var10
	if p2 then
		if p2.X.Offset ~= 0 then
			var10 = true
			
			if p2.Y.Scale == 0 then
				var10 = p2.Y.Offset ~= 0 and p2.X.Scale ~= 0
			end
		end
	else
		var10 = true
	end
	if not var10 and p2.X.Offset == 0 then
		var10 = true
	end
	return var10
end

local _ = function(p3, p4, p5, p6, p7) --[[ line: 58 ]]
	-- upvalues: migrationSizeExceptionsModule (ref)
	local offset = p3.Y.Offset
	
	if offset ~= 0 and not p4 and not migrationSizeExceptionsModule[p6.name] then
		local size100 = p5.Size.Size_100
		local size600 = p5.Size.Size_600
		
		if size600 <= offset and offset <= p7 * 38 then
			offset = size600
			
			return offset
		end
		offset = math.round(offset / size100) * size100
	end
	return offset
end

return function(p8, p9, p10, p11, p12, p13, p14) --[[ line: 74 | named "getBuilderIconElement" ]]
	-- upvalues: var5 (ref), var6 (ref), migrationSizeExceptionsModule (ref), builderIconsModule (ref), t (ref), roactModule (ref), t_1 (ref)
	local size
	assert(p8.ImageRectOffset == nil and p8.ImageRectSize == nil, "ImageRect props not supported for migration icons")
	assert(p8.SliceCenter == nil and p8.SliceScale == nil, "Image slices not supported for migration icons")
	local cloned = table.clone(p8)
	
	if typeof(cloned.Size) == "table" then
		local size = cloned.Size
		cloned.Size = size:map(var5)
		cloned.TextScaled = size:map(var6)
		cloned.TextSize = size:map(function(p15) --[[ line: 97 ]]
			-- upvalues: p12 (ref), p10 (ref), p14 (ref), migrationSizeExceptionsModule (copy)
			local var17
			if p15 then
				if p15.X.Offset ~= 0 then
					var17 = true
					
					if p15.Y.Scale == 0 then
						var17 = p15.Y.Offset ~= 0 and p15.X.Scale ~= 0
					end
				end
			else
				var17 = true
			end
			if not var17 and p15.X.Offset == 0 then
				var17 = true
			end
			local p14_1 = p14 or 1
			local offset = p15.Y.Offset
			
			if offset ~= 0 and not var17 and not migrationSizeExceptionsModule[p10.name] then
				local size100 = p12.Size.Size_100
				local size600 = p12.Size.Size_600
				offset = if size600 <= offset and offset <= p14_1 * 38 then size600 else math.round(offset / size100) * size100
			end
			return offset
		end)
	else
		local var12
		size = cloned.Size
		cloned.Size = var5(size)
		
		if size then
			if size.X.Offset ~= 0 then
				var12 = true
				
				if size.Y.Scale == 0 then
					var12 = size.Y.Offset ~= 0 and size.X.Scale ~= 0
				end
			end
		else
			var12 = true
		end
		if not var12 and size.X.Offset == 0 then
			var12 = true
		end
		local var13 = var12
		cloned.TextScaled = var13
		p14 = p14 or 1
		local offset = size.Y.Offset
		
		if offset ~= 0 and not var13 and not migrationSizeExceptionsModule[p10.name] then
			local size100 = p12.Size.Size_100
			local size600 = p12.Size.Size_600
			offset = if size600 <= offset and offset <= p14 * 38 then size600 else math.round(offset / size100) * size100
		end
		cloned.TextSize = offset
	end
	cloned.Text = p10.name
	cloned.FontFace = builderIconsModule.Font[p10.variant]
	cloned.TextColor3 = cloned.ImageColor3 or p12.Color.Content.Emphasis.Color3
	cloned.TextTransparency = cloned.ImageTransparency or p12.Color.Content.Emphasis.Transparency
	cloned.ImageColor3 = nil
	cloned.ImageTransparency = nil
	cloned.ResampleMode = nil
	cloned.ScaleType = nil
	cloned.TileSize = nil
	cloned.Image = nil
	size = t[p9]
	
	if size == nil then
		error("Unsupported inner component for image set icon migration: " .. p9)
	end
	local t_2 = nil
	
	if p13 > 0 then
		if t_2 == nil then
			t_2 = {}
		end
		t_2.UITextSizeConstraint = roactModule.createElement("UITextSizeConstraint", { MaxTextSize = cloned.TextSize })
	end
	local var16 = t_1[p11]
	
	if var16 then
		if t_2 == nil then
			t_2 = {}
		end
		cloned.TextColor3 = Color3.new(1, 1, 1)
		t_2.UIGradient = roactModule.createElement("UIGradient", { Rotation = 90, Color = var16 })
	end
	if t_2 == nil then
		return roactModule.createElement(size, cloned)
	end
	t_2.Children = roactModule.createFragment(p8[roactModule.Children])
	
	return roactModule.createElement(size, cloned, t_2)
end