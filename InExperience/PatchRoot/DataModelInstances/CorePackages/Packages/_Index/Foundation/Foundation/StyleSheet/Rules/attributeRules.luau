local foundation = script:FindFirstAncestor("Foundation")
local dashModule = require(foundation.Parent.Dash)
local _ = require(foundation.Providers.Style.Tokens)
local _ = require(script.Parent.Types)
local cornerRulesModule = require(script.Parent.cornerRules)
local tokenAttributePascalNameModule = require(script.Parent.Parent.tokenAttributePascalName)

local function kebabToPascal(p0)
	return p0:gsub("^%-?(.)", function(p2)
		return p2:upper()
	end):gsub("%-(.)", function(p1)
		return p1:upper()
	end)
end

local function _(p3, p4)
	return UDim.new(0, (p3.TextSize / p4 * (p3.LineHeight * p4) - p3.TextSize) / 2)
end

local function DefaultSizeRules(p5, p6)
	return {
		{
			tag = "text-size-defaults",
			priority = -1,
			properties = {
				TextSize = "$TextSizeBodyLarge",
				LineHeight = p5.LineHeight
			},
			children = {
				{
					tag = "text-size-defaults",
					pseudo = "UIPadding",
					priority = -1,
					properties = {
						PaddingTop = "$TextPaddingBodyLarge",
						PaddingBottom = "$TextPaddingBodyLarge"
					},
					attributes = {
						{
							name = "TextPaddingBodyLarge",
							value = UDim.new(0, (p5.TextSize / p6 * (p5.LineHeight * p6) - p5.TextSize) / 2)
						}
					}
				}
			},
			attributes = { { name = "TextSizeBodyLarge", value = p5.TextSize } }
		}
	}
end

local function ListLayoutSpacingRules(p7, p8)
	-- upvalues: kebabToPascal (ref), dashModule (ref)
	local t = {}
	
	for i, v in p7 do
		local var30 = kebabToPascal(v.name)
		table.insert(t, {
			pseudo = "UIListLayout",
			tag = `gap-{v.name}`,
			properties = { Padding = `$Gap{var30}` },
			attributes = { { name = `Gap{var30}`, value = v.size } }
		})
	end
	local t_1 = {}
	
	for i_1, v_1 in p8 do
		local var29 = kebabToPascal(v_1.name)
		table.insert(t_1, {
			pseudo = "UIListLayout",
			tag = `gutter-{v_1.name}`,
			properties = { Padding = `$Gutter{var29}` },
			attributes = { { name = `Gutter{var29}`, value = v_1.size } }
		})
	end
	return dashModule.joinArrays(t, t_1)
end

local _ = function(p9)
	-- upvalues: cornerRulesModule (ref), kebabToPascal (ref)
	return cornerRulesModule(p9, function(p10)
		-- upvalues: kebabToPascal (copy)
		local var31 = kebabToPascal(p10.name)
		
		return {
			cornerValue = `$Radius{var31}`,
			attributes = { { name = `Radius{var31}`, value = p10.size } }
		}
	end)
end

local function SizeRules(p11)
	-- upvalues: kebabToPascal (ref)
	local t = {}
	
	for i, v in p11 do
		local var33 = kebabToPascal(v.name)
		table.insert(t, {
			tag = `size-{v.name}`,
			properties = { Size = `$Size{var33}` },
			attributes = {
				{ name = `Size{var33}`, value = UDim2.new(v.size, v.size) }
			}
		})
		
		for i_1, v_1 in p11 do
			local var34 = kebabToPascal(v_1.name)
			table.insert(t, {
				tag = `size-{v.name}-{v_1.name}`,
				properties = { Size = `$Size{var33}_{var34}` },
				attributes = {
					{
						name = `Size{var33}_{var34}`,
						value = UDim2.new(v.size, v_1.size)
					}
				}
			})
		end
	end
	return t
end

local function TypographyRules(p12, p13)
	-- upvalues: kebabToPascal (ref)
	local t = {}
	
	for i, v in p12 do
		local var36 = kebabToPascal(i)
		table.insert(t, {
			tag = `text-{i}`,
			properties = {
				Font = `$Font{var36}`,
				TextSize = `$TextSize{var36}`,
				LineHeight = v.LineHeight
			},
			attributes = {
				{ name = `Font{var36}`, value = v.Font },
				{ name = `TextSize{var36}`, value = v.TextSize }
			},
			children = {
				{
					pseudo = "UIPadding",
					priority = 0,
					tag = `text-{i}`,
					properties = {
						PaddingTop = `$TextPadding{var36}`,
						PaddingBottom = `$TextPadding{var36}`
					},
					attributes = {
						{
							name = `TextPadding{var36}`,
							value = UDim.new(0, (v.TextSize / p13 * (v.LineHeight * p13) - v.TextSize) / 2)
						}
					}
				}
			}
		})
	end
	return t
