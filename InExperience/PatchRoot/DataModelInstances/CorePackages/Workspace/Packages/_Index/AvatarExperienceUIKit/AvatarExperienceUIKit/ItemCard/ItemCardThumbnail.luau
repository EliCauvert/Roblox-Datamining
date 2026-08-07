local runService = game:GetService("RunService")
local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local image = foundationModule.Image
local skeleton = foundationModule.Skeleton
local radius = foundationModule.Enums.Radius
local itemCardThumbnailSkeletonModule = require(script.Parent.ItemCardThumbnailSkeleton)
local useDesignTokens = require(parent.Style).useDesignTokens
local fFlagAXMigrateAXToGlobalAutofocus = require(parent.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local fFlagLuaAppHomePageFirstImageLoadObserver = require(parent.SharedFlags).FFlagLuaAppHomePageFirstImageLoadObserver
local fFlagAXTestSkeletonInCatalog = require(parent.AvatarExperienceFlags).FFlagAXTestSkeletonInCatalog
local fFlagAXTestSkeletonInCatalog_1 = game:DefineFastFlag("AXTestDontUseSkeletonOnloadInCatalog", false) and fFlagAXTestSkeletonInCatalog

local function ItemCardThumbnail(p0, p1) --[[ line: 35 ]]
	-- upvalues: reactModule (ref), useDesignTokens (ref), fFlagAXMigrateAXToGlobalAutofocus (ref), fFlagLuaAppHomePageFirstImageLoadObserver (ref), runService (ref), fFlagAXTestSkeletonInCatalog (ref), fFlagAXTestSkeletonInCatalog_1 (ref), itemCardThumbnailSkeletonModule (ref), radius (ref), image (ref), skeleton (ref)
	local var6, var7 = reactModule.useState(false)
	local var8 = useDesignTokens()
	local var9 = if fFlagAXMigrateAXToGlobalAutofocus then p0.tag else nil
	local var10 = reactModule.useCallback(function(p2) --[[ line: 44 ]]
		-- upvalues: fFlagAXMigrateAXToGlobalAutofocus (copy), p1 (ref), var7 (ref), p0 (ref), runService (copy)
		if fFlagAXMigrateAXToGlobalAutofocus then
			if typeof(p1) == "function" then
				p1(p2)
			elseif typeof(p1) == "table" then
				p1.current = p2
			end
		end
		var7(false)
		
		if p2 and p0.url then
			local heartbeatConnection = nil
			local currentTime = tick()
			heartbeatConnection = runService.Heartbeat:Connect(function(p3) --[[ line: 56 ]]
				-- upvalues: currentTime (write), p2 (ref), var7 (copy), p0 (copy), heartbeatConnection (write)
				currentTime += p3
				
				if p2.IsLoaded then
					var7(true)
					
					if p0.onLoaded then
						p0.onLoaded(currentTime)
					end
					heartbeatConnection:Disconnect()
					
					return
				elseif not p2.Parent then
					heartbeatConnection:Disconnect()
				end
			end)
		end
	end, { p0.onLoaded, p0.url })
	
	return if not (not fFlagAXTestSkeletonInCatalog or not p0.inSkeletonExperiment) then reactModule.createElement(reactModule.Fragment, nil, {
		ItemCardThumbnailSkeleton = if fFlagAXTestSkeletonInCatalog_1 or var6 then nil else reactModule.createElement(itemCardThumbnailSkeletonModule, {
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1),
			testId = `item-card-thumbnail-skeleton-{p0.url}`,
			radius = radius.Medium
		}),
		ItemCardThumbnailImage = reactModule.createElement(image, {
			imageRect = p0.imageRect,
			Image = p0.url,
			Size = UDim2.fromScale(1, 1),
			ScaleType = Enum.ScaleType.Crop,
			ref = var10,
			testId = `item-card-thumbnail-image-{p0.url}`,
			tag = if fFlagAXMigrateAXToGlobalAutofocus then p0.tag else nil
		}, {
			CornerRadius = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var8.Radius.Medium) })
		})
	}) else reactModule.createElement(reactModule.Fragment, nil, {
		ItemCardThumbnailSkeleton = if not var6 then reactModule.createElement(skeleton, {
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1),
			testId = `item-card-thumbnail-skeleton-{p0.url}`,
			radius = radius.Medium
		}) else nil,
		ItemCardThumbnailImage = reactModule.createElement(image, {
			imageRect = p0.imageRect,
			Image = p0.url,
			Size = UDim2.fromScale(1, 1),
			ScaleType = Enum.ScaleType.Crop,
			ref = var10,
			testId = `item-card-thumbnail-image-{p0.url}`,
			tag = if fFlagLuaAppHomePageFirstImageLoadObserver then if var9 then `{var9} observed-image` else "observed-image" else var9
		}, {
			CornerRadius = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var8.Radius.Medium) })
		})
	})
end

return if fFlagAXMigrateAXToGlobalAutofocus then reactModule.forwardRef(ItemCardThumbnail) else ItemCardThumbnail