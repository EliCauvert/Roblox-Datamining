local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ChatScrollAnchorContextModule = require(BuildExperience.Chat.ChatScrollAnchorContext)
local FFlagBuildExperienceChatAccordionScrollAnchorModule = require(BuildExperience.Flags.FFlagBuildExperienceChatAccordionScrollAnchor)
local EscapeRichTextModule = require(BuildExperience.utils.escapeRichText)
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

return function(Frame)
	-- upvalues: FoundationModule (copy), ReactModule (copy), FFlagBuildExperienceChatAccordionScrollAnchorModule (copy), ChatScrollAnchorContextModule (copy), EscapeRichTextModule (copy), View (copy), StateLayerAffordance (copy), Text (copy), Progress (copy), ProgressShape (copy), ProgressSize (copy), Icon (copy), IconName (copy), IconSize (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseBindingResult = ReactModule.useBinding(0)
	local Size500: number = UseTokensResult.Size.Size_500
	local Body = Frame.body
	local HasBody = Body ~= nil
	local IsIsExpanded = Frame.isExpanded == true
	local OnToggleFunction = Frame.onToggle
	local UseRefResult = if FFlagBuildExperienceChatAccordionScrollAnchorModule then ReactModule.useRef(nil) else nil
	local UseContextResult = if FFlagBuildExperienceChatAccordionScrollAnchorModule then ReactModule.useContext(ChatScrollAnchorContextModule) else nil
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FFlagBuildExperienceChatAccordionScrollAnchorModule (upval), UseContextResult (copy), UseRefResult (copy), OnToggleFunction (copy)
		if FFlagBuildExperienceChatAccordionScrollAnchorModule and UseContextResult ~= nil and UseRefResult ~= nil then
			UseContextResult(UseRefResult.current)
		end
		if OnToggleFunction ~= nil then
			OnToggleFunction()
		end
	end, { UseContextResult, OnToggleFunction })
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
			onActivated = if HasBody then UseResult else nil,
			stateLayer = { affordance = StateLayerAffordance.None }
		}, {
			Marker = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "align-x-center align-y-center",
				Size = UDim2.fromOffset(Size500, Size500)
			}, {
				Number = if Frame.isRunning == true then nil else ReactModule.createElement(Text, {
					testId = "StepActivityRow.Number",
					tag = "auto-xy text-body-small content-default",
					Text = tostring(Frame.index)
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
			Chevron = if HasBody then ReactModule.createElement(View, {
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
		Body = if IsIsExpanded and Body ~= nil then ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row gap-small size-full-0 auto-y padding-y-xxsmall"
		}, {
			Gutter = ReactModule.createElement(View, { LayoutOrder = 1, Size = UDim2.fromOffset(Size500, 0) }),
			Text = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				testId = "StepActivityRow.Body",
				tag = "fill auto-y text-body-small text-wrap text-align-x-left content-muted",
				Text = Body
			}, {
				Rail = if Frame.isLast == true then nil else ReactModule.createElement(View, {
					testId = "StepActivityRow.Rail",
					tag = "bg-shift-200",
					Position = UDim2.fromOffset(-(UseTokensResult.Gap.Small + Size500 / 2), 0),
					Size = UDim2.new(0, 1, 1, 0)
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