end

local function PaddingRules(p14, p15)
	-- upvalues: kebabToPascal (ref)
	local t = {}
	local t_1 = {
		x = { "PaddingLeft", "PaddingRight" },
		y = { "PaddingTop", "PaddingBottom" },
		top = { "PaddingTop" },
		bottom = { "PaddingBottom" },
		left = { "PaddingLeft" },
		right = { "PaddingRight" }
	}
	
	for i, v in p14 do
		local var44 = kebabToPascal(v.name)
		table.insert(t, {
			pseudo = "UIPadding",
			tag = `padding-{v.name}`,
			properties = {
				PaddingTop = `$Padding{var44}`,
				PaddingBottom = `$Padding{var44}`,
				PaddingLeft = `$Padding{var44}`,
				PaddingRight = `$Padding{var44}`
			},
			attributes = { { name = `Padding{var44}`, value = v.size } }
		})
	end
	for i_1, v_1 in p15 do
		local var43 = kebabToPascal(v_1.name)
		table.insert(t, {
			pseudo = "UIPadding",
			tag = `margin-{v_1.name}`,
			properties = {
				PaddingTop = `$Margin{var43}`,
				PaddingBottom = `$Margin{var43}`,
				PaddingLeft = `$Margin{var43}`,
				PaddingRight = `$Margin{var43}`
			},
			attributes = { { name = `Margin{var43}`, value = v_1.size } }
		})
	end
	for i_2, v_2 in t_1 do
		for i_3, v_3 in p14 do
			local var41 = kebabToPascal(v_3.name)
			local t_2 = {}
			
			for i_5, v_5 in v_2 do
				t_2[v_5] = `$Padding{var41}`
			end
			table.insert(t, {
				pseudo = "UIPadding",
				tag = `padding-{i_2}-{v_3.name}`,
				properties = t_2,
				attributes = { { name = `Padding{var41}`, value = v_3.size } }
			})
		end
		for i_3, v_3 in p15 do
			local var39 = kebabToPascal(v_3.name)
			local t_2 = {}
			
			for i_5, v_5 in v_2 do
				t_2[v_5] = `$Margin{var39}`
			end
			table.insert(t, {
				pseudo = "UIPadding",
				tag = `margin-{i_2}-{v_3.name}`,
				properties = t_2,
				attributes = { { name = `Margin{var39}`, value = v_3.size } }
			})
		end
	end
	return t
end

local t = {
	Content = { "content" },
	Stroke = { "stroke" },
	Shift = { "bg" },
	Surface = { "bg" },
	OverMedia = { "bg" },
	System = { "bg", "content", "stroke" },
	Extended = {},
	Common = {},
	Selection = {},
	State = {},
	None = {}
}

local function DefaultRules(p16)
	return {
		{
			tag = "gui-object-defaults",
			priority = -1,
			properties = { BackgroundTransparency = 1 }
		},
		{
			tag = "text-defaults",
			priority = -1,
			properties = { Font = "$FontBodyLarge" },
			attributes = {
				{
					name = "FontBodyLarge",
					value = p16.Typography.BodyLarge.Font
				}
			}
		}
	}
end

local function DefaultColorRules(p17)
	return {
		{
			tag = "text-color-defaults",
			priority = -1,
			properties = {
				TextColor3 = "$ColorContentDefaultColor3",
				TextTransparency = "$ColorContentDefaultTransparency"
			},
			attributes = {
				{
					name = "ColorContentDefaultColor3",
					value = p17.Color.Content.Default.Color3
				},
				{
					name = "ColorContentDefaultTransparency",
					value = p17.Color.Content.Default.Transparency
				}
			}
		}
	}
end

