local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local MarkdownModule = require(Parent.Markdown)
local ReactModule = require(Parent.React)
local ChatScrollAnchorContextModule = require(BuildExperience.Chat.ChatScrollAnchorContext)
local FFlagBuildExperienceTurnWorkTelemetryModule = require(BuildExperience.Flags.FFlagBuildExperienceTurnWorkTelemetry)
local TurnWorkTelemetryContextModule = require(BuildExperience.Chat.TurnWorkTelemetryContext)
local FFlagBuildExperienceChatAccordionScrollAnchorModule = require(BuildExperience.Flags.FFlagBuildExperienceChatAccordionScrollAnchor)
local EscapeRichTextModule = require(BuildExperience.utils.escapeRichText)
local GetMarkdownRendererPropsModule = require(BuildExperience.utils.getMarkdownRendererProps)
local _ = require(BuildExperience.Chat.chatTypes)
local MarkdownViewer = MarkdownModule.Components.MarkdownViewer
local Icon = FoundationModule.Icon
local Progress = FoundationModule.Progress
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local ProgressShape = FoundationModule.Enums.ProgressShape
local ProgressSize = FoundationModule.Enums.ProgressSize
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance

local function _(p1): string
	return `#{p1.Color3:ToHex()}`
end

local function getBodyText(Body, Answers)
	-- upvalues: EscapeRichTextModule (copy)
	if Answers == nil or #Answers == 0 then
		return Body
	end
	local List = {}
	
	if Body ~= nil then
		table.insert(List, EscapeRichTextModule(Body))
	end
	for _, answer in Answers do
		local List1 = { `<b>{EscapeRichTextModule(answer.question)}</b>` }
		
		for _, answer1 in answer.answers do
			table.insert(List1, `<font transparency="0.3">{EscapeRichTextModule(answer1)}</font>`)
		end
		table.insert(List, table.concat(List1, "\n"))
	end
	return table.concat(List, "\n\n")
end

