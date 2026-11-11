local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconHostModule = require(script.Parent.IconHost)
local AnalyticsConstantsModule = require(InExperienceSideSheet.Analytics.AnalyticsConstants)
local SidesheetAnalyticsModule = require(InExperienceSideSheet.Analytics.SidesheetAnalytics)
local ToggleSideSheetModule = require(InExperienceSideSheet.Utils.toggleSideSheet)
local UseMappedSignalFunction = require(Parent.Chrome).Hooks.useMappedSignal
local FFlagChromeActivatedMappedSignal = SharedFlagsModule.FFlagChromeActivatedMappedSignal
local KeepSideSheetOpenFromGrid = game:DefineFastFlag("KeepSideSheetOpenFromGrid", false)
local FFlagSideSheetFocusNav = SharedFlagsModule.FFlagSideSheetFocusNav

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), KeepSideSheetOpenFromGrid (copy), ToggleSideSheetModule (copy), SidesheetAnalyticsModule (copy), AnalyticsConstantsModule (copy), FFlagSideSheetFocusNav (copy), FFlagChromeActivatedMappedSignal (copy), UseMappedSignalFunction (copy), View (copy), IconHostModule (copy), Text (copy)
	local UseRefResult = if FFlagSideSheetFocusNav then ReactModule.useRef(nil) else nil
	local UseMappedSignalResult = if FFlagChromeActivatedMappedSignal then UseMappedSignalFunction(p1.isActivated) else false
	local UseResult = if FFlagSideSheetFocusNav then ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), p1 (copy)
		if UseRefResult then
			UseRefResult.current = Current
		end
		if Current and p1.firstIntegrationToFocusCallback then
			p1.firstIntegrationToFocusCallback(Current)
		end
	end, { p1.firstIntegrationToFocusCallback }) else nil
	
	return ReactModule.createElement(View, {
		tag = "col align-x-center gap-xsmall size-1400 auto-y",
		LayoutOrder = p1.layoutOrder
	}, {
		IconCircle = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = {
				["size-1400 radius-circle"] = true,
				["bg-shift-100"] = not UseMappedSignalResult,
				["bg-shift-400"] = UseMappedSignalResult
			},
			selection = if FFlagSideSheetFocusNav then { Selectable = false } else nil
		}, {
			IconHost = ReactModule.createElement(IconHostModule, {
				centerPosition = true,
				icon = p1.icon,
				notification = p1.notification
			}),
			ActivationOverlay = ReactModule.createElement(View, {
				tag = "size-full radius-circle",
				ZIndex = 10,
				onActivated = ReactModule.useCallback(function()
					-- upvalues: p1 (copy), KeepSideSheetOpenFromGrid (upval), ToggleSideSheetModule (upval), SidesheetAnalyticsModule (upval), AnalyticsConstantsModule (upval)
					p1.onActivated()
					
					if not KeepSideSheetOpenFromGrid then
						ToggleSideSheetModule(false)
						SidesheetAnalyticsModule.logSidesheetClosed(AnalyticsConstantsModule.Source.ItemSelected)
					end
				end, { p1.onActivated }),
				selection = if FFlagSideSheetFocusNav and p1.disableGamepadDirections then {
					Selectable = true,
					NextSelectionRight = if p1.disableGamepadDirections and p1.disableGamepadDirections.right then UseRefResult else nil
				} else nil,
				ref = if FFlagSideSheetFocusNav then UseResult else nil
			})
		}),
		Label = ReactModule.createElement(Text, {
			tag = "size-full-700 text-label-small text-wrap text-align-x-center text-align-y-top text-truncate-end content-default",
			LayoutOrder = 2,
			Text = p1.label
		})
	})
end)