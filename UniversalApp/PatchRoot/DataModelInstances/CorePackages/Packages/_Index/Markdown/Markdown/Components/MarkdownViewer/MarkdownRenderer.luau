local MessageBusService = game:GetService("MessageBusService")
local Parent = script:FindFirstAncestor("Components").Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local DashModule = require(Parent1.Dash)
local FoundationModule = require(Parent1.Foundation)
local InlineLayoutModule = require(Parent1.InlineLayout)
local MarkdownCoreModule = require(Parent1.MarkdownCore)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Divider = FoundationModule.Divider
local Utils = Parent.Utils
local TextElement = InlineLayoutModule.Components.InlineLayoutElements.TextElement
local SelectableTextElement = InlineLayoutModule.Components.InlineLayoutElements.SelectableTextElement
local LinkElement = InlineLayoutModule.Components.InlineLayoutElements.LinkElement
local ImageElement = InlineLayoutModule.Components.InlineLayoutElements.ImageElement
local HardBreakElement = InlineLayoutModule.Components.InlineLayoutElements.HardBreakElement
local MergeContextsModule = require(Utils.mergeContexts)
local ProcessSoftBreaksModule = require(Utils.processSoftBreaks)
local TextStyleModule = require(Utils.TextStyle)
local RenderInlineModule = require(script.Parent.Parent.NodeRenderers.renderInline)
local BulletList = MarkdownCoreModule.Components.BulletList
local GetBaseTextElementEngineTagsFunction = TextStyleModule.getBaseTextElementEngineTags
local GetCodeTextStylesFunction = TextStyleModule.getCodeTextStyles
local NormalizeStyleFontFunction = TextStyleModule.normalizeStyleFont
local _ = require(Parent.Types)
local Highlighter = MarkdownCoreModule.Utils.Highlighter
local GetNodeTypeConfigModule = require(Parent.Utils.getNodeTypeConfig)
local IsInlineElementFunction = InlineLayoutModule.Utils.isInlineElement
local Flags = MarkdownCoreModule.Flags
local Flags1 = FoundationModule.Utility.Flags
local BuilderSans = Enum.Font.BuilderSans
local _UDim2 = UDim2.fromOffset(16, 16)
local Code = Enum.Font.Code
local _Font = Font.new("rbxasset://fonts/families/BuilderMono.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)

local function v31(p1) --[[ Line: 50 ]]
	print(`[Default link callback]: URL [{p1}] is clicked`)
end

local MarkdownRendererModule = { renderers = {} }

local function _(p1, p2) --[[ Line: 58 | Named "getFontFace" ]]
	local FontFace = p1.fontFace or p1.font
	
	return if typeof(FontFace) == "Font" then FontFace elseif FontFace then Font.fromEnum(FontFace) else Font.fromEnum(p2)
end

local _ = function(p1): boolean --[[ Line: 68 | Named "shouldUseTopPadding" ]]
	return p1.offset ~= 0
end

local function render(JoinResult, JoinDeepResult) --[[ Line: 73 ]]
	-- upvalues: MarkdownRendererModule (copy), GetNodeTypeConfigModule (copy)
	if not JoinResult then
		return nil
	end
	local Renderer = MarkdownRendererModule.renderers[JoinResult.name]
	
	if not Renderer then
		warn(`No renderer found for node: {JoinResult.name}`)
		
		return nil
	end
	local RendererResult = Renderer(JoinResult, JoinDeepResult)
	local NodeTypeConfigModule = GetNodeTypeConfigModule(JoinResult)
	
	if NodeTypeConfigModule and not NodeTypeConfigModule.validateRenderResult(RendererResult) then
		warn(`Invalid render result for node: {JoinResult.name} {JoinResult.text} of type: {JoinResult.type}`)
	end
	return RendererResult
end

local function processChildren(p1, p2) --[[ Line: 93 ]]
	-- upvalues: GetNodeTypeConfigModule (copy), render (copy)
	local Children = p1.children
	
	if not Children then
		return {}
	end
	local NodeTypeConfigModule = GetNodeTypeConfigModule(p1)
	local Children1 = NodeTypeConfigModule and NodeTypeConfigModule.children or {}
	local List = {}
	
	for _, child in Children do
		local Type = child.type
		
		if not Children1[Type] then
			warn(`Invalid child node type. Parent node: {p1.name} {p1.text} of type: {p1.type} has invalid child node: {child.name} {child.text} of type: {Type}`)
		end
		local RenderResult = render(child, p2)
		
		if RenderResult then
			if #RenderResult > 0 then
				for _, value in RenderResult do
					table.insert(List, value)
				end
			else
				table.insert(List, RenderResult)
			end
		end
	end
	return List
end

local function computeLineNumbers(Text: string): string --[[ Line: 169 ]]
	local CountText = #Text
	local List = {}
	local Count = 1
	local Init = 0
	while Init <= CountText do
		local FoundAt: number? = string.find(Text, "\n", Init, true)
		
		if not FoundAt then break end
		List[Count] = tostring(Count)
		Count += 1
		Init = FoundAt + 1
	end
	List[Count] = tostring(Count)
	
	return table.concat(List, "\n")
end

local _ = function(p3) --[[ Line: 188 | Named "copyToClipboard" ]]
	-- upvalues: MessageBusService (copy)
	pcall(function() --[[ Line: 189 ]]
		-- upvalues: MessageBusService (upval), p3 (copy)
		return MessageBusService:Publish(MessageBusService:GetMessageId("ExternalContentSharing", "setClipboardText"), { text = p3 })
	end)
end

local MemoizeResult = DashModule.memoize(function(Text) --[[ Line: 197 ]]
	-- upvalues: MessageBusService (copy)
	return function() --[[ Line: 198 ]]
		-- upvalues: Text (copy), MessageBusService (upval)
		pcall(function() --[[ Line: 189 ]]
			-- upvalues: MessageBusService (upval), Text (copy)
			return MessageBusService:Publish(MessageBusService:GetMessageId("ExternalContentSharing", "setClipboardText"), { text = Text })
		end)
	end
end)

local function renderHardBreak() --[[ Line: 467 ]]
	-- upvalues: HardBreakElement (copy)
	return HardBreakElement
end

MarkdownRendererModule.defaultRenderers = {
	ROOT = function(p3, p4) --[[ Line: 125 ]]
		-- upvalues: ReactModule (copy), View (copy)
		return ReactModule.createElement(View, {
			tag = "size-full-0 auto-y col",
			BorderSizePixel = 0,
			backgroundStyle = { Transparency = 1 }
		}, (p4.processChildren(p3, p4)))
	end,
	HEADING = function(p3, p4) --[[ Line: 136 ]]
		-- upvalues: ReactModule (copy), View (copy), RenderInlineModule (copy), MergeContextsModule (copy)
		return ReactModule.createElement(View, {
			tag = "size-full-0 auto-y",
			key = tostring(p3.index),
			LayoutOrder = p3.index
		}, {
			UIPadding = p3.offset ~= 0 and ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 20) }),
			InlineLayout = RenderInlineModule(p3, MergeContextsModule(p4, {
				textStyles = p4.headerStyles[math.clamp(if p3.attributes and type(p3.attributes.depth) == "number" then p3.attributes.depth else 1, 1, #p4.headerStyles)]
			}))
		})
	end,
	PARAGRAPH = function(p3, p4) --[[ Line: 155 ]]
		-- upvalues: ReactModule (copy), View (copy), RenderInlineModule (copy)
		return ReactModule.createElement(View, {
			tag = "size-full-0 auto-y",
			key = tostring(p3.index),
			LayoutOrder = p3.index
		}, {
			UIPadding = p3.offset ~= 0 and ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 10) }),
			InlineLayout = RenderInlineModule(p3, p4)
		})
	end,
	CODE_BLOCK = function(p3, p4) --[[ Line: 203 ]]
		-- upvalues: Highlighter (copy), GetCodeTextStylesFunction (copy), Flags (copy), _Font (copy), Code (copy), computeLineNumbers (copy), ReactModule (copy), View (copy), FoundationModule (copy), MemoizeResult (copy), Text (copy), DashModule (copy)
		local Text1 = p3.text
		local HighlightResult = if (if p3.attributes then p3.attributes.language else nil) == "lua" then Highlighter.highlight(Text1, p4.colorScheme) else Text1
		local CodeTextStyles = GetCodeTextStylesFunction(p4)
		local config = {
			TextWrapped = false,
			tag = "auto-xy padding-small align-y-top"
		}
		local FontStyle = { FontSize = CodeTextStyles.textSize }
		local FontFace = nil
		
		if Flags.FFlagMarkdownAssistantParity then
			FontFace = CodeTextStyles.fontFace or _Font
		else
			local FontFace1 = CodeTextStyles.fontFace or CodeTextStyles.font
			FontFace = if typeof(FontFace1) == "Font" then FontFace1 elseif FontFace1 then Font.fromEnum(FontFace1) else Font.fromEnum(Code)
		end
		FontStyle.Font = FontFace
		FontStyle.LineHeight = CodeTextStyles.lineHeight
		config.fontStyle = FontStyle
		config.TextXAlignment = Enum.TextXAlignment.Left
		local config1 = {
			RichText = true,
			ZIndex = 1,
			Text = HighlightResult,
			textStyle = { Color3 = Highlighter.getTokenColor("iden") }
		}
		local config2 = {
			ZIndex = 0,
			TextSelectable = true,
			Text = Text1,
			textStyle = {
				Transparency = 0.4,
				Color3 = Highlighter.getTokenColor("iden")
			}
		}
		local CodeBackgroundStyles = p4.codeBackgroundStyles or {}
		local BackgroundColor3 = CodeBackgroundStyles.backgroundColor3 or Highlighter.getTokenColor("background")
		local BackgroundTransparency = CodeBackgroundStyles.backgroundTransparency or 0
		local Text2 = nil
		local ShowLineNumbers = p4.codeSettings and p4.codeSettings.showLineNumbers
		
		if ShowLineNumbers then
			Text2 = computeLineNumbers(Text1)
		end
		local ShowCopyButton = p4.codeSettings and p4.codeSettings.showCopyButton
		local IsNotOffsetMatch = p3.offset ~= 0
		
		return ReactModule.createElement(View, {
			tag = "size-full-0 auto-y col",
			BorderSizePixel = 0,
			key = tostring(p3.index),
			LayoutOrder = p3.index,
			backgroundStyle = { Transparency = 1 }
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = if IsNotOffsetMatch then UDim.new(0, 10) else nil,
				PaddingBottom = UDim.new(0, 10)
			}),
			TitleBar = if ShowCopyButton then ReactModule.createElement(FoundationModule.View, {
				tag = "size-full-0 auto-y row align-x-right bg-shift-300 radius-small",
				LayoutOrder = 1
			}, {
				CopyToClipboardButton = ReactModule.createElement(FoundationModule.IconButton, {
					size = FoundationModule.Enums.InputSize.Small,
					icon = { name = FoundationModule.Enums.IconName.TwoStackedSquares },
					onActivated = MemoizeResult(Text1)
				})
			}) else nil,
			CodeWrapper = ReactModule.createElement(FoundationModule.View, {
				LayoutOrder = 2,
				tag = {
					["size-full-0 auto-y"] = true,
					["row align-y-center"] = ShowLineNumbers
				}
			}, {
				LineNumbers = if ShowLineNumbers then ReactModule.createElement(FoundationModule.Text, {
					LayoutOrder = 1,
					tag = "size-0-0 auto-xy text-align-x-right text-align-y-center padding-small bg-shift-100 content-emphasis",
					Text = Text2,
					fontStyle = config.fontStyle
				}) else nil,
				ScrollFrameWrapper = ReactModule.createElement(FoundationModule.View, {
					tag = "size-full-0 auto-y fill",
					LayoutOrder = 2,
					Size = UDim2.fromScale(1, 0)
				}, {
					ScrollFrame = ReactModule.createElement("ScrollingFrame", {
						BorderSizePixel = 0,
						BackgroundColor3 = BackgroundColor3,
						BackgroundTransparency = BackgroundTransparency,
						ScrollingDirection = Enum.ScrollingDirection.X,
						Size = UDim2.fromScale(1, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						AutomaticCanvasSize = Enum.AutomaticSize.X
					}, {
						HighlightedCode = ReactModule.createElement(Text, DashModule.join(config, config1)),
						SelectableCodeWrapper = ReactModule.createElement(FoundationModule.View, { tag = config.tag }, {
							SelectableCode = ReactModule.createElement("TextBox", {
								BackgroundTransparency = 1,
								TextEditable = false,
								TextWrapped = false,
								ClearTextOnFocus = false,
								Text = config2.Text,
								FontFace = config.fontStyle.Font,
								TextSize = config.fontStyle.FontSize,
								TextColor3 = config2.textStyle.Color3,
								TextTransparency = config2.textStyle.Transparency,
								TextXAlignment = Enum.TextXAlignment.Left,
								TextYAlignment = Enum.TextYAlignment.Center,
								ZIndex = config2.ZIndex,
								Size = UDim2.fromScale(0, 0),
								AutomaticSize = Enum.AutomaticSize.XY,
								LineHeight = p4.codeStyles.lineHeight
							})
						})
					})
				})
			})
		})
	end,
	STYLED_TEXT = function(p3, p4) --[[ Line: 425 ]]
		-- upvalues: DashModule (copy), MergeContextsModule (copy)
		local Style = if p3.attributes and p3.attributes.style then p3.attributes.style else nil
		local JoinDeepResult = {}
		
		if Style == "BOLD" or Style == "BOLD_2" then
			JoinDeepResult.bold = true
		elseif Style == "ITALIC" or Style == "ITALIC_2" then
			JoinDeepResult.italic = true
		elseif Style == "STRIKE" then
			JoinDeepResult.strike = true
		elseif Style == "INLINE_CODE" then
			JoinDeepResult = DashModule.joinDeep(p4.codeStyles, { selectable = true })
		end
		return (p4.processChildren(p3, MergeContextsModule(p4, { textStyles = JoinDeepResult })))
	end,
	TEXT = function(p3, p4) --[[ Line: 441 ]]
		-- upvalues: ProcessSoftBreaksModule (copy), GetBaseTextElementEngineTagsFunction (copy), Flags (copy), BuilderSans (copy), SelectableTextElement (copy), TextElement (copy)
		local config = {
			LayoutOrder = p3.index,
			Text = ProcessSoftBreaksModule(p3.text),
			EngineTags = GetBaseTextElementEngineTagsFunction(p4.textStyles)
		}
		local FontStyle = {}
		local FontFace = nil
		
		if Flags.FFlagMarkdownAssistantParity then
			FontFace = p4.textStyles.fontFace
		else
			local TextStyles = p4.textStyles
			local FontFace1 = TextStyles.fontFace or TextStyles.font
			FontFace = if typeof(FontFace1) == "Font" then FontFace1 elseif FontFace1 then Font.fromEnum(FontFace1) else Font.fromEnum(BuilderSans)
		end
		FontStyle.Font = FontFace
		FontStyle.FontSize = p4.textStyles.textSize
		config.fontStyle = FontStyle
		config.textStyle = {
			Color3 = if typeof(p4.textStyles.color) == "string" then Color3.fromHex(p4.textStyles.color) else p4.textStyles.color,
			Transparency = p4.textStyles.transparency
		}
		config.viewTags = p4.textStyles.viewTags
		
		return if p4.textStyles.selectable then SelectableTextElement.new(config) else TextElement.new(config)
	end,
	LINK = function(p3, p4) --[[ Line: 471 ]]
		-- upvalues: MergeContextsModule (copy), DashModule (copy), IsInlineElementFunction (copy), HardBreakElement (copy), LinkElement (copy)
		local Url = p3.attributes and p3.attributes.url or (p3.url or "")
		
		return LinkElement.new(DashModule.filter(p4.processChildren(p3, MergeContextsModule(p4, { textStyles = { color = p4.linkStyles.linkColor } })), function(HardBreakElement1): boolean --[[ Line: 481 ]]
			-- upvalues: IsInlineElementFunction (upval), HardBreakElement (upval)
			return IsInlineElementFunction(HardBreakElement1) and HardBreakElement1 ~= HardBreakElement
		end), {
			onActivated = function() --[[ Line: 485 ]]
				-- upvalues: p4 (copy), Url (copy)
				p4.linkCallback(Url)
			end
		})
	end,
	LIST = function(p3, p4) --[[ Line: 346 ]]
		-- upvalues: ReactModule (copy), View (copy), render (copy), DashModule (copy), BulletList (copy), Flags (copy), BuilderSans (copy)
		local List = {}
		local v1 = nil
		
		for i = #p3.children, 1, -1 do
			local Child = p3.children[i]
			
			if Child.name == "LIST" then
				v1 = Child
			elseif v1 then
				local v2 = 1
				local config1 = {
					Prefix = if Child.attributes then Child.attributes.prefix else nil
				}
				config1.Item = ReactModule.createElement(View, {
					tag = "size-full-0 auto-y col",
					BorderSizePixel = 0,
					backgroundStyle = { Transparency = 1 }
				}, {
					Item = render(DashModule.join(Child, { index = 1 }), p4),
					List = render(DashModule.join(v1, { index = 2 }), p4)
				})
				table.insert(List, v2, config1)
				v1 = nil
			else
				table.insert(List, 1, {
					Prefix = if Child.attributes then Child.attributes.prefix else nil,
					Item = render(Child, p4)
				})
			end
		end
		local CreateElementFunction = ReactModule.createElement
		local config = {
			TextWrapped = true,
			tag = "size-full-0 auto-y",
			key = tostring(p3.index),
			LayoutOrder = p3.index,
			Items = List
		}
		local Label = {}
		local FontFace = nil
		
		if Flags.FFlagMarkdownAssistantParity then
			FontFace = p4.textStyles.fontFace
		else
			local TextStyles = p4.textStyles
			local FontFace1 = TextStyles.fontFace or TextStyles.font
			FontFace = if typeof(FontFace1) == "Font" then FontFace1 elseif FontFace1 then Font.fromEnum(FontFace1) else Font.fromEnum(BuilderSans)
		end
		Label.Font = FontFace
		Label.TextColor = if typeof(p4.textStyles.color) == "string" then Color3.fromHex(p4.textStyles.color) else p4.textStyles.color
		Label.TextSize = p4.textStyles.textSize
		Label.LineHeight = p4.textStyles.textSize
		config.ListStyle = Label
		
		return CreateElementFunction(BulletList, config, {
			UIPadding = p3.offset ~= 0 and ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 10) })
		})
	end,
	LIST_ITEM = function(p5, p6) --[[ Line: 415 ]]
		-- upvalues: ReactModule (copy), View (copy), RenderInlineModule (copy)
		return ReactModule.createElement(View, {
			tag = "size-full-0 auto-y",
			key = tostring(p5.index),
			LayoutOrder = p5.index
		}, { InlineLayout = RenderInlineModule(p5, p6) })
	end,
	DIVIDER = function(p5) --[[ Line: 491 ]]
		-- upvalues: ReactModule (copy), View (copy), Divider (copy)
		return ReactModule.createElement(View, {
			tag = "size-full-0 auto-y",
			key = tostring(p5.index),
			LayoutOrder = p5.index
		}, {
			UIPadding = p5.offset ~= 0 and ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 10) }),
			Divider = ReactModule.createElement(Divider)
		})
	end,
	QUOTE = function(p5, p6) --[[ Line: 506 ]]
		-- upvalues: ReactModule (copy), View (copy), RenderInlineModule (copy), MergeContextsModule (copy)
		return ReactModule.createElement(View, {
			tag = "size-full-0 auto-y padding-small",
			key = tostring(p5.index),
			LayoutOrder = p5.index,
			backgroundStyle = { Transparency = 1 }
		}, {
			InlineLayoutWrapper = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y",
				backgroundStyle = {
					Transparency = 0.9,
					Color3 = Color3.fromRGB(163, 162, 165)
				}
			}, {
				InlineLayout = RenderInlineModule(p5, MergeContextsModule(p6, { textStyles = { italic = true, transparency = 0.5 } }))
			})
		})
	end,
	IMAGE = function(p5, p6) --[[ Line: 530 ]]
		-- upvalues: ImageElement (copy)
		return ImageElement.new({
			LayoutOrder = p5.index,
			Image = p5.attributes and p5.attributes.url or (p5.url or nil),
			Size = p6.imageStyles.size,
			backgroundStyle = {
				Transparency = p6.imageStyles.backgroundTransparency,
				Color3 = p6.imageStyles.backgroundColor3
			},
			imageStyle = { Transparency = p6.imageStyles.transparency },
			ScaleType = p6.imageStyles.scaleType,
			ResampleMode = p6.imageStyles.resampleMode,
			tag = p6.imageStyles.tags
		})
	end,
	TAG = require(script.Parent.Parent.NodeRenderers.renderTag),
	BREAK = renderHardBreak,
	LINE_BREAK = renderHardBreak
}

