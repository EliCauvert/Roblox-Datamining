local Foundation = script:FindFirstAncestor("Foundation")
local DashModule = require(Foundation.Parent.Dash)
local _ = require(Foundation.Providers.Style.Tokens)
local _ = require(script.Parent.Types)
local CornerRulesModule = require(script.Parent.cornerRules)
local ShadowRulesModule = require(script.Parent.shadowRules)
local TokenAttributePascalNameModule = require(script.Parent.Parent.tokenAttributePascalName)

local function kebabToPascal(Name: string) --[[ Line: 27 ]]
	return (Name:gsub("^%-?(.)", function(Text: string): string --[[ Line: 29 ]]
		return Text:upper()
	end):gsub("%-(.)", function(Text: string): string --[[ Line: 34 ]]
		return Text:upper()
	end))
end

local function _(Label, p1): UDim --[[ Line: 41 | Named "getTextPadding" ]]
	return (UDim.new(0, (Label.TextSize / p1 * (Label.LineHeight * p1) - Label.TextSize) / 2))
end

local function DefaultSizeRules(Label, NominalScale) --[[ Line: 50 ]]
	return {
		{
			tag = "text-size-defaults",
			priority = -1,
			properties = {
				TextSize = "$TextSizeBodyLarge",
				LineHeight = Label.LineHeight
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
							value = UDim.new(0, (Label.TextSize / NominalScale * (Label.LineHeight * NominalScale) - Label.TextSize) / 2)
						}
					}
				}
			},
			attributes = { { name = "TextSizeBodyLarge", value = Label.TextSize } }
		}
	}
end

local function ListLayoutSpacingRules(Gaps, Gutters) --[[ Line: 88 ]]
	-- upvalues: kebabToPascal (copy), DashModule (copy)
	local List = {}
	
	for _, gap in Gaps do
		local KebabToPascalResult = kebabToPascal(gap.name)
		table.insert(List, {
			pseudo = "UIListLayout",
			tag = `gap-{gap.name}`,
			properties = { Padding = `$Gap{KebabToPascalResult}` },
			attributes = { { name = `Gap{KebabToPascalResult}`, value = gap.size } }
		})
	end
	local List1 = {}
	
	for _, gutter in Gutters do
		local KebabToPascalResult = kebabToPascal(gutter.name)
		table.insert(List1, {
			pseudo = "UIListLayout",
			tag = `gutter-{gutter.name}`,
			properties = { Padding = `$Gutter{KebabToPascalResult}` },
			attributes = {
				{
					name = `Gutter{KebabToPascalResult}`,
					value = gutter.size
				}
			}
		})
	end
	return DashModule.joinArrays(List, List1)
end

local _ = function(p1) --[[ Line: 130 | Named "CornerRules" ]]
	-- upvalues: CornerRulesModule (copy), kebabToPascal (copy)
	return CornerRulesModule(p1, function(p2) --[[ Line: 131 ]]
		-- upvalues: kebabToPascal (upval)
		local v1 = kebabToPascal(p2.name)
		
		return {
			cornerValue = `$Radius{v1}`,
			attributes = { { name = `Radius{v1}`, value = p2.size } }
		}
	end)
end

local _ = function(p1) --[[ Line: 145 | Named "ShadowRules" ]]
	-- upvalues: ShadowRulesModule (copy)
	return ShadowRulesModule(p1)
end

local function SizeRules(List) --[[ Line: 149 ]]
	-- upvalues: kebabToPascal (copy)
	local List1 = {}
	
	for _, value in List do
		local KebabToPascalResult = kebabToPascal(value.name)
		table.insert(List1, {
			tag = `size-{value.name}`,
			properties = { Size = `$Size{KebabToPascalResult}` },
			attributes = {
				{
					name = `Size{KebabToPascalResult}`,
					value = UDim2.new(value.size, value.size)
				}
			}
		})
		
		for _, value1 in List do
			local KebabToPascalResult1 = kebabToPascal(value1.name)
			table.insert(List1, {
				tag = `size-{value.name}-{value1.name}`,
				properties = {
					Size = `$Size{KebabToPascalResult}_{KebabToPascalResult1}`
				},
				attributes = {
					{
						name = `Size{KebabToPascalResult}_{KebabToPascalResult1}`,
						value = UDim2.new(value.size, value1.size)
					}
				}
			})
		end
	end
	return List1
end

