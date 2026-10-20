local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
assert(ViewRecyclerReact ~= nil, "LayoutScrollPlayground must be mounted under view-recycler-react")
local JumpControlsModule = require(script.Parent.Harness.JumpControls)
local ReactModule = require(ViewRecyclerReact.Parent.React)
local RecyclingStatsModule = require(script.Parent.Harness.RecyclingStats)
local RowFixturesModule = require(script.Parent.Harness.RowFixtures)
local StoryControlsModule = require(script.Parent.Harness.StoryControls)
local StoryShellModule = require(script.Parent.Harness.StoryShell)
local Module = require(ViewRecyclerReact)
local UseManagedLayoutModule = require(script.Parent.Harness.useManagedLayout)
local CreateElementFunction = ReactModule.createElement
local Frozen = table.freeze({
	Fixed = "fixed",
	KnownVariable = "knownVariable",
	Measured = "measured"
})
local Frozen1 = table.freeze({
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
	presentationMode = "immediate",
	scenario = Frozen.Fixed
})
local Frozen2 = table.freeze({
	itemCount = 100000,
	jumpTarget = 50000,
	itemLength = 44,
	spacing = 4,
	scenario = Frozen.Fixed
})
local Frozen3 = table.freeze({
	itemCount = 1000,
	jumpTarget = 500,
	itemLength = 44,
	spacing = 4,
	scenario = Frozen.Fixed
})
local Frozen4 = table.freeze({
	itemCount = 1000,
	jumpTarget = 500,
	shortLength = 48,
	longLength = 96,
	spacing = 6,
	scenario = Frozen.KnownVariable
})
local Frozen5 = table.freeze({
	itemCount = 5000,
	jumpTarget = 2500,
	axis = "vertical",
	measuredEstimate = 72,
	spacing = 6,
	scenario = Frozen.Measured
})
local Presets = {
	FixedFocused = {
		name = "Fixed Sizes",
		summary = "Provides a focused uniform-row scenario for tuning fixed item geometry and scroll alignment.",
		details = {
			title = "Fixed Sizes",
			instructions = "Tune item length, spacing, alignment, and overscan while scrolling a focused uniform list.",
			itemUpdate = "Comparison — render-driven ReadyOnCommit or binding-driven ReadyOnAssignment rows.",
			acceptanceCriteria = "Uniform rows remain aligned and mounted hosts stay bounded near the rendered range."
		},
		values = Frozen3,
		controls = {
			diagnostics = true,
			itemCount = StoryControlsModule.options(Frozen3.itemCount, { 100, 5000, 10000 }),
			overscan = StoryControlsModule.OverscanOptions,
			axis = StoryControlsModule.AxisOptions,
			jumpTarget = Frozen3.jumpTarget,
			alignment = StoryControlsModule.AlignmentOptions,
			itemLength = Frozen3.itemLength,
			spacing = Frozen3.spacing,
			presentationMode = StoryControlsModule.PresentationModeOptions
		}
	},
	Fixed = {
		name = "100K Row Viewport",
		summary = "Demonstrates bounded recycling and random access across 100,000 uniform log rows.",
		values = Frozen2,
		controls = {
			diagnostics = true,
			itemCount = StoryControlsModule.options(Frozen2.itemCount, { 1000, 10000, 50000 }),
			overscan = StoryControlsModule.OverscanOptions,
			axis = StoryControlsModule.AxisOptions,
			jumpTarget = Frozen2.jumpTarget,
			alignment = StoryControlsModule.AlignmentOptions,
			itemLength = Frozen2.itemLength,
			spacing = Frozen2.spacing,
			presentationMode = StoryControlsModule.PresentationModeOptions
		}
	},
	KnownVariable = {
		name = "Known Variable Sizes",
		summary = "Uses exact alternating row geometry for measurement-free distant jumps.",
		values = Frozen4,
		controls = {
			diagnostics = true,
			itemCount = StoryControlsModule.options(Frozen4.itemCount, { 100, 500, 5000 }),
			overscan = StoryControlsModule.OverscanOptions,
			axis = StoryControlsModule.AxisOptions,
			jumpTarget = Frozen4.jumpTarget,
			alignment = StoryControlsModule.AlignmentOptions,
			shortLength = Frozen4.shortLength,
			longLength = Frozen4.longLength,
			spacing = Frozen4.spacing,
			presentationMode = StoryControlsModule.PresentationModeOptions
		}
	},
	Measured = {
		name = "Dynamic Measured Rows",
		summary = "Shows estimated row geometry correcting as wrapped text is measured.",
		values = Frozen5,
		controls = {
			diagnostics = true,
			itemCount = StoryControlsModule.options(Frozen5.itemCount, { 100, 1000, 10000 }),
			overscan = StoryControlsModule.OverscanOptions,
			jumpTarget = Frozen5.jumpTarget,
			alignment = StoryControlsModule.AlignmentOptions,
			measuredEstimate = Frozen5.measuredEstimate,
			spacing = Frozen5.spacing,
			presentationMode = StoryControlsModule.PresentationModeOptions
		}
	}
}
local ScenarioDetails = {
	[Frozen.Fixed] = {
		title = "100K Row Viewport",
		instructions = "Scroll the event log, jump to the middle and either boundary, then vary alignment, row geometry, and overscan.",
		itemUpdate = "Comparison — render-driven ReadyOnCommit or binding-driven ReadyOnAssignment rows.",
		acceptanceCriteria = "Random access remains immediate, rows stay aligned, and mounted hosts remain bounded near the visible range regardless of total row count."
	},
	[Frozen.KnownVariable] = {
		title = "Known Variable Sizes",
		instructions = "Jump between distant alternating short/long rows, then vary both exact lengths and spacing.",
		itemUpdate = "Comparison — render-driven ReadyOnCommit or binding-driven ReadyOnAssignment rows.",
		acceptanceCriteria = "Alternating geometry has no overlap or gaps beyond spacing, and start/center/end jumps land exactly without measurement correction."
	},
	[Frozen.Measured] = {
		title = "Dynamic Measured Rows",
		instructions = "Use a vertical axis, vary row spacing, jump deep into wrapped content, and compare the initial estimate with the corrected scroll position.",
		itemUpdate = "Comparison — measured render-driven or fully binding-driven rows.",
		acceptanceCriteria = "A deep jump may land from estimated geometry, then its target reaches the requested start, center, or end alignment as measurements settle; scrolling manually releases that target anchor."
	}
}

