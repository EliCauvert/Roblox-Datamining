local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local SignalsModule = require(Parent1.Signals)
local SignalsReactModule = require(Parent1.SignalsReact)
local FoundationModule = require(Parent1.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local _ = require(Parent1.LeaderboardStore)
local StatCellModule = require(Parent.Components.Presentation.StatCell)
local ConstantsModule = require(Parent.Common.Constants)
local _ = require(Parent.Common.computeStatColumns)
local GameTextTranslatorContextModule = require(Parent.Common.GameTextTranslatorContext)
local FFlagPlayerListLocalizeGameTextModule = require(Parent.Flags.FFlagPlayerListLocalizeGameText)
local UsePreferredTransparencyBindingModule = require(Parent.Hooks.usePreferredTransparencyBinding)
local ROWFLEXTAG = ConstantsModule.ROW_FLEX_TAG
local TEAMLAYOUTMULTIPLIER = ConstantsModule.TEAM_LAYOUT_MULTIPLIER

return ReactModule.memo(function(p1)
	-- upvalues: FFlagPlayerListLocalizeGameTextModule (copy), ReactModule (copy), GameTextTranslatorContextModule (copy), SignalsReactModule (copy), UsePreferredTransparencyBindingModule (copy), SignalsModule (copy), TEAMLAYOUTMULTIPLIER (copy), View (copy), Text (copy), StatCellModule (copy), ConstantsModule (copy), ROWFLEXTAG (copy)
	local UseContextResult = if FFlagPlayerListLocalizeGameTextModule then ReactModule.useContext(GameTextTranslatorContextModule) else nil
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding(p1.name)
	local UseSignalBindingResult1 = SignalsReactModule.useSignalBinding(p1.color)
	local UsePreferredTransparencyBindingModuleResult = UsePreferredTransparencyBindingModule()
	local RowHeight = p1.rowHeight
	local UseSignalBindingResult2 = SignalsReactModule.useSignalBinding((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), p1 (copy), TEAMLAYOUTMULTIPLIER (upval)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: p1 (upval), TEAMLAYOUTMULTIPLIER (upval)
			return if p1.order then p1.order(p2) * TEAMLAYOUTMULTIPLIER else p1.layoutOrder or 0
		end)
	end, { p1.order, p1.layoutOrder })))
	local config = {
		NameLabel = ReactModule.createElement(View, { LayoutOrder = 1, tag = "fill size-0-full clip" }, {
			Label = ReactModule.createElement(Text, {
				tag = "size-full text-label-small text-align-x-left content-emphasis",
				Text = if FFlagPlayerListLocalizeGameTextModule then ReactModule.useMemo(function()
					-- upvalues: UseContextResult (copy), UseSignalBindingResult (copy)
					return if UseContextResult then UseSignalBindingResult:map(UseContextResult) else UseSignalBindingResult
				end, { UseContextResult, UseSignalBindingResult }) else UseSignalBindingResult
			})
		})
	}
	
	if p1.statColumns then
		for i, statColumn in ipairs(p1.statColumns) do
			config[`TeamStat_{statColumn.name}`] = ReactModule.createElement(StatCellModule, {
				textTag = "text-label-small content-emphasis",
				statName = statColumn.name,
				playerStat = if p1.teamStats then p1.teamStats.getData(statColumn.name, false) else nil,
				statWidth = p1.statWidth,
				rowHeight = RowHeight,
				layoutOrder = i + 1
			})
		end
	end
	return ReactModule.createElement(View, {
		testId = "team-entry-view",
		Size = UDim2.new(1, 0, 0, RowHeight),
		backgroundStyle = ReactModule.useMemo(function()
			-- upvalues: ReactModule (upval), UseSignalBindingResult1 (copy), UsePreferredTransparencyBindingModuleResult (copy)
			return ReactModule.joinBindings({
				color = UseSignalBindingResult1,
				pt = UsePreferredTransparencyBindingModuleResult
			}):map(function(p2)
				return { Color3 = p2.color, Transparency = 0.5 * p2.pt }
			end)
		end, {
			UseSignalBindingResult1,
			UsePreferredTransparencyBindingModuleResult
		}),
		LayoutOrder = UseSignalBindingResult2,
		selection = ConstantsModule.NOT_SELECTABLE
	}, {
		RowContent = ReactModule.createElement(View, { tag = `size-full {ROWFLEXTAG}` }, config)
	})
end)