local messageBusService = game:GetService("MessageBusService")
local parent = script:FindFirstAncestor("Components").Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local dashModule = require(parent_1.Dash)
local foundationModule = require(parent_1.Foundation)
local inlineLayoutModule = require(parent_1.InlineLayout)
local markdownCoreModule = require(parent_1.MarkdownCore)
local view = foundationModule.View
local text = foundationModule.Text
local divider = foundationModule.Divider
local utils = parent.Utils
local textElement = inlineLayoutModule.Components.InlineLayoutElements.TextElement
local selectableTextElement = inlineLayoutModule.Components.InlineLayoutElements.SelectableTextElement
local linkElement = inlineLayoutModule.Components.InlineLayoutElements.LinkElement
local imageElement = inlineLayoutModule.Components.InlineLayoutElements.ImageElement
local hardBreakElement = inlineLayoutModule.Components.InlineLayoutElements.HardBreakElement
local mergeContextsModule = require(utils.mergeContexts)
local processSoftBreaksModule = require(utils.processSoftBreaks)
local getCodeTextStyles = require(utils.TextStyle).getCodeTextStyles
local getBaseTextElementEngineTags = require(utils.TextStyle).getBaseTextElementEngineTags
local renderInlineModule = require(script.Parent.Parent.NodeRenderers.renderInline)
local renderTagModule = require(script.Parent.Parent.NodeRenderers.renderTag)
local bulletList = markdownCoreModule.Components.BulletList
local _ = require(parent.Types)
local highlighter = markdownCoreModule.Utils.Highlighter
local getNodeTypeConfigModule = require(parent.Utils.getNodeTypeConfig)
local isInlineElement = inlineLayoutModule.Utils.isInlineElement
local builderSans = Enum.Font.BuilderSans
local uDim2 = UDim2.new(0, 16, 0, 16)
local code = Enum.Font.Code

local var12 = function(p0) --[[ line: 43 ]]
	print(`[Default link callback]: URL [{p0}] is clicked`)
end

local t = { renderers = {} }

local function _(p1, p2) --[[ line: 51 | named "getFontFace" ]]
	return if p1.fontFace then p1.fontFace elseif p1.font then Font.fromEnum(p1.font) else Font.fromEnum(p2)
end

local _ = function(value) --[[ line: 60 | named "shouldUseTopPadding" ]]
	return value.offset ~= 0
end

local function render(p3, p4) --[[ line: 65 ]]
	-- upvalues: t (ref), getNodeTypeConfigModule (ref)
	if not p3 then
		return nil
	end
	local name = t.renderers[p3.name]
	
	if not name then
		warn(`No renderer found for node: {p3.name}`)
		
		return nil
	end
	local var22 = name(p3, p4)
	local var23 = getNodeTypeConfigModule(p3)
	
	if var23 and not var23.validateRenderResult(var22) then
		warn(`Invalid render result for node: {p3.name} {p3.text} of type: {p3.type}`)
	end
	return var22
end

local function processChildren(p5, p6) --[[ line: 85 ]]
	-- upvalues: getNodeTypeConfigModule (ref), render (ref)
	local children = p5.children
	
	if not children then
		return {}
	end
	local var24 = getNodeTypeConfigModule(p5)
	local var25 = if var24 then var24.children else {}
	local t = {}
	
	for i, v in children do
		local type = v.type
		
		if not var25[type] then
			warn(`Invalid child node type. Parent node: {p5.name} {p5.text} of type: {p5.type} has invalid child node: {v.name} {v.text} of type: {type}`)
		end
		local var27 = render(v, p6)
		
		if var27 then
			if #var27 > 0 then
				for i_1, v_1 in var27 do
					table.insert(t, v_1)
				end
			else
				table.insert(t, var27)
			end
		end
	end
	return t
end

local function renderRoot(p7, p8) --[[ line: 117 ]]
	-- upvalues: reactModule (ref), view (ref)
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y col",
		BorderSizePixel = 0,
		backgroundStyle = { Transparency = 1 }
	}, p8.processChildren(p7, p8))
