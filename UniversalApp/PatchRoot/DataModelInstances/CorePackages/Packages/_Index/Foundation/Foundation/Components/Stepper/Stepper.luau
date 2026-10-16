local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local FillBehaviorModule = require(Foundation.Enums.FillBehavior)
local OverflowScrollContainerModule = require(Foundation.Components.OverflowScrollContainer)
local StepperStepStateModule = require(Foundation.Enums.StepperStepState)
local StepItemModule = require(script.Parent.StepItem)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseAnimatedHighlightModule = require(Foundation.Utility.useAnimatedHighlight)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = {
	testId = "--foundation-stepper",
	ZIndex = 1,
	fillBehavior = FillBehaviorModule.Fill,
	size = require(Foundation.Enums.InputSize).Medium
}

local function _(p1, p2, p3) --[[ Line: 46 | Named "getStepState" ]]
	-- upvalues: StepperStepStateModule (copy)
	return if p3 then StepperStepStateModule.Current elseif p1 < p2 then StepperStepStateModule.Complete else StepperStepStateModule.Incomplete
end

return ReactModule.memo(ReactModule.forwardRef(function(p1, p2) --[[ Line: 56 | Named "Stepper" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), DashModule (copy), FillBehaviorModule (copy), ReactModule (copy), UseAnimatedHighlightModule (copy), StepperStepStateModule (copy), StepItemModule (copy), ViewModule (copy), WithCommonPropsModule (copy), OverflowScrollContainerModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local ActiveStepId = WithDefaultsModuleResult.activeStepId or DashModule.get(WithDefaultsModuleResult, { "steps", 1, "id" })
	local Index = DashModule.findIndex(WithDefaultsModuleResult.steps, function(p3): boolean --[[ Line: 61 ]]
		-- upvalues: ActiveStepId (copy)
		return p3.id == ActiveStepId
	end) or 1
	local IsFillBehaviorMatch = WithDefaultsModuleResult.fillBehavior == FillBehaviorModule.Fill
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef({})
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 70 ]]
		-- upvalues: UseRefResult1 (copy), WithDefaultsModuleResult (copy), ReactModule (upval)
		local Current = UseRefResult1.current
		
		for _, step in WithDefaultsModuleResult.steps do
			if not Current[step.id] then
				Current[step.id] = ReactModule.createRef()
			end
		end
		return Current
	end, { WithDefaultsModuleResult.steps })
	local UseAnimatedHighlightModuleResult = UseAnimatedHighlightModule(ActiveStepId, p2 or UseRefResult, UseMemoResult, WithDefaultsModuleResult.size, WithDefaultsModuleResult.fillBehavior)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseResult = ReactModule.useCallback(function(Frame) --[[ Line: 85 ]]
		-- upvalues: UseBindingResult2 (copy)
		UseBindingResult2(Frame.AbsoluteSize.X)
	end, {})
	local Standard = UseTokensModuleResult.Stroke.Standard
	local Elements = {}
	
	for Index1, step in ipairs(WithDefaultsModuleResult.steps) do
		local IsActiveStepIdMatch = ActiveStepId == step.id
		Elements[`Step{step.id}`] = ReactModule.createElement(StepItemModule, {
			step = step,
			index = Index1,
			stepState = if IsActiveStepIdMatch then StepperStepStateModule.Current elseif Index1 < Index then StepperStepStateModule.Complete else StepperStepStateModule.Incomplete,
			size = WithDefaultsModuleResult.size,
			fillBehavior = WithDefaultsModuleResult.fillBehavior,
			LayoutOrder = Index1,
			testId = `{WithDefaultsModuleResult.testId}--step-{step.id}`,
			ref = UseMemoResult[step.id]
		})
	end
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = "size-full-0 auto-y no-clip",
		sizeConstraint = if IsFillBehaviorMatch then nil else {
			MaxSize = UseBindingResult:map(function(X): Vector2 --[[ Line: 114 ]]
				return Vector2.new(X, 1e999)
			end)
		}
	}), {
		Stepper = ReactModule.createElement(ViewModule, {
			tag = "col size-full-0 auto-y",
			ref = p2 or UseRefResult,
			ZIndex = WithDefaultsModuleResult.ZIndex,
			testId = `{WithDefaultsModuleResult.testId}--container`
		}, {
			ScrollContainer = ReactModule.createElement(OverflowScrollContainerModule, {
				LayoutOrder = 1,
				size = WithDefaultsModuleResult.size,
				scrimBottomInset = Standard,
				testId = `{WithDefaultsModuleResult.testId}--scroll-container`
			}, {
				StepList = ReactModule.createElement(ViewModule, {
					onAbsoluteSizeChanged = UseResult,
					tag = {
						["row flex-y-fill auto-xy"] = true,
						["size-full-0"] = IsFillBehaviorMatch
					},
					testId = `{WithDefaultsModuleResult.testId}--list`
				}, Elements)
			}),
			Border = ReactModule.createElement(ViewModule, {
				LayoutOrder = 2,
				tag = "position-bottom-left anchor-bottom-left",
				Size = UDim2.new(1, 0, 0, UseTokensModuleResult.Stroke.Standard),
				backgroundStyle = UseTokensModuleResult.Color.Stroke.Default,
				testId = `{WithDefaultsModuleResult.testId}--border`
			})
		}),
		AnimatedBorder = ReactModule.createElement(ViewModule, {
			LayoutOrder = 0,
			tag = "anchor-bottom-left bg-system-contrast",
			ZIndex = WithDefaultsModuleResult.ZIndex + 1,
			Size = UseAnimatedHighlightModuleResult.highlightWidth:map(function(XOffset): UDim2 --[[ Line: 154 ]]
				-- upvalues: Standard (copy)
				return UDim2.fromOffset(XOffset, Standard)
			end),
			Position = ReactModule.joinBindings({
				UseAnimatedHighlightModuleResult.highlightPosition,
				UseAnimatedHighlightModuleResult.activeItemHeight
			}):map(function(Entry): UDim2 --[[ Line: 158 ]]
				return UDim2.fromOffset(Entry[1], Entry[2])
			end),
			testId = `{WithDefaultsModuleResult.testId}--animated-border`
		})
	})
end))