local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local signalsModule = require(parent_1.Signals)
local signalsReactModule = require(parent_1.SignalsReact)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local _ = require(parent_1.LeaderboardStore)
local statCellModule = require(parent.Components.Presentation.StatCell)
local constantsModule = require(parent.Common.Constants)
local _ = require(parent.Common.computeStatColumns)
local gameTextTranslatorContextModule = require(parent.Common.GameTextTranslatorContext)
local fFlagPlayerListLocalizeGameTextModule = require(parent.Flags.FFlagPlayerListLocalizeGameText)
local usePreferredTransparencyBindingModule = require(parent.Hooks.usePreferredTransparencyBinding)
local ROW_FLEX_TAG = constantsModule.ROW_FLEX_TAG
local TEAM_LAYOUT_MULTIPLIER = constantsModule.TEAM_LAYOUT_MULTIPLIER

return reactModule.memo(function(p0) --[[ line: 25 | named "TeamEntryView" ]]
	-- upvalues: fFlagPlayerListLocalizeGameTextModule (ref), reactModule (ref), gameTextTranslatorContextModule (ref), signalsReactModule (ref), usePreferredTransparencyBindingModule (ref), signalsModule (ref), TEAM_LAYOUT_MULTIPLIER (ref), view (ref), text (ref), statCellModule (ref), ROW_FLEX_TAG (ref)
	local var9 = if fFlagPlayerListLocalizeGameTextModule then reactModule.useContext(gameTextTranslatorContextModule) else nil
	local var10 = signalsReactModule.useSignalBinding(p0.name)
	local var11 = if fFlagPlayerListLocalizeGameTextModule then reactModule.useMemo(function() --[[ line: 42 ]]
		-- upvalues: var9 (ref), var10 (ref)
		return if var9 then var10:map(var9) else var10
	end, { var9, var10 }) else var10
	local var12 = signalsReactModule.useSignalBinding(p0.color)
	local var13 = usePreferredTransparencyBindingModule()
	local rowHeight = p0.rowHeight
	local var14 = signalsReactModule.useSignalBinding(reactModule.useMemo(function() --[[ line: 50 ]]
		-- upvalues: signalsModule (copy), p0 (ref), TEAM_LAYOUT_MULTIPLIER (copy)
		return signalsModule.createComputed(function(p1) --[[ line: 51 ]]
			-- upvalues: p0 (copy), TEAM_LAYOUT_MULTIPLIER (copy)
			return if p0.order then p0.order(p1) * TEAM_LAYOUT_MULTIPLIER else p0.layoutOrder or 0
		end)
	end, { p0.order, p0.layoutOrder }))
	local t = {
		NameLabel = reactModule.createElement(view, { LayoutOrder = 1, tag = "fill size-0-full clip" }, {
			Label = reactModule.createElement(text, {
				tag = "size-full text-label-small text-align-x-left content-emphasis",
				Text = var11
			})
		})
	}
	
	if p0.statColumns then
		for i, v in ipairs(p0.statColumns) do
			t[`TeamStat_{v.name}`] = reactModule.createElement(statCellModule, {
				textTag = "text-label-small content-emphasis",
				statName = v.name,
				playerStat = if p0.teamStats then p0.teamStats.getData(v.name, false) else nil,
				statWidth = p0.statWidth,
				rowHeight = rowHeight,
				layoutOrder = i + 1
			})
		end
	end
	return reactModule.createElement(view, {
		Size = UDim2.new(1, 0, 0, rowHeight),
		backgroundStyle = reactModule.useMemo(function() --[[ line: 86 ]]
			-- upvalues: reactModule (copy), var12 (ref), var13 (ref)
			return reactModule.joinBindings({ color = var12, pt = var13 }):map(function(p2) --[[ line: 90 ]]
				return { Color3 = p2.color, Transparency = 0.5 * p2.pt }
			end)
		end, { var12, var13 }),
		LayoutOrder = var14
	}, {
		RowContent = reactModule.createElement(view, { tag = `size-full {ROW_FLEX_TAG}` }, t)
	})
end)