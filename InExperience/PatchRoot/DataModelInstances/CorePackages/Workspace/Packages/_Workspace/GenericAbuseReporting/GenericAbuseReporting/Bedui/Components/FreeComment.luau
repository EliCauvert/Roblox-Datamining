local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local _ = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local componentSubtextModule = require(genericAbuseReporting.Bedui.Components.ComponentSubtext)
local commentTextFieldModule = require(genericAbuseReporting.Common.CommentTextField)
local useFormDataModule = require(genericAbuseReporting.Bedui.Provider.useFormData)

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), useFormDataModule (ref), view (ref), text (ref), commentTextFieldModule (ref), componentSubtextModule (ref)
	local var1 = useTokens()
	local var2, var3 = reactModule.useState("")
	local updateForm = useFormDataModule().updateForm
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y col gap-small",
		LayoutOrder = p1.layoutOrder
	}, {
		Prompt = reactModule.createElement(text, {
			tag = "auto-xy",
			LayoutOrder = 0,
			Text = p1.component.freeComment.prompt
		}),
		FreeCommentContainer = reactModule.createElement(view, {
			tag = "size-full-0 auto-y col align-x-left stroke-thick stroke-default radius-medium",
			LayoutOrder = 1
		}, {
			FreeComment = reactModule.createElement(commentTextFieldModule, {
				layoutOrder = 1,
				text = var2,
				placeholderText = p1.component.freeComment.placeholder,
				backgroundColor3 = var1.Color.Shift.Shift_100.Color3,
				backgroundTransparency = var1.Color.Shift.Shift_100.Transparency,
				onUpdate = reactModule.useCallback(function(p2)
					-- upvalues: var3 (ref), updateForm (ref), p1 (ref)
					var3(p2)
					updateForm(p1.component.formDataKey, p2)
				end, { updateForm, p1.component.formDataKey })
			})
		}),
		ComponentSubtext = reactModule.createElement(componentSubtextModule, {
			layoutOrder = 2,
			isErrorState = p1.isErrorState,
			isOptional = p1.component.isOptional,
			requirementMessage = p1.component.requirementMessage
		})
	})
end)