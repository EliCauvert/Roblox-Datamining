local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
assert(viewRecyclerReact ~= nil, "LayoutScrollPlayground must be mounted under view-recycler-react")
local jumpControlsModule = require(script.Parent.Harness.JumpControls)
local reactModule = require(viewRecyclerReact.Parent.React)
local recyclingStatsModule = require(script.Parent.Harness.RecyclingStats)
local rowFixturesModule = require(script.Parent.Harness.RowFixtures)
local storyControlsModule = require(script.Parent.Harness.StoryControls)
local storyShellModule = require(script.Parent.Harness.StoryShell)
local unknownModule = require(viewRecyclerReact)
local useManagedLayoutModule = require(script.Parent.Harness.useManagedLayout)
local createElement = reactModule.createElement
local frozen = table.freeze({
	Fixed = "fixed",
	KnownVariable = "knownVariable",
	Measured = "measured"
})
local frozen_1 = table.freeze({
	itemCount = 1000,
	overscan = 2,
	axis = "vertical",
	jumpTarget = 500,
	alignment = "center",
	diagnostics = true,
	itemLength = 44,
	spacing = 4,
	shortLength = 48,
	longLength = 96,
	measuredEstimate = 72,
	presentationMode = "untilCommit",
	scenario = frozen.Fixed
})
local t = {
	scenario = { frozen.Fixed, frozen.KnownVariable, frozen.Measured },
	itemCount = storyControlsModule.options(frozen_1.itemCount, { 100, 5000, 10000, 100000 }),
	overscan = storyControlsModule.OverscanOptions,
	axis = storyControlsModule.AxisOptions,
	jumpTarget = frozen_1.jumpTarget,
	alignment = storyControlsModule.AlignmentOptions,
	diagnostics = frozen_1.diagnostics,
	itemLength = frozen_1.itemLength,
	spacing = frozen_1.spacing,
	shortLength = frozen_1.shortLength,
	longLength = frozen_1.longLength,
	measuredEstimate = frozen_1.measuredEstimate,
	presentationMode = storyControlsModule.PresentationModeOptions
}
local frozen_2 = table.freeze({
	itemCount = 100000,
	jumpTarget = 50000,
	itemLength = 44,
	spacing = 4,
	scenario = frozen.Fixed
})
local frozen_3 = table.freeze({
	itemCount = 1000,
	jumpTarget = 500,
	itemLength = 44,
	spacing = 4,
	scenario = frozen.Fixed
})
local frozen_4 = table.freeze({
	itemCount = 1000,
	jumpTarget = 500,
	shortLength = 48,
	longLength = 96,
	spacing = 6,
	scenario = frozen.KnownVariable
})
local frozen_5 = table.freeze({
	itemCount = 5000,
	jumpTarget = 2500,
	axis = "vertical",
	measuredEstimate = 72,
	spacing = 6,
	scenario = frozen.Measured
})
local t_1 = {
	FixedFocused = {
		name = "Fixed Sizes",
		summary = "Provides a focused uniform-row scenario for tuning fixed item geometry and scroll alignment.",
		details = {
			title = "Fixed Sizes",
			instructions = "Tune item length, spacing, alignment, and overscan while scrolling a focused uniform list.",
			itemUpdate = "Comparison \226\128\148 render-driven ReadyOnCommit or binding-driven ReadyOnAssignment rows.",
			acceptanceCriteria = "Uniform rows remain aligned and mounted hosts stay bounded near the rendered range."
		},
		values = frozen_3,
		controls = {
			diagnostics = true,
			itemCount = storyControlsModule.options(frozen_3.itemCount, { 100, 5000, 10000 }),
			overscan = storyControlsModule.OverscanOptions,
			axis = storyControlsModule.AxisOptions,
			jumpTarget = frozen_3.jumpTarget,
			alignment = storyControlsModule.AlignmentOptions,
			itemLength = frozen_3.itemLength,
			spacing = frozen_3.spacing,
			presentationMode = storyControlsModule.PresentationModeOptions
		}
	},
	Fixed = {
		name = "100K Row Viewport",
		summary = "Demonstrates bounded recycling and random access across 100,000 uniform log rows.",
		values = frozen_2,
		controls = {
			diagnostics = true,
			itemCount = storyControlsModule.options(frozen_2.itemCount, { 1000, 10000, 50000 }),
			overscan = storyControlsModule.OverscanOptions,
			axis = storyControlsModule.AxisOptions,
			jumpTarget = frozen_2.jumpTarget,
			alignment = storyControlsModule.AlignmentOptions,
			itemLength = frozen_2.itemLength,
			spacing = frozen_2.spacing,
			presentationMode = storyControlsModule.PresentationModeOptions
		}
	},
	KnownVariable = {
		name = "Known Variable Sizes",
		summary = "Uses exact alternating row geometry for measurement-free distant jumps.",
		values = frozen_4,
		controls = {
			diagnostics = true,
			itemCount = storyControlsModule.options(frozen_4.itemCount, { 100, 500, 5000 }),
			overscan = storyControlsModule.OverscanOptions,
			axis = storyControlsModule.AxisOptions,
			jumpTarget = frozen_4.jumpTarget,
			alignment = storyControlsModule.AlignmentOptions,
			shortLength = frozen_4.shortLength,
			longLength = frozen_4.longLength,
			spacing = frozen_4.spacing,
			presentationMode = storyControlsModule.PresentationModeOptions
		}
	},
	Measured = {
		name = "Dynamic Measured Rows",
		summary = "Shows estimated row geometry correcting as wrapped text is measured.",
		values = frozen_5,
		controls = {
			diagnostics = true,
			itemCount = storyControlsModule.options(frozen_5.itemCount, { 100, 1000, 10000 }),
			overscan = storyControlsModule.OverscanOptions,
			jumpTarget = frozen_5.jumpTarget,
			alignment = storyControlsModule.AlignmentOptions,
			measuredEstimate = frozen_5.measuredEstimate,
			spacing = frozen_5.spacing,
			presentationMode = storyControlsModule.PresentationModeOptions
		}
	}
}
local t_2 = {
	[frozen.Fixed] = {
		title = "100K Row Viewport",
		instructions = "Scroll the event log, jump to the middle and either boundary, then vary alignment, row geometry, and overscan.",
		itemUpdate = "Comparison \226\128\148 render-driven ReadyOnCommit or binding-driven ReadyOnAssignment rows.",
		acceptanceCriteria = "Random access remains immediate, rows stay aligned, and mounted hosts remain bounded near the visible range regardless of total row count."
	},
	[frozen.KnownVariable] = {
		title = "Known Variable Sizes",
		instructions = "Jump between distant alternating short/long rows, then vary both exact lengths and spacing.",
		itemUpdate = "Comparison \226\128\148 render-driven ReadyOnCommit or binding-driven ReadyOnAssignment rows.",
		acceptanceCriteria = "Alternating geometry has no overlap or gaps beyond spacing, and start/center/end jumps land exactly without measurement correction."
	},
	[frozen.Measured] = {
		title = "Dynamic Measured Rows",
		instructions = "Use a vertical axis, vary row spacing, jump deep into wrapped content, and compare the initial estimate with the corrected scroll position.",
		itemUpdate = "Comparison \226\128\148 measured render-driven or fully binding-driven rows.",
		acceptanceCriteria = "A deep jump may land from estimated geometry, then its target reaches the requested start, center, or end alignment as measurements settle; scrolling manually releases that target anchor."
	}
}

