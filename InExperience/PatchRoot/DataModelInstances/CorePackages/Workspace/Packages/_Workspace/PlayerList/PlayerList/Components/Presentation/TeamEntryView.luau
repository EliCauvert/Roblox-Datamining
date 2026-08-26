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

return reactModule.memo(function(p1)
	-- upvalues: fFlagPlayerListLocalizeGameTextModule (ref), reactModule (ref), gameTextTranslatorContextModule (ref), signalsReactModule (ref), usePreferredTransparencyBindingModule (ref), signalsModule (ref), TEAM_LAYOUT_MULTIPLIER (ref), view (ref), text (ref), statCellModule (ref), constantsModule (ref), ROW_FLEX_TAG (ref)
	local var1 = if fFlagPlayerListLocalizeGameTextModule then reactModule.useContext(gameTextTranslatorContextModule) else nil
	local var2 = signalsReactModule.useSignalBinding(p1.name)
	local var3 = if fFlagPlayerListLocalizeGameTextModule then reactModule.useMemo(function()
		-- upvalues: var1 (ref), var2 (ref)
		return if var1 then var2:map(var1) else var2
	end, { var1, var2 }) else var2
	local var4 = signalsReactModule.useSignalBinding(p1.color)
	local var5 = usePreferredTransparencyBindingModule()
	local rowHeight = p1.rowHeight
	local var6 = signalsReactModule.useSignalBinding(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p1 (ref), TEAM_LAYOUT_MULTIPLIER (copy)
		return signalsModule.createComputed(function(p2)
			-- upvalues: p1 (copy), TEAM_LAYOUT_MULTIPLIER (copy)
			return if p1.order then p1.order(p2) * TEAM_LAYOUT_MULTIPLIER else p1.layoutOrder or 0
		end)
	end, { p1.order, p1.layoutOrder }))
	local t = {
		NameLabel = reactModule.createElement(view, { LayoutOrder = 1, tag = "fill size-0-full clip" }, {
			Label = reactModule.createElement(text, {
				tag = "size-full text-label-small text-align-x-left content-emphasis",
				Text = var3
			})
		})
	}
	
	if p1.statColumns then
		for i, v in ipairs(p1.statColumns) do
			t[`TeamStat_{v.name}`] = reactModule.createElement(statCellModule, {
				textTag = "text-label-small content-emphasis",
				statName = v.name,
				playerStat = if p1.teamStats then p1.teamStats.getData(v.name, false) else nil,
				statWidth = p1.statWidth,
				rowHeight = rowHeight,
				layoutOrder = i + 1
			})
		end
	end
	return reactModule.createElement(view, {
		testId = "team-entry-view",
		Size = UDim2.new(1, 0, 0, rowHeight),
		backgroundStyle = reactModule.useMemo(function()
			-- upvalues: reactModule (copy), var4 (ref), var5 (ref)
			return reactModule.joinBindings({ color = var4, pt = var5 }):map(function(p2)
				return { Color3 = p2.color, Transparency = 0.5 * p2.pt }
			end)
		end, { var4, var5 }),
		LayoutOrder = var6,
		selection = constantsModule.NOT_SELECTABLE
	}, {
		RowContent = reactModule.createElement(view, { tag = `size-full {ROW_FLEX_TAG}` }, t)
	})
end)