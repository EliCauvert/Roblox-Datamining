local CivilDateModule = require("./civil_date")
local _ = require("./types")
local _ = require("./date_time_picker_types")
local _ = require("./input_props")
local _ = require("../vendor/compose/core")
local DateTimePartsModule = require("./date_time_parts")
local _ = require("./date_time_options")
local _ = require("./date_time_state")
local _ = require("./date_time_calendar")
local DateTimeHeaderModule = require("./date_time_header")
local DateTimeTimeModule = require("./date_time_time")
local GAP = DateTimePartsModule.GAP
local SpanFunction = DateTimePartsModule.span
local MonthOfFunction = DateTimePartsModule.monthOf
local SameRangeFunction = DateTimePartsModule.sameRange

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: DateTimeHeaderModule (copy), DateTimeTimeModule (copy), CivilDateModule (copy), SameRangeFunction (copy), MonthOfFunction (copy), GAP (copy), SpanFunction (copy)
	local Compose = p1.Compose
	local TypesEnum = p1.types.Enum
	local TypesUDim = p1.types.UDim
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local FrameFunction = p3.frame
	local IsRange = p5.isRange
	local WithTime = p5.withTime
	local Draft = p5.draft
	local Overlay = p5.overlay
	local Presets = p5.presets
	local Range = p6.range
	local ViewMonth = p6.viewMonth
	local InteractiveFunction = p6.interactive
	local ProposeFunction = p6.propose
	local CommitFunction = p6.commit
	local TakeSnapshotFunction = p6.takeSnapshot
	local CloseFunction = p6.close
	local PaneFunction = p7.pane
	local DownTarget = p7.downTarget
	local DateTimeHeaderModuleResult = DateTimeHeaderModule(p1, p2, p5, p6, p7)
	local DateTimeTimeModuleResult = DateTimeTimeModule(p1, p2, p5, p6, p7)
	
	local function presetRow()
		-- upvalues: Presets (copy), Compose (copy), CivilDateModule (upval), p6 (copy), SameRangeFunction (upval), Range (copy), InteractiveFunction (copy), ProposeFunction (copy), ViewMonth (copy), MonthOfFunction (upval), Draft (copy), CommitFunction (copy), p2 (copy), p1 (copy)
		local ChipResults = {}
		
		for _, preset in Presets do
			local FormulaResult = Compose.formula(function(Callback)
				-- upvalues: CivilDateModule (upval), preset (copy), p6 (upval)
				return CivilDateModule.clampRange(preset.range(Callback(p6.today)), Callback(p6.minDate), Callback(p6.maxDate))
			end)
			table.insert(ChipResults, p2.Chip({
				controlSize = "compact",
				Name = `Preset-{preset.id}`,
				label = preset.label,
				selected = function(Callback)
					-- upvalues: FormulaResult (copy), SameRangeFunction (upval), Range (upval)
					local CallbackResult = Callback(FormulaResult)
					
					return CallbackResult ~= nil and (CallbackResult.start ~= nil and SameRangeFunction(Callback(Range), CallbackResult))
				end,
				enabled = function(Callback)
					-- upvalues: FormulaResult (copy), InteractiveFunction (upval)
					return Callback(FormulaResult) ~= nil and InteractiveFunction(Callback)
				end,
				onToggle = function(_)
					-- upvalues: FormulaResult (copy), ProposeFunction (upval), ViewMonth (upval), MonthOfFunction (upval), Draft (upval), CommitFunction (upval)
					local PeekResult = FormulaResult:peek()
					
					if PeekResult == nil then return end
					if ProposeFunction(PeekResult) then
						if PeekResult.start ~= nil then
							ViewMonth:set(MonthOfFunction(PeekResult.start))
						end
						if not Draft then
							CommitFunction()
						end
					end
				end
			}))
		end
		return p1.row(ChipResults, { Name = "Presets" })
	end
	
	return function(Callback)
		-- upvalues: DateTimeHeaderModuleResult (copy), p1 (copy), FrameFunction (copy), TypesUDim2 (copy), TypesVector2 (copy), Compose (copy), p6 (copy), PaneFunction (copy), TypesUDim (copy), GAP (upval), TypesEnum (copy), p2 (copy), WithTime (copy), DateTimeTimeModuleResult (copy), Presets (copy), presetRow (copy), InteractiveFunction (copy), Draft (copy), ProposeFunction (copy), IsRange (copy), SpanFunction (upval), TakeSnapshotFunction (copy), CloseFunction (copy), Range (copy), p4 (copy), CommitFunction (copy), DownTarget (copy), Overlay (copy), p7 (copy)
		local List = {
			DateTimeHeaderModuleResult(),
			p1.styled(FrameFunction("HeaderRule", {
				Size = TypesUDim2.new(1, 0, 0, 1),
				AnchorPoint = TypesVector2.zero,
				Position = TypesUDim2.fromScale(0, 0)
			}), "divider")
		}
		local RowResult = p1.row({
			PaneFunction(1),
			(Compose.show(function(Callback)
				-- upvalues: p6 (upval)
				return Callback(p6.dual)
			end, function()
				-- upvalues: PaneFunction (upval)
				local PaneResult = PaneFunction(2)
				PaneResult.LayoutOrder = 2
				
				return PaneResult
			end))
		}, { Name = "Panes" })
		assert(RowResult:FindFirstChildWhichIsA("UIListLayout")).Padding = TypesUDim.new(0, GAP)
		table.insert(List, RowResult)
		local LayoutOrder = #List + 1
		table.insert(List, (Compose.show(function(p8)
			-- upvalues: p6 (upval), TypesEnum (upval)
			return p6.prefers(TypesEnum.PreferredInput.Gamepad, p8)
		end, function()
			-- upvalues: p1 (upval), TypesEnum (upval), p2 (upval), LayoutOrder (copy)
			return p1.row({
				p2.ShortcutHint({
					Name = "PageKeys",
					controlSize = "compact",
					keys = { { "LB" }, { "RB" } }
				}),
				(p1.text({
					Name = "Words",
					Text = "Change month",
					AutomaticSize = TypesEnum.AutomaticSize.XY
				}, nil, "caption"))
			}, { Name = "PageHint", LayoutOrder = LayoutOrder })
		end)))
		
		if WithTime then
			table.insert(List, DateTimeTimeModuleResult())
		end
		if #Presets > 0 then
			table.insert(List, presetRow())
		end
		local function action(p8, Label, Callback, Appearance)
			-- upvalues: p2 (upval), InteractiveFunction (upval)
			return p2.Button(p8)({
				label = Label,
				onActivate = function()
					-- upvalues: Callback (copy)
					Callback()
				end,
				appearance = Appearance,
				enabled = function(p9)
					-- upvalues: InteractiveFunction (upval)
					return InteractiveFunction(p9)
				end
			})
		end
		
		local RowResult1 = nil
		
		if Draft then
			local ResetAll = action("ResetAll", "Reset all", function()
				-- upvalues: ProposeFunction (upval), IsRange (upval), SpanFunction (upval)
				ProposeFunction(if IsRange then SpanFunction(nil, nil) else nil)
			end, "link")
			RowResult1 = p1.row({
				ResetAll,
				(p1.row({
					action("Cancel", "Cancel", function()
						-- upvalues: p6 (upval), TakeSnapshotFunction (upval), CloseFunction (upval)
						p6.restore()
						TakeSnapshotFunction()
						CloseFunction("cancel")
					end),
					(action("Apply", "Apply", function()
						-- upvalues: IsRange (upval), Range (upval), p4 (upval), CommitFunction (upval), TakeSnapshotFunction (upval), CloseFunction (upval)
						if IsRange then
							local PeekResult = Range:peek()
							
							if p4.onRangeCommit ~= nil then
								p4.onRangeCommit(PeekResult)
							end
						else
							CommitFunction()
						end
						TakeSnapshotFunction()
						CloseFunction("apply")
					end, "emphasis"))
				}, { Name = "Commit" }))
			}, {
				Name = "Actions",
				Size = TypesUDim2.new(1, 0, 0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y
			})
			DownTarget:set(DownTarget:peek() or ResetAll)
		elseif Overlay then
			RowResult1 = p1.row({
				(Compose.show(function(p8): boolean
					-- upvalues: Callback (copy)
					return Callback(p8) == "sheet"
				end, function()
					-- upvalues: action (copy), CloseFunction (upval), WithTime (upval), DownTarget (upval), Compose (upval)
					local Done = action("Done", "Done", function()
						-- upvalues: CloseFunction (upval)
						CloseFunction("activate")
					end)
					
					if not WithTime then
						DownTarget:set(Done)
					end
					Compose.cleanup(function()
						-- upvalues: DownTarget (upval), Done (copy)
						if DownTarget:peek() == Done then
							DownTarget:set(nil)
						end
					end)
					
					return Done
				end))
			}, {
				Name = "Actions",
				Size = TypesUDim2.new(1, 0, 0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y,
				Visible = function(p8): boolean
					-- upvalues: Callback (copy)
					return Callback(p8) == "sheet"
				end
			})
		end
		if RowResult1 then
			local v1 = assert(RowResult1:FindFirstChildWhichIsA("UIListLayout"))
			v1.VerticalAlignment = TypesEnum.VerticalAlignment.Center
			v1.HorizontalFlex = if Draft then TypesEnum.UIFlexAlignment.SpaceBetween else TypesEnum.UIFlexAlignment.None
			v1.HorizontalAlignment = TypesEnum.HorizontalAlignment.Right
			table.insert(List, (p1.styled(FrameFunction("FooterRule", {
				Size = TypesUDim2.new(1, 0, 0, 1),
				AnchorPoint = TypesVector2.zero,
				Position = TypesUDim2.fromScale(0, 0),
				Visible = if Draft then true else function(p8): boolean
					-- upvalues: Callback (copy)
					return Callback(p8) == "sheet"
				end
			}), "divider")))
			table.insert(List, RowResult1)
		end
		local ColumnResult = p1.column(List, {
			Name = "Calendar",
			Size = if Overlay then nil else TypesUDim2.new(1, 0, 0, 0),
			AutomaticSize = if Overlay then TypesEnum.AutomaticSize.Y else TypesEnum.AutomaticSize.Y,
			p1.padding(16, 16)
		})
		assert(ColumnResult:FindFirstChildWhichIsA("UIListLayout")).Padding = TypesUDim.new(0, 12)
		p7.navigate(ColumnResult)
		
		return ColumnResult
	end
end