local function resolveControls(Controls)
	-- upvalues: StoryControlsModule (copy), Frozen1 (copy), ScenarioDetails (copy), Module (copy)
	local MergeResult = StoryControlsModule.merge(Frozen1, Controls)
	local Scenario = if ScenarioDetails[MergeResult.scenario] == nil then Frozen1.scenario else MergeResult.scenario
	local PositiveIntegerResult: number = StoryControlsModule.positiveInteger(MergeResult.itemCount, Frozen1.itemCount)
	local Horizontal: string = if MergeResult.axis == "horizontal" then "horizontal" else "vertical"
	local ResolveAxisResult = StoryControlsModule.resolveAxis(Horizontal, Module)
	local Lowered = string.lower((tostring(MergeResult.alignment)))
	
	if Lowered ~= "start" and Lowered ~= "end" then
		Lowered = "center"
	end
	return {
		scenario = Scenario,
		itemCount = PositiveIntegerResult,
		overscan = StoryControlsModule.nonNegativeNumber(MergeResult.overscan, Frozen1.overscan),
		axis = ResolveAxisResult,
		axisName = Horizontal,
		jumpTarget = math.clamp(StoryControlsModule.positiveInteger(MergeResult.jumpTarget, Frozen1.jumpTarget), 1, PositiveIntegerResult),
		alignment = StoryControlsModule.resolveAlignment(Lowered, Module),
		alignmentName = Lowered,
		diagnostics = MergeResult.diagnostics ~= false,
		itemLength = StoryControlsModule.positiveInteger(MergeResult.itemLength, Frozen1.itemLength),
		spacing = StoryControlsModule.nonNegativeNumber(MergeResult.spacing, Frozen1.spacing),
		shortLength = StoryControlsModule.positiveInteger(MergeResult.shortLength, Frozen1.shortLength),
		longLength = StoryControlsModule.positiveInteger(MergeResult.longLength, Frozen1.longLength),
		measuredEstimate = StoryControlsModule.positiveInteger(MergeResult.measuredEstimate, Frozen1.measuredEstimate),
		presentationMode = StoryControlsModule.resolvePresentationMode(MergeResult.presentationMode, Module)
	}
end

local function mergeControls(...)
	-- upvalues: Frozen1 (copy), StoryControlsModule (copy)
	local Copy = table.clone(Frozen1)
	
	for _, value in { ... } do
		Copy = StoryControlsModule.merge(Copy, value)
	end
	return Copy
end