local function resolveControls(p1)
	-- upvalues: storyControlsModule (ref), frozen_1 (ref), t_2 (ref), unknownModule (ref)
	local var1 = storyControlsModule.merge(frozen_1, p1)
	var1 = if t_2[var1.scenario] ~= nil then frozen_1.scenario else var1.scenario
	local var2 = storyControlsModule.positiveInteger(var1.itemCount, frozen_1.itemCount)
	local var3 = if var1.axis == "horizontal" then "horizontal" else "vertical"
	local var4 = storyControlsModule.resolveAxis(var3, unknownModule)
	local lowerText = string.lower(tostring(var1.alignment))
	
	if lowerText ~= "start" and lowerText ~= "end" then
		lowerText = "center"
	end
	return {
		scenario = var1,
		itemCount = var2,
		overscan = storyControlsModule.nonNegativeNumber(var1.overscan, frozen_1.overscan),
		axis = var4,
		axisName = var3,
		jumpTarget = math.clamp(storyControlsModule.positiveInteger(var1.jumpTarget, frozen_1.jumpTarget), 1, var2),
		alignment = storyControlsModule.resolveAlignment(lowerText, unknownModule),
		alignmentName = lowerText,
		diagnostics = var1.diagnostics ~= false,
		itemLength = storyControlsModule.positiveInteger(var1.itemLength, frozen_1.itemLength),
		spacing = storyControlsModule.nonNegativeNumber(var1.spacing, frozen_1.spacing),
		shortLength = storyControlsModule.positiveInteger(var1.shortLength, frozen_1.shortLength),
		longLength = storyControlsModule.positiveInteger(var1.longLength, frozen_1.longLength),
		measuredEstimate = storyControlsModule.positiveInteger(var1.measuredEstimate, frozen_1.measuredEstimate),
		presentationMode = storyControlsModule.resolvePresentationMode(var1.presentationMode, unknownModule)
	}
