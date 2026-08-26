local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local foundationModule = require(corePackagesService.Packages.Foundation)
local image = foundationModule.Image
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), image (ref)
	local var1 = useTokens()
	local var2 = reactModule.useMemo(function()
		-- upvalues: var1 (ref)
		return {
			{
				id = "Black",
				style = var1.Color.Extended.Black.Black_100
			},
			{
				id = "White",
				style = var1.Color.Extended.White.White_100
			},
			{
				id = "Checkerboard",
				image = "rbxassetid://6372755229",
				style = var1.Color.Extended.White.White_0
			}
		}
	end, { var1 })
	local var3, var4 = reactModule.useState(1)
	local var5 = reactModule.useRef(false)
	local var6 = if p1.autoRotateSeconds then p1.autoRotateSeconds / #var2 else 0
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var2 (ref), var5 (ref), var4 (ref)
		if var6 <= 0 then
			return function() end
		end
		task.spawn(function()
			-- upvalues: var2 (copy), var6 (copy), var5 (copy), var4 (copy)
			for _ = 2, #var2 do
				task.wait(var6)
				
				if not var5.current then
					var4(function(p2)
						-- upvalues: var2 (copy)
						return p2 % #var2 + 1
					end)
					continue
				end
				return
			end
		end)
		
		return function()
			-- upvalues: var5 (copy)
			var5.current = true
		end
	end, { var6, var2 })
	local var7, var8 = reactModule.useBinding(var2[1].style)
	local time300 = var1.Time.Time_300
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), var2 (ref), var3 (ref), time300 (ref), var8 (ref)
		local value = var7:getValue()
		local style = var2[var3].style
		local var9 = false
		task.spawn(function()
			-- upvalues: time300 (copy), var9 (write), var8 (copy), value (ref), style (ref)
			local var10 = 0
			while var10 < time300 do
				var10 += task.wait()
				
				if not var9 then
					local minValue = math.min(var10 / time300, 1)
					var8({
						Color3 = value.Color3:Lerp(style.Color3, minValue),
						Transparency = value.Transparency + (style.Transparency - value.Transparency) * minValue
					})
					continue
				end
				return
			end
		end)
		
		return function()
			-- upvalues: var9 (write)
			var9 = true
		end
	end, {
		var3,
		var2,
		time300,
		var7,
		var8
	})
	local t = {}
	
	for i, v in var2 do
		t[v.id] = reactModule.createElement(view, {
			LayoutOrder = i,
			tag = {
				["size-350 radius-small"] = true,
				["stroke-thick stroke-emphasis"] = i == var3,
				["stroke-standard stroke-default"] = i ~= var3
			},
			backgroundStyle = v.style,
			onActivated = function()
				-- upvalues: var5 (ref), var4 (ref), i (ref)
				var5.current = true
				var4(i)
			end,
			testId = `ImagePreviewBackgroundSwatch{v.id}`
		}, {
			Checkerboard = v.image and reactModule.createElement(image, {
				tag = "size-full radius-small",
				Image = v.image,
				ScaleType = Enum.ScaleType.Tile,
				TileSize = UDim2.fromOffset(var1.Size.Size_150, var1.Size.Size_150)
			}) or nil
		})
	end
	return reactModule.createElement(view, { tag = "col align-x-center gap-xsmall size-full" }, {
		Preview = reactModule.createElement(image, {
			LayoutOrder = 1,
			tag = "size-full aspect-1-1 radius-small clip",
			Image = "rbxassetid://6372755229",
			testId = "ImagePreviewBackground",
			backgroundStyle = var7,
			imageStyle = var7:map(function(p2)
				-- upvalues: var1 (ref)
				return {
					Color3 = var1.Color.Extended.White.White_100.Color3,
					Transparency = 1 - p2.Transparency
				}
			end),
			ScaleType = Enum.ScaleType.Tile,
			TileSize = UDim2.fromOffset(var1.Size.Size_400, var1.Size.Size_400)
		}, {
			Asset = reactModule.createElement(image, {
				tag = "size-full",
				ZIndex = 2,
				testId = "ImagePreviewAsset",
				ImageContent = p1.imageContent,
				ScaleType = Enum.ScaleType.Fit
			})
		}),
		Swatches = reactModule.createElement(view, {
			tag = "row gap-xsmall auto-xy",
			LayoutOrder = 2,
			testId = "ImagePreviewSwatches"
		}, t)
	})
end