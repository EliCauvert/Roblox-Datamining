local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local _ = require(GenericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local ComponentSubtextModule = require(GenericAbuseReporting.Bedui.Components.ComponentSubtext)
local CommentTextFieldModule = require(GenericAbuseReporting.Common.CommentTextField)
local UseFormDataModule = require(GenericAbuseReporting.Bedui.Provider.useFormData)

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), UseFormDataModule (copy), View (copy), Text (copy), CommentTextFieldModule (copy), ComponentSubtextModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UpdateFormFunction = UseFormDataModule().updateForm
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y col gap-small",
		LayoutOrder = p1.layoutOrder
	}, {
		Prompt = ReactModule.createElement(Text, {
			tag = "auto-xy",
			LayoutOrder = 0,
			Text = p1.component.freeComment.prompt
		}),
		FreeCommentContainer = ReactModule.createElement(View, {
			tag = "size-full-0 auto-y col align-x-left stroke-thick stroke-default radius-medium",
			LayoutOrder = 1
		}, {
			FreeComment = ReactModule.createElement(CommentTextFieldModule, {
				layoutOrder = 1,
				text = UseStateResult,
				placeholderText = p1.component.freeComment.placeholder,
				backgroundColor3 = UseTokensResult.Color.Shift.Shift_100.Color3,
				backgroundTransparency = UseTokensResult.Color.Shift.Shift_100.Transparency,
				onUpdate = ReactModule.useCallback(function(p2)
					-- upvalues: UseStateResult2 (copy), UpdateFormFunction (copy), p1 (copy)
					UseStateResult2(p2)
					UpdateFormFunction(p1.component.formDataKey, p2)
				end, { UpdateFormFunction, p1.component.formDataKey })
			})
		}),
		ComponentSubtext = ReactModule.createElement(ComponentSubtextModule, {
			layoutOrder = 2,
			isErrorState = p1.isErrorState,
			isOptional = p1.component.isOptional,
			requirementMessage = p1.component.requirementMessage
		})
	})
end)