end

local function mergeControls(...)
	-- upvalues: frozen_1 (ref), storyControlsModule (ref)
	local cloned = table.clone(frozen_1)
	
	for i, v in { ... } do
		cloned = storyControlsModule.merge(cloned, v)
	end
	return cloned
end

local function createLayout(p1)
	-- upvalues: frozen (ref), unknownModule (ref)
	if p1.scenario == frozen.KnownVariable then
		local var1 = p1.shortLength + p1.longLength + 2 * p1.spacing
		
		return unknownModule.Layout.create({
			getItemLayout = function(p2)
				-- upvalues: var1 (ref), p1 (ref)
				local var2 = p2 % 2 == 1
				
				return {
					startOffset = (p2 - 1) // 2 * var1 + (if var2 then 0 else p1.shortLength + p1.spacing),
					length = if var2 then p1.shortLength else p1.longLength
				}
			end
		})
	end
	return if p1.scenario == frozen.Measured then unknownModule.Layout.measured({ estimatedItemLength = p1.measuredEstimate }) else unknownModule.Layout.uniform({ itemLength = p1.itemLength, spacing = p1.spacing })
end

local function createItems(p1, p2, p3, p4, p5)
	-- upvalues: frozen (ref), rowFixturesModule (ref)
	return if p1 == frozen.KnownVariable then rowFixturesModule.buildKnownVariableRows(p2, p3, p4) elseif p1 == frozen.Measured then rowFixturesModule.buildMeasuredRows(p2, p5) elseif p1 == frozen.Fixed then rowFixturesModule.buildLogRows(p2) else rowFixturesModule.buildSimpleRows(p2)
end