local function createLayout(Current)
	-- upvalues: Frozen (copy), Module (copy)
	if Current.scenario == Frozen.KnownVariable then
		local NewShortLength = Current.shortLength + Current.longLength + 2 * Current.spacing
		
		return Module.Layout.create({
			getItemLayout = function(p1: number)
				-- upvalues: NewShortLength (copy), Current (copy)
				local v1 = p1 % 2 == 1
				
				return {
					startOffset = (p1 - 1) // 2 * NewShortLength + (if v1 then 0 else Current.shortLength + Current.spacing),
					length = if v1 then Current.shortLength else Current.longLength
				}
			end
		})
	else
		return if Current.scenario == Frozen.Measured then Module.Layout.measured({ estimatedItemLength = Current.measuredEstimate }) else Module.Layout.uniform({
			itemLength = Current.itemLength,
			spacing = Current.spacing
		})
	end
end

local function createItems(Scenario, ItemCount, ShortLength, LongLength, Spacing)
	-- upvalues: Frozen (copy), RowFixturesModule (copy)
	return if Scenario == Frozen.KnownVariable then RowFixturesModule.buildKnownVariableRows(ItemCount, ShortLength, LongLength) elseif Scenario == Frozen.Measured then RowFixturesModule.buildMeasuredRows(ItemCount, Spacing) elseif Scenario == Frozen.Fixed then RowFixturesModule.buildLogRows(ItemCount) else RowFixturesModule.buildSimpleRows(ItemCount)
end

local function LayoutScrollPlayground(p1)
	-- upvalues: resolveControls (copy), ReactModule (copy), UseManagedLayoutModule (copy), createLayout (copy), createItems (copy), RecyclingStatsModule (copy), Frozen (copy), ScenarioDetails (copy), CreateElementFunction (copy), StoryShellModule (copy), JumpControlsModule (copy), Module (copy), RowFixturesModule (copy)
	local ResolveControlsResult = resolveControls(p1.controls)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseManagedLayoutModuleResult = UseManagedLayoutModule(ReactModule, function()
		-- upvalues: createLayout (upval), ResolveControlsResult (copy)
		return createLayout(ResolveControlsResult)
	end, {
		ResolveControlsResult.itemLength, ResolveControlsResult.longLength,
		ResolveControlsResult.measuredEstimate, ResolveControlsResult.scenario,
		ResolveControlsResult.shortLength, ResolveControlsResult.spacing,
		UseStateResult
	})
	local Scenario = ResolveControlsResult.scenario
	local ItemCount = ResolveControlsResult.itemCount
	local ShortLength = ResolveControlsResult.shortLength
	local LongLength = ResolveControlsResult.longLength
	local Spacing = ResolveControlsResult.spacing
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: createItems (upval), Scenario (copy), ItemCount (copy), ShortLength (copy), LongLength (copy), Spacing (copy)
		return createItems(Scenario, ItemCount, ShortLength, LongLength, Spacing)
	end, {
		ItemCount,
		LongLength,
		Scenario,
		ShortLength,
		Spacing
	})
	local UseStatsResult, UseStatsResult2 = RecyclingStatsModule.useStats()
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(0)
	local UseRefResult2 = ReactModule.useRef(0)
	local UseRefResult3 = ReactModule.useRef("")
	local UseRefResult4 = ReactModule.useRef(ResolveControlsResult)
	UseRefResult4.current = ResolveControlsResult
	UseRefResult3.current = RecyclingStatsModule.format(UseStatsResult)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding("")
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult4 (copy), Frozen (upval), UseRefResult1 (copy), UseBindingResult2 (copy), UseRefResult3 (copy), UseRefResult2 (copy)
		local Current = UseRefResult4.current
		local Message = ""
		
		if Current.scenario == Frozen.Fixed then
			local NewItemLength = Current.itemLength + Current.spacing
			local ClampedValue = math.clamp(math.floor(UseRefResult1.current / NewItemLength) + 1, 1, Current.itemCount)
			Message = `   Visible: {ClampedValue}–{math.min(Current.itemCount, ClampedValue + math.ceil(500 / NewItemLength))} / {Current.itemCount}   Range: {math.round(Current.itemCount * NewItemLength - Current.spacing)}px`
		end
		UseBindingResult2(`{UseRefResult3.current}   Offset: {math.round(UseRefResult1.current)}px{Message}   Diagnostics: {UseRefResult2.current}`)
	end, { UseBindingResult2 })
	local UseResult1 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult1 (copy), UseResult (copy)
		UseRefResult1.current = Current
		UseResult()
	end, { UseResult })
	local UseResult2 = ReactModule.useCallback(function(_)
		-- upvalues: UseRefResult2 (copy), UseResult (copy)
		UseRefResult2.current += 1
		UseResult()
	end, { UseResult })
	ReactModule.useEffect(UseResult, { UseStatsResult, UseResult })
	local Details = p1.details or ScenarioDetails[ResolveControlsResult.scenario]
	
	return CreateElementFunction(RecyclingStatsModule.Provider, { actions = UseStatsResult2 }, {
		Shell = CreateElementFunction(StoryShellModule.Component, {
			acceptanceCriteria = Details.acceptanceCriteria,
			instructions = Details.instructions,
			itemUpdate = Details.itemUpdate,
			size = UDim2.fromOffset(760, 700),
			status = UseBindingResult,
			title = `Layout & Scroll Playground — {Details.title}`,
			toolbar = CreateElementFunction("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				Jumps = CreateElementFunction(JumpControlsModule, {
					alignment = ResolveControlsResult.alignment,
					itemCount = ResolveControlsResult.itemCount,
					listRef = UseRefResult,
					target = ResolveControlsResult.jumpTarget
				}),
				ResetEstimate = if ResolveControlsResult.scenario == Frozen.Measured then CreateElementFunction("TextButton", {
					Position = UDim2.fromOffset(424, 6),
					Size = UDim2.fromOffset(132, 30),
					Text = "Reset estimate",
					[ReactModule.Event.Activated] = function()
						-- upvalues: UseStateResult2 (copy)
						UseStateResult2(function(p2: number): number
							return p2 + 1
						end)
					end
				}) else nil
			})
		}, {
			List = CreateElementFunction(Module.VirtualList, {
				axis = ResolveControlsResult.axis,
				data = {
					items = UseMemoResult,
					getItemKey = RowFixturesModule.getItemKey
				},
				diagnostics = if ResolveControlsResult.diagnostics then UseResult2 else nil,
				itemType = if ResolveControlsResult.scenario == Frozen.Measured then if ResolveControlsResult.presentationMode == Module.RecyclableViewReadiness.ReadyOnAssignment then RowFixturesModule.ImmediateMeasuredRow else RowFixturesModule.MeasuredRow elseif ResolveControlsResult.presentationMode == Module.RecyclableViewReadiness.ReadyOnAssignment then RowFixturesModule.ImmediateSimpleRow else RowFixturesModule.SimpleRow,
				layout = UseManagedLayoutModuleResult,
				listRef = UseRefResult,
				onScrollOffsetChanged = UseResult1,
				overscan = ResolveControlsResult.overscan
			})
		})
	})
