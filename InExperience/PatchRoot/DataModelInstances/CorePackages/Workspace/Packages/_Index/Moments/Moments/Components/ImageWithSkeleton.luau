local contentProviderService = game:GetService("ContentProvider")
local parent = script:FindFirstAncestor("Moments").Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local foundationModule = require(parent.Foundation)
local image = foundationModule.Image
local skeleton = foundationModule.Skeleton
local view = foundationModule.View
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens
local t = { frequency = 3, dampingRatio = 1 }

local function _(p1, p2)
	-- upvalues: radius (ref)
	return if p1 == radius.Circle then UDim.new(1, 0) else UDim.new(0, p2.Radius[p1])
end

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), radius (ref), reactModule (ref), reactOtterModule (ref), contentProviderService (ref), t (ref), view (ref), image (ref), skeleton (ref)
	local var1 = useTokens()
	local radius_1 = p1.radius or radius.Medium
	local image_1 = p1.Image
	local var2 = image_1 ~= nil and image_1 ~= ""
	local var3, var4 = reactModule.useState(var2)
	local var5, var6 = reactOtterModule.useAnimatedBinding(0, function()
		-- upvalues: image_1 (ref), contentProviderService (copy), var4 (ref)
		if image_1 ~= nil and contentProviderService:GetAssetFetchStatus(image_1) == Enum.AssetFetchStatus.Success then
			var4(false)
		end
	end)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var2 (ref), image_1 (ref), var6 (ref), reactOtterModule (copy), t (copy), contentProviderService (copy)
		var4(var2)
		
		if not var2 or image_1 == nil or image_1 == "" then
			var6(reactOtterModule.instant(0))
			
			return
		end
		local var7 = true
		
		local function _()
			-- upvalues: var7 (write), var6 (copy), reactOtterModule (copy), t (copy)
			if var7 then
				var6(reactOtterModule.spring(1, t))
			end
		end
		
		if contentProviderService:GetAssetFetchStatus(image_1) == Enum.AssetFetchStatus.Success then
			var6(reactOtterModule.spring(1, t))
			
			return function()
				-- upvalues: var7 (write)
				var7 = false
			end
		end
		var6(reactOtterModule.instant(0))
		task.spawn(function()
			-- upvalues: contentProviderService (copy), image_1 (copy), var7 (write), var6 (copy), reactOtterModule (copy), t (copy)
			pcall(function()
				-- upvalues: contentProviderService (copy), image_1 (copy), var7 (copy), var6 (copy), reactOtterModule (copy), t (copy)
				contentProviderService:PreloadAsync({ image_1 }, function(p2, p3)
					-- upvalues: image_1 (copy), var7 (copy), var6 (copy), reactOtterModule (copy), t (copy)
					if p2 == image_1 and p3 == Enum.AssetFetchStatus.Success and var7 then
						var6(reactOtterModule.spring(1, t))
					end
				end)
			end)
			
			if contentProviderService:GetAssetFetchStatus(image_1) == Enum.AssetFetchStatus.Success and var7 then
				var6(reactOtterModule.spring(1, t))
			end
		end)
		
		return function()
			-- upvalues: var7 (write)
			var7 = false
		end
	end, { image_1, var2 })
	local imageStyle = p1.imageStyle
	local _ = nil
	
	return reactModule.createElement(view, { LayoutOrder = p1.LayoutOrder, Size = p1.Size }, {
		Image = reactModule.createElement(image, {
			tag = "size-full",
			Image = image_1,
			backgroundStyle = p1.backgroundStyle,
			imageStyle = if var2 and imageStyle ~= nil then reactModule.joinBindings({ imageStyle, var5 }):map(function(p2)
				local var7 = p2[1]
				
				return {
					Color3 = var7.Color3,
					Transparency = 1 - (1 - var7.Transparency) * p2[2]
				}
			end) elseif var2 then var5:map(function(p2)
				return { Color3 = Color3.new(1, 1, 1), Transparency = 1 - p2 }
			end) else imageStyle,
			cornerRadius = if radius_1 == radius.Circle then UDim.new(1, 0) else UDim.new(0, var1.Radius[radius_1]),
			ScaleType = p1.ScaleType or Enum.ScaleType.Crop
		}),
		SkeletonOverlay = if var2 and var3 then reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = 2,
			GroupTransparency = if imageStyle ~= nil then reactModule.joinBindings({ var5, imageStyle }):map(function(p2)
				return 1 - (1 - p2[1]) * (1 - (p2[2].Transparency or 0))
			end) else var5
		}, {
			Shimmer = reactModule.createElement(skeleton, { radius = radius_1, Size = UDim2.fromScale(1, 1) })
		}) else nil
	})
end)