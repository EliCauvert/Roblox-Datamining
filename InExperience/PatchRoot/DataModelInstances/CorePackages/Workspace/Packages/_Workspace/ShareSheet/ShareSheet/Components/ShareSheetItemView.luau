local Parent = script:FindFirstAncestor("ShareSheet").Parent
local FoundationModule = require(Parent.Foundation)
local MotionModule = require(Parent.Motion)
local ReactModule = require(Parent.React)
local UserTileModule = require(Parent.UserTile)
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local IconVariant = FoundationModule.Enums.IconVariant
local UsePreferencesFunction = FoundationModule.Hooks.usePreferences
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UserTile = UserTileModule.UserTile
local LayoutMode = UserTileModule.LayoutMode

local function AnimatedIcon(p1) --[[ Line: 27 ]]
	-- upvalues: UseTokensFunction (copy), UsePreferencesFunction (copy), ReactModule (copy), MotionModule (copy), View (copy), Icon (copy), IconSize (copy)
	local UseTokensResult = UseTokensFunction()
	local ReducedMotion = UsePreferencesFunction().reducedMotion
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 30 ]]
		-- upvalues: MotionModule (upval), ReducedMotion (copy), UseTokensResult (copy)
		return {
			compressed = MotionModule.createState({ scale = 0.75 }, { default = MotionModule.transition({ duration = 0 }) }),
			rest = MotionModule.createState({ scale = 1 }, {
				default = MotionModule.transition({
					duration = if ReducedMotion then 0 else UseTokensResult.Time.Time_300,
					easingStyle = UseTokensResult.Ease.ExpressiveOut
				})
			})
		}
	end, { ReducedMotion, UseTokensResult })
	local UseMotionResult, UseMotionResult2 = MotionModule.useMotion(UseMemoResult.rest)
	ReactModule.useEffect(function() --[[ Line: 49 ]]
		-- upvalues: p1 (copy), UseMotionResult2 (copy), UseMemoResult (copy)
		if p1.shouldAnimate then
			UseMotionResult2(UseMemoResult.compressed, {
				onAnimationComplete = function(Enabled) --[[ Line: 55 ]]
					-- upvalues: UseMotionResult2 (upval), UseMemoResult (upval)
					if Enabled == true then
						UseMotionResult2(UseMemoResult.rest)
					end
				end
			})
			
			return
		end
	end, { UseMotionResult2, p1.shouldAnimate, UseMemoResult })
	
	return ReactModule.createElement(View, { tag = "auto-xy", scale = UseMotionResult.scale }, {
		Icon = ReactModule.createElement(Icon, { name = p1.icon, size = IconSize.Large })
	})
end

return function(Frame) --[[ Line: 86 | Named "ShareSheetItemView" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), UserTile (copy), LayoutMode (copy), Icon (copy), IconName (copy), IconSize (copy), IconVariant (copy), AnimatedIcon (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, {
		tag = "col align-x-center gap-small size-1700-0 auto-y",
		testId = "share-sheet-item-view",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Content = if Frame.primaryUserId then ReactModule.createElement(View, {
			tag = "size-full-1700",
			LayoutOrder = 1,
			testId = if Frame.secondUserId then "share-sheet-item-avatar-pile" else "share-sheet-item-avatar"
		}, {
			Tile = ReactModule.createElement(UserTile, {
				selectable = true,
				userId = Frame.primaryUserId,
				facePileSecondUserId = Frame.secondUserId,
				layoutMode = LayoutMode.compact,
				userPresenceType = Frame.userPresence,
				onActivated = Frame.onActivated
			}),
			SelectionIndicator = if Frame.isSelected then ReactModule.createElement(Icon, {
				ZIndex = 4,
				testId = "share-sheet-item-selection-indicator",
				name = IconName.CircleCheck,
				size = IconSize.Small,
				variant = IconVariant.Filled,
				style = UseTokensResult.Color.System.Contrast,
				Position = UDim2.fromScale(0.8536, 0.1464),
				AnchorPoint = Vector2.new(0.5, 0.5)
			}) else nil
		}) else ReactModule.createElement(View, {
			tag = "align-x-center align-y-center size-full-1700 radius-circle bg-shift-300",
			LayoutOrder = 1,
			testId = "share-sheet-item",
			onActivated = Frame.onActivated,
			selection = { Selectable = true }
		}, {
			IconContent = ReactModule.createElement(AnimatedIcon, { icon = Frame.icon, shouldAnimate = Frame.shouldAnimate })
		}),
		Label = ReactModule.createElement(Text, {
			tag = "size-full-0 auto-y text-body-small text-align-x-center content-default",
			LayoutOrder = 2,
			Text = Frame.label,
			TextTruncate = Enum.TextTruncate.AtEnd
		})
	})
end