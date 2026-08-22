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

local function resolveControls(p0) --[[ line: 177 ]]
	-- upvalues: storyControlsModule (ref), frozen_1 (ref), t_2 (ref), unknownModule (ref)
	local var23 = storyControlsModule.merge(frozen_1, p0)
	var23 = if t_2[var23.scenario] ~= nil then frozen_1.scenario else var23.scenario
	local var24 = storyControlsModule.positiveInteger(var23.itemCount, frozen_1.itemCount)
	local var25 = if var23.axis == "horizontal" then "horizontal" else "vertical"
	local var26 = storyControlsModule.resolveAxis(var25, unknownModule)
	local lowerText = string.lower(tostring(var23.alignment))
	
	if lowerText ~= "start" and lowerText ~= "end" then
		lowerText = "center"
	end
	return {
		scenario = var23,
		itemCount = var24,
		overscan = storyControlsModule.nonNegativeNumber(var23.overscan, frozen_1.overscan),
		axis = var26,
		axisName = var25,
		jumpTarget = math.clamp(storyControlsModule.positiveInteger(var23.jumpTarget, frozen_1.jumpTarget), 1, var24),
		alignment = storyControlsModule.resolveAlignment(lowerText, unknownModule),
		alignmentName = lowerText,
		diagnostics = var23.diagnostics ~= false,
		itemLength = storyControlsModule.positiveInteger(var23.itemLength, frozen_1.itemLength),
		spacing = storyControlsModule.nonNegativeNumber(var23.spacing, frozen_1.spacing),
		shortLength = storyControlsModule.positiveInteger(var23.shortLength, frozen_1.shortLength),
		longLength = storyControlsModule.positiveInteger(var23.longLength, frozen_1.longLength),
		measuredEstimate = storyControlsModule.positiveInteger(var23.measuredEstimate, frozen_1.measuredEstimate),
		presentationMode = storyControlsModule.resolvePresentationMode(var23.presentationMode, unknownModule)
	}
end

local function mergeControls(...) --[[ line: 210 ]]
	-- upvalues: frozen_1 (ref), storyControlsModule (ref)
	local cloned = table.clone(frozen_1)
	
	for i, v in { ... } do
		cloned = storyControlsModule.merge(cloned, v)
	end
	return cloned
end

local function createLayout(p1) --[[ line: 218 ]]
	-- upvalues: frozen (ref), unknownModule (ref)
	if p1.scenario == frozen.KnownVariable then
		local var29 = p1.shortLength + p1.longLength + 2 * p1.spacing
		
		return unknownModule.Layout.create({
			getItemLayout = function(p2) --[[ line: 222 ]]
				-- upvalues: var29 (ref), p1 (ref)
				local var30 = p2 % 2 == 1
				
				return {
					startOffset = (p2 - 1) // 2 * var29 + (if var30 then 0 else p1.shortLength + p1.spacing),
					length = if var30 then p1.shortLength else p1.longLength
				}
			end
		})
	end
	return if p1.scenario == frozen.Measured then unknownModule.Layout.measured({ estimatedItemLength = p1.measuredEstimate }) else unknownModule.Layout.uniform({ itemLength = p1.itemLength, spacing = p1.spacing })
end

local function createItems(p3, p4, p5, p6, p7) --[[ line: 243 ]]
	-- upvalues: frozen (ref), rowFixturesModule (ref)
	return if p3 == frozen.KnownVariable then rowFixturesModule.buildKnownVariableRows(p4, p5, p6) elseif p3 == frozen.Measured then rowFixturesModule.buildMeasuredRows(p4, p7) elseif p3 == frozen.Fixed then rowFixturesModule.buildLogRows(p4) else rowFixturesModule.buildSimpleRows(p4)
end