local function BackgroundRules(value, p18)
	-- upvalues: t (ref), tokenAttributePascalNameModule (ref), kebabToPascal (ref)
	local t_1 = {}
	
	for i, v in value do
		if table.find(t[i], "bg") then
			for i_1, v_1 in v do
				local var47 = tokenAttributePascalNameModule(i, i_1)
				table.insert(t_1, {
					tag = `bg-{i_1}`,
					properties = {
						BackgroundColor3 = `$Color{i}{var47}Color3`,
						BackgroundTransparency = `$Color{i}{var47}Transparency`
					},
					attributes = {
						{ name = `Color{i}{var47}Color3`, value = v_1.Color3 },
						{
							name = `Color{i}{var47}Transparency`,
							value = v_1.Transparency
						}
					}
				})
			end
		end
	end
	for i_1, v_1 in p18 do
		local var46 = kebabToPascal(i_1)
		table.insert(t_1, {
			tag = `bg-{i_1}`,
			properties = {
				BackgroundColor3 = `$Color{var46}BackgroundColor3`,
				BackgroundTransparency = `$Color{var46}BackgroundTransparency`
			},
			attributes = {
				{
					name = `Color{var46}BackgroundColor3`,
					value = v_1.Background.Color3
				},
				{
					name = `Color{var46}BackgroundTransparency`,
					value = v_1.Background.Transparency
				}
			}
		})
	end
	return t_1
end

local function StrokeSizeRules(p19)
	-- upvalues: kebabToPascal (ref)
	local t = {}
	
	for i, v in p19 do
		if v.name ~= "none" then
			local var49 = kebabToPascal(v.name)
			table.insert(t, {
				pseudo = "UIStroke",
				tag = `stroke-{v.name}`,
				properties = { Thickness = `$StrokeThickness{var49}` },
				attributes = { { name = `StrokeThickness{var49}`, value = v.size } }
			})
		end
	end
	return t
end

local function StrokeRules(p20, p21)
	-- upvalues: t (ref), tokenAttributePascalNameModule (ref), kebabToPascal (ref)
	local t_1 = {}
	
	for i, v in p20 do
		if table.find(t[i], "stroke") then
			for i_1, v_1 in v do
				local var52 = tokenAttributePascalNameModule(i, i_1)
				table.insert(t_1, {
					pseudo = "UIStroke",
					tag = `stroke-{i_1}`,
					properties = {
						Color = `$Color{i}{var52}Color3`,
						Transparency = `$Color{i}{var52}Transparency`
					},
					attributes = {
						{ name = `Color{i}{var52}Color3`, value = v_1.Color3 },
						{
							name = `Color{i}{var52}Transparency`,
							value = v_1.Transparency
						}
					}
				})
			end
		end
	end
	for i_1, v_1 in p21 do
		local var51 = kebabToPascal(i_1)
		table.insert(t_1, {
			pseudo = "UIStroke",
			tag = `stroke-{i_1}`,
			properties = {
				Color = `$Color{var51}BorderColor3`,
				Transparency = `$Color{var51}BorderTransparency`
			},
			attributes = {
				{
					name = `Color{var51}BorderColor3`,
					value = v_1.Border.Color3
				},
				{
					name = `Color{var51}BorderTransparency`,
					value = v_1.Border.Transparency
				}
			}
		})
	end
	for i_2, v_2 in {
		center = Enum.BorderStrokePosition.Center,
		inner = Enum.BorderStrokePosition.Inner,
		outer = Enum.BorderStrokePosition.Outer
	} do
		table.insert(t_1, {
			pseudo = "UIStroke",
			tag = `stroke-position-{i_2}`,
			properties = { BorderStrokePosition = v_2 }
		})
	end
	return t_1
end

local function ContentRules(p22, p23)
	-- upvalues: t (ref), tokenAttributePascalNameModule (ref), kebabToPascal (ref)
	local t_1 = {}
	
	for i, v in p22 do
		if table.find(t[i], "content") then
			for i_1, v_1 in v do
				local var55 = tokenAttributePascalNameModule(i, i_1)
				table.insert(t_1, {
					tag = `content-{i_1}`,
					properties = {
						ImageColor3 = `$Color{i}{var55}Color3`,
						ImageTransparency = `$Color{i}{var55}Transparency`,
						TextColor3 = `$Color{i}{var55}Color3`,
						TextTransparency = `$Color{i}{var55}Transparency`
					},
					attributes = {
						{ name = `Color{i}{var55}Color3`, value = v_1.Color3 },
						{
							name = `Color{i}{var55}Transparency`,
							value = v_1.Transparency
						}
					}
				})
			end
		end
	end
	for i_1, v_1 in p23 do
		local var54 = kebabToPascal(i_1)
		table.insert(t_1, {
			tag = `content-{i_1}`,
			properties = {
				ImageColor3 = `$Color{var54}ForegroundColor3`,
				ImageTransparency = `$Color{var54}ForegroundTransparency`,
				TextColor3 = `$Color{var54}ForegroundColor3`,
				TextTransparency = `$Color{var54}ForegroundTransparency`
			},
			attributes = {
				{
					name = `Color{var54}ForegroundColor3`,
					value = v_1.Foreground.Color3
				},
				{
					name = `Color{var54}ForegroundTransparency`,
					value = v_1.Foreground.Transparency
				}
			}
		})
	end
	return t_1
