local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Image = FoundationModule.Image
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Image (copy)
	local UseTokensResult = UseTokensFunction()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseTokensResult (copy)
		return {
			{
				id = "Black",
				style = UseTokensResult.Color.Extended.Black.Black_100
			},
			{
				id = "White",
				style = UseTokensResult.Color.Extended.White.White_100
			},
			{
				id = "Checkerboard",
				image = "rbxassetid://6372755229",
				style = UseTokensResult.Color.Extended.White.White_0
			}
		}
	end, { UseTokensResult })
	local UseStateResult, UseStateResult2 = ReactModule.useState(1)
	local UseRefResult = ReactModule.useRef(false)
	local AutoRotateSecondsRatio = if p1.autoRotateSeconds then p1.autoRotateSeconds / #UseMemoResult else 0
	ReactModule.useEffect(function()
		-- upvalues: AutoRotateSecondsRatio (copy), UseMemoResult (copy), UseRefResult (copy), UseStateResult2 (copy)
		if AutoRotateSecondsRatio <= 0 then
			return function() end
		else
			task.spawn(function()
				-- upvalues: UseMemoResult (upval), AutoRotateSecondsRatio (upval), UseRefResult (upval), UseStateResult2 (upval)
				for _ = 2, #UseMemoResult do
					task.wait(AutoRotateSecondsRatio)
					
					if UseRefResult.current then break end
					UseStateResult2(function(p2: number): number
						-- upvalues: UseMemoResult (upval)
						return p2 % #UseMemoResult + 1
					end)
				end
			end)
			
			return function()
				-- upvalues: UseRefResult (upval)
				UseRefResult.current = true
			end
		end
	end, { AutoRotateSecondsRatio, UseMemoResult })
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UseMemoResult[1].style)
	local Time300 = UseTokensResult.Time.Time_300
	ReactModule.useEffect(function()
		-- upvalues: UseBindingResult (copy), UseMemoResult (copy), UseStateResult (copy), Time300 (copy), UseBindingResult2 (copy)
		local Value = UseBindingResult:getValue()
		local Style = UseMemoResult[UseStateResult].style
		local Flag = false
		task.spawn(function()
			-- upvalues: Time300 (upval), Flag (ref), UseBindingResult2 (upval), Value (copy), Style (copy)
			local NewElapsed = 0
			while NewElapsed < Time300 do
				NewElapsed += task.wait()
				
				if Flag then break end
				local Smallest = math.min(NewElapsed / Time300, 1)
				UseBindingResult2({
					Color3 = Value.Color3:Lerp(Style.Color3, Smallest),
					Transparency = Value.Transparency + (Style.Transparency - Value.Transparency) * Smallest
				})
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, {
		UseStateResult,
		UseMemoResult,
		Time300,
		UseBindingResult,
		UseBindingResult2
	})
	local Elements = {}
	
	for LayoutOrder, value in UseMemoResult do
		Elements[value.id] = ReactModule.createElement(View, {
			LayoutOrder = LayoutOrder,
			tag = {
				["size-350 radius-small"] = true,
				["stroke-thick stroke-emphasis"] = LayoutOrder == UseStateResult,
				["stroke-standard stroke-default"] = LayoutOrder ~= UseStateResult
			},
			backgroundStyle = value.style,
			onActivated = function()
				-- upvalues: UseRefResult (copy), UseStateResult2 (copy), LayoutOrder (copy)
				UseRefResult.current = true
				UseStateResult2(LayoutOrder)
			end,
			testId = `ImagePreviewBackgroundSwatch{value.id}`
		}, {
			Checkerboard = value.image and ReactModule.createElement(Image, {
				tag = "size-full radius-small",
				Image = value.image,
				ScaleType = Enum.ScaleType.Tile,
				TileSize = UDim2.fromOffset(UseTokensResult.Size.Size_150, UseTokensResult.Size.Size_150)
			}) or nil
		})
	end
	return ReactModule.createElement(View, { tag = "col align-x-center gap-xsmall size-full" }, {
		Preview = ReactModule.createElement(Image, {
			LayoutOrder = 1,
			tag = "size-full aspect-1-1 radius-small clip",
			Image = "rbxassetid://6372755229",
			testId = "ImagePreviewBackground",
			backgroundStyle = UseBindingResult,
			imageStyle = UseBindingResult:map(function(p2)
				-- upvalues: UseTokensResult (copy)
				return {
					Color3 = UseTokensResult.Color.Extended.White.White_100.Color3,
					Transparency = 1 - p2.Transparency
				}
			end),
			ScaleType = Enum.ScaleType.Tile,
			TileSize = UDim2.fromOffset(UseTokensResult.Size.Size_400, UseTokensResult.Size.Size_400)
		}, {
			Asset = ReactModule.createElement(Image, {
				tag = "size-full",
				ZIndex = 2,
				testId = "ImagePreviewAsset",
				ImageContent = p1.imageContent,
				ScaleType = Enum.ScaleType.Fit
			})
		}),
		Swatches = ReactModule.createElement(View, {
			tag = "row gap-xsmall auto-xy",
			LayoutOrder = 2,
			testId = "ImagePreviewSwatches"
		}, Elements)
	})
end