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

local var1 = function(p1)
	print(`[Default link callback]: URL [{p1}] is clicked`)
end

local t = { renderers = {} }

local function _(p1, p2)
	return if p1.fontFace then p1.fontFace elseif p1.font then Font.fromEnum(p1.font) else Font.fromEnum(p2)
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
	local var1 = name(p1, p2)
	local var2 = getNodeTypeConfigModule(p1)
	
	if var2 and not var2.validateRenderResult(var1) then
		warn(`Invalid render result for node: {p1.name} {p1.text} of type: {p1.type}`)
	end
	return var1
end

local function processChildren(p1, p2)
	-- upvalues: getNodeTypeConfigModule (ref), render (ref)
	local children = p1.children
	
	if not children then
		return {}
	end
	local var1 = getNodeTypeConfigModule(p1)
	local var2 = if var1 then var1.children else {}
	local t = {}
	
	for i, v in children do
		local type = v.type
		
		if not var2[type] then
			warn(`Invalid child node type. Parent node: {p1.name} {p1.text} of type: {p1.type} has invalid child node: {v.name} {v.text} of type: {type}`)
		end
		local var3 = render(v, p2)
		
		if var3 then
			if #var3 > 0 then
				for i_1, v_1 in var3 do
					table.insert(t, v_1)
				end
			else
				table.insert(t, var3)
			end
		end
	end
	return t
end

local function renderRoot(p1, p2)
	-- upvalues: reactModule (ref), view (ref)
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y col",
		BorderSizePixel = 0,
		backgroundStyle = { Transparency = 1 }
	}, p2.processChildren(p1, p2))
end

local function renderHeading(p1, p2)
	-- upvalues: reactModule (ref), view (ref), renderInlineModule (ref), mergeContextsModule (ref)
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		key = tostring(p1.index),
		LayoutOrder = p1.index
	}, {
		UIPadding = p1.offset ~= 0 and reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 20) }),
		InlineLayout = renderInlineModule(p1, mergeContextsModule(p2, {
			textStyles = p2.headerStyles[math.clamp(if p1.attributes and type(p1.attributes.depth) == "number" then p1.attributes.depth else 1, 1, #p2.headerStyles)]
		}))
	})
end

local function renderParagraph(p1, p2)
	-- upvalues: reactModule (ref), view (ref), renderInlineModule (ref)
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		key = tostring(p1.index),
		LayoutOrder = p1.index
	}, {
		UIPadding = p1.offset ~= 0 and reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 10) }),
		InlineLayout = renderInlineModule(p1, p2)
	})
end

local function computeLineNumbers(p1)
	local p13Count = #p1
	local t = {}
	local var1 = 1
	local var2 = 0
	while var2 <= p13Count do
		local matchIndex = string.find(p1, "\n", var2, true)
		
		if not matchIndex then break end
		t[var1] = tostring(var1)
		var1 += 1
		var2 = matchIndex + 1
	end
	t[var1] = tostring(var1)
	
	return table.concat(t, "\n")
end

local _ = function(p1)
	-- upvalues: messageBusService (ref)
	pcall(function()
		-- upvalues: messageBusService (copy), p1 (ref)
		return messageBusService:Publish(messageBusService:GetMessageId("ExternalContentSharing", "setClipboardText"), { text = p1 })
	end)
end

