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
local var6 = reactModule.createContext(false)

local var7 = function(p0) --[[ line: 64 ]]
	-- upvalues: reactModule (ref), var6 (ref)
	return reactModule.createElement(var6.Provider, { value = p0.value }, p0.children)
end

local var8 = function() --[[ line: 71 ]]
	-- upvalues: reactModule (ref), var6 (ref)
	return reactModule.useContext(var6)
end

local var9 = reactModule.forwardRef(function(p1, _) --[[ line: 96 ]]
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
	Body = reactModule.forwardRef(function(p2, p3) --[[ line: 75 ]]
		-- upvalues: reactModule (ref), sheet (ref)
		return reactModule.createElement(sheet.Content, { ref = p3 }, p2.children)
	end),
	Actions = reactModule.forwardRef(function(p4, p5) --[[ line: 81 ]]
		-- upvalues: reactModule (ref), sheet (ref)
		return reactModule.createElement(sheet.Actions, { ref = p5 }, p4.children)
	end),
	Title = reactModule.forwardRef(function(p6, _) --[[ line: 88 ]]
		-- upvalues: reactModule (ref), textWithTranslationModule (ref)
		return reactModule.createElement(textWithTranslationModule, {
			input = p6.input,
			tag = `size-full-0 auto-y text-heading-medium {p6.tag or ""}`,
			layoutOrder = p6.layoutOrder
		})
	end),
	Layout = reactModule.forwardRef(function(p7, p8) --[[ line: 118 ]]
		-- upvalues: reactModule (ref), sheet (ref)
		return reactModule.createElement(reactModule.Fragment, nil, {
			Content = reactModule.createElement(sheet.Content, { ref = p8 }, p7.body),
			Actions = if p7.actions ~= nil then nil else reactModule.createElement(sheet.Actions, nil, p7.actions)
		})
	end)
}
local var11 = reactModule.createContext(t)

return {
	INLINE_LANDSCAPE_WIDTH = 468,
	sheetSlots = t,
	inlineSlots = {
		Body = reactModule.forwardRef(function(p9, p10) --[[ line: 137 ]]
			-- upvalues: useIsSlideAnimating (ref), reactModule (ref), view (ref)
			return reactModule.createElement(view, { tag = "fill size-full-0", ref = p10 }, reactModule.createElement("ScrollingFrame", {
				ZIndex = 2,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Selectable = false,
				ScrollBarThickness = 1,
				Size = UDim2.new(1, 0, 1, 0),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				ScrollBarImageTransparency = useIsSlideAnimating():map(function(p11) --[[ line: 139 ]]
					return if p11 then 1 else 0
				end)
			}, reactModule.createElement(view, {
				tag = "align-x-center size-full-0 auto-y margin-bottom-medium"
			}, reactModule.createElement(view, { tag = "col gap-medium size-full-0 auto-y" }, p9.children))))
		end),
		Actions = reactModule.forwardRef(function(p12, p13) --[[ line: 179 ]]
			-- upvalues: reactModule (ref), view (ref)
			return reactModule.createElement(view, {
				tag = "size-full-0 auto-y align-x-center padding-bottom-small",
				ref = p13
			}, reactModule.createElement(view, {
				tag = "row size-full-0 auto-y gap-medium position-bottom-center",
				ZIndex = 2
			}, p12.children))
		end),
		Title = var9,
		Layout = reactModule.forwardRef(function(p14, p15) --[[ line: 209 ]]
			-- upvalues: reactModule (ref), var6 (ref), useTokens (ref), useIsSlideAnimating (ref), view (ref)
			local var12 = reactModule.useContext(var6)
			
			return reactModule.createElement(view, { tag = "col size-full", ref = p15 }, {
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
					ScrollBarImageTransparency = useIsSlideAnimating():map(function(p16) --[[ line: 213 ]]
						return if p16 then 1 else 0
					end)
				}, reactModule.createElement(view, {
					tag = {
						["align-x-center size-full-0 auto-y margin-bottom-medium"] = true,
						["padding-top-large"] = var12
					}
				}, reactModule.createElement(view, {
					Size = if var12 then UDim2.new(0, 468 * useTokens().Config.UI.Scale, 0, 0) else nil,
					tag = {
						["col gap-medium auto-y"] = true,
						["size-full-0"] = not var12
					}
				}, {
					Body = p14.body,
					LandscapeActions = if var12 and p14.actions ~= nil then reactModule.createElement(view, {
						tag = "auto-xy padding-bottom-small padding-top-small",
						LayoutOrder = 1000
					}, p14.actions) else nil
				})))),
				PortraitActionsWrapper = if var12 or p14.actions == nil then nil else reactModule.createElement(view, {
					tag = "align-x-center size-full-0 auto-y padding-bottom-small",
					LayoutOrder = 2
				}, reactModule.createElement(view, {
					tag = "row gap-medium position-bottom-center size-full-0 auto-y",
					ZIndex = 2
				}, p14.actions))
			})
		end)
	},
	LayoutSlotsProvider = function(p17) --[[ line: 302 ]]
		-- upvalues: reactModule (ref), var11 (ref)
		return reactModule.createElement(var11.Provider, { value = p17.slots }, p17.children)
	end,
	useLayoutSlots = function() --[[ line: 313 ]]
		-- upvalues: reactModule (ref), var11 (ref)
		return reactModule.useContext(var11)
	end,
	OverlaidControlsProvider = var7,
	useShouldUseOverlaidControls = var8
}