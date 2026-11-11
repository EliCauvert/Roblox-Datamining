local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local SubtitleModule = require(GenericAbuseReporting.BeduiV2.Components.Subtitle)
local TextWithTranslationModule = require(GenericAbuseReporting.BeduiV2.Utils.Translate.TextWithTranslation)
local _ = require(GenericAbuseReporting.BeduiV2.Utils.Translate.translate)
local Sheet = FoundationModule.Sheet
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local UseIsSlideAnimatingFunction = require(GenericAbuseReporting.BeduiV2.Components.SlideTransitionContext).useIsSlideAnimating
local Context = ReactModule.createContext(false)
local SheetSlots = {
	Body = ReactModule.forwardRef(function(p1, Ref)
		-- upvalues: ReactModule (copy), Sheet (copy)
		return ReactModule.createElement(Sheet.Content, { ref = Ref }, p1.children)
	end),
	Actions = ReactModule.forwardRef(function(p1, Ref)
		-- upvalues: ReactModule (copy), Sheet (copy)
		return ReactModule.createElement(Sheet.Actions, { ref = Ref }, p1.children)
	end),
	Title = ReactModule.forwardRef(function(p1, _)
		-- upvalues: ReactModule (copy), TextWithTranslationModule (copy)
		return ReactModule.createElement(TextWithTranslationModule, {
			input = p1.input,
			tag = `size-full-0 auto-y text-heading-medium {p1.tag or ""}`,
			layoutOrder = p1.layoutOrder
		})
	end),
	Layout = ReactModule.forwardRef(function(p1, Ref)
		-- upvalues: ReactModule (copy), Sheet (copy)
		return ReactModule.createElement(ReactModule.Fragment, nil, {
			Content = ReactModule.createElement(Sheet.Content, { ref = Ref }, p1.body),
			Actions = if p1.actions == nil then nil else ReactModule.createElement(Sheet.Actions, nil, p1.actions)
		})
	end)
}
local Context1 = ReactModule.createContext(SheetSlots)

return {
	INLINE_LANDSCAPE_WIDTH = 468,
	sheetSlots = SheetSlots,
	inlineSlots = {
		Body = ReactModule.forwardRef(function(p1, Ref)
			-- upvalues: UseIsSlideAnimatingFunction (copy), ReactModule (copy), View (copy)
			return ReactModule.createElement(View, { tag = "fill size-full-0", ref = Ref }, ReactModule.createElement("ScrollingFrame", {
				ZIndex = 2,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Selectable = false,
				ScrollBarThickness = 1,
				Size = UDim2.new(1, 0, 1, 0),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				ScrollBarImageTransparency = UseIsSlideAnimatingFunction():map(function(p2): number
					return if p2 then 1 else 0
				end)
			}, ReactModule.createElement(View, {
				tag = "align-x-center size-full-0 auto-y margin-bottom-medium"
			}, ReactModule.createElement(View, { tag = "col gap-medium size-full-0 auto-y" }, p1.children))))
		end),
		Actions = ReactModule.forwardRef(function(p1, Ref)
			-- upvalues: ReactModule (copy), View (copy)
			return ReactModule.createElement(View, {
				tag = "size-full-0 auto-y align-x-center padding-bottom-small",
				ref = Ref
			}, ReactModule.createElement(View, {
				tag = "row size-full-0 auto-y gap-medium position-bottom-center",
				ZIndex = 2
			}, p1.children))
		end),
		Title = ReactModule.forwardRef(function(p1, _)
			-- upvalues: ReactModule (copy), View (copy), TextWithTranslationModule (copy), SubtitleModule (copy)
			return ReactModule.createElement(View, {
				tag = "col gap-xsmall size-full-0 auto-y",
				LayoutOrder = p1.layoutOrder
			}, {
				Title = ReactModule.createElement(TextWithTranslationModule, {
					input = p1.input,
					tag = `size-full-0 auto-y text-title-large {p1.tag or ""}`,
					layoutOrder = p1.layoutOrder
				}),
				Subtitle = p1.subtitle and ReactModule.createElement(SubtitleModule, {
					subtitle = p1.subtitle,
					layoutOrder = if p1.layoutOrder then p1.layoutOrder + 1 else 2
				})
			})
		end),
		Layout = ReactModule.forwardRef(function(p1, Ref)
			-- upvalues: ReactModule (copy), Context (copy), UseTokensFunction (copy), UseIsSlideAnimatingFunction (copy), View (copy)
			local UseContextResult = ReactModule.useContext(Context)
			local UseTokensResult = UseTokensFunction()
			
			return ReactModule.createElement(View, { tag = "col size-full", ref = Ref }, {
				BodyWrapper = ReactModule.createElement(View, { tag = "fill size-full-0", LayoutOrder = 1 }, ReactModule.createElement("ScrollingFrame", {
					ZIndex = 2,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Selectable = false,
					ScrollBarThickness = 1,
					Size = UDim2.new(1, 0, 1, 0),
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.new(1, 0, 0, 0),
					ScrollingDirection = Enum.ScrollingDirection.Y,
					ScrollBarImageTransparency = UseIsSlideAnimatingFunction():map(function(p2): number
						return if p2 then 1 else 0
					end)
				}, ReactModule.createElement(View, {
					tag = {
						["align-x-center size-full-0 auto-y margin-bottom-medium"] = true,
						["padding-top-large"] = UseContextResult
					}
				}, ReactModule.createElement(View, {
					Size = if UseContextResult then UDim2.new(0, 468 * UseTokensResult.Config.UI.Scale, 0, 0) else nil,
					tag = {
						["col gap-medium auto-y"] = true,
						["size-full-0"] = not UseContextResult
					}
				}, {
					Body = p1.body,
					LandscapeActions = if UseContextResult and p1.actions ~= nil then ReactModule.createElement(View, {
						tag = "auto-xy padding-bottom-small padding-top-small",
						LayoutOrder = 1000
					}, p1.actions) else nil
				})))),
				PortraitActionsWrapper = if UseContextResult or p1.actions == nil then nil else ReactModule.createElement(View, {
					tag = "align-x-center size-full-0 auto-y padding-bottom-small",
					LayoutOrder = 2
				}, ReactModule.createElement(View, {
					tag = "row gap-medium position-bottom-center size-full-0 auto-y",
					ZIndex = 2
				}, p1.actions))
			})
		end)
	},
	LayoutSlotsProvider = function(p1)
		-- upvalues: ReactModule (copy), Context1 (copy)
		return ReactModule.createElement(Context1.Provider, { value = p1.slots }, p1.children)
	end,
	useLayoutSlots = function()
		-- upvalues: ReactModule (copy), Context1 (copy)
		return ReactModule.useContext(Context1)
	end,
	OverlaidControlsProvider = function(p1)
		-- upvalues: ReactModule (copy), Context (copy)
		return ReactModule.createElement(Context.Provider, { value = p1.value }, p1.children)
	end,
	useShouldUseOverlaidControls = function()
		-- upvalues: ReactModule (copy), Context (copy)
		return ReactModule.useContext(Context)
	end
}