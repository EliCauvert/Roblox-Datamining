local parent = script:FindFirstAncestor("ShareSheet").Parent
local foundationModule = require(parent.Foundation)
local motionModule = require(parent.Motion)
local reactModule = require(parent.React)
local userTileModule = require(parent.UserTile)
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local iconVariant = foundationModule.Enums.IconVariant
local usePreferences = foundationModule.Hooks.usePreferences
local useTokens = foundationModule.Hooks.useTokens
local userTile = userTileModule.UserTile
local layoutMode = userTileModule.LayoutMode

local function AnimatedIcon(p0) --[[ line: 27 ]]
	-- upvalues: useTokens (ref), usePreferences (ref), reactModule (ref), motionModule (ref), view (ref), icon (ref), iconSize (ref)
	local var5 = useTokens()
	local reducedMotion = usePreferences().reducedMotion
	local var6 = reactModule.useMemo(function() --[[ line: 30 ]]
		-- upvalues: motionModule (copy), reducedMotion (ref), var5 (ref)
		return {
			compressed = motionModule.createState({ scale = 0.75 }, { default = motionModule.transition({ duration = 0 }) }),
			rest = motionModule.createState({ scale = 1 }, {
				default = motionModule.transition({
					duration = if reducedMotion then 0 else var5.Time.Time_300,
					easingStyle = var5.Ease.ExpressiveOut
				})
			})
		}
	end, { reducedMotion, var5 })
	local var7, var8 = motionModule.useMotion(var6.rest)
	reactModule.useEffect(function() --[[ line: 49 ]]
		-- upvalues: p0 (ref), var8 (ref), var6 (ref)
		if p0.shouldAnimate then
			var8(var6.compressed, {
				onAnimationComplete = function(p1) --[[ line: 55 ]]
					-- upvalues: var8 (copy), var6 (copy)
					if p1 == true then
						var8(var6.rest)
					end
				end
			})
			
			return
		end
	end, { var8, p0.shouldAnimate, var6 })
	
	return reactModule.createElement(view, { tag = "auto-xy", scale = var7.scale }, {
		Icon = reactModule.createElement(icon, { name = p0.icon, size = iconSize.Large })
	})
end

return function(p2) --[[ line: 86 | named "ShareSheetItemView" ]]
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), userTile (ref), layoutMode (ref), icon (ref), iconName (ref), iconSize (ref), iconVariant (ref), AnimatedIcon (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "col align-x-center gap-small size-1700-0 auto-y",
		testId = "share-sheet-item-view",
		LayoutOrder = p2.LayoutOrder
	}, {
		Content = if p2.primaryUserId then reactModule.createElement(view, {
			tag = "size-full-1700",
			LayoutOrder = 1,
			testId = if p2.secondUserId then "share-sheet-item-avatar-pile" else "share-sheet-item-avatar"
		}, {
			Tile = reactModule.createElement(userTile, {
				selectable = true,
				userId = p2.primaryUserId,
				facePileSecondUserId = p2.secondUserId,
				layoutMode = layoutMode.compact,
				userPresenceType = p2.userPresence,
				onActivated = p2.onActivated
			}),
			SelectionIndicator = if p2.isSelected then reactModule.createElement(icon, {
				ZIndex = 4,
				testId = "share-sheet-item-selection-indicator",
				name = iconName.CircleCheck,
				size = iconSize.Small,
				variant = iconVariant.Filled,
				style = useTokens().Color.System.Contrast,
				Position = UDim2.fromScale(0.8536, 0.1464),
				AnchorPoint = Vector2.new(0.5, 0.5)
			}) else nil
		}) else reactModule.createElement(view, {
			tag = "align-x-center align-y-center size-full-1700 radius-circle bg-shift-300",
			LayoutOrder = 1,
			testId = "share-sheet-item",
			onActivated = p2.onActivated,
			selection = { Selectable = true }
		}, {
			IconContent = reactModule.createElement(AnimatedIcon, { icon = p2.icon, shouldAnimate = p2.shouldAnimate })
		}),
		Label = reactModule.createElement(text, {
			tag = "size-full-0 auto-y text-body-small text-align-x-center content-default",
			LayoutOrder = 2,
			Text = p2.label,
			TextTruncate = Enum.TextTruncate.AtEnd
		})
	})
end