local var3 = dashModule.memoize(function(p1)
	-- upvalues: messageBusService (ref)
	return function()
		-- upvalues: p1 (ref), messageBusService (copy)
		pcall(function()
			-- upvalues: messageBusService (copy), p1 (ref)
			return messageBusService:Publish(messageBusService:GetMessageId("ExternalContentSharing", "setClipboardText"), { text = p1 })
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
	CODE_BLOCK = function(p1, p2)
		-- upvalues: highlighter (ref), getCodeTextStyles (ref), code (ref), computeLineNumbers (ref), reactModule (ref), view (ref), foundationModule (ref), var3 (ref), text (ref), dashModule (ref)
		local text_1 = p1.text
		local var1 = if (if p1.attributes then p1.attributes.language else nil) == "lua" then highlighter.highlight(text_1, p2.colorScheme) else text_1
		local _ = nil
		local var2 = getCodeTextStyles(p2)
		local t = {
			TextWrapped = false,
			tag = "auto-xy padding-small align-y-top",
			fontStyle = {
				FontSize = var2.textSize,
				Font = if var2.fontFace then var2.fontFace elseif var2.font then Font.fromEnum(var2.font) else Font.fromEnum(code),
				LineHeight = var2.lineHeight
			},
			TextXAlignment = Enum.TextXAlignment.Left
		}
		local t_1 = {
			RichText = true,
			ZIndex = 1,
			Text = var1,
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
		local codeBackgroundStyles = p2.codeBackgroundStyles or {}
		local backgroundColor3 = codeBackgroundStyles.backgroundColor3 or highlighter.getTokenColor("background")
		local backgroundTransparency = codeBackgroundStyles.backgroundTransparency or 0
		local var3 = nil
		local showLineNumbers = p2.codeSettings and p2.codeSettings.showLineNumbers
		
		if showLineNumbers then
			var3 = computeLineNumbers(text_1)
		end
		return reactModule.createElement(view, {
			tag = "size-full-0 auto-y col",
			BorderSizePixel = 0,
			key = tostring(p1.index),
			LayoutOrder = p1.index,
			backgroundStyle = { Transparency = 1 }
		}, {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingTop = if p1.offset ~= 0 then UDim.new(0, 10) else nil,
				PaddingBottom = UDim.new(0, 10)
			}),
			TitleBar = if p2.codeSettings and p2.codeSettings.showCopyButton then reactModule.createElement(foundationModule.View, {
				tag = "size-full-0 auto-y row align-x-right bg-shift-300 radius-small",
				LayoutOrder = 1
			}, {
				CopyToClipboardButton = reactModule.createElement(foundationModule.IconButton, {
					size = foundationModule.Enums.InputSize.Small,
					icon = { name = foundationModule.Enums.IconName.TwoStackedSquares },
					onActivated = var3(text_1)
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
					Text = var3,
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
								LineHeight = p2.codeStyles.lineHeight
							})
						})
					})
				})
			})
		})
	end,
	STYLED_TEXT = function(p1, p2)
		-- upvalues: dashModule (ref), mergeContextsModule (ref)
		local var1 = if p1.attributes and p1.attributes.style then p1.attributes.style else nil
		local t = {}
		
		if var1 == "BOLD" or var1 == "BOLD_2" then
			t.bold = true
		elseif var1 == "ITALIC" or var1 == "ITALIC_2" then
			t.italic = true
		elseif var1 == "STRIKE" then
			t.strike = true
		elseif var1 == "INLINE_CODE" then
			t = dashModule.joinDeep(p2.codeStyles, { selectable = true })
		end
		return p2.processChildren(p1, mergeContextsModule(p2, { textStyles = t }))
	end,
	TEXT = function(p1, p2)
		-- upvalues: processSoftBreaksModule (ref), getBaseTextElementEngineTags (ref), builderSans (ref), selectableTextElement (ref), textElement (ref)
		local t = {
			LayoutOrder = p1.index,
			Text = processSoftBreaksModule(p1.text),
			EngineTags = getBaseTextElementEngineTags(p2.textStyles)
		}
		local t_1 = {}
		local textStyles = p2.textStyles
		t_1.Font = if textStyles.fontFace then textStyles.fontFace elseif textStyles.font then Font.fromEnum(textStyles.font) else Font.fromEnum(builderSans)
		t_1.FontSize = p2.textStyles.textSize
		t.fontStyle = t_1
		t.textStyle = {
			Color3 = if typeof(p2.textStyles.color) == "string" then Color3.fromHex(p2.textStyles.color) else p2.textStyles.color,
			Transparency = p2.textStyles.transparency
		}
		t.viewTags = p2.textStyles.viewTags
		
		return if p2.textStyles.selectable then selectableTextElement.new(t) else textElement.new(t)
	end,
	LINK = function(p1, p2)
		-- upvalues: mergeContextsModule (ref), dashModule (ref), isInlineElement (ref), hardBreakElement (ref), linkElement (ref)
		local var1 = if p1.attributes then p1.attributes.url else p1.url or ""
		
		return linkElement.new(dashModule.filter(p2.processChildren(p1, mergeContextsModule(p2, { textStyles = { color = p2.linkStyles.linkColor } })), function(p1)
			-- upvalues: isInlineElement (copy), hardBreakElement (copy)
			return isInlineElement(p1) and p1 ~= hardBreakElement
		end), {
			onActivated = function()
				-- upvalues: p2 (ref), var1 (ref)
				p2.linkCallback(var1)
			end
		})
	end,
	LIST = function(p1, p2)
		-- upvalues: reactModule (ref), view (ref), render (ref), dashModule (ref), bulletList (ref), builderSans (ref)
		local var1
		local t = {}
		local var2 = nil
		
		for i = #p1.children, 1, -1 do
			var1 = p1.children[i]
			
			if var1.name == "LIST" then
				var2 = var1
				continue
			end
			if var2 then
				table.insert(t, 1, {
					Prefix = if var1.attributes then var1.attributes.prefix else nil,
					Item = reactModule.createElement(view, {
						tag = "size-full-0 auto-y col",
						BorderSizePixel = 0,
						backgroundStyle = { Transparency = 1 }
					}, {
						Item = render(dashModule.join(var1, { index = 1 }), p2),
						List = render(dashModule.join(var2, { index = 2 }), p2)
					})
				})
				var2 = nil
			else
				table.insert(t, 1, {
					Prefix = if var1.attributes then var1.attributes.prefix else nil,
					Item = render(var1, p2)
				})
			end
		end
		local createElement = reactModule.createElement
		local t_1 = {
			TextWrapped = true,
			tag = "size-full-0 auto-y",
			key = tostring(p1.index),
			LayoutOrder = p1.index,
			Items = t
		}
		var1 = {}
		local textStyles = p2.textStyles
		var1.Font = if textStyles.fontFace then textStyles.fontFace elseif textStyles.font then Font.fromEnum(textStyles.font) else Font.fromEnum(builderSans)
		var1.TextColor = if typeof(p2.textStyles.color) == "string" then Color3.fromHex(p2.textStyles.color) else p2.textStyles.color
		var1.TextSize = p2.textStyles.textSize
		var1.LineHeight = p2.textStyles.textSize
		t_1.ListStyle = var1
		
		return createElement(bulletList, t_1, {
			UIPadding = p1.offset ~= 0 and reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 10) })
		})
	end,
	LIST_ITEM = function(p1, p2)
		-- upvalues: reactModule (ref), view (ref), renderInlineModule (ref)
		return reactModule.createElement(view, {
			tag = "size-full-0 auto-y",
			key = tostring(p1.index),
			LayoutOrder = p1.index
		}, { InlineLayout = renderInlineModule(p1, p2) })
	end,
	DIVIDER = function(p1)
		-- upvalues: reactModule (ref), view (ref), divider (ref)
		return reactModule.createElement(view, {
			tag = "size-full-0 auto-y",
			key = tostring(p1.index),
			LayoutOrder = p1.index
		}, {
			UIPadding = p1.offset ~= 0 and reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 10) }),
			Divider = reactModule.createElement(divider)
		})
	end,
	QUOTE = function(p1, p2)
		-- upvalues: reactModule (ref), view (ref), renderInlineModule (ref), mergeContextsModule (ref)
		return reactModule.createElement(view, {
			tag = "size-full-0 auto-y padding-small",
			key = tostring(p1.index),
			LayoutOrder = p1.index,
			backgroundStyle = { Transparency = 1 }
		}, {
			InlineLayoutWrapper = reactModule.createElement(view, {
				tag = "size-full-0 auto-y",
				backgroundStyle = {
					Transparency = 0.9,
					Color3 = Color3.fromRGB(163, 162, 165)
				}
			}, {
				InlineLayout = renderInlineModule(p1, mergeContextsModule(p2, { textStyles = { italic = true, transparency = 0.5 } }))
			})
		})
	end,
	IMAGE = function(p1, p2)
		-- upvalues: imageElement (ref)
		return imageElement.new({
			LayoutOrder = p1.index,
			Image = if p1.attributes then p1.attributes.url else p1.url or nil,
			Size = p2.imageStyles.size,
			backgroundStyle = {
				Transparency = p2.imageStyles.backgroundTransparency,
				Color3 = p2.imageStyles.backgroundColor3
			},
			imageStyle = { Transparency = p2.imageStyles.transparency },
			ScaleType = p2.imageStyles.scaleType,
			ResampleMode = p2.imageStyles.resampleMode,
			tag = p2.imageStyles.tags
		})
	end,
	TAG = renderTagModule,
	BREAK = renderHardBreak,
	LINE_BREAK = renderHardBreak
}

function t.render(p1, p2)
	-- upvalues: t (ref), dashModule (ref), builderSans (ref), code (ref), uDim2 (ref), var1 (ref), processChildren (ref), render (ref)
	t.renderers = p2.userRenderers
	local var1 = dashModule.joinDeep({
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
			linkColor = `#{p2.tokens.Color.Content.Link.Color3:ToHex()}`
		},
		linkCallback = p2.linkCallback or var1,
		colorScheme = p2.colorScheme,
		processChildren = processChildren
	}, table.clone(p2.markdownRendererProps or {}))
	table.freeze(var1)
	
	return render(p1, var1)
end

return t