local function LayoutScrollPlayground(value) --[[ line: 255 ]]
	-- upvalues: resolveControls (ref), reactModule (ref), useManagedLayoutModule (ref), createLayout (ref), createItems (ref), recyclingStatsModule (ref), frozen (ref), t_2 (ref), createElement (ref), storyShellModule (ref), jumpControlsModule (ref), unknownModule (ref), rowFixturesModule (ref)
	local var31 = resolveControls(value.controls)
	local var32, var33 = reactModule.useState(0)
	local var34 = useManagedLayoutModule(reactModule, function() --[[ line: 258 ]]
		-- upvalues: createLayout (copy), var31 (ref)
		return createLayout(var31)
	end, {
		var31.itemLength, var31.longLength, var31.measuredEstimate, var31.scenario,
		var31.shortLength, var31.spacing, var32
	})
	local scenario = var31.scenario
	local itemCount = var31.itemCount
	local shortLength = var31.shortLength
	local longLength = var31.longLength
	local spacing = var31.spacing
	local var35 = reactModule.useMemo(function() --[[ line: 274 ]]
		-- upvalues: createItems (copy), scenario (ref), itemCount (ref), shortLength (ref), longLength (ref), spacing (ref)
		return createItems(scenario, itemCount, shortLength, longLength, spacing)
	end, {
		itemCount,
		longLength,
		scenario,
		shortLength,
		spacing
	})
	local var36, var37 = recyclingStatsModule.useStats()
	local var38 = reactModule.useRef(nil)
	local var39 = reactModule.useRef(0)
	local var40 = reactModule.useRef(0)
	local var41 = reactModule.useRef("")
	local var42 = reactModule.useRef(var31)
	var42.current = var31
	var41.current = recyclingStatsModule.format(var36)
	local var43, var44 = reactModule.useBinding("")
	local var45 = reactModule.useCallback(function() --[[ line: 287 ]]
		-- upvalues: var42 (ref), frozen (copy), var39 (ref), var44 (ref), var41 (ref), var40 (ref)
		local current = var42.current
		local var49 = ""
		
		if current.scenario == frozen.Fixed then
			local var50 = current.itemLength + current.spacing
			local clampedValue = math.clamp(math.floor(var39.current / var50) + 1, 1, current.itemCount)
			var49 = `   Visible: {clampedValue}\226\128\147{math.min(current.itemCount, clampedValue + math.ceil(500 / var50))} / {current.itemCount}   Range: {math.round(current.itemCount * var50 - current.spacing)}px`
		end
		var44(`{var41.current}   Offset: {math.round(var39.current)}px{var49}   Diagnostics: {var40.current}`)
	end, { var44 })
	local var46 = reactModule.useCallback(function(p8) --[[ line: 301 ]]
		-- upvalues: var39 (ref), var45 (ref)
		var39.current = p8
		var45()
	end, { var45 })
	local var47 = reactModule.useCallback(function(_) --[[ line: 305 ]]
		-- upvalues: var40 (ref), var45 (ref)
		var40.current += 1
		var45()
	end, { var45 })
	reactModule.useEffect(var45, { var36, var45 })
	local details = value.details or t_2[var31.scenario]
	
	return createElement(recyclingStatsModule.Provider, { actions = var37 }, {
		Shell = createElement(storyShellModule.Component, {
			acceptanceCriteria = details.acceptanceCriteria,
			instructions = details.instructions,
			itemUpdate = details.itemUpdate,
			size = UDim2.fromOffset(760, 700),
			status = var43,
			title = `Layout & Scroll Playground \226\128\148 {details.title}`,
			toolbar = createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				Jumps = createElement(jumpControlsModule, {
					alignment = var31.alignment,
					itemCount = var31.itemCount,
					listRef = var38,
					target = var31.jumpTarget
				}),
				ResetEstimate = if var31.scenario == frozen.Measured then createElement("TextButton", {
					Position = UDim2.fromOffset(424, 6),
					Size = UDim2.fromOffset(132, 30),
					Text = "Reset estimate",
					[reactModule.Event.Activated] = function() --[[ line: 337 ]]
						-- upvalues: var33 (ref)
						var33(function(p9) --[[ line: 338 ]]
							return p9 + 1
						end)
					end
				}) else nil
			})
		}, {
			List = createElement(unknownModule.VirtualList, {
				axis = var31.axis,
				data = { items = var35, getItemKey = rowFixturesModule.getItemKey },
				diagnostics = if var31.diagnostics then var47 else nil,
				itemType = if var31.scenario == frozen.Measured then if var31.presentationMode == "ReadyOnAssignment" then rowFixturesModule.ImmediateMeasuredRow else rowFixturesModule.MeasuredRow elseif var31.presentationMode == "ReadyOnAssignment" then rowFixturesModule.ImmediateSimpleRow else rowFixturesModule.SimpleRow,
				layout = var34,
				listRef = var38,
				onScrollOffsetChanged = var46,
				overscan = var31.overscan
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
	createPreset = function(value) --[[ line: 379 ]]
		-- upvalues: t_1 (ref), createElement (ref), LayoutScrollPlayground (ref), mergeControls (ref), reactModule (ref)
		local var52 = t_1[value]
		assert(var52 ~= nil, `Unknown LayoutScrollPlayground preset {value}`)
		
		return {
			name = var52.name,
			summary = var52.summary,
			roact = reactModule,
			story = function(value) --[[ line: 383 ]]
				-- upvalues: createElement (copy), LayoutScrollPlayground (copy), mergeControls (copy), var52 (ref)
				return createElement(LayoutScrollPlayground, {
					controls = mergeControls(var52.values, value and value.controls),
					details = var52.details
				})
			end,
			controls = var52.controls,
			presetControls = var52.values
		}
	end
}