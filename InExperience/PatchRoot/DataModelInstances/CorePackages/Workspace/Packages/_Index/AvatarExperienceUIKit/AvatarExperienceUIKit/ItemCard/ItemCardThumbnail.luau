local runService = game:GetService("RunService")
local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local image = foundationModule.Image
local skeleton = foundationModule.Skeleton
local radius = foundationModule.Enums.Radius
local useDesignTokens = require(parent.Style).useDesignTokens
local fFlagAXMigrateAXToGlobalAutofocus = require(parent.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local fFlagLuaAppHomePageFirstImageLoadObserver = require(parent.SharedFlags).FFlagLuaAppHomePageFirstImageLoadObserver

local function ItemCardThumbnail(p0, p1) --[[ line: 30 ]]
	-- upvalues: reactModule (ref), useDesignTokens (ref), fFlagAXMigrateAXToGlobalAutofocus (ref), fFlagLuaAppHomePageFirstImageLoadObserver (ref), runService (ref), skeleton (ref), radius (ref), image (ref), fFlagRenameDeprecatedUIBloxTokens (ref)
	local var4, var5 = reactModule.useState(false)
	local var6 = useDesignTokens()
	local var7 = if fFlagAXMigrateAXToGlobalAutofocus then p0.tag else nil
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		ItemCardThumbnailSkeleton = if not var4 then reactModule.createElement(skeleton, {
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
			ref = reactModule.useCallback(function(p2) --[[ line: 39 ]]
				-- upvalues: fFlagAXMigrateAXToGlobalAutofocus (copy), p1 (ref), var5 (ref), p0 (ref), runService (copy)
				if fFlagAXMigrateAXToGlobalAutofocus then
					if typeof(p1) == "function" then
						p1(p2)
					elseif typeof(p1) == "table" then
						p1.current = p2
					end
				end
				var5(false)
				
				if p2 and p0.url then
					local heartbeatConnection = nil
					local currentTime = tick()
					heartbeatConnection = runService.Heartbeat:Connect(function(p3) --[[ line: 51 ]]
						-- upvalues: currentTime (write), p2 (ref), var5 (copy), p0 (copy), heartbeatConnection (write)
						currentTime += p3
						
						if p2.IsLoaded then
							var5(true)
							
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
			end, { p0.onLoaded, p0.url }),
			testId = `item-card-thumbnail-image-{p0.url}`,
			tag = if fFlagLuaAppHomePageFirstImageLoadObserver then if var7 then `{var7} observed-image` else "observed-image" else var7
		}, {
			CornerRadius = reactModule.createElement("UICorner", {
				CornerRadius = UDim.new(0, if fFlagRenameDeprecatedUIBloxTokens then var6.Radius.Medium else var6.Semantic.Radius.Medium)
			})
		})
	})
end

return if fFlagAXMigrateAXToGlobalAutofocus then reactModule.forwardRef(ItemCardThumbnail) else ItemCardThumbnail