end

local function renderHeading(p9, p10) --[[ line: 128 ]]
	-- upvalues: reactModule (ref), view (ref), renderInlineModule (ref), mergeContextsModule (ref)
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		key = tostring(p9.index),
		LayoutOrder = p9.index
	}, {
		UIPadding = p9.offset ~= 0 and reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 20) }),
		InlineLayout = renderInlineModule(p9, mergeContextsModule(p10, {
			textStyles = p10.headerStyles[math.clamp(if p9.attributes and type(p9.attributes.depth) == "number" then p9.attributes.depth else 1, 1, #p10.headerStyles)]
		}))
	})
end

local function renderParagraph(p11, p12) --[[ line: 147 ]]
	-- upvalues: reactModule (ref), view (ref), renderInlineModule (ref)
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		key = tostring(p11.index),
		LayoutOrder = p11.index
	}, {
		UIPadding = p11.offset ~= 0 and reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 10) }),
		InlineLayout = renderInlineModule(p11, p12)
	})
end

local function computeLineNumbers(p13) --[[ line: 161 ]]
	local p13Count = #p13
	local t = {}
	local var30 = 1
	local var31 = 0
	while var31 <= p13Count do
		local matchIndex = string.find(p13, "\n", var31, true)
		
		if not matchIndex then break end
		t[var30] = tostring(var30)
		var30 += 1
		var31 = matchIndex + 1
	end
	t[var30] = tostring(var30)
	
	return table.concat(t, "\n")
end

local _ = function(p14) --[[ line: 180 | named "copyToClipboard" ]]
	-- upvalues: messageBusService (ref)
	pcall(function() --[[ line: 181 ]]
		-- upvalues: messageBusService (copy), p14 (ref)
		return messageBusService:Publish(messageBusService:GetMessageId("ExternalContentSharing", "setClipboardText"), { text = p14 })
	end)
end

local var20 = dashModule.memoize(function(p15) --[[ line: 189 ]]
	-- upvalues: messageBusService (ref)
	return function() --[[ line: 190 ]]
		-- upvalues: p15 (ref), messageBusService (copy)
		pcall(function() --[[ line: 181 ]]
			-- upvalues: messageBusService (copy), p15 (ref)
			return messageBusService:Publish(messageBusService:GetMessageId("ExternalContentSharing", "setClipboardText"), { text = p15 })
		end)
	end
end)

local function renderHardBreak() --[[ line: 453 ]]
	-- upvalues: hardBreakElement (ref)
	return hardBreakElement
end

