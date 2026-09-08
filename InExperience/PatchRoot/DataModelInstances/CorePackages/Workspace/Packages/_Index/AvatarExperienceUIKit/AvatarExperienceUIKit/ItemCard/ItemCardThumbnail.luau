local runService = game:GetService("RunService")
local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local image = foundationModule.Image
local skeleton = foundationModule.Skeleton
local radius = foundationModule.Enums.Radius
local itemCardThumbnailSkeletonModule = require(script.Parent.ItemCardThumbnailSkeleton)
local useDesignTokens = require(parent.Style).useDesignTokens
local fFlagLuaAppHomePageFirstImageLoadObserver = require(parent.SharedFlags).FFlagLuaAppHomePageFirstImageLoadObserver
local fFlagAXTestSkeletonInCatalog = require(parent.AvatarExperienceFlags).FFlagAXTestSkeletonInCatalog
local fFlagAXTestSkeletonInCatalog_1 = game:DefineFastFlag("AXTestDontUseSkeletonOnloadInCatalog", false) and fFlagAXTestSkeletonInCatalog

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: reactModule (ref), useDesignTokens (ref), fFlagLuaAppHomePageFirstImageLoadObserver (ref), runService (ref), fFlagAXTestSkeletonInCatalog (ref), fFlagAXTestSkeletonInCatalog_1 (ref), itemCardThumbnailSkeletonModule (ref), radius (ref), image (ref), skeleton (ref)
	local var1, var2 = reactModule.useState(false)
	local var3 = useDesignTokens()
	local tag = p1.tag
	local var4 = reactModule.useCallback(function(p3)
		-- upvalues: p2 (ref), var2 (ref), p1 (ref), runService (copy)
		if typeof(p2) == "function" then
			p2(p3)
		elseif typeof(p2) == "table" then
			p2.current = p3
		end
		var2(false)
		
		if p3 and p1.url then
			local heartbeatConnection = nil
			local currentTime = tick()
			heartbeatConnection = runService.Heartbeat:Connect(function(p4)
				-- upvalues: currentTime (write), p3 (ref), var2 (copy), p1 (copy), heartbeatConnection (write)
				currentTime += p4
				
				if p3.IsLoaded then
					var2(true)
					
					if p1.onLoaded then
						p1.onLoaded(currentTime)
					end
					heartbeatConnection:Disconnect()
					
					return
				elseif not p3.Parent then
					heartbeatConnection:Disconnect()
				end
			end)
		end
	end, { p1.onLoaded, p1.url })
	
	return if not (not fFlagAXTestSkeletonInCatalog or not p1.inSkeletonExperiment) then reactModule.createElement(reactModule.Fragment, nil, {
		ItemCardThumbnailSkeleton = if fFlagAXTestSkeletonInCatalog_1 or var1 then nil else reactModule.createElement(itemCardThumbnailSkeletonModule, {
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1),
			testId = `item-card-thumbnail-skeleton-{p1.url}`,
			radius = radius.Medium
		}),
		ItemCardThumbnailImage = reactModule.createElement(image, {
			imageRect = p1.imageRect,
			Image = p1.url,
			Size = UDim2.fromScale(1, 1),
			ScaleType = Enum.ScaleType.Crop,
			ref = var4,
			testId = `item-card-thumbnail-image-{p1.url}`,
			tag = p1.tag
		}, {
			CornerRadius = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var3.Radius.Medium) })
		})
	}) else reactModule.createElement(reactModule.Fragment, nil, {
		ItemCardThumbnailSkeleton = if not var1 then reactModule.createElement(skeleton, {
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1),
			testId = `item-card-thumbnail-skeleton-{p1.url}`,
			radius = radius.Medium
		}) else nil,
		ItemCardThumbnailImage = reactModule.createElement(image, {
			imageRect = p1.imageRect,
			Image = p1.url,
			Size = UDim2.fromScale(1, 1),
			ScaleType = Enum.ScaleType.Crop,
			ref = var4,
			testId = `item-card-thumbnail-image-{p1.url}`,
			tag = if fFlagLuaAppHomePageFirstImageLoadObserver then if tag then `{tag} observed-image` else "observed-image" else tag
		}, {
			CornerRadius = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var3.Radius.Medium) })
		})
	})
end)