end

return {
	Component = LayoutScrollPlayground,
	controls = {
		scenario = { Frozen.Fixed, Frozen.KnownVariable, Frozen.Measured },
		itemCount = StoryControlsModule.options(Frozen1.itemCount, { 100, 5000, 10000, 100000 }),
		overscan = StoryControlsModule.OverscanOptions,
		axis = StoryControlsModule.AxisOptions,
		jumpTarget = Frozen1.jumpTarget,
		alignment = StoryControlsModule.AlignmentOptions,
		diagnostics = Frozen1.diagnostics,
		itemLength = Frozen1.itemLength,
		spacing = Frozen1.spacing,
		shortLength = Frozen1.shortLength,
		longLength = Frozen1.longLength,
		measuredEstimate = Frozen1.measuredEstimate,
		presentationMode = StoryControlsModule.PresentationModeOptions
	},
	defaultValues = Frozen1,
	presets = Presets,
	Scenario = Frozen,
	mergeControls = mergeControls,
	resolveControls = resolveControls,
	scenarioDetails = ScenarioDetails,
	createPreset = function(p1)
		-- upvalues: Presets (copy), CreateElementFunction (copy), LayoutScrollPlayground (copy), mergeControls (copy), ReactModule (copy)
		local Preset = Presets[p1]
		assert(Preset ~= nil, `Unknown LayoutScrollPlayground preset {p1}`)
		
		return {
			name = Preset.name,
			summary = Preset.summary,
			roact = ReactModule,
			story = function(p2)
				-- upvalues: CreateElementFunction (upval), LayoutScrollPlayground (upval), mergeControls (upval), Preset (copy)
				return CreateElementFunction(LayoutScrollPlayground, {
					controls = mergeControls(Preset.values, p2 and p2.controls),
					details = Preset.details
				})
			end,
			controls = Preset.controls,
			presetControls = Preset.values
		}
	end
}