local function LayoutScrollPlayground(value)
	-- upvalues: resolveControls (ref), reactModule (ref), useManagedLayoutModule (ref), createLayout (ref), createItems (ref), recyclingStatsModule (ref), frozen (ref), t_2 (ref), createElement (ref), storyShellModule (ref), jumpControlsModule (ref), unknownModule (ref), rowFixturesModule (ref)
	local var1 = resolveControls(value.controls)
	local var2, var3 = reactModule.useState(0)
	local var4 = useManagedLayoutModule(reactModule, function()
		-- upvalues: createLayout (copy), var1 (ref)
		return createLayout(var1)
	end, {
		var1.itemLength, var1.longLength, var1.measuredEstimate, var1.scenario,
		var1.shortLength, var1.spacing, var2
	})
	local scenario = var1.scenario
	local itemCount = var1.itemCount
	local shortLength = var1.shortLength
	local longLength = var1.longLength
	local spacing = var1.spacing
	local var5 = reactModule.useMemo(function()
		-- upvalues: createItems (copy), scenario (ref), itemCount (ref), shortLength (ref), longLength (ref), spacing (ref)
		return createItems(scenario, itemCount, shortLength, longLength, spacing)
	end, {
		itemCount,
		longLength,
		scenario,
		shortLength,
		spacing
	})
	local var6, var7 = recyclingStatsModule.useStats()
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef(0)
	local var10 = reactModule.useRef(0)
	local var11 = reactModule.useRef("")
	local var12 = reactModule.useRef(var1)
	var12.current = var1
	var11.current = recyclingStatsModule.format(var6)
	local var13, var14 = reactModule.useBinding("")
	local var15 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), frozen (copy), var9 (ref), var14 (ref), var11 (ref), var10 (ref)
		local current = var12.current
		local var16 = ""
		
		if current.scenario == frozen.Fixed then
			local var17 = current.itemLength + current.spacing
			local clampedValue = math.clamp(math.floor(var9.current / var17) + 1, 1, current.itemCount)
			var16 = `   Visible: {clampedValue}\226\128\147{math.min(current.itemCount, clampedValue + math.ceil(500 / var17))} / {current.itemCount}   Range: {math.round(current.itemCount * var17 - current.spacing)}px`
		end
		var14(`{var11.current}   Offset: {math.round(var9.current)}px{var16}   Diagnostics: {var10.current}`)
	end, { var14 })
	local var16 = reactModule.useCallback(function(p1)
		-- upvalues: var9 (ref), var15 (ref)
		var9.current = p1
		var15()
	end, { var15 })
	local var17 = reactModule.useCallback(function(_)
		-- upvalues: var10 (ref), var15 (ref)
		var10.current += 1
		var15()
	end, { var15 })
	reactModule.useEffect(var15, { var6, var15 })
	local details = value.details or t_2[var1.scenario]
	
	return createElement(recyclingStatsModule.Provider, { actions = var7 }, {
		Shell = createElement(storyShellModule.Component, {
			acceptanceCriteria = details.acceptanceCriteria,
			instructions = details.instructions,
			itemUpdate = details.itemUpdate,
			size = UDim2.fromOffset(760, 700),
			status = var13,
			title = `Layout & Scroll Playground \226\128\148 {details.title}`,
			toolbar = createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				Jumps = createElement(jumpControlsModule, {
					alignment = var1.alignment,
					itemCount = var1.itemCount,
					listRef = var8,
					target = var1.jumpTarget
				}),
				ResetEstimate = if var1.scenario == frozen.Measured then createElement("TextButton", {
					Position = UDim2.fromOffset(424, 6),
					Size = UDim2.fromOffset(132, 30),
					Text = "Reset estimate",
					[reactModule.Event.Activated] = function()
						-- upvalues: var3 (ref)
						var3(function(p1)
							return p1 + 1
						end)
					end
				}) else nil
			})
		}, {
			List = createElement(unknownModule.VirtualList, {
				axis = var1.axis,
				data = { items = var5, getItemKey = rowFixturesModule.getItemKey },
				diagnostics = if var1.diagnostics then var17 else nil,
				itemType = if var1.scenario == frozen.Measured then if var1.presentationMode == "ReadyOnAssignment" then rowFixturesModule.ImmediateMeasuredRow else rowFixturesModule.MeasuredRow elseif var1.presentationMode == "ReadyOnAssignment" then rowFixturesModule.ImmediateSimpleRow else rowFixturesModule.SimpleRow,
				layout = var4,
				listRef = var8,
				onScrollOffsetChanged = var16,
				overscan = var1.overscan
			})
		})
	})
end

return {
	Component = LayoutScrollPlayground,
	controls = t,
	defaultValues = frozen_1,
	presets = t_1,
	Scenario = frozen,
	mergeControls = mergeControls,
	resolveControls = resolveControls,
	scenarioDetails = t_2,
	createPreset = function(value)
		-- upvalues: t_1 (ref), createElement (ref), LayoutScrollPlayground (ref), mergeControls (ref), reactModule (ref)
		local var1 = t_1[value]
		assert(var1 ~= nil, `Unknown LayoutScrollPlayground preset {value}`)
		
		return {
			name = var1.name,
			summary = var1.summary,
			roact = reactModule,
			story = function(value)
				-- upvalues: createElement (copy), LayoutScrollPlayground (copy), mergeControls (copy), var1 (ref)
				return createElement(LayoutScrollPlayground, {
					controls = mergeControls(var1.values, value and value.controls),
					details = var1.details
				})
			end,
			controls = var1.controls,
			presetControls = var1.values
		}
	end
}