end

local function DeprecatedColorRules(p24)
	-- upvalues: tokenAttributePascalNameModule (ref)
	local t = {}
	
	for i, v in p24.System do
		local var57 = i:sub(8)
		local var58 = tokenAttributePascalNameModule("System", i)
		table.insert(t, {
			tag = `bg-{var57}`,
			properties = {
				BackgroundColor3 = `$ColorSystem{var58}Color3`,
				BackgroundTransparency = `$ColorSystem{var58}Transparency`
			},
			attributes = {
				{ name = `ColorSystem{var58}Color3`, value = v.Color3 },
				{
					name = `ColorSystem{var58}Transparency`,
					value = v.Transparency
				}
			},
			deprecatedFor = `bg-{i}`
		})
		
		if var57 ~= "emphasis" then
			table.insert(t, {
				tag = `content-{var57}`,
				properties = {
					ImageColor3 = `$ColorSystem{var58}Color3`,
					ImageTransparency = `$ColorSystem{var58}Transparency`,
					TextColor3 = `$ColorSystem{var58}Color3`,
					TextTransparency = `$ColorSystem{var58}Transparency`
				},
				attributes = {
					{ name = `ColorSystem{var58}Color3`, value = v.Color3 },
					{
						name = `ColorSystem{var58}Transparency`,
						value = v.Transparency
					}
				},
				deprecatedFor = `content-{i}`
			})
			table.insert(t, {
				pseudo = "UIStroke",
				tag = `stroke-{var57}`,
				properties = {
					Color = `$ColorSystem{var58}Color3`,
					Transparency = `$ColorSystem{var58}Transparency`
				},
				attributes = {
					{ name = `ColorSystem{var58}Color3`, value = v.Color3 },
					{
						name = `ColorSystem{var58}Transparency`,
						value = v.Transparency
					}
				},
				deprecatedFor = `stroke-{i}`
			})
		end
	end
	return t
end

local function EngineDefaultBypassRules()
	return {
		{
			tag = "x-default-transparency",
			properties = { BackgroundTransparency = 0 }
		},
		{
			tag = "x-default-text-size",
			properties = { TextSize = 8 }
		}
	}
end

local function ListLayoutRules()
	-- upvalues: dashModule (ref)
	local list = {
		{
			tag = "row",
			pseudo = "UIListLayout",
			properties = {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder
			}
		},
		{
			tag = "col",
			pseudo = "UIListLayout",
			properties = {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}
		}
	}
	local list_1 = {
		{
			tag = "align-x-left",
			pseudo = "UIListLayout",
			properties = { HorizontalAlignment = Enum.HorizontalAlignment.Left }
		},
		{
			tag = "align-x-center",
			pseudo = "UIListLayout",
			properties = { HorizontalAlignment = Enum.HorizontalAlignment.Center }
		},
		{
			tag = "align-x-right",
			pseudo = "UIListLayout",
			properties = { HorizontalAlignment = Enum.HorizontalAlignment.Right }
		},
		{
			tag = "align-y-top",
			pseudo = "UIListLayout",
			properties = { VerticalAlignment = Enum.VerticalAlignment.Top }
		},
		{
			tag = "align-y-center",
			pseudo = "UIListLayout",
			properties = { VerticalAlignment = Enum.VerticalAlignment.Center }
		},
		{
			tag = "align-y-bottom",
			pseudo = "UIListLayout",
			properties = { VerticalAlignment = Enum.VerticalAlignment.Bottom }
		}
	}
	local list_2 = {
		{
			tag = "wrap",
			pseudo = "UIListLayout",
			properties = { Wraps = true }
		},
		{
			tag = "no-wrap",
			pseudo = "UIListLayout",
			properties = { Wraps = false }
		}
	}
	local t = {}
	
	for i, v in {
		none = Enum.UIFlexAlignment.None,
		fill = Enum.UIFlexAlignment.Fill,
		around = Enum.UIFlexAlignment.SpaceAround,
		between = Enum.UIFlexAlignment.SpaceBetween,
		evenly = Enum.UIFlexAlignment.SpaceEvenly
	} do
		table.insert(t, {
			pseudo = "UIListLayout",
			tag = `flex-{i}`,
			properties = { HorizontalFlex = v, VerticalFlex = v }
		})
		table.insert(t, {
			pseudo = "UIListLayout",
			tag = `flex-x-{i}`,
			properties = { HorizontalFlex = v }
		})
		table.insert(t, {
			pseudo = "UIListLayout",
			tag = `flex-y-{i}`,
			properties = { VerticalFlex = v }
		})
	end
	local t_1 = {}
	
	for i_1, v_1 in {
		auto = Enum.ItemLineAlignment.Automatic,
		start = Enum.ItemLineAlignment.Start,
		center = Enum.ItemLineAlignment.Center,
		["end"] = Enum.ItemLineAlignment.End,
		stretch = Enum.ItemLineAlignment.Stretch
	} do
		table.insert(t_1, {
			pseudo = "UIListLayout",
			tag = `items-{i_1}`,
			properties = { ItemLineAlignment = v_1 }
		})
	end
	return dashModule.joinArrays(list, list_1, list_2, t, t_1)
