local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local tutilsModule = require(parent.tutils)
local useTokens = require(parent.Foundation).Hooks.useTokens
local viewTypeModule = require(avatarExperienceInspectAndBuy.Enums.ViewType)

local function selectView(p0) --[[ line: 32 ]]
	return p0.view
end

return function(p1) --[[ line: 44 | named "useViewBreakpoints" ]]
	-- upvalues: useTokens (ref), reactModule (ref), viewTypeModule (ref), useSelector (ref), selectView (ref), tutilsModule (ref)
	local var5 = useTokens()
	
	return reactModule.useMemo(function() --[[ line: 46 ]]
		-- upvalues: viewTypeModule (copy), p1 (ref), var5 (ref)
		return {
			[viewTypeModule.Wide] = {
				ContainerSize = UDim2.new(0, 800, 0.9, -p1),
				ContainerAnchorPoint = Vector2.new(0.5, 0.5),
				ContainerPosition = UDim2.new(0.5, 0, 0.5, p1 / 2),
				OverlaySize = UDim2.new(1, 0, 1, p1),
				OverlayPosition = UDim2.new(0, 0, 0, -p1)
			},
			[viewTypeModule.WideLandscape] = {
				ContainerSize = UDim2.new(0.95, 0, 1, -p1),
				ContainerAnchorPoint = Vector2.new(0.5, 0),
				ContainerPosition = UDim2.new(0.5, 0, 0, p1 + var5.Padding.XSmall),
				OverlaySize = UDim2.new(1, 0, 1, p1),
				OverlayPosition = UDim2.new(0, 0, 0, -p1)
			},
			[viewTypeModule.Compact] = {
				ContainerSize = UDim2.new(1, 0, 1, -p1),
				ContainerAnchorPoint = Vector2.new(0, 0),
				ContainerPosition = UDim2.new(0, 0, 0, p1 + var5.Padding.Small),
				OverlaySize = UDim2.new(1, 0, 1, p1),
				OverlayPosition = UDim2.new(0, 0, 0, -p1)
			}
		}
	end, { p1 })[useSelector(selectView, tutilsModule.deepEqual)] or {}
end