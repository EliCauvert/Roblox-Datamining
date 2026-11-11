local RunService = game:GetService("RunService")
local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local Image = FoundationModule.Image
local Skeleton = FoundationModule.Skeleton
local Radius = FoundationModule.Enums.Radius
local ItemCardThumbnailSkeletonModule = require(script.Parent.ItemCardThumbnailSkeleton)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local FFlagAXMigrateAXToGlobalAutofocus = require(Parent.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagLuaAppHomePageFirstImageLoadObserver = require(Parent.SharedFlags).FFlagLuaAppHomePageFirstImageLoadObserver
local FFlagAXTestSkeletonInCatalog = require(Parent.AvatarExperienceFlags).FFlagAXTestSkeletonInCatalog
local FFlagAXTestSkeletonInCatalog1 = game:DefineFastFlag("AXTestDontUseSkeletonOnloadInCatalog", false) and FFlagAXTestSkeletonInCatalog

local function ItemCardThumbnail(p1, Callback)
	-- upvalues: ReactModule (copy), UseDesignTokensFunction (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), FFlagLuaAppHomePageFirstImageLoadObserver (copy), RunService (copy), FFlagAXTestSkeletonInCatalog (copy), FFlagAXTestSkeletonInCatalog1 (copy), ItemCardThumbnailSkeletonModule (copy), Radius (copy), Image (copy), FFlagRenameDeprecatedUIBloxTokens (copy), Skeleton (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local Tag = if FFlagAXMigrateAXToGlobalAutofocus then p1.tag else nil
	local ObservedName = if FFlagLuaAppHomePageFirstImageLoadObserver then if Tag then `{Tag} observed-image` else "observed-image" else Tag
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (upval), Callback (copy), UseStateResult2 (copy), p1 (copy), RunService (upval)
		if FFlagAXMigrateAXToGlobalAutofocus then
			if typeof(Callback) == "function" then
				Callback(Current)
			elseif typeof(Callback) == "table" then
				Callback.current = Current
			end
		end
		UseStateResult2(false)
		
		if Current and p1.url then
			local Connection = nil
			local CurrentTime = tick()
			Connection = RunService.Heartbeat:Connect(function(DeltaTime)
				-- upvalues: CurrentTime (ref), Current (copy), UseStateResult2 (upval), p1 (upval), Connection (ref)
				CurrentTime += DeltaTime
				
				if Current.IsLoaded then
					UseStateResult2(true)
					
					if p1.onLoaded then
						p1.onLoaded(CurrentTime)
					end
					Connection:Disconnect()
					
					return
				elseif not Current.Parent then
					Connection:Disconnect()
				end
			end)
		end
	end, { p1.onLoaded, p1.url })
	
	return if FFlagAXTestSkeletonInCatalog and p1.inSkeletonExperiment then ReactModule.createElement(ReactModule.Fragment, nil, {
		ItemCardThumbnailSkeleton = if FFlagAXTestSkeletonInCatalog1 or UseStateResult then nil else ReactModule.createElement(ItemCardThumbnailSkeletonModule, {
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1),
			testId = `item-card-thumbnail-skeleton-{p1.url}`,
			radius = Radius.Medium
		}),
		ItemCardThumbnailImage = ReactModule.createElement(Image, {
			imageRect = p1.imageRect,
			Image = p1.url,
			Size = UDim2.fromScale(1, 1),
			ScaleType = Enum.ScaleType.Crop,
			ref = UseResult,
			testId = `item-card-thumbnail-image-{p1.url}`,
			tag = if FFlagAXMigrateAXToGlobalAutofocus then p1.tag else nil
		}, {
			CornerRadius = ReactModule.createElement("UICorner", {
				CornerRadius = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Radius.Medium else UseDesignTokensResult.Semantic.Radius.Medium)
			})
		})
	}) else ReactModule.createElement(ReactModule.Fragment, nil, {
		ItemCardThumbnailSkeleton = if UseStateResult then nil else ReactModule.createElement(Skeleton, {
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1),
			testId = `item-card-thumbnail-skeleton-{p1.url}`,
			radius = Radius.Medium
		}),
		ItemCardThumbnailImage = ReactModule.createElement(Image, {
			imageRect = p1.imageRect,
			Image = p1.url,
			Size = UDim2.fromScale(1, 1),
			ScaleType = Enum.ScaleType.Crop,
			ref = UseResult,
			testId = `item-card-thumbnail-image-{p1.url}`,
			tag = ObservedName
		}, {
			CornerRadius = ReactModule.createElement("UICorner", {
				CornerRadius = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Radius.Medium else UseDesignTokensResult.Semantic.Radius.Medium)
			})
		})
	})
end

return if FFlagAXMigrateAXToGlobalAutofocus then ReactModule.forwardRef(ItemCardThumbnail) else ItemCardThumbnail