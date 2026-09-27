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
local textStyleModule = require(utils.TextStyle)
local renderInlineModule = require(script.Parent.Parent.NodeRenderers.renderInline)
local renderTagModule = require(script.Parent.Parent.NodeRenderers.renderTag)
local bulletList = markdownCoreModule.Components.BulletList
local getBaseTextElementEngineTags = textStyleModule.getBaseTextElementEngineTags
local getCodeTextStyles = textStyleModule.getCodeTextStyles
local normalizeStyleFont = textStyleModule.normalizeStyleFont
local _ = require(parent.Types)
local highlighter = markdownCoreModule.Utils.Highlighter
local getNodeTypeConfigModule = require(parent.Utils.getNodeTypeConfig)
local isInlineElement = inlineLayoutModule.Utils.isInlineElement
local flags = markdownCoreModule.Flags
local flags_1 = foundationModule.Utility.Flags
local builderSans = Enum.Font.BuilderSans
local uDim2 = UDim2.fromOffset(16, 16)
local code = Enum.Font.Code
local font = Font.new("rbxasset://fonts/families/BuilderMono.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)

local var1 = function(p1)
	print(`[Default link callback]: URL [{p1}] is clicked`)
end

local t = { renderers = {} }

local function _(p1, p2)
	local fontFace = p1.fontFace or p1.font
	
	return if typeof(fontFace) == "Font" then fontFace elseif fontFace then Font.fromEnum(fontFace) else Font.fromEnum(p2)
end

local _ = function(value)
	return value.offset ~= 0
end

local function render(p1, p2)
	-- upvalues: t (ref), getNodeTypeConfigModule (ref)
	if not p1 then
		return nil
	end
	local name = t.renderers[p1.name]
	
	if not name then
		warn(`No renderer found for node: {p1.name}`)
		
		return nil
	end
	local var2 = name(p1, p2)
	local var3 = getNodeTypeConfigModule(p1)
	
	if var3 and not var3.validateRenderResult(var2) then
		warn(`Invalid render result for node: {p1.name} {p1.text} of type: {p1.type}`)
	end
	return var2
end

local function processChildren(p3, p4)
	-- upvalues: getNodeTypeConfigModule (ref), render (ref)
	local children = p3.children
	
	if not children then
		return {}
	end
	local var4 = getNodeTypeConfigModule(p3)
	local var5 = if var4 then var4.children else {}
	local t = {}
	
	for i, v in children do
		local type = v.type
		
		if not var5[type] then
			warn(`Invalid child node type. Parent node: {p3.name} {p3.text} of type: {p3.type} has invalid child node: {v.name} {v.text} of type: {type}`)
		end
		local var6 = render(v, p4)
		
		if var6 then
			if #var6 > 0 then
				for i_1, v_1 in var6 do
					table.insert(t, v_1)
				end
			else
				table.insert(t, var6)
			end
		end
	end
	return t
end

local function renderRoot(p5, p6)
	-- upvalues: reactModule (ref), view (ref)
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y col",
		BorderSizePixel = 0,
		backgroundStyle = { Transparency = 1 }
	}, p6.processChildren(p5, p6))
end

local function renderHeading(p5, p6)
	-- upvalues: reactModule (ref), view (ref), renderInlineModule (ref), mergeContextsModule (ref)
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		key = tostring(p5.index),
		LayoutOrder = p5.index
	}, {
		UIPadding = p5.offset ~= 0 and reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 20) }),
		InlineLayout = renderInlineModule(p5, mergeContextsModule(p6, {
			textStyles = p6.headerStyles[math.clamp(if p5.attributes and type(p5.attributes.depth) == "number" then p5.attributes.depth else 1, 1, #p6.headerStyles)]
		}))
	})
end

local function renderParagraph(p5, p6)
	-- upvalues: reactModule (ref), view (ref), renderInlineModule (ref)
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		key = tostring(p5.index),
		LayoutOrder = p5.index
	}, {
		UIPadding = p5.offset ~= 0 and reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 10) }),
		InlineLayout = renderInlineModule(p5, p6)
	})
