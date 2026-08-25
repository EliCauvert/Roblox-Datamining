local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local divider = foundationModule.Divider
local icon = foundationModule.Icon
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local radioGroup = foundationModule.RadioGroup
local text = foundationModule.Text
local view = foundationModule.View
local withDefaults = foundationModule.Utility.withDefaults
local useListModule = require(script.Parent.Parent.useList)
local fFlagAbuseReportMenuV2 = require(parent.SharedFlags).FFlagAbuseReportMenuV2
local reportListRadioSelectable = game:DefineFastFlag("ReportListRadioSelectable", false)
local t = { hasDivider = false }

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: withDefaults (ref), t (ref), useListModule (ref), reactModule (ref), view (ref), text (ref), radioGroup (ref), reportListRadioSelectable (ref), inputSize (ref), fFlagAbuseReportMenuV2 (ref), icon (ref), iconName (ref), divider (ref)
	local var5 = withDefaults(p0, t)
	local var6 = useListModule()
	local var7 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), var5 (ref)
		var6.onValueChanged(var5.value)
	end, { var6, var5.value })
	
	return reactModule.createElement(view, { tag = "size-full-0 auto-y col", ref = p1 }, {
		ListItem = reactModule.createElement(view, {
			tag = "size-full-0 auto-y padding-medium",
			onActivated = var7
		}, {
			ListItemContent = reactModule.createElement(view, {
				tag = {
					["size-full-0 auto-y row gap-medium align-x-center align-y-center flex-between"] = true,
					["padding-x-large"] = var5.hasMargin
				}
			}, {
				TextBlock = reactModule.createElement(view, {
					tag = "size-full-0 auto-xy col gap-small shrink",
					LayoutOrder = 0
				}, {
					TitleBlock = reactModule.createElement(view, { tag = "auto-xy col gap-xsmall", LayoutOrder = 0 }, {
						Title = reactModule.createElement(text, {
							RichText = true,
							tag = "auto-xy text-align-x-left text-title-medium text-wrap content-emphasis",
							LayoutOrder = 0,
							Text = var5.title
						}),
						Metadata = var5.metadata and reactModule.createElement(text, {
							RichText = true,
							tag = "auto-xy text-align-x-left text-body-small text-wrap",
							LayoutOrder = 1,
							Text = var5.metadata
						})
					}),
					Description = var5.description and reactModule.createElement(text, {
						RichText = true,
						tag = "auto-xy text-align-x-left text-body-small text-wrap",
						LayoutOrder = 1,
						Text = var5.description
					})
				}),
				AccessoryBlock = reactModule.createElement(view, {
					tag = "size-600-0 auto-y align-y-center col",
					LayoutOrder = 1
				}, {
					Radio = var5.trailingAccessory == "Radio" and reactModule.createElement(radioGroup.Root, {
						onValueChanged = var7,
						value = var6.value,
						Selectable = if reportListRadioSelectable then false else true
					}, {
						reactModule.createElement(radioGroup.Item, {
							label = "",
							value = var5.value,
							size = inputSize.Small,
							ref = reactModule.useRef(nil)
						})
					}),
					Chevron = if fFlagAbuseReportMenuV2 then var5.trailingAccessory == "Chevron" and reactModule.createElement(icon, { name = iconName.ChevronLargeRight }) else nil
				})
			})
		}),
		Divider = var5.hasDivider and reactModule.createElement(divider, { LayoutOrder = 2 }) or nil
	})
end))