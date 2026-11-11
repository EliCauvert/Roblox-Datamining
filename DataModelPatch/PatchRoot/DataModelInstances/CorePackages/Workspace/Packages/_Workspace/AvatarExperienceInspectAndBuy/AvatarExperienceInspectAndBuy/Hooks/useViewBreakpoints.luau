local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local TutilsModule = require(Parent.tutils)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local ViewTypeModule = require(AvatarExperienceInspectAndBuy.Enums.ViewType)

local function selectView(p1)
	return p1.view
end

return function(YOffset)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), ViewTypeModule (copy), UseSelectorFunction (copy), selectView (copy), TutilsModule (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.useMemo(function()
		-- upvalues: ViewTypeModule (upval), YOffset (copy), UseTokensResult (copy)
		return {
			[ViewTypeModule.Wide] = {
				ContainerSize = UDim2.new(0, 800, 0.9, -YOffset),
				ContainerAnchorPoint = Vector2.new(0.5, 0.5),
				ContainerPosition = UDim2.new(0.5, 0, 0.5, YOffset / 2),
				OverlaySize = UDim2.new(1, 0, 1, YOffset),
				OverlayPosition = UDim2.new(0, 0, 0, -YOffset)
			},
			[ViewTypeModule.WideLandscape] = {
				ContainerSize = UDim2.new(0.95, 0, 1, -YOffset),
				ContainerAnchorPoint = Vector2.new(0.5, 0),
				ContainerPosition = UDim2.new(0.5, 0, 0, YOffset + UseTokensResult.Padding.XSmall),
				OverlaySize = UDim2.new(1, 0, 1, YOffset),
				OverlayPosition = UDim2.new(0, 0, 0, -YOffset)
			},
			[ViewTypeModule.Compact] = {
				ContainerSize = UDim2.new(1, 0, 1, -YOffset),
				ContainerAnchorPoint = Vector2.new(0, 0),
				ContainerPosition = UDim2.new(0, 0, 0, YOffset + UseTokensResult.Padding.Small),
				OverlaySize = UDim2.new(1, 0, 1, YOffset),
				OverlayPosition = UDim2.new(0, 0, 0, -YOffset)
			}
		}
	end, { YOffset })[UseSelectorFunction(selectView, TutilsModule.deepEqual)] or {}
end