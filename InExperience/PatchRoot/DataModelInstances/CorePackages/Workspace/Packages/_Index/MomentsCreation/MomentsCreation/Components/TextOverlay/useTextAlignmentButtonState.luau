local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local DashModule = require(Parent.Dash)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local UseCallbackFunction = ReactModule.useCallback
local UseMemoFunction = ReactModule.useMemo
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local EventNames = MomentsCommonModule.Analytics.EventNames
local FireAnalyticsEventModule = require(MomentsCreation.Analytics.fireAnalyticsEvent)
local MakeCreationEventFieldsModule = require(MomentsCreation.Analytics.makeCreationEventFields)
local FFlagMomentsTextOverlayV2Redesign = MomentsCommonModule.Flags.FFlagMomentsTextOverlayV2Redesign
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local _ = require(Parent.MomentsTypes)
local TextXAlignments = {
	Enum.TextXAlignment.Center,
	Enum.TextXAlignment.Left,
	Enum.TextXAlignment.Right
}
local config = {
	[Enum.TextXAlignment.Left.Name] = BuilderIconsModule.Icon.FourBarsHorizontalRightAligned,
	[Enum.TextXAlignment.Center.Name] = BuilderIconsModule.Icon.FourBarsHorizontalCenterAligned,
	[Enum.TextXAlignment.Right.Name] = BuilderIconsModule.Icon.FourBarsHorizontalLeftAligned
}

local function _(p1)
	-- upvalues: TextXAlignments (copy)
	for i, textXAlignment in TextXAlignments do
		if textXAlignment == p1 then
			return TextXAlignments[i % #TextXAlignments + 1]
		end
	end
	return Enum.TextXAlignment.Center
end

return function(p2)
	-- upvalues: UseMemoFunction (copy), SignalsModule (copy), UseSignalStateFunction (copy), UseCallbackFunction (copy), TextXAlignments (copy), DashModule (copy), FFlagMomentsTextOverlayV2Redesign (copy), FireAnalyticsEventModule (copy), EventNames (copy), MakeCreationEventFieldsModule (copy), config (copy), BuilderIconsModule (copy)
	return {
		icon = config[UseSignalStateFunction((UseMemoFunction(function()
			-- upvalues: SignalsModule (upval), p2 (copy)
			return SignalsModule.createComputed(function(p3)
				-- upvalues: p2 (upval)
				local ActiveSession = p2.getActiveSession(p3)
				local Draft = if ActiveSession == nil then nil else ActiveSession.getDraft(p3)
				local DraftEntry = Draft and Draft[1]
				
				return if DraftEntry == nil then Enum.TextXAlignment.Center else DraftEntry.textOverlayStyle.textXAlignment
			end)
		end, { p2 }))).Name] or BuilderIconsModule.Icon.FourBarsHorizontalCenterAligned,
		onActivated = UseCallbackFunction(function()
			-- upvalues: p2 (copy), TextXAlignments (upval), DashModule (upval), FFlagMomentsTextOverlayV2Redesign (upval), FireAnalyticsEventModule (upval), EventNames (upval), MakeCreationEventFieldsModule (upval)
			local ActiveSession = p2.getActiveSession(false)
			
			if ActiveSession == nil then return end
			local Draft = ActiveSession.getDraft(false)
			local DraftEntry = Draft and Draft[1]
			
			if DraftEntry == nil then return end
			local TextXAlignment = DraftEntry.textOverlayStyle.textXAlignment
			local TextXAlignment1 = nil
			
			for i, textXAlignment in TextXAlignments do
				if textXAlignment == TextXAlignment then
					TextXAlignment1 = TextXAlignments[i % #TextXAlignments + 1]
					ActiveSession.update({
						DashModule.joinDeep(DraftEntry, { textOverlayStyle = { textXAlignment = TextXAlignment1 } })
					})
					
					if FFlagMomentsTextOverlayV2Redesign then
						FireAnalyticsEventModule(EventNames.EditingFlowTextOverlayAlignmentSelected, MakeCreationEventFieldsModule.makeTextOverlayEventFields({ alignment = TextXAlignment1.Name }))
					end
					return
				end
			end
			TextXAlignment1 = Enum.TextXAlignment.Center
		end, { p2 })
	}
end