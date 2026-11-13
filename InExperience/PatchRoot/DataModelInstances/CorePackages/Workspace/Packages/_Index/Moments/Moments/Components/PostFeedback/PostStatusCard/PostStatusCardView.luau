local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local FoundationProvider = FoundationModule.FoundationProvider
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local ColorMode = FoundationModule.Enums.ColorMode
local FillBehavior = FoundationModule.Enums.FillBehavior
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize
local MomentMediaTile = MomentsCommonModule.Media.MomentMediaTile
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ConstantsModule = require(Moments.Constants)

local function renderMedia(Media, CornerRadius)
	-- upvalues: ReactModule (copy), View (copy), MomentMediaTile (copy), Icon (copy), BuilderIconsModule (copy), IconSize (copy)
	if Media.kind == "thumbnail" then
		local Copy = table.clone(Media.mediaItem)
		Copy.cornerRadius = CornerRadius
		
		return ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "size-1200-1200",
			testId = "moments-post-status-card-thumbnail"
		}, {
			Tile = ReactModule.createElement(MomentMediaTile, { isActive = false, mediaItem = Copy })
		})
	else
		local IsMomentsIcon = Media.kind == "momentsIcon"
		
		return ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row align-x-center align-y-center size-1200-1200 radius-small bg-shift-200",
			testId = if IsMomentsIcon then "moments-post-status-card-moments-icon" else "moments-post-status-card-unavailable"
		}, {
			Icon = ReactModule.createElement(Icon, {
				name = if IsMomentsIcon then BuilderIconsModule.Icon.Moments else BuilderIconsModule.Icon.ArrowSpinClockwiseDashed,
				size = IconSize.Large
			})
		})
	end
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Button (copy), InputSize (copy), FillBehavior (copy), View (copy), ConstantsModule (copy), FoundationProvider (copy), ColorMode (copy), renderMedia (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(400)
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseBindingResult2 (copy)
		UseBindingResult2(Frame.AbsoluteSize.Y)
	end, {})
	local _UDim2 = if p1.shown == nil then UDim2.new() else ReactModule.joinBindings({ shown = p1.shown, distance = UseBindingResult }):map(function(p2): UDim2
		return UDim2.fromOffset(0, (p2.shown - 1) * p2.distance)
	end)
	local Elements = {}
	
	for LayoutOrder, action in p1.actions do
		Elements[`Action{LayoutOrder}`] = ReactModule.createElement(Button, {
			LayoutOrder = LayoutOrder,
			text = action.text,
			variant = action.variant,
			size = InputSize.Small,
			fillBehavior = FillBehavior.Fill,
			onActivated = action.onActivated,
			testId = `moments-post-status-card-action-{LayoutOrder}`
		})
	end
	return ReactModule.createElement(View, {
		tag = "position-top-center anchor-top-center size-full-0 auto-y",
		ZIndex = ConstantsModule.ZIndex.PostStatusCard
	}, {
		Slide = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = _UDim2,
			[ReactModule.Change.AbsoluteSize] = UseResult
		}, {
			Inset = ReactModule.createElement(View, {
				tag = "col align-x-center size-full-0 auto-y",
				padding = {
					top = UDim.new(0, p1.topInset),
					left = UDim.new(0, p1.leftInset + UseTokensResult.Padding.XLarge),
					right = UDim.new(0, p1.rightInset + UseTokensResult.Padding.XLarge)
				}
			}, {
				DarkScope = ReactModule.createElement(FoundationProvider, { colorMode = ColorMode.Dark }, {
					Card = ReactModule.createElement(View, {
						tag = "row align-y-top gap-large size-full-0 auto-y padding-large radius-medium bg-surface-100",
						testId = "moments-post-status-card",
						sizeConstraint = { MaxSize = Vector2.new(480, 1e999) }
					}, {
						Media = if p1.media == nil then nil else renderMedia(p1.media, UseTokensResult.Radius.Small),
						Content = ReactModule.createElement(View, { LayoutOrder = 2, tag = "col grow gap-xxsmall auto-y" }, {
							Title = ReactModule.createElement(Text, {
								LayoutOrder = 1,
								tag = "size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end content-emphasis",
								Text = p1.title
							}),
							Body = ReactModule.createElement(Text, {
								LayoutOrder = 2,
								tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
								Text = p1.body
							}),
							Actions = if #p1.actions > 0 then ReactModule.createElement(View, {
								LayoutOrder = 3,
								tag = "row gap-small size-full-0 auto-y padding-top-medium"
							}, Elements) else nil
						})
					})
				})
			})
		})
	})
end