local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local text = foundationModule.Text
local view = foundationModule.View
local _ = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local componentSubtextModule = require(genericAbuseReporting.Bedui.Components.ComponentSubtext)
local dropdownWithPopoverModule = require(genericAbuseReporting.Common.DropdownWithPopover)
local useFormDataModule = require(genericAbuseReporting.Bedui.Provider.useFormData)

return reactModule.memo(function(p0)
	-- upvalues: useFormDataModule (ref), reactModule (ref), cryoModule (ref), view (ref), text (ref), dropdownWithPopoverModule (ref), componentSubtextModule (ref)
	local updateForm = useFormDataModule().updateForm
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y col gap-small",
		LayoutOrder = p0.layoutOrder
	}, {
		Prompt = reactModule.createElement(text, {
			tag = "auto-xy",
			LayoutOrder = 0,
			Text = p0.component.dropdown.prompt
		}),
		DropdownMenuContainer = reactModule.createElement(view, {
			tag = "size-full-0 auto-y col gap-small",
			LayoutOrder = 1,
			ZIndex = 3
		}, {
			DropdownWithPopover = reactModule.createElement(dropdownWithPopoverModule, {
				layoutOrder = 1,
				placeholder = p0.component.dropdown.placeholder,
				onChange = reactModule.useCallback(function(p1)
					-- upvalues: updateForm (ref), p0 (ref)
					updateForm(p0.component.formDataKey, p1)
				end, { p0.component.formDataKey }),
				cellDatas = reactModule.useMemo(function()
					-- upvalues: cryoModule (copy), p0 (ref)
					return cryoModule.List.map(p0.component.dropdown.items, function(p2)
						return { text = p2.label or "", value = p2.formDataValue }
					end)
				end, { p0.component.dropdown.items }),
				errorState = p0.isErrorState
			}),
			ComponentSubtext = reactModule.createElement(componentSubtextModule, {
				layoutOrder = 2,
				isErrorState = p0.isErrorState,
				isOptional = p0.component.isOptional,
				requirementMessage = p0.component.requirementMessage
			})
		})
	})
end)