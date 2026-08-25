local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local fillBehaviorModule = require(foundation.Enums.FillBehavior)
local inputSizeModule = require(foundation.Enums.InputSize)
local overflowScrollContainerModule = require(foundation.Components.OverflowScrollContainer)
local stepperStepStateModule = require(foundation.Enums.StepperStepState)
local stepItemModule = require(script.Parent.StepItem)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useAnimatedHighlightModule = require(foundation.Utility.useAnimatedHighlight)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = {
	testId = "--foundation-stepper",
	ZIndex = 1,
	fillBehavior = fillBehaviorModule.Fill,
	size = inputSizeModule.Medium
}

local function _(p0, p1, p2)
	-- upvalues: stepperStepStateModule (ref)
	return if p2 then stepperStepStateModule.Current elseif p0 < p1 then stepperStepStateModule.Complete else stepperStepStateModule.Incomplete
end

return reactModule.memo(reactModule.forwardRef(function(p3, p4)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), dashModule (ref), fillBehaviorModule (ref), reactModule (ref), useAnimatedHighlightModule (ref), stepperStepStateModule (ref), stepItemModule (ref), viewModule (ref), withCommonPropsModule (ref), overflowScrollContainerModule (ref)
	local var14 = withDefaultsModule(p3, t)
	local var15 = useTokensModule()
	local activeStepId = var14.activeStepId or dashModule.get(var14, { "steps", 1, "id" })
	local steps = dashModule.findIndex(var14.steps, function(p5)
		-- upvalues: activeStepId (ref)
		return p5.id == activeStepId
	end) or 1
	local var18 = var14.fillBehavior == fillBehaviorModule.Fill
	local var19 = reactModule.useRef(nil)
	local var20 = reactModule.useRef({})
	local var21 = reactModule.useMemo(function()
		-- upvalues: var20 (ref), var14 (ref), reactModule (copy)
		local current = var20.current
		
		for i, v in var14.steps do
			if not current[v.id] then
				current[v.id] = reactModule.createRef()
			end
		end
		return current
	end, { var14.steps })
	local var22 = useAnimatedHighlightModule(activeStepId, p4 or var19, var21, var14.size, var14.fillBehavior)
	local var23, var24 = reactModule.useBinding(0)
	local var25 = reactModule.useCallback(function(p6)
		-- upvalues: var24 (ref)
		var24(p6.AbsoluteSize.X)
	end, {})
	local standard = var15.Stroke.Standard
	local t_1 = {}
	
	for i, v in ipairs(var14.steps) do
		t_1[`Step{v.id}`] = reactModule.createElement(stepItemModule, {
			step = v,
			index = i,
			stepState = if activeStepId == v.id then stepperStepStateModule.Current elseif i < steps then stepperStepStateModule.Complete else stepperStepStateModule.Incomplete,
			size = var14.size,
			fillBehavior = var14.fillBehavior,
			LayoutOrder = i,
			testId = `{var14.testId}--step-{v.id}`,
			ref = var21[v.id]
		})
	end
	return reactModule.createElement(viewModule, withCommonPropsModule(var14, {
		tag = "size-full-0 auto-y no-clip",
		sizeConstraint = if not var18 then {
			MaxSize = var23:map(function(p7)
				return Vector2.new(p7, 1e999)
			end)
		} else nil
	}), {
		Stepper = reactModule.createElement(viewModule, {
			tag = "col size-full-0 auto-y",
			ref = p4 or var19,
			ZIndex = var14.ZIndex,
			testId = `{var14.testId}--container`
		}, {
			ScrollContainer = reactModule.createElement(overflowScrollContainerModule, {
				LayoutOrder = 1,
				size = var14.size,
				scrimBottomInset = standard,
				testId = `{var14.testId}--scroll-container`
			}, {
				StepList = reactModule.createElement(viewModule, {
					onAbsoluteSizeChanged = var25,
					tag = {
						["row flex-y-fill auto-xy"] = true,
						["size-full-0"] = var18
					},
					testId = `{var14.testId}--list`
				}, t_1)
			}),
			Border = reactModule.createElement(viewModule, {
				LayoutOrder = 2,
				tag = "position-bottom-left anchor-bottom-left",
				Size = UDim2.new(1, 0, 0, var15.Stroke.Standard),
				backgroundStyle = var15.Color.Stroke.Default,
				testId = `{var14.testId}--border`
			})
		}),
		AnimatedBorder = reactModule.createElement(viewModule, {
			LayoutOrder = 0,
			tag = "anchor-bottom-left bg-system-contrast",
			ZIndex = var14.ZIndex + 1,
			Size = var22.highlightWidth:map(function(p8)
				-- upvalues: standard (ref)
				return UDim2.fromOffset(p8, standard)
			end),
			Position = reactModule.joinBindings({ var22.highlightPosition, var22.activeItemHeight }):map(function(p9)
				return UDim2.fromOffset(p9[1], p9[2])
			end),
			testId = `{var14.testId}--animated-border`
		})
	})
end))