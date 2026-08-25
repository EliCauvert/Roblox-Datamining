local foundation = script:FindFirstAncestor("Foundation")
local dashModule = require(foundation.Parent.Dash)
local _ = require(foundation.Providers.Style.Tokens)
local _ = require(script.Parent.Types)
local cornerRulesModule = require(script.Parent.cornerRules)
local tokenAttributePascalNameModule = require(script.Parent.Parent.tokenAttributePascalName)

local function kebabToPascal(p1)
	return p1:gsub("^%-?(.)", function(p1)
		return p1:upper()
	end):gsub("%-(.)", function(p1)
		return p1:upper()
	end)
end

local function _(p1, p2)
	return UDim.new(0, (p1.TextSize / p2 * (p1.LineHeight * p2) - p1.TextSize) / 2)
end

local function DefaultSizeRules(p1, p2)
	return {
		{
			tag = "text-size-defaults",
			priority = -1,
			properties = {
				TextSize = "$TextSizeBodyLarge",
				LineHeight = p1.LineHeight
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
							value = UDim.new(0, (p1.TextSize / p2 * (p1.LineHeight * p2) - p1.TextSize) / 2)
						}
					}
				}
			},
			attributes = { { name = "TextSizeBodyLarge", value = p1.TextSize } }
		}
	}
end

local function ListLayoutSpacingRules(p1, p2)
	-- upvalues: kebabToPascal (ref), dashModule (ref)
	local t = {}
	
	for i, v in p1 do
		local var1 = kebabToPascal(v.name)
		table.insert(t, {
			pseudo = "UIListLayout",
			tag = `gap-{v.name}`,
			properties = { Padding = `$Gap{var1}` },
			attributes = { { name = `Gap{var1}`, value = v.size } }
		})
	end
	local t_1 = {}
	
	for i_1, v_1 in p2 do
		local var2 = kebabToPascal(v_1.name)
		table.insert(t_1, {
			pseudo = "UIListLayout",
			tag = `gutter-{v_1.name}`,
			properties = { Padding = `$Gutter{var2}` },
			attributes = { { name = `Gutter{var2}`, value = v_1.size } }
		})
	end
	return dashModule.joinArrays(t, t_1)
end

local _ = function(p1)
	-- upvalues: cornerRulesModule (ref), kebabToPascal (ref)
	return cornerRulesModule(p1, function(p1)
		-- upvalues: kebabToPascal (copy)
		local var1 = kebabToPascal(p1.name)
		
		return {
			cornerValue = `$Radius{var1}`,
			attributes = { { name = `Radius{var1}`, value = p1.size } }
		}
	end)
end

local function SizeRules(p1)
	-- upvalues: kebabToPascal (ref)
	local t = {}
	
	for i, v in p1 do
		local var1 = kebabToPascal(v.name)
		table.insert(t, {
			tag = `size-{v.name}`,
			properties = { Size = `$Size{var1}` },
			attributes = {
				{ name = `Size{var1}`, value = UDim2.new(v.size, v.size) }
			}
		})
		
		for i_1, v_1 in p1 do
			local var2 = kebabToPascal(v_1.name)
			table.insert(t, {
				tag = `size-{v.name}-{v_1.name}`,
				properties = { Size = `$Size{var1}_{var2}` },
				attributes = {
					{
						name = `Size{var1}_{var2}`,
						value = UDim2.new(v.size, v_1.size)
					}
				}
			})
		end
	end
	return t
end

