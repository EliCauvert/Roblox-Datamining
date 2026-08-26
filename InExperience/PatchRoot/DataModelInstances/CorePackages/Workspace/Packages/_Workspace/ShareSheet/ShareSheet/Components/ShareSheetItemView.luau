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

local function AnimatedIcon(p1)
	-- upvalues: useTokens (ref), usePreferences (ref), reactModule (ref), motionModule (ref), view (ref), icon (ref), iconSize (ref)
	local var1 = useTokens()
	local reducedMotion = usePreferences().reducedMotion
	local var2 = reactModule.useMemo(function()
		-- upvalues: motionModule (copy), reducedMotion (ref), var1 (ref)
		return {
			compressed = motionModule.createState({ scale = 0.75 }, { default = motionModule.transition({ duration = 0 }) }),
			rest = motionModule.createState({ scale = 1 }, {
				default = motionModule.transition({
					duration = if reducedMotion then 0 else var1.Time.Time_300,
					easingStyle = var1.Ease.ExpressiveOut
				})
			})
		}
	end, { reducedMotion, var1 })
	local var3, var4 = motionModule.useMotion(var2.rest)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var4 (ref), var2 (ref)
		if p1.shouldAnimate then
			var4(var2.compressed, {
				onAnimationComplete = function(p2)
					-- upvalues: var4 (copy), var2 (copy)
					if p2 == true then
						var4(var2.rest)
					end
				end
			})
			
			return
		end
	end, { var4, p1.shouldAnimate, var2 })
	
	return reactModule.createElement(view, { tag = "auto-xy", scale = var3.scale }, {
		Icon = reactModule.createElement(icon, { name = p1.icon, size = iconSize.Large })
	})
end

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), userTile (ref), layoutMode (ref), icon (ref), iconName (ref), iconSize (ref), iconVariant (ref), AnimatedIcon (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "col align-x-center gap-small size-1700-0 auto-y",
		testId = "share-sheet-item-view",
		LayoutOrder = p1.LayoutOrder
	}, {
		Content = if p1.primaryUserId then reactModule.createElement(view, {
			tag = "size-full-1700",
			LayoutOrder = 1,
			testId = if p1.secondUserId then "share-sheet-item-avatar-pile" else "share-sheet-item-avatar"
		}, {
			Tile = reactModule.createElement(userTile, {
				selectable = true,
				userId = p1.primaryUserId,
				facePileSecondUserId = p1.secondUserId,
				layoutMode = layoutMode.compact,
				userPresenceType = p1.userPresence,
				onActivated = p1.onActivated
			}),
			SelectionIndicator = if p1.isSelected then reactModule.createElement(icon, {
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
			onActivated = p1.onActivated,
			selection = { Selectable = true }
		}, {
			IconContent = reactModule.createElement(AnimatedIcon, { icon = p1.icon, shouldAnimate = p1.shouldAnimate })
		}),
		Label = reactModule.createElement(text, {
			tag = "size-full-0 auto-y text-body-small text-align-x-center content-default",
			LayoutOrder = 2,
			Text = p1.label,
			TextTruncate = Enum.TextTruncate.AtEnd
		})
	})
end