end

local function FlexItemRules()
	-- upvalues: dashModule (ref)
	local list = {
		{
			tag = "grow",
			pseudo = "UIFlexItem",
			properties = { FlexMode = Enum.UIFlexMode.Grow }
		},
		{
			tag = "shrink",
			pseudo = "UIFlexItem",
			properties = { FlexMode = Enum.UIFlexMode.Shrink }
		},
		{
			tag = "fill",
			pseudo = "UIFlexItem",
			properties = { FlexMode = Enum.UIFlexMode.Fill }
		},
		{
			tag = "no-flex",
			pseudo = "UIFlexItem",
			properties = { FlexMode = Enum.UIFlexMode.None }
		}
	}
	local list_1 = {
		1,
		2,
		3,
		4,
		5
	}
	local t = {}
	local t_1 = {}
	
	for i in list_1 do
		table.insert(t, {
			pseudo = "UIFlexItem",
			tag = `grow-{i}`,
			properties = { FlexMode = Enum.UIFlexMode.Custom, GrowRatio = i }
		})
		table.insert(t_1, {
			pseudo = "UIFlexItem",
			tag = `shrink-{i}`,
			properties = { FlexMode = Enum.UIFlexMode.Custom, ShrinkRatio = i }
		})
	end
	local t_2 = {}
	
	for i_1, v in {
		auto = Enum.ItemLineAlignment.Automatic,
		start = Enum.ItemLineAlignment.Start,
		center = Enum.ItemLineAlignment.Center,
		["end"] = Enum.ItemLineAlignment.End,
		stretch = Enum.ItemLineAlignment.Stretch
	} do
		table.insert(t_2, {
			pseudo = "UIFlexItem",
			tag = `self-{i_1}`,
			properties = { ItemLineAlignment = v }
		})
	end
	return dashModule.joinArrays(list, t, t_1, t_2)
end

local function TextRules()
	local t = {}
	
	for i, v in {
		left = Enum.TextXAlignment.Left,
		center = Enum.TextXAlignment.Center,
		right = Enum.TextXAlignment.Right
	} do
		table.insert(t, {
			tag = `text-align-x-{i}`,
			properties = { TextXAlignment = v }
		})
	end
	for i_1, v_1 in {
		top = Enum.TextYAlignment.Top,
		center = Enum.TextYAlignment.Center,
		bottom = Enum.TextYAlignment.Bottom
	} do
		table.insert(t, {
			tag = `text-align-y-{i_1}`,
			properties = { TextYAlignment = v_1 }
		})
	end
	for i_2, v_2 in {
		none = Enum.TextTruncate.None,
		["end"] = Enum.TextTruncate.AtEnd,
		split = Enum.TextTruncate.SplitWord
	} do
		table.insert(t, {
			tag = `text-truncate-{i_2}`,
			properties = { TextTruncate = v_2 }
		})
	end
	table.insert(t, { tag = "text-wrap", properties = { TextWrapped = true } })
	table.insert(t, {
		tag = "text-no-wrap",
		properties = { TextWrapped = false }
	})
	
	return t
