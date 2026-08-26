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

local function _(p1, p2, p3)
	-- upvalues: stepperStepStateModule (ref)
	return if p3 then stepperStepStateModule.Current elseif p1 < p2 then stepperStepStateModule.Complete else stepperStepStateModule.Incomplete
end

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), dashModule (ref), fillBehaviorModule (ref), reactModule (ref), useAnimatedHighlightModule (ref), stepperStepStateModule (ref), stepItemModule (ref), viewModule (ref), withCommonPropsModule (ref), overflowScrollContainerModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useTokensModule()
	local activeStepId = var1.activeStepId or dashModule.get(var1, { "steps", 1, "id" })
	local steps = dashModule.findIndex(var1.steps, function(p3)
		-- upvalues: activeStepId (ref)
		return p3.id == activeStepId
	end) or 1
	local var3 = var1.fillBehavior == fillBehaviorModule.Fill
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useRef({})
	local var6 = reactModule.useMemo(function()
		-- upvalues: var5 (ref), var1 (ref), reactModule (copy)
		local current = var5.current
		
		for i, v in var1.steps do
			if not current[v.id] then
				current[v.id] = reactModule.createRef()
			end
		end
		return current
	end, { var1.steps })
	local var7 = useAnimatedHighlightModule(activeStepId, p2 or var4, var6, var1.size, var1.fillBehavior)
	local var8, var9 = reactModule.useBinding(0)
	local var10 = reactModule.useCallback(function(p3)
		-- upvalues: var9 (ref)
		var9(p3.AbsoluteSize.X)
	end, {})
	local standard = var2.Stroke.Standard
	local t_1 = {}
	
	for i, v in ipairs(var1.steps) do
		t_1[`Step{v.id}`] = reactModule.createElement(stepItemModule, {
			step = v,
			index = i,
			stepState = if activeStepId == v.id then stepperStepStateModule.Current elseif i < steps then stepperStepStateModule.Complete else stepperStepStateModule.Incomplete,
			size = var1.size,
			fillBehavior = var1.fillBehavior,
			LayoutOrder = i,
			testId = `{var1.testId}--step-{v.id}`,
			ref = var6[v.id]
		})
	end
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, {
		tag = "size-full-0 auto-y no-clip",
		sizeConstraint = if not var3 then {
			MaxSize = var8:map(function(p3)
				return Vector2.new(p3, 1e999)
			end)
		} else nil
	}), {
		Stepper = reactModule.createElement(viewModule, {
			tag = "col size-full-0 auto-y",
			ref = p2 or var4,
			ZIndex = var1.ZIndex,
			testId = `{var1.testId}--container`
		}, {
			ScrollContainer = reactModule.createElement(overflowScrollContainerModule, {
				LayoutOrder = 1,
				size = var1.size,
				scrimBottomInset = standard,
				testId = `{var1.testId}--scroll-container`
			}, {
				StepList = reactModule.createElement(viewModule, {
					onAbsoluteSizeChanged = var10,
					tag = {
						["row flex-y-fill auto-xy"] = true,
						["size-full-0"] = var3
					},
					testId = `{var1.testId}--list`
				}, t_1)
			}),
			Border = reactModule.createElement(viewModule, {
				LayoutOrder = 2,
				tag = "position-bottom-left anchor-bottom-left",
				Size = UDim2.new(1, 0, 0, var2.Stroke.Standard),
				backgroundStyle = var2.Color.Stroke.Default,
				testId = `{var1.testId}--border`
			})
		}),
		AnimatedBorder = reactModule.createElement(viewModule, {
			LayoutOrder = 0,
			tag = "anchor-bottom-left bg-system-contrast",
			ZIndex = var1.ZIndex + 1,
			Size = var7.highlightWidth:map(function(p3)
				-- upvalues: standard (ref)
				return UDim2.fromOffset(p3, standard)
			end),
			Position = reactModule.joinBindings({ var7.highlightPosition, var7.activeItemHeight }):map(function(p3)
				return UDim2.fromOffset(p3[1], p3[2])
			end),
			testId = `{var1.testId}--animated-border`
		})
	})
end))