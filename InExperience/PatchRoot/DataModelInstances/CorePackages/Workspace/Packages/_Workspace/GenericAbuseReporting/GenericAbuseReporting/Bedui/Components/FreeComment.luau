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

return reactModule.memo(function(p0)
	-- upvalues: useTokens (ref), reactModule (ref), useFormDataModule (ref), view (ref), text (ref), commentTextFieldModule (ref), componentSubtextModule (ref)
	local var6 = useTokens()
	local var7, var8 = reactModule.useState("")
	local updateForm = useFormDataModule().updateForm
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y col gap-small",
		LayoutOrder = p0.layoutOrder
	}, {
		Prompt = reactModule.createElement(text, {
			tag = "auto-xy",
			LayoutOrder = 0,
			Text = p0.component.freeComment.prompt
		}),
		FreeCommentContainer = reactModule.createElement(view, {
			tag = "size-full-0 auto-y col align-x-left stroke-thick stroke-default radius-medium",
			LayoutOrder = 1
		}, {
			FreeComment = reactModule.createElement(commentTextFieldModule, {
				layoutOrder = 1,
				text = var7,
				placeholderText = p0.component.freeComment.placeholder,
				backgroundColor3 = var6.Color.Shift.Shift_100.Color3,
				backgroundTransparency = var6.Color.Shift.Shift_100.Transparency,
				onUpdate = reactModule.useCallback(function(p1)
					-- upvalues: var8 (ref), updateForm (ref), p0 (ref)
					var8(p1)
					updateForm(p0.component.formDataKey, p1)
				end, { updateForm, p0.component.formDataKey })
			})
		}),
		ComponentSubtext = reactModule.createElement(componentSubtextModule, {
			layoutOrder = 2,
			isErrorState = p0.isErrorState,
			isOptional = p0.component.isOptional,
			requirementMessage = p0.component.requirementMessage
		})
	})
end)