local function TypographyRules(Typography, NominalScale, p1) --[[ Line: 188 ]]
	-- upvalues: kebabToPascal (copy)
	local List = {}
	
	for i, Label in Typography do
		local KebabToPascalResult = kebabToPascal(i)
		table.insert(List, {
			tag = `text-{i}`,
			properties = {
				Font = if p1 then nil else `$Font{KebabToPascalResult}`,
				FontFace = if p1 then `$Font{KebabToPascalResult}` else nil,
				TextSize = `$TextSize{KebabToPascalResult}`,
				LineHeight = Label.LineHeight
			},
			attributes = {
				{ name = `Font{KebabToPascalResult}`, value = Label.Font },
				{
					name = `TextSize{KebabToPascalResult}`,
					value = Label.TextSize
				}
			},
			children = {
				{
					pseudo = "UIPadding",
					priority = 0,
					tag = `text-{i}`,
					properties = {
						PaddingTop = `$TextPadding{KebabToPascalResult}`,
						PaddingBottom = `$TextPadding{KebabToPascalResult}`
					},
					attributes = {
						{
							name = `TextPadding{KebabToPascalResult}`,
							value = UDim.new(0, (Label.TextSize / NominalScale * (Label.LineHeight * NominalScale) - Label.TextSize) / 2)
						}
					}
				}
			}
		})
	end
	return List
end

local function PaddingRules(List, List1) --[[ Line: 236 ]]
	-- upvalues: kebabToPascal (copy)
	local List2 = {}
	local config = {
		x = { "PaddingLeft", "PaddingRight" },
		y = { "PaddingTop", "PaddingBottom" },
		top = { "PaddingTop" },
		bottom = { "PaddingBottom" },
		left = { "PaddingLeft" },
		right = { "PaddingRight" }
	}
	
	for _, value in List do
		local KebabToPascalResult = kebabToPascal(value.name)
		table.insert(List2, {
			pseudo = "UIPadding",
			tag = `padding-{value.name}`,
			properties = {
				PaddingTop = `$Padding{KebabToPascalResult}`,
				PaddingBottom = `$Padding{KebabToPascalResult}`,
				PaddingLeft = `$Padding{KebabToPascalResult}`,
				PaddingRight = `$Padding{KebabToPascalResult}`
			},
			attributes = {
				{
					name = `Padding{KebabToPascalResult}`,
					value = value.size
				}
			}
		})
	end
	for _, value1 in List1 do
		local KebabToPascalResult = kebabToPascal(value1.name)
		table.insert(List2, {
			pseudo = "UIPadding",
			tag = `margin-{value1.name}`,
			properties = {
				PaddingTop = `$Margin{KebabToPascalResult}`,
				PaddingBottom = `$Margin{KebabToPascalResult}`,
				PaddingLeft = `$Margin{KebabToPascalResult}`,
				PaddingRight = `$Margin{KebabToPascalResult}`
			},
			attributes = {
				{
					name = `Margin{KebabToPascalResult}`,
					value = value1.size
				}
			}
		})
	end
	for i, value3 in config do
		for _, value4 in List do
			local KebabToPascalResult1 = kebabToPascal(value4.name)
			local Properties1 = {}
			
			for _, value5 in value3 do
				Properties1[value5] = `$Padding{KebabToPascalResult1}`
			end
			table.insert(List2, {
				pseudo = "UIPadding",
				tag = `padding-{i}-{value4.name}`,
				properties = Properties1,
				attributes = {
					{
						name = `Padding{KebabToPascalResult1}`,
						value = value4.size
					}
				}
			})
		end
		for _, value2 in List1 do
			local KebabToPascalResult = kebabToPascal(value2.name)
			local Properties = {}
			
			for _, value6 in value3 do
				Properties[value6] = `$Margin{KebabToPascalResult}`
			end
			table.insert(List2, {
				pseudo = "UIPadding",
				tag = `margin-{i}-{value2.name}`,
				properties = Properties,
				attributes = {
					{
						name = `Margin{KebabToPascalResult}`,
						value = value2.size
					}
				}
			})
		end
	end
	return List2
end

local config = {
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

local function GuiObjectDefaultRules() --[[ Line: 349 ]]
	return {
		{
			tag = "gui-object-defaults",
			priority = -1,
			properties = { BackgroundTransparency = 1 }
		}
	}
end

local function DefaultFontRules(p2, p3) --[[ Line: 362 ]]
	return {
		{
			tag = "text-defaults",
			priority = -1,
			properties = {
				Font = if p3 then nil else "$FontBodyLarge",
				FontFace = if p3 then "$FontBodyLarge" else nil
			},
			attributes = {
				{
					name = "FontBodyLarge",
					value = p2.Typography.BodyLarge.Font
				}
			}
		}
	}
end

local function DefaultColorRules(p2) --[[ Line: 382 ]]
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
					value = p2.Color.Content.Default.Color3
				},
				{
					name = "ColorContentDefaultTransparency",
					value = p2.Color.Content.Default.Transparency
				}
			}
		}
	}