local function TypographyRules(p1, p2)
	-- upvalues: kebabToPascal (ref)
	local t = {}
	
	for i, v in p1 do
		local var1 = kebabToPascal(i)
		table.insert(t, {
			tag = `text-{i}`,
			properties = {
				Font = `$Font{var1}`,
				TextSize = `$TextSize{var1}`,
				LineHeight = v.LineHeight
			},
			attributes = {
				{ name = `Font{var1}`, value = v.Font },
				{ name = `TextSize{var1}`, value = v.TextSize }
			},
			children = {
				{
					pseudo = "UIPadding",
					priority = 0,
					tag = `text-{i}`,
					properties = {
						PaddingTop = `$TextPadding{var1}`,
						PaddingBottom = `$TextPadding{var1}`
					},
					attributes = {
						{
							name = `TextPadding{var1}`,
							value = UDim.new(0, (v.TextSize / p2 * (v.LineHeight * p2) - v.TextSize) / 2)
						}
					}
				}
			}
		})
	end
	return t
end

local function PaddingRules(p1, p2)
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
	
	for i, v in p1 do
		local var1 = kebabToPascal(v.name)
		table.insert(t, {
			pseudo = "UIPadding",
			tag = `padding-{v.name}`,
			properties = {
				PaddingTop = `$Padding{var1}`,
				PaddingBottom = `$Padding{var1}`,
				PaddingLeft = `$Padding{var1}`,
				PaddingRight = `$Padding{var1}`
			},
			attributes = { { name = `Padding{var1}`, value = v.size } }
		})
	end
	for i_1, v_1 in p2 do
		local var2 = kebabToPascal(v_1.name)
		table.insert(t, {
			pseudo = "UIPadding",
			tag = `margin-{v_1.name}`,
			properties = {
				PaddingTop = `$Margin{var2}`,
				PaddingBottom = `$Margin{var2}`,
				PaddingLeft = `$Margin{var2}`,
				PaddingRight = `$Margin{var2}`
			},
			attributes = { { name = `Margin{var2}`, value = v_1.size } }
		})
	end
	for i_2, v_2 in t_1 do
		for i_3, v_3 in p1 do
			local var3 = kebabToPascal(v_3.name)
			local t_2 = {}
			
			for i_5, v_5 in v_2 do
				t_2[v_5] = `$Padding{var3}`
			end
			table.insert(t, {
				pseudo = "UIPadding",
				tag = `padding-{i_2}-{v_3.name}`,
				properties = t_2,
				attributes = { { name = `Padding{var3}`, value = v_3.size } }
			})
		end
		for i_3, v_3 in p2 do
			local var4 = kebabToPascal(v_3.name)
			local t_2 = {}
			
			for i_5, v_5 in v_2 do
				t_2[v_5] = `$Margin{var4}`
			end
			table.insert(t, {
				pseudo = "UIPadding",
				tag = `margin-{i_2}-{v_3.name}`,
				properties = t_2,
				attributes = { { name = `Margin{var4}`, value = v_3.size } }
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

local function DefaultRules(p1)
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
					value = p1.Typography.BodyLarge.Font
				}
			}
		}
	}
end

local function DefaultColorRules(p1)
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
					value = p1.Color.Content.Default.Color3
				},
				{
					name = "ColorContentDefaultTransparency",
					value = p1.Color.Content.Default.Transparency
				}
			}
		}
	}
end

local function BackgroundRules(value, p1)
	-- upvalues: t (ref), tokenAttributePascalNameModule (ref), kebabToPascal (ref)
	local t_1 = {}
	
	for i, v in value do
		if table.find(t[i], "bg") then
			for i_1, v_1 in v do
				local var1 = tokenAttributePascalNameModule(i, i_1)
				table.insert(t_1, {
					tag = `bg-{i_1}`,
					properties = {
						BackgroundColor3 = `$Color{i}{var1}Color3`,
						BackgroundTransparency = `$Color{i}{var1}Transparency`
					},
					attributes = {
						{ name = `Color{i}{var1}Color3`, value = v_1.Color3 },
						{
							name = `Color{i}{var1}Transparency`,
							value = v_1.Transparency
						}
					}
				})
			end
		end
	end
	for i_1, v_1 in p1 do
		local var2 = kebabToPascal(i_1)
		table.insert(t_1, {
			tag = `bg-{i_1}`,
			properties = {
				BackgroundColor3 = `$Color{var2}BackgroundColor3`,
				BackgroundTransparency = `$Color{var2}BackgroundTransparency`
			},
			attributes = {
				{
					name = `Color{var2}BackgroundColor3`,
					value = v_1.Background.Color3
				},
				{
					name = `Color{var2}BackgroundTransparency`,
					value = v_1.Background.Transparency
				}
			}
		})
	end
	return t_1
