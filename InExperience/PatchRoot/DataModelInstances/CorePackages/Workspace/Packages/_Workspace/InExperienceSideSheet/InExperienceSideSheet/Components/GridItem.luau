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
local keepSideSheetOpenFromGrid = game:DefineFastFlag("KeepSideSheetOpenFromGrid", false)
local fFlagSideSheetFocusNav = sharedFlagsModule.FFlagSideSheetFocusNav

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), keepSideSheetOpenFromGrid (ref), toggleSideSheetModule (ref), sidesheetAnalyticsModule (ref), analyticsConstantsModule (ref), fFlagSideSheetFocusNav (ref), useMappedSignal (ref), view (ref), iconHostModule (ref), text (ref)
	local var1 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), keepSideSheetOpenFromGrid (copy), toggleSideSheetModule (copy), sidesheetAnalyticsModule (copy), analyticsConstantsModule (copy)
		p1.onActivated()
		
		if not keepSideSheetOpenFromGrid then
			toggleSideSheetModule(false)
			sidesheetAnalyticsModule.logSidesheetClosed(analyticsConstantsModule.Source.ItemSelected)
		end
	end, { p1.onActivated })
	local var2 = if fFlagSideSheetFocusNav then reactModule.useRef(nil) else nil
	local var3 = useMappedSignal(p1.isActivated)
	
	return reactModule.createElement(view, {
		tag = "col align-x-center gap-xsmall size-1400 auto-y",
		LayoutOrder = p1.layoutOrder
	}, {
		IconCircle = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = {
				["size-1400 radius-circle"] = true,
				["bg-shift-100"] = not var3,
				["bg-shift-400"] = var3
			},
			selection = if fFlagSideSheetFocusNav then { Selectable = false } else nil
		}, {
			IconHost = reactModule.createElement(iconHostModule, {
				centerPosition = true,
				icon = p1.icon,
				notification = p1.notification
			}),
			ActivationOverlay = reactModule.createElement(view, {
				tag = "size-full radius-circle",
				ZIndex = 10,
				onActivated = var1,
				selection = if fFlagSideSheetFocusNav and p1.disableGamepadDirections then {
					Selectable = true,
					NextSelectionRight = if p1.disableGamepadDirections and p1.disableGamepadDirections.right then var2 else nil
				} else nil,
				ref = if fFlagSideSheetFocusNav then if fFlagSideSheetFocusNav then reactModule.useCallback(function(p2)
					-- upvalues: var2 (ref), p1 (ref)
					if var2 then
						var2.current = p2
					end
					if p2 and p1.firstIntegrationToFocusCallback then
						p1.firstIntegrationToFocusCallback(p2)
					end
				end, { p1.firstIntegrationToFocusCallback }) else nil else nil
			})
		}),
		Label = reactModule.createElement(text, {
			tag = "size-full-700 text-label-small text-wrap text-align-x-center text-align-y-top text-truncate-end content-default",
			LayoutOrder = 2,
			Text = p1.label
		})
	})
end)