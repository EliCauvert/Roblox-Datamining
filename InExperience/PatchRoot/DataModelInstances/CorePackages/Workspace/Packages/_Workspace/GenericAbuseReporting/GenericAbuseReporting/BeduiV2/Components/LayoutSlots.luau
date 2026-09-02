local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local slideTransitionContextModule = require(genericAbuseReporting.BeduiV2.Components.SlideTransitionContext)
local subtitleModule = require(genericAbuseReporting.BeduiV2.Components.Subtitle)
local textWithTranslationModule = require(genericAbuseReporting.BeduiV2.Utils.Translate.TextWithTranslation)
local _ = require(genericAbuseReporting.BeduiV2.Utils.Translate.translate)
local sheet = foundationModule.Sheet
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local useIsSlideAnimating = slideTransitionContextModule.useIsSlideAnimating
local var1 = reactModule.createContext(false)

local var2 = function(p1)
	-- upvalues: reactModule (ref), var1 (ref)
	return reactModule.createElement(var1.Provider, { value = p1.value }, p1.children)
end

local var3 = function()
	-- upvalues: reactModule (ref), var1 (ref)
	return reactModule.useContext(var1)
end

local var4 = reactModule.forwardRef(function(p1, _)
	-- upvalues: reactModule (ref), view (ref), textWithTranslationModule (ref), subtitleModule (ref)
	return reactModule.createElement(view, {
		tag = "col gap-xsmall size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder
	}, {
		Title = reactModule.createElement(textWithTranslationModule, {
			input = p1.input,
			tag = `size-full-0 auto-y text-title-large {p1.tag or ""}`,
			layoutOrder = p1.layoutOrder
		}),
		Subtitle = p1.subtitle and reactModule.createElement(subtitleModule, {
			subtitle = p1.subtitle,
			layoutOrder = if p1.layoutOrder then p1.layoutOrder + 1 else 2
		})
	})
end)
local t = {
	Body = reactModule.forwardRef(function(p1, p2)
		-- upvalues: reactModule (ref), sheet (ref)
		return reactModule.createElement(sheet.Content, { ref = p2 }, p1.children)
	end),
	Actions = reactModule.forwardRef(function(p1, p2)
		-- upvalues: reactModule (ref), sheet (ref)
		return reactModule.createElement(sheet.Actions, { ref = p2 }, p1.children)
	end),
	Title = reactModule.forwardRef(function(p1, _)
		-- upvalues: reactModule (ref), textWithTranslationModule (ref)
		return reactModule.createElement(textWithTranslationModule, {
			input = p1.input,
			tag = `size-full-0 auto-y text-heading-medium {p1.tag or ""}`,
			layoutOrder = p1.layoutOrder
		})
	end),
	Layout = reactModule.forwardRef(function(p1, p2)
		-- upvalues: reactModule (ref), sheet (ref)
		return reactModule.createElement(reactModule.Fragment, nil, {
			Content = reactModule.createElement(sheet.Content, { ref = p2, isContentFullBleed = p1.isContentFullBleed }, p1.body),
			Actions = if p1.actions ~= nil then nil else reactModule.createElement(sheet.Actions, nil, p1.actions)
		})
	end),
	ContentInset = reactModule.forwardRef(function(p1, _)
		-- upvalues: reactModule (ref), view (ref)
		return reactModule.createElement(view, {
			tag = "col gap-medium size-full-0 auto-y padding-x-xlarge",
			LayoutOrder = p1.layoutOrder
		}, p1.children)
	end)
}
local var5 = reactModule.createContext(t)

return {
	INLINE_LANDSCAPE_WIDTH = 468,
	sheetSlots = t,
	inlineSlots = {
		Body = reactModule.forwardRef(function(p1, p2)
			-- upvalues: useIsSlideAnimating (ref), reactModule (ref), view (ref)
			return reactModule.createElement(view, { tag = "fill size-full-0", ref = p2 }, reactModule.createElement("ScrollingFrame", {
				ZIndex = 2,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Selectable = false,
				ScrollBarThickness = 1,
				Size = UDim2.new(1, 0, 1, 0),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				ScrollBarImageTransparency = useIsSlideAnimating():map(function(p3)
					return if p3 then 1 else 0
				end)
			}, reactModule.createElement(view, {
				tag = "align-x-center size-full-0 auto-y margin-bottom-medium"
			}, reactModule.createElement(view, { tag = "col gap-medium size-full-0 auto-y" }, p1.children))))
		end),
		Actions = reactModule.forwardRef(function(p1, p2)
			-- upvalues: reactModule (ref), view (ref)
			return reactModule.createElement(view, {
				tag = "size-full-0 auto-y align-x-center padding-bottom-small",
				ref = p2
			}, reactModule.createElement(view, {
				tag = "row size-full-0 auto-y gap-medium position-bottom-center",
				ZIndex = 2
			}, p1.children))
		end),
		Title = var4,
		Layout = reactModule.forwardRef(function(p1, p2)
			-- upvalues: reactModule (ref), var1 (ref), useTokens (ref), useIsSlideAnimating (ref), view (ref)
			local var6 = reactModule.useContext(var1)
			
			return reactModule.createElement(view, { tag = "col size-full", ref = p2 }, {
				BodyWrapper = reactModule.createElement(view, { tag = "fill size-full-0", LayoutOrder = 1 }, reactModule.createElement("ScrollingFrame", {
					ZIndex = 2,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Selectable = false,
					ScrollBarThickness = 1,
					Size = UDim2.new(1, 0, 1, 0),
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.new(1, 0, 0, 0),
					ScrollingDirection = Enum.ScrollingDirection.Y,
					ScrollBarImageTransparency = useIsSlideAnimating():map(function(p3)
						return if p3 then 1 else 0
					end)
				}, reactModule.createElement(view, {
					tag = {
						["align-x-center size-full-0 auto-y margin-bottom-medium"] = true,
						["padding-top-large"] = var6
					}
				}, reactModule.createElement(view, {
					Size = if var6 then UDim2.new(0, 468 * useTokens().Config.UI.Scale, 0, 0) else nil,
					tag = {
						["col gap-medium auto-y"] = true,
						["size-full-0"] = not var6
					}
				}, {
					Body = p1.body,
					LandscapeActions = if var6 and p1.actions ~= nil then reactModule.createElement(view, {
						tag = "auto-xy padding-bottom-small padding-top-small",
						LayoutOrder = 1000
					}, p1.actions) else nil
				})))),
				PortraitActionsWrapper = if var6 or p1.actions == nil then nil else reactModule.createElement(view, {
					tag = "align-x-center size-full-0 auto-y padding-bottom-small",
					LayoutOrder = 2
				}, reactModule.createElement(view, {
					tag = "row gap-medium position-bottom-center size-full-0 auto-y",
					ZIndex = 2
				}, p1.actions))
			})
		end),
		ContentInset = reactModule.forwardRef(function(p1, _)
			-- upvalues: reactModule (ref), view (ref)
			return reactModule.createElement(view, {
				tag = "col gap-medium size-full-0 auto-y",
				LayoutOrder = p1.layoutOrder
			}, p1.children)
		end)
	},
	LayoutSlotsProvider = function(p1)
		-- upvalues: reactModule (ref), var5 (ref)
		return reactModule.createElement(var5.Provider, { value = p1.slots }, p1.children)
	end,
	useLayoutSlots = function()
		-- upvalues: reactModule (ref), var5 (ref)
		return reactModule.useContext(var5)
	end,
	OverlaidControlsProvider = var2,
	useShouldUseOverlaidControls = var3
}