end

local function BackgroundRules(Colors, Variants) --[[ Line: 407 ]]
	-- upvalues: config (copy), TokenAttributePascalNameModule (copy), kebabToPascal (copy)
	local List = {}
	
	for i, color in Colors do
		if table.find(config[i], "bg") then
			for i1, value in color do
				local KenAttributePascalNameModule = TokenAttributePascalNameModule(i, i1)
				table.insert(List, {
					tag = `bg-{i1}`,
					properties = {
						BackgroundColor3 = `$Color{i}{KenAttributePascalNameModule}Color3`,
						BackgroundTransparency = `$Color{i}{KenAttributePascalNameModule}Transparency`
					},
					attributes = {
						{
							name = `Color{i}{KenAttributePascalNameModule}Color3`,
							value = value.Color3
						},
						{
							name = `Color{i}{KenAttributePascalNameModule}Transparency`,
							value = value.Transparency
						}
					}
				})
			end
		end
	end
	for i2, variant in Variants do
		local KebabToPascalResult = kebabToPascal(i2)
		table.insert(List, {
			tag = `bg-{i2}`,
			properties = {
				BackgroundColor3 = `$Color{KebabToPascalResult}BackgroundColor3`,
				BackgroundTransparency = `$Color{KebabToPascalResult}BackgroundTransparency`
			},
			attributes = {
				{
					name = `Color{KebabToPascalResult}BackgroundColor3`,
					value = variant.Background.Color3
				},
				{
					name = `Color{KebabToPascalResult}BackgroundTransparency`,
					value = variant.Background.Transparency
				}
			}
		})
	end
	return List
end

local function StrokeSizeRules(Strokes) --[[ Line: 459 ]]
	-- upvalues: kebabToPascal (copy)
	local List = {}
	
	for _, stroke in Strokes do
		if stroke.name ~= "none" then
			local KebabToPascalResult = kebabToPascal(stroke.name)
			table.insert(List, {
				pseudo = "UIStroke",
				tag = `stroke-{stroke.name}`,
				properties = { Thickness = `$StrokeThickness{KebabToPascalResult}` },
				attributes = {
					{
						name = `StrokeThickness{KebabToPascalResult}`,
						value = stroke.size
					}
				}
			})
		end
	end
	return List
end

local function StrokeRules(Colors, Variants) --[[ Line: 486 ]]
	-- upvalues: config (copy), TokenAttributePascalNameModule (copy), kebabToPascal (copy)
	local List = {}
	
	for i, color in Colors do
		if table.find(config[i], "stroke") then
			for i1, value in color do
				local KenAttributePascalNameModule = TokenAttributePascalNameModule(i, i1)
				table.insert(List, {
					pseudo = "UIStroke",
					tag = `stroke-{i1}`,
					properties = {
						Color = `$Color{i}{KenAttributePascalNameModule}Color3`,
						Transparency = `$Color{i}{KenAttributePascalNameModule}Transparency`
					},
					attributes = {
						{
							name = `Color{i}{KenAttributePascalNameModule}Color3`,
							value = value.Color3
						},
						{
							name = `Color{i}{KenAttributePascalNameModule}Transparency`,
							value = value.Transparency
						}
					}
				})
			end
		end
	end
	for i2, variant in Variants do
		local KebabToPascalResult = kebabToPascal(i2)
		table.insert(List, {
			pseudo = "UIStroke",
			tag = `stroke-{i2}`,
			properties = {
				Color = `$Color{KebabToPascalResult}BorderColor3`,
				Transparency = `$Color{KebabToPascalResult}BorderTransparency`
			},
			attributes = {
				{
					name = `Color{KebabToPascalResult}BorderColor3`,
					value = variant.Border.Color3
				},
				{
					name = `Color{KebabToPascalResult}BorderTransparency`,
					value = variant.Border.Transparency
				}
			}
		})
	end
	for i3, BorderStrokePosition in {
		center = Enum.BorderStrokePosition.Center,
		inner = Enum.BorderStrokePosition.Inner,
		outer = Enum.BorderStrokePosition.Outer
	} do
		table.insert(List, {
			pseudo = "UIStroke",
			tag = `stroke-position-{i3}`,
			properties = { BorderStrokePosition = BorderStrokePosition }
		})
	end
	return List