end

local function computeLineNumbers(p5)
	local p13Count = #p5
	local t = {}
	local var7 = 1
	local var8 = 0
	while var8 <= p13Count do
		local matchIndex = string.find(p5, "\n", var8, true)
		
		if not matchIndex then break end
		t[var7] = tostring(var7)
		var7 += 1
		var8 = matchIndex + 1
	end
	t[var7] = tostring(var7)
	
	return table.concat(t, "\n")
end

local _ = function(p6)
	-- upvalues: messageBusService (ref)
	pcall(function()
		-- upvalues: messageBusService (copy), p6 (ref)
		return messageBusService:Publish(messageBusService:GetMessageId("ExternalContentSharing", "setClipboardText"), { text = p6 })
	end)
end

local var9 = dashModule.memoize(function(p6)
	-- upvalues: messageBusService (ref)
	return function()
		-- upvalues: p6 (ref), messageBusService (copy)
		pcall(function()
			-- upvalues: messageBusService (copy), p6 (ref)
			return messageBusService:Publish(messageBusService:GetMessageId("ExternalContentSharing", "setClipboardText"), { text = p6 })
		end)
	end
end)

local function renderHardBreak()
	-- upvalues: hardBreakElement (ref)
	return hardBreakElement
end

t.defaultRenderers = {
	ROOT = renderRoot,
	HEADING = renderHeading,
	PARAGRAPH = renderParagraph,
	CODE_BLOCK = function(p6, p7)
		-- upvalues: highlighter (ref), getCodeTextStyles (ref), flags (ref), font (ref), code (ref), computeLineNumbers (ref), reactModule (ref), view (ref), foundationModule (ref), var9 (ref), text (ref), dashModule (ref)
		local var10
		local text_1 = p6.text
		local var11 = if (if p6.attributes then p6.attributes.language else nil) == "lua" then highlighter.highlight(text_1, p7.colorScheme) else text_1
		local _ = nil
		local var12 = getCodeTextStyles(p7)
		local t = {
			TextWrapped = false,
			tag = "auto-xy padding-small align-y-top"
		}
		local t_1 = { FontSize = var12.textSize }
		
		if flags.FFlagMarkdownAssistantParity then
			var10 = var12.fontFace or font
		else
			local fontFace = var12.fontFace or var12.font
			var10 = if typeof(fontFace) == "Font" then fontFace elseif fontFace then Font.fromEnum(fontFace) else Font.fromEnum(code)
		end
		t_1.Font = var10
		t_1.LineHeight = var12.lineHeight
		t.fontStyle = t_1
		t.TextXAlignment = Enum.TextXAlignment.Left
		local t_2 = {
			RichText = true,
			ZIndex = 1,
			Text = var11,
			textStyle = { Color3 = highlighter.getTokenColor("iden") }
		}
		local t_3 = {
			ZIndex = 0,
			TextSelectable = true,
			Text = text_1,
			textStyle = {
				Transparency = 0.4,
				Color3 = highlighter.getTokenColor("iden")
			}
		}
		local codeBackgroundStyles = p7.codeBackgroundStyles or {}
		local backgroundColor3 = codeBackgroundStyles.backgroundColor3 or highlighter.getTokenColor("background")
		local backgroundTransparency = codeBackgroundStyles.backgroundTransparency or 0
		local var13 = nil
		local showLineNumbers = p7.codeSettings and p7.codeSettings.showLineNumbers
		
		if showLineNumbers then
			var13 = computeLineNumbers(text_1)
		end
		return reactModule.createElement(view, {
			tag = "size-full-0 auto-y col",
			BorderSizePixel = 0,
			key = tostring(p6.index),
			LayoutOrder = p6.index,
			backgroundStyle = { Transparency = 1 }
		}, {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingTop = if p6.offset ~= 0 then UDim.new(0, 10) else nil,
				PaddingBottom = UDim.new(0, 10)
			}),
			TitleBar = if p7.codeSettings and p7.codeSettings.showCopyButton then reactModule.createElement(foundationModule.View, {
				tag = "size-full-0 auto-y row align-x-right bg-shift-300 radius-small",
				LayoutOrder = 1
			}, {
				CopyToClipboardButton = reactModule.createElement(foundationModule.IconButton, {
					size = foundationModule.Enums.InputSize.Small,
					icon = { name = foundationModule.Enums.IconName.TwoStackedSquares },
					onActivated = var9(text_1)
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
					Text = var13,
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
						HighlightedCode = reactModule.createElement(text, dashModule.join(t, t_2)),
						SelectableCodeWrapper = reactModule.createElement(foundationModule.View, { tag = t.tag }, {
							SelectableCode = reactModule.createElement("TextBox", {
								BackgroundTransparency = 1,
								TextEditable = false,
								TextWrapped = false,
								ClearTextOnFocus = false,
								Text = t_3.Text,
								FontFace = t.fontStyle.Font,
								TextSize = t.fontStyle.FontSize,
								TextColor3 = t_3.textStyle.Color3,
								TextTransparency = t_3.textStyle.Transparency,
								TextXAlignment = Enum.TextXAlignment.Left,
								TextYAlignment = Enum.TextYAlignment.Center,
								ZIndex = t_3.ZIndex,
								Size = UDim2.fromScale(0, 0),
								AutomaticSize = Enum.AutomaticSize.XY,
								LineHeight = p7.codeStyles.lineHeight
							})
						})
					})
				})
			})
		})
	end,
	STYLED_TEXT = function(p6, p7)
		-- upvalues: dashModule (ref), mergeContextsModule (ref)
		local var10 = if p6.attributes and p6.attributes.style then p6.attributes.style else nil
		local t = {}
		
		if var10 == "BOLD" or var10 == "BOLD_2" then
			t.bold = true
		elseif var10 == "ITALIC" or var10 == "ITALIC_2" then
			t.italic = true
		elseif var10 == "STRIKE" then
			t.strike = true
		elseif var10 == "INLINE_CODE" then
			t = dashModule.joinDeep(p7.codeStyles, { selectable = true })
		end
		return p7.processChildren(p6, mergeContextsModule(p7, { textStyles = t }))
	end,
	TEXT = function(p6, p7)
		-- upvalues: processSoftBreaksModule (ref), getBaseTextElementEngineTags (ref), flags (ref), builderSans (ref), selectableTextElement (ref), textElement (ref)
		local fontFace
		local t = {
			LayoutOrder = p6.index,
			Text = processSoftBreaksModule(p6.text),
			EngineTags = getBaseTextElementEngineTags(p7.textStyles)
		}
		local t_1 = {}
		
		if flags.FFlagMarkdownAssistantParity then
			fontFace = p7.textStyles.fontFace
		else
			local textStyles = p7.textStyles
			local fontFace_1 = textStyles.fontFace or textStyles.font
			fontFace = if typeof(fontFace_1) == "Font" then fontFace_1 elseif fontFace_1 then Font.fromEnum(fontFace_1) else Font.fromEnum(builderSans)
		end
		t_1.Font = fontFace
		t_1.FontSize = p7.textStyles.textSize
		t.fontStyle = t_1
		t.textStyle = {
			Color3 = if typeof(p7.textStyles.color) == "string" then Color3.fromHex(p7.textStyles.color) else p7.textStyles.color,
			Transparency = p7.textStyles.transparency
		}
		t.viewTags = p7.textStyles.viewTags
		
		return if p7.textStyles.selectable then selectableTextElement.new(t) else textElement.new(t)
	end,
	LINK = function(p6, p7)
		-- upvalues: mergeContextsModule (ref), dashModule (ref), isInlineElement (ref), hardBreakElement (ref), linkElement (ref)
		local var10 = if p6.attributes then p6.attributes.url else p6.url or ""
		
		return linkElement.new(dashModule.filter(p7.processChildren(p6, mergeContextsModule(p7, { textStyles = { color = p7.linkStyles.linkColor } })), function(p8)
			-- upvalues: isInlineElement (copy), hardBreakElement (copy)
			return isInlineElement(p8) and p8 ~= hardBreakElement
		end), {
			onActivated = function()
				-- upvalues: p7 (ref), var10 (ref)
				p7.linkCallback(var10)
			end
		})
	end,
	LIST = function(p6, p7)
		-- upvalues: reactModule (ref), view (ref), render (ref), dashModule (ref), bulletList (ref), flags (ref), builderSans (ref)
		local var10
		local t = {}
		local var11 = nil
		
		for i = #p6.children, 1, -1 do
			var10 = p6.children[i]
			
			if var10.name == "LIST" then
				var11 = var10
				continue
			end
			if var11 then
				table.insert(t, 1, {
					Prefix = if var10.attributes then var10.attributes.prefix else nil,
					Item = reactModule.createElement(view, {
						tag = "size-full-0 auto-y col",
						BorderSizePixel = 0,
						backgroundStyle = { Transparency = 1 }
					}, {
						Item = render(dashModule.join(var10, { index = 1 }), p7),
						List = render(dashModule.join(var11, { index = 2 }), p7)
					})
				})
				var11 = nil
			else
				table.insert(t, 1, {
					Prefix = if var10.attributes then var10.attributes.prefix else nil,
					Item = render(var10, p7)
				})
			end
		end
		local fontFace
		local createElement = reactModule.createElement
		local t_1 = {
			TextWrapped = true,
			tag = "size-full-0 auto-y",
			key = tostring(p6.index),
			LayoutOrder = p6.index,
			Items = t
		}
		var10 = {}
		
		if flags.FFlagMarkdownAssistantParity then
			fontFace = p7.textStyles.fontFace
		else
			local textStyles = p7.textStyles
			local fontFace_1 = textStyles.fontFace or textStyles.font
			fontFace = if typeof(fontFace_1) == "Font" then fontFace_1 elseif fontFace_1 then Font.fromEnum(fontFace_1) else Font.fromEnum(builderSans)
		end
		var10.Font = fontFace
		var10.TextColor = if typeof(p7.textStyles.color) == "string" then Color3.fromHex(p7.textStyles.color) else p7.textStyles.color
		var10.TextSize = p7.textStyles.textSize
		var10.LineHeight = p7.textStyles.textSize
		t_1.ListStyle = var10
		
		return createElement(bulletList, t_1, {
			UIPadding = p6.offset ~= 0 and reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 10) })
		})
	end,
	LIST_ITEM = function(p8, p9)
		-- upvalues: reactModule (ref), view (ref), renderInlineModule (ref)
		return reactModule.createElement(view, {
			tag = "size-full-0 auto-y",
			key = tostring(p8.index),
			LayoutOrder = p8.index
		}, { InlineLayout = renderInlineModule(p8, p9) })
	end,
	DIVIDER = function(p8)
		-- upvalues: reactModule (ref), view (ref), divider (ref)
		return reactModule.createElement(view, {
			tag = "size-full-0 auto-y",
			key = tostring(p8.index),
			LayoutOrder = p8.index
		}, {
			UIPadding = p8.offset ~= 0 and reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 10) }),
			Divider = reactModule.createElement(divider)
		})
	end,
	QUOTE = function(p8, p9)
		-- upvalues: reactModule (ref), view (ref), renderInlineModule (ref), mergeContextsModule (ref)
		return reactModule.createElement(view, {
			tag = "size-full-0 auto-y padding-small",
			key = tostring(p8.index),
			LayoutOrder = p8.index,
			backgroundStyle = { Transparency = 1 }
		}, {
			InlineLayoutWrapper = reactModule.createElement(view, {
				tag = "size-full-0 auto-y",
				backgroundStyle = {
					Transparency = 0.9,
					Color3 = Color3.fromRGB(163, 162, 165)
				}
			}, {
				InlineLayout = renderInlineModule(p8, mergeContextsModule(p9, { textStyles = { italic = true, transparency = 0.5 } }))
			})
		})
	end,
	IMAGE = function(p8, p9)
		-- upvalues: imageElement (ref)
		return imageElement.new({
			LayoutOrder = p8.index,
			Image = if p8.attributes then p8.attributes.url else p8.url or nil,
			Size = p9.imageStyles.size,
			backgroundStyle = {
				Transparency = p9.imageStyles.backgroundTransparency,
				Color3 = p9.imageStyles.backgroundColor3
			},
			imageStyle = { Transparency = p9.imageStyles.transparency },
			ScaleType = p9.imageStyles.scaleType,
			ResampleMode = p9.imageStyles.resampleMode,
			tag = p9.imageStyles.tags
		})
	end,
	TAG = renderTagModule,
	BREAK = renderHardBreak,
	LINE_BREAK = renderHardBreak
}

