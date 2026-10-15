local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local fFlagMomentsCommentRowRedesignModule = require(moments.Flags.FFlagMomentsCommentRowRedesign)
local skeleton = foundationModule.Skeleton
local view = foundationModule.View
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens

local function _(p1)
	local var1 = p1.FontSize * p1.LineHeight
	
	return p1.FontSize + 2 * UDim.new(0, (var1 - p1.FontSize) / 2).Offset, math.round(var1)
end

return function(p1)
	-- upvalues: useTokens (ref), fFlagMomentsCommentRowRedesignModule (ref), reactModule (ref), view (ref), skeleton (ref), radius (ref)
	local var1 = useTokens()
	local size300 = var1.Size.Size_300
	local var2 = if fFlagMomentsCommentRowRedesignModule then var1.Typography.TitleMedium else var1.Typography.TitleSmall
	local var3 = var2.FontSize * var2.LineHeight
	local var4 = var2.FontSize + 2 * UDim.new(0, (var3 - var2.FontSize) / 2).Offset
	local _ = math.round(var3)
	local var5 = if fFlagMomentsCommentRowRedesignModule then var1.Size.Size_800 else var1.Size.Size_700
	local bodyMedium = var1.Typography.BodyMedium
	local var6 = bodyMedium.FontSize * bodyMedium.LineHeight
	local var7 = bodyMedium.FontSize + 2 * UDim.new(0, (var6 - bodyMedium.FontSize) / 2).Offset
	local rounded = math.round(var6)
	local t = {}
	
	for i, v in p1.bodyLineWidths do
		t[`Line{i}`] = reactModule.createElement(view, {
			tag = "row align-y-center",
			LayoutOrder = i,
			Size = UDim2.new(1, 0, 0, if i == 1 then var7 else rounded)
		}, {
			Bar = reactModule.createElement(skeleton, {
				Size = UDim2.new(v, 0, 0, size300),
				radius = radius.Medium,
				testId = `{p1.testId}--body-line-{i}`
			})
		})
	end
	return reactModule.createElement(view, {
		LayoutOrder = p1.LayoutOrder,
		tag = {
			["row gap-medium size-full-0 auto-y padding-top-small"] = true,
			["padding-bottom-small"] = fFlagMomentsCommentRowRedesignModule
		},
		testId = p1.testId
	}, {
		Avatar = reactModule.createElement(skeleton, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(var5, var5),
			radius = radius.Circle,
			testId = `{p1.testId}--avatar`
		}),
		TextColumn = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = {
				["col fill auto-y"] = true,
				["gap-xsmall"] = fFlagMomentsCommentRowRedesignModule,
				["gap-small"] = not fFlagMomentsCommentRowRedesignModule
			}
		}, {
			MainContent = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = {
					["col size-full-0 auto-y"] = true,
					["gap-xxsmall"] = fFlagMomentsCommentRowRedesignModule,
					["gap-xsmall"] = not fFlagMomentsCommentRowRedesignModule
				}
			}, {
				Header = reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = "row align-y-center gap-medium",
					Size = UDim2.new(1, 0, 0, var4)
				}, {
					Author = reactModule.createElement(skeleton, {
						LayoutOrder = 1,
						Size = UDim2.fromOffset(p1.authorWidth, size300),
						radius = radius.Medium,
						testId = `{p1.testId}--author`
					}),
					Timestamp = if fFlagMomentsCommentRowRedesignModule then nil else reactModule.createElement(skeleton, {
						LayoutOrder = 2,
						Size = UDim2.fromOffset(p1.timestampWidth, size300),
						radius = radius.Medium,
						testId = `{p1.testId}--timestamp`
					})
				}),
				Body = reactModule.createElement(view, { LayoutOrder = 2, tag = "col size-full-0 auto-y" }, t)
			}),
			Reaction = if fFlagMomentsCommentRowRedesignModule then nil else reactModule.createElement(view, {
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
			}),
			Footer = if fFlagMomentsCommentRowRedesignModule then reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "row align-y-center gap-small",
				Size = UDim2.new(1, 0, 0, var1.Size.Size_600),
				testId = `{p1.testId}--footer`
			}, {
				Timestamp = reactModule.createElement(view, { LayoutOrder = 1, tag = "row align-y-center fill auto-y" }, {
					Bar = reactModule.createElement(skeleton, {
						Size = UDim2.fromOffset(p1.timestampWidth, size300),
						radius = radius.Medium,
						testId = `{p1.testId}--timestamp`
					})
				}),
				Reaction = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "row align-y-center gap-xsmall auto-xy padding-right-small",
					testId = `{p1.testId}--reaction`
				}, {
					Icon = reactModule.createElement(skeleton, {
						LayoutOrder = 1,
						Size = UDim2.fromOffset(var1.Size.Size_400, var1.Size.Size_400),
						radius = radius.Circle
					}),
					Count = reactModule.createElement(skeleton, {
						LayoutOrder = 2,
						Size = UDim2.fromOffset(var1.Size.Size_400, size300),
						radius = radius.Medium,
						testId = `{p1.testId}--reaction-count`
					})
				})
			}) else nil
		})
	})
end