end

local function ContentRules(Colors, Variants) --[[ Line: 556 ]]
	-- upvalues: config (copy), TokenAttributePascalNameModule (copy), kebabToPascal (copy)
	local List = {}
	
	for i, color in Colors do
		if table.find(config[i], "content") then
			for i1, value in color do
				local KenAttributePascalNameModule = TokenAttributePascalNameModule(i, i1)
				table.insert(List, {
					tag = `content-{i1}`,
					properties = {
						ImageColor3 = `$Color{i}{KenAttributePascalNameModule}Color3`,
						ImageTransparency = `$Color{i}{KenAttributePascalNameModule}Transparency`,
						TextColor3 = `$Color{i}{KenAttributePascalNameModule}Color3`,
						TextTransparency = `$Color{i}{KenAttributePascalNameModule}Transparency`
					},
					attributes = {
						{
							name = `Color{i}{KenAttributePascalNameModule}Color3`,
							value = value.Color3
						},
						{
							name = `Color{i}{KenAttributePascalNameModule}Transparency`,
							value = value.Transparency
						}
					}
				})
			end
		end
	end
	for i2, variant in Variants do
		local KebabToPascalResult = kebabToPascal(i2)
		table.insert(List, {
			tag = `content-{i2}`,
			properties = {
				ImageColor3 = `$Color{KebabToPascalResult}ForegroundColor3`,
				ImageTransparency = `$Color{KebabToPascalResult}ForegroundTransparency`,
				TextColor3 = `$Color{KebabToPascalResult}ForegroundColor3`,
				TextTransparency = `$Color{KebabToPascalResult}ForegroundTransparency`
			},
			attributes = {
				{
					name = `Color{KebabToPascalResult}ForegroundColor3`,
					value = variant.Foreground.Color3
				},
				{
					name = `Color{KebabToPascalResult}ForegroundTransparency`,
					value = variant.Foreground.Transparency
				}
			}
		})
	end
	return List
end

local function DeprecatedColorRules(Colors) --[[ Line: 612 ]]
	-- upvalues: TokenAttributePascalNameModule (copy)
	local List = {}
	
	for Text, value in Colors.System do
		local Segment = Text:sub(8)
		local System = TokenAttributePascalNameModule("System", Text)
		table.insert(List, {
			tag = `bg-{Segment}`,
			properties = {
				BackgroundColor3 = `$ColorSystem{System}Color3`,
				BackgroundTransparency = `$ColorSystem{System}Transparency`
			},
			attributes = {
				{ name = `ColorSystem{System}Color3`, value = value.Color3 },
				{
					name = `ColorSystem{System}Transparency`,
					value = value.Transparency
				}
			},
			deprecatedFor = `bg-{Text}`
		})
		
		if Segment ~= "emphasis" then
			table.insert(List, {
				tag = `content-{Segment}`,
				properties = {
					ImageColor3 = `$ColorSystem{System}Color3`,
					ImageTransparency = `$ColorSystem{System}Transparency`,
					TextColor3 = `$ColorSystem{System}Color3`,
					TextTransparency = `$ColorSystem{System}Transparency`
				},
				attributes = {
					{ name = `ColorSystem{System}Color3`, value = value.Color3 },
					{
						name = `ColorSystem{System}Transparency`,
						value = value.Transparency
					}
				},
				deprecatedFor = `content-{Text}`
			})
			table.insert(List, {
				pseudo = "UIStroke",
				tag = `stroke-{Segment}`,
				properties = {
					Color = `$ColorSystem{System}Color3`,
					Transparency = `$ColorSystem{System}Transparency`
				},
				attributes = {
					{ name = `ColorSystem{System}Color3`, value = value.Color3 },
					{
						name = `ColorSystem{System}Transparency`,
						value = value.Transparency
					}
				},
				deprecatedFor = `stroke-{Text}`
			})
		end
	end
	return List
end

local function EngineDefaultBypassRules() --[[ Line: 691 ]]
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

