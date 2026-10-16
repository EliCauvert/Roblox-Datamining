local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Text = FoundationModule.Text
local View = FoundationModule.View
local _ = require(GenericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local ComponentSubtextModule = require(GenericAbuseReporting.Bedui.Components.ComponentSubtext)
local DropdownWithPopoverModule = require(GenericAbuseReporting.Common.DropdownWithPopover)
local UseFormDataModule = require(GenericAbuseReporting.Bedui.Provider.useFormData)

return ReactModule.memo(function(p1) --[[ Line: 24 | Named "Dropdown" ]]
	-- upvalues: UseFormDataModule (copy), ReactModule (copy), CryoModule (copy), View (copy), Text (copy), DropdownWithPopoverModule (copy), ComponentSubtextModule (copy)
	local UpdateFormFunction = UseFormDataModule().updateForm
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y col gap-small",
		LayoutOrder = p1.layoutOrder
	}, {
		Prompt = ReactModule.createElement(Text, {
			tag = "auto-xy",
			LayoutOrder = 0,
			Text = p1.component.dropdown.prompt
		}),
		DropdownMenuContainer = ReactModule.createElement(View, {
			tag = "size-full-0 auto-y col gap-small",
			LayoutOrder = 1,
			ZIndex = 3
		}, {
			DropdownWithPopover = ReactModule.createElement(DropdownWithPopoverModule, {
				layoutOrder = 1,
				placeholder = p1.component.dropdown.placeholder,
				onChange = ReactModule.useCallback(function(p2) --[[ Line: 36 ]]
					-- upvalues: UpdateFormFunction (copy), p1 (copy)
					UpdateFormFunction(p1.component.formDataKey, p2)
				end, { p1.component.formDataKey }),
				cellDatas = ReactModule.useMemo(function() --[[ Line: 27 ]]
					-- upvalues: CryoModule (upval), p1 (copy)
					return CryoModule.List.map(p1.component.dropdown.items, function(p2) --[[ Line: 28 ]]
						return { text = p2.label or "", value = p2.formDataValue }
					end)
				end, { p1.component.dropdown.items }),
				errorState = p1.isErrorState
			}),
			ComponentSubtext = ReactModule.createElement(ComponentSubtextModule, {
				layoutOrder = 2,
				isErrorState = p1.isErrorState,
				isOptional = p1.component.isOptional,
				requirementMessage = p1.component.requirementMessage
			})
		})
	})
end)