end

local function StrokeSizeRules(p1)
	-- upvalues: kebabToPascal (ref)
	local t = {}
	
	for i, v in p1 do
		if v.name ~= "none" then
			local var1 = kebabToPascal(v.name)
			table.insert(t, {
				pseudo = "UIStroke",
				tag = `stroke-{v.name}`,
				properties = { Thickness = `$StrokeThickness{var1}` },
				attributes = { { name = `StrokeThickness{var1}`, value = v.size } }
			})
		end
	end
	return t
end

local function StrokeRules(p1, p2)
	-- upvalues: t (ref), tokenAttributePascalNameModule (ref), kebabToPascal (ref)
	local t_1 = {}
	
	for i, v in p1 do
		if table.find(t[i], "stroke") then
			for i_1, v_1 in v do
				local var1 = tokenAttributePascalNameModule(i, i_1)
				table.insert(t_1, {
					pseudo = "UIStroke",
					tag = `stroke-{i_1}`,
					properties = {
						Color = `$Color{i}{var1}Color3`,
						Transparency = `$Color{i}{var1}Transparency`
					},
					attributes = {
						{ name = `Color{i}{var1}Color3`, value = v_1.Color3 },
						{
							name = `Color{i}{var1}Transparency`,
							value = v_1.Transparency
						}
					}
				})
			end
		end
	end
	for i_1, v_1 in p2 do
		local var2 = kebabToPascal(i_1)
		table.insert(t_1, {
			pseudo = "UIStroke",
			tag = `stroke-{i_1}`,
			properties = {
				Color = `$Color{var2}BorderColor3`,
				Transparency = `$Color{var2}BorderTransparency`
			},
			attributes = {
				{
					name = `Color{var2}BorderColor3`,
					value = v_1.Border.Color3
				},
				{
					name = `Color{var2}BorderTransparency`,
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

local function ContentRules(p1, p2)
	-- upvalues: t (ref), tokenAttributePascalNameModule (ref), kebabToPascal (ref)
	local t_1 = {}
	
	for i, v in p1 do
		if table.find(t[i], "content") then
			for i_1, v_1 in v do
				local var1 = tokenAttributePascalNameModule(i, i_1)
				table.insert(t_1, {
					tag = `content-{i_1}`,
					properties = {
						ImageColor3 = `$Color{i}{var1}Color3`,
						ImageTransparency = `$Color{i}{var1}Transparency`,
						TextColor3 = `$Color{i}{var1}Color3`,
						TextTransparency = `$Color{i}{var1}Transparency`
					},
					attributes = {
						{ name = `Color{i}{var1}Color3`, value = v_1.Color3 },
						{
							name = `Color{i}{var1}Transparency`,
							value = v_1.Transparency
						}
					}
				})
			end
		end
	end
	for i_1, v_1 in p2 do
		local var2 = kebabToPascal(i_1)
		table.insert(t_1, {
			tag = `content-{i_1}`,
			properties = {
				ImageColor3 = `$Color{var2}ForegroundColor3`,
				ImageTransparency = `$Color{var2}ForegroundTransparency`,
				TextColor3 = `$Color{var2}ForegroundColor3`,
				TextTransparency = `$Color{var2}ForegroundTransparency`
			},
			attributes = {
				{
					name = `Color{var2}ForegroundColor3`,
					value = v_1.Foreground.Color3
				},
				{
					name = `Color{var2}ForegroundTransparency`,
					value = v_1.Foreground.Transparency
				}
			}
		})
	end
	return t_1
end

local function DeprecatedColorRules(p1)
	-- upvalues: tokenAttributePascalNameModule (ref)
	local t = {}
	
	for i, v in p1.System do
		local var1 = i:sub(8)
		local var2 = tokenAttributePascalNameModule("System", i)
		table.insert(t, {
			tag = `bg-{var1}`,
			properties = {
				BackgroundColor3 = `$ColorSystem{var2}Color3`,
				BackgroundTransparency = `$ColorSystem{var2}Transparency`
			},
			attributes = {
				{ name = `ColorSystem{var2}Color3`, value = v.Color3 },
				{
					name = `ColorSystem{var2}Transparency`,
					value = v.Transparency
				}
			},
			deprecatedFor = `bg-{i}`
		})
		
		if var1 ~= "emphasis" then
			table.insert(t, {
				tag = `content-{var1}`,
				properties = {
					ImageColor3 = `$ColorSystem{var2}Color3`,
					ImageTransparency = `$ColorSystem{var2}Transparency`,
					TextColor3 = `$ColorSystem{var2}Color3`,
					TextTransparency = `$ColorSystem{var2}Transparency`
				},
				attributes = {
					{ name = `ColorSystem{var2}Color3`, value = v.Color3 },
					{
						name = `ColorSystem{var2}Transparency`,
						value = v.Transparency
					}
				},
				deprecatedFor = `content-{i}`
			})
			table.insert(t, {
				pseudo = "UIStroke",
				tag = `stroke-{var1}`,
				properties = {
					Color = `$ColorSystem{var2}Color3`,
					Transparency = `$ColorSystem{var2}Transparency`
				},
				attributes = {
					{ name = `ColorSystem{var2}Color3`, value = v.Color3 },
					{
						name = `ColorSystem{var2}Transparency`,
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

local _ = function(value, p1)
	local var1 = 10 ^ p1
	
	return math.round(value * var1) / var1
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
	rulesGenerator = function(p1, p2)
		-- upvalues: dashModule (ref), DefaultRules (ref), EngineDefaultBypassRules (ref), FlexItemRules (ref), TextRules (ref), AutomaticSizeRules (ref), PositionRules (ref), AnchorPointRules (ref), ClipsDescendantRules (ref), AspectRatioRules (ref), DefaultSizeRules (ref), ListLayoutRules (ref), ListLayoutSpacingRules (ref), cornerRulesModule (ref), kebabToPascal (ref), SizeRules (ref), StrokeSizeRules (ref), TypographyRules (ref), PaddingRules (ref), DefaultColorRules (ref), DeprecatedColorRules (ref), BackgroundRules (ref), StrokeRules (ref), ContentRules (ref)
		local colors = p2.colors
		local variants = p2.variants
		local typography = p2.typography
		
		return dashModule.joinArrays(DefaultRules(p1), EngineDefaultBypassRules(), FlexItemRules(), TextRules(), AutomaticSizeRules(), PositionRules(), AnchorPointRules(), ClipsDescendantRules(), AspectRatioRules()), dashModule.joinArrays(DefaultSizeRules(typography["body-large"], p1.Config.Text.NominalScale), ListLayoutRules(), ListLayoutSpacingRules(p2.gaps, p2.gutters), cornerRulesModule(p2.radii, function(p1)
			-- upvalues: kebabToPascal (copy)
			local var1 = kebabToPascal(p1.name)
			
			return {
				cornerValue = `$Radius{var1}`,
				attributes = { { name = `Radius{var1}`, value = p1.size } }
			}
		end), SizeRules(p2.sizes), StrokeSizeRules(p2.strokes), TypographyRules(typography, p1.Config.Text.NominalScale), PaddingRules(p2.paddings, p2.margins)), dashModule.joinArrays(DefaultColorRules(p1), DeprecatedColorRules(colors), BackgroundRules(colors, variants), StrokeRules(colors, variants), ContentRules(colors, variants))
	end
}