local function ListLayoutRules() --[[ Line: 708 ]]
	-- upvalues: DashModule (copy)
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
	local list1 = {
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
	local list2 = {
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
	local List = {}
	
	for i, HorizontalFlex in {
		none = Enum.UIFlexAlignment.None,
		fill = Enum.UIFlexAlignment.Fill,
		around = Enum.UIFlexAlignment.SpaceAround,
		between = Enum.UIFlexAlignment.SpaceBetween,
		evenly = Enum.UIFlexAlignment.SpaceEvenly
	} do
		table.insert(List, {
			pseudo = "UIListLayout",
			tag = `flex-{i}`,
			properties = {
				HorizontalFlex = HorizontalFlex,
				VerticalFlex = HorizontalFlex
			}
		})
		table.insert(List, {
			pseudo = "UIListLayout",
			tag = `flex-x-{i}`,
			properties = { HorizontalFlex = HorizontalFlex }
		})
		table.insert(List, {
			pseudo = "UIListLayout",
			tag = `flex-y-{i}`,
			properties = { VerticalFlex = HorizontalFlex }
		})
	end
	local List1 = {}
	
	for i1, ItemLineAlignment in {
		auto = Enum.ItemLineAlignment.Automatic,
		start = Enum.ItemLineAlignment.Start,
		center = Enum.ItemLineAlignment.Center,
		["end"] = Enum.ItemLineAlignment.End,
		stretch = Enum.ItemLineAlignment.Stretch
	} do
		table.insert(List1, {
			pseudo = "UIListLayout",
			tag = `items-{i1}`,
			properties = { ItemLineAlignment = ItemLineAlignment }
		})
	end
	return DashModule.joinArrays(list, list1, list2, List, List1)
end

local function FlexItemRules() --[[ Line: 850 ]]
	-- upvalues: DashModule (copy)
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
	local List = {}
	local List1 = {}
	
	for GrowRatio in {
		1,
		2,
		3,
		4,
		5
	} do
		table.insert(List, {
			pseudo = "UIFlexItem",
			tag = `grow-{GrowRatio}`,
			properties = { FlexMode = Enum.UIFlexMode.Custom, GrowRatio = GrowRatio }
		})
		table.insert(List1, {
			pseudo = "UIFlexItem",
			tag = `shrink-{GrowRatio}`,
			properties = {
				FlexMode = Enum.UIFlexMode.Custom,
				ShrinkRatio = GrowRatio
			}
		})
	end
	local List2 = {}
	
	for i, ItemLineAlignment in {
		auto = Enum.ItemLineAlignment.Automatic,
		start = Enum.ItemLineAlignment.Start,
		center = Enum.ItemLineAlignment.Center,
		["end"] = Enum.ItemLineAlignment.End,
		stretch = Enum.ItemLineAlignment.Stretch
	} do
		table.insert(List2, {
			pseudo = "UIFlexItem",
			tag = `self-{i}`,
			properties = { ItemLineAlignment = ItemLineAlignment }
		})
	end
	return DashModule.joinArrays(list, List, List1, List2)
end

local function TextRules() --[[ Line: 929 ]]
	local List = {}
	
	for i, TextXAlignment in {
		left = Enum.TextXAlignment.Left,
		center = Enum.TextXAlignment.Center,
		right = Enum.TextXAlignment.Right
	} do
		table.insert(List, {
			tag = `text-align-x-{i}`,
			properties = { TextXAlignment = TextXAlignment }
		})
	end
	for i1, TextYAlignment in {
		top = Enum.TextYAlignment.Top,
		center = Enum.TextYAlignment.Center,
		bottom = Enum.TextYAlignment.Bottom
	} do
		table.insert(List, {
			tag = `text-align-y-{i1}`,
			properties = { TextYAlignment = TextYAlignment }
		})
	end
	for i2, TextTruncate in {
		none = Enum.TextTruncate.None,
		["end"] = Enum.TextTruncate.AtEnd,
		split = Enum.TextTruncate.SplitWord
	} do
		table.insert(List, {
			tag = `text-truncate-{i2}`,
			properties = { TextTruncate = TextTruncate }
		})
	end
	table.insert(List, { tag = "text-wrap", properties = { TextWrapped = true } })
	table.insert(List, {
		tag = "text-no-wrap",
		properties = { TextWrapped = false }
	})
	
	return List
end

local function AutomaticSizeRules() --[[ Line: 994 ]]
	local List = {}
	
	for i, AutomaticSize in {
		none = Enum.AutomaticSize.None,
		x = Enum.AutomaticSize.X,
		y = Enum.AutomaticSize.Y,
		xy = Enum.AutomaticSize.XY
	} do
		table.insert(List, {
			tag = `auto-{i}`,
			properties = { AutomaticSize = AutomaticSize }
		})
	end
	return List
end

local function PositionRules() --[[ Line: 1016 ]]
	local List = {}
	local config = { top = 0, center = 0.5, bottom = 1 }
	
	for i, value in { left = 0, center = 0.5, right = 1 } do
		for i1, value1 in config do
			table.insert(List, {
				tag = `position-{i1}-{i}`,
				properties = { Position = UDim2.fromScale(value, value1) }
			})
		end
	end
	return List
end

local function AnchorPointRules() --[[ Line: 1034 ]]
	local List = {}
	local config = { top = 0, center = 0.5, bottom = 1 }
	
	for i, value in { left = 0, center = 0.5, right = 1 } do
		for i1, value1 in config do
			table.insert(List, {
				tag = `anchor-{i1}-{i}`,
				properties = { AnchorPoint = Vector2.new(value, value1) }
			})
		end
	end
	return List
end

local function ClipsDescendantRules() --[[ Line: 1052 ]]
	return {
		{ tag = "clip", properties = { ClipsDescendants = true } },
		{
			tag = "no-clip",
			properties = { ClipsDescendants = false }
		}
	}
end

local _ = function(p2, p3: number): number --[[ Line: 1069 | Named "roundDecimals" ]]
	local v1 = 10 ^ p3
	
	return math.round(p2 * v1) / v1
end

local function AspectRatioRules() --[[ Line: 1074 ]]
	local List = {}
	
	for _, value in {
		{ 1, 1 },
		{ 5, 4 },
		{ 4, 3 },
		{ 3, 2 },
		{ 16, 9 },
		{ 2, 1 }
	} do
		table.insert(List, {
			pseudo = "UIAspectRatioConstraint",
			tag = `aspect-{value[1]}-{value[2]}`,
			properties = {
				AspectRatio = math.round(value[1] / value[2] * 1000) / 1000
			}
		})
		
		if value[1] ~= value[2] then
			table.insert(List, {
				pseudo = "UIAspectRatioConstraint",
				tag = `aspect-{value[2]}-{value[1]}`,
				properties = {
					AspectRatio = math.round(value[2] / value[1] * 1000) / 1000
				}
			})
		end
	end
	return List
end

return {
	rulesGenerator = function(p2, p3, p4) --[[ Line: 1103 ]]
		-- upvalues: DashModule (copy), GuiObjectDefaultRules (copy), EngineDefaultBypassRules (copy), FlexItemRules (copy), TextRules (copy), AutomaticSizeRules (copy), PositionRules (copy), AnchorPointRules (copy), ClipsDescendantRules (copy), AspectRatioRules (copy), ListLayoutRules (copy), ListLayoutSpacingRules (copy), CornerRulesModule (copy), kebabToPascal (copy), ShadowRulesModule (copy), SizeRules (copy), StrokeSizeRules (copy), PaddingRules (copy), DefaultColorRules (copy), DeprecatedColorRules (copy), BackgroundRules (copy), StrokeRules (copy), ContentRules (copy), DefaultFontRules (copy), DefaultSizeRules (copy), TypographyRules (copy)
		local Colors = p3.colors
		local Variants = p3.variants
		local Typography = p3.typography
		
		return DashModule.joinArrays(GuiObjectDefaultRules(), EngineDefaultBypassRules(), FlexItemRules(), TextRules(), AutomaticSizeRules(), PositionRules(), AnchorPointRules(), ClipsDescendantRules(), (AspectRatioRules())), DashModule.joinArrays(ListLayoutRules(), ListLayoutSpacingRules(p3.gaps, p3.gutters), CornerRulesModule(p3.radii, function(p5) --[[ Line: 131 ]]
			-- upvalues: kebabToPascal (upval)
			local v1 = kebabToPascal(p5.name)
			
			return {
				cornerValue = `$Radius{v1}`,
				attributes = { { name = `Radius{v1}`, value = p5.size } }
			}
		end), ShadowRulesModule(p2), SizeRules(p3.sizes), StrokeSizeRules(p3.strokes), (PaddingRules(p3.paddings, p3.margins))), DashModule.joinArrays(DefaultColorRules(p2), DeprecatedColorRules(Colors), BackgroundRules(Colors, Variants), StrokeRules(Colors, Variants), (ContentRules(Colors, Variants))), (DashModule.joinArrays(DefaultFontRules(p2, p4), DefaultSizeRules(Typography["body-large"], p2.Config.Text.NominalScale), (TypographyRules(Typography, p2.Config.Text.NominalScale, p4))))
	end
}