t.defaultRenderers = {
	ROOT = renderRoot,
	HEADING = renderHeading,
	PARAGRAPH = renderParagraph,
	CODE_BLOCK = function(p16, p17) --[[ line: 195 ]]
		-- upvalues: highlighter (ref), getCodeTextStyles (ref), code (ref), computeLineNumbers (ref), reactModule (ref), view (ref), foundationModule (ref), var20 (ref), text (ref), dashModule (ref)
		local text_1 = p16.text
		local var33 = if (if p16.attributes then p16.attributes.language else nil) == "lua" then highlighter.highlight(text_1, p17.colorScheme) else text_1
		local _ = nil
		local var34 = getCodeTextStyles(p17)
		local t = {
			TextWrapped = false,
			tag = "auto-xy padding-small align-y-top",
			fontStyle = {
				FontSize = var34.textSize,
				Font = if var34.fontFace then var34.fontFace elseif var34.font then Font.fromEnum(var34.font) else Font.fromEnum(code),
				LineHeight = var34.lineHeight
			},
			TextXAlignment = Enum.TextXAlignment.Left
		}
		local t_1 = {
			RichText = true,
			ZIndex = 1,
			Text = var33,
			textStyle = { Color3 = highlighter.getTokenColor("iden") }
		}
		local t_2 = {
			ZIndex = 0,
			TextSelectable = true,
			Text = text_1,
			textStyle = {
				Transparency = 0.4,
				Color3 = highlighter.getTokenColor("iden")
			}
		}
		local codeBackgroundStyles = p17.codeBackgroundStyles or {}
		local backgroundColor3 = codeBackgroundStyles.backgroundColor3 or highlighter.getTokenColor("background")
		local backgroundTransparency = codeBackgroundStyles.backgroundTransparency or 0
		local var41 = nil
		local showLineNumbers = p17.codeSettings and p17.codeSettings.showLineNumbers
		
		if showLineNumbers then
			var41 = computeLineNumbers(text_1)
		end
		return reactModule.createElement(view, {
			tag = "size-full-0 auto-y col",
			BorderSizePixel = 0,
			key = tostring(p16.index),
			LayoutOrder = p16.index,
			backgroundStyle = { Transparency = 1 }
		}, {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingTop = if p16.offset ~= 0 then UDim.new(0, 10) else nil,
				PaddingBottom = UDim.new(0, 10)
			}),
			TitleBar = if p17.codeSettings and p17.codeSettings.showCopyButton then reactModule.createElement(foundationModule.View, {
				tag = "size-full-0 auto-y row align-x-right bg-shift-300 radius-small",
				LayoutOrder = 1
			}, {
				CopyToClipboardButton = reactModule.createElement(foundationModule.IconButton, {
					size = foundationModule.Enums.InputSize.Small,
					icon = { name = foundationModule.Enums.IconName.TwoStackedSquares },
					onActivated = var20(text_1)
				})
			}) else nil,
			CodeWrapper = reactModule.createElement(foundationModule.View, {
				LayoutOrder = 2,
				tag = {
					["size-full-0 auto-y"] = true,
					["row align-y-center"] = showLineNumbers
				}
			}, {
				LineNumbers = if showLineNumbers then reactModule.createElement(foundationModule.Text, {
					LayoutOrder = 1,
					tag = "size-0-0 auto-xy text-align-x-right text-align-y-center padding-small bg-shift-100 content-emphasis",
					Text = var41,
					fontStyle = t.fontStyle
				}) else nil,
				ScrollFrameWrapper = reactModule.createElement(foundationModule.View, {
					tag = "size-full-0 auto-y fill",
					LayoutOrder = 2,
					Size = UDim2.fromScale(1, 0)
				}, {
					ScrollFrame = reactModule.createElement("ScrollingFrame", {
						BorderSizePixel = 0,
						BackgroundColor3 = backgroundColor3,
						BackgroundTransparency = backgroundTransparency,
						ScrollingDirection = Enum.ScrollingDirection.X,
						Size = UDim2.fromScale(1, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						AutomaticCanvasSize = Enum.AutomaticSize.X
					}, {
						HighlightedCode = reactModule.createElement(text, dashModule.join(t, t_1)),
						SelectableCodeWrapper = reactModule.createElement(foundationModule.View, { tag = t.tag }, {
							SelectableCode = reactModule.createElement("TextBox", {
								BackgroundTransparency = 1,
								TextEditable = false,
								TextWrapped = false,
								ClearTextOnFocus = false,
								Text = t_2.Text,
								FontFace = t.fontStyle.Font,
								TextSize = t.fontStyle.FontSize,
								TextColor3 = t_2.textStyle.Color3,
								TextTransparency = t_2.textStyle.Transparency,
								TextXAlignment = Enum.TextXAlignment.Left,
								TextYAlignment = Enum.TextYAlignment.Center,
								ZIndex = t_2.ZIndex,
								Size = UDim2.fromScale(0, 0),
								AutomaticSize = Enum.AutomaticSize.XY,
								LineHeight = p17.codeStyles.lineHeight
							})
						})
					})
				})
			})
		})
	end,
	STYLED_TEXT = function(p18, p19) --[[ line: 413 ]]
		-- upvalues: dashModule (ref), mergeContextsModule (ref)
		local var43 = if p18.attributes and p18.attributes.style then p18.attributes.style else nil
		local t = {}
		
		if var43 == "BOLD" or var43 == "BOLD_2" then
			t.bold = true
		elseif var43 == "ITALIC" or var43 == "ITALIC_2" then
			t.italic = true
		elseif var43 == "STRIKE" then
			t.strike = true
		elseif var43 == "INLINE_CODE" then
			t = dashModule.joinDeep(p19.codeStyles, { selectable = true })
		end
		return p19.processChildren(p18, mergeContextsModule(p19, { textStyles = t }))
	end,
	TEXT = function(p20, p21) --[[ line: 429 ]]
		-- upvalues: processSoftBreaksModule (ref), getBaseTextElementEngineTags (ref), builderSans (ref), selectableTextElement (ref), textElement (ref)
		local t = {
			LayoutOrder = p20.index,
			Text = processSoftBreaksModule(p20.text),
			EngineTags = getBaseTextElementEngineTags(p21.textStyles)
		}
		local t_1 = {}
		local textStyles = p21.textStyles
		t_1.Font = if textStyles.fontFace then textStyles.fontFace elseif textStyles.font then Font.fromEnum(textStyles.font) else Font.fromEnum(builderSans)
		t_1.FontSize = p21.textStyles.textSize
		t.fontStyle = t_1
		t.textStyle = {
			Color3 = if typeof(p21.textStyles.color) == "string" then Color3.fromHex(p21.textStyles.color) else p21.textStyles.color,
			Transparency = p21.textStyles.transparency
		}
		t.viewTags = p21.textStyles.viewTags
		
		return if p21.textStyles.selectable then selectableTextElement.new(t) else textElement.new(t)
	end,
	LINK = function(p22, p23) --[[ line: 457 ]]
		-- upvalues: mergeContextsModule (ref), dashModule (ref), isInlineElement (ref), hardBreakElement (ref), linkElement (ref)
		local var47 = if p22.attributes then p22.attributes.url else p22.url or ""
		
		return linkElement.new(dashModule.filter(p23.processChildren(p22, mergeContextsModule(p23, { textStyles = { color = p23.linkStyles.linkColor } })), function(p24) --[[ line: 467 ]]
			-- upvalues: isInlineElement (copy), hardBreakElement (copy)
			return isInlineElement(p24) and p24 ~= hardBreakElement
		end), {
			onActivated = function() --[[ line: 471 ]]
				-- upvalues: p23 (ref), var47 (ref)
				p23.linkCallback(var47)
			end
		})
	end,
	LIST = function(p25, p26) --[[ line: 336 ]]
		-- upvalues: reactModule (ref), view (ref), render (ref), dashModule (ref), bulletList (ref), builderSans (ref)
		local var50
		local t = {}
		local var49 = nil
		
		for i = #p25.children, 1, -1 do
			var50 = p25.children[i]
			
			if var50.name == "LIST" then
				var49 = var50
				continue
			end
			if var49 then
				table.insert(t, 1, {
					Prefix = if var50.attributes then var50.attributes.prefix else nil,
					Item = reactModule.createElement(view, {
						tag = "size-full-0 auto-y col",
						BorderSizePixel = 0,
						backgroundStyle = { Transparency = 1 }
					}, {
						Item = render(dashModule.join(var50, { index = 1 }), p26),
						List = render(dashModule.join(var49, { index = 2 }), p26)
					})
				})
				var49 = nil
			else
				table.insert(t, 1, {
					Prefix = if var50.attributes then var50.attributes.prefix else nil,
					Item = render(var50, p26)
				})
			end
		end
		local createElement = reactModule.createElement
		local t_1 = {
			TextWrapped = true,
			tag = "size-full-0 auto-y",
			key = tostring(p25.index),
			LayoutOrder = p25.index,
			Items = t
		}
		var50 = {}
		local textStyles = p26.textStyles
		var50.Font = if textStyles.fontFace then textStyles.fontFace elseif textStyles.font then Font.fromEnum(textStyles.font) else Font.fromEnum(builderSans)
		var50.TextColor = if typeof(p26.textStyles.color) == "string" then Color3.fromHex(p26.textStyles.color) else p26.textStyles.color
		var50.TextSize = p26.textStyles.textSize
		var50.LineHeight = p26.textStyles.textSize
		t_1.ListStyle = var50
		
		return createElement(bulletList, t_1, {
			UIPadding = p25.offset ~= 0 and reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 10) })
		})
	end,
	LIST_ITEM = function(p27, p28) --[[ line: 403 ]]
		-- upvalues: reactModule (ref), view (ref), renderInlineModule (ref)
		return reactModule.createElement(view, {
			tag = "size-full-0 auto-y",
			key = tostring(p27.index),
			LayoutOrder = p27.index
		}, { InlineLayout = renderInlineModule(p27, p28) })
	end,
	DIVIDER = function(p29) --[[ line: 477 ]]
		-- upvalues: reactModule (ref), view (ref), divider (ref)
		return reactModule.createElement(view, {
			tag = "size-full-0 auto-y",
			key = tostring(p29.index),
			LayoutOrder = p29.index
		}, {
			UIPadding = p29.offset ~= 0 and reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 10) }),
			Divider = reactModule.createElement(divider)
		})
	end,
	QUOTE = function(p30, p31) --[[ line: 492 ]]
		-- upvalues: reactModule (ref), view (ref), renderInlineModule (ref), mergeContextsModule (ref)
		return reactModule.createElement(view, {
			tag = "size-full-0 auto-y padding-small",
			key = tostring(p30.index),
			LayoutOrder = p30.index,
			backgroundStyle = { Transparency = 1 }
		}, {
			InlineLayoutWrapper = reactModule.createElement(view, {
				tag = "size-full-0 auto-y",
				backgroundStyle = {
					Transparency = 0.9,
					Color3 = Color3.fromRGB(163, 162, 165)
				}
			}, {
				InlineLayout = renderInlineModule(p30, mergeContextsModule(p31, { textStyles = { italic = true, transparency = 0.5 } }))
			})
		})
	end,
	IMAGE = function(p32, p33) --[[ line: 516 ]]
		-- upvalues: imageElement (ref)
		return imageElement.new({
			LayoutOrder = p32.index,
			Image = if p32.attributes then p32.attributes.url else p32.url or nil,
			Size = p33.imageStyles.size,
			backgroundStyle = {
				Transparency = p33.imageStyles.backgroundTransparency,
				Color3 = p33.imageStyles.backgroundColor3
			},
			imageStyle = { Transparency = p33.imageStyles.transparency },
			ScaleType = p33.imageStyles.scaleType,
			ResampleMode = p33.imageStyles.resampleMode,
			tag = p33.imageStyles.tags
		})
	end,
	TAG = renderTagModule,
	BREAK = renderHardBreak,
	LINE_BREAK = renderHardBreak
}

function t.render(p34, p35) --[[ line: 561 ]]
	-- upvalues: t (ref), dashModule (ref), builderSans (ref), code (ref), uDim2 (ref), var12 (ref), processChildren (ref), render (ref)
	t.renderers = p35.userRenderers
	local var52 = dashModule.joinDeep({
		isInline = false,
		textStyles = { textSize = 18, font = builderSans },
		codeStyles = { textSize = 18, lineHeight = 1.111, font = code },
		headerStyles = {
			[1] = { textSize = 54, font = builderSans },
			[2] = { textSize = 45, font = builderSans },
			[3] = { textSize = 36, font = builderSans },
			[4] = { textSize = 27, font = builderSans }
		},
		imageStyles = { size = uDim2 },
		linkStyles = {
			linkColor = `#{p35.tokens.Color.Content.Link.Color3:ToHex()}`
		},
		linkCallback = p35.linkCallback or var12,
		colorScheme = p35.colorScheme,
		processChildren = processChildren
	}, table.clone(p35.markdownRendererProps or {}))
	table.freeze(var52)
	
	return render(p34, var52)
end

return t