return function(Frame)
	-- upvalues: FoundationModule (copy), ReactModule (copy), getBodyText (copy), GetMarkdownRendererPropsModule (copy), FFlagBuildExperienceChatAccordionScrollAnchorModule (copy), ChatScrollAnchorContextModule (copy), FFlagBuildExperienceTurnWorkTelemetryModule (copy), TurnWorkTelemetryContextModule (copy), EscapeRichTextModule (copy), View (copy), StateLayerAffordance (copy), Icon (copy), IconName (copy), IconSize (copy), Progress (copy), ProgressShape (copy), ProgressSize (copy), Text (copy), MarkdownViewer (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseBindingResult = ReactModule.useBinding(0)
	local Size500 = UseTokensResult.Size.Size_500
	local Answers = Frame.answers
	local RichText: boolean = Answers ~= nil and #Answers > 0
	local BodyText = getBodyText(Frame.body, Answers)
	local Markdown = Frame.markdown
	local HasBodyText: boolean = BodyText ~= nil or Markdown ~= nil
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetMarkdownRendererPropsModule (upval), UseTokensResult (copy)
		return GetMarkdownRendererPropsModule(UseTokensResult, UseTokensResult.Color.Content.Muted)
	end, { UseTokensResult })
	local IsIsExpanded = Frame.isExpanded == true
	local OnToggleFunction = Frame.onToggle
	local UseRefResult = if FFlagBuildExperienceChatAccordionScrollAnchorModule then ReactModule.useRef(nil) else nil
	local UseContextResult = if FFlagBuildExperienceChatAccordionScrollAnchorModule then ReactModule.useContext(ChatScrollAnchorContextModule) else nil
	local UseContextResult1 = if FFlagBuildExperienceTurnWorkTelemetryModule then ReactModule.useContext(TurnWorkTelemetryContextModule) else nil
	local Index = Frame.index
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FFlagBuildExperienceChatAccordionScrollAnchorModule (upval), UseContextResult (copy), UseRefResult (copy), UseContextResult1 (copy), Index (copy), IsIsExpanded (copy), OnToggleFunction (copy)
		if FFlagBuildExperienceChatAccordionScrollAnchorModule and UseContextResult ~= nil and UseRefResult ~= nil then
			UseContextResult(UseRefResult.current)
		end
		if UseContextResult1 ~= nil then
			UseContextResult1.recordStepToggle(Index, not IsIsExpanded)
		end
		if OnToggleFunction ~= nil then
			OnToggleFunction()
		end
	end, if FFlagBuildExperienceTurnWorkTelemetryModule then {
		UseContextResult,
		OnToggleFunction,
		UseContextResult1,
		Index,
		IsIsExpanded
	} else { UseContextResult, OnToggleFunction })
	local Match, Match2 = string.match(Frame.title, "^(%S+)%s+(.*)$")
	local Text1: string = `<b>{EscapeRichTextModule(Match or Frame.title)}</b>`
	
	if Match2 ~= nil and Match2 ~= "" then
		Text1 ..= ` <font color="{`#{UseTokensResult.Color.Content.Muted.Color3:ToHex()}`}">{EscapeRichTextModule(Match2)}</font>`
	end
	return ReactModule.createElement(View, {
		tag = "col size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Step = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row align-y-top gap-small size-full-0 auto-y",
			testId = "StepActivityRow.Summary",
			ref = UseRefResult,
			onActivated = if HasBodyText then UseResult else nil,
			stateLayer = { affordance = StateLayerAffordance.None }
		}, {
			Marker = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "align-x-center align-y-center",
				Size = UDim2.fromOffset(Size500, Size500)
			}, {
				Check = if Frame.isRunning == true or Frame.isFailed == true then nil else ReactModule.createElement(Icon, {
					testId = "StepActivityRow.Check",
					name = IconName.Check,
					size = IconSize.Medium,
					style = UseTokensResult.Color.Content.Default
				}),
				Failed = if Frame.isRunning == true or Frame.isFailed ~= true then nil else ReactModule.createElement(Icon, {
					testId = "StepActivityRow.Failed",
					name = IconName.X,
					size = IconSize.Medium,
					style = UseTokensResult.Color.Content.Default
				}),
				Spinner = if Frame.isRunning == true then ReactModule.createElement(View, {
					tag = "auto-xy clip",
					GroupTransparency = UseBindingResult
				}, {
					Progress = ReactModule.createElement(Progress, {
						testId = "StepActivityRow.Spinner",
						shape = ProgressShape.Circle,
						size = ProgressSize.Small
					})
				}) else nil
			}),
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				RichText = true,
				testId = "StepActivityRow.Title",
				tag = "fill auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
				Text = Text1
			}),
			Chevron = if HasBodyText then ReactModule.createElement(View, {
				LayoutOrder = 3,
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_300, Size500)
			}, {
				Icon = ReactModule.createElement(Icon, {
					testId = "StepActivityRow.Chevron",
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					name = if IsIsExpanded then IconName.ChevronSmallUp else IconName.ChevronSmallDown,
					size = IconSize.XSmall,
					style = UseTokensResult.Color.Content.Muted
				}),
				HitArea = ReactModule.createElement(View, {
					testId = "StepActivityRow.ChevronHitArea",
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					Size = UDim2.fromOffset(UseTokensResult.Size.Size_1000, UseTokensResult.Size.Size_800),
					onActivated = UseResult,
					selection = { Selectable = false },
					stateLayer = { affordance = StateLayerAffordance.None }
				})
			}) else nil
		}),
		Body = if IsIsExpanded and (BodyText ~= nil or Markdown ~= nil) then ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row gap-small size-full-0 auto-y padding-y-xxsmall"
		}, {
			Gutter = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "self-stretch",
				Size = UDim2.fromOffset(Size500, 0)
			}, {
				Rail = if Frame.isLast == true and not RichText then nil else ReactModule.createElement(View, {
					testId = "StepActivityRow.Rail",
					tag = "bg-shift-200",
					AnchorPoint = Vector2.new(0.5, 0),
					Position = UDim2.fromScale(0.5, 0),
					Size = UDim2.new(0, 1, 1, 0)
				})
			}),
			Content = ReactModule.createElement(View, { LayoutOrder = 2, tag = "col gap-small fill auto-y" }, {
				Text = if BodyText == nil then nil else ReactModule.createElement(Text, {
					LayoutOrder = 1,
					testId = "StepActivityRow.Body",
					tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-muted",
					RichText = RichText,
					Text = BodyText
				}),
				Markdown = if Markdown == nil then nil else ReactModule.createElement(MarkdownViewer, {
					Markdown = Markdown,
					WrapperProps = {
						LayoutOrder = 2,
						tag = "col size-full-0 auto-y text-body-small content-muted",
						testId = "StepActivityRow.Markdown"
					},
					MarkdownRendererProps = UseMemoResult
				})
			})
		}) else nil,
		Connector = if Frame.isLast == true then nil else ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = "align-x-center align-y-center",
			Size = UDim2.fromOffset(Size500, UseTokensResult.Size.Size_250)
		}, {
			Line = ReactModule.createElement(View, {
				testId = "StepActivityRow.Connector",
				tag = "bg-shift-200",
				Size = UDim2.fromOffset(1, UseTokensResult.Size.Size_150)
			})
		})
	})
end