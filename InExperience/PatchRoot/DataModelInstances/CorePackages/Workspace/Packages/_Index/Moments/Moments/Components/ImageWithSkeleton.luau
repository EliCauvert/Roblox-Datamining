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

local function _(p0, p1)
	-- upvalues: radius (ref)
	return if p0 == radius.Circle then UDim.new(1, 0) else UDim.new(0, p1.Radius[p0])
end

return reactModule.memo(function(p2)
	-- upvalues: useTokens (ref), radius (ref), reactModule (ref), reactOtterModule (ref), contentProviderService (ref), t (ref), view (ref), image (ref), skeleton (ref)
	local var5 = useTokens()
	local radius_1 = p2.radius or radius.Medium
	local image_1 = p2.Image
	local var7 = image_1 ~= nil and image_1 ~= ""
	local var8, var9 = reactModule.useState(var7)
	local var10, var11 = reactOtterModule.useAnimatedBinding(0, function()
		-- upvalues: image_1 (ref), contentProviderService (copy), var9 (ref)
		if image_1 ~= nil and contentProviderService:GetAssetFetchStatus(image_1) == Enum.AssetFetchStatus.Success then
			var9(false)
		end
	end)
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), var7 (ref), image_1 (ref), var11 (ref), reactOtterModule (copy), t (copy), contentProviderService (copy)
		var9(var7)
		
		if not var7 or image_1 == nil or image_1 == "" then
			var11(reactOtterModule.instant(0))
			
			return
		end
		local var12 = true
		
		local function _()
			-- upvalues: var12 (write), var11 (copy), reactOtterModule (copy), t (copy)
			if var12 then
				var11(reactOtterModule.spring(1, t))
			end
		end
		
		if contentProviderService:GetAssetFetchStatus(image_1) == Enum.AssetFetchStatus.Success then
			var11(reactOtterModule.spring(1, t))
			
			return function()
				-- upvalues: var12 (write)
				var12 = false
			end
		end
		var11(reactOtterModule.instant(0))
		task.spawn(function()
			-- upvalues: contentProviderService (copy), image_1 (copy), var12 (write), var11 (copy), reactOtterModule (copy), t (copy)
			pcall(function()
				-- upvalues: contentProviderService (copy), image_1 (copy), var12 (copy), var11 (copy), reactOtterModule (copy), t (copy)
				contentProviderService:PreloadAsync({ image_1 }, function(p3, p4)
					-- upvalues: image_1 (copy), var12 (copy), var11 (copy), reactOtterModule (copy), t (copy)
					if p3 == image_1 and p4 == Enum.AssetFetchStatus.Success and var12 then
						var11(reactOtterModule.spring(1, t))
					end
				end)
			end)
			
			if contentProviderService:GetAssetFetchStatus(image_1) == Enum.AssetFetchStatus.Success and var12 then
				var11(reactOtterModule.spring(1, t))
			end
		end)
		
		return function()
			-- upvalues: var12 (write)
			var12 = false
		end
	end, { image_1, var7 })
	local imageStyle = p2.imageStyle
	local _ = nil
	
	return reactModule.createElement(view, { LayoutOrder = p2.LayoutOrder, Size = p2.Size }, {
		Image = reactModule.createElement(image, {
			tag = "size-full",
			Image = image_1,
			backgroundStyle = p2.backgroundStyle,
			imageStyle = if var7 and imageStyle ~= nil then reactModule.joinBindings({ imageStyle, var10 }):map(function(p6)
				local var13 = p6[1]
				
				return {
					Color3 = var13.Color3,
					Transparency = 1 - (1 - var13.Transparency) * p6[2]
				}
			end) elseif var7 then var10:map(function(p5)
				return { Color3 = Color3.new(1, 1, 1), Transparency = 1 - p5 }
			end) else imageStyle,
			cornerRadius = if radius_1 == radius.Circle then UDim.new(1, 0) else UDim.new(0, var5.Radius[radius_1]),
			ScaleType = p2.ScaleType or Enum.ScaleType.Crop
		}),
		SkeletonOverlay = if var7 and var8 then reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = 2,
			GroupTransparency = if imageStyle ~= nil then reactModule.joinBindings({ var10, imageStyle }):map(function(p7)
				return 1 - (1 - p7[1]) * (1 - (p7[2].Transparency or 0))
			end) else var10
		}, {
			Shimmer = reactModule.createElement(skeleton, { radius = radius_1, Size = UDim2.fromScale(1, 1) })
		}) else nil
	})
end)