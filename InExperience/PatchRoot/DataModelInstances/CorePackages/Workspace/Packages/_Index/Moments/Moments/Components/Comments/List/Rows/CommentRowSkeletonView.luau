local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local FFlagMomentsCommentRowRedesignModule = require(Moments.Flags.FFlagMomentsCommentRowRedesign)
local Skeleton = FoundationModule.Skeleton
local View = FoundationModule.View
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function _(p1) --[[ Line: 26 | Named "getLineHeights" ]]
	local ScaledFontSize = p1.FontSize * p1.LineHeight
	
	return p1.FontSize + 2 * UDim.new(0, (ScaledFontSize - p1.FontSize) / 2).Offset, (math.round(ScaledFontSize))
end

return function(Frame) --[[ Line: 34 | Named "CommentRowSkeletonView" ]]
	-- upvalues: UseTokensFunction (copy), FFlagMomentsCommentRowRedesignModule (copy), ReactModule (copy), View (copy), Skeleton (copy), Radius (copy)
	local UseTokensResult = UseTokensFunction()
	local Size300 = UseTokensResult.Size.Size_300
	local TitleMedium = if FFlagMomentsCommentRowRedesignModule then UseTokensResult.Typography.TitleMedium else UseTokensResult.Typography.TitleSmall
	local ScaledFontSize = TitleMedium.FontSize * TitleMedium.LineHeight
	local NewFontSize = TitleMedium.FontSize + 2 * UDim.new(0, (ScaledFontSize - TitleMedium.FontSize) / 2).Offset
	local _ = math.round(ScaledFontSize)
	local Size800 = if FFlagMomentsCommentRowRedesignModule then UseTokensResult.Size.Size_800 else UseTokensResult.Size.Size_700
	local BodyMedium = UseTokensResult.Typography.BodyMedium
	local ScaledFontSize1 = BodyMedium.FontSize * BodyMedium.LineHeight
	local NewFontSize1 = BodyMedium.FontSize + 2 * UDim.new(0, (ScaledFontSize1 - BodyMedium.FontSize) / 2).Offset
	local Rounded = math.round(ScaledFontSize1)
	local Elements = {}
	
	for LayoutOrder, bodyLineWidth in Frame.bodyLineWidths do
		Elements[`Line{LayoutOrder}`] = ReactModule.createElement(View, {
			tag = "row align-y-center",
			LayoutOrder = LayoutOrder,
			Size = UDim2.new(1, 0, 0, if LayoutOrder == 1 then NewFontSize1 else Rounded)
		}, {
			Bar = ReactModule.createElement(Skeleton, {
				Size = UDim2.new(bodyLineWidth, 0, 0, Size300),
				radius = Radius.Medium,
				testId = `{Frame.testId}--body-line-{LayoutOrder}`
			})
		})
	end
	return ReactModule.createElement(View, {
		LayoutOrder = Frame.LayoutOrder,
		tag = {
			["row gap-medium size-full-0 auto-y padding-top-small"] = true,
			["padding-bottom-small"] = FFlagMomentsCommentRowRedesignModule
		},
		testId = Frame.testId
	}, {
		Avatar = ReactModule.createElement(Skeleton, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(Size800, Size800),
			radius = Radius.Circle,
			testId = `{Frame.testId}--avatar`
		}),
		TextColumn = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = {
				["col fill auto-y"] = true,
				["gap-xsmall"] = FFlagMomentsCommentRowRedesignModule,
				["gap-small"] = not FFlagMomentsCommentRowRedesignModule
			}
		}, {
			MainContent = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = {
					["col size-full-0 auto-y"] = true,
					["gap-xxsmall"] = FFlagMomentsCommentRowRedesignModule,
					["gap-xsmall"] = not FFlagMomentsCommentRowRedesignModule
				}
			}, {
				Header = ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = "row align-y-center gap-medium",
					Size = UDim2.new(1, 0, 0, NewFontSize)
				}, {
					Author = ReactModule.createElement(Skeleton, {
						LayoutOrder = 1,
						Size = UDim2.fromOffset(Frame.authorWidth, Size300),
						radius = Radius.Medium,
						testId = `{Frame.testId}--author`
					}),
					Timestamp = if FFlagMomentsCommentRowRedesignModule then nil else ReactModule.createElement(Skeleton, {
						LayoutOrder = 2,
						Size = UDim2.fromOffset(Frame.timestampWidth, Size300),
						radius = Radius.Medium,
						testId = `{Frame.testId}--timestamp`
					})
				}),
				Body = ReactModule.createElement(View, { LayoutOrder = 2, tag = "col size-full-0 auto-y" }, Elements)
			}),
			Reaction = if FFlagMomentsCommentRowRedesignModule then nil else ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "row align-y-center gap-xsmall auto-xy padding-bottom-small",
				testId = `{Frame.testId}--reaction`
			}, {
				Icon = ReactModule.createElement(Skeleton, {
					LayoutOrder = 1,
					Size = UDim2.fromOffset(UseTokensResult.Size.Size_500, UseTokensResult.Size.Size_500),
					radius = Radius.Circle
				}),
				Count = ReactModule.createElement(Skeleton, {
					LayoutOrder = 2,
					Size = UDim2.fromOffset(UseTokensResult.Size.Size_400, Size300),
					radius = Radius.Medium
				})
			}),
			Footer = if FFlagMomentsCommentRowRedesignModule then ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "row align-y-center gap-small",
				Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_600),
				testId = `{Frame.testId}--footer`
			}, {
				Timestamp = ReactModule.createElement(View, { LayoutOrder = 1, tag = "row align-y-center fill auto-y" }, {
					Bar = ReactModule.createElement(Skeleton, {
						Size = UDim2.fromOffset(Frame.timestampWidth, Size300),
						radius = Radius.Medium,
						testId = `{Frame.testId}--timestamp`
					})
				}),
				Reaction = ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = "row align-y-center gap-xsmall auto-xy padding-right-small",
					testId = `{Frame.testId}--reaction`
				}, {
					Icon = ReactModule.createElement(Skeleton, {
						LayoutOrder = 1,
						Size = UDim2.fromOffset(UseTokensResult.Size.Size_400, UseTokensResult.Size.Size_400),
						radius = Radius.Circle
					}),
					Count = ReactModule.createElement(Skeleton, {
						LayoutOrder = 2,
						Size = UDim2.fromOffset(UseTokensResult.Size.Size_400, Size300),
						radius = Radius.Medium,
						testId = `{Frame.testId}--reaction-count`
					})
				})
			}) else nil
		})
	})
end