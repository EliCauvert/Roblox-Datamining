local parent = script:FindFirstAncestor("Moments").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local skeleton = foundationModule.Skeleton
local view = foundationModule.View
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens

local function _(p1)
	local var1 = p1.FontSize * p1.LineHeight
	
	return p1.FontSize + 2 * UDim.new(0, (var1 - p1.FontSize) / 2).Offset, math.round(var1)
end

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), skeleton (ref), radius (ref)
	local var1 = useTokens()
	local size300 = var1.Size.Size_300
	local titleSmall = var1.Typography.TitleSmall
	local var2 = titleSmall.FontSize * titleSmall.LineHeight
	local var3 = titleSmall.FontSize + 2 * UDim.new(0, (var2 - titleSmall.FontSize) / 2).Offset
	local _ = math.round(var2)
	local bodyMedium = var1.Typography.BodyMedium
	local var4 = bodyMedium.FontSize * bodyMedium.LineHeight
	local var5 = bodyMedium.FontSize + 2 * UDim.new(0, (var4 - bodyMedium.FontSize) / 2).Offset
	local rounded = math.round(var4)
	local t = {}
	
	for i, v in p1.bodyLineWidths do
		t[`Line{i}`] = reactModule.createElement(view, {
			tag = "row align-y-center",
			LayoutOrder = i,
			Size = UDim2.new(1, 0, 0, if i == 1 then var5 else rounded)
		}, {
			Bar = reactModule.createElement(skeleton, {
				Size = UDim2.new(v, 0, 0, size300),
				radius = radius.Medium,
				testId = `{p1.testId}--body-line-{i}`
			})
		})
	end
	return reactModule.createElement(view, {
		tag = "row gap-medium size-full-0 auto-y padding-top-small",
		LayoutOrder = p1.LayoutOrder,
		testId = p1.testId
	}, {
		Avatar = reactModule.createElement(skeleton, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(var1.Size.Size_700, var1.Size.Size_700),
			radius = radius.Circle,
			testId = `{p1.testId}--avatar`
		}),
		TextColumn = reactModule.createElement(view, { LayoutOrder = 2, tag = "col fill gap-small auto-y" }, {
			MainContent = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "col gap-xsmall size-full-0 auto-y"
			}, {
				Header = reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = "row align-y-center gap-medium",
					Size = UDim2.new(1, 0, 0, var3)
				}, {
					Author = reactModule.createElement(skeleton, {
						LayoutOrder = 1,
						Size = UDim2.fromOffset(p1.authorWidth, size300),
						radius = radius.Medium,
						testId = `{p1.testId}--author`
					}),
					Timestamp = reactModule.createElement(skeleton, {
						LayoutOrder = 2,
						Size = UDim2.fromOffset(p1.timestampWidth, size300),
						radius = radius.Medium,
						testId = `{p1.testId}--timestamp`
					})
				}),
				Body = reactModule.createElement(view, { LayoutOrder = 2, tag = "col size-full-0 auto-y" }, t)
			}),
			Reaction = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "row align-y-center gap-xsmall auto-xy padding-bottom-small",
				testId = `{p1.testId}--reaction`
			}, {
				Icon = reactModule.createElement(skeleton, {
					LayoutOrder = 1,
					Size = UDim2.fromOffset(var1.Size.Size_500, var1.Size.Size_500),
					radius = radius.Circle
				}),
				Count = reactModule.createElement(skeleton, {
					LayoutOrder = 2,
					Size = UDim2.fromOffset(var1.Size.Size_400, size300),
					radius = radius.Medium
				})
			})
		})
	})
end