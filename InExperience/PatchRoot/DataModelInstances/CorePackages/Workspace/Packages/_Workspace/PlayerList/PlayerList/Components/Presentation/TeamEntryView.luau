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
local GetContrastingContentStyleModule = require(Parent.Common.getContrastingContentStyle)
local FFlagPlayerListContrastingTeamTextModule = require(Parent.Flags.FFlagPlayerListContrastingTeamText)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UsePreferencesFunction = FoundationModule.Hooks.usePreferences
local ROWFLEXTAG = ConstantsModule.ROW_FLEX_TAG
local TEAMLAYOUTMULTIPLIER = ConstantsModule.TEAM_LAYOUT_MULTIPLIER

return ReactModule.memo(function(p1)
	-- upvalues: FFlagPlayerListLocalizeGameTextModule (copy), ReactModule (copy), GameTextTranslatorContextModule (copy), SignalsReactModule (copy), FFlagPlayerListContrastingTeamTextModule (copy), UsePreferencesFunction (copy), UsePreferredTransparencyBindingModule (copy), UseTokensFunction (copy), GetContrastingContentStyleModule (copy), SignalsModule (copy), TEAMLAYOUTMULTIPLIER (copy), Text (copy), View (copy), StatCellModule (copy), ConstantsModule (copy), ROWFLEXTAG (copy)
	local UseContextResult = if FFlagPlayerListLocalizeGameTextModule then ReactModule.useContext(GameTextTranslatorContextModule) else nil
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding(p1.name)
	local UseMemoResult = if FFlagPlayerListLocalizeGameTextModule then ReactModule.useMemo(function()
		-- upvalues: UseContextResult (copy), UseSignalBindingResult (copy)
		return if UseContextResult then UseSignalBindingResult:map(UseContextResult) else UseSignalBindingResult
	end, { UseContextResult, UseSignalBindingResult }) else UseSignalBindingResult
	local UseSignalBindingResult1 = SignalsReactModule.useSignalBinding(p1.color)
	local UsePreferencesResult = if FFlagPlayerListContrastingTeamTextModule then UsePreferencesFunction() else nil
	local PreferredTransparency = if UsePreferencesResult then if UsePreferencesResult.preferredTransparency == nil then 1 else UsePreferencesResult.preferredTransparency else nil
	local UsePreferredTransparencyBindingModuleResult = if FFlagPlayerListContrastingTeamTextModule then nil else UsePreferredTransparencyBindingModule()
	local UseTokensResult = if FFlagPlayerListContrastingTeamTextModule then UseTokensFunction() else nil
	local UseMemoResult1 = if FFlagPlayerListContrastingTeamTextModule then ReactModule.useMemo(function()
		-- upvalues: UseTokensResult (copy), UseSignalBindingResult1 (copy), GetContrastingContentStyleModule (upval), PreferredTransparency (copy)
		local OverMedia200 = UseTokensResult.Color.OverMedia.OverMedia_200
		
		return UseSignalBindingResult1:map(function(p2)
			-- upvalues: GetContrastingContentStyleModule (upval), OverMedia200 (copy), PreferredTransparency (upval), UseTokensResult (upval)
			return GetContrastingContentStyleModule(p2, 0.5, {
				Color3 = OverMedia200.Color3,
				Transparency = OverMedia200.Transparency * PreferredTransparency
			}, UseTokensResult.DarkMode.Content.Emphasis, UseTokensResult.LightMode.Content.Emphasis)
		end)
	end, {
		UseSignalBindingResult1,
		PreferredTransparency,
		UseTokensResult
	}) else nil
	local RowHeight = p1.rowHeight
	local UseSignalBindingResult2 = SignalsReactModule.useSignalBinding((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), p1 (copy), TEAMLAYOUTMULTIPLIER (upval)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: p1 (upval), TEAMLAYOUTMULTIPLIER (upval)
			return if p1.order then p1.order(p2) * TEAMLAYOUTMULTIPLIER else p1.layoutOrder or 0
		end)
	end, { p1.order, p1.layoutOrder })))
	local config = {
		NameLabel = if FFlagPlayerListContrastingTeamTextModule then ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "fill size-0-full text-label-small text-align-x-left clip",
			Text = UseMemoResult,
			textStyle = UseMemoResult1
		}) else ReactModule.createElement(View, { LayoutOrder = 1, tag = "fill size-0-full clip" }, {
			Label = ReactModule.createElement(Text, {
				tag = "size-full text-label-small text-align-x-left content-emphasis",
				Text = UseMemoResult
			})
		})
	}
	
	if p1.statColumns then
		for i, statColumn in ipairs(p1.statColumns) do
			config[`TeamStat_{statColumn.name}`] = ReactModule.createElement(StatCellModule, {
				statName = statColumn.name,
				playerStat = if p1.teamStats then p1.teamStats.getData(statColumn.name, false) else nil,
				statWidth = p1.statWidth,
				rowHeight = RowHeight,
				layoutOrder = i + 1,
				textTag = if FFlagPlayerListContrastingTeamTextModule then nil else "text-label-small content-emphasis",
				fontStyle = if FFlagPlayerListContrastingTeamTextModule then UseTokensResult.Typography.LabelSmall else nil,
				textStyle = UseMemoResult1
			})
		end
	end
	local UseMemoResult2 = if FFlagPlayerListContrastingTeamTextModule then ReactModule.useMemo(function()
		-- upvalues: UseSignalBindingResult1 (copy)
		return UseSignalBindingResult1:map(function(p2)
			return { Transparency = 0.5, Color3 = p2 }
		end)
	end, { UseSignalBindingResult1 }) else ReactModule.useMemo(function()
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
	})
	
	return if FFlagPlayerListContrastingTeamTextModule then ReactModule.createElement(View, {
		testId = "team-entry-view",
		Size = UDim2.new(1, 0, 0, RowHeight),
		backgroundStyle = UseMemoResult2,
		LayoutOrder = UseSignalBindingResult2,
		selection = ConstantsModule.NOT_SELECTABLE,
		tag = ROWFLEXTAG
	}, config) else ReactModule.createElement(View, {
		testId = "team-entry-view",
		Size = UDim2.new(1, 0, 0, RowHeight),
		backgroundStyle = UseMemoResult2,
		LayoutOrder = UseSignalBindingResult2,
		selection = ConstantsModule.NOT_SELECTABLE
	}, {
		RowContent = ReactModule.createElement(View, { tag = `size-full {ROWFLEXTAG}` }, config)
	})
end)