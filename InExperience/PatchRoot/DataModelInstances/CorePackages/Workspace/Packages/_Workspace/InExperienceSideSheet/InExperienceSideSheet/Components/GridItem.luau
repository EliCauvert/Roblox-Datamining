local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local chromeModule = require(parent.Chrome)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local text = foundationModule.Text
local view = foundationModule.View
local iconHostModule = require(script.Parent.IconHost)
local analyticsConstantsModule = require(inExperienceSideSheet.Analytics.AnalyticsConstants)
local sidesheetAnalyticsModule = require(inExperienceSideSheet.Analytics.SidesheetAnalytics)
local toggleSideSheetModule = require(inExperienceSideSheet.Utils.toggleSideSheet)
local useMappedSignal = chromeModule.Hooks.useMappedSignal
local fFlagChromeActivatedMappedSignal = sharedFlagsModule.FFlagChromeActivatedMappedSignal
local keepSideSheetOpenFromGrid = game:DefineFastFlag("KeepSideSheetOpenFromGrid", false)
local fFlagSideSheetFocusNav = sharedFlagsModule.FFlagSideSheetFocusNav

return reactModule.memo(function(p0) --[[ line: 38 | named "GridItem" ]]
	-- upvalues: reactModule (ref), keepSideSheetOpenFromGrid (ref), toggleSideSheetModule (ref), sidesheetAnalyticsModule (ref), analyticsConstantsModule (ref), fFlagSideSheetFocusNav (ref), fFlagChromeActivatedMappedSignal (ref), useMappedSignal (ref), view (ref), iconHostModule (ref), text (ref)
	local var10 = reactModule.useCallback(function() --[[ line: 39 ]]
		-- upvalues: p0 (ref), keepSideSheetOpenFromGrid (copy), toggleSideSheetModule (copy), sidesheetAnalyticsModule (copy), analyticsConstantsModule (copy)
		p0.onActivated()
		
		if not keepSideSheetOpenFromGrid then
			toggleSideSheetModule(false)
			sidesheetAnalyticsModule.logSidesheetClosed(analyticsConstantsModule.Source.ItemSelected)
		end
	end, { p0.onActivated })
	local var11 = if fFlagSideSheetFocusNav then reactModule.useRef(nil) else nil
	local var12 = if fFlagChromeActivatedMappedSignal then useMappedSignal(p0.isActivated) else false
	
	return reactModule.createElement(view, {
		tag = "col align-x-center gap-xsmall size-1400 auto-y",
		LayoutOrder = p0.layoutOrder
	}, {
		IconCircle = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = {
				["size-1400 radius-circle"] = true,
				["bg-shift-100"] = not var12,
				["bg-shift-400"] = var12
			},
			selection = if fFlagSideSheetFocusNav then { Selectable = false } else nil
		}, {
			IconHost = reactModule.createElement(iconHostModule, {
				centerPosition = true,
				icon = p0.icon,
				notification = p0.notification
			}),
			ActivationOverlay = reactModule.createElement(view, {
				tag = "size-full radius-circle",
				ZIndex = 10,
				onActivated = var10,
				selection = if fFlagSideSheetFocusNav and p0.disableGamepadDirections then {
					Selectable = true,
					NextSelectionRight = if p0.disableGamepadDirections and p0.disableGamepadDirections.right then var11 else nil
				} else nil,
				ref = if fFlagSideSheetFocusNav then if fFlagSideSheetFocusNav then reactModule.useCallback(function(p1) --[[ line: 51 ]]
					-- upvalues: var11 (ref), p0 (ref)
					if var11 then
						var11.current = p1
					end
					if p1 and p0.firstIntegrationToFocusCallback then
						p0.firstIntegrationToFocusCallback(p1)
					end
				end, { p0.firstIntegrationToFocusCallback }) else nil else nil
			})
		}),
		Label = reactModule.createElement(text, {
			tag = "size-full-700 text-label-small text-wrap text-align-x-center text-align-y-top text-truncate-end content-default",
			LayoutOrder = 2,
			Text = p0.label
		})
	})
end)