function MarkdownRendererModule.render(p5, p6) --[[ Line: 575 ]]
	-- upvalues: MarkdownRendererModule (copy), Flags (copy), NormalizeStyleFontFunction (copy), DashModule (copy), Flags1 (copy), _Font (copy), BuilderSans (copy), Code (copy), _UDim2 (copy), v31 (copy), processChildren (copy), render (copy)
	MarkdownRendererModule.renderers = p6.userRenderers
	local Copy = table.clone(p6.markdownRendererProps or {})
	local config = nil
	
	if Flags.FFlagMarkdownAssistantParity then
		Copy.textStyles = NormalizeStyleFontFunction(Copy.textStyles)
		Copy.codeStyles = NormalizeStyleFontFunction(Copy.codeStyles)
		
		if Copy.headerStyles then
			Copy.headerStyles = DashModule.map(Copy.headerStyles, NormalizeStyleFontFunction)
		end
		local BodyMedium = p6.tokens.Typography.BodyMedium
		local FontFace = if Flags1.FoundationFontFaceMigration then NormalizeStyleFontFunction({ font = BodyMedium.Font }).fontFace else Font.fromEnum(BodyMedium.Font)
		local FontSize: number = BodyMedium.FontSize
		config = {
			textStyles = { textSize = FontSize, fontFace = FontFace },
			codeStyles = {
				lineHeight = 1.111,
				textSize = FontSize,
				fontFace = _Font
			},
			headerStyles = {
				[1] = { textSize = FontSize * 3, fontFace = FontFace },
				[2] = { textSize = FontSize * 2.5, fontFace = FontFace },
				[3] = { textSize = FontSize * 2, fontFace = FontFace },
				[4] = { textSize = FontSize * 1.5, fontFace = FontFace },
				[5] = { textSize = FontSize * 1.5, fontFace = FontFace },
				[6] = { textSize = FontSize * 1.5, fontFace = FontFace }
			}
		}
	else
		config = {
			textStyles = { textSize = 18, font = BuilderSans },
			codeStyles = { textSize = 18, lineHeight = 1.111, font = Code },
			headerStyles = {
				[1] = { textSize = 54, font = BuilderSans },
				[2] = { textSize = 45, font = BuilderSans },
				[3] = { textSize = 36, font = BuilderSans },
				[4] = { textSize = 27, font = BuilderSans }
			}
		}
	end
	local JoinDeepResult = DashModule.joinDeep({
		isInline = false,
		textStyles = config.textStyles,
		codeStyles = config.codeStyles,
		headerStyles = config.headerStyles,
		imageStyles = { size = _UDim2 },
		linkStyles = {
			linkColor = `#{p6.tokens.Color.Content.Link.Color3:ToHex()}`
		},
		linkCallback = p6.linkCallback or v31,
		colorScheme = p6.colorScheme,
		processChildren = processChildren
	}, Copy)
	table.freeze(JoinDeepResult)
	
	return (render(p5, JoinDeepResult))
end

return MarkdownRendererModule