function t.render(p8, p9)
	-- upvalues: t (ref), flags (ref), normalizeStyleFont (ref), dashModule (ref), flags_1 (ref), font (ref), builderSans (ref), code (ref), uDim2 (ref), var1 (ref), processChildren (ref), render (ref)
	local t_1
	t.renderers = p9.userRenderers
	local cloned = table.clone(p9.markdownRendererProps or {})
	local _ = nil
	
	if flags.FFlagMarkdownAssistantParity then
		cloned.textStyles = normalizeStyleFont(cloned.textStyles)
		cloned.codeStyles = normalizeStyleFont(cloned.codeStyles)
		
		if cloned.headerStyles then
			cloned.headerStyles = dashModule.map(cloned.headerStyles, normalizeStyleFont)
		end
		local bodyMedium = p9.tokens.Typography.BodyMedium
		local var12 = if flags_1.FoundationFontFaceMigration then normalizeStyleFont({ font = bodyMedium.Font }).fontFace else Font.fromEnum(bodyMedium.Font)
		local fontSize = bodyMedium.FontSize
		t_1 = {
			textStyles = { textSize = fontSize, fontFace = var12 },
			codeStyles = { lineHeight = 1.111, textSize = fontSize, fontFace = font },
			headerStyles = {
				[1] = { textSize = fontSize * 3, fontFace = var12 },
				[2] = { textSize = fontSize * 2.5, fontFace = var12 },
				[3] = { textSize = fontSize * 2, fontFace = var12 },
				[4] = { textSize = fontSize * 1.5, fontFace = var12 },
				[5] = { textSize = fontSize * 1.5, fontFace = var12 },
				[6] = { textSize = fontSize * 1.5, fontFace = var12 }
			}
		}
	else
		t_1 = {
			textStyles = { textSize = 18, font = builderSans },
			codeStyles = { textSize = 18, lineHeight = 1.111, font = code },
			headerStyles = {
				[1] = { textSize = 54, font = builderSans },
				[2] = { textSize = 45, font = builderSans },
				[3] = { textSize = 36, font = builderSans },
				[4] = { textSize = 27, font = builderSans }
			}
		}
	end
	local var13 = dashModule.joinDeep({
		isInline = false,
		textStyles = t_1.textStyles,
		codeStyles = t_1.codeStyles,
		headerStyles = t_1.headerStyles,
		imageStyles = { size = uDim2 },
		linkStyles = {
			linkColor = `#{p9.tokens.Color.Content.Link.Color3:ToHex()}`
		},
		linkCallback = p9.linkCallback or var1,
		colorScheme = p9.colorScheme,
		processChildren = processChildren
	}, cloned)
	table.freeze(var13)
	
	return render(p8, var13)
end

return t