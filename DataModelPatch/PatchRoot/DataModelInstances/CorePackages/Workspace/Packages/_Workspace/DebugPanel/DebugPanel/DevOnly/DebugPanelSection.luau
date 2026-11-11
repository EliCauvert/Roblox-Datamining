local Parent = script:FindFirstAncestor("DebugPanel").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function headerBgForDepth(SurfaceColor, Depth: number): Color3
	local ScaledDepth = Depth * 4
	
	return Color3.fromRGB(math.min(255, math.floor(SurfaceColor.R * 255 + 0.5) + ScaledDepth), math.min(255, math.floor(SurfaceColor.G * 255 + 0.5) + ScaledDepth), (math.min(255, math.floor(SurfaceColor.B * 255 + 0.5) + ScaledDepth)))
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), headerBgForDepth (copy), View (copy), Icon (copy), IconName (copy), IconSize (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.defaultCollapsed == true)
	local Depth = p1.depth or 0
	local IsDepthMatch = Depth == 0
	
	return ReactModule.createElement(View, {
		tag = "col size-full-0 auto-y gap-small",
		LayoutOrder = p1.layoutOrder
	}, {
		Header = ReactModule.createElement(View, {
			tag = "row size-full-700 align-y-center gap-xsmall radius-small padding-x-xsmall clip",
			LayoutOrder = 0,
			backgroundStyle = {
				Color3 = headerBgForDepth(UseTokensResult.Color.Surface.Surface_300.Color3, Depth),
				Transparency = if IsDepthMatch then 0.2 else 0.5
			},
			onActivated = ReactModule.useCallback(function()
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(function(p2): boolean
					return not p2
				end)
			end, {}),
			stateLayer = {}
		}, {
			Chevron = ReactModule.createElement(Icon, {
				tag = "content-muted",
				LayoutOrder = 0,
				name = if UseStateResult then IconName.ChevronSmallRight else IconName.ChevronSmallDown,
				size = IconSize.Small
			}),
			Title = ReactModule.createElement(Text, {
				tag = "size-full text-label-small text-align-x-left content-emphasis",
				LayoutOrder = 1,
				Text = p1.title
			})
		}),
		Body = ReactModule.createElement(View, {
			tag = "col size-full-0 auto-y gap-small padding-left-medium",
			LayoutOrder = 1,
			Visible = not UseStateResult
		}, p1.children)
	})
end