end

local function AutomaticSizeRules()
	local t = {}
	
	for i, v in {
		none = Enum.AutomaticSize.None,
		x = Enum.AutomaticSize.X,
		y = Enum.AutomaticSize.Y,
		xy = Enum.AutomaticSize.XY
	} do
		table.insert(t, { tag = `auto-{i}`, properties = { AutomaticSize = v } })
	end
	return t
end

local function PositionRules()
	local t = {}
	local t_1 = { top = 0, center = 0.5, bottom = 1 }
	
	for i, v in { left = 0, center = 0.5, right = 1 } do
		for i_1, v_1 in t_1 do
			table.insert(t, {
				tag = `position-{i_1}-{i}`,
				properties = { Position = UDim2.fromScale(v, v_1) }
			})
		end
	end
	return t
end

local function AnchorPointRules()
	local t = {}
	local t_1 = { top = 0, center = 0.5, bottom = 1 }
	
	for i, v in { left = 0, center = 0.5, right = 1 } do
		for i_1, v_1 in t_1 do
			table.insert(t, {
				tag = `anchor-{i_1}-{i}`,
				properties = { AnchorPoint = Vector2.new(v, v_1) }
			})
		end
	end
	return t
end

local function ClipsDescendantRules()
	return {
		{ tag = "clip", properties = { ClipsDescendants = true } },
		{
			tag = "no-clip",
			properties = { ClipsDescendants = false }
		}
	}
end

local _ = function(value, p25)
	local var75 = 10 ^ p25
	
	return math.round(value * var75) / var75
end

local function AspectRatioRules()
	local t = {}
	
	for i, v in {
		{ 1, 1 }, { 5, 4 }, { 4, 3 }, { 3, 2 }, { 16, 9 }, { 2, 1 }
	} do
		table.insert(t, {
			pseudo = "UIAspectRatioConstraint",
			tag = `aspect-{v[1]}-{v[2]}`,
			properties = { AspectRatio = math.round(v[1] / v[2] * 1000) / 1000 }
		})
		
		if v[1] ~= v[2] then
			table.insert(t, {
				pseudo = "UIAspectRatioConstraint",
				tag = `aspect-{v[2]}-{v[1]}`,
				properties = { AspectRatio = math.round(v[2] / v[1] * 1000) / 1000 }
			})
		end
	end
	return t
end

return {
	rulesGenerator = function(p26, p27)
		-- upvalues: dashModule (ref), DefaultRules (ref), EngineDefaultBypassRules (ref), FlexItemRules (ref), TextRules (ref), AutomaticSizeRules (ref), PositionRules (ref), AnchorPointRules (ref), ClipsDescendantRules (ref), AspectRatioRules (ref), DefaultSizeRules (ref), ListLayoutRules (ref), ListLayoutSpacingRules (ref), cornerRulesModule (ref), kebabToPascal (ref), SizeRules (ref), StrokeSizeRules (ref), TypographyRules (ref), PaddingRules (ref), DefaultColorRules (ref), DeprecatedColorRules (ref), BackgroundRules (ref), StrokeRules (ref), ContentRules (ref)
		local colors = p27.colors
		local variants = p27.variants
		local typography = p27.typography
		
		return dashModule.joinArrays(DefaultRules(p26), EngineDefaultBypassRules(), FlexItemRules(), TextRules(), AutomaticSizeRules(), PositionRules(), AnchorPointRules(), ClipsDescendantRules(), AspectRatioRules()), dashModule.joinArrays(DefaultSizeRules(typography["body-large"], p26.Config.Text.NominalScale), ListLayoutRules(), ListLayoutSpacingRules(p27.gaps, p27.gutters), cornerRulesModule(p27.radii, function(p28)
			-- upvalues: kebabToPascal (copy)
			local var31 = kebabToPascal(p28.name)
			
			return {
				cornerValue = `$Radius{var31}`,
				attributes = { { name = `Radius{var31}`, value = p28.size } }
			}
		end), SizeRules(p27.sizes), StrokeSizeRules(p27.strokes), TypographyRules(typography, p26.Config.Text.NominalScale), PaddingRules(p27.paddings, p27.margins)), dashModule.joinArrays(DefaultColorRules(p26), DeprecatedColorRules(colors), BackgroundRules(colors, variants), StrokeRules(colors, variants), ContentRules(colors, variants))
	end
}