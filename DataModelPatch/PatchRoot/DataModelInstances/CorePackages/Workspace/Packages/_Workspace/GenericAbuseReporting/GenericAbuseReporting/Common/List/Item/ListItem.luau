local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Divider = FoundationModule.Divider
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local RadioGroup = FoundationModule.RadioGroup
local Text = FoundationModule.Text
local View = FoundationModule.View
local WithDefaultsFunction = FoundationModule.Utility.withDefaults
local UseListModule = require(script.Parent.Parent.useList)
local FFlagAbuseReportMenuV2 = require(Parent.SharedFlags).FFlagAbuseReportMenuV2
local ReportListRadioSelectable = game:DefineFastFlag("ReportListRadioSelectable", false)
local config = { hasDivider = false }

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsFunction (copy), config (copy), UseListModule (copy), ReactModule (copy), View (copy), Text (copy), RadioGroup (copy), ReportListRadioSelectable (copy), InputSize (copy), FFlagAbuseReportMenuV2 (copy), Icon (copy), IconName (copy), Divider (copy)
	local WithDefaultsResult = WithDefaultsFunction(p1, config)
	local UseListModuleResult = UseListModule()
	local Value = UseListModuleResult.value
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseListModuleResult (copy), WithDefaultsResult (copy)
		UseListModuleResult.onValueChanged(WithDefaultsResult.value)
	end, { UseListModuleResult, WithDefaultsResult.value })
	
	return ReactModule.createElement(View, { tag = "size-full-0 auto-y col", ref = Ref }, {
		ListItem = ReactModule.createElement(View, {
			tag = "size-full-0 auto-y padding-medium",
			onActivated = UseResult
		}, {
			ListItemContent = ReactModule.createElement(View, {
				tag = {
					["size-full-0 auto-y row gap-medium align-x-center align-y-center flex-between"] = true,
					["padding-x-large"] = WithDefaultsResult.hasMargin
				}
			}, {
				TextBlock = ReactModule.createElement(View, {
					tag = "size-full-0 auto-xy col gap-small shrink",
					LayoutOrder = 0
				}, {
					TitleBlock = ReactModule.createElement(View, { tag = "auto-xy col gap-xsmall", LayoutOrder = 0 }, {
						Title = ReactModule.createElement(Text, {
							RichText = true,
							tag = "auto-xy text-align-x-left text-title-medium text-wrap content-emphasis",
							LayoutOrder = 0,
							Text = WithDefaultsResult.title
						}),
						Metadata = WithDefaultsResult.metadata and ReactModule.createElement(Text, {
							RichText = true,
							tag = "auto-xy text-align-x-left text-body-small text-wrap",
							LayoutOrder = 1,
							Text = WithDefaultsResult.metadata
						})
					}),
					Description = WithDefaultsResult.description and ReactModule.createElement(Text, {
						RichText = true,
						tag = "auto-xy text-align-x-left text-body-small text-wrap",
						LayoutOrder = 1,
						Text = WithDefaultsResult.description
					})
				}),
				AccessoryBlock = ReactModule.createElement(View, {
					tag = "size-600-0 auto-y align-y-center col",
					LayoutOrder = 1
				}, {
					Radio = WithDefaultsResult.trailingAccessory == "Radio" and ReactModule.createElement(RadioGroup.Root, {
						onValueChanged = UseResult,
						value = Value,
						Selectable = not ReportListRadioSelectable
					}, {
						ReactModule.createElement(RadioGroup.Item, {
							label = "",
							value = WithDefaultsResult.value,
							size = InputSize.Small,
							ref = UseRefResult
						})
					}),
					Chevron = if FFlagAbuseReportMenuV2 then WithDefaultsResult.trailingAccessory == "Chevron" and ReactModule.createElement(Icon, { name = IconName.ChevronLargeRight }) else nil
				})
			})
		}),
		Divider = WithDefaultsResult.hasDivider and ReactModule.createElement(Divider, { LayoutOrder = 2 }) or nil
	})
end))